-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.1.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- gamedb_team 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `gamedb_team` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `gamedb_team`;

-- 테이블 gamedb_team.background_music 구조 내보내기
CREATE TABLE IF NOT EXISTS `background_music` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.background_music:~6 rows (대략적) 내보내기
INSERT IGNORE INTO `background_music` (`id`, `name`, `path`) VALUES
	(1, 'Octopus BGM', '8ABE0426C5A15560CB2EB6C0A4FBA29F3006BAE0F8C794AD7ED762CAB2DD34B1'),
	(2, 'Penguin BGM', 'F60E76676997ED8074EE305F92CCCE34BD86321373874D97EF613C75EF5629C5'),
	(3, 'Seal BGM', 'BC7D06D8561BBE9719F8E5F2B77E8DEEE13E6F120D6393A3DED69A3AD2DA2FC4'),
	(4, 'CAMP BGM', 'C41EDC38D3761FA38FC9C8661056CD9C6538A325A88CEB3891EC8E5D5A007590'),
	(5, 'Pangland BGM', '7155C0B3307DFD98241CE90484BF47E0FCCEB550590F0D4EF482C7E7F618EB1E'),
	(6, 'KFC BGM', '689AE299EB27CF59A28C2EF7135FA4ECA83D0958E89AABEF607F2E3AFFE39D31');

-- 테이블 gamedb_team.cash_purchase_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `cash_purchase_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `buy_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `price` smallint(5) unsigned NOT NULL,
  `pay_type` enum('카드','현금') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_user` (`user_id`),
  CONSTRAINT `cash_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.cash_purchase_history:~1 rows (대략적) 내보내기
INSERT IGNORE INTO `cash_purchase_history` (`id`, `user_id`, `buy_datetime`, `price`, `pay_type`) VALUES
	(1, 2, '2023-12-04 11:30:35', 5000, '카드');

-- 테이블 gamedb_team.character 구조 내보내기
CREATE TABLE IF NOT EXISTS `character` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `power` int(11) unsigned NOT NULL,
  `speed` int(11) unsigned NOT NULL,
  `count` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.character:~10 rows (대략적) 내보내기
INSERT IGNORE INTO `character` (`id`, `name`, `power`, `speed`, `count`) VALUES
	(1, '다오', 1, 5, 1),
	(2, '디지니', 1, 4, 2),
	(3, '모스', 1, 5, 1),
	(4, '마리드', 1, 4, 2),
	(5, '에띠', 1, 4, 1),
	(6, '배찌', 1, 5, 1),
	(7, '우니', 2, 5, 1),
	(8, '케피', 2, 4, 1),
	(9, '로두마니', 3, 6, 3),
	(10, '산타', 2, 5, 2);

-- 테이블 gamedb_team.character_color 구조 내보내기
CREATE TABLE IF NOT EXISTS `character_color` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(10) NOT NULL DEFAULT 'RED',
  `Color_code` varchar(10) NOT NULL DEFAULT 'FF0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.character_color:~8 rows (대략적) 내보내기
INSERT IGNORE INTO `character_color` (`id`, `name`, `Color_code`) VALUES
	(1, '빨강', '#FF0000'),
	(2, '노랑', '#FFFF00'),
	(3, '주황', '#FFA500'),
	(4, '초록', '#008000'),
	(5, '하늘', '#87CEEB'),
	(6, '파랑', '#0000FF'),
	(7, '보라', '#800080'),
	(8, '분홍', '#FFC0CB');

-- 테이블 gamedb_team.chat_room 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.chat_room:~1 rows (대략적) 내보내기
INSERT IGNORE INTO `chat_room` (`id`, `user`) VALUES
	(1, 3),
	(2, 3);

