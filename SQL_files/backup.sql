-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.2.2-MariaDB - mariadb.org binary distribution
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.background_music:~6 rows (대략적) 내보내기
INSERT INTO `background_music` (`id`, `name`, `path`) VALUES
	(1, 'Octopus BGM', '8ABE0426C5A15560CB2EB6C0A4FBA29F3006BAE0F8C794AD7ED762CAB2DD34B1'),
	(2, 'Penguin BGM', 'F60E76676997ED8074EE305F92CCCE34BD86321373874D97EF613C75EF5629C5'),
	(3, 'Seal BGM', 'BC7D06D8561BBE9719F8E5F2B77E8DEEE13E6F120D6393A3DED69A3AD2DA2FC4'),
	(4, 'CAMP BGM', 'C41EDC38D3761FA38FC9C8661056CD9C6538A325A88CEB3891EC8E5D5A007590'),
	(5, 'Pangland BGM', '7155C0B3307DFD98241CE90484BF47E0FCCEB550590F0D4EF482C7E7F618EB1E'),
	(6, 'KFC BGM', '689AE299EB27CF59A28C2EF7135FA4ECA83D0958E89AABEF607F2E3AFFE39D31');

-- 테이블 gamedb_team.cash_purchase_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `cash_purchase_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `buy_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `price` smallint(5) unsigned NOT NULL,
  `pay_type` enum('카드','현금') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_user` (`user_id`),
  CONSTRAINT `cash_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.cash_purchase_history:~29 rows (대략적) 내보내기
INSERT INTO `cash_purchase_history` (`id`, `user_id`, `buy_datetime`, `price`, `pay_type`) VALUES
	(1, 36, '2023-12-03 04:04:57', 10000, '현금'),
	(2, 36, '2023-12-03 04:08:39', 5000, '카드'),
	(3, 36, '2023-12-03 04:11:24', 10000, '카드'),
	(4, 36, '2023-12-03 04:11:29', 10000, '카드'),
	(5, 36, '2023-12-03 04:11:31', 10000, '카드'),
	(6, 36, '2023-12-03 04:11:31', 10000, '카드'),
	(7, 36, '2023-12-03 04:11:33', 10000, '카드'),
	(8, 36, '2023-12-03 04:11:33', 10000, '카드'),
	(9, 36, '2023-12-03 04:11:34', 10000, '카드'),
	(10, 36, '2023-12-03 04:11:34', 10000, '카드'),
	(11, 36, '2023-12-03 04:11:37', 10000, '카드'),
	(12, 36, '2023-12-03 04:11:39', 10000, '카드'),
	(13, 36, '2023-12-03 04:11:42', 10000, '카드'),
	(14, 36, '2023-12-03 04:11:44', 10000, '카드'),
	(15, 36, '2023-12-03 04:11:44', 10000, '카드'),
	(16, 36, '2023-12-03 04:11:44', 10000, '카드'),
	(17, 36, '2023-12-03 04:11:49', 0, '카드'),
	(18, 36, '2023-12-03 04:11:50', 0, '카드'),
	(19, 36, '2023-12-03 04:11:51', 0, '카드'),
	(20, 36, '2023-12-03 04:11:53', 10000, '카드'),
	(21, 36, '2023-12-03 04:11:54', 10000, '카드'),
	(22, 36, '2023-12-03 04:11:54', 10000, '카드'),
	(23, 36, '2023-12-03 04:11:54', 10000, '카드'),
	(24, 36, '2023-12-03 04:11:55', 10000, '카드'),
	(25, 36, '2023-12-03 04:11:55', 10000, '카드'),
	(26, 36, '2023-12-03 04:11:58', 10000, '카드'),
	(27, 36, '2023-12-03 04:12:00', 10000, '카드'),
	(28, 36, '2023-12-03 04:12:02', 10000, '카드'),
	(29, 3, '2023-12-03 20:05:50', 50000, '카드');

-- 테이블 gamedb_team.character 구조 내보내기
CREATE TABLE IF NOT EXISTS `character` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `power` int(11) unsigned NOT NULL,
  `speed` int(11) unsigned NOT NULL,
  `count` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.character:~10 rows (대략적) 내보내기
