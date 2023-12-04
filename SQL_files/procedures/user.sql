-- 닉네임,비밀번호로 회원가입
DELIMITER //
CREATE PROCEDURE 회원추가(
    IN p_nickname VARCHAR(20),
    IN p_password VARCHAR(20),
    IN p_lucci INT(11)
)
BEGIN
    DECLARE user_exists INT;

    -- 유저중복체크
    SELECT EXISTS (
        SELECT 1
        FROM gamedb_team.user
        WHERE nickname = p_nickname
    ) INTO user_exists;

    -- 이미 존재하면 롤백 후 에러
    IF user_exists = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: 중복닉';

    ELSE
        -- 중복이 아니면 추가
        INSERT INTO gamedb_team.user (nickname, password,lucci)
        VALUES (p_nickname, p_password,p_lucci);

        -- 추가 후 전체 조회
        SELECT u.nickname,u.level,c.name,cc.name,u.lucci,u.cash,u.top,u.bottom,u.status,u.win,u.lose,u.draw,u.last_access_time,u.total_play_time
        FROM gamedb_team.user u
			join gamedb_team.character c on c.id=u.character_id
			join gamedb_team.character_color cc on cc.id=u.character_color_id
        WHERE nickname = p_nickname;
    END IF;
END //
DELIMITER ;
call gamedb_team.회원추가('닉네임', '비번', 5000); -- 유저닉 중복가입안됨

-- 특정 유저 id로 마지막 접속시간 업데이트
UPDATE `gamedb_team`.`user` SET last_access_time = NOW() WHERE (`id` = '17');

-- 현재 기준 30일 이상 접속 안하면 휴면으로
DELIMITER //
CREATE PROCEDURE 유저비활성()
BEGIN
     -- 30일 기준
    DECLARE inactive_threshold DATETIME;
    SET inactive_threshold = NOW() - INTERVAL 30 DAY;

    -- 휴면으로 업뎃 후 휴먼 리스트 출력
    UPDATE user
    SET status = '휴면'
    WHERE status = '활성' AND last_access_time < inactive_threshold;
    select nickname,status from user where status='휴면';
END //
DELIMITER ;
call gamedb_team.유저비활성();