-- 테이블 gamedb_team.chat_room_message 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_room_message` (
  `chatroom_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(11) unsigned NOT NULL,
  `message` varchar(50) NOT NULL DEFAULT '',
  `send_time` datetime NOT NULL DEFAULT current_timestamp(),
  `check_user_count` int(11) unsigned NOT NULL DEFAULT 1,
  KEY `chatroommessage_user` (`user_id`),
  KEY `FK_chat_room_message_chat_room` (`chatroom_id`),
  CONSTRAINT `FK_chat_room_message_chat_room` FOREIGN KEY (`chatroom_id`) REFERENCES `chat_room` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chatroommessage_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.chat_room_message:~0 rows (대략적) 내보내기
INSERT IGNORE INTO `chat_room_message` (`chatroom_id`, `user_id`, `message`, `send_time`, `check_user_count`) VALUES
	(1, 1, '안녕하세요', '2023-12-04 11:51:44', 1),
	(1, 1, '좋은 아침', '2023-12-04 11:51:51', 1),
	(1, 1, '즐겜', '2023-12-04 11:51:57', 1);

-- 테이블 gamedb_team.chat_room_user_information 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_room_user_information` (
  `chat_room_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL,
  KEY `user_id_idx` (`user_id`),
  KEY `chat_room_idx` (`chat_room_id`),
  CONSTRAINT `FK_chat_room_user_information_chat_room` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_room` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.chat_room_user_information:~4 rows (대략적) 내보내기
INSERT IGNORE INTO `chat_room_user_information` (`chat_room_id`, `user_id`) VALUES
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1);

-- 테이블 gamedb_team.colored_character 구조 내보내기
CREATE TABLE IF NOT EXISTS `colored_character` (
  `character_id` tinyint(3) unsigned DEFAULT NULL,
  `character_color_id` tinyint(3) unsigned DEFAULT NULL,
  KEY `FK_colored_character_character_color` (`character_color_id`),
  KEY `FK_colored_character_characters` (`character_id`),
  CONSTRAINT `FK_colored_character_character_color` FOREIGN KEY (`character_color_id`) REFERENCES `character_color` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_colored_character_characters` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.colored_character:~3 rows (대략적) 내보내기
INSERT IGNORE INTO `colored_character` (`character_id`, `character_color_id`) VALUES
	(1, 6),
	(7, 4),
	(6, 1);

-- 프로시저 gamedb_team.CreateChatMessage 구조 내보내기
DELIMITER //
CREATE PROCEDURE `CreateChatMessage`(
	 IN newChatRoomId INT,
    IN newUserId INT,
    IN messageText VARCHAR(255)
)
BEGIN
    
    INSERT INTO gamedb_team.chat_room_user_information (chat_room_id, user_id) VALUES (newChatRoomId, newUserId);
    INSERT INTO gamedb_team.chat_room_message (chatroom_id, user_id, message) VALUES (newChatRoomId, newUserId, messageText);
    
END//
DELIMITER ;

-- 프로시저 gamedb_team.CreateChatRoom 구조 내보내기
DELIMITER //
CREATE PROCEDURE `CreateChatRoom`(
    IN newUsers INT
)
BEGIN
    
    INSERT INTO gamedb_team.chat_room (`user`) VALUES (newUsers);
    
END//
DELIMITER ;

-- 테이블 gamedb_team.game 구조 내보내기
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` smallint(5) unsigned NOT NULL,
  `chatroom_id` int(11) unsigned NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_map` (`map_id`),
  KEY `FK_game_chat_room` (`chatroom_id`),
  CONSTRAINT `FK_game_chat_room` FOREIGN KEY (`chatroom_id`) REFERENCES `chat_room` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `game_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.game:~2 rows (대략적) 내보내기
INSERT IGNORE INTO `game` (`id`, `map_id`, `chatroom_id`, `start_time`, `end_time`) VALUES
	(1, 1, 1, '2023-12-04 11:46:52', '2023-12-04 11:56:52'),
	(2, 1, 2, '2023-12-04 11:47:47', '2023-12-04 11:55:55');

-- 테이블 gamedb_team.item 구조 내보내기
CREATE TABLE IF NOT EXISTS `item` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` enum('공격','방어','상의','하의') DEFAULT NULL,
  `cash_price` int(10) unsigned NOT NULL DEFAULT 0,
  `lucci_price` int(10) unsigned NOT NULL DEFAULT 0,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.item:~5 rows (대략적) 내보내기