INSERT INTO `character` (`id`, `name`, `power`, `speed`, `count`) VALUES
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
INSERT INTO `character_color` (`id`, `name`, `Color_code`) VALUES
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
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.chat_room:~0 rows (대략적) 내보내기

-- 테이블 gamedb_team.chat_room_message 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_room_message` (
  `chatroom_id` smallint(5) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `message` varchar(50) NOT NULL DEFAULT '',
  `send_time` datetime NOT NULL,
  `check_user_count` int(11) unsigned NOT NULL,
  KEY `chatroommessage_chatRoom` (`chatroom_id`),
  KEY `chatroommessage_user` (`user_id`),
  CONSTRAINT `chatroommessage_chatRoom` FOREIGN KEY (`chatroom_id`) REFERENCES `chat_room` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chatroommessage_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.chat_room_message:~0 rows (대략적) 내보내기

-- 테이블 gamedb_team.chat_room_user_information 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_room_user_information` (
  `chat_room_id` smallint(5) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  KEY `user_id_idx` (`user_id`),
  KEY `chat_room_idx` (`chat_room_id`),
  CONSTRAINT `chat_room` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_room` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.chat_room_user_information:~0 rows (대략적) 내보내기

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
INSERT INTO `colored_character` (`character_id`, `character_color_id`) VALUES
	(1, 6),
	(7, 4),
	(6, 1);

-- 테이블 gamedb_team.game 구조 내보내기
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` smallint(5) unsigned NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_map` (`map_id`),
  CONSTRAINT `game_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.game:~31 rows (대략적) 내보내기
INSERT INTO `game` (`id`, `map_id`, `start_time`, `end_time`) VALUES
	(6, 1, '2023-12-03 16:04:28', '2023-12-03 18:50:25'),
	(7, 1, '2023-12-03 16:40:46', '2023-12-03 16:55:35'),
	(8, 2, '2023-12-03 17:03:56', '2023-12-03 17:15:55'),
	(9, 3, '2023-12-03 18:05:32', '2023-12-03 18:15:42'),
	(10, 4, '2023-12-03 18:06:08', '2023-12-03 18:16:36'),
	(11, 4, '2023-12-03 18:08:02', '2023-12-03 18:18:06'),
	(12, 4, '2023-12-03 18:08:21', '2023-12-03 18:51:14'),
	(13, 4, '2023-12-03 18:20:44', '2023-12-03 18:30:44'),
	(14, 4, '2023-12-03 19:36:58', '2023-12-03 19:47:52'),
	(15, 4, '2023-12-03 19:43:45', '2023-12-03 19:54:07'),
	(16, 1, '2023-12-03 19:48:17', '2023-12-03 19:53:34'),
	(17, 7, '2023-12-03 19:55:13', '2023-12-03 19:55:55'),
	(18, 4, '2023-12-03 19:56:14', '2023-12-03 19:56:16'),
	(19, 5, '2023-12-03 19:56:46', '2023-12-03 19:56:48'),
	(20, 9, '2023-12-03 20:04:17', '2023-12-03 20:04:37'),
	(21, 9, '2023-12-03 20:05:09', '2023-12-03 20:05:11'),
	(22, 2, '2023-12-03 20:27:24', '2023-12-03 20:27:27'),
	(23, 3, '2023-12-03 20:28:16', '2023-12-03 20:28:18'),
	(24, 3, '2023-12-03 20:28:33', '2023-12-03 20:28:35'),
	(25, 3, '2023-12-03 20:33:07', '2023-12-03 20:33:30'),
	(26, 3, '2023-12-03 20:40:33', '2023-12-03 20:41:04'),
	(27, 1, '2023-12-03 20:43:17', '2023-12-03 20:43:20'),
	(28, 1, '2023-12-03 20:43:35', '2023-12-03 20:43:40'),
	(29, 1, '2023-12-03 20:44:10', '2023-12-03 20:44:15'),
	(30, 1, '2023-12-03 20:44:18', '2023-12-03 20:44:18'),
	(31, 1, '2023-12-03 20:44:18', '2023-12-03 20:44:19'),
	(32, 1, '2023-12-03 20:44:20', '2023-12-03 20:44:20'),
	(33, 1, '2023-12-03 20:44:24', '2023-12-03 20:44:24'),
	(34, 1, '2023-12-03 20:44:26', '2023-12-03 20:44:26'),
	(35, 1, '2023-12-03 20:44:29', '2023-12-03 20:44:29'),
	(36, 1, '2023-12-03 20:44:33', '2023-12-03 20:44:33');

-- 테이블 gamedb_team.item 구조 내보내기
CREATE TABLE IF NOT EXISTS `item` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` enum('공격','방어','상의','하의') DEFAULT NULL,
  `cash_price` int(10) unsigned NOT NULL DEFAULT 0,
  `lucci_price` int(10) unsigned NOT NULL DEFAULT 0,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.item:~12 rows (대략적) 내보내기
INSERT INTO `item` (`id`, `name`, `category`, `cash_price`, `lucci_price`, `end_date`) VALUES
	(1, '바늘', '방어', 50, 500, '2023-12-01 15:33:57'),
	(2, '실드', '방어', 100, 1000, '2023-12-31 15:33:57'),
	(3, '통조림', '공격', 200, 2000, '2023-12-31 15:33:57'),
	(4, '스패너', '공격', 200, 2000, '2023-12-31 15:33:57'),
	(5, '배찌상의', '상의', 8000, 80000, '2023-12-31 15:33:57'),
	(6, '배찌하의', '하의', 7000, 70000, '2023-12-31 15:33:57'),
	(7, '우니상의', '상의', 5000, 50000, '2023-12-31 15:33:57'),
	(8, '우니하의', '하의', 5000, 50000, '2023-12-31 15:33:57'),
	(9, '물약', '방어', 50, 500, '2023-12-31 00:00:00'),
	(10, '스패너', '방어', 100, 1000, '2023-12-31 00:00:00'),
	(11, '투시경', '공격', 150, 1500, '2023-12-31 00:00:00'),
	(12, '투명 물풍선', '공격', 300, 3000, '2023-12-31 00:00:00');

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
INSERT INTO `map` (`id`, `name`, `bgm_id`, `difficulty`) VALUES
	(1, '문어대습격', 1, '하'),
	(2, '황제의 귀환', 1, '하'),
	(3, '물개의 분노', 1, '하'),
	(4, '로봇 대공습', 2, '하'),
	(5, '거북 대격돌', 3, '하'),
	(6, '골렘 대침공', 4, '중'),
	(7, '크아시티', 5, '중'),
	(8, '불의제왕 & 샌드킹', 3, '중'),
	(9, '설원의 지배자', 6, '상');

-- 테이블 gamedb_team.map_access_authority 구조 내보내기
CREATE TABLE IF NOT EXISTS `map_access_authority` (
  `user_id` int(10) unsigned NOT NULL,
  `map_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  KEY `FK_map_access_authority_user` (`user_id`),
  KEY `FK_map_access_authority_map` (`map_id`),
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
INSERT INTO `map_hierarchy` (`ref_id`, `target_id`, `relation`) VALUES
	(2, 3, '동등'),
	(3, 1, '상위'),
	(4, 1, '상위'),
	(5, 1, '상위'),
	(6, 7, '동등'),
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

-- 테이블 데이터 gamedb_team.map_item:~0 rows (대략적) 내보내기

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
INSERT INTO `map_monster` (`map_id`, `monster_id`) VALUES
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.monster:~8 rows (대략적) 내보내기
INSERT INTO `monster` (`id`, `name`) VALUES
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

-- 테이블 데이터 gamedb_team.playtime:~92 rows (대략적) 내보내기
INSERT INTO `playtime` (`user_id`, `game_id`, `spend_time`) VALUES
	(1, 6, '2023-12-03 02:45:57'),
	(2, 6, '2023-12-03 00:20:02'),
	(3, 6, '2023-12-03 00:51:07'),
	(1, 7, '2023-12-03 00:14:49'),
	(2, 7, '2023-12-03 00:14:49'),
	(1, 8, '2023-12-03 00:11:59'),
	(2, 8, '2023-12-03 00:11:59'),
	(3, 8, '2023-12-03 00:11:59'),
	(1, 9, '2023-12-03 00:10:10'),
	(2, 9, '2023-12-03 00:10:10'),
	(3, 9, '2023-12-03 00:10:10'),
	(1, 10, '2023-12-03 00:10:28'),
	(2, 10, '2023-12-03 00:10:28'),
	(3, 10, '2023-12-03 00:10:28'),
	(1, 11, '2023-12-03 00:10:04'),
	(2, 11, '2023-12-03 18:18:02'),
	(3, 11, '2023-12-03 18:18:02'),
	(1, 12, '2023-12-03 00:10:20'),
	(2, 12, '2023-12-03 00:42:43'),
	(3, 12, '2023-12-03 00:42:53'),
	(1, 13, '2023-12-03 00:10:00'),
	(2, 13, '2023-12-03 00:10:00'),
	(3, 13, '2023-12-03 00:10:00'),
	(1, 14, '2023-12-03 00:10:54'),
	(2, 14, '2023-12-03 00:10:54'),
	(3, 14, '2023-12-03 00:10:54'),
	(1, 15, '2023-12-03 00:10:11'),
	(2, 15, '2023-12-03 00:10:19'),
	(3, 15, '2023-12-03 00:10:22'),
	(1, 16, '2023-12-03 00:04:57'),
	(2, 16, '2023-12-03 00:05:13'),
	(3, 16, '2023-12-03 00:05:17'),
	(1, 17, '2023-12-03 00:00:25'),
	(2, 17, '2023-12-03 00:00:37'),
	(3, 17, '2023-12-03 00:00:42'),
	(1, 18, '2023-12-03 00:00:01'),
	(2, 18, '2023-12-03 00:00:02'),
	(3, 18, '2023-12-03 00:00:02'),
	(1, 19, '2023-12-03 00:00:01'),
	(2, 19, '2023-12-03 00:00:02'),
	(3, 19, '2023-12-03 00:00:02'),
	(1, 20, '2023-12-03 00:00:18'),
	(2, 20, '2023-12-03 00:00:19'),
	(3, 20, '2023-12-03 00:00:20'),
	(1, 21, '2023-12-03 00:00:01'),
	(2, 21, '2023-12-03 00:00:02'),
	(3, 21, '2023-12-03 00:00:02'),
	(1, 22, '2023-12-03 00:00:01'),
	(2, 22, '2023-12-03 00:00:02'),
	(3, 22, '2023-12-03 00:00:03'),
	(1, 23, '2023-12-03 00:00:01'),
	(2, 23, '2023-12-03 00:00:02'),
	(3, 23, '2023-12-03 00:00:02'),
	(1, 24, '2023-12-03 00:00:01'),
	(2, 24, '2023-12-03 00:00:02'),
	(3, 24, '2023-12-03 00:00:02'),
	(1, 25, '2023-12-03 00:00:20'),
	(2, 25, '2023-12-03 00:00:23'),
	(3, 25, '2023-12-03 00:00:22'),
	(1, 26, '2000-00-31 00:00:00'),
	(2, 26, '2000-00-31 00:00:00'),
	(3, 26, '2000-00-31 00:00:00'),
	(1, 27, '2023-12-03 00:00:01'),
	(2, 27, '2023-12-03 00:00:02'),
	(3, 27, '2023-12-03 00:00:03'),
	(1, 28, '2023-12-03 00:00:05'),
	(2, 28, '2023-12-03 00:00:05'),
	(3, 28, '2023-12-03 00:00:05'),
	(1, 29, '2023-12-03 00:00:05'),
	(2, 29, '2023-12-03 00:00:05'),
	(3, 29, '2023-12-03 00:00:05'),
	(1, 30, '2023-12-03 00:00:00'),
	(2, 30, '2023-12-03 00:00:00'),
	(3, 30, '2023-12-03 00:00:00'),
	(1, 31, '2023-12-03 00:00:00'),
	(2, 31, '2023-12-03 00:00:01'),
	(3, 31, '2023-12-03 00:00:01'),
	(1, 32, '2023-12-03 00:00:00'),
	(2, 32, '2023-12-03 00:00:00'),
	(3, 32, '2023-12-03 00:00:00'),
	(1, 33, '2023-12-03 00:00:00'),
	(2, 33, '2023-12-03 00:00:00'),
	(3, 33, '2023-12-03 00:00:00'),
	(1, 34, '2023-12-03 00:00:00'),
	(2, 34, '2023-12-03 00:00:00'),
	(3, 34, '2023-12-03 00:00:00'),
	(1, 35, '2023-12-03 00:00:00'),
	(2, 35, '2023-12-03 00:00:00'),
	(3, 35, '2023-12-03 00:00:00'),
	(1, 36, '2023-12-03 00:00:00'),
	(2, 36, '2023-12-03 00:00:00'),
	(3, 36, '2023-12-03 00:00:00');

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

-- 테이블 데이터 gamedb_team.purchased_item:~26 rows (대략적) 내보내기
INSERT INTO `purchased_item` (`user_id`, `item_id`, `quantity`, `buy_datetime`) VALUES
	(1, 1, 1, '2023-12-03 03:18:29'),
	(1, 1, 5, '2023-12-03 03:24:45'),
	(1, 2, 20, '2023-12-03 03:29:51'),
	(1, 1, 5, '2023-12-03 03:34:57'),
	(1, 1, 5, '2023-12-03 03:34:58'),
	(1, 1, 5, '2023-12-03 03:34:59'),
	(1, 1, 5, '2023-12-03 03:35:00'),
	(1, 1, 5, '2023-12-03 03:35:00'),
	(1, 1, 5, '2023-12-03 03:35:01'),
	(1, 1, 5, '2023-12-03 03:35:01'),
	(1, 1, 5, '2023-12-03 03:35:01'),
	(1, 1, 5, '2023-12-03 03:35:02'),
	(1, 1, 5, '2023-12-03 03:35:02'),
	(1, 2, 2, '2023-12-03 03:35:22'),
	(36, 1, 5, '2023-12-03 03:44:27'),
	(36, 3, 1, '2023-12-03 03:47:21'),
	(36, 3, 1, '2023-12-03 03:48:08'),
	(36, 3, 1, '2023-12-03 03:49:48'),
	(36, 3, 1, '2023-12-03 03:49:49'),
	(36, 1, 1, '2023-12-03 03:54:31'),
	(36, 1, 1, '2023-12-03 03:56:44'),
	(36, 1, 1, '2023-12-03 03:56:45'),
	(36, 1, 1, '2023-12-03 03:56:46'),
	(36, 1, 1, '2023-12-03 03:56:46'),
	(36, 1, 1, '2023-12-03 03:56:50'),
	(36, 1, 1, '2023-12-03 03:56:51');

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

-- 테이블 데이터 gamedb_team.score:~98 rows (대략적) 내보내기
INSERT INTO `score` (`game_id`, `user_id`, `get_exp`, `get_lucci`, `win_lose_draw`) VALUES
	(6, 1, 10, 10, '승'),
	(6, 2, 5, 5, '패'),
	(6, 3, 5, 5, '패'),
	(6, 3, 5, 5, '패'),
	(7, 1, 10, 500, '승'),
	(7, 2, 5, 250, '패'),
	(6, 3, 5, 250, '패'),
	(8, 1, 10, 500, '승'),
	(8, 2, 5, 250, '패'),
	(8, 3, 5, 250, '패'),
	(9, 1, 10, 500, '승'),
	(9, 2, 5, 250, '패'),
	(9, 3, 5, 250, '패'),
	(10, 1, 5, 250, '패'),
	(10, 2, 10, 500, '승'),
	(10, 3, 5, 250, '패'),
	(11, 1, 10, 500, '승'),
	(12, 1, 10, 500, '승'),
	(6, 1, 10, 500, '승'),
	(6, 1, 10, 500, '승'),
	(6, 1, 10, 500, '승'),
	(6, 1, 10, 500, '승'),
	(6, 1, 10, 500, '승'),
	(13, 1, 10, 500, '승'),
	(13, 2, 5, 250, '패'),
	(13, 3, 5, 250, '패'),
	(6, 1, 10, 500, '승'),
	(12, 2, 5, 250, '패'),
	(12, 3, 5, 250, '패'),
	(14, 1, 10, 500, '승'),
	(14, 2, 5, 250, '패'),
	(14, 3, 5, 250, '패'),
	(15, 1, 10, 500, '승'),
	(15, 2, 5, 250, '패'),
	(15, 3, 5, 250, '패'),
	(16, 1, 10, 500, '승'),
	(16, 2, 5, 250, '패'),
	(16, 3, 5, 250, '패'),
	(17, 1, 10, 500, '승'),
	(17, 2, 5, 250, '패'),
	(17, 3, 5, 250, '패'),
	(18, 1, 10, 500, '승'),
	(18, 2, 5, 250, '패'),
	(18, 3, 5, 250, '패'),
	(19, 1, 10, 500, '무'),
	(19, 2, 5, 250, '무'),
	(19, 3, 5, 250, '무'),
	(20, 1, 10, 500, '무'),
	(20, 2, 5, 250, '무'),
	(20, 3, 5, 250, '무'),
	(21, 1, 10, 500, '무'),
	(21, 2, 5, 250, '무'),
	(21, 3, 5, 250, '무'),
	(22, 1, 10, 500, '무'),
	(22, 2, 5, 250, '무'),
	(22, 3, 5, 250, '무'),
	(23, 1, 10, 500, '무'),
	(23, 2, 5, 250, '무'),
	(23, 3, 5, 250, '무'),
	(24, 1, 10, 500, '무'),
	(24, 2, 5, 250, '무'),
	(24, 3, 5, 250, '무'),
	(25, 1, 10, 500, '무'),
	(25, 3, 5, 250, '무'),
	(25, 2, 5, 250, '무'),
	(26, 1, 10, 500, '무'),
	(26, 2, 5, 250, '무'),
	(26, 3, 5, 250, '무'),
	(27, 1, 10, 500, '무'),
	(27, 2, 5, 250, '무'),
	(27, 3, 5, 250, '무'),
	(28, 1, 10, 500, '무'),
	(28, 2, 5, 250, '무'),
	(28, 3, 5, 250, '무'),
	(29, 1, 10, 500, '패'),
	(29, 2, 5, 250, '패'),
	(29, 3, 5, 250, '승'),
	(30, 1, 10, 500, '패'),
	(30, 2, 5, 250, '패'),
	(30, 3, 5, 250, '승'),
	(31, 1, 10, 500, '패'),
	(31, 2, 5, 250, '패'),
	(31, 3, 5, 250, '승'),
	(32, 1, 10, 500, '패'),
	(32, 2, 5, 250, '패'),
	(32, 3, 5, 250, '승'),
	(33, 1, 10, 500, '패'),
	(33, 2, 5, 250, '패'),
	(33, 3, 5, 250, '승'),
	(34, 1, 10, 500, '패'),
	(34, 2, 5, 250, '패'),
	(34, 3, 5, 250, '승'),
	(35, 1, 10, 500, '패'),
	(35, 2, 5, 250, '패'),
	(35, 3, 5, 250, '승'),
	(36, 1, 10, 500, '패'),
	(36, 2, 5, 250, '패'),
	(36, 3, 5, 250, '승');

-- 테이블 gamedb_team.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `character_id` tinyint(3) unsigned NOT NULL DEFAULT (case floor(1 + rand() * 3) when 1 then 1 when 2 then 6 when 3 then 7 end),
  `character_color_id` tinyint(3) unsigned DEFAULT (case floor(1 + rand() * 3) when 1 then 1 when 2 then 4 when 3 then 6 end),
  `nickname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `lucci` int(11) unsigned NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gamedb_team.user:~4 rows (대략적) 내보내기
INSERT INTO `user` (`id`, `character_id`, `character_color_id`, `nickname`, `password`, `lucci`, `cash`, `top`, `bottom`, `level`, `status`, `exp`, `last_access_time`, `win`, `lose`, `draw`, `total_play_time`) VALUES
	(1, 1, 1, 'one', '12e21ew', 4500, 0, 0, 0, 1, '활성', 90, '2023-12-03 20:44:33', 6, 8, 10, '2023-12-03 03:04:37'),
	(2, 6, 4, '3번', '1ㅇ2ㅇ1ㅇㅈㅂ', 7250, 0, 0, 0, 1, '활성', 45, '2023-12-03 20:44:33', 0, 14, 10, '2023-12-03 04:13:46'),
	(3, 7, 4, '3', '651651', 4200, 50000, 0, 0, 1, '활성', 85, '2023-12-03 20:44:33', 8, 6, 10, '2023-12-03 05:04:21'),
	(36, 1, 6, '2번', 'ㅈㅂㅇ212ㅇ1', 4500, 482000, 0, 0, 1, '활성', 0, '2023-12-03 04:12:02', 0, 0, 0, '2023-12-03 03:43:56');

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
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
