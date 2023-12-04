-- 겜 방 생성(유저들, 맵아이디)
DELIMITER //
CREATE PROCEDURE 새게임생성(
    IN p_user_ids VARCHAR(255), -- '1,2,3'
    IN p_map_id INT
)
BEGIN
    DECLARE time_diff DATETIME; -- 나중 시간 저장
    DECLARE user_id INT; -- 유저 하나씩 잘라서 저장용
    
    SET time_diff = DATE_ADD(NOW(), INTERVAL 10 MINUTE); -- 게임이 10분 후 끝난다고 가정

    INSERT INTO gamedb_team.game (map_id, start_time, end_time) -- 겜 정보 넣기
    VALUES (p_map_id, now(),time_diff);

    SET @game_id = LAST_INSERT_ID(); -- 위에서 넣은 게임 id 가져오기

    -- 게임에 해당되는 유저들 하나씩 잘라서 넣기
    WHILE LENGTH(p_user_ids) > 0 DO
        SET user_id = SUBSTRING_INDEX(p_user_ids, ',', 1);
        
        INSERT INTO gamedb_team.playtime (user_id, game_id, spend_time) -- 유저 하나 정보 넣기
        VALUES (user_id, @game_id, time_diff);

        SET p_user_ids = SUBSTRING(p_user_ids, LENGTH(user_id) + 2); -- 해당 유저 잘라내기
    END WHILE;
END //
DELIMITER  ;
call 새게임생성('1,2,3',1);

-- 게임종료 후 데이터 저장 및 업데이트(유저아이디, 경험치, 루찌, 승무패)
DELIMITER //
CREATE PROCEDURE 게임종료및데이터수정(
    IN p_user_id INT,
    IN p_get_exp INT,
    IN p_get_lucci INT,
    IN p_win_lose_draw ENUM('승','무','패')
)
BEGIN
    -- 최근 게임 아이디 찾아서 넣기
	SELECT max(id) INTO @game_id
    from game
    order by start_time desc;
    
    UPDATE gamedb_team.game -- 게임테이블 해당유저의 끝난 시간 지금으로 업뎃
    SET end_time = NOW()
    WHERE id = @game_id;

    -- 유저 게임 결과 스코어테이블에 넣기
    INSERT INTO gamedb_team.score (game_id, user_id, get_exp, get_lucci, win_lose_draw)
    VALUES (@game_id, p_user_id, p_get_exp, p_get_lucci, p_win_lose_draw);

    -- 유저 테이블에 승무패 수정
    IF p_win_lose_draw = '승' THEN
        UPDATE gamedb_team.user
        SET win = win + 1,
            exp = exp + p_get_exp,
            lucci = lucci + p_get_lucci
        WHERE id = p_user_id;
    ELSEIF p_win_lose_draw = '패' THEN
        UPDATE gamedb_team.user
        SET lose = lose + 1
        WHERE id = p_user_id;
    ELSE
        UPDATE gamedb_team.user
        SET draw = draw + 1,
            exp = exp + p_get_exp,
            lucci = lucci + p_get_lucci
        WHERE id = p_user_id;
    END IF;

    -- 소요시간 업데이트
    UPDATE gamedb_team.playtime
    SET spend_time = TIMEDIFF(NOW(), (SELECT MIN(start_time) FROM gamedb_team.game WHERE id = @game_id))
    WHERE game_id = @game_id AND user_id = p_user_id;
END //
DELIMITER ;

call 게임종료및데이터수정(1, 10, 500, '패');
call 게임종료및데이터수정(2, 5, 250, '패');
call 게임종료및데이터수정(3, 5, 250, '승');