-- 루찌로 아이템 구매
DELIMITER //
CREATE PROCEDURE 루찌아이템구매(
    IN p_user_id INT,
    IN p_item_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE total_price INT;

    SELECT lucci_price * p_quantity INTO total_price
    FROM gamedb_team.item
    WHERE id = p_item_id;

    -- 돈 체크
    IF total_price <= (SELECT lucci FROM gamedb_team.user WHERE id = p_user_id) THEN
        -- 사용자 총 구매비용 계산
        UPDATE gamedb_team.user
        SET lucci = lucci - total_price
        WHERE id = p_user_id;

        -- 아이템 산만큼 업뎃 후 구매정보 보여주기
        INSERT INTO gamedb_team.purchased_item (user_id, item_id, quantity, buy_datetime)
        VALUES (p_user_id, p_item_id, p_quantity, CURRENT_TIMESTAMP);

        SELECT u.nickname as 유저명,i.name as 아이템명,pi.quantity as 수량,u.lucci as 남은루찌,u.cash as 남은캐시,pi.buy_datetime as 구매시간 from user u
			join purchased_item pi on u.id=pi.user_id
            join item i on pi.item_id=i.id
		order by pi.buy_datetime desc
        limit 1;

    ELSE
        -- 돈 부족하면 에러
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: 잔액부족';
    END IF;
END //
DELIMITER ;
call gamedb_team.루찌아이템구매(35, 1, 5); --35번 아이디 유저가 바늘 5개 루찌구매

-- 캐시로 아이템 구매
DELIMITER //
CREATE PROCEDURE 캐시아이템구매(
    IN p_user_id INT,
    IN p_item_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE total_price INT;

    SELECT lucci_price * p_quantity INTO total_price
    FROM gamedb_team.item
    WHERE id = p_item_id;

    -- 돈 체크
    IF total_price <= (SELECT lucci FROM gamedb_team.user WHERE id = p_user_id) THEN
        -- 사용자 총 구매비용 계산
        UPDATE gamedb_team.user
        SET cash = cash - total_price
        WHERE id = p_user_id;

        -- 아이템 산만큼 업뎃 후 구매정보 보여주기
        INSERT INTO gamedb_team.purchased_item (user_id, item_id, quantity, buy_datetime)
        VALUES (p_user_id, p_item_id, p_quantity, CURRENT_TIMESTAMP);

        SELECT u.nickname as 유저명,i.name as 아이템명,pi.quantity as 수량,u.lucci as 남은루찌,u.cash as 남은캐시,pi.buy_datetime as 구매시간 from user u
			join purchased_item pi on u.id=pi.user_id
            join item i on pi.item_id=i.id
		order by pi.buy_datetime desc
        limit 1;

    ELSE
        -- 돈 부족하면 에러
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: 잔액부족';
    END IF;
END //
DELIMITER ;
call gamedb_team.캐시아이템구매(36, 1, 1); --36번유저 바늘 1개 캐시구매

-- 본인이 산 아이템 조회(인벤토리너낌)
DELIMITER //
CREATE PROCEDURE 아이템확인(
    IN p_user_id INT
)
BEGIN
    SELECT
        pi.buy_datetime as 구매일자,
        i.name as 아이템명,
        i.category as 카테고리,
        pi.quantity as 수량,
        i.cash_price as 캐시가격,
        pi.quantity * i.cash_price AS 총액
    FROM
        gamedb_team.purchased_item pi
    JOIN
        gamedb_team.item i ON pi.item_id = i.id
    WHERE
        pi.user_id = p_user_id;

END //
DELIMITER ;
call gamedb_team.구매아이템확인(35); --35번 구매아이템 확인 (인벤토리오픈)

-- 캐시충전
DELIMITER //
CREATE PROCEDURE 캐시충전(
    IN p_user_id INT,
    IN p_amount INT,
    IN p_pay_type enum('카드','현금')
)
BEGIN
    DECLARE current_datetime DATETIME;
    
    SET current_datetime = NOW();

    UPDATE gamedb_team.user
    SET cash = cash + p_amount
    WHERE id = p_user_id;

    INSERT INTO gamedb_team.cash_purchase_history (user_id, buy_datetime, price, pay_type)
    VALUES (p_user_id, current_datetime, p_amount, p_pay_type);
    
    select u.nickname as 닉네임, u.cash as 남은캐시, cph.buy_datetime as 결제일자, cph.pay_type as 결제수단 from user u
	join cash_purchase_history cph on cph.buy_datetime=current_datetime
    where u.id=p_user_id;
END //
DELIMITER ;
call gamedb_team.캐시충전(36, 10000, '카드'); --36번유저가 10000원 카드로 캐시충전

-- 선택 유저 승률
DELIMITER //
CREATE PROCEDURE 유저승률조회(IN p_user_id INT)
BEGIN
    SELECT
        id,
        nickname,
        win AS 승,
        draw AS 무,
        lose AS 패,
        CASE
            WHEN (win + lose + draw) > 0 THEN ROUND((win / (win + lose + draw)) * 100, 1)
            ELSE 0
        END AS 종합승률
    FROM
        gamedb_team.user
    WHERE
        id = p_user_id;
END //
DELIMITER ;
call gamedb_team.유저승률조회(1);

-- 승률에 연승까지
WITH WinStreaks AS (
    SELECT
        user_id,
        MAX(win_streak) AS max_win_streak
    FROM (
        SELECT
            user_id,
            COUNT(*) AS win_streak
        FROM (
            SELECT
                user_id, game_id, win_lose_draw, 
                ROW_NUMBER() OVER (ORDER BY game_id) - ROW_NUMBER() OVER (PARTITION BY user_id, win_lose_draw ORDER BY game_id)
                AS grp
            FROM
                gamedb_team.score
            WHERE
                win_lose_draw = '승'
        ) AS streaks
        GROUP BY
            user_id, grp
    ) AS streak_groups
    GROUP BY
        user_id
)

SELECT
    u.id,
    u.nickname,
    u.win as 승,
    u.draw as 무,
    u.lose as 패,
    CASE
        WHEN (u.win + u.lose + u.draw) > 0 
        THEN ROUND((u.win / (u.win + u.lose + u.draw)) * 100, 1) -- No게임은 예외
        ELSE 0
    END AS 종합승률,
    COALESCE(ws.max_win_streak, 0) AS 최대연승
FROM
    gamedb_team.user u
LEFT JOIN
    WinStreaks ws ON u.id = ws.user_id;