INSERT IGNORE INTO `item` (`id`, `name`, `category`, `cash_price`, `lucci_price`, `end_date`) VALUES
	(1, '바늘', '방어', 50, 500, '2023-12-31 13:15:01'),
	(2, '실드', '방어', 100, 1000, '2023-12-31 13:15:01'),
	(3, '통조림', '공격', 200, 2000, '2023-12-31 13:15:01'),
	(4, '스패너', '공격', 200, 2000, '2023-12-31 13:15:01'),
	(5, '우니하의', '하의', 5000, 50000, '2023-12-31 13:15:01');

-- 테이블 gamedb_team.map 구조 내보내기
CREATE TABLE IF NOT EXISTS `map` (
  `id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL,
  `bgm_id` smallint(6) unsigned NOT NULL,
  `difficulty` enum('상','중','하') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `map_backgroundmusic` (`bgm_id`),
  CONSTRAINT `map_backgroundmusic` FOREIGN KEY (`bgm_id`) REFERENCES `background_music` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.map:~9 rows (대략적) 내보내기
INSERT IGNORE INTO `map` (`id`, `name`, `bgm_id`, `difficulty`) VALUES
	(1, '문어대습격', 1, '하'),
	(2, '황제의 귀환', 1, '하'),
	(3, '물개의 분노', 1, '상'),
	(4, '로봇 대공습', 2, '중'),
	(5, '거북 대격돌', 3, '중'),
	(6, '골렘 대침공', 4, '중'),
	(7, '크아시티', 5, '중'),
	(8, '불의제왕 & 샌드킹', 3, '중'),
	(9, '설원의 지배자', 6, '상');

-- 테이블 gamedb_team.map_access_authority 구조 내보내기
CREATE TABLE IF NOT EXISTS `map_access_authority` (
  `user_id` int(10) unsigned NOT NULL,
  `map_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `gane_id` int(11) unsigned NOT NULL,
  KEY `FK_map_access_authority_user` (`user_id`),
  KEY `FK_map_access_authority_map` (`map_id`),
  KEY `FK_map_access_authority_game` (`gane_id`),
  CONSTRAINT `FK_map_access_authority_game` FOREIGN KEY (`gane_id`) REFERENCES `game` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_map_access_authority_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_map_access_authority_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.map_access_authority:~0 rows (대략적) 내보내기

-- 테이블 gamedb_team.map_hierarchy 구조 내보내기
CREATE TABLE IF NOT EXISTS `map_hierarchy` (
  `ref_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `target_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `relation` enum('상위','동등') NOT NULL,
  KEY `FK_map_hierarchy_map` (`ref_id`),
  KEY `FK_map_hierarchy_map_2` (`target_id`),
  CONSTRAINT `FK_map_hierarchy_map` FOREIGN KEY (`ref_id`) REFERENCES `map` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_map_hierarchy_map_2` FOREIGN KEY (`target_id`) REFERENCES `map` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.map_hierarchy:~10 rows (대략적) 내보내기
INSERT IGNORE INTO `map_hierarchy` (`ref_id`, `target_id`, `relation`) VALUES
	(3, 2, '동등'),
	(3, 1, '상위'),
	(4, 1, '상위'),
	(5, 1, '상위'),
	(7, 6, '동등'),
	(7, 3, '상위'),
	(7, 4, '상위'),
	(8, 7, '상위'),
	(8, 5, '상위'),
	(9, 8, '상위');

-- 테이블 gamedb_team.map_item 구조 내보내기
CREATE TABLE IF NOT EXISTS `map_item` (
  `map_id` smallint(5) unsigned NOT NULL,
  `item_id` smallint(5) unsigned NOT NULL,
  KEY `mapitem_map` (`map_id`),
  KEY `mapitem_item` (`item_id`),
  CONSTRAINT `mapitem_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `mapitem_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.map_item:~5 rows (대략적) 내보내기
INSERT IGNORE INTO `map_item` (`map_id`, `item_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 1);

-- 테이블 gamedb_team.map_monster 구조 내보내기
CREATE TABLE IF NOT EXISTS `map_monster` (
  `map_id` smallint(5) unsigned NOT NULL,
  `monster_id` smallint(5) unsigned NOT NULL,
  KEY `mapmonter_monster` (`monster_id`),
  KEY `mapmonter_map` (`map_id`),
  CONSTRAINT `mapmonter_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `mapmonter_monster` FOREIGN KEY (`monster_id`) REFERENCES `monster` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.map_monster:~18 rows (대략적) 내보내기
INSERT IGNORE INTO `map_monster` (`map_id`, `monster_id`) VALUES
	(1, 1),
	(1, 8),
	(2, 2),
	(2, 8),
	(3, 3),
	(3, 8),
	(4, 4),
	(4, 8),
	(5, 5),
	(5, 8),
	(6, 6),
	(6, 8),
	(7, 1),
	(7, 8),
	(8, 7),
	(8, 8),
	(9, 2),
	(9, 8);

-- 테이블 gamedb_team.monster 구조 내보내기
CREATE TABLE IF NOT EXISTS `monster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.monster:~8 rows (대략적) 내보내기
INSERT IGNORE INTO `monster` (`id`, `name`) VALUES
	(1, '대장문어'),
	(2, '황제펭귄'),
	(3, '물개'),
	(4, '로봇'),
	(5, '거북'),
	(6, '골렘'),
	(7, '샌드킹'),
	(8, '부하');

-- 테이블 gamedb_team.playtime 구조 내보내기
CREATE TABLE IF NOT EXISTS `playtime` (
  `user_id` int(10) unsigned NOT NULL,
  `game_id` int(10) unsigned NOT NULL,
  `spend_time` datetime NOT NULL,
  KEY `playtime_game` (`game_id`),
  KEY `playtime_user` (`user_id`),
  CONSTRAINT `playtime_game` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `playtime_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.playtime:~6 rows (대략적) 내보내기
INSERT IGNORE INTO `playtime` (`user_id`, `game_id`, `spend_time`) VALUES
	(1, 1, '2023-12-04 11:56:52'),
	(2, 1, '2023-12-04 11:56:52'),
	(3, 1, '2023-12-04 11:56:52'),
	(1, 2, '2023-12-04 00:08:08'),
	(2, 2, '2023-12-04 00:08:08'),
	(3, 2, '2023-12-04 00:08:08');

-- 테이블 gamedb_team.purchased_item 구조 내보내기
CREATE TABLE IF NOT EXISTS `purchased_item` (
  `user_id` int(10) unsigned NOT NULL,
  `item_id` smallint(5) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  `buy_datetime` datetime NOT NULL,
  KEY `FK_purchased_item_item` (`item_id`),
  KEY `FK_purchased_item_user` (`user_id`),
  CONSTRAINT `FK_purchased_item_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchased_item_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.purchased_item:~2 rows (대략적) 내보내기
INSERT IGNORE INTO `purchased_item` (`user_id`, `item_id`, `quantity`, `buy_datetime`) VALUES
	(1, 1, 9, '2023-12-04 11:23:26'),
	(2, 5, 1, '2023-12-04 11:36:19');

-- 테이블 gamedb_team.score 구조 내보내기
CREATE TABLE IF NOT EXISTS `score` (
  `game_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `get_exp` smallint(6) NOT NULL DEFAULT 0,
  `get_lucci` smallint(6) NOT NULL DEFAULT 0,
  `win_lose_draw` enum('승','무','패') NOT NULL,
  KEY `socre_game` (`game_id`),
  KEY `socre_user` (`user_id`),
  CONSTRAINT `socre_game` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `socre_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.score:~3 rows (대략적) 내보내기
INSERT IGNORE INTO `score` (`game_id`, `user_id`, `get_exp`, `get_lucci`, `win_lose_draw`) VALUES
	(1, 1, 100, 500, '승'),
	(1, 2, 0, 0, '패'),
	(1, 3, 0, 0, '패');

-- 테이블 gamedb_team.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `character_id` tinyint(3) unsigned NOT NULL DEFAULT (case floor(1 + rand() * 3) when 1 then 1 when 2 then 6 when 3 then 7 end),
  `character_color_id` tinyint(3) unsigned DEFAULT (case `character_id` when 1 then 1 when 6 then 4 when 7 then 6 end),
  `nickname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `lucci` int(11) unsigned NOT NULL DEFAULT 5000,
  `cash` int(11) unsigned NOT NULL DEFAULT 0,
  `top` smallint(6) unsigned NOT NULL DEFAULT 0,
  `bottom` smallint(6) unsigned NOT NULL DEFAULT 0,
  `level` smallint(6) unsigned NOT NULL DEFAULT 1,
  `status` enum('활성','휴면','탈퇴') NOT NULL DEFAULT '활성',
  `exp` mediumint(9) unsigned NOT NULL DEFAULT 0,
  `last_access_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `win` int(11) unsigned NOT NULL DEFAULT 0,
  `lose` int(11) unsigned NOT NULL DEFAULT 0,
  `draw` int(11) unsigned NOT NULL DEFAULT 0,
  `total_play_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname` (`nickname`),
  KEY `FK_user_colored_character` (`character_id`),
  KEY `FK_user_colored_character_2` (`character_color_id`),
  CONSTRAINT `FK_user_colored_character` FOREIGN KEY (`character_id`) REFERENCES `colored_character` (`character_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_user_colored_character_2` FOREIGN KEY (`character_color_id`) REFERENCES `colored_character` (`character_color_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.user:~3 rows (대략적) 내보내기
INSERT IGNORE INTO `user` (`id`, `character_id`, `character_color_id`, `nickname`, `password`, `lucci`, `cash`, `top`, `bottom`, `level`, `status`, `exp`, `last_access_time`, `win`, `lose`, `draw`, `total_play_time`) VALUES
	(1, 6, 4, '3조팀장세종', '12345', 1000, 0, 0, 0, 1, '활성', 100, '2023-12-04 11:55:55', 1, 0, 0, '2023-12-04 11:20:56'),
	(2, 1, 1, '플레이데이터', '123456', 5000, 0, 0, 0, 1, '활성', 0, '2023-12-04 11:55:55', 0, 1, 0, '2023-12-04 11:27:28'),
	(3, 7, 6, '도훈', '12345', 5000, 0, 0, 0, 1, '활성', 0, '2023-12-04 11:55:55', 0, 1, 0, '2023-12-04 11:39:53');

-- 프로시저 gamedb_team.게임종료및데이터수정 구조 내보내기
DELIMITER //
CREATE PROCEDURE `게임종료및데이터수정`(
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
    
    UPDATE gamedb_team.game -- 게임테이블 끝나는 시간 지금으로 업뎃
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
END//
DELIMITER ;

-- 프로시저 gamedb_team.구매아이템확인 구조 내보내기
DELIMITER //
CREATE PROCEDURE `구매아이템확인`(
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
        pi.user_id = p_user_id
	order by pi.buy_datetime desc;
    
END//
DELIMITER ;

-- 프로시저 gamedb_team.루찌아이템구매 구조 내보내기
DELIMITER //
CREATE PROCEDURE `루찌아이템구매`(
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
END//
DELIMITER ;

-- 프로시저 gamedb_team.새게임생성 구조 내보내기
DELIMITER //
CREATE PROCEDURE `새게임생성`(
    IN p_user_ids VARCHAR(255), -- '1,2,3'
    IN p_map_id INT,
    IN p_chatroom_id INT
)
BEGIN
    DECLARE time_diff DATETIME; -- 나중 시간 저장
    DECLARE user_id INT; -- 유저 하나씩 잘라서 저장용
    
    SET time_diff = DATE_ADD(NOW(), INTERVAL 10 MINUTE); -- 게임이 10분 후 끝난다고 가정

    INSERT INTO gamedb_team.game (map_id,chatroom_id, start_time, end_time) -- 겜 정보 넣기
    VALUES (p_map_id,p_chatroom_id, now(),time_diff);

    SET @game_id = LAST_INSERT_ID(); -- 위에서 넣은 게임 id 가져오기

    -- 게임에 해당되는 유저들 하나씩 잘라서 넣기
    WHILE LENGTH(p_user_ids) > 0 DO
        SET user_id = SUBSTRING_INDEX(p_user_ids, ',', 1);
        
        INSERT INTO gamedb_team.playtime (user_id, game_id, spend_time) -- 유저 하나 정보 넣기
        VALUES (user_id, @game_id, time_diff);

        SET p_user_ids = SUBSTRING(p_user_ids, LENGTH(user_id) + 2); -- 해당 유저 잘라내기
    END WHILE;
END//
DELIMITER ;

-- 프로시저 gamedb_team.유저비활성 구조 내보내기
DELIMITER //
CREATE PROCEDURE `유저비활성`()
BEGIN
     -- 30일 기준
    DECLARE inactive_threshold DATETIME;
    SET inactive_threshold = NOW() - INTERVAL 30 DAY;

    -- 휴면으로 업뎃 후 휴먼 리스트 출력
    UPDATE user
    SET status = '휴면'
    WHERE status = '활성' AND last_access_time < inactive_threshold;
    select nickname,status from user where status='휴면';
END//
DELIMITER ;

-- 프로시저 gamedb_team.유저승률조회 구조 내보내기
DELIMITER //
CREATE PROCEDURE `유저승률조회`(IN p_user_id INT)
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
END//
DELIMITER ;

-- 프로시저 gamedb_team.캐시아이템구매 구조 내보내기
DELIMITER //
CREATE PROCEDURE `캐시아이템구매`(
    IN p_user_id INT,
    IN p_item_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE total_price INT;

    SELECT cash_price * p_quantity INTO total_price
    FROM gamedb_team.item
    WHERE id = p_item_id;

    -- 돈 체크
    IF total_price <= (SELECT cash FROM gamedb_team.user WHERE id = p_user_id) THEN
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
END//
DELIMITER ;

-- 프로시저 gamedb_team.캐시충전 구조 내보내기
DELIMITER //
CREATE PROCEDURE `캐시충전`(
    IN p_user_id INT,
    IN p_amount INT,
    IN p_pay_type enum('카드','현금')
)
BEGIN
    DECLARE current_datetime DATETIME;
    
    -- Get the current datetime
    SET current_datetime = NOW();

    -- Update user's cash balance
    UPDATE gamedb_team.user
    SET cash = cash + p_amount
    WHERE id = p_user_id;

    -- Insert a record into cash_purchase_history
    INSERT INTO gamedb_team.cash_purchase_history (user_id, buy_datetime, price, pay_type)
    VALUES (p_user_id, current_datetime, p_amount, p_pay_type);
    
    select u.nickname as 닉네임, u.cash as 남은캐시, cph.buy_datetime as 결제일자, cph.pay_type as 결제수단 from user u
	join cash_purchase_history cph on cph.buy_datetime=current_datetime
    where u.id=p_user_id;
END//
DELIMITER ;

-- 프로시저 gamedb_team.회원추가 구조 내보내기
DELIMITER //
CREATE PROCEDURE `회원추가`(
    IN p_nickname VARCHAR(20),
    IN p_password VARCHAR(20)
    
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
        INSERT INTO gamedb_team.user (nickname, password)
        VALUES (p_nickname, p_password);

        -- 추가 후 전체 조회
        SELECT u.nickname,u.level,c.name,cc.name,u.lucci,u.cash,u.top,u.bottom,u.status,u.win,u.lose,u.draw,u.last_access_time,u.total_play_time
        FROM gamedb_team.user u
			join gamedb_team.character c on c.id=u.character_id
			join gamedb_team.character_color cc on cc.id=u.character_color_id
        WHERE nickname = p_nickname;
    END IF;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
