-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 03, 2025 at 07:34 AM
-- Server version: 8.0.41
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wordpress_db`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `wp_fn_realmedialibrary_childs` (`rootId` INT, `_useTempChildTableForCheck` BOOLEAN) RETURNS VARCHAR(1000) CHARSET utf8mb3 READS SQL DATA SQL SECURITY INVOKER BEGIN
        	DECLARE sTemp VARCHAR(1000);
        	DECLARE sTempChd VARCHAR(1000);
        	SET sTemp = '$';
        	SET sTempChd = CAST(rootId AS CHAR);
		    SET SESSION group_concat_max_len = 100000;
        	WHILE sTempChd IS NOT NULL DO
        		SET sTemp = CONCAT(sTemp,',',sTempChd);
        		IF _useTempChildTableForCheck IS NULL OR _useTempChildTableForCheck = false THEN
        		    SELECT GROUP_CONCAT(id) INTO sTempChd FROM wp_realmedialibrary WHERE FIND_IN_SET(parent,sTempChd) > 0;
        		ELSE
        		    SELECT GROUP_CONCAT(id) INTO sTempChd FROM wp_realmedialibrary_tmp WHERE FIND_IN_SET(parent,sTempChd) > 0;
        		END IF;
        	END WHILE;
        	RETURN sTemp;
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_actions`
--

CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint UNSIGNED NOT NULL,
  `hook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `priority` tinyint UNSIGNED NOT NULL DEFAULT '10',
  `args` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_actionscheduler_actions`
--

INSERT INTO `wp_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `priority`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(166, 'rank_math/analytics/data_fetch', 'failed', '2024-10-01 10:20:00', '2024-10-01 19:20:00', 10, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1727778000;s:18:\"\0*\0first_timestamp\";i:1727778000;s:13:\"\0*\0recurrence\";i:604800;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1727778000;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:604800;}', 2, 1, '2024-10-01 10:21:08', '2024-10-01 19:21:08', 0, NULL),
(170, 'rank_math/analytics/data_fetch', 'failed', '2024-10-08 10:21:08', '2024-10-08 19:21:08', 10, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1728382868;s:18:\"\0*\0first_timestamp\";i:1727778000;s:13:\"\0*\0recurrence\";i:604800;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1728382868;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:604800;}', 2, 1, '2024-10-08 10:29:19', '2024-10-08 19:29:19', 0, NULL),
(171, 'rank_math/analytics/data_fetch', 'failed', '2024-10-15 10:29:19', '2024-10-15 19:29:19', 10, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1728988159;s:18:\"\0*\0first_timestamp\";i:1727778000;s:13:\"\0*\0recurrence\";i:604800;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1728988159;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:604800;}', 2, 1, '2024-10-15 10:32:51', '2024-10-15 19:32:51', 0, NULL),
(173, 'rank_math/analytics/data_fetch', 'failed', '2024-10-22 10:32:51', '2024-10-22 19:32:51', 10, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1729593171;s:18:\"\0*\0first_timestamp\";i:1727778000;s:13:\"\0*\0recurrence\";i:604800;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1729593171;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:604800;}', 2, 1, '2024-10-22 10:34:39', '2024-10-22 19:34:39', 0, NULL),
(174, 'rank_math/analytics/data_fetch', 'failed', '2024-10-29 10:34:39', '2024-10-29 19:34:39', 10, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1730198079;s:18:\"\0*\0first_timestamp\";i:1727778000;s:13:\"\0*\0recurrence\";i:604800;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1730198079;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:604800;}', 2, 1, '2024-10-29 10:37:41', '2024-10-29 19:37:41', 0, NULL),
(228, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-02 05:15:01', '2025-09-02 14:15:01', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1756790101;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1756790101;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-02 05:22:08', '2025-09-02 14:22:08', 5445, NULL),
(229, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-03 05:22:08', '2025-09-03 14:22:08', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1756876928;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1756876928;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-03 05:24:06', '2025-09-03 14:24:06', 5868, NULL),
(230, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-04 05:24:06', '2025-09-04 14:24:06', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1756963446;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1756963446;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-04 05:29:21', '2025-09-04 14:29:21', 6267, NULL),
(231, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-05 05:29:21', '2025-09-05 14:29:21', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757050161;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757050161;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-05 05:33:05', '2025-09-05 14:33:05', 6759, NULL),
(232, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-06 05:33:05', '2025-09-06 14:33:05', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757136785;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757136785;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-06 05:33:33', '2025-09-06 14:33:33', 7037, NULL),
(233, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-07 05:33:33', '2025-09-07 14:33:33', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757223213;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757223213;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-07 05:40:49', '2025-09-07 14:40:49', 7239, NULL),
(234, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-08 05:40:49', '2025-09-08 14:40:49', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757310049;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757310049;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-08 05:43:17', '2025-09-08 14:43:17', 7543, NULL),
(235, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-09 05:43:17', '2025-09-09 14:43:17', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757396597;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757396597;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-09 05:50:24', '2025-09-09 14:50:24', 7924, NULL),
(236, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-10 05:50:24', '2025-09-10 14:50:24', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757483424;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757483424;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-10 05:56:08', '2025-09-10 14:56:08', 8340, NULL),
(237, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-11 05:56:08', '2025-09-11 14:56:08', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757570168;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757570168;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-11 06:07:52', '2025-09-11 15:07:52', 8827, NULL),
(238, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-12 06:07:52', '2025-09-12 15:07:52', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757657272;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757657272;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-12 06:08:03', '2025-09-12 15:08:03', 9316, NULL),
(239, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-13 06:08:03', '2025-09-13 15:08:03', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757743683;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757743683;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-13 06:09:57', '2025-09-13 15:09:57', 10167, NULL),
(240, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-14 06:09:57', '2025-09-14 15:09:57', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757830197;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757830197;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-14 06:20:30', '2025-09-14 15:20:30', 10647, NULL),
(241, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-15 06:20:30', '2025-09-15 15:20:30', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1757917230;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1757917230;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-15 06:23:13', '2025-09-15 15:23:13', 11134, NULL),
(242, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-16 06:23:13', '2025-09-16 15:23:13', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758003793;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758003793;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-16 06:23:59', '2025-09-16 15:23:59', 11646, NULL),
(243, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-17 06:23:59', '2025-09-17 15:23:59', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758090239;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758090239;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-17 06:29:13', '2025-09-17 15:29:13', 12097, NULL),
(244, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-18 06:29:13', '2025-09-18 15:29:13', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758176953;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758176953;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-18 06:29:26', '2025-09-18 15:29:26', 12726, NULL),
(245, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-19 06:29:26', '2025-09-19 15:29:26', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758263366;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758263366;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-19 06:29:47', '2025-09-19 15:29:47', 13279, NULL),
(246, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-20 06:29:47', '2025-09-20 15:29:47', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758349787;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758349787;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-20 06:30:11', '2025-09-20 15:30:11', 13719, NULL),
(247, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-21 06:30:11', '2025-09-21 15:30:11', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758436211;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758436211;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-21 06:45:55', '2025-09-21 15:45:55', 14097, NULL),
(248, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-22 06:45:55', '2025-09-22 15:45:55', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758523555;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758523555;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-22 06:47:00', '2025-09-22 15:47:00', 14503, NULL),
(249, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-23 06:47:00', '2025-09-23 15:47:00', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758610020;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758610020;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-23 06:47:49', '2025-09-23 15:47:49', 15478, NULL),
(250, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-24 06:47:49', '2025-09-24 15:47:49', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758696469;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758696469;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-24 06:47:49', '2025-09-24 15:47:49', 16897, NULL),
(251, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-25 06:47:49', '2025-09-25 15:47:49', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758782869;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758782869;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-25 06:49:49', '2025-09-25 15:49:49', 17449, NULL),
(252, 'action_scheduler/migration_hook', 'complete', '2025-09-25 06:28:00', '2025-09-25 15:28:00', 10, '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1758781680;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1758781680;}', 1, 1, '2025-09-25 06:29:00', '2025-09-25 15:29:00', 17431, NULL),
(253, 'action_scheduler/migration_hook', 'complete', '2025-09-25 06:30:06', '2025-09-25 15:30:06', 10, '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1758781806;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1758781806;}', 1, 1, '2025-09-25 06:30:06', '2025-09-25 15:30:06', 17435, NULL),
(254, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-26 06:49:49', '2025-09-26 15:49:49', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1758869389;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1758869389;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-09-29 04:53:24', '2025-09-29 13:53:24', 17609, NULL),
(255, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2025-09-30 04:53:24', '2025-09-30 13:53:24', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1759208004;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1759208004;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2025-10-02 01:44:12', '2025-10-02 10:44:12', 17611, NULL),
(256, 'action_scheduler_run_recurring_actions_schedule_hook', 'pending', '2025-10-03 01:44:12', '2025-10-03 10:44:12', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1759455852;s:18:\"\0*\0first_timestamp\";i:1753238501;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1759455852;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL),
(257, 'action_scheduler/migration_hook', 'complete', '2025-10-02 02:19:26', '2025-10-02 11:19:26', 10, '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1759371566;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1759371566;}', 1, 1, '2025-10-02 02:19:26', '2025-10-02 11:19:26', 17636, NULL),
(258, 'action_scheduler/migration_hook', 'pending', '2025-10-02 07:37:04', '2025-10-02 16:37:04', 10, '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1759390624;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1759390624;}', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_claims`
--

CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint UNSIGNED NOT NULL,
  `date_created_gmt` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_groups`
--

CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_actionscheduler_groups`
--

INSERT INTO `wp_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration'),
(2, 'rank-math'),
(3, 'ActionScheduler');

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_logs`
--

CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint UNSIGNED NOT NULL,
  `action_id` bigint UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_actionscheduler_logs`
--

INSERT INTO `wp_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(4, 166, 'action created', '2024-09-30 08:58:32', '2024-09-30 17:58:32'),
(14, 166, 'action started via WP Cron', '2024-10-01 10:21:08', '2024-10-01 19:21:08'),
(15, 166, 'action failed via WP Cron: Scheduled action for rank_math/analytics/data_fetch will not be executed as no callbacks are registered.', '2024-10-01 10:21:08', '2024-10-01 19:21:08'),
(16, 170, 'action created', '2024-10-01 10:21:08', '2024-10-01 19:21:08'),
(17, 170, 'action started via WP Cron', '2024-10-08 10:29:19', '2024-10-08 19:29:19'),
(18, 170, 'action failed via WP Cron: Scheduled action for rank_math/analytics/data_fetch will not be executed as no callbacks are registered.', '2024-10-08 10:29:19', '2024-10-08 19:29:19'),
(19, 171, 'action created', '2024-10-08 10:29:19', '2024-10-08 19:29:19'),
(23, 171, 'action started via WP Cron', '2024-10-15 10:32:51', '2024-10-15 19:32:51'),
(24, 171, 'action failed via WP Cron: Scheduled action for rank_math/analytics/data_fetch will not be executed as no callbacks are registered.', '2024-10-15 10:32:51', '2024-10-15 19:32:51'),
(25, 173, 'action created', '2024-10-15 10:32:51', '2024-10-15 19:32:51'),
(26, 173, 'action started via WP Cron', '2024-10-22 10:34:39', '2024-10-22 19:34:39'),
(27, 173, 'action failed via WP Cron: Scheduled action for rank_math/analytics/data_fetch will not be executed as no callbacks are registered.', '2024-10-22 10:34:39', '2024-10-22 19:34:39'),
(28, 174, 'action created', '2024-10-22 10:34:39', '2024-10-22 19:34:39'),
(29, 174, 'action started via WP Cron', '2024-10-29 10:37:41', '2024-10-29 19:37:41'),
(30, 174, 'action failed via WP Cron: Scheduled action for rank_math/analytics/data_fetch will not be executed as no callbacks are registered.', '2024-10-29 10:37:41', '2024-10-29 19:37:41'),
(31, 174, 'This action appears to be consistently failing. A new instance will not be scheduled.', '2024-10-29 10:37:41', '2024-10-29 19:37:41'),
(191, 228, 'action created', '2025-09-01 05:15:01', '2025-09-01 14:15:01'),
(192, 228, 'action started via WP Cron', '2025-09-02 05:22:08', '2025-09-02 14:22:08'),
(193, 228, 'action complete via WP Cron', '2025-09-02 05:22:08', '2025-09-02 14:22:08'),
(194, 229, 'action created', '2025-09-02 05:22:08', '2025-09-02 14:22:08'),
(195, 229, 'action started via WP Cron', '2025-09-03 05:24:06', '2025-09-03 14:24:06'),
(196, 229, 'action complete via WP Cron', '2025-09-03 05:24:06', '2025-09-03 14:24:06'),
(197, 230, 'action created', '2025-09-03 05:24:06', '2025-09-03 14:24:06'),
(198, 230, 'action started via WP Cron', '2025-09-04 05:29:21', '2025-09-04 14:29:21'),
(199, 230, 'action complete via WP Cron', '2025-09-04 05:29:21', '2025-09-04 14:29:21'),
(200, 231, 'action created', '2025-09-04 05:29:21', '2025-09-04 14:29:21'),
(201, 231, 'action started via WP Cron', '2025-09-05 05:33:04', '2025-09-05 14:33:04'),
(202, 231, 'action complete via WP Cron', '2025-09-05 05:33:05', '2025-09-05 14:33:05'),
(203, 232, 'action created', '2025-09-05 05:33:05', '2025-09-05 14:33:05'),
(204, 232, 'action started via WP Cron', '2025-09-06 05:33:33', '2025-09-06 14:33:33'),
(205, 232, 'action complete via WP Cron', '2025-09-06 05:33:33', '2025-09-06 14:33:33'),
(206, 233, 'action created', '2025-09-06 05:33:33', '2025-09-06 14:33:33'),
(207, 233, 'action started via WP Cron', '2025-09-07 05:40:49', '2025-09-07 14:40:49'),
(208, 233, 'action complete via WP Cron', '2025-09-07 05:40:49', '2025-09-07 14:40:49'),
(209, 234, 'action created', '2025-09-07 05:40:49', '2025-09-07 14:40:49'),
(210, 234, 'action started via WP Cron', '2025-09-08 05:43:17', '2025-09-08 14:43:17'),
(211, 234, 'action complete via WP Cron', '2025-09-08 05:43:17', '2025-09-08 14:43:17'),
(212, 235, 'action created', '2025-09-08 05:43:17', '2025-09-08 14:43:17'),
(213, 235, 'action started via WP Cron', '2025-09-09 05:50:24', '2025-09-09 14:50:24'),
(214, 235, 'action complete via WP Cron', '2025-09-09 05:50:24', '2025-09-09 14:50:24'),
(215, 236, 'action created', '2025-09-09 05:50:24', '2025-09-09 14:50:24'),
(216, 236, 'action started via WP Cron', '2025-09-10 05:56:08', '2025-09-10 14:56:08'),
(217, 236, 'action complete via WP Cron', '2025-09-10 05:56:08', '2025-09-10 14:56:08'),
(218, 237, 'action created', '2025-09-10 05:56:08', '2025-09-10 14:56:08'),
(219, 237, 'action started via WP Cron', '2025-09-11 06:07:52', '2025-09-11 15:07:52'),
(220, 237, 'action complete via WP Cron', '2025-09-11 06:07:52', '2025-09-11 15:07:52'),
(221, 238, 'action created', '2025-09-11 06:07:52', '2025-09-11 15:07:52'),
(222, 238, 'action started via WP Cron', '2025-09-12 06:08:03', '2025-09-12 15:08:03'),
(223, 238, 'action complete via WP Cron', '2025-09-12 06:08:03', '2025-09-12 15:08:03'),
(224, 239, 'action created', '2025-09-12 06:08:03', '2025-09-12 15:08:03'),
(225, 239, 'action started via WP Cron', '2025-09-13 06:09:57', '2025-09-13 15:09:57'),
(226, 239, 'action complete via WP Cron', '2025-09-13 06:09:57', '2025-09-13 15:09:57'),
(227, 240, 'action created', '2025-09-13 06:09:57', '2025-09-13 15:09:57'),
(228, 240, 'action started via WP Cron', '2025-09-14 06:20:30', '2025-09-14 15:20:30'),
(229, 240, 'action complete via WP Cron', '2025-09-14 06:20:30', '2025-09-14 15:20:30'),
(230, 241, 'action created', '2025-09-14 06:20:30', '2025-09-14 15:20:30'),
(231, 241, 'action started via WP Cron', '2025-09-15 06:23:13', '2025-09-15 15:23:13'),
(232, 241, 'action complete via WP Cron', '2025-09-15 06:23:13', '2025-09-15 15:23:13'),
(233, 242, 'action created', '2025-09-15 06:23:13', '2025-09-15 15:23:13'),
(234, 242, 'action started via WP Cron', '2025-09-16 06:23:59', '2025-09-16 15:23:59'),
(235, 242, 'action complete via WP Cron', '2025-09-16 06:23:59', '2025-09-16 15:23:59'),
(236, 243, 'action created', '2025-09-16 06:23:59', '2025-09-16 15:23:59'),
(237, 243, 'action started via WP Cron', '2025-09-17 06:29:13', '2025-09-17 15:29:13'),
(238, 243, 'action complete via WP Cron', '2025-09-17 06:29:13', '2025-09-17 15:29:13'),
(239, 244, 'action created', '2025-09-17 06:29:13', '2025-09-17 15:29:13'),
(240, 244, 'action started via WP Cron', '2025-09-18 06:29:26', '2025-09-18 15:29:26'),
(241, 244, 'action complete via WP Cron', '2025-09-18 06:29:26', '2025-09-18 15:29:26'),
(242, 245, 'action created', '2025-09-18 06:29:26', '2025-09-18 15:29:26'),
(243, 245, 'action started via WP Cron', '2025-09-19 06:29:47', '2025-09-19 15:29:47'),
(244, 245, 'action complete via WP Cron', '2025-09-19 06:29:47', '2025-09-19 15:29:47'),
(245, 246, 'action created', '2025-09-19 06:29:47', '2025-09-19 15:29:47'),
(246, 246, 'action started via WP Cron', '2025-09-20 06:30:11', '2025-09-20 15:30:11'),
(247, 246, 'action complete via WP Cron', '2025-09-20 06:30:11', '2025-09-20 15:30:11'),
(248, 247, 'action created', '2025-09-20 06:30:11', '2025-09-20 15:30:11'),
(249, 247, 'action started via WP Cron', '2025-09-21 06:45:55', '2025-09-21 15:45:55'),
(250, 247, 'action complete via WP Cron', '2025-09-21 06:45:55', '2025-09-21 15:45:55'),
(251, 248, 'action created', '2025-09-21 06:45:55', '2025-09-21 15:45:55'),
(252, 248, 'action started via WP Cron', '2025-09-22 06:47:00', '2025-09-22 15:47:00'),
(253, 248, 'action complete via WP Cron', '2025-09-22 06:47:00', '2025-09-22 15:47:00'),
(254, 249, 'action created', '2025-09-22 06:47:00', '2025-09-22 15:47:00'),
(255, 249, 'action started via WP Cron', '2025-09-23 06:47:49', '2025-09-23 15:47:49'),
(256, 249, 'action complete via WP Cron', '2025-09-23 06:47:49', '2025-09-23 15:47:49'),
(257, 250, 'action created', '2025-09-23 06:47:49', '2025-09-23 15:47:49'),
(258, 250, 'action started via WP Cron', '2025-09-24 06:47:49', '2025-09-24 15:47:49'),
(259, 250, 'action complete via WP Cron', '2025-09-24 06:47:49', '2025-09-24 15:47:49'),
(260, 251, 'action created', '2025-09-24 06:47:49', '2025-09-24 15:47:49'),
(261, 252, 'action created', '2025-09-25 06:27:00', '2025-09-25 15:27:00'),
(262, 252, 'action started via WP Cron', '2025-09-25 06:29:00', '2025-09-25 15:29:00'),
(263, 252, 'action complete via WP Cron', '2025-09-25 06:29:00', '2025-09-25 15:29:00'),
(264, 253, 'action created', '2025-09-25 06:29:06', '2025-09-25 15:29:06'),
(265, 253, 'action started via Async Request', '2025-09-25 06:30:06', '2025-09-25 15:30:06'),
(266, 253, 'action complete via Async Request', '2025-09-25 06:30:06', '2025-09-25 15:30:06'),
(267, 251, 'action started via WP Cron', '2025-09-25 06:49:49', '2025-09-25 15:49:49'),
(268, 251, 'action complete via WP Cron', '2025-09-25 06:49:49', '2025-09-25 15:49:49'),
(269, 254, 'action created', '2025-09-25 06:49:49', '2025-09-25 15:49:49'),
(270, 254, 'action started via WP Cron', '2025-09-29 04:53:24', '2025-09-29 13:53:24'),
(271, 254, 'action complete via WP Cron', '2025-09-29 04:53:24', '2025-09-29 13:53:24'),
(272, 255, 'action created', '2025-09-29 04:53:24', '2025-09-29 13:53:24'),
(273, 255, 'action started via WP Cron', '2025-10-02 01:44:12', '2025-10-02 10:44:12'),
(274, 255, 'action complete via WP Cron', '2025-10-02 01:44:12', '2025-10-02 10:44:12'),
(275, 256, 'action created', '2025-10-02 01:44:12', '2025-10-02 10:44:12'),
(276, 257, 'action created', '2025-10-02 02:18:26', '2025-10-02 11:18:26'),
(277, 257, 'action started via WP Cron', '2025-10-02 02:19:26', '2025-10-02 11:19:26'),
(278, 257, 'action complete via WP Cron', '2025-10-02 02:19:26', '2025-10-02 11:19:26'),
(279, 258, 'action created', '2025-10-02 07:36:04', '2025-10-02 16:36:04');

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint UNSIGNED NOT NULL,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'WordPress コメントの投稿者', 'wapuu@wordpress.example', 'https://ja.wordpress.org/', '', '2024-09-25 19:15:35', '2024-09-25 10:15:35', 'こんにちは、これはコメントです。\nコメントの承認、編集、削除を始めるにはダッシュボードの「コメント」画面にアクセスしてください。\nコメントのアバターは「<a href=\"https://ja.gravatar.com/\">Gravatar</a>」から取得されます。', 0, '1', '', 'comment', 0, 0),
(2, 1, 'MyBlog', '', 'http://mnbdaa.com', '185.36.81.36', '2025-08-14 20:19:18', '2025-08-14 11:19:18', '<strong>itstitle</strong>\n\nexcerptsa', 0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'trackback', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint UNSIGNED NOT NULL,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint UNSIGNED NOT NULL,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8080', 'yes'),
(2, 'home', 'http://localhost:8080', 'yes'),
(3, 'blogname', 'AIoT - Happy Together', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'info@aiot-fixing.local', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '7', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'Y年n月j日', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'Y年n月j日 g:i A', 'yes'),
(26, 'comment_moderation', '1', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:5:{i:0;s:25:\"polylang-pro/polylang.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";i:3;s:23:\"loco-translate/loco.php\";i:5;s:30:\"seo-by-rank-math/rank-math.php\";i:7;s:23:\"wordfence/wordfence.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'https://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:99:\"/Users/anhd/Documents/wordpress/aiot-fixing/app/public/wp-content/themes/mooms_dev/theme/footer.php\";i:1;s:98:\"/Users/anhd/Documents/wordpress/aiot-fixing/app/public/wp-content/themes/mooms_dev/theme/style.css\";i:2;s:102:\"/Users/anhd/Documents/wordpress/aiot-fixing/app/public/wp-content/themes/mooms_dev/theme/functions.php\";i:3;s:99:\"/Users/anhd/Documents/wordpress/aiot-fixing/app/public/wp-content/themes/mooms_dev/theme/header.php\";i:4;s:98:\"/Users/anhd/Documents/wordpress/aiot-fixing/app/public/wp-content/themes/mooms_dev/theme/index.php\";}', 'no'),
(40, 'template', 'mooms_dev/theme', 'yes'),
(41, 'stylesheet', 'mooms_dev/theme', 'yes'),
(42, 'comment_registration', '1', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '60421', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '0', 'yes'),
(57, 'thumbnail_size_h', '0', 'yes'),
(58, 'thumbnail_crop', '', 'yes'),
(59, 'medium_size_w', '0', 'yes'),
(60, 'medium_size_h', '0', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '0', 'yes'),
(63, 'large_size_h', '0', 'yes'),
(64, 'image_default_link_type', '', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:0:{}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'auto'),
(78, 'widget_rss', 'a:0:{}', 'yes'),
(79, 'uninstall_plugins', 'a:2:{s:27:\"redirection/redirection.php\";a:2:{i:0;s:17:\"Redirection_Admin\";i:1;s:16:\"plugin_uninstall\";}s:39:\"copy-delete-posts/copy-delete-posts.php\";a:2:{i:0;s:15:\"Account\\Account\";i:1;s:25:\"onUninstallPluginListener\";}}', 'no'),
(80, 'timezone_string', 'Asia/Tokyo', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '8', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '95', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1774941828', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'off'),
(99, 'initial_db_version', '53496', 'yes'),
(100, 'wp_user_roles', 'a:6:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:83:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:10:\"loco_admin\";b:1;s:10:\"copy_posts\";b:1;s:23:\"rank_math_edit_htaccess\";b:1;s:16:\"rank_math_titles\";b:1;s:17:\"rank_math_general\";b:1;s:17:\"rank_math_sitemap\";b:1;s:21:\"rank_math_404_monitor\";b:1;s:22:\"rank_math_link_builder\";b:1;s:22:\"rank_math_redirections\";b:1;s:22:\"rank_math_role_manager\";b:1;s:19:\"rank_math_analytics\";b:1;s:23:\"rank_math_site_analysis\";b:1;s:25:\"rank_math_onpage_analysis\";b:1;s:24:\"rank_math_onpage_general\";b:1;s:25:\"rank_math_onpage_advanced\";b:1;s:24:\"rank_math_onpage_snippet\";b:1;s:23:\"rank_math_onpage_social\";b:1;s:20:\"rank_math_content_ai\";b:1;s:19:\"rank_math_admin_bar\";b:1;s:23:\"wf2fa_activate_2fa_self\";b:1;s:25:\"wf2fa_activate_2fa_others\";b:1;s:21:\"wf2fa_manage_settings\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:40:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:10:\"copy_posts\";b:1;s:23:\"rank_math_site_analysis\";b:1;s:25:\"rank_math_onpage_analysis\";b:1;s:24:\"rank_math_onpage_general\";b:1;s:24:\"rank_math_onpage_snippet\";b:1;s:23:\"rank_math_onpage_social\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:14:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:25:\"rank_math_onpage_analysis\";b:1;s:24:\"rank_math_onpage_general\";b:1;s:24:\"rank_math_onpage_snippet\";b:1;s:23:\"rank_math_onpage_social\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:10:\"translator\";a:2:{s:4:\"name\";s:10:\"Translator\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:10:\"loco_admin\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'off'),
(102, 'user_count', '3', 'off'),
(103, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:157:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>最近の投稿</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:233:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>最近のコメント</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:153:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>アーカイブ</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:155:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>カテゴリー</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(105, 'cron', 'a:18:{i:1753413729;a:0:{}i:1759386550;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1759389659;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1759389990;a:1:{s:21:\"wordfence_ls_ntp_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1759390610;a:1:{s:40:\"wordfence_completeCoreUpdateNotification\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1759390726;a:1:{s:35:\"wordfence_refreshUpdateNotification\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1759391886;a:2:{s:20:\"wordfence_daily_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:21:\"wordfence_hourly_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1759392133;a:1:{s:26:\"wordfence_daily_autoUpdate\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1759400136;a:5:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1759400138;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1759400181;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1759400184;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1759445232;a:1:{s:35:\"rank_math/content-ai/update_prompts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1759449600;a:2:{s:35:\"rank_math/redirection/clean_trashed\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:30:\"rank_math/links/internal_links\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1759456691;a:1:{s:21:\"ai1wm_storage_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1759734000;a:1:{s:31:\"wordfence_email_activity_report\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1759948264;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'on'),
(106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'nonce_key', '&v]=@YnL=e`8FPN{<c2Oj&0-WsGS~:$oi!zS~TVYPUr}_TI6Z>(PFzir7K%&(2is', 'no'),
(116, 'nonce_salt', 'uVzc1{r.zmaAx/n:w|3n}S?_T]9zrp8Q`]b)wphWsT6AhKfcmaC7J7(r8xzxO=.1', 'no'),
(117, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(120, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(121, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(123, 'theme_mods_twentytwentythree', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1727288630;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'off'),
(148, 'recovery_keys', 'a:0:{}', 'off'),
(149, 'https_detection_errors', 'a:0:{}', 'off'),
(152, 'finished_updating_comment_type', '1', 'yes'),
(164, 'WPLANG', '', 'yes'),
(165, 'new_admin_email', 'info@aiot-fixing.local', 'yes'),
(168, 'recently_activated', 'a:5:{s:71:\"enable-virtual-card-upload-vcardvcf/prdb-enable-virtual-card-upload.php\";i:1759394387;s:22:\"team-section/index.php\";i:1759394387;s:27:\"redirection/redirection.php\";i:1759394166;s:33:\"wps-hide-login/wps-hide-login.php\";i:1759390548;s:25:\"duplicator/duplicator.php\";i:1759371506;}', 'off'),
(172, 'wp_attachment_pages_enabled', '1', 'on'),
(173, 'db_upgraded', '', 'on'),
(190, 'current_theme', 'MOOMS.DEV', 'auto'),
(191, 'theme_mods_mooms_dev/theme', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:3:{s:9:\"main-menu\";i:21;s:11:\"footer-menu\";i:28;s:11:\"mobile-menu\";i:70;}s:18:\"custom_css_post_id\";i:-1;}', 'on'),
(192, 'theme_switched', '', 'auto'),
(193, 'recovery_mode_email_last_sent', '1753350350', 'auto'),
(212, 'polylang', 'a:15:{s:7:\"browser\";i:0;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:1;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:1;s:13:\"media_support\";b:0;s:9:\"uninstall\";i:0;s:4:\"sync\";a:0:{}s:10:\"post_types\";a:1:{i:0;s:4:\"blog\";}s:10:\"taxonomies\";a:2:{i:0;s:8:\"blog_cat\";i:1;s:9:\"blog_tags\";}s:7:\"domains\";a:0:{}s:7:\"version\";s:5:\"3.6.3\";s:16:\"first_activation\";i:1727310432;s:12:\"default_lang\";s:2:\"ja\";s:9:\"nav_menus\";a:1:{s:15:\"mooms_dev/theme\";a:3:{s:9:\"main-menu\";a:3:{s:2:\"ja\";i:21;s:2:\"vi\";i:0;s:2:\"en\";i:14;}s:11:\"footer-menu\";a:3:{s:2:\"ja\";i:28;s:2:\"vi\";i:0;s:2:\"en\";i:15;}s:11:\"mobile-menu\";a:3:{s:2:\"ja\";i:70;s:2:\"vi\";i:0;s:2:\"en\";i:0;}}}}', 'auto'),
(213, 'polylang_wpml_strings', 'a:0:{}', 'auto'),
(215, 'widget_polylang', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(227, 'pll_dismissed_notices', 'a:1:{i:0;s:6:\"wizard\";}', 'auto'),
(231, 'loco_recent', 'a:4:{s:1:\"c\";s:21:\"Loco_data_RecentItems\";s:1:\"v\";i:0;s:1:\"d\";a:1:{s:6:\"bundle\";a:1:{s:21:\"theme.mooms_dev/theme\";i:1753432592;}}s:1:\"t\";i:1753432592;}', 'off'),
(278, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'off'),
(367, 'auto_update_plugins', 'a:1:{i:0;s:33:\"real-media-library-lite/index.php\";}', 'off'),
(794, '_logovi', '101', 'off'),
(795, '_footer_logovi', '101', 'off'),
(796, '_hinh_anh_mac_dinhvi', '101', 'off'),
(797, '_companyvi', '', 'off'),
(798, '_addressvi', '', 'off'),
(799, '_googlemapvi', '', 'off'),
(800, '_emailvi', '', 'off'),
(801, '_phone_numbervi', '', 'off'),
(802, '_facebookvi', '', 'off'),
(803, '_instagramvi', '', 'off'),
(804, '_twittervi', '', 'off'),
(805, '_contact_labelvi', '', 'off'),
(806, '_contact_urlvi', '', 'off'),
(807, '_contact_messagevi', '', 'off'),
(863, 'duplicate_post_show_notice', '1', 'auto'),
(864, 'duplicate_post_copytitle', '1', 'auto'),
(865, 'duplicate_post_copydate', '', 'auto'),
(866, 'duplicate_post_copystatus', '', 'auto'),
(867, 'duplicate_post_copyslug', '', 'auto'),
(868, 'duplicate_post_copyexcerpt', '', 'auto'),
(869, 'duplicate_post_copycontent', '1', 'auto'),
(870, 'duplicate_post_copythumbnail', '1', 'auto'),
(871, 'duplicate_post_copytemplate', '1', 'auto'),
(872, 'duplicate_post_copyformat', '1', 'auto'),
(873, 'duplicate_post_copyauthor', '', 'auto'),
(874, 'duplicate_post_copypassword', '', 'auto'),
(875, 'duplicate_post_copyattachments', '', 'auto'),
(876, 'duplicate_post_copychildren', '', 'auto'),
(877, 'duplicate_post_copycomments', '', 'auto'),
(878, 'duplicate_post_copymenuorder', '1', 'auto'),
(879, 'duplicate_post_taxonomies_blacklist', 'a:0:{}', 'auto'),
(880, 'duplicate_post_blacklist', '', 'auto'),
(881, 'duplicate_post_types_enabled', 'a:3:{i:0;s:4:\"post\";i:1;s:4:\"page\";i:2;s:4:\"blog\";}', 'auto'),
(882, 'duplicate_post_show_original_column', '', 'auto'),
(883, 'duplicate_post_show_original_in_post_states', '', 'auto'),
(884, 'duplicate_post_show_original_meta_box', '', 'auto'),
(885, 'duplicate_post_show_link', 'a:3:{s:9:\"new_draft\";s:1:\"1\";s:5:\"clone\";s:1:\"1\";s:17:\"rewrite_republish\";s:1:\"1\";}', 'auto'),
(886, 'duplicate_post_show_link_in', 'a:4:{s:3:\"row\";s:1:\"1\";s:8:\"adminbar\";s:1:\"1\";s:9:\"submitbox\";s:1:\"1\";s:11:\"bulkactions\";s:1:\"1\";}', 'auto'),
(887, 'duplicate_post_version', '4.5', 'auto'),
(1189, 'rewrite_rules', 'a:235:{s:19:\"sitemap_index\\.xml$\";s:19:\"index.php?sitemap=1\";s:31:\"([^/]+?)-sitemap([0-9]+)?\\.xml$\";s:51:\"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]\";s:24:\"([a-z]+)?-?sitemap\\.xsl$\";s:25:\"index.php?xsl=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:56:\"^(vi|en)/wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:92:\"index.php?lang=$matches[1]&sitemap=$matches[2]&sitemap-subtype=$matches[3]&paged=$matches[4]\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:42:\"^(vi|en)/wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:64:\"index.php?lang=$matches[1]&sitemap=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:16:\"(vi|en)/blogs/?$\";s:41:\"index.php?lang=$matches[1]&post_type=blog\";s:8:\"blogs/?$\";s:32:\"index.php?lang=ja&post_type=blog\";s:46:\"(vi|en)/blogs/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=$matches[1]&post_type=blog&feed=$matches[2]\";s:38:\"blogs/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?lang=ja&post_type=blog&feed=$matches[1]\";s:41:\"(vi|en)/blogs/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=$matches[1]&post_type=blog&feed=$matches[2]\";s:33:\"blogs/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?lang=ja&post_type=blog&feed=$matches[1]\";s:33:\"(vi|en)/blogs/page/([0-9]{1,})/?$\";s:59:\"index.php?lang=$matches[1]&post_type=blog&paged=$matches[2]\";s:25:\"blogs/page/([0-9]{1,})/?$\";s:50:\"index.php?lang=ja&post_type=blog&paged=$matches[1]\";s:55:\"(vi|en)/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?lang=$matches[1]&category_name=$matches[2]&feed=$matches[3]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:50:\"(vi|en)/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?lang=$matches[1]&category_name=$matches[2]&feed=$matches[3]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:31:\"(vi|en)/category/(.+?)/embed/?$\";s:63:\"index.php?lang=$matches[1]&category_name=$matches[2]&embed=true\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:43:\"(vi|en)/category/(.+?)/page/?([0-9]{1,})/?$\";s:70:\"index.php?lang=$matches[1]&category_name=$matches[2]&paged=$matches[3]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:25:\"(vi|en)/category/(.+?)/?$\";s:52:\"index.php?lang=$matches[1]&category_name=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:52:\"(vi|en)/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&tag=$matches[2]&feed=$matches[3]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:47:\"(vi|en)/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&tag=$matches[2]&feed=$matches[3]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:28:\"(vi|en)/tag/([^/]+)/embed/?$\";s:53:\"index.php?lang=$matches[1]&tag=$matches[2]&embed=true\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:40:\"(vi|en)/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:60:\"index.php?lang=$matches[1]&tag=$matches[2]&paged=$matches[3]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:22:\"(vi|en)/tag/([^/]+)/?$\";s:42:\"index.php?lang=$matches[1]&tag=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:53:\"(vi|en)/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=ja&post_format=$matches[1]&feed=$matches[2]\";s:48:\"(vi|en)/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=ja&post_format=$matches[1]&feed=$matches[2]\";s:29:\"(vi|en)/type/([^/]+)/embed/?$\";s:61:\"index.php?lang=$matches[1]&post_format=$matches[2]&embed=true\";s:21:\"type/([^/]+)/embed/?$\";s:52:\"index.php?lang=ja&post_format=$matches[1]&embed=true\";s:41:\"(vi|en)/type/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&post_format=$matches[2]&paged=$matches[3]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?lang=ja&post_format=$matches[1]&paged=$matches[2]\";s:23:\"(vi|en)/type/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&post_format=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:41:\"index.php?lang=ja&post_format=$matches[1]\";s:63:\"(vi|en)/blogs-category/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&blog_cat=$matches[2]&feed=$matches[3]\";s:55:\"blogs-category/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?blog_cat=$matches[1]&feed=$matches[2]\";s:58:\"(vi|en)/blogs-category/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&blog_cat=$matches[2]&feed=$matches[3]\";s:50:\"blogs-category/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?blog_cat=$matches[1]&feed=$matches[2]\";s:39:\"(vi|en)/blogs-category/([^/]+)/embed/?$\";s:58:\"index.php?lang=$matches[1]&blog_cat=$matches[2]&embed=true\";s:31:\"blogs-category/([^/]+)/embed/?$\";s:41:\"index.php?blog_cat=$matches[1]&embed=true\";s:51:\"(vi|en)/blogs-category/([^/]+)/page/?([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&blog_cat=$matches[2]&paged=$matches[3]\";s:43:\"blogs-category/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?blog_cat=$matches[1]&paged=$matches[2]\";s:33:\"(vi|en)/blogs-category/([^/]+)/?$\";s:47:\"index.php?lang=$matches[1]&blog_cat=$matches[2]\";s:25:\"blogs-category/([^/]+)/?$\";s:30:\"index.php?blog_cat=$matches[1]\";s:58:\"(vi|en)/blog_tags/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:65:\"index.php?lang=$matches[1]&blog_tags=$matches[2]&feed=$matches[3]\";s:50:\"blog_tags/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?blog_tags=$matches[1]&feed=$matches[2]\";s:53:\"(vi|en)/blog_tags/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:65:\"index.php?lang=$matches[1]&blog_tags=$matches[2]&feed=$matches[3]\";s:45:\"blog_tags/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?blog_tags=$matches[1]&feed=$matches[2]\";s:34:\"(vi|en)/blog_tags/([^/]+)/embed/?$\";s:59:\"index.php?lang=$matches[1]&blog_tags=$matches[2]&embed=true\";s:26:\"blog_tags/([^/]+)/embed/?$\";s:42:\"index.php?blog_tags=$matches[1]&embed=true\";s:46:\"(vi|en)/blog_tags/([^/]+)/page/?([0-9]{1,})/?$\";s:66:\"index.php?lang=$matches[1]&blog_tags=$matches[2]&paged=$matches[3]\";s:38:\"blog_tags/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?blog_tags=$matches[1]&paged=$matches[2]\";s:28:\"(vi|en)/blog_tags/([^/]+)/?$\";s:48:\"index.php?lang=$matches[1]&blog_tags=$matches[2]\";s:20:\"blog_tags/([^/]+)/?$\";s:31:\"index.php?blog_tags=$matches[1]\";s:39:\"(vi|en)/blogs/.+?/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:31:\"blogs/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:49:\"(vi|en)/blogs/.+?/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:41:\"blogs/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:69:\"(vi|en)/blogs/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:61:\"blogs/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"(vi|en)/blogs/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:56:\"blogs/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"(vi|en)/blogs/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:56:\"blogs/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:45:\"(vi|en)/blogs/.+?/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:37:\"blogs/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:28:\"(vi|en)/blogs/(.+?)/embed/?$\";s:54:\"index.php?lang=$matches[1]&blog=$matches[2]&embed=true\";s:20:\"blogs/(.+?)/embed/?$\";s:37:\"index.php?blog=$matches[1]&embed=true\";s:32:\"(vi|en)/blogs/(.+?)/trackback/?$\";s:48:\"index.php?lang=$matches[1]&blog=$matches[2]&tb=1\";s:24:\"blogs/(.+?)/trackback/?$\";s:31:\"index.php?blog=$matches[1]&tb=1\";s:52:\"(vi|en)/blogs/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&blog=$matches[2]&feed=$matches[3]\";s:44:\"blogs/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?blog=$matches[1]&feed=$matches[2]\";s:47:\"(vi|en)/blogs/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&blog=$matches[2]&feed=$matches[3]\";s:39:\"blogs/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?blog=$matches[1]&feed=$matches[2]\";s:40:\"(vi|en)/blogs/(.+?)/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&blog=$matches[2]&paged=$matches[3]\";s:32:\"blogs/(.+?)/page/?([0-9]{1,})/?$\";s:44:\"index.php?blog=$matches[1]&paged=$matches[2]\";s:47:\"(vi|en)/blogs/(.+?)/comment-page-([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&blog=$matches[2]&cpage=$matches[3]\";s:39:\"blogs/(.+?)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?blog=$matches[1]&cpage=$matches[2]\";s:36:\"(vi|en)/blogs/(.+?)(?:/([0-9]+))?/?$\";s:60:\"index.php?lang=$matches[1]&blog=$matches[2]&page=$matches[3]\";s:28:\"blogs/(.+?)(?:/([0-9]+))?/?$\";s:43:\"index.php?blog=$matches[1]&page=$matches[2]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:12:\"sitemap\\.xml\";s:24:\"index.php??sitemap=index\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:40:\"(vi|en)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:35:\"index.php?lang=ja&&feed=$matches[1]\";s:35:\"(vi|en)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:35:\"index.php?lang=ja&&feed=$matches[1]\";s:16:\"(vi|en)/embed/?$\";s:38:\"index.php?lang=$matches[1]&&embed=true\";s:8:\"embed/?$\";s:29:\"index.php?lang=ja&&embed=true\";s:28:\"(vi|en)/page/?([0-9]{1,})/?$\";s:45:\"index.php?lang=$matches[1]&&paged=$matches[2]\";s:20:\"page/?([0-9]{1,})/?$\";s:36:\"index.php?lang=ja&&paged=$matches[1]\";s:35:\"(vi|en)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?lang=$matches[1]&&page_id=20&cpage=$matches[2]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:47:\"index.php?lang=ja&&page_id=20&cpage=$matches[1]\";s:10:\"(vi|en)/?$\";s:26:\"index.php?lang=$matches[1]\";s:49:\"(vi|en)/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?lang=ja&&feed=$matches[1]&withcomments=1\";s:44:\"(vi|en)/comments/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?lang=ja&&feed=$matches[1]&withcomments=1\";s:25:\"(vi|en)/comments/embed/?$\";s:38:\"index.php?lang=$matches[1]&&embed=true\";s:17:\"comments/embed/?$\";s:29:\"index.php?lang=ja&&embed=true\";s:52:\"(vi|en)/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?lang=ja&s=$matches[1]&feed=$matches[2]\";s:47:\"(vi|en)/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?lang=ja&s=$matches[1]&feed=$matches[2]\";s:28:\"(vi|en)/search/(.+)/embed/?$\";s:51:\"index.php?lang=$matches[1]&s=$matches[2]&embed=true\";s:20:\"search/(.+)/embed/?$\";s:42:\"index.php?lang=ja&s=$matches[1]&embed=true\";s:40:\"(vi|en)/search/(.+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&s=$matches[2]&paged=$matches[3]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?lang=ja&s=$matches[1]&paged=$matches[2]\";s:22:\"(vi|en)/search/(.+)/?$\";s:40:\"index.php?lang=$matches[1]&s=$matches[2]\";s:14:\"search/(.+)/?$\";s:31:\"index.php?lang=ja&s=$matches[1]\";s:55:\"(vi|en)/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=ja&author_name=$matches[1]&feed=$matches[2]\";s:50:\"(vi|en)/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=ja&author_name=$matches[1]&feed=$matches[2]\";s:31:\"(vi|en)/author/([^/]+)/embed/?$\";s:61:\"index.php?lang=$matches[1]&author_name=$matches[2]&embed=true\";s:23:\"author/([^/]+)/embed/?$\";s:52:\"index.php?lang=ja&author_name=$matches[1]&embed=true\";s:43:\"(vi|en)/author/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&author_name=$matches[2]&paged=$matches[3]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?lang=ja&author_name=$matches[1]&paged=$matches[2]\";s:25:\"(vi|en)/author/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&author_name=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:41:\"index.php?lang=ja&author_name=$matches[1]\";s:77:\"(vi|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:88:\"index.php?lang=ja&year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:72:\"(vi|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:88:\"index.php?lang=ja&year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:53:\"(vi|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:91:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&embed=true\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:82:\"index.php?lang=ja&year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:65:\"(vi|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:98:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&paged=$matches[5]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:89:\"index.php?lang=ja&year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:47:\"(vi|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:80:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:71:\"index.php?lang=ja&year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:64:\"(vi|en)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:72:\"index.php?lang=ja&year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:59:\"(vi|en)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:72:\"index.php?lang=ja&year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:40:\"(vi|en)/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:75:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&embed=true\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:66:\"index.php?lang=ja&year=$matches[1]&monthnum=$matches[2]&embed=true\";s:52:\"(vi|en)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:82:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&paged=$matches[4]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:73:\"index.php?lang=ja&year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:34:\"(vi|en)/([0-9]{4})/([0-9]{1,2})/?$\";s:64:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:55:\"index.php?lang=ja&year=$matches[1]&monthnum=$matches[2]\";s:51:\"(vi|en)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?lang=ja&year=$matches[1]&feed=$matches[2]\";s:46:\"(vi|en)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?lang=ja&year=$matches[1]&feed=$matches[2]\";s:27:\"(vi|en)/([0-9]{4})/embed/?$\";s:54:\"index.php?lang=$matches[1]&year=$matches[2]&embed=true\";s:19:\"([0-9]{4})/embed/?$\";s:45:\"index.php?lang=ja&year=$matches[1]&embed=true\";s:39:\"(vi|en)/([0-9]{4})/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&year=$matches[2]&paged=$matches[3]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:52:\"index.php?lang=ja&year=$matches[1]&paged=$matches[2]\";s:21:\"(vi|en)/([0-9]{4})/?$\";s:43:\"index.php?lang=$matches[1]&year=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:34:\"index.php?lang=ja&year=$matches[1]\";s:35:\"(vi|en)/.?.+?/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"(vi|en)/.?.+?/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"(vi|en)/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(vi|en)/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(vi|en)/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"(vi|en)/.?.+?/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"(vi|en)/(.?.+?)/embed/?$\";s:58:\"index.php?lang=$matches[1]&pagename=$matches[2]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:28:\"(vi|en)/(.?.+?)/trackback/?$\";s:52:\"index.php?lang=$matches[1]&pagename=$matches[2]&tb=1\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:48:\"(vi|en)/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&feed=$matches[3]\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:43:\"(vi|en)/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&feed=$matches[3]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:36:\"(vi|en)/(.?.+?)/page/?([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&pagename=$matches[2]&paged=$matches[3]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:43:\"(vi|en)/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&pagename=$matches[2]&cpage=$matches[3]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:32:\"(vi|en)/(.?.+?)(?:/([0-9]+))?/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&page=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:35:\"(vi|en)/[^/]+/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"(vi|en)/[^/]+/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"(vi|en)/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(vi|en)/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(vi|en)/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"(vi|en)/[^/]+/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"(vi|en)/([^/]+)/embed/?$\";s:54:\"index.php?lang=$matches[1]&name=$matches[2]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:28:\"(vi|en)/([^/]+)/trackback/?$\";s:48:\"index.php?lang=$matches[1]&name=$matches[2]&tb=1\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:48:\"(vi|en)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:43:\"(vi|en)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:36:\"(vi|en)/([^/]+)/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&name=$matches[2]&paged=$matches[3]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:43:\"(vi|en)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&name=$matches[2]&cpage=$matches[3]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:32:\"(vi|en)/([^/]+)(?:/([0-9]+))?/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&page=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:24:\"(vi|en)/[^/]+/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"(vi|en)/[^/]+/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"(vi|en)/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"(vi|en)/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"(vi|en)/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"(vi|en)/[^/]+/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'auto'),
(1305, 'action_scheduler_hybrid_store_demarkation', '164', 'auto'),
(1306, 'schema-ActionScheduler_StoreSchema', '8.0.1753238491', 'auto'),
(1307, 'schema-ActionScheduler_LoggerSchema', '3.0.1727686251', 'auto'),
(1308, 'rank_math_known_post_types', 'a:4:{s:4:\"post\";s:4:\"post\";s:4:\"page\";s:4:\"page\";s:10:\"attachment\";s:10:\"attachment\";s:4:\"blog\";s:4:\"blog\";}', 'auto'),
(1309, 'rank_math_modules', 'a:12:{i:0;s:12:\"link-counter\";i:1;s:9:\"analytics\";i:2;s:12:\"seo-analysis\";i:3;s:7:\"sitemap\";i:4;s:12:\"rich-snippet\";i:5;s:11:\"woocommerce\";i:6;s:10:\"buddypress\";i:7;s:7:\"bbpress\";i:8;s:3:\"acf\";i:9;s:11:\"web-stories\";i:11;s:16:\"instant-indexing\";i:12;s:9:\"local-seo\";}', 'auto'),
(1310, 'rank-math-options-general', 'a:53:{s:19:\"strip_category_base\";s:3:\"off\";s:24:\"attachment_redirect_urls\";s:2:\"on\";s:27:\"attachment_redirect_default\";s:24:\"http://aiot-fixing.local\";s:23:\"nofollow_external_links\";s:2:\"on\";s:20:\"nofollow_image_links\";s:3:\"off\";s:25:\"new_window_external_links\";s:2:\"on\";s:11:\"add_img_alt\";s:3:\"off\";s:14:\"img_alt_format\";s:11:\" %filename%\";s:13:\"add_img_title\";s:3:\"off\";s:16:\"img_title_format\";s:22:\"%title% %count(title)%\";s:11:\"breadcrumbs\";s:2:\"on\";s:21:\"breadcrumbs_separator\";s:7:\"&ndash;\";s:16:\"breadcrumbs_home\";s:2:\"on\";s:22:\"breadcrumbs_home_label\";s:3:\"TOP\";s:26:\"breadcrumbs_archive_format\";s:15:\"Archives for %s\";s:25:\"breadcrumbs_search_format\";s:14:\"Results for %s\";s:21:\"breadcrumbs_404_label\";s:25:\"404 Error: page not found\";s:31:\"breadcrumbs_ancestor_categories\";s:3:\"off\";s:21:\"breadcrumbs_blog_page\";s:3:\"off\";s:16:\"404_monitor_mode\";s:6:\"simple\";s:17:\"404_monitor_limit\";i:100;s:35:\"404_monitor_ignore_query_parameters\";s:2:\"on\";s:24:\"redirections_header_code\";s:3:\"301\";s:18:\"redirections_debug\";s:3:\"off\";s:23:\"console_caching_control\";s:2:\"90\";s:21:\"console_email_reports\";b:0;s:23:\"console_email_frequency\";s:7:\"monthly\";s:27:\"link_builder_links_per_page\";s:1:\"7\";s:29:\"link_builder_links_per_target\";s:1:\"1\";s:22:\"wc_remove_product_base\";s:3:\"off\";s:23:\"wc_remove_category_base\";s:3:\"off\";s:31:\"wc_remove_category_parent_slugs\";s:3:\"off\";s:19:\"wc_remove_generator\";s:2:\"on\";s:24:\"remove_shop_snippet_data\";s:2:\"on\";s:18:\"frontend_seo_score\";s:3:\"off\";s:29:\"frontend_seo_score_post_types\";a:1:{i:0;s:4:\"post\";}s:27:\"frontend_seo_score_position\";s:3:\"top\";s:10:\"setup_mode\";s:8:\"advanced\";s:21:\"content_ai_post_types\";a:3:{i:0;s:4:\"post\";i:1;s:4:\"page\";i:2;s:4:\"blog\";}s:18:\"content_ai_country\";s:3:\"all\";s:15:\"content_ai_tone\";s:6:\"Formal\";s:19:\"content_ai_audience\";s:16:\"General Audience\";s:19:\"content_ai_language\";s:10:\"US English\";s:15:\"analytics_stats\";s:2:\"on\";s:15:\"toc_block_title\";s:17:\"Table of Contents\";s:20:\"toc_block_list_style\";s:2:\"ul\";s:21:\"breadcrumbs_home_link\";s:24:\"http://aiot-fixing.local\";s:29:\"breadcrumbs_remove_post_title\";s:3:\"off\";s:30:\"breadcrumbs_hide_taxonomy_name\";s:3:\"off\";s:16:\"headless_support\";s:3:\"off\";s:27:\"frontend_seo_score_template\";s:6:\"circle\";s:17:\"support_rank_math\";s:2:\"on\";s:15:\"llms_post_types\";a:3:{i:0;s:4:\"post\";i:1;s:4:\"page\";i:2;s:4:\"blog\";}}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1311, 'rank-math-options-titles', 'a:137:{s:24:\"noindex_empty_taxonomies\";s:2:\"on\";s:15:\"title_separator\";s:1:\"-\";s:17:\"capitalize_titles\";s:3:\"off\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:19:\"knowledgegraph_type\";s:7:\"company\";s:19:\"knowledgegraph_name\";s:9:\"AIoT Inc.\";s:12:\"website_name\";s:21:\"AIoT - Happy Together\";s:19:\"local_business_type\";s:12:\"Organization\";s:20:\"local_address_format\";s:43:\"{address} {locality}, {region} {postalcode}\";s:13:\"opening_hours\";a:7:{i:0;a:2:{s:3:\"day\";s:6:\"Monday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:1;a:2:{s:3:\"day\";s:7:\"Tuesday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:2;a:2:{s:3:\"day\";s:9:\"Wednesday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:3;a:2:{s:3:\"day\";s:8:\"Thursday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:4;a:2:{s:3:\"day\";s:6:\"Friday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:5;a:2:{s:3:\"day\";s:8:\"Saturday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:6;a:2:{s:3:\"day\";s:6:\"Sunday\";s:4:\"time\";s:11:\"09:00-17:00\";}}s:20:\"opening_hours_format\";s:3:\"off\";s:14:\"homepage_title\";s:34:\"%sitename% %page% %sep% %sitedesc%\";s:20:\"homepage_description\";s:0:\"\";s:22:\"homepage_custom_robots\";s:3:\"off\";s:23:\"disable_author_archives\";s:3:\"off\";s:15:\"url_author_base\";s:6:\"author\";s:20:\"author_custom_robots\";s:2:\"on\";s:13:\"author_robots\";a:1:{i:0;s:7:\"noindex\";}s:20:\"author_archive_title\";s:30:\"%name% %sep% %sitename% %page%\";s:19:\"author_add_meta_box\";s:2:\"on\";s:21:\"disable_date_archives\";s:2:\"on\";s:18:\"date_archive_title\";s:30:\"%date% %page% %sep% %sitename%\";s:12:\"search_title\";s:38:\"%search_query% %page% %sep% %sitename%\";s:9:\"404_title\";s:31:\"Page Not Found %sep% %sitename%\";s:19:\"date_archive_robots\";a:1:{i:0;s:7:\"noindex\";}s:14:\"noindex_search\";s:2:\"on\";s:24:\"noindex_archive_subpages\";s:3:\"off\";s:26:\"noindex_password_protected\";s:3:\"off\";s:32:\"pt_download_default_rich_snippet\";s:7:\"product\";s:29:\"author_slack_enhanced_sharing\";s:2:\"on\";s:13:\"pt_post_title\";s:24:\"%title% %sep% %sitename%\";s:19:\"pt_post_description\";s:9:\"%excerpt%\";s:14:\"pt_post_robots\";a:0:{}s:21:\"pt_post_custom_robots\";s:3:\"off\";s:28:\"pt_post_default_rich_snippet\";s:7:\"article\";s:28:\"pt_post_default_article_type\";s:11:\"BlogPosting\";s:28:\"pt_post_default_snippet_name\";s:11:\"%seo_title%\";s:28:\"pt_post_default_snippet_desc\";s:17:\"%seo_description%\";s:30:\"pt_post_slack_enhanced_sharing\";s:2:\"on\";s:17:\"pt_post_ls_use_fk\";s:6:\"titles\";s:20:\"pt_post_add_meta_box\";s:2:\"on\";s:20:\"pt_post_bulk_editing\";s:7:\"editing\";s:24:\"pt_post_link_suggestions\";s:2:\"on\";s:24:\"pt_post_primary_taxonomy\";s:8:\"category\";s:13:\"pt_page_title\";s:24:\"%title% %sep% %sitename%\";s:19:\"pt_page_description\";s:9:\"%excerpt%\";s:14:\"pt_page_robots\";a:0:{}s:21:\"pt_page_custom_robots\";s:3:\"off\";s:28:\"pt_page_default_rich_snippet\";s:7:\"article\";s:28:\"pt_page_default_article_type\";s:7:\"Article\";s:28:\"pt_page_default_snippet_name\";s:11:\"%seo_title%\";s:28:\"pt_page_default_snippet_desc\";s:17:\"%seo_description%\";s:30:\"pt_page_slack_enhanced_sharing\";s:2:\"on\";s:17:\"pt_page_ls_use_fk\";s:6:\"titles\";s:20:\"pt_page_add_meta_box\";s:2:\"on\";s:20:\"pt_page_bulk_editing\";s:7:\"editing\";s:24:\"pt_page_link_suggestions\";s:2:\"on\";s:19:\"pt_attachment_title\";s:24:\"%title% %sep% %sitename%\";s:25:\"pt_attachment_description\";s:9:\"%excerpt%\";s:20:\"pt_attachment_robots\";a:1:{i:0;s:7:\"noindex\";}s:27:\"pt_attachment_custom_robots\";s:2:\"on\";s:34:\"pt_attachment_default_rich_snippet\";s:3:\"off\";s:34:\"pt_attachment_default_article_type\";s:7:\"Article\";s:34:\"pt_attachment_default_snippet_name\";s:11:\"%seo_title%\";s:34:\"pt_attachment_default_snippet_desc\";s:17:\"%seo_description%\";s:36:\"pt_attachment_slack_enhanced_sharing\";s:3:\"off\";s:26:\"pt_attachment_add_meta_box\";s:3:\"off\";s:13:\"pt_blog_title\";s:24:\"%title% %sep% %sitename%\";s:19:\"pt_blog_description\";s:9:\"%excerpt%\";s:14:\"pt_blog_robots\";a:0:{}s:21:\"pt_blog_custom_robots\";s:3:\"off\";s:28:\"pt_blog_default_rich_snippet\";s:3:\"off\";s:28:\"pt_blog_default_article_type\";s:7:\"Article\";s:28:\"pt_blog_default_snippet_name\";s:11:\"%seo_title%\";s:28:\"pt_blog_default_snippet_desc\";s:17:\"%seo_description%\";s:21:\"pt_blog_archive_title\";s:31:\"%title% %page% %sep% %sitename%\";s:30:\"pt_blog_slack_enhanced_sharing\";s:3:\"off\";s:17:\"pt_blog_ls_use_fk\";s:6:\"titles\";s:20:\"pt_blog_add_meta_box\";s:2:\"on\";s:20:\"pt_blog_bulk_editing\";s:7:\"editing\";s:24:\"pt_blog_link_suggestions\";s:2:\"on\";s:16:\"pt_product_title\";s:24:\"%title% %sep% %sitename%\";s:22:\"pt_product_description\";s:9:\"%excerpt%\";s:17:\"pt_product_robots\";a:0:{}s:24:\"pt_product_custom_robots\";s:3:\"off\";s:31:\"pt_product_default_rich_snippet\";s:7:\"product\";s:31:\"pt_product_default_article_type\";s:7:\"Article\";s:31:\"pt_product_default_snippet_name\";s:11:\"%seo_title%\";s:31:\"pt_product_default_snippet_desc\";s:17:\"%seo_description%\";s:33:\"pt_product_slack_enhanced_sharing\";s:2:\"on\";s:20:\"pt_product_ls_use_fk\";s:6:\"titles\";s:23:\"pt_product_add_meta_box\";s:2:\"on\";s:23:\"pt_product_bulk_editing\";s:7:\"editing\";s:27:\"pt_product_link_suggestions\";s:2:\"on\";s:27:\"pt_product_primary_taxonomy\";s:11:\"product_cat\";s:18:\"pt_web-story_title\";s:24:\"%title% %sep% %sitename%\";s:24:\"pt_web-story_description\";s:9:\"%excerpt%\";s:19:\"pt_web-story_robots\";a:0:{}s:26:\"pt_web-story_custom_robots\";s:3:\"off\";s:33:\"pt_web-story_default_rich_snippet\";s:7:\"article\";s:33:\"pt_web-story_default_article_type\";s:7:\"Article\";s:33:\"pt_web-story_default_snippet_name\";s:11:\"%seo_title%\";s:33:\"pt_web-story_default_snippet_desc\";s:17:\"%seo_description%\";s:35:\"pt_web-story_slack_enhanced_sharing\";s:3:\"off\";s:25:\"pt_web-story_add_meta_box\";s:3:\"off\";s:18:\"tax_category_title\";s:23:\"%term% %sep% %sitename%\";s:19:\"tax_category_robots\";a:0:{}s:25:\"tax_category_add_meta_box\";s:2:\"on\";s:26:\"tax_category_custom_robots\";s:3:\"off\";s:24:\"tax_category_description\";s:18:\"%term_description%\";s:35:\"tax_category_slack_enhanced_sharing\";s:2:\"on\";s:18:\"tax_post_tag_title\";s:23:\"%term% %sep% %sitename%\";s:19:\"tax_post_tag_robots\";a:1:{i:0;s:7:\"noindex\";}s:25:\"tax_post_tag_add_meta_box\";s:2:\"on\";s:26:\"tax_post_tag_custom_robots\";s:2:\"on\";s:24:\"tax_post_tag_description\";s:18:\"%term_description%\";s:35:\"tax_post_tag_slack_enhanced_sharing\";s:2:\"on\";s:18:\"tax_blog_cat_title\";s:23:\"%term% %sep% %sitename%\";s:19:\"tax_blog_cat_robots\";a:0:{}s:25:\"tax_blog_cat_add_meta_box\";s:2:\"on\";s:26:\"tax_blog_cat_custom_robots\";s:3:\"off\";s:24:\"tax_blog_cat_description\";s:18:\"%term_description%\";s:35:\"tax_blog_cat_slack_enhanced_sharing\";s:2:\"on\";s:19:\"tax_blog_tags_title\";s:23:\"%term% %sep% %sitename%\";s:20:\"tax_blog_tags_robots\";a:0:{}s:26:\"tax_blog_tags_add_meta_box\";s:2:\"on\";s:27:\"tax_blog_tags_custom_robots\";s:3:\"off\";s:25:\"tax_blog_tags_description\";s:18:\"%term_description%\";s:36:\"tax_blog_tags_slack_enhanced_sharing\";s:2:\"on\";s:31:\"remove_product_cat_snippet_data\";s:2:\"on\";s:31:\"remove_product_tag_snippet_data\";s:2:\"on\";s:19:\"knowledgegraph_logo\";s:111:\"http://aiot-fixing.local/wp-content/uploads/2024/09/202409271240-cropped-202409271027-AIOT-LOGO-1024x1024-1.png\";s:22:\"knowledgegraph_logo_id\";s:2:\"95\";s:22:\"website_alternate_name\";s:21:\"AIoT - Happy Together\";s:16:\"open_graph_image\";s:87:\"http://aiot-fixing.local/wp-content/uploads/2024/09/202409301351-AIoT-facebook-post.png\";s:19:\"open_graph_image_id\";s:3:\"164\";s:28:\"tax_post_format_add_meta_box\";s:2:\"on\";}', 'auto'),
(1312, 'rank-math-options-sitemap', 'a:19:{s:14:\"items_per_page\";i:200;s:14:\"include_images\";s:2:\"on\";s:22:\"include_featured_image\";s:3:\"off\";s:13:\"exclude_roles\";a:3:{i:0;s:11:\"contributor\";i:1;s:10:\"subscriber\";i:2;s:10:\"translator\";}s:12:\"html_sitemap\";s:2:\"on\";s:20:\"html_sitemap_display\";s:9:\"shortcode\";s:17:\"html_sitemap_sort\";s:9:\"published\";s:23:\"html_sitemap_seo_titles\";s:6:\"titles\";s:15:\"authors_sitemap\";s:2:\"on\";s:15:\"pt_post_sitemap\";s:2:\"on\";s:15:\"pt_page_sitemap\";s:2:\"on\";s:21:\"pt_attachment_sitemap\";s:3:\"off\";s:15:\"pt_blog_sitemap\";s:2:\"on\";s:18:\"pt_product_sitemap\";s:2:\"on\";s:20:\"pt_web-story_sitemap\";s:3:\"off\";s:20:\"tax_category_sitemap\";s:2:\"on\";s:20:\"tax_post_tag_sitemap\";s:3:\"off\";s:20:\"tax_blog_cat_sitemap\";s:2:\"on\";s:21:\"tax_blog_tags_sitemap\";s:2:\"on\";}', 'auto'),
(1313, 'rank-math-options-instant-indexing', 'a:2:{s:15:\"bing_post_types\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:16:\"indexnow_api_key\";s:32:\"b9bab1f83ab444989a21bd4768f5d143\";}', 'auto'),
(1316, 'rank_math_version', '1.0.254', 'off'),
(1317, 'rank_math_db_version', '1', 'auto'),
(1318, 'rank_math_install_date', '1727718651', 'auto'),
(1320, 'action_scheduler_lock_async-request-runner', '68df7c747c0972.21848559|1759476912', 'no'),
(1326, 'rank_math_registration_skip', '1', 'auto'),
(1329, 'rank_math_viewed_seo_analyer', '1', 'off'),
(1330, 'rank_math_review_posts_converted', '1', 'auto'),
(1333, 'rank_math_wizard_completed', '1', 'off'),
(1335, 'rank_math_google_analytic_profile', 'a:3:{s:7:\"country\";b:0;s:7:\"profile\";b:0;s:19:\"enable_index_status\";b:0;}', 'auto'),
(1336, 'rank_math_google_analytic_options', 'a:11:{s:10:\"adsense_id\";b:0;s:10:\"account_id\";b:0;s:11:\"property_id\";b:0;s:7:\"view_id\";b:0;s:14:\"measurement_id\";b:0;s:11:\"stream_name\";b:0;s:7:\"country\";b:0;s:12:\"install_code\";b:0;s:12:\"anonymize_ip\";b:0;s:11:\"local_ga_js\";b:0;s:16:\"exclude_loggedin\";b:0;}', 'auto'),
(1337, 'rank_math_analytics_installed', '1', 'auto'),
(1342, 'rank_math_is_configured', '1', 'off'),
(2120, 'rank_math_content_ai_viewed', '1', 'off'),
(2122, 'rank_math_indexnow_log', 'a:100:{i:0;a:5:{s:3:\"url\";s:28:\"http://aiot-fixing.local/en/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733453334;}i:1;a:5:{s:3:\"url\";s:28:\"http://aiot-fixing.local/en/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733453482;}i:2;a:5:{s:3:\"url\";s:28:\"http://aiot-fixing.local/en/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733453697;}i:3;a:5:{s:3:\"url\";s:36:\"http://aiot-fixing.local/en/contact/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733453800;}i:4;a:5:{s:3:\"url\";s:59:\"http://aiot-fixing.local/en/business/dx-system-development/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733454135;}i:5;a:5:{s:3:\"url\";s:59:\"http://aiot-fixing.local/en/business/dx-system-development/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733454187;}i:6;a:5:{s:3:\"url\";s:50:\"http://aiot-fixing.local/en/business/bpo-services/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733454288;}i:7;a:5:{s:3:\"url\";s:71:\"http://aiot-fixing.local/en/business/corporate-strategy-and-ma-support/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733454433;}i:8;a:5:{s:3:\"url\";s:71:\"http://aiot-fixing.local/en/business/corporate-strategy-and-ma-support/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733454482;}i:9;a:5:{s:3:\"url\";s:63:\"http://aiot-fixing.local/en/business/vietnam-expansion-support/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733454579;}i:10;a:5:{s:3:\"url\";s:63:\"http://aiot-fixing.local/en/business/vietnam-expansion-support/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733454625;}i:11;a:5:{s:3:\"url\";s:28:\"http://aiot-fixing.local/en/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733454709;}i:12;a:5:{s:3:\"url\";s:53:\"http://aiot-fixing.local/en/company/message-from-ceo/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733455759;}i:13;a:5:{s:3:\"url\";s:53:\"http://aiot-fixing.local/en/company/message-from-ceo/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733455816;}i:14;a:5:{s:3:\"url\";s:53:\"http://aiot-fixing.local/en/company/message-from-ceo/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733455848;}i:15;a:5:{s:3:\"url\";s:53:\"http://aiot-fixing.local/en/company/message-from-ceo/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733455868;}i:16;a:5:{s:3:\"url\";s:36:\"http://aiot-fixing.local/en/contact/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733455929;}i:17;a:5:{s:3:\"url\";s:44:\"http://aiot-fixing.local/en/company/purpose/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733456150;}i:18;a:5:{s:3:\"url\";s:44:\"http://aiot-fixing.local/en/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733456517;}i:19;a:5:{s:3:\"url\";s:44:\"http://aiot-fixing.local/en/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733457527;}i:20;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733457577;}i:21;a:5:{s:3:\"url\";s:44:\"http://aiot-fixing.local/en/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733457706;}i:22;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733457786;}i:23;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733458433;}i:24;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733458439;}i:25;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733458524;}i:26;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733458632;}i:27;a:5:{s:3:\"url\";s:44:\"http://aiot-fixing.local/en/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733458825;}i:28;a:5:{s:3:\"url\";s:28:\"http://aiot-fixing.local/en/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733459529;}i:29;a:5:{s:3:\"url\";s:28:\"http://aiot-fixing.local/en/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733459655;}i:30;a:5:{s:3:\"url\";s:44:\"http://aiot-fixing.local/en/company/officer/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1733461207;}i:31;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/network/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1741746279;}i:32;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/network/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1741746318;}i:33;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/network/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1741746359;}i:34;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/child-page-aiot/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742182206;}i:35;a:5:{s:3:\"url\";s:129:\"http://aiot-fixing.local/aiot%e3%82%b7%e3%82%b9%e3%83%86%e3%83%a0%e9%96%8b%e7%99%ba%e3%82%ae%e3%83%a3%e3%83%a9%e3%83%aa%e3%83%bc/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742182218;}i:36;a:5:{s:3:\"url\";s:39:\"http://aiot-fixing.local/aiot-projects/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742182288;}i:37;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/child-page-aiot/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742182338;}i:38;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/child-page-aiot/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742182344;}i:39;a:5:{s:3:\"url\";s:55:\"http://aiot-fixing.local/aiot-projects/child-page-aiot/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742182411;}i:40;a:5:{s:3:\"url\";s:57:\"http://aiot-fixing.local/aiot-projects/child-page-aiot-2/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742182583;}i:41;a:5:{s:3:\"url\";s:42:\"http://aiot-fixing.local/en/aiot-projects/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742182727;}i:42;a:5:{s:3:\"url\";s:55:\"http://aiot-fixing.local/aiot-projects/child-page-aiot/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742183182;}i:43;a:5:{s:3:\"url\";s:57:\"http://aiot-fixing.local/aiot-projects/child-page-aiot-2/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742216686;}i:44;a:5:{s:3:\"url\";s:57:\"http://aiot-fixing.local/aiot-projects/child-page-aiot-2/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742216774;}i:45;a:5:{s:3:\"url\";s:112:\"http://aiot-fixing.local/aiot-projects/%e6%a9%8b%e6%a2%81%e7%ae%a1%e7%90%86%e3%82%b7%e3%82%b9%e3%83%86%e3%83%a0/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742217531;}i:46;a:5:{s:3:\"url\";s:175:\"http://aiot-fixing.local/aiot-projects/%e9%98%b2%e7%81%bd%e6%a5%ad%e5%8b%99%e6%94%af%e6%8f%b4%e3%83%9d%e3%83%bc%e3%82%bf%e3%83%ab%e3%82%b5%e3%82%a4%e3%83%88%e6%a7%8b%e7%af%89/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742265048;}i:47;a:5:{s:3:\"url\";s:85:\"http://aiot-fixing.local/aiot-projects/%e3%83%9e%e3%82%af%e3%83%ad%e4%bd%9c%e6%88%90/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742265342;}i:48;a:5:{s:3:\"url\";s:85:\"http://aiot-fixing.local/aiot-projects/%e3%83%9e%e3%82%af%e3%83%ad%e4%bd%9c%e6%88%90/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742265407;}i:49;a:5:{s:3:\"url\";s:85:\"http://aiot-fixing.local/aiot-projects/%e3%83%9e%e3%82%af%e3%83%ad%e4%bd%9c%e6%88%90/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742265432;}i:50;a:5:{s:3:\"url\";s:85:\"http://aiot-fixing.local/aiot-projects/%e3%83%9e%e3%82%af%e3%83%ad%e4%bd%9c%e6%88%90/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742265527;}i:51;a:5:{s:3:\"url\";s:85:\"http://aiot-fixing.local/aiot-projects/%e3%83%9e%e3%82%af%e3%83%ad%e4%bd%9c%e6%88%90/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742265561;}i:52;a:5:{s:3:\"url\";s:85:\"http://aiot-fixing.local/aiot-projects/%e3%83%9e%e3%82%af%e3%83%ad%e4%bd%9c%e6%88%90/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742265662;}i:53;a:5:{s:3:\"url\";s:85:\"http://aiot-fixing.local/aiot-projects/%e3%83%9e%e3%82%af%e3%83%ad%e4%bd%9c%e6%88%90/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1742265735;}i:54;a:5:{s:3:\"url\";s:221:\"http://aiot-fixing.local/%f0%9f%9a%80-%e4%b9%9d%e5%b7%9e%e3%81%ae%e6%97%85-%e3%83%86%e3%82%af%e3%83%8e%e3%83%ad%e3%82%b8%e3%83%bc%e3%81%a7%e6%8f%a1%e6%89%8b%e3%81%97%e3%80%81%e3%83%99%e3%83%88%e3%83%8a%e3%83%a0-%e6%97%a5/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1743476306;}i:55;a:5:{s:3:\"url\";s:54:\"http://aiot-fixing.local/kyushu-journey-vietnam-japan/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1743476917;}i:56;a:5:{s:3:\"url\";s:54:\"http://aiot-fixing.local/kyushu-journey-vietnam-japan/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1743477054;}i:57;a:5:{s:3:\"url\";s:54:\"http://aiot-fixing.local/kyushu-journey-vietnam-japan/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1743477275;}i:58;a:5:{s:3:\"url\";s:39:\"http://aiot-fixing.local/privacypolicy/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1750293907;}i:59;a:5:{s:3:\"url\";s:39:\"http://aiot-fixing.local/privacypolicy/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1750294035;}i:60;a:5:{s:3:\"url\";s:43:\"http://aiot-fixing.local/en/privacy-policy/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1750294935;}i:61;a:5:{s:3:\"url\";s:40:\"http://aiot-fixing.local/privacy-policy/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1750295019;}i:62;a:5:{s:3:\"url\";s:50:\"http://aiot-fixing.local/company/message-from-ceo/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753243037;}i:63;a:5:{s:3:\"url\";s:50:\"http://aiot-fixing.local/company/message-from-ceo/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753243135;}i:64;a:5:{s:3:\"url\";s:50:\"http://aiot-fixing.local/company/message-from-ceo/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753243841;}i:65;a:5:{s:3:\"url\";s:50:\"http://aiot-fixing.local/company/message-from-ceo/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753246730;}i:66;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753247109;}i:67;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753247124;}i:68;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753247137;}i:69;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/officer/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753255982;}i:70;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/history/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753257551;}i:71;a:5:{s:3:\"url\";s:43:\"http://aiot-fixing.local/company/portfolio/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753272850;}i:72;a:5:{s:3:\"url\";s:43:\"http://aiot-fixing.local/company/portfolio/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753272860;}i:73;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/history/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:1;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753272968;}i:74;a:5:{s:3:\"url\";s:43:\"http://aiot-fixing.local/company/portfolio/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753273023;}i:75;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/history/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753273032;}i:76;a:5:{s:3:\"url\";s:43:\"http://aiot-fixing.local/company/portfolio/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753273136;}i:77;a:5:{s:3:\"url\";s:43:\"http://aiot-fixing.local/company/portfolio/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753273584;}i:78;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/network/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753276168;}i:79;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753425702;}i:80;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753425771;}i:81;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/network/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753425940;}i:82;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/network/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753426081;}i:83;a:5:{s:3:\"url\";s:44:\"http://aiot-fixing.local/en/company/outline/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753427596;}i:84;a:5:{s:3:\"url\";s:44:\"http://aiot-fixing.local/en/company/officer/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753427821;}i:85;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/history/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753429035;}i:86;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/history/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753429276;}i:87;a:5:{s:3:\"url\";s:43:\"http://aiot-fixing.local/company/portfolio/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753429403;}i:88;a:5:{s:3:\"url\";s:25:\"http://aiot-fixing.local/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1753430167;}i:89;a:5:{s:3:\"url\";s:211:\"http://aiot-fixing.local/company-trip-2025-we-are-family-%e7%b5%86%e3%82%92%e6%b7%b1%e3%82%81%e3%80%81%e3%82%a8%e3%83%8d%e3%83%ab%e3%82%ae%e3%83%bc%e3%82%92%e5%88%86%e3%81%8b%e3%81%a1%e5%90%88%e3%81%86%e6%97%85/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1755069413;}i:90;a:5:{s:3:\"url\";s:43:\"http://aiot-fixing.local/company-trip-2025/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1755069448;}i:91;a:5:{s:3:\"url\";s:43:\"http://aiot-fixing.local/company-trip-2025/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1755069474;}i:92;a:5:{s:3:\"url\";s:43:\"http://aiot-fixing.local/company-trip-2025/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1755069847;}i:93;a:5:{s:3:\"url\";s:40:\"http://aiot-fixing.local/securitypolicy/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1755674583;}i:94;a:5:{s:3:\"url\";s:40:\"http://aiot-fixing.local/securitypolicy/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1755674697;}i:95;a:5:{s:3:\"url\";s:40:\"http://aiot-fixing.local/securitypolicy/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1755674777;}i:96;a:5:{s:3:\"url\";s:40:\"http://aiot-fixing.local/securitypolicy/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1755674859;}i:97;a:5:{s:3:\"url\";s:40:\"http://aiot-fixing.local/securitypolicy/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1755674908;}i:98;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/officer/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1755844999;}i:99;a:5:{s:3:\"url\";s:41:\"http://aiot-fixing.local/company/officer/\";s:6:\"status\";i:200;s:17:\"manual_submission\";b:0;s:7:\"message\";s:2:\"OK\";s:4:\"time\";i:1758599385;}}', 'off'),
(3022, 'wp_calendar_block_has_published_posts', '1', 'auto'),
(3314, '_logoja', '101', 'off'),
(3315, '_footer_logoja', '101', 'off'),
(3316, '_hinh_anh_mac_dinhja', '101', 'off'),
(3317, '_companyja', 'AIoT株式会社', 'off'),
(3318, '_addressja', '東京都中央区京橋1-1-5　セントラルビル2階', 'off'),
(3319, '_googlemapja', 'https://maps.app.goo.gl/brctsHg28cdpaKtk9', 'off'),
(3320, '_emailja', 'info@aiot-fixing.local', 'off'),
(3321, '_phone_numberja', '03-4500-6968', 'off'),
(3322, '_hour_workingja', '月~金 9:00~18:00', 'off'),
(3323, '_facebookja', 'https://facebook.com/', 'off'),
(3324, '_instagramja', 'https://instagram.com/', 'off'),
(3325, '_twitterja', 'https://twitter.com/', 'off'),
(3326, '_contact_labelja', 'お問合せ', 'off'),
(3327, '_contact_urlja', '/contact/', 'off'),
(3328, '_contact_messageja', 'お仕事のご相談やお見積、詳しいご相談をされたい方はこちら\r\n', 'off'),
(3349, '_logoen', '101', 'off'),
(3350, '_footer_logoen', '101', 'off'),
(3351, '_hinh_anh_mac_dinhen', '101', 'off'),
(3352, '_companyen', 'AIOT Inc.', 'off'),
(3353, '_addressen', 'Tokyo, Chuo, Kyobashi 1-1-4 Central Building 2F', 'off'),
(3354, '_googlemapen', 'https://maps.app.goo.gl/brctsHg28cdpaKtk9', 'off'),
(3355, '_emailen', 'info@aiot-fixing.local', 'off'),
(3356, '_phone_numberen', '03-4500-6968', 'off'),
(3357, '_hour_workingen', 'Monday - Friday (9:00am - 18:00pm)', 'off'),
(3358, '_facebooken', 'https://facebook.com/', 'off'),
(3359, '_instagramen', 'https://instagram.com/', 'off'),
(3360, '_twitteren', 'https://twitter.com/?lang=vi', 'off'),
(3361, '_contact_labelen', 'Contact Us', 'off'),
(3362, '_contact_urlen', '/contact/', 'off'),
(3363, '_contact_messageen', 'If you would like to discuss your job, get a quote, or need more information, please click here.', 'off'),
(3364, '_crb_header_script', '', 'off'),
(3365, '_crb_footer_script', '', 'off'),
(5943, 'lpb_pro-redirect', '1', 'auto'),
(6630, 'wp_db_backup_destination_SFTP', '0', 'off'),
(6631, 'wp_db_backup_destination_FTP', '0', 'off'),
(6632, 'wp_db_backup_destination_Email', '0', 'off'),
(6633, 'wp_db_backup_destination_s3', '0', 'off'),
(6634, 'wp_db_remove_local_backup', '0', 'off'),
(6635, 'wp_db_remove_on_uninstall', '0', 'off'),
(6636, 'wp_db_backup_backup_type', 'complete', 'off'),
(6637, 'wp_db_backup_exclude_dir', 'wp-content/backupwordpress-728d36f682-backups|.git|db-backup', 'off'),
(6638, 'wp_db_backup_backups_dir', 'db-backup', 'off'),
(6639, 'bb_last_backup_timestamp', '0', 'off'),
(6640, 'wp_db_backup_sftp_details', '', 'off'),
(6643, 'wp_db_local_backup_path', '', 'auto'),
(6644, 'wp_db_local_backup', '1', 'off'),
(6645, 'wp_db_backup_backups', 'a:0:{}', 'off'),
(6646, 'wp_db_backup_options', '', 'auto'),
(16368, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:22:\"info@aiot-fixing.local\";s:7:\"version\";s:5:\"6.8.2\";s:9:\"timestamp\";i:1752617794;}', 'off'),
(24618, 'rpm-wpc-puFirst_real-media-library-lite', '1733804140', 'auto'),
(24619, 'rpm-wpc-announcements-active_real-media-library-lite', '1', 'auto'),
(24620, 'rml_cqs', '2', 'on'),
(24621, 'rml_db_version', 'a:2:{s:7:\"version\";s:7:\"4.22.47\";s:13:\"invalidateKey\";a:0:{}}', 'auto'),
(24622, 'real_utils-transients', '{\"RML\":{\"raa\":true,\"nr\":1736396140}}', 'off'),
(24625, 'rpm-wpc-licenseDeferredLicenseActivation_real-media-library-lite', '1', 'on'),
(24626, 'rpm-wpc-licenseDeferredLicenseActivation_real-media-library-lite-expire', '1753330748', 'on'),
(24627, 'rml_load_frontend', '1', 'auto'),
(24628, 'rml_liteDismissed-expire', '1736396140', 'on'),
(24629, 'rml_liteDismissed', '', 'on'),
(24632, 'rml_importTaxNotice-expire', '1765340316', 'on'),
(24633, 'rml_importTaxNotice', '', 'on'),
(24635, 'rpm-wpc-code_real-media-library-lite', '29b001e4-81f1-4dc4-a75a-8e19ae23cacd', 'auto'),
(24636, 'rpm-wpc-uuid_real-media-library-lite', 'f275d29a-9d78-4087-bc36-fe3a22047e04', 'auto'),
(24637, 'rpm-wpc-hostname_real-media-library-lite', 'YWlvdC1nbG9iYWwuY29t', 'auto'),
(24638, 'rpm-wpc-telemetry_real-media-library-lite', '0', 'auto'),
(24639, 'rpm-wpc-installationType_real-media-library-lite', 'production', 'auto'),
(24640, 'rpm-wpc-noUsage_real-media-library-lite', '0', 'auto'),
(24641, 'rpm-wpc-licenseActivation_real-media-library-lite', 'a:10:{s:2:\"id\";i:442833;s:7:\"license\";a:10:{s:2:\"id\";i:394246;s:14:\"productVariant\";a:5:{s:2:\"id\";i:4;s:4:\"slug\";s:23:\"real-media-library-lite\";s:4:\"name\";s:18:\"Real Media Library\";s:13:\"isFreeProduct\";b:1;s:6:\"status\";s:6:\"active\";}s:10:\"licenseKey\";s:36:\"29b001e4-81f1-4dc4-a75a-8e19ae23cacd\";s:26:\"maxInstallationsProduction\";i:1;s:27:\"maxInstallationsDevelopment\";i:0;s:10:\"validUntil\";N;s:12:\"supportUntil\";N;s:9:\"isRevoked\";b:0;s:9:\"createdBy\";s:3:\"api\";s:9:\"createdAt\";s:10:\"2024-12-10\";}s:6:\"client\";a:4:{s:2:\"id\";i:414374;s:4:\"uuid\";s:36:\"f275d29a-9d78-4087-bc36-fe3a22047e04\";s:9:\"createdAt\";s:24:\"2024-12-10T04:19:08.000Z\";s:10:\"properties\";a:5:{i:0;a:3:{s:2:\"id\";i:532176964;s:3:\"key\";s:8:\"hostname\";s:5:\"value\";s:15:\"aiot-global.com\";}i:1;a:3:{s:2:\"id\";i:532176965;s:3:\"key\";s:9:\"wpVersion\";s:5:\"value\";s:5:\"6.8.2\";}i:2;a:3:{s:2:\"id\";i:532176966;s:3:\"key\";s:10:\"wpLanguage\";s:5:\"value\";s:2:\"ja\";}i:3;a:3:{s:2:\"id\";i:532176967;s:3:\"key\";s:10:\"phpVersion\";s:5:\"value\";s:6:\"7.4.33\";}i:4;a:3:{s:2:\"id\";i:532176968;s:3:\"key\";s:8:\"lastSeen\";s:5:\"value\";s:24:\"2025-07-22T04:21:59.420Z\";}}}s:4:\"type\";s:10:\"production\";s:6:\"status\";s:9:\"activated\";s:11:\"activatedAt\";s:24:\"2024-12-10T04:19:08.000Z\";s:13:\"deactivatedAt\";N;s:25:\"telemetryDataSharingOptIn\";b:0;s:15:\"newsletterOptIn\";b:0;s:10:\"properties\";a:1:{i:0;a:3:{s:2:\"id\";i:11282361;s:3:\"key\";s:13:\"pluginVersion\";s:5:\"value\";s:7:\"4.22.47\";}}}', 'auto'),
(24642, 'rpm-wpc-announcements_real-media-library-lite-expire', '1753335381', 'on'),
(24643, 'rpm-wpc-announcements_real-media-library-lite', 'a:3:{s:5:\"items\";a:0:{}s:6:\"viewed\";a:0:{}s:9:\"dismissed\";a:0:{}}', 'on'),
(24666, 'redirection_options', 'a:32:{s:7:\"support\";b:0;s:5:\"token\";s:32:\"871ee747b9a0f18620d57b4cb8fd777e\";s:12:\"monitor_post\";i:1;s:13:\"monitor_types\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:19:\"associated_redirect\";s:0:\"\";s:11:\"auto_target\";s:0:\"\";s:15:\"expire_redirect\";i:-1;s:10:\"expire_404\";i:-1;s:12:\"log_external\";b:0;s:10:\"log_header\";b:0;s:10:\"track_hits\";b:1;s:7:\"modules\";a:0:{}s:14:\"redirect_cache\";i:1;s:10:\"ip_logging\";i:0;s:10:\"ip_headers\";a:0:{}s:8:\"ip_proxy\";a:0:{}s:13:\"last_group_id\";i:1;s:8:\"rest_api\";i:0;s:5:\"https\";b:0;s:7:\"headers\";a:0:{}s:8:\"database\";s:3:\"4.2\";s:8:\"relocate\";s:0:\"\";s:16:\"preferred_domain\";s:0:\"\";s:7:\"aliases\";a:0:{}s:10:\"permalinks\";a:0:{}s:9:\"cache_key\";i:0;s:13:\"plugin_update\";s:6:\"prompt\";s:13:\"update_notice\";i:0;s:10:\"flag_query\";s:5:\"exact\";s:9:\"flag_case\";b:1;s:13:\"flag_trailing\";b:1;s:10:\"flag_regex\";b:0;}', 'auto'),
(35733, 'rml_db_migration', '0', 'auto'),
(35734, 'rml_db_previous_version', 'a:6:{i:0;s:7:\"4.22.27\";i:1;s:7:\"4.22.28\";i:2;s:7:\"4.22.29\";i:3;s:7:\"4.22.38\";i:4;s:7:\"4.22.41\";i:5;s:7:\"4.22.44\";}', 'auto'),
(42611, 'rank_math_pro_notice_delayed', '1', 'off'),
(42613, 'rank_math_pro_notice_date', '1739810835', 'off'),
(42620, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"6.1.2\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1738914440;s:7:\"version\";s:5:\"6.0.3\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'auto'),
(42623, 'rank_math_review_notice_delayed', '1', 'off'),
(42624, 'rank_math_review_notice_date', '1740156587', 'off'),
(42625, 'rank_math_already_reviewed', '1738946987', 'auto'),
(42628, 'rank_math_notifications', 'a:1:{i:0;a:2:{s:7:\"message\";s:383:\"Rank Math has detected a new post type: <code>menu</code>. You may want to check the settings of the <a href=\"http://aiot-fixing.local/wp-admin/admin.php?page=rank-math-options-titles#setting-panel-post-type-menu\">Titles &amp; Meta page</a> and <a href=\"http://aiot-fixing.local/wp-admin/admin.php?page=rank-math-options-sitemap#setting-panel-sitemap-post-type-menu\">the Sitemap</a>.\";s:7:\"options\";a:5:{s:2:\"id\";s:13:\"new_post_type\";s:7:\"classes\";s:16:\"rank-math-notice\";s:4:\"type\";s:4:\"info\";s:6:\"screen\";s:3:\"any\";s:10:\"capability\";s:0:\"\";}}}', 'auto'),
(42640, 'as_has_wp_comment_logs', 'no', 'on'),
(46403, 'rank_math_pro_notice_added', '1', 'off'),
(62343, 'analyst_cache', 's:6:\"a:0:{}\";', 'auto'),
(62345, '_cdp_review', 'a:2:{s:9:\"installed\";i:1743478475;s:5:\"users\";a:0:{}}', 'auto'),
(62346, '_cdp_globals', 'a:1:{s:6:\"others\";a:14:{s:17:\"cdp-content-pages\";s:4:\"true\";s:17:\"cdp-content-posts\";s:4:\"true\";s:18:\"cdp-content-custom\";s:4:\"true\";s:17:\"cdp-display-posts\";s:4:\"true\";s:16:\"cdp-display-edit\";s:4:\"true\";s:17:\"cdp-display-admin\";s:4:\"true\";s:16:\"cdp-display-bulk\";s:4:\"true\";s:21:\"cdp-display-gutenberg\";s:4:\"true\";s:19:\"cdp-references-post\";s:5:\"false\";s:19:\"cdp-references-edit\";s:5:\"false\";s:18:\"cdp-premium-import\";s:5:\"false\";s:24:\"cdp-premium-hide-tooltip\";s:5:\"false\";s:26:\"cdp-premium-replace-domain\";s:5:\"false\";s:20:\"cdp-menu-in-settings\";s:5:\"false\";}}', 'auto'),
(62347, '_cdp_profiles', 'a:1:{s:7:\"default\";a:25:{s:5:\"title\";s:4:\"true\";s:4:\"date\";s:5:\"false\";s:6:\"status\";s:5:\"false\";s:4:\"slug\";s:4:\"true\";s:7:\"excerpt\";s:4:\"true\";s:7:\"content\";s:4:\"true\";s:7:\"f_image\";s:4:\"true\";s:8:\"template\";s:4:\"true\";s:6:\"format\";s:4:\"true\";s:6:\"author\";s:4:\"true\";s:8:\"password\";s:4:\"true\";s:11:\"attachments\";s:5:\"false\";s:8:\"children\";s:5:\"false\";s:8:\"comments\";s:5:\"false\";s:10:\"menu_order\";s:4:\"true\";s:8:\"category\";s:4:\"true\";s:8:\"post_tag\";s:4:\"true\";s:8:\"taxonomy\";s:4:\"true\";s:8:\"nav_menu\";s:4:\"true\";s:13:\"link_category\";s:4:\"true\";s:12:\"all_metadata\";s:5:\"false\";s:5:\"names\";a:5:{s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:10:\"#[Counter]\";s:6:\"format\";s:1:\"1\";s:6:\"custom\";s:5:\"m/d/Y\";s:7:\"display\";s:7:\"Default\";}s:9:\"usmplugin\";s:5:\"false\";s:5:\"yoast\";s:5:\"false\";s:3:\"woo\";s:5:\"false\";}}', 'auto'),
(62348, '_cdp_default_setup', '1', 'auto'),
(62349, '_irb_h_bn_review', 'a:2:{s:5:\"users\";a:0:{}s:17:\"copy-delete-posts\";i:1743478475;}', 'auto'),
(62350, '_tifm_force_disable_feature_update', '1', 'auto'),
(62354, 'analyst_accounts_data', 's:437:\"O:26:\"Account\\AccountDataFactory\":1:{s:11:\"\0*\0accounts\";a:1:{i:0;O:19:\"Account\\AccountData\":7:{s:5:\"\0*\0id\";s:16:\"ovgxe3xq075ladbp\";s:9:\"\0*\0secret\";s:40:\"b4de5ed2ba7be687e233d152ec1e8fd116052ab0\";s:7:\"\0*\0path\";s:113:\"/Users/anhd/Documents/wordpress/aiot-fixing/app/public/wp-content/plugins/copy-delete-posts/copy-delete-posts.php\";s:14:\"\0*\0isInstalled\";b:0;s:12:\"\0*\0isOptedIn\";b:0;s:11:\"\0*\0isSigned\";b:0;s:20:\"\0*\0isInstallResolved\";N;}}}\";', 'auto'),
(62365, 'duplicate_post_title_prefix', '', 'auto'),
(62366, 'duplicate_post_title_suffix', '', 'auto'),
(62367, 'duplicate_post_increase_menu_order_by', '', 'auto'),
(62368, 'duplicate_post_roles', 'a:2:{i:0;s:13:\"administrator\";i:1;s:6:\"editor\";}', 'auto'),
(104662, 'unique_id', '4d17d2d9c1d44d7cff483b649949b2cd', 'auto'),
(107411, 'real-media-library-lite_language_pack_error-real-media-library-expire', '1752154035', 'on'),
(107412, 'real-media-library-lite_language_pack_error-real-media-library', '', 'on'),
(112818, 'can_compress_scripts', '0', 'on'),
(113367, 'blog_cat_children', 'a:0:{}', 'auto'),
(114997, 'loco_theme_config__mooms_dev/theme', 'a:4:{s:1:\"c\";s:23:\"Loco_config_CustomSaved\";s:1:\"v\";i:0;s:1:\"d\";a:3:{i:0;s:6:\"bundle\";i:1;a:1:{s:4:\"name\";s:9:\"MOOMS.DEV\";}i:2;a:1:{i:0;a:3:{i:0;s:6:\"domain\";i:1;a:1:{s:4:\"name\";s:3:\"mms\";}i:2;a:1:{i:0;a:3:{i:0;s:7:\"project\";i:1;a:2:{s:4:\"name\";s:9:\"MOOMS.DEV\";s:4:\"slug\";s:3:\"mms\";}i:2;a:3:{i:0;a:3:{i:0;s:6:\"source\";i:1;a:0:{}i:2;a:1:{i:0;a:3:{i:0;s:9:\"directory\";i:1;a:0:{}i:2;a:1:{i:0;s:0:\"\";}}}}i:1;a:3:{i:0;s:6:\"target\";i:1;a:0:{}i:2;a:1:{i:0;a:3:{i:0;s:9:\"directory\";i:1;a:0:{}i:2;a:1:{i:0;s:0:\"\";}}}}i:2;a:3:{i:0;s:8:\"template\";i:1;a:0:{}i:2;a:1:{i:0;a:3:{i:0;s:4:\"file\";i:1;a:0:{}i:2;a:1:{i:0;s:23:\"theme/languages/mms.pot\";}}}}}}}}}}s:1:\"t\";i:1753432508;}', 'off'),
(117531, 'category_children', 'a:0:{}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(156327, 'rank_math_backups', 'a:1:{i:1758797791;a:5:{s:7:\"general\";a:53:{s:19:\"strip_category_base\";s:3:\"off\";s:24:\"attachment_redirect_urls\";s:2:\"on\";s:27:\"attachment_redirect_default\";s:24:\"http://aiot-fixing.local\";s:23:\"nofollow_external_links\";s:2:\"on\";s:20:\"nofollow_image_links\";s:3:\"off\";s:25:\"new_window_external_links\";s:2:\"on\";s:11:\"add_img_alt\";s:3:\"off\";s:14:\"img_alt_format\";s:11:\" %filename%\";s:13:\"add_img_title\";s:3:\"off\";s:16:\"img_title_format\";s:22:\"%title% %count(title)%\";s:11:\"breadcrumbs\";s:2:\"on\";s:21:\"breadcrumbs_separator\";s:1:\"-\";s:16:\"breadcrumbs_home\";s:2:\"on\";s:22:\"breadcrumbs_home_label\";s:4:\"Home\";s:26:\"breadcrumbs_archive_format\";s:15:\"Archives for %s\";s:25:\"breadcrumbs_search_format\";s:14:\"Results for %s\";s:21:\"breadcrumbs_404_label\";s:25:\"404 Error: page not found\";s:31:\"breadcrumbs_ancestor_categories\";s:3:\"off\";s:21:\"breadcrumbs_blog_page\";s:3:\"off\";s:16:\"404_monitor_mode\";s:6:\"simple\";s:17:\"404_monitor_limit\";i:100;s:35:\"404_monitor_ignore_query_parameters\";s:2:\"on\";s:24:\"redirections_header_code\";s:3:\"301\";s:18:\"redirections_debug\";s:3:\"off\";s:23:\"console_caching_control\";s:2:\"90\";s:21:\"console_email_reports\";b:0;s:23:\"console_email_frequency\";s:7:\"monthly\";s:27:\"link_builder_links_per_page\";s:1:\"7\";s:29:\"link_builder_links_per_target\";s:1:\"1\";s:22:\"wc_remove_product_base\";s:3:\"off\";s:23:\"wc_remove_category_base\";s:3:\"off\";s:31:\"wc_remove_category_parent_slugs\";s:3:\"off\";s:19:\"wc_remove_generator\";s:2:\"on\";s:24:\"remove_shop_snippet_data\";s:2:\"on\";s:18:\"frontend_seo_score\";s:3:\"off\";s:29:\"frontend_seo_score_post_types\";a:1:{i:0;s:4:\"post\";}s:27:\"frontend_seo_score_position\";s:3:\"top\";s:10:\"setup_mode\";s:8:\"advanced\";s:21:\"content_ai_post_types\";a:3:{i:0;s:4:\"post\";i:1;s:4:\"page\";i:2;s:4:\"blog\";}s:18:\"content_ai_country\";s:3:\"all\";s:15:\"content_ai_tone\";s:6:\"Formal\";s:19:\"content_ai_audience\";s:16:\"General Audience\";s:19:\"content_ai_language\";s:10:\"US English\";s:15:\"analytics_stats\";s:2:\"on\";s:15:\"toc_block_title\";s:17:\"Table of Contents\";s:20:\"toc_block_list_style\";s:2:\"ul\";s:21:\"breadcrumbs_home_link\";s:24:\"http://aiot-fixing.local\";s:29:\"breadcrumbs_remove_post_title\";s:3:\"off\";s:30:\"breadcrumbs_hide_taxonomy_name\";s:3:\"off\";s:16:\"headless_support\";s:3:\"off\";s:27:\"frontend_seo_score_template\";s:6:\"circle\";s:17:\"support_rank_math\";s:2:\"on\";s:15:\"llms_post_types\";a:3:{i:0;s:4:\"post\";i:1;s:4:\"page\";i:2;s:4:\"blog\";}}s:6:\"titles\";a:137:{s:24:\"noindex_empty_taxonomies\";s:2:\"on\";s:15:\"title_separator\";s:1:\"-\";s:17:\"capitalize_titles\";s:3:\"off\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:19:\"knowledgegraph_type\";s:7:\"company\";s:19:\"knowledgegraph_name\";s:9:\"AIoT Inc.\";s:12:\"website_name\";s:21:\"AIoT - Happy Together\";s:19:\"local_business_type\";s:12:\"Organization\";s:20:\"local_address_format\";s:43:\"{address} {locality}, {region} {postalcode}\";s:13:\"opening_hours\";a:7:{i:0;a:2:{s:3:\"day\";s:6:\"Monday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:1;a:2:{s:3:\"day\";s:7:\"Tuesday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:2;a:2:{s:3:\"day\";s:9:\"Wednesday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:3;a:2:{s:3:\"day\";s:8:\"Thursday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:4;a:2:{s:3:\"day\";s:6:\"Friday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:5;a:2:{s:3:\"day\";s:8:\"Saturday\";s:4:\"time\";s:11:\"09:00-17:00\";}i:6;a:2:{s:3:\"day\";s:6:\"Sunday\";s:4:\"time\";s:11:\"09:00-17:00\";}}s:20:\"opening_hours_format\";s:3:\"off\";s:14:\"homepage_title\";s:34:\"%sitename% %page% %sep% %sitedesc%\";s:20:\"homepage_description\";s:0:\"\";s:22:\"homepage_custom_robots\";s:3:\"off\";s:23:\"disable_author_archives\";s:3:\"off\";s:15:\"url_author_base\";s:6:\"author\";s:20:\"author_custom_robots\";s:2:\"on\";s:13:\"author_robots\";a:1:{i:0;s:7:\"noindex\";}s:20:\"author_archive_title\";s:30:\"%name% %sep% %sitename% %page%\";s:19:\"author_add_meta_box\";s:2:\"on\";s:21:\"disable_date_archives\";s:2:\"on\";s:18:\"date_archive_title\";s:30:\"%date% %page% %sep% %sitename%\";s:12:\"search_title\";s:38:\"%search_query% %page% %sep% %sitename%\";s:9:\"404_title\";s:31:\"Page Not Found %sep% %sitename%\";s:19:\"date_archive_robots\";a:1:{i:0;s:7:\"noindex\";}s:14:\"noindex_search\";s:2:\"on\";s:24:\"noindex_archive_subpages\";s:3:\"off\";s:26:\"noindex_password_protected\";s:3:\"off\";s:32:\"pt_download_default_rich_snippet\";s:7:\"product\";s:29:\"author_slack_enhanced_sharing\";s:2:\"on\";s:13:\"pt_post_title\";s:24:\"%title% %sep% %sitename%\";s:19:\"pt_post_description\";s:9:\"%excerpt%\";s:14:\"pt_post_robots\";a:0:{}s:21:\"pt_post_custom_robots\";s:3:\"off\";s:28:\"pt_post_default_rich_snippet\";s:7:\"article\";s:28:\"pt_post_default_article_type\";s:11:\"BlogPosting\";s:28:\"pt_post_default_snippet_name\";s:11:\"%seo_title%\";s:28:\"pt_post_default_snippet_desc\";s:17:\"%seo_description%\";s:30:\"pt_post_slack_enhanced_sharing\";s:2:\"on\";s:17:\"pt_post_ls_use_fk\";s:6:\"titles\";s:20:\"pt_post_add_meta_box\";s:2:\"on\";s:20:\"pt_post_bulk_editing\";s:7:\"editing\";s:24:\"pt_post_link_suggestions\";s:2:\"on\";s:24:\"pt_post_primary_taxonomy\";s:8:\"category\";s:13:\"pt_page_title\";s:24:\"%title% %sep% %sitename%\";s:19:\"pt_page_description\";s:9:\"%excerpt%\";s:14:\"pt_page_robots\";a:0:{}s:21:\"pt_page_custom_robots\";s:3:\"off\";s:28:\"pt_page_default_rich_snippet\";s:7:\"article\";s:28:\"pt_page_default_article_type\";s:7:\"Article\";s:28:\"pt_page_default_snippet_name\";s:11:\"%seo_title%\";s:28:\"pt_page_default_snippet_desc\";s:17:\"%seo_description%\";s:30:\"pt_page_slack_enhanced_sharing\";s:2:\"on\";s:17:\"pt_page_ls_use_fk\";s:6:\"titles\";s:20:\"pt_page_add_meta_box\";s:2:\"on\";s:20:\"pt_page_bulk_editing\";s:7:\"editing\";s:24:\"pt_page_link_suggestions\";s:2:\"on\";s:19:\"pt_attachment_title\";s:24:\"%title% %sep% %sitename%\";s:25:\"pt_attachment_description\";s:9:\"%excerpt%\";s:20:\"pt_attachment_robots\";a:1:{i:0;s:7:\"noindex\";}s:27:\"pt_attachment_custom_robots\";s:2:\"on\";s:34:\"pt_attachment_default_rich_snippet\";s:3:\"off\";s:34:\"pt_attachment_default_article_type\";s:7:\"Article\";s:34:\"pt_attachment_default_snippet_name\";s:11:\"%seo_title%\";s:34:\"pt_attachment_default_snippet_desc\";s:17:\"%seo_description%\";s:36:\"pt_attachment_slack_enhanced_sharing\";s:3:\"off\";s:26:\"pt_attachment_add_meta_box\";s:3:\"off\";s:13:\"pt_blog_title\";s:24:\"%title% %sep% %sitename%\";s:19:\"pt_blog_description\";s:9:\"%excerpt%\";s:14:\"pt_blog_robots\";a:0:{}s:21:\"pt_blog_custom_robots\";s:3:\"off\";s:28:\"pt_blog_default_rich_snippet\";s:3:\"off\";s:28:\"pt_blog_default_article_type\";s:7:\"Article\";s:28:\"pt_blog_default_snippet_name\";s:11:\"%seo_title%\";s:28:\"pt_blog_default_snippet_desc\";s:17:\"%seo_description%\";s:21:\"pt_blog_archive_title\";s:31:\"%title% %page% %sep% %sitename%\";s:30:\"pt_blog_slack_enhanced_sharing\";s:3:\"off\";s:17:\"pt_blog_ls_use_fk\";s:6:\"titles\";s:20:\"pt_blog_add_meta_box\";s:2:\"on\";s:20:\"pt_blog_bulk_editing\";s:7:\"editing\";s:24:\"pt_blog_link_suggestions\";s:2:\"on\";s:16:\"pt_product_title\";s:24:\"%title% %sep% %sitename%\";s:22:\"pt_product_description\";s:9:\"%excerpt%\";s:17:\"pt_product_robots\";a:0:{}s:24:\"pt_product_custom_robots\";s:3:\"off\";s:31:\"pt_product_default_rich_snippet\";s:7:\"product\";s:31:\"pt_product_default_article_type\";s:7:\"Article\";s:31:\"pt_product_default_snippet_name\";s:11:\"%seo_title%\";s:31:\"pt_product_default_snippet_desc\";s:17:\"%seo_description%\";s:33:\"pt_product_slack_enhanced_sharing\";s:2:\"on\";s:20:\"pt_product_ls_use_fk\";s:6:\"titles\";s:23:\"pt_product_add_meta_box\";s:2:\"on\";s:23:\"pt_product_bulk_editing\";s:7:\"editing\";s:27:\"pt_product_link_suggestions\";s:2:\"on\";s:27:\"pt_product_primary_taxonomy\";s:11:\"product_cat\";s:18:\"pt_web-story_title\";s:24:\"%title% %sep% %sitename%\";s:24:\"pt_web-story_description\";s:9:\"%excerpt%\";s:19:\"pt_web-story_robots\";a:0:{}s:26:\"pt_web-story_custom_robots\";s:3:\"off\";s:33:\"pt_web-story_default_rich_snippet\";s:7:\"article\";s:33:\"pt_web-story_default_article_type\";s:7:\"Article\";s:33:\"pt_web-story_default_snippet_name\";s:11:\"%seo_title%\";s:33:\"pt_web-story_default_snippet_desc\";s:17:\"%seo_description%\";s:35:\"pt_web-story_slack_enhanced_sharing\";s:3:\"off\";s:25:\"pt_web-story_add_meta_box\";s:3:\"off\";s:18:\"tax_category_title\";s:23:\"%term% %sep% %sitename%\";s:19:\"tax_category_robots\";a:0:{}s:25:\"tax_category_add_meta_box\";s:2:\"on\";s:26:\"tax_category_custom_robots\";s:3:\"off\";s:24:\"tax_category_description\";s:18:\"%term_description%\";s:35:\"tax_category_slack_enhanced_sharing\";s:2:\"on\";s:18:\"tax_post_tag_title\";s:23:\"%term% %sep% %sitename%\";s:19:\"tax_post_tag_robots\";a:1:{i:0;s:7:\"noindex\";}s:25:\"tax_post_tag_add_meta_box\";s:2:\"on\";s:26:\"tax_post_tag_custom_robots\";s:2:\"on\";s:24:\"tax_post_tag_description\";s:18:\"%term_description%\";s:35:\"tax_post_tag_slack_enhanced_sharing\";s:2:\"on\";s:18:\"tax_blog_cat_title\";s:23:\"%term% %sep% %sitename%\";s:19:\"tax_blog_cat_robots\";a:0:{}s:25:\"tax_blog_cat_add_meta_box\";s:2:\"on\";s:26:\"tax_blog_cat_custom_robots\";s:3:\"off\";s:24:\"tax_blog_cat_description\";s:18:\"%term_description%\";s:35:\"tax_blog_cat_slack_enhanced_sharing\";s:2:\"on\";s:19:\"tax_blog_tags_title\";s:23:\"%term% %sep% %sitename%\";s:20:\"tax_blog_tags_robots\";a:0:{}s:26:\"tax_blog_tags_add_meta_box\";s:2:\"on\";s:27:\"tax_blog_tags_custom_robots\";s:3:\"off\";s:25:\"tax_blog_tags_description\";s:18:\"%term_description%\";s:36:\"tax_blog_tags_slack_enhanced_sharing\";s:2:\"on\";s:31:\"remove_product_cat_snippet_data\";s:2:\"on\";s:31:\"remove_product_tag_snippet_data\";s:2:\"on\";s:19:\"knowledgegraph_logo\";s:111:\"http://aiot-fixing.local/wp-content/uploads/2024/09/202409271240-cropped-202409271027-AIOT-LOGO-1024x1024-1.png\";s:22:\"knowledgegraph_logo_id\";s:2:\"95\";s:22:\"website_alternate_name\";s:21:\"AIoT - Happy Together\";s:16:\"open_graph_image\";s:87:\"http://aiot-fixing.local/wp-content/uploads/2024/09/202409301351-AIoT-facebook-post.png\";s:19:\"open_graph_image_id\";s:3:\"164\";s:28:\"tax_post_format_add_meta_box\";s:2:\"on\";}s:7:\"sitemap\";a:19:{s:14:\"items_per_page\";i:200;s:14:\"include_images\";s:2:\"on\";s:22:\"include_featured_image\";s:3:\"off\";s:13:\"exclude_roles\";a:3:{i:0;s:11:\"contributor\";i:1;s:10:\"subscriber\";i:2;s:10:\"translator\";}s:12:\"html_sitemap\";s:2:\"on\";s:20:\"html_sitemap_display\";s:9:\"shortcode\";s:17:\"html_sitemap_sort\";s:9:\"published\";s:23:\"html_sitemap_seo_titles\";s:6:\"titles\";s:15:\"authors_sitemap\";s:2:\"on\";s:15:\"pt_post_sitemap\";s:2:\"on\";s:15:\"pt_page_sitemap\";s:2:\"on\";s:21:\"pt_attachment_sitemap\";s:3:\"off\";s:15:\"pt_blog_sitemap\";s:2:\"on\";s:18:\"pt_product_sitemap\";s:2:\"on\";s:20:\"pt_web-story_sitemap\";s:3:\"off\";s:20:\"tax_category_sitemap\";s:2:\"on\";s:20:\"tax_post_tag_sitemap\";s:3:\"off\";s:20:\"tax_blog_cat_sitemap\";s:2:\"on\";s:21:\"tax_blog_tags_sitemap\";s:2:\"on\";}s:12:\"role-manager\";a:3:{s:13:\"administrator\";a:16:{i:0;s:16:\"rank_math_titles\";i:1;s:17:\"rank_math_general\";i:2;s:17:\"rank_math_sitemap\";i:3;s:21:\"rank_math_404_monitor\";i:4;s:22:\"rank_math_link_builder\";i:5;s:22:\"rank_math_redirections\";i:6;s:22:\"rank_math_role_manager\";i:7;s:19:\"rank_math_analytics\";i:8;s:23:\"rank_math_site_analysis\";i:9;s:25:\"rank_math_onpage_analysis\";i:10;s:24:\"rank_math_onpage_general\";i:11;s:25:\"rank_math_onpage_advanced\";i:12;s:24:\"rank_math_onpage_snippet\";i:13;s:23:\"rank_math_onpage_social\";i:14;s:20:\"rank_math_content_ai\";i:15;s:19:\"rank_math_admin_bar\";}s:6:\"editor\";a:5:{i:0;s:23:\"rank_math_site_analysis\";i:1;s:25:\"rank_math_onpage_analysis\";i:2;s:24:\"rank_math_onpage_general\";i:3;s:24:\"rank_math_onpage_snippet\";i:4;s:23:\"rank_math_onpage_social\";}s:6:\"author\";a:4:{i:0;s:25:\"rank_math_onpage_analysis\";i:1;s:24:\"rank_math_onpage_general\";i:2;s:24:\"rank_math_onpage_snippet\";i:3;s:23:\"rank_math_onpage_social\";}}s:7:\"modules\";a:12:{i:0;s:12:\"link-counter\";i:1;s:9:\"analytics\";i:2;s:12:\"seo-analysis\";i:3;s:7:\"sitemap\";i:4;s:12:\"rich-snippet\";i:5;s:11:\"woocommerce\";i:6;s:10:\"buddypress\";i:7;s:7:\"bbpress\";i:8;s:3:\"acf\";i:9;s:11:\"web-stories\";i:11;s:16:\"instant-indexing\";i:12;s:9:\"local-seo\";}}}', 'off'),
(156328, 'rank_math_react_settings_ui', 'on', 'off'),
(156335, 'info-cards-redirect', '1', 'auto'),
(156336, 'fs_lite_accounts', 'a:3:{s:11:\"plugin_data\";a:1:{s:10:\"info-cards\";a:6:{s:16:\"plugin_main_file\";O:8:\"stdClass\":1:{s:4:\"path\";s:25:\"info-cards/info-cards.php\";}s:30:\"is_diagnostic_tracking_allowed\";b:0;s:30:\"is_extensions_tracking_allowed\";b:0;s:24:\"is_user_tracking_allowed\";b:0;s:24:\"is_site_tracking_allowed\";b:0;s:26:\"is_events_tracking_allowed\";b:0;}}s:5:\"users\";a:0:{}s:5:\"sites\";a:0:{}}', 'auto'),
(156492, 'swift_performance_plugin_organizer', 'a:0:{}', 'auto'),
(156493, 'jetpack_active_modules', 'a:0:{}', 'auto'),
(156497, '_transient_pll_translated_slugs', 'a:12:{s:4:\"blog\";a:2:{s:4:\"slug\";s:5:\"blogs\";s:12:\"translations\";a:3:{s:2:\"ja\";s:5:\"blogs\";s:2:\"vi\";s:5:\"blogs\";s:2:\"en\";s:5:\"blogs\";}}s:12:\"archive_blog\";a:3:{s:4:\"hide\";b:1;s:4:\"slug\";s:5:\"blogs\";s:12:\"translations\";a:3:{s:2:\"ja\";s:5:\"blogs\";s:2:\"vi\";s:5:\"blogs\";s:2:\"en\";s:5:\"blogs\";}}s:8:\"category\";a:2:{s:4:\"slug\";s:8:\"category\";s:12:\"translations\";a:3:{s:2:\"ja\";s:8:\"category\";s:2:\"vi\";s:8:\"category\";s:2:\"en\";s:8:\"category\";}}s:8:\"post_tag\";a:2:{s:4:\"slug\";s:3:\"tag\";s:12:\"translations\";a:3:{s:2:\"ja\";s:3:\"tag\";s:2:\"vi\";s:3:\"tag\";s:2:\"en\";s:3:\"tag\";}}s:11:\"post_format\";a:2:{s:4:\"slug\";s:4:\"type\";s:12:\"translations\";a:3:{s:2:\"ja\";s:4:\"type\";s:2:\"vi\";s:4:\"type\";s:2:\"en\";s:4:\"type\";}}s:8:\"blog_cat\";a:2:{s:4:\"slug\";s:14:\"blogs-category\";s:12:\"translations\";a:3:{s:2:\"ja\";s:14:\"blogs-category\";s:2:\"vi\";s:14:\"blogs-category\";s:2:\"en\";s:14:\"blogs-category\";}}s:9:\"blog_tags\";a:2:{s:4:\"slug\";s:9:\"blog_tags\";s:12:\"translations\";a:3:{s:2:\"ja\";s:9:\"blog_tags\";s:2:\"vi\";s:9:\"blog_tags\";s:2:\"en\";s:9:\"blog_tags\";}}s:6:\"author\";a:2:{s:4:\"slug\";s:6:\"author\";s:12:\"translations\";a:3:{s:2:\"ja\";s:6:\"author\";s:2:\"vi\";s:6:\"author\";s:2:\"en\";s:6:\"author\";}}s:6:\"search\";a:2:{s:4:\"slug\";s:6:\"search\";s:12:\"translations\";a:3:{s:2:\"ja\";s:6:\"search\";s:2:\"vi\";s:6:\"search\";s:2:\"en\";s:6:\"search\";}}s:10:\"attachment\";a:2:{s:4:\"slug\";s:10:\"attachment\";s:12:\"translations\";a:3:{s:2:\"ja\";s:10:\"attachment\";s:2:\"vi\";s:10:\"attachment\";s:2:\"en\";s:10:\"attachment\";}}s:5:\"paged\";a:2:{s:4:\"slug\";s:4:\"page\";s:12:\"translations\";a:3:{s:2:\"ja\";s:4:\"page\";s:2:\"vi\";s:4:\"page\";s:2:\"en\";s:4:\"page\";}}s:5:\"front\";a:2:{s:4:\"slug\";s:0:\"\";s:12:\"translations\";a:3:{s:2:\"ja\";s:0:\"\";s:2:\"vi\";s:0:\"\";s:2:\"en\";s:0:\"\";}}}', 'on'),
(156503, '_site_transient_ai1wm_last_check_for_updates', '1758781578', 'off'),
(156508, 'wordfence_installed', '1', 'auto'),
(156509, 'wordfence_ls_version', '1.1.15', 'auto'),
(156510, 'wfls_last_role_change', '1758781580', 'off'),
(156511, 'wordfence_version', '8.1.0', 'auto'),
(156512, 'wordfenceActivated', '1', 'auto'),
(156513, 'wf_plugin_act_error', '', 'auto'),
(156517, '_transient_rank_math_first_submenu_id', 'rank-math', 'on'),
(156520, '_site_transient_timeout_php_check_e70f383f6a98929d6e0bd66e58f51173', '1759386384', 'off'),
(156521, '_site_transient_php_check_e70f383f6a98929d6e0bd66e58f51173', 'a:5:{s:19:\"recommended_version\";s:3:\"8.3\";s:15:\"minimum_version\";s:6:\"7.2.24\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'off'),
(156524, '_site_transient_wp_plugin_dependencies_plugin_data', 'a:0:{}', 'off'),
(156527, '_transient_wp_styles_for_blocks', 'a:2:{s:4:\"hash\";s:32:\"f212887d83ff59884f38d0e4f89e17c5\";s:6:\"blocks\";a:5:{s:11:\"core/button\";s:0:\"\";s:14:\"core/site-logo\";s:0:\"\";s:18:\"core/post-template\";s:120:\":where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}\";s:12:\"core/columns\";s:102:\":where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}\";s:14:\"core/pullquote\";s:69:\":root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}\";}}', 'on'),
(156673, '_transient_health-check-site-status-result', '{\"good\":16,\"recommended\":3,\"critical\":1}', 'on'),
(156717, 'rank_math_sitemap_cache_files', 'a:0:{}', 'auto'),
(156789, '_transient_pll_languages_list', 'a:3:{i:0;a:22:{s:4:\"name\";s:9:\"日本語\";s:4:\"slug\";s:2:\"ja\";s:10:\"term_group\";i:0;s:7:\"term_id\";i:5;s:6:\"locale\";s:2:\"ja\";s:6:\"is_rtl\";i:0;s:3:\"w3c\";s:2:\"ja\";s:8:\"facebook\";s:5:\"ja_JP\";s:8:\"home_url\";s:25:\"http://aiot-fixing.local/\";s:10:\"search_url\";s:25:\"http://aiot-fixing.local/\";s:4:\"host\";N;s:13:\"page_on_front\";i:20;s:14:\"page_for_posts\";i:0;s:9:\"flag_code\";s:2:\"jp\";s:8:\"flag_url\";s:94:\"http://aiot-fixing.local/wp-content/plugins/polylang-pro/vendor/wpsyntex/polylang/flags/jp.png\";s:4:\"flag\";s:398:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAMAAABBPP0LAAAAPFBMVEX09PTy8fHy6+vm5+b+/v77+/v29vbf39/5vLz5fHz6qqr6UFD7QUH5NDT3lZXa2tr419f3JibT09P2WloskN4YAAAAVUlEQVR4AQXBQU7FMBBAMb90hCoW3P+csCAKfIodIBIyQJAGmPQTDHgrzca94K/keT/nWOgjmdm4VvIpwy1GXOsZ9ndYYL/Wee3IRI/fr4PQCuPmAv/RTRUh24Q4UgAAAABJRU5ErkJggg==\" alt=\"日本語\" width=\"16\" height=\"11\" style=\"width: 16px; height: 11px;\" />\";s:15:\"custom_flag_url\";s:0:\"\";s:11:\"custom_flag\";s:0:\"\";s:6:\"active\";b:1;s:9:\"fallbacks\";a:0:{}s:10:\"is_default\";b:1;s:10:\"term_props\";a:2:{s:8:\"language\";a:3:{s:7:\"term_id\";i:5;s:16:\"term_taxonomy_id\";i:5;s:5:\"count\";i:40;}s:13:\"term_language\";a:3:{s:7:\"term_id\";i:6;s:16:\"term_taxonomy_id\";i:6;s:5:\"count\";i:5;}}}i:1;a:22:{s:4:\"name\";s:14:\"Tiếng Việt\";s:4:\"slug\";s:2:\"vi\";s:10:\"term_group\";i:0;s:7:\"term_id\";i:66;s:6:\"locale\";s:2:\"vi\";s:6:\"is_rtl\";i:0;s:3:\"w3c\";s:2:\"vi\";s:8:\"facebook\";s:5:\"vi_VN\";s:8:\"home_url\";s:28:\"http://aiot-fixing.local/vi/\";s:10:\"search_url\";s:28:\"http://aiot-fixing.local/vi/\";s:4:\"host\";N;s:13:\"page_on_front\";i:0;s:14:\"page_for_posts\";i:0;s:9:\"flag_code\";s:2:\"vn\";s:8:\"flag_url\";s:94:\"http://aiot-fixing.local/wp-content/plugins/polylang-pro/vendor/wpsyntex/polylang/flags/vn.png\";s:4:\"flag\";s:435:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAMAAABBPP0LAAAATlBMVEX+AAD2AADvAQH/eXn+cXL9amr8YmL9Wlr8UlL7TkvoAAD8d0f6Pz/3ODf2Ly/0KSf6R0f6wTv60T31IBz6+jr4+Cv3QybzEhL4bizhAADgATv8AAAAW0lEQVR4AQXBgU3DQBRAMb+7jwKVUPefkQEQTYJqByBENpKUGoZslXoN5LPONH8G9WWZ7pGlOn6XZmaGRce1J/seei4dl+7dPWDqkk7+58e3+igdlySPcYbwBG+lPhCjrtt9EgAAAABJRU5ErkJggg==\" alt=\"Tiếng Việt\" width=\"16\" height=\"11\" style=\"width: 16px; height: 11px;\" />\";s:15:\"custom_flag_url\";s:0:\"\";s:11:\"custom_flag\";s:0:\"\";s:6:\"active\";b:1;s:9:\"fallbacks\";a:0:{}s:10:\"is_default\";b:0;s:10:\"term_props\";a:2:{s:8:\"language\";a:3:{s:7:\"term_id\";i:66;s:16:\"term_taxonomy_id\";i:66;s:5:\"count\";i:8;}s:13:\"term_language\";a:3:{s:7:\"term_id\";i:67;s:16:\"term_taxonomy_id\";i:67;s:5:\"count\";i:1;}}}i:2;a:22:{s:4:\"name\";s:7:\"English\";s:4:\"slug\";s:2:\"en\";s:10:\"term_group\";i:1;s:7:\"term_id\";i:9;s:6:\"locale\";s:5:\"en_US\";s:6:\"is_rtl\";i:0;s:3:\"w3c\";s:5:\"en-US\";s:8:\"facebook\";s:5:\"en_US\";s:8:\"home_url\";s:28:\"http://aiot-fixing.local/en/\";s:10:\"search_url\";s:28:\"http://aiot-fixing.local/en/\";s:4:\"host\";N;s:13:\"page_on_front\";i:8;s:14:\"page_for_posts\";i:0;s:9:\"flag_code\";s:2:\"us\";s:8:\"flag_url\";s:94:\"http://aiot-fixing.local/wp-content/plugins/polylang-pro/vendor/wpsyntex/polylang/flags/us.png\";s:4:\"flag\";s:576:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAMAAABBPP0LAAAAmVBMVEViZsViZMJiYrf9gnL8eWrlYkjgYkjZYkj8/PujwPybvPz4+PetraBEgfo+fvo3efkydfkqcvj8Y2T8UlL8Q0P8MzP9k4Hz8/Lu7u4DdPj9/VrKysI9fPoDc/EAZ7z7IiLHYkjp6ekCcOTk5OIASbfY/v21takAJrT5Dg6sYkjc3Nn94t2RkYD+y8KeYkjs/v7l5fz0dF22YkjWvcOLAAAAgElEQVR4AR2KNULFQBgGZ5J13KGGKvc/Cw1uPe62eb9+Jr1EUBFHSgxxjP2Eca6AfUSfVlUfBvm1Ui1bqafctqMndNkXpb01h5TLx4b6TIXgwOCHfjv+/Pz+5vPRw7txGWT2h6yO0/GaYltIp5PT1dEpLNPL/SdWjYjAAZtvRPgHJX4Xio+DSrkAAAAASUVORK5CYII=\" alt=\"English\" width=\"16\" height=\"11\" style=\"width: 16px; height: 11px;\" />\";s:15:\"custom_flag_url\";s:0:\"\";s:11:\"custom_flag\";s:0:\"\";s:6:\"active\";b:1;s:9:\"fallbacks\";a:0:{}s:10:\"is_default\";b:0;s:10:\"term_props\";a:2:{s:8:\"language\";a:3:{s:7:\"term_id\";i:9;s:16:\"term_taxonomy_id\";i:9;s:5:\"count\";i:34;}s:13:\"term_language\";a:3:{s:7:\"term_id\";i:10;s:16:\"term_taxonomy_id\";i:10;s:5:\"count\";i:4;}}}}', 'on'),
(156794, '_transient_timeout_wfRegistrationToken', '1759478240', 'off'),
(156795, '_transient_wfRegistrationToken', 'XrCJTRbChQCJkYyDZQgDKPM0vajad7GGlO5CWdXbcsc', 'off'),
(156797, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1759380289', 'off'),
(156798, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'O:8:\"stdClass\":100:{s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:7477;}s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4923;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2799;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2753;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:2143;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:2102;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:2043;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1959;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:1666;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1639;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1617;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1560;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1514;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1513;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:1490;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1355;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:1320;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1318;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:1267;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:1179;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1162;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:1061;}s:5:\"block\";a:3:{s:4:\"name\";s:5:\"block\";s:4:\"slug\";s:5:\"block\";s:5:\"count\";i:1061;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:1060;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:1053;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:1049;}s:9:\"gutenberg\";a:3:{s:4:\"name\";s:9:\"gutenberg\";s:4:\"slug\";s:9:\"gutenberg\";s:5:\"count\";i:1028;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:1009;}s:9:\"elementor\";a:3:{s:4:\"name\";s:9:\"elementor\";s:4:\"slug\";s:9:\"elementor\";s:5:\"count\";i:982;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:961;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:948;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:934;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:931;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:916;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:913;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:883;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:861;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:811;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:786;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:780;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:768;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:767;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:758;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:755;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:721;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:713;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:699;}s:11:\"performance\";a:3:{s:4:\"name\";s:11:\"performance\";s:4:\"slug\";s:11:\"performance\";s:5:\"count\";i:685;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:678;}s:8:\"shipping\";a:3:{s:4:\"name\";s:8:\"shipping\";s:4:\"slug\";s:8:\"shipping\";s:5:\"count\";i:676;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:675;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:675;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:665;}s:2:\"ai\";a:3:{s:4:\"name\";s:2:\"AI\";s:4:\"slug\";s:2:\"ai\";s:5:\"count\";i:662;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:650;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:644;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:640;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:640;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:636;}s:14:\"contact-form-7\";a:3:{s:4:\"name\";s:14:\"contact form 7\";s:4:\"slug\";s:14:\"contact-form-7\";s:5:\"count\";i:626;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:620;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:616;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:610;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:608;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:602;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:599;}s:6:\"blocks\";a:3:{s:4:\"name\";s:6:\"blocks\";s:4:\"slug\";s:6:\"blocks\";s:5:\"count\";i:595;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:589;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:579;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:579;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:579;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:578;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:570;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:568;}s:8:\"payments\";a:3:{s:4:\"name\";s:8:\"payments\";s:4:\"slug\";s:8:\"payments\";s:5:\"count\";i:564;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:554;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:536;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:532;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:527;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:522;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:515;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:509;}s:8:\"tracking\";a:3:{s:4:\"name\";s:8:\"tracking\";s:4:\"slug\";s:8:\"tracking\";s:5:\"count\";i:504;}s:8:\"checkout\";a:3:{s:4:\"name\";s:8:\"checkout\";s:4:\"slug\";s:8:\"checkout\";s:5:\"count\";i:502;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:500;}s:7:\"gateway\";a:3:{s:4:\"name\";s:7:\"gateway\";s:4:\"slug\";s:7:\"gateway\";s:5:\"count\";i:476;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:472;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:472;}s:6:\"import\";a:3:{s:4:\"name\";s:6:\"import\";s:4:\"slug\";s:6:\"import\";s:5:\"count\";i:471;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:470;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:463;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:459;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:457;}s:5:\"cache\";a:3:{s:4:\"name\";s:5:\"cache\";s:4:\"slug\";s:5:\"cache\";s:5:\"count\";i:445;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:440;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:430;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:427;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:423;}s:8:\"products\";a:3:{s:4:\"name\";s:8:\"products\";s:4:\"slug\";s:8:\"products\";s:5:\"count\";i:418;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:418;}}', 'off'),
(156953, '_site_transient_timeout_wp_theme_files_patterns-1cb807486162af433e64209c56d5cb27', '1759386853', 'off'),
(156954, '_site_transient_wp_theme_files_patterns-1cb807486162af433e64209c56d5cb27', 'a:2:{s:7:\"version\";s:3:\"3.0\";s:8:\"patterns\";a:0:{}}', 'off'),
(156957, '_transient_doing_cron', '1759476852.4894080162048339843750', 'on'),
(156962, '_site_transient_timeout_browser_3ade46e10ab46df1d7d395ddaa715a24', '1759994645', 'off'),
(156963, '_site_transient_browser_3ade46e10ab46df1d7d395ddaa715a24', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"140.0.0.0\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'off'),
(156964, '_site_transient_timeout_php_check_84bab1ffd8c4f8f9d81d62c8afdcab8a', '1759994646', 'off'),
(156965, '_site_transient_php_check_84bab1ffd8c4f8f9d81d62c8afdcab8a', 'a:5:{s:19:\"recommended_version\";s:3:\"8.3\";s:15:\"minimum_version\";s:6:\"7.2.24\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'off'),
(156981, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1759466360;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:8:{s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"6.1.2\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.6.1.2.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";s:3:\"svg\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.7\";}s:71:\"enable-virtual-card-upload-vcardvcf/prdb-enable-virtual-card-upload.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:49:\"w.org/plugins/enable-virtual-card-upload-vcardvcf\";s:4:\"slug\";s:35:\"enable-virtual-card-upload-vcardvcf\";s:6:\"plugin\";s:71:\"enable-virtual-card-upload-vcardvcf/prdb-enable-virtual-card-upload.php\";s:11:\"new_version\";s:5:\"2.3.0\";s:3:\"url\";s:66:\"https://wordpress.org/plugins/enable-virtual-card-upload-vcardvcf/\";s:7:\"package\";s:84:\"https://downloads.wordpress.org/plugin/enable-virtual-card-upload-vcardvcf.2.3.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:88:\"https://ps.w.org/enable-virtual-card-upload-vcardvcf/assets/icon-256x256.png?rev=2867903\";s:2:\"1x\";s:88:\"https://ps.w.org/enable-virtual-card-upload-vcardvcf/assets/icon-128x128.png?rev=2867903\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:91:\"https://ps.w.org/enable-virtual-card-upload-vcardvcf/assets/banner-1544x500.png?rev=2867903\";s:2:\"1x\";s:90:\"https://ps.w.org/enable-virtual-card-upload-vcardvcf/assets/banner-772x250.png?rev=2867903\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.7\";}s:23:\"loco-translate/loco.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/loco-translate\";s:4:\"slug\";s:14:\"loco-translate\";s:6:\"plugin\";s:23:\"loco-translate/loco.php\";s:11:\"new_version\";s:5:\"2.8.0\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/loco-translate/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/loco-translate.2.8.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/loco-translate/assets/icon-256x256.png?rev=1000676\";s:2:\"1x\";s:67:\"https://ps.w.org/loco-translate/assets/icon-128x128.png?rev=1000676\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:68:\"https://ps.w.org/loco-translate/assets/banner-772x250.jpg?rev=745046\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.6\";}s:30:\"seo-by-rank-math/rank-math.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:30:\"w.org/plugins/seo-by-rank-math\";s:4:\"slug\";s:16:\"seo-by-rank-math\";s:6:\"plugin\";s:30:\"seo-by-rank-math/rank-math.php\";s:11:\"new_version\";s:7:\"1.0.254\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/seo-by-rank-math/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/seo-by-rank-math.1.0.254.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:61:\"https://ps.w.org/seo-by-rank-math/assets/icon.svg?rev=3218327\";s:3:\"svg\";s:61:\"https://ps.w.org/seo-by-rank-math/assets/icon.svg?rev=3218327\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/seo-by-rank-math/assets/banner-1544x500.png?rev=2639678\";s:2:\"1x\";s:71:\"https://ps.w.org/seo-by-rank-math/assets/banner-772x250.png?rev=2639678\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.3\";}s:27:\"redirection/redirection.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/redirection\";s:4:\"slug\";s:11:\"redirection\";s:6:\"plugin\";s:27:\"redirection/redirection.php\";s:11:\"new_version\";s:5:\"5.5.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/redirection/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/redirection.5.5.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/redirection/assets/icon-256x256.jpg?rev=983639\";s:2:\"1x\";s:63:\"https://ps.w.org/redirection/assets/icon-128x128.jpg?rev=983640\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/redirection/assets/banner-1544x500.jpg?rev=983641\";s:2:\"1x\";s:65:\"https://ps.w.org/redirection/assets/banner-772x250.jpg?rev=983642\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.4\";}s:22:\"team-section/index.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:26:\"w.org/plugins/team-section\";s:4:\"slug\";s:12:\"team-section\";s:6:\"plugin\";s:22:\"team-section/index.php\";s:11:\"new_version\";s:5:\"1.1.0\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/team-section/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/team-section.1.1.0.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/team-section/assets/icon-128x128.png?rev=2694562\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/team-section/assets/banner-772x250.png?rev=2699123\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.5\";}s:23:\"wordfence/wordfence.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:23:\"w.org/plugins/wordfence\";s:4:\"slug\";s:9:\"wordfence\";s:6:\"plugin\";s:23:\"wordfence/wordfence.php\";s:11:\"new_version\";s:5:\"8.1.0\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/wordfence/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/wordfence.8.1.0.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:54:\"https://ps.w.org/wordfence/assets/icon.svg?rev=2070865\";s:3:\"svg\";s:54:\"https://ps.w.org/wordfence/assets/icon.svg?rev=2070865\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/wordfence/assets/banner-1544x500.jpg?rev=2124102\";s:2:\"1x\";s:64:\"https://ps.w.org/wordfence/assets/banner-772x250.jpg?rev=2124102\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.7\";}s:33:\"wps-hide-login/wps-hide-login.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/wps-hide-login\";s:4:\"slug\";s:14:\"wps-hide-login\";s:6:\"plugin\";s:33:\"wps-hide-login/wps-hide-login.php\";s:11:\"new_version\";s:8:\"1.9.17.2\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/wps-hide-login/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/wps-hide-login.1.9.17.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/wps-hide-login/assets/icon-256x256.png?rev=1820667\";s:2:\"1x\";s:67:\"https://ps.w.org/wps-hide-login/assets/icon-128x128.png?rev=1820667\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/wps-hide-login/assets/banner-1544x500.jpg?rev=1820667\";s:2:\"1x\";s:69:\"https://ps.w.org/wps-hide-login/assets/banner-772x250.jpg?rev=1820667\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.1\";}}s:7:\"checked\";a:9:{s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"6.1.2\";s:71:\"enable-virtual-card-upload-vcardvcf/prdb-enable-virtual-card-upload.php\";s:5:\"2.3.0\";s:23:\"loco-translate/loco.php\";s:5:\"2.8.0\";s:25:\"polylang-pro/polylang.php\";s:5:\"3.6.3\";s:30:\"seo-by-rank-math/rank-math.php\";s:7:\"1.0.254\";s:27:\"redirection/redirection.php\";s:5:\"5.5.2\";s:22:\"team-section/index.php\";s:5:\"1.1.0\";s:23:\"wordfence/wordfence.php\";s:5:\"8.1.0\";s:33:\"wps-hide-login/wps-hide-login.php\";s:8:\"1.9.17.2\";}}', 'off'),
(156982, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1759466361;s:7:\"checked\";a:2:{s:15:\"mooms_dev/theme\";s:3:\"3.0\";s:19:\"mooms_dev_old/theme\";s:5:\"1.0.1\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}', 'off'),
(156991, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.8.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.8.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.8.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.8.3-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.8.3\";s:7:\"version\";s:5:\"6.8.3\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1759466360;s:15:\"version_checked\";s:5:\"6.8.3\";s:12:\"translations\";a:0:{}}', 'off'),
(157007, '_transient_timeout_as-post-store-dependencies-met', '1759550582', 'off'),
(157008, '_transient_as-post-store-dependencies-met', 'yes', 'off'),
(157009, '_site_transient_timeout_available_translations', '1759475233', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(157010, '_site_transient_available_translations', 'a:131:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-05-13 15:59:22\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"am\";a:8:{s:8:\"language\";s:2:\"am\";s:7:\"version\";s:6:\"6.0.11\";s:7:\"updated\";s:19:\"2022-09-29 20:43:49\";s:12:\"english_name\";s:7:\"Amharic\";s:11:\"native_name\";s:12:\"አማርኛ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.0.11/am.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"am\";i:2;s:3:\"amh\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"ቀጥል\";}}s:3:\"arg\";a:8:{s:8:\"language\";s:3:\"arg\";s:7:\"version\";s:8:\"6.2-beta\";s:7:\"updated\";s:19:\"2022-09-22 16:46:56\";s:12:\"english_name\";s:9:\"Aragonese\";s:11:\"native_name\";s:9:\"Aragonés\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/6.2-beta/arg.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"an\";i:2;s:3:\"arg\";i:3;s:3:\"arg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continar\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"6.4.7\";s:7:\"updated\";s:19:\"2024-02-13 12:49:38\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.7/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"متابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:6:\"4.8.27\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.27/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-10 08:09:09\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"6.4.7\";s:7:\"updated\";s:19:\"2024-01-19 08:58:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.4.7/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:6:\"4.9.28\";s:7:\"updated\";s:19:\"2024-12-26 00:37:42\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.9.28/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-06-26 09:35:39\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-01 14:03:28\";s:12:\"english_name\";s:20:\"Bengali (Bangladesh)\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:28:\"চালিয়ে যান\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2020-10-30 03:24:38\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:33:\"མུ་མཐུད་དུ།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"6.2.8\";s:7:\"updated\";s:19:\"2023-02-22 20:45:53\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.2.8/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 19:58:50\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-09 08:25:54\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-11 16:48:51\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-01 02:38:52\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:5:\"de_AT\";a:8:{s:8:\"language\";s:5:\"de_AT\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-06-05 10:10:20\";s:12:\"english_name\";s:16:\"German (Austria)\";s:11:\"native_name\";s:21:\"Deutsch (Österreich)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/de_AT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 21:17:03\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 21:17:34\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/6.8.3/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-28 10:25:03\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-28 10:25:24\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/core/6.8.3/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dsb\";a:8:{s:8:\"language\";s:3:\"dsb\";s:7:\"version\";s:5:\"6.2.8\";s:7:\"updated\";s:19:\"2022-07-16 12:13:09\";s:12:\"english_name\";s:13:\"Lower Sorbian\";s:11:\"native_name\";s:16:\"Dolnoserbšćina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2.8/dsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"dsb\";i:3;s:3:\"dsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Dalej\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-21 14:54:13\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-29 13:22:09\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-08-25 13:50:40\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-05-22 11:56:25\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-08-19 23:02:24\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-30 21:52:12\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-08-19 08:40:47\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2024-10-16 21:04:12\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-11 05:24:36\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-29 19:09:09\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 21:17:40\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-01 22:54:47\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-02 21:15:15\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"6.4.7\";s:7:\"updated\";s:19:\"2023-10-16 16:00:04\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.7/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_EC\";a:8:{s:8:\"language\";s:5:\"es_EC\";s:7:\"version\";s:5:\"6.2.8\";s:7:\"updated\";s:19:\"2023-04-21 13:32:10\";s:12:\"english_name\";s:17:\"Spanish (Ecuador)\";s:11:\"native_name\";s:19:\"Español de Ecuador\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.2.8/es_EC.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_DO\";a:8:{s:8:\"language\";s:5:\"es_DO\";s:7:\"version\";s:6:\"5.8.12\";s:7:\"updated\";s:19:\"2021-10-08 14:32:50\";s:12:\"english_name\";s:28:\"Spanish (Dominican Republic)\";s:11:\"native_name\";s:33:\"Español de República Dominicana\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.8.12/es_DO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_UY\";a:8:{s:8:\"language\";s:5:\"es_UY\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-31 18:33:26\";s:12:\"english_name\";s:17:\"Spanish (Uruguay)\";s:11:\"native_name\";s:19:\"Español de Uruguay\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/es_UY.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PR\";a:8:{s:8:\"language\";s:5:\"es_PR\";s:7:\"version\";s:6:\"5.4.18\";s:7:\"updated\";s:19:\"2020-04-29 15:36:59\";s:12:\"english_name\";s:21:\"Spanish (Puerto Rico)\";s:11:\"native_name\";s:23:\"Español de Puerto Rico\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.4.18/es_PR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:6:\"5.2.23\";s:7:\"updated\";s:19:\"2019-03-02 06:35:01\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.2.23/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-14 15:46:25\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:5:\"6.5.5\";s:7:\"updated\";s:19:\"2024-06-06 09:50:37\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.5.5/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-05 12:26:55\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_AF\";a:8:{s:8:\"language\";s:5:\"fa_AF\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-02-14 17:29:08\";s:12:\"english_name\";s:21:\"Persian (Afghanistan)\";s:11:\"native_name\";s:31:\"(فارسی (افغانستان\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/fa_AF.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-02 18:18:37\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-01 04:49:09\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-25 05:20:17\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-01 15:38:59\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:5:\"6.5.7\";s:7:\"updated\";s:19:\"2024-02-01 23:56:53\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.5.7/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:6:\"4.8.27\";s:7:\"updated\";s:19:\"2023-04-30 13:56:46\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.27/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"fy\";a:8:{s:8:\"language\";s:2:\"fy\";s:7:\"version\";s:5:\"6.2.8\";s:7:\"updated\";s:19:\"2022-12-25 12:53:23\";s:12:\"english_name\";s:7:\"Frisian\";s:11:\"native_name\";s:5:\"Frysk\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.2.8/fy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fy\";i:2;s:3:\"fry\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Trochgean\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-02 21:35:41\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-08-29 04:27:18\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ચાલુ રાખો\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:6:\"4.4.34\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.4.34/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"6.2.8\";s:7:\"updated\";s:19:\"2024-05-04 18:39:24\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.2.8/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:5:\"6.4.7\";s:7:\"updated\";s:19:\"2025-02-06 05:17:11\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.7/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"जारी रखें\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-02 23:56:46\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:3:\"hsb\";a:8:{s:8:\"language\";s:3:\"hsb\";s:7:\"version\";s:5:\"6.2.8\";s:7:\"updated\";s:19:\"2023-02-22 17:37:32\";s:12:\"english_name\";s:13:\"Upper Sorbian\";s:11:\"native_name\";s:17:\"Hornjoserbšćina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2.8/hsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"hsb\";i:3;s:3:\"hsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:4:\"Dale\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-06-09 13:56:03\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-08-16 04:17:52\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.9.28\";s:7:\"updated\";s:19:\"2018-12-11 10:40:02\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.28/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-11 21:28:29\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-22 12:19:14\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"次へ\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:6:\"4.9.28\";s:7:\"updated\";s:19:\"2019-02-16 23:58:56\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.28/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-04-14 08:02:58\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"6.2.8\";s:7:\"updated\";s:19:\"2023-07-05 11:40:39\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2.8/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2024-07-18 02:49:24\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:6:\"5.2.23\";s:7:\"updated\";s:19:\"2019-06-10 16:18:28\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.2.23/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:2:\"kn\";a:8:{s:8:\"language\";s:2:\"kn\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-22 16:17:50\";s:12:\"english_name\";s:7:\"Kannada\";s:11:\"native_name\";s:15:\"ಕನ್ನಡ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/kn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kn\";i:2;s:3:\"kan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"ಮುಂದುವರಿಸು\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-01 23:59:20\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 22:13:32\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.8.3/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:3:\"kir\";a:8:{s:8:\"language\";s:3:\"kir\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-17 05:00:42\";s:12:\"english_name\";s:6:\"Kyrgyz\";s:11:\"native_name\";s:16:\"Кыргызча\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.8.3/kir.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ky\";i:2;s:3:\"kir\";i:3;s:3:\"kir\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Улантуу\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-27 20:51:17\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-15 19:11:43\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:6:\"6.0.11\";s:7:\"updated\";s:19:\"2022-10-01 09:23:52\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/6.0.11/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-24 16:32:35\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"6.5.7\";s:7:\"updated\";s:19:\"2024-06-20 17:22:06\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.5.7/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-08-26 17:30:52\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:6:\"5.5.17\";s:7:\"updated\";s:19:\"2022-03-11 13:52:22\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.5.17/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.2.39\";s:7:\"updated\";s:19:\"2017-12-26 11:57:10\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.2.39/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 18:16:57\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-23 09:31:59\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 21:34:29\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 21:41:15\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/6.8.3/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-01 07:26:29\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-18 10:59:16\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:6:\"4.8.27\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.27/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:15:\"Panjabi (India)\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 21:03:27\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.3.35\";s:7:\"updated\";s:19:\"2015-12-02 21:41:29\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.3.35/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-08-30 11:47:36\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_AO\";a:8:{s:8:\"language\";s:5:\"pt_AO\";s:7:\"version\";s:5:\"6.4.7\";s:7:\"updated\";s:19:\"2023-08-21 12:15:00\";s:12:\"english_name\";s:19:\"Portuguese (Angola)\";s:11:\"native_name\";s:20:\"Português de Angola\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.7/pt_AO.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-27 23:38:30\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-27 23:48:59\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/6.8.3/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-01 06:10:06\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 19:16:19\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:3:\"snd\";a:8:{s:8:\"language\";s:3:\"snd\";s:7:\"version\";s:6:\"5.4.18\";s:7:\"updated\";s:19:\"2020-07-07 01:53:37\";s:12:\"english_name\";s:6:\"Sindhi\";s:11:\"native_name\";s:8:\"سنڌي\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/5.4.18/snd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"sd\";i:2;s:3:\"snd\";i:3;s:3:\"snd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"اڳتي هلو\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-02 03:45:43\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:3:\"skr\";a:8:{s:8:\"language\";s:3:\"skr\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-04-24 16:58:02\";s:12:\"english_name\";s:7:\"Saraiki\";s:11:\"native_name\";s:14:\"سرائیکی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.8.3/skr.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"skr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"جاری رکھو\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-08-14 09:44:53\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-04-18 09:38:51\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-08 20:51:20\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-30 19:20:59\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"sw\";a:8:{s:8:\"language\";s:2:\"sw\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-06-28 12:50:48\";s:12:\"english_name\";s:7:\"Swahili\";s:11:\"native_name\";s:9:\"Kiswahili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/sw.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sw\";i:2;s:3:\"swa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Endelea\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:5:\"ta_LK\";a:8:{s:8:\"language\";s:5:\"ta_LK\";s:7:\"version\";s:6:\"4.2.39\";s:7:\"updated\";s:19:\"2015-12-03 01:07:44\";s:12:\"english_name\";s:17:\"Tamil (Sri Lanka)\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.2.39/ta_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"தொடர்க\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:6:\"5.8.12\";s:7:\"updated\";s:19:\"2022-06-08 04:30:30\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.8.12/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-08 16:09:09\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-04-16 23:11:08\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-29 21:46:36\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:3:\"6.8\";s:7:\"updated\";s:19:\"2025-04-18 21:10:00\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.8/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:6:\"5.4.18\";s:7:\"updated\";s:19:\"2020-04-09 11:17:33\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.4.18/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-02-28 12:02:22\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-09-01 09:12:13\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.8.3/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-07-29 06:55:14\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"6.8.3\";s:7:\"updated\";s:19:\"2025-10-01 08:48:55\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.8.3/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"6.2.8\";s:7:\"updated\";s:19:\"2022-07-15 15:25:03\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:12:\"香港中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.2.8/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(157013, '_site_transient_timeout_theme_roots', '1759468160', 'off'),
(157014, '_site_transient_theme_roots', 'a:2:{s:15:\"mooms_dev/theme\";s:7:\"/themes\";s:19:\"mooms_dev_old/theme\";s:7:\"/themes\";}', 'off'),
(157015, '_site_transient_t15s-registry-plugins', 'O:8:\"stdClass\":2:{s:12:\"polylang-pro\";a:1:{s:12:\"translations\";a:26:{i:0;a:7:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-05T09:51:13+00:00\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:81:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-ar.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"ar\";i:1;s:3:\"ara\";}}i:1;a:7:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-05T10:46:54+00:00\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-cs_CZ.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"cs\";i:1;s:3:\"ces\";}}i:2;a:7:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-04T18:21:37+00:00\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-da_DK.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"da\";i:1;s:3:\"dan\";}}i:3;a:7:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-04T18:21:08+00:00\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-nl_NL.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"nl\";i:1;s:3:\"nld\";}}i:4;a:7:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-04T18:20:37+00:00\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-nl_BE.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"nl\";i:1;s:3:\"nld\";}}i:5;a:7:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-04T18:19:55+00:00\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-en_AU.zip\";s:3:\"iso\";a:3:{i:0;s:2:\"en\";i:1;s:3:\"eng\";i:2;s:3:\"eng\";}}i:6;a:7:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-04T18:19:35+00:00\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-en_GB.zip\";s:3:\"iso\";a:3:{i:0;s:2:\"en\";i:1;s:3:\"eng\";i:2;s:3:\"eng\";}}i:7;a:7:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-04T18:16:09+00:00\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-fr_FR.zip\";s:3:\"iso\";a:1:{i:0;s:2:\"fr\";}}i:8;a:7:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-07T10:46:28+00:00\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-de_DE.zip\";s:3:\"iso\";a:1:{i:0;s:2:\"de\";}}i:9;a:7:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-08T03:26:42+00:00\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:81:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-el.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"el\";i:1;s:3:\"ell\";}}i:10;a:7:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-04T18:23:36+00:00\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-hi_IN.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"hi\";i:1;s:3:\"hin\";}}i:11;a:7:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-06T07:26:31+00:00\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-id_ID.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"id\";i:1;s:3:\"ind\";}}i:12;a:7:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-05T08:59:26+00:00\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-it_IT.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"it\";i:1;s:3:\"ita\";}}i:13;a:7:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-05T10:22:08+00:00\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:81:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-ja.zip\";s:3:\"iso\";a:1:{i:0;s:2:\"ja\";}}i:14;a:7:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-07T11:56:53+00:00\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-fa_IR.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"fa\";i:1;s:3:\"fas\";}}i:15;a:7:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-04T18:18:56+00:00\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-pl_PL.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"pl\";i:1;s:3:\"pol\";}}i:16;a:7:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-18T17:26:54+00:00\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-pt_BR.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"pt\";i:1;s:3:\"por\";}}i:17;a:7:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-06T22:54:19+00:00\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-pt_PT.zip\";s:3:\"iso\";a:1:{i:0;s:2:\"pt\";}}i:18;a:7:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-05T06:16:44+00:00\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-ro_RO.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"ro\";i:1;s:3:\"ron\";}}i:19;a:7:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-19T12:39:56+00:00\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-ru_RU.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"ru\";i:1;s:3:\"rus\";}}i:20;a:7:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-10T15:43:59+00:00\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-sr_RS.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"sr\";i:1;s:3:\"srp\";}}i:21;a:7:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-04T18:22:06+00:00\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-es_MX.zip\";s:3:\"iso\";a:3:{i:0;s:2:\"es\";i:1;s:3:\"spa\";i:2;s:3:\"spa\";}}i:22;a:7:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-06T19:24:02+00:00\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-es_ES.zip\";s:3:\"iso\";a:3:{i:0;s:2:\"es\";i:1;s:3:\"spa\";i:2;s:3:\"spa\";}}i:23;a:7:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-04T18:18:05+00:00\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-sv_SE.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"sv\";i:1;s:3:\"swe\";}}i:24;a:7:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-07T08:22:18+00:00\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:84:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-tr_TR.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"tr\";i:1;s:3:\"tur\";}}i:25;a:7:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:9:\"3.3-beta1\";s:7:\"updated\";s:25:\"2025-03-19T12:48:39+00:00\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:81:\"https://packages.translationspress.com/wp-syntex/polylang-pro/polylang-pro-uk.zip\";s:3:\"iso\";a:2:{i:0;s:2:\"uk\";i:1;s:3:\"ukr\";}}}}s:13:\"_last_checked\";i:1759466362;}', 'off'),
(157016, '_transient_timeout_rank_math_feed_posts_v2', '1759509563', 'off'),
(157017, '_transient_rank_math_feed_posts_v2', 'a:4:{i:0;a:5:{s:5:\"title\";a:1:{s:8:\"rendered\";s:51:\"Content AI 2.0: Introducing AI SEO Inside WordPress\";}s:4:\"date\";s:19:\"2025-10-03 01:10:19\";s:4:\"link\";s:62:\"https://rankmath.com/blog/introducing-supercharged-content-ai/\";s:12:\"custom_label\";s:0:\"\";s:9:\"condition\";s:0:\"\";}i:1;a:3:{s:5:\"title\";a:1:{s:8:\"rendered\";s:67:\"Reddit SEO: How to Rank Higher, Get AI Citations, and Drive Traffic\";}s:4:\"date\";s:19:\"2025-09-25 16:07:59\";s:4:\"link\";s:37:\"https://rankmath.com/blog/reddit-seo/\";}i:2;a:3:{s:5:\"title\";a:1:{s:8:\"rendered\";s:56:\"6 Best Keyword Density Checkers to Optimize Your Content\";}s:4:\"date\";s:19:\"2025-09-19 06:46:56\";s:4:\"link\";s:56:\"https://rankmath.com/blog/best-keyword-density-checkers/\";}i:3;a:3:{s:5:\"title\";a:1:{s:8:\"rendered\";s:61:\"10 Best Website Speed Test Tools in 2025 (Tried &amp; Tested)\";}s:4:\"date\";s:19:\"2025-09-15 16:59:48\";s:4:\"link\";s:56:\"https://rankmath.com/blog/best-website-speed-test-tools/\";}}', 'off'),
(157024, '_site_transient_timeout_wp_theme_files_patterns-fe94dcbf2e6844486719702a2a58fec9', '1759477661', 'off'),
(157025, '_site_transient_wp_theme_files_patterns-fe94dcbf2e6844486719702a2a58fec9', 'a:2:{s:7:\"version\";s:3:\"3.0\";s:8:\"patterns\";a:0:{}}', 'off'),
(157026, '_is_maintenance', '', 'off'),
(157027, '_disable_admin_confirm_email', '', 'off'),
(157028, '_disable_use_weak_password', '', 'off'),
(157029, '_hide_post_menu_default', 'yes', 'off'),
(157030, '_hide_comment_menu_default', 'yes', 'off'),
(157031, '_use_smtp', '', 'off'),
(157032, '_smtp_host', 'smtp.gmail.com', 'off'),
(157033, '_smtp_port', '587', 'off'),
(157034, '_smtp_secure', 'TLS', 'off'),
(157035, '_smtp_username', 'mooms.dev@gmail.com', 'off'),
(157036, '_smtp_password', 'utakxthdfibquxos', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(9, 8, '_edit_lock', '1741745813:2'),
(26, 18, '_edit_lock', '1753238745:1'),
(27, 20, '_edit_lock', '1753774354:2'),
(28, 22, '_menu_item_type', 'post_type'),
(29, 22, '_menu_item_menu_item_parent', '0'),
(30, 22, '_menu_item_object_id', '8'),
(31, 22, '_menu_item_object', 'page'),
(32, 22, '_menu_item_target', ''),
(33, 22, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(34, 22, '_menu_item_xfn', ''),
(35, 22, '_menu_item_url', ''),
(37, 23, '_edit_lock', '1727612924:1'),
(57, 22, '_wp_old_date', '2024-09-26'),
(59, 34, '_edit_lock', '1742182484:1'),
(60, 36, '_edit_lock', '1741828674:2'),
(61, 38, '_edit_lock', '1733456158:1'),
(62, 40, '_edit_lock', '1753427601:2'),
(63, 42, '_edit_lock', '1753428096:1'),
(64, 44, '_edit_lock', '1733457101:1'),
(65, 34, '_edit_last', '1'),
(66, 38, '_edit_last', '1'),
(67, 40, '_edit_last', '1'),
(68, 42, '_edit_last', '1'),
(69, 44, '_edit_last', '1'),
(70, 46, '_edit_lock', '1741745914:2'),
(75, 52, '_menu_item_type', 'post_type_archive'),
(76, 52, '_menu_item_menu_item_parent', '0'),
(77, 52, '_menu_item_object_id', '-24'),
(78, 52, '_menu_item_object', 'blog'),
(79, 52, '_menu_item_target', ''),
(80, 52, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(81, 52, '_menu_item_xfn', ''),
(82, 52, '_menu_item_url', ''),
(84, 53, '_menu_item_type', 'post_type'),
(85, 53, '_menu_item_menu_item_parent', '0'),
(86, 53, '_menu_item_object_id', '36'),
(87, 53, '_menu_item_object', 'page'),
(88, 53, '_menu_item_target', ''),
(89, 53, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(90, 53, '_menu_item_xfn', ''),
(91, 53, '_menu_item_url', ''),
(102, 55, '_menu_item_type', 'post_type'),
(103, 55, '_menu_item_menu_item_parent', '0'),
(104, 55, '_menu_item_object_id', '8'),
(105, 55, '_menu_item_object', 'page'),
(106, 55, '_menu_item_target', ''),
(107, 55, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(108, 55, '_menu_item_xfn', ''),
(109, 55, '_menu_item_url', ''),
(120, 57, '_menu_item_type', 'post_type'),
(121, 57, '_menu_item_menu_item_parent', '0'),
(122, 57, '_menu_item_object_id', '36'),
(123, 57, '_menu_item_object', 'page'),
(124, 57, '_menu_item_target', ''),
(125, 57, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(126, 57, '_menu_item_xfn', ''),
(127, 57, '_menu_item_url', ''),
(129, 58, '_menu_item_type', 'post_type'),
(130, 58, '_menu_item_menu_item_parent', '57'),
(131, 58, '_menu_item_object_id', '34'),
(132, 58, '_menu_item_object', 'page'),
(133, 58, '_menu_item_target', ''),
(134, 58, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(135, 58, '_menu_item_xfn', ''),
(136, 58, '_menu_item_url', ''),
(138, 59, '_menu_item_type', 'post_type'),
(139, 59, '_menu_item_menu_item_parent', '57'),
(140, 59, '_menu_item_object_id', '44'),
(141, 59, '_menu_item_object', 'page'),
(142, 59, '_menu_item_target', ''),
(143, 59, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(144, 59, '_menu_item_xfn', ''),
(145, 59, '_menu_item_url', ''),
(147, 60, '_menu_item_type', 'post_type'),
(148, 60, '_menu_item_menu_item_parent', '57'),
(149, 60, '_menu_item_object_id', '42'),
(150, 60, '_menu_item_object', 'page'),
(151, 60, '_menu_item_target', ''),
(152, 60, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(153, 60, '_menu_item_xfn', ''),
(154, 60, '_menu_item_url', ''),
(156, 61, '_menu_item_type', 'post_type'),
(157, 61, '_menu_item_menu_item_parent', '57'),
(158, 61, '_menu_item_object_id', '40'),
(159, 61, '_menu_item_object', 'page'),
(160, 61, '_menu_item_target', ''),
(161, 61, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(162, 61, '_menu_item_xfn', ''),
(163, 61, '_menu_item_url', ''),
(165, 62, '_menu_item_type', 'post_type'),
(166, 62, '_menu_item_menu_item_parent', '57'),
(167, 62, '_menu_item_object_id', '38'),
(168, 62, '_menu_item_object', 'page'),
(169, 62, '_menu_item_target', ''),
(170, 62, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(171, 62, '_menu_item_xfn', ''),
(172, 62, '_menu_item_url', ''),
(174, 63, '_menu_item_type', 'post_type'),
(175, 63, '_menu_item_menu_item_parent', '0'),
(176, 63, '_menu_item_object_id', '46'),
(177, 63, '_menu_item_object', 'page'),
(178, 63, '_menu_item_target', ''),
(179, 63, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(180, 63, '_menu_item_xfn', ''),
(181, 63, '_menu_item_url', ''),
(189, 68, '_menu_item_type', 'post_type_archive'),
(190, 68, '_menu_item_menu_item_parent', '0'),
(191, 68, '_menu_item_object_id', '-24'),
(192, 68, '_menu_item_object', 'blog'),
(193, 68, '_menu_item_target', ''),
(194, 68, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(195, 68, '_menu_item_xfn', ''),
(196, 68, '_menu_item_url', ''),
(249, 77, '_wp_attached_file', '2024/09/202409271027-banner.png'),
(250, 77, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:960;s:6:\"height\";i:400;s:4:\"file\";s:31:\"2024/09/202409271027-banner.png\";s:8:\"filesize\";i:134655;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(251, 79, '_wp_attached_file', '2024/09/202409271041-Banner-Video.mp4'),
(252, 79, '_wp_attachment_metadata', 'a:11:{s:7:\"bitrate\";i:1186431;s:8:\"filesize\";i:1208293;s:9:\"mime_type\";s:9:\"video/mp4\";s:6:\"length\";i:8;s:16:\"length_formatted\";s:4:\"0:08\";s:5:\"width\";i:1920;s:6:\"height\";i:800;s:10:\"fileformat\";s:3:\"mp4\";s:10:\"dataformat\";s:9:\"quicktime\";s:5:\"audio\";a:9:{s:10:\"dataformat\";s:3:\"mp4\";s:7:\"bitrate\";i:2285;s:5:\"codec\";s:19:\"ISO/IEC 14496-3 AAC\";s:11:\"sample_rate\";d:48000;s:8:\"channels\";i:2;s:15:\"bits_per_sample\";i:16;s:8:\"lossless\";b:0;s:11:\"channelmode\";s:6:\"stereo\";s:17:\"compression_ratio\";d:0.0014876302083333334;}s:17:\"created_timestamp\";i:-2082844800;}'),
(254, 82, '_wp_attached_file', '2024/09/202409271046-.mp4'),
(255, 82, '_wp_attachment_metadata', 'a:10:{s:7:\"bitrate\";i:305191;s:8:\"filesize\";i:246519;s:9:\"mime_type\";s:15:\"video/quicktime\";s:6:\"length\";i:6;s:16:\"length_formatted\";s:4:\"0:06\";s:5:\"width\";i:1486;s:6:\"height\";i:618;s:10:\"fileformat\";s:3:\"mp4\";s:10:\"dataformat\";s:9:\"quicktime\";s:17:\"created_timestamp\";i:-2082844800;}'),
(258, 89, '_wp_attached_file', '2024/09/202409271230-1.png'),
(259, 89, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:600;s:6:\"height\";i:1096;s:4:\"file\";s:26:\"2024/09/202409271230-1.png\";s:8:\"filesize\";i:722450;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(260, 90, '_wp_attached_file', '2024/09/202409271230-2.png'),
(261, 90, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:600;s:6:\"height\";i:1096;s:4:\"file\";s:26:\"2024/09/202409271230-2.png\";s:8:\"filesize\";i:1363091;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(262, 91, '_wp_attached_file', '2024/09/202409271230-3.png'),
(263, 91, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:600;s:6:\"height\";i:1096;s:4:\"file\";s:26:\"2024/09/202409271230-3.png\";s:8:\"filesize\";i:871617;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(264, 92, '_wp_attached_file', '2024/09/202409271230-4.png'),
(265, 92, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:600;s:6:\"height\";i:1096;s:4:\"file\";s:26:\"2024/09/202409271230-4.png\";s:8:\"filesize\";i:1261506;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(266, 93, '_wp_attached_file', '2024/09/202409271230-5.png'),
(267, 93, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:600;s:6:\"height\";i:1096;s:4:\"file\";s:26:\"2024/09/202409271230-5.png\";s:8:\"filesize\";i:970021;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(268, 94, '_wp_attached_file', '2024/09/202409271230-6.png'),
(269, 94, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:600;s:6:\"height\";i:1096;s:4:\"file\";s:26:\"2024/09/202409271230-6.png\";s:8:\"filesize\";i:706038;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(270, 95, '_wp_attached_file', '2024/09/202409271240-cropped-202409271027-AIOT-LOGO-1024x1024-1.png'),
(271, 95, '_wp_attachment_context', 'site-icon'),
(272, 95, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:67:\"2024/09/202409271240-cropped-202409271027-AIOT-LOGO-1024x1024-1.png\";s:8:\"filesize\";i:20488;s:5:\"sizes\";a:4:{s:13:\"site_icon-270\";a:5:{s:4:\"file\";s:67:\"202409271240-cropped-202409271027-AIOT-LOGO-1024x1024-1-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:11604;}s:13:\"site_icon-192\";a:5:{s:4:\"file\";s:67:\"202409271240-cropped-202409271027-AIOT-LOGO-1024x1024-1-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:7642;}s:13:\"site_icon-180\";a:5:{s:4:\"file\";s:67:\"202409271240-cropped-202409271027-AIOT-LOGO-1024x1024-1-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:7104;}s:12:\"site_icon-32\";a:5:{s:4:\"file\";s:65:\"202409271240-cropped-202409271027-AIOT-LOGO-1024x1024-1-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:903;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(279, 101, '_wp_attached_file', '2024/09/202409271330-LOGOM360.png'),
(280, 101, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:303;s:6:\"height\";i:141;s:4:\"file\";s:33:\"2024/09/202409271330-LOGOM360.png\";s:8:\"filesize\";i:21916;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(281, 102, '_wp_attached_file', '2024/09/202409271420-Banner-Video.jpg'),
(282, 102, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:800;s:4:\"file\";s:37:\"2024/09/202409271420-Banner-Video.jpg\";s:8:\"filesize\";i:271530;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(308, 95, '_oembed_45904638c474829bc8f524cd2acaadc3', '{{unknown}}'),
(311, 138, '_wp_attached_file', '2024/09/202409281222-AIOT.mp4'),
(312, 138, '_wp_attachment_metadata', 'a:11:{s:7:\"bitrate\";i:865654;s:8:\"filesize\";i:2744131;s:9:\"mime_type\";s:9:\"video/mp4\";s:6:\"length\";i:25;s:16:\"length_formatted\";s:4:\"0:25\";s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:10:\"fileformat\";s:3:\"mp4\";s:10:\"dataformat\";s:9:\"quicktime\";s:5:\"audio\";a:9:{s:10:\"dataformat\";s:3:\"mp4\";s:7:\"bitrate\";i:2279;s:5:\"codec\";s:19:\"ISO/IEC 14496-3 AAC\";s:11:\"sample_rate\";d:48000;s:8:\"channels\";i:2;s:15:\"bits_per_sample\";i:16;s:8:\"lossless\";b:0;s:11:\"channelmode\";s:6:\"stereo\";s:17:\"compression_ratio\";d:0.0014837239583333334;}s:17:\"created_timestamp\";i:-2082844800;}'),
(319, 146, '_wp_attached_file', '2024/09/202409281349-DIGITAL-TRANSFORMATION.mp4'),
(320, 146, '_wp_attachment_metadata', 'a:10:{s:7:\"bitrate\";i:5784333;s:8:\"filesize\";i:2174326;s:9:\"mime_type\";s:15:\"video/quicktime\";s:6:\"length\";i:3;s:16:\"length_formatted\";s:4:\"0:03\";s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:10:\"fileformat\";s:3:\"mp4\";s:10:\"dataformat\";s:9:\"quicktime\";s:17:\"created_timestamp\";i:-2082844800;}'),
(326, 160, '_edit_lock', '1753433091:2'),
(329, 160, 'rank_math_analytic_object_id', '1'),
(330, 46, 'rank_math_analytic_object_id', '2'),
(331, 44, 'rank_math_analytic_object_id', '3'),
(332, 42, 'rank_math_analytic_object_id', '4'),
(333, 40, 'rank_math_analytic_object_id', '5'),
(334, 38, 'rank_math_analytic_object_id', '6'),
(335, 36, 'rank_math_analytic_object_id', '7'),
(336, 34, 'rank_math_analytic_object_id', '8'),
(337, 23, 'rank_math_analytic_object_id', '9'),
(338, 8, 'rank_math_analytic_object_id', '10'),
(339, 1, 'rank_math_analytic_object_id', '11'),
(341, 164, '_wp_attached_file', '2024/09/202409301351-AIoT-facebook-post.png'),
(342, 164, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:630;s:4:\"file\";s:43:\"2024/09/202409301351-AIoT-facebook-post.png\";s:8:\"filesize\";i:246419;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(343, 160, 'rank_math_internal_links_processed', '1'),
(347, 46, 'rank_math_internal_links_processed', '1'),
(348, 44, 'rank_math_internal_links_processed', '1'),
(349, 42, 'rank_math_internal_links_processed', '1'),
(350, 40, 'rank_math_internal_links_processed', '1'),
(351, 38, 'rank_math_internal_links_processed', '1'),
(352, 36, 'rank_math_internal_links_processed', '1'),
(353, 8, 'rank_math_internal_links_processed', '1'),
(354, 8, '_edit_last', '1'),
(356, 36, 'rank_math_seo_score', '7'),
(357, 36, '_thumbnail_id', '190'),
(358, 36, '_edit_last', '1'),
(360, 34, 'rank_math_seo_score', '10'),
(361, 34, 'rank_math_internal_links_processed', '1'),
(362, 34, '_thumbnail_id', '169'),
(363, 23, 'rank_math_internal_links_processed', '1'),
(364, 20, 'rank_math_internal_links_processed', '1'),
(365, 18, 'rank_math_internal_links_processed', '1'),
(366, 1, 'rank_math_internal_links_processed', '1'),
(367, 169, '_wp_attached_file', '2024/10/202410040601-DSCF1923.jpg'),
(368, 169, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1546;s:6:\"height\";i:869;s:4:\"file\";s:33:\"2024/10/202410040601-DSCF1923.jpg\";s:8:\"filesize\";i:698121;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"1.3\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:4:\"X-T5\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1678894648\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"50\";s:3:\"iso\";s:3:\"125\";s:13:\"shutter_speed\";s:5:\"0.005\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(369, 170, '_wp_attached_file', '2024/10/202410040601-Dien-gia-1-Nguyen-Manh-Hung.jpg'),
(370, 170, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2048;s:6:\"height\";i:2048;s:4:\"file\";s:52:\"2024/10/202410040601-Dien-gia-1-Nguyen-Manh-Hung.jpg\";s:8:\"filesize\";i:337007;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(371, 38, 'rank_math_seo_score', '10'),
(373, 172, '_wp_attached_file', '2024/10/202410040616-aiot-feature-image.jpg'),
(374, 172, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:43:\"2024/10/202410040616-aiot-feature-image.jpg\";s:8:\"filesize\";i:237250;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(379, 38, '_thumbnail_id', '175'),
(380, 175, '_wp_attached_file', '2024/10/202410040629-aiot-feature-image3.jpg'),
(381, 175, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:44:\"2024/10/202410040629-aiot-feature-image3.jpg\";s:8:\"filesize\";i:408445;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(382, 176, '_wp_attached_file', '2024/10/202410040736-3.jpg'),
(383, 176, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:26:\"2024/10/202410040736-3.jpg\";s:8:\"filesize\";i:157003;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(385, 44, 'rank_math_seo_score', '7'),
(386, 44, '_thumbnail_id', '176'),
(387, 179, '_wp_attached_file', '2024/10/202410040744-aiot-feature-image.jpg'),
(388, 179, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:43:\"2024/10/202410040744-aiot-feature-image.jpg\";s:8:\"filesize\";i:201017;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(390, 40, 'rank_math_seo_score', '10'),
(391, 40, '_thumbnail_id', '179'),
(392, 182, '_wp_attached_file', '2024/10/202410040844-aiot-feature-image1.jpg'),
(393, 182, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:44:\"2024/10/202410040844-aiot-feature-image1.jpg\";s:8:\"filesize\";i:97644;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(395, 42, 'rank_math_seo_score', '7'),
(396, 42, 'rank_math_seo_score', '7'),
(397, 42, '_thumbnail_id', '182'),
(400, 190, '_wp_attached_file', '2024/10/202410040902-aiot-feature-image2.jpg'),
(401, 190, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:44:\"2024/10/202410040902-aiot-feature-image2.jpg\";s:8:\"filesize\";i:486589;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(402, 22, '_wp_old_date', '2024-09-27'),
(403, 53, '_wp_old_date', '2024-09-27'),
(404, 52, '_wp_old_date', '2024-09-27'),
(433, 55, '_wp_old_date', '2024-09-27'),
(434, 68, '_wp_old_date', '2024-09-27'),
(441, 57, '_wp_old_date', '2024-09-27'),
(442, 58, '_wp_old_date', '2024-09-27'),
(443, 62, '_wp_old_date', '2024-09-27'),
(444, 60, '_wp_old_date', '2024-09-27'),
(445, 61, '_wp_old_date', '2024-09-27'),
(446, 59, '_wp_old_date', '2024-09-27'),
(447, 63, '_wp_old_date', '2024-09-27'),
(448, 204, '_menu_item_type', 'post_type'),
(449, 204, '_menu_item_menu_item_parent', '0'),
(450, 204, '_menu_item_object_id', '20'),
(451, 204, '_menu_item_object', 'page'),
(452, 204, '_menu_item_target', ''),
(453, 204, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(454, 204, '_menu_item_xfn', ''),
(455, 204, '_menu_item_url', ''),
(461, 207, '_thumbnail_id', '190'),
(462, 207, '_edit_lock', '1753238427:1'),
(463, 207, 'rank_math_seo_score', '7'),
(464, 207, 'rank_math_internal_links_processed', '1'),
(465, 207, '_edit_last', '1'),
(466, 210, '_thumbnail_id', '175'),
(467, 210, '_edit_lock', '1741792663:2'),
(468, 210, 'rank_math_seo_score', '10'),
(469, 210, 'rank_math_internal_links_processed', '1'),
(470, 210, '_edit_last', '1'),
(471, 213, '_thumbnail_id', '696'),
(472, 213, '_edit_lock', '1755674528:1'),
(473, 213, 'rank_math_seo_score', '10'),
(474, 213, 'rank_math_internal_links_processed', '1'),
(475, 213, '_edit_last', '1'),
(476, 215, '_thumbnail_id', '179'),
(477, 215, '_edit_lock', '1753425767:2'),
(478, 215, 'rank_math_seo_score', '10'),
(479, 215, 'rank_math_internal_links_processed', '1'),
(480, 215, '_edit_last', '1'),
(481, 217, '_thumbnail_id', '182'),
(482, 217, '_edit_lock', '1759380713:1'),
(483, 217, 'rank_math_seo_score', '14'),
(484, 217, 'rank_math_internal_links_processed', '1'),
(485, 217, '_edit_last', '1'),
(486, 219, '_thumbnail_id', '176'),
(487, 219, '_edit_lock', '1753426073:2'),
(488, 219, 'rank_math_seo_score', '10'),
(489, 219, 'rank_math_internal_links_processed', '1'),
(490, 219, '_edit_last', '1'),
(503, 238, '_menu_item_type', 'post_type'),
(504, 238, '_menu_item_menu_item_parent', '0'),
(505, 238, '_menu_item_object_id', '207'),
(506, 238, '_menu_item_object', 'page'),
(507, 238, '_menu_item_target', ''),
(508, 238, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(509, 238, '_menu_item_xfn', ''),
(510, 238, '_menu_item_url', ''),
(512, 239, '_menu_item_type', 'custom'),
(513, 239, '_menu_item_menu_item_parent', '0'),
(514, 239, '_menu_item_object_id', '239'),
(515, 239, '_menu_item_object', 'custom'),
(516, 239, '_menu_item_target', ''),
(517, 239, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(518, 239, '_menu_item_xfn', ''),
(519, 239, '_menu_item_url', '/blogs'),
(521, 240, '_menu_item_type', 'post_type'),
(522, 240, '_menu_item_menu_item_parent', '0'),
(523, 240, '_menu_item_object_id', '20'),
(524, 240, '_menu_item_object', 'page'),
(525, 240, '_menu_item_target', ''),
(526, 240, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(527, 240, '_menu_item_xfn', ''),
(528, 240, '_menu_item_url', ''),
(530, 241, '_menu_item_type', 'post_type'),
(531, 241, '_menu_item_menu_item_parent', '0'),
(532, 241, '_menu_item_object_id', '207'),
(533, 241, '_menu_item_object', 'page'),
(534, 241, '_menu_item_target', ''),
(535, 241, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(536, 241, '_menu_item_xfn', ''),
(537, 241, '_menu_item_url', ''),
(539, 242, '_menu_item_type', 'post_type'),
(540, 242, '_menu_item_menu_item_parent', '241'),
(541, 242, '_menu_item_object_id', '213'),
(542, 242, '_menu_item_object', 'page'),
(543, 242, '_menu_item_target', ''),
(544, 242, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(545, 242, '_menu_item_xfn', ''),
(546, 242, '_menu_item_url', ''),
(548, 243, '_menu_item_type', 'post_type'),
(549, 243, '_menu_item_menu_item_parent', '241'),
(550, 243, '_menu_item_object_id', '210'),
(551, 243, '_menu_item_object', 'page'),
(552, 243, '_menu_item_target', ''),
(553, 243, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(554, 243, '_menu_item_xfn', ''),
(555, 243, '_menu_item_url', ''),
(557, 244, '_menu_item_type', 'post_type'),
(558, 244, '_menu_item_menu_item_parent', '241'),
(559, 244, '_menu_item_object_id', '219'),
(560, 244, '_menu_item_object', 'page'),
(561, 244, '_menu_item_target', ''),
(562, 244, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(563, 244, '_menu_item_xfn', ''),
(564, 244, '_menu_item_url', ''),
(566, 245, '_menu_item_type', 'post_type'),
(567, 245, '_menu_item_menu_item_parent', '241'),
(568, 245, '_menu_item_object_id', '215'),
(569, 245, '_menu_item_object', 'page'),
(570, 245, '_menu_item_target', ''),
(571, 245, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(572, 245, '_menu_item_xfn', ''),
(573, 245, '_menu_item_url', ''),
(575, 246, '_menu_item_type', 'post_type'),
(576, 246, '_menu_item_menu_item_parent', '241'),
(577, 246, '_menu_item_object_id', '217'),
(578, 246, '_menu_item_object', 'page'),
(579, 246, '_menu_item_target', ''),
(580, 246, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(581, 246, '_menu_item_xfn', ''),
(582, 246, '_menu_item_url', ''),
(584, 247, '_menu_item_type', 'custom'),
(585, 247, '_menu_item_menu_item_parent', '0'),
(586, 247, '_menu_item_object_id', '247'),
(587, 247, '_menu_item_object', 'custom'),
(588, 247, '_menu_item_target', ''),
(589, 247, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(590, 247, '_menu_item_xfn', ''),
(591, 247, '_menu_item_url', '/blogs'),
(593, 248, '_menu_item_type', 'custom'),
(594, 248, '_menu_item_menu_item_parent', '0'),
(595, 248, '_menu_item_object_id', '248'),
(596, 248, '_menu_item_object', 'custom'),
(597, 248, '_menu_item_target', ''),
(598, 248, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(599, 248, '_menu_item_xfn', ''),
(600, 248, '_menu_item_url', '/contact'),
(603, 20, '_edit_last', '1'),
(608, 283, '_edit_lock', '1741792743:2'),
(609, 284, '_wp_attached_file', '2024/10/202410041421-aiot-feature-image3.jpg'),
(610, 284, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:44:\"2024/10/202410041421-aiot-feature-image3.jpg\";s:8:\"filesize\";i:166945;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(611, 283, 'rank_math_seo_score', '3'),
(612, 283, 'rank_math_internal_links_processed', '1'),
(613, 283, '_thumbnail_id', '284'),
(614, 283, '_edit_last', '1'),
(615, 286, '_edit_lock', '1741761475:2'),
(616, 287, '_wp_attached_file', '2024/10/202410041423-aiot-feature-image4.jpg'),
(617, 287, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:44:\"2024/10/202410041423-aiot-feature-image4.jpg\";s:8:\"filesize\";i:469281;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(618, 286, 'rank_math_internal_links_processed', '1'),
(619, 286, 'rank_math_seo_score', '10'),
(620, 286, '_thumbnail_id', '287'),
(621, 286, '_edit_last', '1'),
(622, 289, '_thumbnail_id', '284'),
(623, 289, '_edit_lock', '1753367409:1'),
(624, 289, 'rank_math_seo_score', '3'),
(625, 289, 'rank_math_internal_links_processed', '1'),
(626, 289, '_edit_last', '1'),
(627, 291, '_thumbnail_id', '287'),
(628, 291, '_edit_lock', '1753238494:1'),
(629, 291, 'rank_math_internal_links_processed', '1'),
(630, 291, 'rank_math_seo_score', '10'),
(631, 291, '_edit_last', '1'),
(632, 293, '_edit_lock', '1741745790:2'),
(633, 294, '_wp_attached_file', '2024/10/202410041427-aiot-feature-image5.jpg'),
(634, 294, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:44:\"2024/10/202410041427-aiot-feature-image5.jpg\";s:8:\"filesize\";i:195507;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(635, 293, 'rank_math_internal_links_processed', '1'),
(636, 293, 'rank_math_seo_score', '10'),
(637, 293, '_thumbnail_id', '294'),
(638, 293, '_edit_last', '1'),
(639, 296, '_thumbnail_id', '294'),
(640, 296, '_edit_lock', '1753313664:1'),
(641, 296, 'rank_math_seo_score', '10'),
(642, 296, 'rank_math_internal_links_processed', '1'),
(643, 296, '_edit_last', '1'),
(644, 298, '_edit_lock', '1741745796:2'),
(645, 299, '_wp_attached_file', '2024/10/202410041430-aiot-feature-image6.jpg'),
(646, 299, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:44:\"2024/10/202410041430-aiot-feature-image6.jpg\";s:8:\"filesize\";i:214259;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(647, 298, 'rank_math_internal_links_processed', '1'),
(648, 298, 'rank_math_seo_score', '10'),
(649, 298, '_thumbnail_id', '299'),
(650, 298, '_edit_last', '1'),
(651, 301, '_thumbnail_id', '299'),
(652, 301, '_edit_lock', '1741745767:2'),
(653, 301, 'rank_math_internal_links_processed', '1'),
(654, 301, 'rank_math_seo_score', '10'),
(655, 301, '_edit_last', '1'),
(656, 303, '_edit_lock', '1733455231:1'),
(657, 304, '_wp_attached_file', '2024/10/202410041433-aiot-feature-image7.jpg'),
(658, 304, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:44:\"2024/10/202410041433-aiot-feature-image7.jpg\";s:8:\"filesize\";i:369866;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(659, 303, 'rank_math_seo_score', '10'),
(660, 303, 'rank_math_internal_links_processed', '1'),
(661, 303, '_thumbnail_id', '304'),
(662, 303, '_edit_last', '1'),
(663, 306, '_thumbnail_id', '304'),
(664, 306, '_edit_lock', '1750290457:1'),
(665, 306, 'rank_math_seo_score', '10'),
(666, 306, 'rank_math_internal_links_processed', '1'),
(667, 306, '_edit_last', '1'),
(668, 308, '_menu_item_type', 'post_type'),
(669, 308, '_menu_item_menu_item_parent', '0'),
(670, 308, '_menu_item_object_id', '283'),
(671, 308, '_menu_item_object', 'page'),
(672, 308, '_menu_item_target', ''),
(673, 308, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(674, 308, '_menu_item_xfn', ''),
(675, 308, '_menu_item_url', ''),
(677, 309, '_menu_item_type', 'post_type'),
(678, 309, '_menu_item_menu_item_parent', '0'),
(679, 309, '_menu_item_object_id', '283'),
(680, 309, '_menu_item_object', 'page'),
(681, 309, '_menu_item_target', ''),
(682, 309, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(683, 309, '_menu_item_xfn', ''),
(684, 309, '_menu_item_url', ''),
(686, 310, '_menu_item_type', 'post_type'),
(687, 310, '_menu_item_menu_item_parent', '309'),
(688, 310, '_menu_item_object_id', '303'),
(689, 310, '_menu_item_object', 'page'),
(690, 310, '_menu_item_target', ''),
(691, 310, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(692, 310, '_menu_item_xfn', ''),
(693, 310, '_menu_item_url', ''),
(695, 311, '_menu_item_type', 'post_type'),
(696, 311, '_menu_item_menu_item_parent', '309'),
(697, 311, '_menu_item_object_id', '298'),
(698, 311, '_menu_item_object', 'page'),
(699, 311, '_menu_item_target', ''),
(700, 311, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(701, 311, '_menu_item_xfn', ''),
(702, 311, '_menu_item_url', ''),
(704, 312, '_menu_item_type', 'post_type'),
(705, 312, '_menu_item_menu_item_parent', '309'),
(706, 312, '_menu_item_object_id', '293'),
(707, 312, '_menu_item_object', 'page'),
(708, 312, '_menu_item_target', ''),
(709, 312, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(710, 312, '_menu_item_xfn', ''),
(711, 312, '_menu_item_url', ''),
(713, 313, '_menu_item_type', 'post_type'),
(714, 313, '_menu_item_menu_item_parent', '309'),
(715, 313, '_menu_item_object_id', '286'),
(716, 313, '_menu_item_object', 'page'),
(717, 313, '_menu_item_target', ''),
(718, 313, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(719, 313, '_menu_item_xfn', ''),
(720, 313, '_menu_item_url', ''),
(722, 314, '_menu_item_type', 'post_type'),
(723, 314, '_menu_item_menu_item_parent', '0'),
(724, 314, '_menu_item_object_id', '289'),
(725, 314, '_menu_item_object', 'page'),
(726, 314, '_menu_item_target', ''),
(727, 314, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(728, 314, '_menu_item_xfn', ''),
(729, 314, '_menu_item_url', ''),
(731, 315, '_menu_item_type', 'post_type'),
(732, 315, '_menu_item_menu_item_parent', '314'),
(733, 315, '_menu_item_object_id', '306'),
(734, 315, '_menu_item_object', 'page'),
(735, 315, '_menu_item_target', ''),
(736, 315, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(737, 315, '_menu_item_xfn', ''),
(738, 315, '_menu_item_url', ''),
(740, 316, '_menu_item_type', 'post_type'),
(741, 316, '_menu_item_menu_item_parent', '314'),
(742, 316, '_menu_item_object_id', '301'),
(743, 316, '_menu_item_object', 'page'),
(744, 316, '_menu_item_target', ''),
(745, 316, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(746, 316, '_menu_item_xfn', ''),
(747, 316, '_menu_item_url', ''),
(749, 317, '_menu_item_type', 'post_type'),
(750, 317, '_menu_item_menu_item_parent', '314'),
(751, 317, '_menu_item_object_id', '296'),
(752, 317, '_menu_item_object', 'page'),
(753, 317, '_menu_item_target', ''),
(754, 317, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(755, 317, '_menu_item_xfn', ''),
(756, 317, '_menu_item_url', ''),
(758, 318, '_menu_item_type', 'post_type'),
(759, 318, '_menu_item_menu_item_parent', '314'),
(760, 318, '_menu_item_object_id', '291'),
(761, 318, '_menu_item_object', 'page'),
(762, 318, '_menu_item_target', ''),
(763, 318, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(764, 318, '_menu_item_xfn', ''),
(765, 318, '_menu_item_url', ''),
(767, 319, '_menu_item_type', 'post_type'),
(768, 319, '_menu_item_menu_item_parent', '0'),
(769, 319, '_menu_item_object_id', '289'),
(770, 319, '_menu_item_object', 'page'),
(771, 319, '_menu_item_target', ''),
(772, 319, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(773, 319, '_menu_item_xfn', ''),
(774, 319, '_menu_item_url', ''),
(776, 320, '_edit_lock', '1750376970:1'),
(777, 320, 'rank_math_seo_score', '6'),
(778, 320, 'rank_math_internal_links_processed', '1'),
(779, 320, '_edit_last', '1'),
(785, 160, 'rank_math_seo_score', '10'),
(786, 160, '_edit_last', '1'),
(788, 357, '_edit_lock', '1753695774:2'),
(789, 357, 'rank_math_seo_score', '10'),
(790, 357, 'rank_math_internal_links_processed', '1'),
(791, 357, '_edit_last', '1'),
(792, 358, '_menu_item_type', 'post_type'),
(793, 358, '_menu_item_menu_item_parent', '68'),
(794, 358, '_menu_item_object_id', '160'),
(795, 358, '_menu_item_object', 'blog'),
(796, 358, '_menu_item_target', ''),
(797, 358, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(798, 358, '_menu_item_xfn', ''),
(799, 358, '_menu_item_url', ''),
(801, 55, '_wp_old_date', '2024-10-04'),
(802, 68, '_wp_old_date', '2024-10-04'),
(803, 57, '_wp_old_date', '2024-10-04'),
(804, 58, '_wp_old_date', '2024-10-04'),
(805, 62, '_wp_old_date', '2024-10-04'),
(806, 60, '_wp_old_date', '2024-10-04'),
(807, 61, '_wp_old_date', '2024-10-04'),
(808, 59, '_wp_old_date', '2024-10-04'),
(809, 309, '_wp_old_date', '2024-10-04'),
(810, 310, '_wp_old_date', '2024-10-04'),
(811, 311, '_wp_old_date', '2024-10-04'),
(812, 312, '_wp_old_date', '2024-10-04'),
(813, 313, '_wp_old_date', '2024-10-04'),
(814, 63, '_wp_old_date', '2024-10-04'),
(815, 359, '_menu_item_type', 'post_type'),
(816, 359, '_menu_item_menu_item_parent', '247'),
(817, 359, '_menu_item_object_id', '357'),
(818, 359, '_menu_item_object', 'blog'),
(819, 359, '_menu_item_target', ''),
(820, 359, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(821, 359, '_menu_item_xfn', ''),
(822, 359, '_menu_item_url', ''),
(824, 240, '_wp_old_date', '2024-10-04'),
(825, 241, '_wp_old_date', '2024-10-04'),
(826, 242, '_wp_old_date', '2024-10-04'),
(827, 243, '_wp_old_date', '2024-10-04'),
(828, 244, '_wp_old_date', '2024-10-04'),
(829, 245, '_wp_old_date', '2024-10-04'),
(830, 246, '_wp_old_date', '2024-10-04'),
(831, 247, '_wp_old_date', '2024-10-04'),
(832, 314, '_wp_old_date', '2024-10-04'),
(833, 315, '_wp_old_date', '2024-10-04'),
(834, 316, '_wp_old_date', '2024-10-04'),
(835, 317, '_wp_old_date', '2024-10-04'),
(836, 318, '_wp_old_date', '2024-10-04'),
(837, 248, '_wp_old_date', '2024-10-04'),
(839, 364, '_wp_attached_file', '2024/10/202410051351-launching-innovate-vietnam-2024-a-hub-for-the-innovation-ecosystem-20241001113125.jpg'),
(840, 364, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:850;s:6:\"height\";i:567;s:4:\"file\";s:106:\"2024/10/202410051351-launching-innovate-vietnam-2024-a-hub-for-the-innovation-ecosystem-20241001113125.jpg\";s:8:\"filesize\";i:203119;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(841, 160, '_thumbnail_id', '364'),
(842, 357, '_thumbnail_id', '364'),
(844, 22, '_wp_old_date', '2024-10-04'),
(845, 53, '_wp_old_date', '2024-10-04'),
(846, 308, '_wp_old_date', '2024-10-04'),
(847, 52, '_wp_old_date', '2024-10-04'),
(848, 204, '_wp_old_date', '2024-10-04'),
(849, 238, '_wp_old_date', '2024-10-04'),
(850, 319, '_wp_old_date', '2024-10-04'),
(851, 239, '_wp_old_date', '2024-10-04'),
(853, 375, '_wp_attached_file', '2024/10/202410060258-Banner-Video1.jpg'),
(854, 375, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:800;s:4:\"file\";s:38:\"2024/10/202410060258-Banner-Video1.jpg\";s:8:\"filesize\";i:115847;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(855, 377, '_wp_attached_file', '2024/10/202410060300-Banner-Video2.jpg'),
(856, 377, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:800;s:4:\"file\";s:38:\"2024/10/202410060300-Banner-Video2.jpg\";s:8:\"filesize\";i:166359;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(857, 379, '_wp_attached_file', '2024/10/202410060317-aiot-feature-image8.jpg'),
(858, 379, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:44:\"2024/10/202410060317-aiot-feature-image8.jpg\";s:8:\"filesize\";i:382912;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(868, 204, '_wp_old_date', '2024-10-05'),
(869, 238, '_wp_old_date', '2024-10-05'),
(870, 319, '_wp_old_date', '2024-10-05'),
(871, 239, '_wp_old_date', '2024-10-05'),
(872, 204, '_wp_old_date', '2024-10-07'),
(873, 238, '_wp_old_date', '2024-10-07'),
(874, 319, '_wp_old_date', '2024-10-07'),
(875, 239, '_wp_old_date', '2024-10-07'),
(877, 20, 'footnotes', ''),
(878, 387, '_wp_attached_file', '2024/10/202410080558-aiot-tech-stack.jpg'),
(879, 387, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:40:\"2024/10/202410080558-aiot-tech-stack.jpg\";s:8:\"filesize\";i:211176;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(881, 389, 'footnotes', ''),
(882, 390, 'footnotes', ''),
(884, 20, 'rank_math_seo_score', '4'),
(885, 392, 'footnotes', ''),
(886, 393, 'footnotes', ''),
(887, 394, 'footnotes', ''),
(888, 395, 'footnotes', ''),
(889, 396, 'footnotes', ''),
(891, 398, 'footnotes', ''),
(892, 399, 'footnotes', ''),
(894, 401, 'footnotes', ''),
(895, 402, 'footnotes', ''),
(896, 403, 'footnotes', ''),
(898, 405, 'footnotes', ''),
(900, 407, 'footnotes', ''),
(902, 409, 'footnotes', ''),
(907, 418, '_wp_attached_file', '2024/10/202410111330-AIOT-Banner-White.mp4'),
(908, 418, '_wp_attachment_metadata', 'a:10:{s:7:\"bitrate\";i:3249559;s:8:\"filesize\";i:3690235;s:9:\"mime_type\";s:15:\"video/quicktime\";s:6:\"length\";i:9;s:16:\"length_formatted\";s:4:\"0:09\";s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:10:\"fileformat\";s:3:\"mp4\";s:10:\"dataformat\";s:9:\"quicktime\";s:17:\"created_timestamp\";i:-2082844800;}'),
(909, 419, 'footnotes', ''),
(910, 420, '_wp_attached_file', '2024/10/202410111358-Banner-Video3.jpg'),
(911, 420, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:800;s:4:\"file\";s:38:\"2024/10/202410111358-Banner-Video3.jpg\";s:8:\"filesize\";i:90002;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(912, 421, 'footnotes', ''),
(913, 422, '_wp_attached_file', '2024/10/202410111408-Banner-Video4.jpg'),
(914, 422, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:800;s:4:\"file\";s:38:\"2024/10/202410111408-Banner-Video4.jpg\";s:8:\"filesize\";i:106405;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(915, 423, 'footnotes', ''),
(916, 424, '_wp_attached_file', '2024/10/202410120928-mask.png'),
(917, 424, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:710;s:6:\"height\";i:2000;s:4:\"file\";s:29:\"2024/10/202410120928-mask.png\";s:8:\"filesize\";i:7031;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(936, 440, '_edit_lock', '1741793479:2'),
(937, 440, 'rank_math_internal_links_processed', '1'),
(941, 440, '_wp_desired_post_slug', ''),
(943, 440, 'rank_math_seo_score', '10'),
(945, 445, '_wp_attached_file', '2024/10/202410170640-4624576345377638623416678100198556909098138n.jpg'),
(946, 445, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2048;s:6:\"height\";i:2048;s:4:\"file\";s:69:\"2024/10/202410170640-4624576345377638623416678100198556909098138n.jpg\";s:8:\"filesize\";i:519776;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(955, 440, 'rank_math_og_content_image', 'a:2:{s:5:\"check\";s:32:\"7b5b3aaa0d73a7d8dc375fbb19360c3c\";s:6:\"images\";a:1:{i:0;i:445;}}'),
(973, 450, '_edit_lock', '1753696631:2'),
(974, 450, 'rank_math_seo_score', '7'),
(975, 450, 'rank_math_internal_links_processed', '1'),
(976, 451, '_wp_attached_file', '2024/10/202410170814-z593931307933631eef6f60c9178e2e6a013b6fe3035b5-e1729152888736.jpg'),
(977, 451, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1099;s:6:\"height\";i:1153;s:4:\"file\";s:86:\"2024/10/202410170814-z593931307933631eef6f60c9178e2e6a013b6fe3035b5-e1729152888736.jpg\";s:8:\"filesize\";i:606567;s:5:\"sizes\";a:1:{s:12:\"medium_large\";a:5:{s:4:\"file\";s:86:\"202410170814-z593931307933631eef6f60c9178e2e6a013b6fe3035b5-e1729152888736-768x806.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:806;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:113179;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(978, 451, '_wp_attachment_backup_sizes', 'a:1:{s:9:\"full-orig\";a:3:{s:5:\"width\";i:2048;s:6:\"height\";i:1152;s:4:\"file\";s:63:\"202410170814-z593931307933631eef6f60c9178e2e6a013b6fe3035b5.jpg\";}}'),
(979, 450, '_thumbnail_id', '451'),
(980, 440, '_thumbnail_id', '451'),
(981, 450, '_edit_last', '2'),
(983, 453, '_edit_lock', '1753433297:2'),
(984, 453, 'rank_math_internal_links_processed', '1'),
(985, 454, '_wp_attached_file', '2024/11/202411070312-2.png'),
(986, 454, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1440;s:4:\"file\";s:26:\"2024/11/202411070312-2.png\";s:8:\"filesize\";i:3482068;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(987, 455, '_wp_attached_file', '2024/11/202411070312-3.png'),
(988, 455, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1440;s:4:\"file\";s:26:\"2024/11/202411070312-3.png\";s:8:\"filesize\";i:4064589;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(989, 453, 'rank_math_seo_score', '7'),
(992, 453, 'rank_math_og_content_image', 'a:2:{s:5:\"check\";s:32:\"55b646a901670a5b98ed16570be1c8da\";s:6:\"images\";a:1:{i:0;i:455;}}'),
(993, 453, '_thumbnail_id', '454'),
(995, 459, '_thumbnail_id', '454'),
(996, 459, '_edit_lock', '1753433300:2'),
(997, 459, 'rank_math_internal_links_processed', '1'),
(998, 459, 'rank_math_seo_score', '10'),
(999, 460, '_edit_lock', '1758618423:2'),
(1000, 460, 'rank_math_internal_links_processed', '1'),
(1001, 460, 'rank_math_seo_score', '12'),
(1002, 461, '_wp_attached_file', '2024/11/202411120225-12.png'),
(1003, 461, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:27:\"2024/11/202411120225-12.png\";s:8:\"filesize\";i:2068746;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1004, 462, '_wp_attached_file', '2024/11/202411120225-13.png');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1005, 462, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:27:\"2024/11/202411120225-13.png\";s:8:\"filesize\";i:1677555;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1006, 463, '_wp_attached_file', '2024/11/202411120226-14.png'),
(1007, 463, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:27:\"2024/11/202411120226-14.png\";s:8:\"filesize\";i:1923548;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1008, 460, '_thumbnail_id', '461'),
(1009, 464, '_thumbnail_id', '461'),
(1010, 464, '_edit_lock', '1731640643:2'),
(1011, 464, 'rank_math_internal_links_processed', '1'),
(1012, 465, '_wp_attached_file', '2024/11/202411150316-13.png'),
(1013, 465, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:27:\"2024/11/202411150316-13.png\";s:8:\"filesize\";i:1677588;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1014, 466, '_wp_attached_file', '2024/11/202411150317-14.png'),
(1015, 466, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:27:\"2024/11/202411150317-14.png\";s:8:\"filesize\";i:1923581;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1016, 464, 'rank_math_seo_score', '12'),
(1017, 467, '_edit_lock', '1753275502:1'),
(1018, 467, 'rank_math_internal_links_processed', '1'),
(1019, 468, '_edit_lock', '1753275507:1'),
(1020, 468, 'rank_math_internal_links_processed', '1'),
(1023, 473, 'footnotes', ''),
(1033, 498, 'footnotes', ''),
(1035, 501, 'footnotes', ''),
(1037, 46, 'rank_math_seo_score', '6'),
(1043, 528, 'footnotes', ''),
(1052, 547, 'footnotes', ''),
(1054, 550, '_wp_attached_file', '2024/12/202412100423-john-doe.vcf'),
(1055, 550, '_wp_attachment_metadata', 'a:1:{s:8:\"filesize\";i:940;}'),
(1056, 550, '_edit_lock', '1733805036:1'),
(1057, 552, '_edit_lock', '1753696402:2'),
(1058, 552, 'rank_math_internal_links_processed', '1'),
(1059, 552, 'rank_math_seo_score', '10'),
(1063, 555, '_edit_lock', '1753432476:2'),
(1064, 555, 'rank_math_internal_links_processed', '1'),
(1065, 555, 'rank_math_seo_score', '7'),
(1066, 556, '_edit_lock', '1753693563:2'),
(1067, 556, 'rank_math_internal_links_processed', '1'),
(1068, 556, 'rank_math_seo_score', '10'),
(1069, 558, '_edit_lock', '1753432503:2'),
(1070, 558, 'rank_math_internal_links_processed', '1'),
(1071, 558, 'rank_math_seo_score', '4'),
(1072, 558, '_edit_last', '1'),
(1073, 561, '_edit_lock', '1753687203:2'),
(1074, 561, 'rank_math_internal_links_processed', '1'),
(1075, 561, 'rank_math_seo_score', '6'),
(1082, 563, '_edit_lock', '1753432521:2'),
(1083, 563, 'rank_math_internal_links_processed', '1'),
(1084, 563, 'rank_math_seo_score', '7'),
(1085, 563, '_edit_last', '1'),
(1086, 564, '_edit_lock', '1753688347:2'),
(1087, 564, 'rank_math_internal_links_processed', '1'),
(1088, 564, 'rank_math_seo_score', '7'),
(1089, 564, '_edit_last', '2'),
(1090, 566, '_edit_lock', '1753432555:2'),
(1091, 566, 'rank_math_internal_links_processed', '1'),
(1092, 566, 'rank_math_seo_score', '8'),
(1093, 566, '_edit_last', '1'),
(1094, 568, '_form', '<label> Your name\n    [text* your-name autocomplete:name] </label>\n\n<label> Your email\n    [email* your-email autocomplete:email] </label>\n\n<label> Subject\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit \"Submit\"]'),
(1095, 568, '_mail', 'a:8:{s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:38:\"[_site_title] <info@aiot-fixing.local>\";s:4:\"body\";s:191:\"From: [your-name] [your-email]\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis is a notification that a contact form was submitted on your website ([_site_title] [_site_url]).\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(1096, 568, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:38:\"[_site_title] <info@aiot-fixing.local>\";s:4:\"body\";s:220:\"Message Body:\n[your-message]\n\n-- \nThis email is a receipt for your contact form submission on our website ([_site_title] [_site_url]) in which your email address was used. If that was not you, please ignore this message.\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(1097, 568, '_messages', 'a:12:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:27:\"Please fill out this field.\";s:16:\"invalid_too_long\";s:32:\"This field has a too long input.\";s:17:\"invalid_too_short\";s:33:\"This field has a too short input.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:31:\"The uploaded file is too large.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";}'),
(1098, 568, '_additional_settings', ''),
(1099, 568, '_locale', 'en_US'),
(1100, 568, '_hash', '5fe4be1367355e425aef8951bb5bdf49041993f0'),
(1101, 569, '_edit_lock', '1757390155:2'),
(1102, 569, 'rank_math_internal_links_processed', '1'),
(1103, 569, 'rank_math_seo_score', '10'),
(1104, 569, '_edit_last', '2'),
(1105, 571, '_edit_lock', '1753432572:2'),
(1106, 571, 'rank_math_internal_links_processed', '1'),
(1107, 571, '_edit_last', '1'),
(1108, 571, 'rank_math_seo_score', '6'),
(1109, 561, '_edit_last', '2'),
(1110, 552, '_edit_last', '2'),
(1111, 556, '_edit_last', '2'),
(1113, 574, '_edit_lock', '1753433563:2'),
(1114, 574, 'rank_math_internal_links_processed', '1'),
(1115, 574, 'rank_math_seo_score', '10'),
(1116, 574, '_edit_last', '2'),
(1117, 575, '_edit_lock', '1753433479:2'),
(1118, 575, 'rank_math_internal_links_processed', '1'),
(1119, 575, 'rank_math_seo_score', '6'),
(1120, 575, '_edit_last', '1'),
(1126, 584, '_edit_lock', '1753689303:2'),
(1127, 584, 'rank_math_internal_links_processed', '1'),
(1128, 584, 'rank_math_seo_score', '7'),
(1129, 584, '_edit_last', '2'),
(1130, 585, '_edit_lock', '1753433534:2'),
(1131, 585, 'rank_math_internal_links_processed', '1'),
(1132, 585, 'rank_math_seo_score', '8'),
(1133, 585, '_edit_last', '1'),
(1134, 586, 'footnotes', ''),
(1142, 593, 'footnotes', ''),
(1144, 595, '_edit_lock', '1755674534:1'),
(1145, 595, 'rank_math_internal_links_processed', '1'),
(1146, 595, 'rank_math_seo_score', '7'),
(1147, 595, '_thumbnail_id', '379'),
(1152, 595, '_edit_last', '1'),
(1157, 606, '_edit_lock', '1742216793:2'),
(1158, 606, 'rank_math_seo_score', '10'),
(1159, 606, 'rank_math_internal_links_processed', '1'),
(1160, 606, '_thumbnail_id', '613'),
(1161, 606, '_edit_last', '1'),
(1162, 608, 'footnotes', ''),
(1163, 609, '_thumbnail_id', '379'),
(1164, 609, '_edit_lock', '1742182889:1'),
(1165, 609, 'rank_math_seo_score', '7'),
(1166, 609, 'rank_math_internal_links_processed', '1'),
(1167, 609, '_edit_last', '1'),
(1171, 611, 'footnotes', ''),
(1172, 612, 'footnotes', ''),
(1173, 613, '_wp_attached_file', '2025/03/202503171304-133444258000458214.jpg'),
(1174, 613, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:43:\"2025/03/202503171304-133444258000458214.jpg\";s:8:\"filesize\";i:92295;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1175, 616, '_edit_lock', '1742542210:2'),
(1176, 616, 'rank_math_internal_links_processed', '1'),
(1177, 617, '_wp_attached_file', '2025/03/202503171318-crm-la-gi.webp'),
(1178, 617, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:628;s:4:\"file\";s:35:\"2025/03/202503171318-crm-la-gi.webp\";s:8:\"filesize\";i:114820;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1179, 616, 'rank_math_seo_score', '10'),
(1180, 616, '_thumbnail_id', '617'),
(1181, 619, '_edit_lock', '1753427868:2'),
(1182, 619, 'rank_math_internal_links_processed', '1'),
(1183, 620, '_wp_attached_file', '2025/03/202503180230-gis-quan-ly-thien-tai-300x237-1.jpg'),
(1184, 620, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:300;s:6:\"height\";i:237;s:4:\"file\";s:56:\"2025/03/202503180230-gis-quan-ly-thien-tai-300x237-1.jpg\";s:8:\"filesize\";i:17946;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1185, 619, 'rank_math_seo_score', '10'),
(1186, 619, '_thumbnail_id', '620'),
(1187, 622, '_edit_lock', '1742271541:2'),
(1188, 622, 'rank_math_internal_links_processed', '1'),
(1189, 623, '_wp_attached_file', '2025/03/202503180234-nang-luong-tai-tao111.png'),
(1190, 623, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1364;s:6:\"height\";i:909;s:4:\"file\";s:46:\"2025/03/202503180234-nang-luong-tai-tao111.png\";s:8:\"filesize\";i:1753031;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1191, 622, 'rank_math_seo_score', '10'),
(1192, 622, '_thumbnail_id', '623'),
(1193, 629, 'footnotes', ''),
(1194, 632, '_edit_lock', '1753433554:2'),
(1195, 632, 'rank_math_internal_links_processed', '1'),
(1196, 632, 'rank_math_seo_score', '10'),
(1197, 632, '_edit_last', '2'),
(1198, 634, '_edit_lock', '1753434021:2'),
(1199, 634, 'rank_math_internal_links_processed', '1'),
(1200, 634, 'rank_math_seo_score', '8'),
(1201, 634, '_edit_last', '1'),
(1202, 635, '_edit_lock', '1742974855:2'),
(1203, 635, 'rank_math_internal_links_processed', '1'),
(1204, 635, 'rank_math_seo_score', '9'),
(1206, 635, '_edit_last', '1'),
(1210, 654, '_edit_lock', '1756871728:2'),
(1211, 654, 'rank_math_internal_links_processed', '1'),
(1212, 654, 'rank_math_seo_score', '10'),
(1213, 654, '_edit_last', '2'),
(1214, 655, '_edit_lock', '1756871630:2'),
(1215, 655, 'rank_math_internal_links_processed', '1'),
(1216, 655, 'rank_math_seo_score', '6'),
(1217, 655, '_edit_last', '1'),
(1220, 657, '_wp_attached_file', '2025/04/202504010257-1.jpg'),
(1221, 657, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1600;s:6:\"height\";i:1200;s:4:\"file\";s:26:\"2025/04/202504010257-1.jpg\";s:8:\"filesize\";i:189178;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1222, 658, '_wp_attached_file', '2025/04/202504010257-4.jpg'),
(1223, 658, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1600;s:6:\"height\";i:1200;s:4:\"file\";s:26:\"2025/04/202504010257-4.jpg\";s:8:\"filesize\";i:229853;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1224, 659, '_wp_attached_file', '2025/04/202504010257-3.jpg'),
(1225, 659, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1600;s:6:\"height\";i:1200;s:4:\"file\";s:26:\"2025/04/202504010257-3.jpg\";s:8:\"filesize\";i:222974;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1226, 660, '_wp_attached_file', '2025/04/202504010258-2.jpg'),
(1227, 660, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1600;s:6:\"height\";i:1200;s:4:\"file\";s:26:\"2025/04/202504010258-2.jpg\";s:8:\"filesize\";i:196762;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1231, 663, '_wp_attached_file', '2025/04/202504010307-Image.jpeg'),
(1232, 663, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1000;s:6:\"height\";i:750;s:4:\"file\";s:31:\"2025/04/202504010307-Image.jpeg\";s:8:\"filesize\";i:154981;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(1234, 667, '_edit_lock', '1753696119:2'),
(1235, 667, 'rank_math_internal_links_processed', '1'),
(1236, 667, 'rank_math_seo_score', '12'),
(1241, 667, '_thumbnail_id', '657'),
(1246, 672, 'rank_math_internal_links_processed', '1'),
(1247, 672, 'rank_math_internal_links_processed', '1'),
(1248, 672, 'rank_math_seo_score', '12'),
(1249, 672, '_thumbnail_id', '657'),
(1250, 672, '_dp_original', '667'),
(1251, 672, '_edit_lock', '1753433207:2'),
(1252, 673, '_edit_lock', '1758767389:2'),
(1253, 673, 'rank_math_internal_links_processed', '1'),
(1254, 673, 'rank_math_seo_score', '10'),
(1255, 673, '_edit_last', '2'),
(1256, 674, '_edit_lock', '1753432925:2'),
(1257, 674, 'rank_math_internal_links_processed', '1'),
(1258, 674, 'rank_math_seo_score', '6'),
(1259, 674, '_edit_last', '1'),
(1260, 675, '_edit_lock', '1755674300:1'),
(1261, 675, 'rank_math_internal_links_processed', '1'),
(1262, 675, 'rank_math_seo_score', '12'),
(1263, 675, '_edit_last', '1'),
(1265, 688, '_menu_item_type', 'post_type'),
(1266, 688, '_menu_item_menu_item_parent', '0'),
(1267, 688, '_menu_item_object_id', '675'),
(1268, 688, '_menu_item_object', 'page'),
(1269, 688, '_menu_item_target', ''),
(1270, 688, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1271, 688, '_menu_item_xfn', ''),
(1272, 688, '_menu_item_url', ''),
(1274, 240, '_wp_old_date', '2024-10-05'),
(1275, 241, '_wp_old_date', '2024-10-05'),
(1276, 242, '_wp_old_date', '2024-10-05'),
(1277, 243, '_wp_old_date', '2024-10-05'),
(1278, 244, '_wp_old_date', '2024-10-05'),
(1279, 245, '_wp_old_date', '2024-10-05'),
(1280, 246, '_wp_old_date', '2024-10-05'),
(1281, 314, '_wp_old_date', '2024-10-05'),
(1282, 315, '_wp_old_date', '2024-10-05'),
(1283, 316, '_wp_old_date', '2024-10-05'),
(1284, 317, '_wp_old_date', '2024-10-05'),
(1285, 318, '_wp_old_date', '2024-10-05'),
(1286, 247, '_wp_old_date', '2024-10-05'),
(1287, 359, '_wp_old_date', '2024-10-05'),
(1288, 248, '_wp_old_date', '2024-10-05'),
(1289, 689, '_edit_lock', '1750294976:1'),
(1290, 689, 'rank_math_seo_score', '12'),
(1291, 689, 'rank_math_internal_links_processed', '1'),
(1292, 689, '_edit_last', '1'),
(1295, 694, '_wp_attached_file', '2025/07/202507230356-BAO05906-e1753243126664.jpg'),
(1296, 694, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1363;s:6:\"height\";i:830;s:4:\"file\";s:48:\"2025/07/202507230356-BAO05906-e1753243126664.jpg\";s:8:\"filesize\";i:92406;s:5:\"sizes\";a:1:{s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"202507230356-BAO05906-e1753243126664-768x468.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:468;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28627;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"7.1\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:8:\"ILCE-7M4\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1749612857\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"64\";s:3:\"iso\";s:3:\"100\";s:13:\"shutter_speed\";s:5:\"0.008\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(1297, 694, '_wp_attachment_backup_sizes', 'a:3:{s:9:\"full-orig\";a:4:{s:5:\"width\";i:1363;s:6:\"height\";i:2045;s:8:\"filesize\";i:496532;s:4:\"file\";s:25:\"202507230356-BAO05906.jpg\";}s:18:\"full-1753243126664\";a:4:{s:5:\"width\";i:1363;s:6:\"height\";i:1000;s:8:\"filesize\";i:110673;s:4:\"file\";s:40:\"202507230356-BAO05906-e1753243025969.jpg\";}s:17:\"medium_large-orig\";a:5:{s:4:\"file\";s:48:\"202507230356-BAO05906-e1753243025969-768x563.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:563;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:33351;}}'),
(1298, 213, 'footnotes', ''),
(1299, 695, 'footnotes', ''),
(1300, 696, '_wp_attached_file', '2025/07/202507230410-CEO.png'),
(1301, 696, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:28:\"2025/07/202507230410-CEO.png\";s:8:\"filesize\";i:2434646;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1303, 698, 'footnotes', ''),
(1304, 215, 'footnotes', ''),
(1305, 699, 'footnotes', ''),
(1307, 701, 'footnotes', ''),
(1308, 702, 'footnotes', ''),
(1310, 704, '_wp_attached_file', '2025/07/202507230655-CEOThuat.png'),
(1311, 704, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:33:\"2025/07/202507230655-CEOThuat.png\";s:8:\"filesize\";i:624728;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1312, 705, '_wp_attached_file', '2025/07/202507230702-CEOBINH.png'),
(1313, 705, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:32:\"2025/07/202507230702-CEOBINH.png\";s:8:\"filesize\";i:1304682;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1314, 706, '_wp_attached_file', '2025/07/202507230721-CEOOSHIMA.png'),
(1315, 706, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:34:\"2025/07/202507230721-CEOOSHIMA.png\";s:8:\"filesize\";i:862768;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1316, 217, 'footnotes', ''),
(1317, 707, 'footnotes', ''),
(1318, 708, '_edit_lock', '1753429279:1'),
(1319, 708, 'rank_math_internal_links_processed', '1'),
(1320, 708, 'rank_math_seo_score', '10'),
(1321, 708, '_thumbnail_id', '613'),
(1322, 708, 'footnotes', ''),
(1323, 709, 'footnotes', ''),
(1324, 708, '_edit_last', '1'),
(1325, 710, 'rank_math_internal_links_processed', '1'),
(1326, 710, 'rank_math_internal_links_processed', '1'),
(1327, 710, 'rank_math_seo_score', '13'),
(1328, 710, '_thumbnail_id', '613'),
(1329, 710, 'footnotes', ''),
(1330, 710, '_dp_original', '708'),
(1331, 710, '_edit_lock', '1757665470:1'),
(1332, 711, 'footnotes', ''),
(1333, 710, '_edit_last', '1'),
(1334, 712, 'footnotes', ''),
(1335, 713, 'footnotes', ''),
(1337, 715, 'footnotes', ''),
(1338, 717, '_wp_attached_file', '2025/01/202507231229-CEOkey.png'),
(1339, 717, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:31:\"2025/01/202507231229-CEOkey.png\";s:8:\"filesize\";i:1865110;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1340, 552, '_thumbnail_id', '717'),
(1341, 718, '_wp_attached_file', '2025/01/202507231233-CEOfailedsuccess.png'),
(1342, 718, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:41:\"2025/01/202507231233-CEOfailedsuccess.png\";s:8:\"filesize\";i:2064667;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1343, 556, '_thumbnail_id', '718'),
(1344, 720, '_wp_attached_file', '2025/02/202507231236-CEOno1.png'),
(1345, 720, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:31:\"2025/02/202507231236-CEOno1.png\";s:8:\"filesize\";i:1887214;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1346, 561, '_thumbnail_id', '720'),
(1347, 721, '_wp_attached_file', '2025/02/202507231246-CEO8.png'),
(1348, 721, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:29:\"2025/02/202507231246-CEO8.png\";s:8:\"filesize\";i:2891069;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1349, 722, '_wp_attached_file', '2025/02/202507231246-CEO7.png'),
(1350, 722, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:29:\"2025/02/202507231246-CEO7.png\";s:8:\"filesize\";i:1271365;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1351, 723, '_wp_attached_file', '2025/02/202507231246-CEO6.png'),
(1352, 723, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:29:\"2025/02/202507231246-CEO6.png\";s:8:\"filesize\";i:2449698;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1353, 724, '_wp_attached_file', '2025/02/202507231246-CEO5.png'),
(1354, 724, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:29:\"2025/02/202507231246-CEO5.png\";s:8:\"filesize\";i:2673416;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1355, 725, '_wp_attached_file', '2025/02/202507231246-CEO4.png'),
(1356, 725, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:29:\"2025/02/202507231246-CEO4.png\";s:8:\"filesize\";i:1900038;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1357, 726, '_wp_attached_file', '2025/02/202507231246-CEO3.png'),
(1358, 726, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:29:\"2025/02/202507231246-CEO3.png\";s:8:\"filesize\";i:2073523;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1359, 727, '_wp_attached_file', '2025/02/202507231246-CEO2.png'),
(1360, 727, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:29:\"2025/02/202507231246-CEO2.png\";s:8:\"filesize\";i:2705857;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1361, 728, '_wp_attached_file', '2025/02/202507231247-CEO2.png'),
(1362, 728, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:29:\"2025/02/202507231247-CEO2.png\";s:8:\"filesize\";i:2705857;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1363, 729, '_wp_attached_file', '2025/02/202507231247-CEO1.png'),
(1364, 729, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:29:\"2025/02/202507231247-CEO1.png\";s:8:\"filesize\";i:2242846;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1365, 564, '_thumbnail_id', '729'),
(1366, 569, '_thumbnail_id', '728'),
(1367, 574, '_thumbnail_id', '726'),
(1368, 584, '_thumbnail_id', '725'),
(1369, 632, '_thumbnail_id', '724'),
(1370, 654, '_thumbnail_id', '723'),
(1371, 673, '_thumbnail_id', '722'),
(1372, 460, '_edit_last', '1'),
(1373, 467, '_edit_last', '1'),
(1374, 468, '_edit_last', '1'),
(1375, 453, '_edit_last', '1'),
(1376, 667, '_edit_last', '1'),
(1379, 219, 'footnotes', ''),
(1380, 732, 'footnotes', ''),
(1382, 735, 'footnotes', ''),
(1383, 736, 'footnotes', ''),
(1385, 738, 'footnotes', ''),
(1386, 739, 'footnotes', ''),
(1387, 740, 'footnotes', ''),
(1388, 40, 'footnotes', ''),
(1389, 741, 'footnotes', ''),
(1390, 42, 'footnotes', ''),
(1391, 742, 'footnotes', ''),
(1393, 726, '_edit_lock', '1753427856:1'),
(1394, 721, '_edit_lock', '1753427864:1'),
(1395, 704, '_edit_lock', '1753427871:1'),
(1396, 705, '_edit_lock', '1753427876:1'),
(1397, 706, '_edit_lock', '1753427896:1'),
(1398, 725, '_edit_lock', '1753427903:1'),
(1399, 744, 'footnotes', ''),
(1401, 746, 'footnotes', ''),
(1403, 748, 'footnotes', ''),
(1404, 749, 'footnotes', ''),
(1405, 753, '_thumbnail_id', '451'),
(1406, 753, '_edit_lock', '1753433047:2'),
(1407, 753, 'rank_math_internal_links_processed', '1'),
(1408, 753, 'rank_math_seo_score', '7'),
(1409, 760, '_thumbnail_id', '720'),
(1410, 760, '_edit_lock', '1755760181:2'),
(1411, 760, 'rank_math_internal_links_processed', '1'),
(1412, 760, 'rank_math_seo_score', '9'),
(1413, 761, '_thumbnail_id', '729'),
(1414, 761, '_edit_lock', '1753688348:2'),
(1415, 761, 'rank_math_internal_links_processed', '1'),
(1416, 761, 'rank_math_seo_score', '7'),
(1417, 764, '_thumbnail_id', '725'),
(1418, 764, '_edit_lock', '1753689400:2'),
(1419, 764, 'rank_math_internal_links_processed', '1'),
(1420, 764, 'rank_math_seo_score', '7'),
(1421, 767, '_thumbnail_id', '718'),
(1422, 767, '_edit_lock', '1753693592:2'),
(1423, 767, 'rank_math_internal_links_processed', '1'),
(1424, 767, 'rank_math_seo_score', '9'),
(1425, 769, '_thumbnail_id', '364'),
(1426, 769, '_edit_lock', '1753695774:2'),
(1427, 769, 'rank_math_internal_links_processed', '1'),
(1428, 769, 'rank_math_seo_score', '10'),
(1429, 770, '_thumbnail_id', '657'),
(1430, 770, '_edit_lock', '1753696226:2'),
(1431, 770, 'rank_math_internal_links_processed', '1'),
(1432, 770, 'rank_math_seo_score', '12'),
(1435, 773, '_thumbnail_id', '451'),
(1436, 773, '_edit_lock', '1753696629:2'),
(1437, 773, 'rank_math_internal_links_processed', '1'),
(1438, 773, 'rank_math_seo_score', '7'),
(1439, 775, 'footnotes', ''),
(1442, 777, '_wp_attached_file', '2025/08/202508130712-FONG0062-scaled.jpg'),
(1443, 777, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130712-FONG0062-scaled.jpg\";s:8:\"filesize\";i:553653;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130712-FONG0062.jpg\";}'),
(1444, 778, '_wp_attached_file', '2025/08/202508130713-FONG0062-scaled.jpg'),
(1445, 779, '_wp_attached_file', '2025/08/202508130713-FONG0079-scaled.jpg'),
(1446, 780, '_wp_attached_file', '2025/08/202508130713-FONG0092-scaled.jpg'),
(1447, 781, '_wp_attached_file', '2025/08/202508130713-FONG0116-scaled.jpg'),
(1448, 782, '_wp_attached_file', '2025/08/202508130713-FONG0586-scaled.jpg'),
(1449, 778, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130713-FONG0062-scaled.jpg\";s:8:\"filesize\";i:553653;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130713-FONG0062.jpg\";}'),
(1450, 779, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130713-FONG0079-scaled.jpg\";s:8:\"filesize\";i:596693;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130713-FONG0079.jpg\";}'),
(1451, 780, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130713-FONG0092-scaled.jpg\";s:8:\"filesize\";i:669066;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130713-FONG0092.jpg\";}'),
(1452, 781, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130713-FONG0116-scaled.jpg\";s:8:\"filesize\";i:669695;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130713-FONG0116.jpg\";}'),
(1453, 782, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130713-FONG0586-scaled.jpg\";s:8:\"filesize\";i:755153;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130713-FONG0586.jpg\";}'),
(1454, 783, '_wp_attached_file', '2025/08/202508130713-FONG0234-scaled.jpg'),
(1455, 784, '_wp_attached_file', '2025/08/202508130713-FONG0218-scaled.jpg'),
(1456, 785, '_wp_attached_file', '2025/08/202508130713-FONG0204-scaled.jpg'),
(1457, 786, '_wp_attached_file', '2025/08/202508130713-FONG0629-scaled.jpg'),
(1458, 783, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130713-FONG0234-scaled.jpg\";s:8:\"filesize\";i:752200;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130713-FONG0234.jpg\";}'),
(1459, 785, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130713-FONG0204-scaled.jpg\";s:8:\"filesize\";i:817608;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130713-FONG0204.jpg\";}'),
(1460, 784, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130713-FONG0218-scaled.jpg\";s:8:\"filesize\";i:747723;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130713-FONG0218.jpg\";}'),
(1461, 786, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130713-FONG0629-scaled.jpg\";s:8:\"filesize\";i:1293627;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130713-FONG0629.jpg\";}'),
(1462, 787, '_wp_attached_file', '2025/08/202508130716-Logo-mau.pdf'),
(1463, 787, '_wp_attachment_metadata', 'a:1:{s:8:\"filesize\";i:10143;}'),
(1477, 790, '_edit_lock', '1758855539:1'),
(1478, 791, '_wp_attached_file', '2025/08/202508130724-FONG0062-scaled.jpg'),
(1479, 792, '_wp_attached_file', '2025/08/202508130724-FONG0079-scaled.jpg'),
(1480, 793, '_wp_attached_file', '2025/08/202508130724-FONG0092-scaled.jpg'),
(1481, 794, '_wp_attached_file', '2025/08/202508130724-FONG0116-scaled.jpg'),
(1482, 795, '_wp_attached_file', '2025/08/202508130724-FONG0586-scaled.jpg'),
(1483, 791, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130724-FONG0062-scaled.jpg\";s:8:\"filesize\";i:553653;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130724-FONG0062.jpg\";}'),
(1484, 792, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130724-FONG0079-scaled.jpg\";s:8:\"filesize\";i:596693;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130724-FONG0079.jpg\";}'),
(1485, 793, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130724-FONG0092-scaled.jpg\";s:8:\"filesize\";i:669066;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130724-FONG0092.jpg\";}'),
(1486, 794, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130724-FONG0116-scaled.jpg\";s:8:\"filesize\";i:669695;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130724-FONG0116.jpg\";}'),
(1487, 795, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130724-FONG0586-scaled.jpg\";s:8:\"filesize\";i:755153;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130724-FONG0586.jpg\";}'),
(1488, 796, '_wp_attached_file', '2025/08/202508130724-FONG0234-scaled.jpg'),
(1489, 797, '_wp_attached_file', '2025/08/202508130724-FONG0218-scaled.jpg'),
(1490, 798, '_wp_attached_file', '2025/08/202508130724-FONG0629-scaled.jpg'),
(1491, 799, '_wp_attached_file', '2025/08/202508130724-FONG0204-scaled.jpg'),
(1492, 796, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130724-FONG0234-scaled.jpg\";s:8:\"filesize\";i:752200;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130724-FONG0234.jpg\";}'),
(1496, 797, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130724-FONG0218-scaled.jpg\";s:8:\"filesize\";i:747723;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130724-FONG0218.jpg\";}'),
(1497, 798, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130724-FONG0629-scaled.jpg\";s:8:\"filesize\";i:1293627;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130724-FONG0629.jpg\";}'),
(1498, 799, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:40:\"2025/08/202508130724-FONG0204-scaled.jpg\";s:8:\"filesize\";i:817608;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:25:\"202508130724-FONG0204.jpg\";}'),
(1499, 790, 'rank_math_internal_links_processed', '1'),
(1500, 790, 'rank_math_seo_score', '15'),
(1501, 790, '_thumbnail_id', '95'),
(1502, 800, '_edit_lock', '1755675517:1'),
(1503, 800, 'rank_math_internal_links_processed', '1'),
(1504, 800, 'rank_math_seo_score', '9'),
(1506, 801, 'footnotes', ''),
(1507, 800, '_edit_last', '1'),
(1509, 803, '_menu_item_type', 'post_type'),
(1510, 803, '_menu_item_menu_item_parent', '0'),
(1511, 803, '_menu_item_object_id', '800'),
(1512, 803, '_menu_item_object', 'page'),
(1513, 803, '_menu_item_target', ''),
(1514, 803, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1515, 803, '_menu_item_xfn', ''),
(1516, 803, '_menu_item_url', ''),
(1518, 240, '_wp_old_date', '2025-06-19'),
(1519, 240, '_menu_img', ''),
(1520, 241, '_wp_old_date', '2025-06-19'),
(1521, 241, '_menu_img', ''),
(1522, 242, '_wp_old_date', '2025-06-19'),
(1523, 242, '_menu_img', ''),
(1524, 243, '_wp_old_date', '2025-06-19'),
(1525, 243, '_menu_img', ''),
(1526, 244, '_wp_old_date', '2025-06-19'),
(1527, 244, '_menu_img', ''),
(1528, 245, '_wp_old_date', '2025-06-19'),
(1529, 245, '_menu_img', ''),
(1530, 246, '_wp_old_date', '2025-06-19'),
(1531, 246, '_menu_img', ''),
(1532, 314, '_wp_old_date', '2025-06-19'),
(1533, 314, '_menu_img', ''),
(1534, 315, '_wp_old_date', '2025-06-19'),
(1535, 315, '_menu_img', ''),
(1536, 316, '_wp_old_date', '2025-06-19'),
(1537, 316, '_menu_img', ''),
(1538, 317, '_wp_old_date', '2025-06-19'),
(1539, 317, '_menu_img', ''),
(1540, 318, '_wp_old_date', '2025-06-19'),
(1541, 318, '_menu_img', ''),
(1542, 247, '_wp_old_date', '2025-06-19'),
(1543, 247, '_menu_img', ''),
(1544, 359, '_wp_old_date', '2025-06-19'),
(1545, 359, '_menu_img', ''),
(1546, 248, '_wp_old_date', '2025-06-19'),
(1547, 248, '_menu_img', ''),
(1548, 688, '_wp_old_date', '2025-06-19'),
(1549, 688, '_menu_img', ''),
(1550, 800, 'footnotes', ''),
(1552, 805, 'footnotes', ''),
(1554, 807, 'footnotes', ''),
(1555, 808, 'footnotes', ''),
(1557, 810, 'footnotes', ''),
(1558, 811, '_thumbnail_id', '723'),
(1559, 811, '_edit_lock', '1756871763:2'),
(1560, 811, 'rank_math_internal_links_processed', '1'),
(1561, 811, 'rank_math_seo_score', '9'),
(1562, 813, '_thumbnail_id', '728'),
(1563, 813, '_edit_lock', '1756970010:2'),
(1564, 813, 'rank_math_internal_links_processed', '1'),
(1565, 814, '_edit_lock', '1757665097:2'),
(1566, 814, 'rank_math_internal_links_processed', '1'),
(1567, 815, '_wp_attached_file', '2025/09/202509120749-z6993733163855b9110ea0a6ba79df8d3fd646167ab2d0.jpg'),
(1568, 815, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1706;s:4:\"file\";s:71:\"2025/09/202509120749-z6993733163855b9110ea0a6ba79df8d3fd646167ab2d0.jpg\";s:8:\"filesize\";i:831689;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1569, 816, '_wp_attached_file', '2025/09/202509120751-z6993733163855b9110ea0a6ba79df8d3fd646167ab2d0.jpg'),
(1570, 816, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1706;s:4:\"file\";s:71:\"2025/09/202509120751-z6993733163855b9110ea0a6ba79df8d3fd646167ab2d0.jpg\";s:8:\"filesize\";i:831689;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1571, 817, '_wp_attached_file', '2025/09/202509120815-z6993733131331078d57e622febd358e24119f3592b6ec.jpg');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1572, 817, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1706;s:4:\"file\";s:71:\"2025/09/202509120815-z6993733131331078d57e622febd358e24119f3592b6ec.jpg\";s:8:\"filesize\";i:866323;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1573, 818, '_wp_attached_file', '2025/09/202509120815-z6993733168581de632d76da75b620bf67d4497971d90a.jpg'),
(1574, 818, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1706;s:4:\"file\";s:71:\"2025/09/202509120815-z6993733168581de632d76da75b620bf67d4497971d90a.jpg\";s:8:\"filesize\";i:539128;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1575, 814, 'rank_math_seo_score', '13'),
(1576, 814, '_thumbnail_id', '815'),
(1577, 820, 'footnotes', ''),
(1578, 821, 'footnotes', ''),
(1579, 822, 'footnotes', ''),
(1584, 826, '_thumbnail_id', '722'),
(1585, 826, '_edit_lock', '1758769763:2'),
(1586, 95, '_oembed_115ab09a7996be88589a98e89c1f5dfa', '{{unknown}}'),
(1587, 790, '_edit_last', '1'),
(1588, 827, '_menu_item_type', 'post_type'),
(1589, 827, '_menu_item_menu_item_parent', '319'),
(1590, 827, '_menu_item_object_id', '306'),
(1591, 827, '_menu_item_object', 'page'),
(1592, 827, '_menu_item_target', ''),
(1593, 827, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1594, 827, '_menu_item_xfn', ''),
(1595, 827, '_menu_item_url', ''),
(1597, 828, '_menu_item_type', 'post_type'),
(1598, 828, '_menu_item_menu_item_parent', '319'),
(1599, 828, '_menu_item_object_id', '301'),
(1600, 828, '_menu_item_object', 'page'),
(1601, 828, '_menu_item_target', ''),
(1602, 828, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1603, 828, '_menu_item_xfn', ''),
(1604, 828, '_menu_item_url', ''),
(1606, 829, '_menu_item_type', 'post_type'),
(1607, 829, '_menu_item_menu_item_parent', '319'),
(1608, 829, '_menu_item_object_id', '296'),
(1609, 829, '_menu_item_object', 'page'),
(1610, 829, '_menu_item_target', ''),
(1611, 829, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1612, 829, '_menu_item_xfn', ''),
(1613, 829, '_menu_item_url', ''),
(1615, 830, '_menu_item_type', 'post_type'),
(1616, 830, '_menu_item_menu_item_parent', '319'),
(1617, 830, '_menu_item_object_id', '291'),
(1618, 830, '_menu_item_object', 'page'),
(1619, 830, '_menu_item_target', ''),
(1620, 830, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1621, 830, '_menu_item_xfn', ''),
(1622, 830, '_menu_item_url', ''),
(1624, 204, '_wp_old_date', '2024-10-08'),
(1626, 238, '_wp_old_date', '2024-10-08'),
(1628, 319, '_wp_old_date', '2024-10-08'),
(1630, 239, '_wp_old_date', '2024-10-08'),
(1632, 831, '_menu_item_type', 'post_type'),
(1633, 831, '_menu_item_menu_item_parent', '0'),
(1634, 831, '_menu_item_object_id', '20'),
(1635, 831, '_menu_item_object', 'page'),
(1636, 831, '_menu_item_target', ''),
(1637, 831, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1638, 831, '_menu_item_xfn', ''),
(1639, 831, '_menu_item_url', ''),
(1641, 832, '_menu_item_type', 'post_type'),
(1642, 832, '_menu_item_menu_item_parent', '0'),
(1643, 832, '_menu_item_object_id', '207'),
(1644, 832, '_menu_item_object', 'page'),
(1645, 832, '_menu_item_target', ''),
(1646, 832, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1647, 832, '_menu_item_xfn', ''),
(1648, 832, '_menu_item_url', ''),
(1650, 833, '_menu_item_type', 'post_type'),
(1651, 833, '_menu_item_menu_item_parent', '0'),
(1652, 833, '_menu_item_object_id', '675'),
(1653, 833, '_menu_item_object', 'page'),
(1654, 833, '_menu_item_target', ''),
(1655, 833, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1656, 833, '_menu_item_xfn', ''),
(1657, 833, '_menu_item_url', ''),
(1659, 834, '_wp_attached_file', '2025/10/202510030450-home.png'),
(1660, 834, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:15;s:6:\"height\";i:14;s:4:\"file\";s:29:\"2025/10/202510030450-home.png\";s:8:\"filesize\";i:344;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1661, 831, '_menu_img', '834'),
(1662, 832, '_menu_img', '834'),
(1663, 833, '_menu_img', '834'),
(1664, 835, '_menu_item_type', 'post_type'),
(1665, 835, '_menu_item_menu_item_parent', '319'),
(1666, 835, '_menu_item_object_id', '289'),
(1667, 835, '_menu_item_object', 'page'),
(1668, 835, '_menu_item_target', ''),
(1669, 835, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1670, 835, '_menu_item_xfn', ''),
(1671, 835, '_menu_item_url', ''),
(1681, 204, '_menu_img', ''),
(1682, 238, '_menu_img', ''),
(1683, 319, '_menu_img', ''),
(1684, 835, '_menu_img', ''),
(1685, 827, '_menu_img', '818'),
(1686, 828, '_menu_img', '705'),
(1687, 829, '_menu_img', '785'),
(1688, 830, '_menu_img', '717'),
(1689, 239, '_menu_img', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint UNSIGNED NOT NULL,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2024-09-25 19:15:35', '2024-09-25 10:15:35', '<!-- wp:paragraph -->\n<p>WordPress へようこそ。こちらは最初の投稿です。編集または削除し、コンテンツ作成を始めてください。</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2024-09-25 19:15:35', '2024-09-25 10:15:35', '', 0, 'http://localhost:8080/?p=1', 0, 'post', '', 1),
(5, 0, '2024-09-26 02:58:03', '2024-09-25 17:58:03', '<!-- wp:page-list /-->', 'Navigation', '', 'publish', 'closed', 'closed', '', 'navigation', '', '', '2024-09-26 02:58:03', '2024-09-25 17:58:03', '', 0, 'http://localhost:8080/navigation/', 0, 'wp_navigation', '', 0),
(8, 1, '2024-09-26 09:37:00', '2024-09-26 00:37:00', '<!-- wp:carbon-fields/block-media {\"data\":{\"media_spt\":\"\",\"type_media\":\"video\",\"image_media\":102,\"type_video\":\"upload\",\"video_upload\":146,\"video_embed\":\"http://localhost:8080/wp-content/uploads/2024/09/202409271046-.mp4\",\"text_welcome\":\"Welcome to AIoT\"}} /-->\n\n<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"intro_title\":\"About Us\",\"intro_desc\":\"Our mission is to support businesses in maximizing their potential in the rapidly evolving world of technology. By providing innovative solutions, we aim to drive business growth and contribute to the creation of a more prosperous and happier society. Leveraging our global perspective and the experience we have cultivated in Japan, we strive to make a positive impact not only on our clients but also on the people and communities they serve.\",\"intro_page_url\":\"#\",\"media_spt\":\"Media\",\"type_media\":\"slider\",\"image\":\"\",\"video\":\"\",\"img_slider\":[91,90,89,92,93,94]}} /-->\n\n<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":true,\"intro_title\":\"Company\",\"intro_desc\":\"AIoT Inc. is a pioneering company that leverages the latest technologies to solve societal challenges and aims to create a more equitable and flat world. We are very excited to introduce our company on this web page.\",\"intro_page_url\":\"/en/business\",\"media_spt\":\"Media\",\"type_media\":\"image\",\"image\":379,\"video\":\"https://www.youtube.com/watch?v=g_1oiJqE3OI\",\"img_slider\":[]}} /-->\n\n<!-- wp:carbon-fields/block-service {\"data\":{\"service_spt\":\"\",\"service_guide\":\"\\u003cbutton class=\\u0022service-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"service_title\":\"Bussiness\",\"service_desc\":\"Innovation Unlocking New Possibilities\\n\\u003cfigure class=\\u0022media\\u0022 style=\\u0022margin-bottom:24px; border-radius: 3rem;\\u0022\\u003e\\n                        \\u003cimg decoding=\\u0022async\\u0022 src=\\u0022 http://localhost:8080/wp-content/uploads/2024/09/202409271420-Banner-Video.jpg \\u0022 alt=\\u0022image\\u0022 loading=\\u0022lazy\\u0022\\u003e\\n                    \\u003c/figure\\u003e\",\"service_page_url\":\"/business\",\"services\":[{\"_id\":\"cf-CwTrHL9fNOsqlfV9muZNR\",\"_type\":\"_\",\"name\":\"DX System Development\",\"url\":\"/en/business/dx-system-development/\",\"desc\":\"We provide comprehensive services from planning, development, and design to maintenance and management using cutting-edge technologies such as AI and IoT, tailored to our clients\' business needs. We solve technical challenges and support business growth.\"},{\"_id\":\"cf-cGI648xSibk2xQZYE36P4\",\"_type\":\"_\",\"name\":\"BPO Services\",\"url\":\"/en/business/bpo-services/\",\"desc\":\"We offer outsourcing services for data entry and administrative processing using advanced computer systems. By ensuring efficient and accurate data management, we help reduce operational burdens and enhance productivity.\"},{\"_id\":\"cf-dsWQi9JGb7EzxXrnS_rnh\",\"_type\":\"_\",\"name\":\"Business Strategy and M\\u0026A Support\",\"url\":\"/en/business/corporate-strategy-and-ma-support/\",\"desc\":\"We assist in the formulation of corporate growth strategies, innovation projects, and provide support for M\\u0026A (mergers and acquisitions). We offer comprehensive solutions to maximize corporate value.\"},{\"_id\":\"cf-yrN_PjMxytJkkSsa1CVeA\",\"_type\":\"_\",\"name\":\"Support for Vietnam expansion\",\"url\":\"/en/business/vietnam-expansion-support/\",\"desc\":\"We provide consulting and strategy development for businesses looking to invest in Vietnam for growth and expansion. Together with our clients, we propose the optimal approach for their business future.\"}]}} /-->\n\n<!-- wp:carbon-fields/block-service {\"data\":{\"service_spt\":\"\",\"service_guide\":\"\\u003cbutton class=\\u0022service-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":true,\"service_title\":\"Solutions\",\"service_desc\":\"\\u003cfigure class=\\u0022media\\u0022 style=\\u0022margin-bottom:24px; border-radius: 3rem;\\u0022\\u003e\\n                        \\u003cimg decoding=\\u0022async\\u0022 src=\\u0022http://localhost:8080/wp-content/uploads/2024/10/202410060300-Banner-Video2.jpg\\u0022 alt=\\u0022image\\u0022 loading=\\u0022lazy\\u0022\\u003e\\n                    \\u003c/figure\\u003e\",\"service_page_url\":\"\",\"services\":[{\"_id\":\"cf-kD9gBaQxrawTUwwXCcO5E\",\"_type\":\"_\",\"name\":\"Digital Transformation (DX) Solutions\",\"url\":\"\",\"desc\":\"We offer comprehensive DX solutions to digitize our clients\' businesses. From automating business processes and visualizing data to enhancing customer experiences, we design and implement the digital tools and strategies needed to boost corporate competitiveness.\"},{\"_id\":\"cf-j2AVmwEz9iQ1x9IKBDzq8\",\"_type\":\"_\",\"name\":\"Customizable Software Development\",\"url\":\"\",\"desc\":\"We provide customized software development tailored to the specific business needs of our clients. Whether it’s ERP systems, CRM, or database management tools, we build optimal solutions that meet industry-specific requirements and offer operational support as well.\\n\"},{\"_id\":\"cf-0umiZ30354SXYw0Bx53ts\",\"_type\":\"_\",\"name\":\"High-End Offshore Development\",\"url\":\"\",\"desc\":\"We offer offshore development leveraging skilled IT engineers from Vietnam. Our solutions deliver high performance and quality aligned with Japanese standards while maintaining cost efficiency.\"},{\"_id\":\"cf-gAUc7U_fYVMAx0qF_eG7l\",\"_type\":\"_\",\"name\":\"M\\u0026A and Corporate Strategy Consulting\",\"url\":\"\",\"desc\":\"We provide comprehensive support for M\\u0026A initiatives and corporate strategy planning to drive growth and restructuring. Utilizing extensive expertise, we offer optimal solutions to achieve your business goals, including market research, business due diligence, and coordination of cross-border transactions.\"}]}} /-->\n\n<!-- wp:carbon-fields/block-blog {\"data\":{\"blog_spt\":\"\",\"blog_guide\":\"\\u003cbutton class=\\u0022blog-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"blog_title\":\"What’s New\",\"blog_page_url\":\"/en/blogs\",\"article_spt\":\"Choose article\",\"display_type\":\"auto\",\"auto_spt\":\"\",\"manual_spt\":\"\",\"manual_blog\":[]}} /-->\n\n<!-- wp:carbon-fields/block-service {\"data\":{\"service_spt\":\"\",\"service_guide\":\"\\u003cbutton class=\\u0022service-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"service_title\":\"Our Achievements\",\"service_desc\":\"\\u003cfigure class=\\u0022media\\u0022 style=\\u0022margin-bottom:24px; border-radius: 3rem;\\u0022\\u003e\\n                        \\u003cimg decoding=\\u0022async\\u0022 src=\\u0022http://localhost:8080/wp-content/uploads/2024/10/202410060258-Banner-Video1.jpg\\u0022 alt=\\u0022image\\u0022 loading=\\u0022lazy\\u0022\\u003e\\n                    \\u003c/figure\\u003e\",\"service_page_url\":\"\",\"services\":[{\"_id\":\"cf-HxcrtV_n3gFCwURZrQS5q\",\"_type\":\"_\",\"name\":\"Cross-Border E-Commerce Support Platform\",\"url\":\"\",\"desc\":\"We develop and operate a foundational system that enables the automatic synchronization and listing of product information across domestic and international e-commerce marketplaces.\\n\"},{\"_id\":\"cf-7inqlhUhGUHYSXfYf0YGq\",\"_type\":\"_\",\"name\":\"DX System for the Construction Industry\",\"url\":\"\",\"desc\":\"We develop and operate DX systems to support a Japanese construction company in improving operational efficiency and enhancing productivity.\"},{\"_id\":\"cf-MdSdVVcw8qYqYibyjlOlq\",\"_type\":\"_\",\"name\":\"AI Chatbots for Government and Diplomatic Agencies\",\"url\":\"\",\"desc\":\"We have developed an AI-powered chatbot trained on accurate and diverse datasets, capable of responding to online user inquiries with knowledge and quality equivalent to human assistance, all while maintaining a natural conversational tone. This chatbot has been implemented in both governmental and diplomatic institutions.\"}]}} /-->', 'Homepage', '', 'publish', 'closed', 'closed', '', 'homepage', '', '', '2024-12-06 13:34:14', '2024-12-06 04:34:14', '', 0, 'http://localhost:8080/?page_id=8', 0, 'page', '', 0),
(18, 1, '2024-09-26 09:44:14', '2024-09-26 00:44:14', '<!-- wp:carbon-fields/block-media {\"data\":{\"media_spt\":\"\",\"type_media\":\"video\",\"image_media\":102,\"type_video\":\"upload\",\"video_upload\":82,\"video_embed\":\"http://localhost:8080/wp-content/uploads/2024/09/202409271046-.mp4\",\"text_welcome\":\"Welcome to AIOT\"}} /-->\n\n<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"intro_title\":\"About Us\",\"intro_desc\":\"私たちのミッションは、急速に変化するテクノロジーの世界において、企業がその潜在能力を最大限に引き出せるようサポートすることです。革新的なソリューションを提供することでビジネスの成長を促進し、より豊かで幸せな社会の実現に貢献したいと考えています。私たちは、グローバルな視点と日本国内で培った経験を活かし、クライアントだけでなく、その先にいる人々や地域社会にもポジティブな影響を与えることを目指しています。\",\"intro_page_url\":\"#\",\"media_spt\":\"Media\",\"type_media\":\"slider\",\"image\":\"\",\"video\":\"\",\"img_slider\":[91,90,89,92,93,94]}} /-->\n\n<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":true,\"intro_title\":\"About Us\",\"intro_desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\",\"intro_page_url\":\"\",\"media_spt\":\"Media\",\"type_media\":\"video\",\"image\":\"\",\"video\":\"https://www.youtube.com/watch?v=g_1oiJqE3OI\",\"img_slider\":[]}} /-->\n\n<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"intro_title\":\"About Us\",\"intro_desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\",\"intro_page_url\":\"\",\"media_spt\":\"Media\",\"type_media\":\"image\",\"image\":15,\"video\":\"\",\"img_slider\":[]}} /-->', 'Trang chủ', '', 'publish', 'closed', 'closed', '', 'trang-chu', '', '', '2024-09-28 00:48:57', '2024-09-27 15:48:57', '', 0, 'http://localhost:8080/?page_id=18', 0, 'page', '', 0),
(20, 1, '2024-09-26 09:48:47', '2024-09-26 00:48:47', '<!-- wp:group {\"className\":\"top-header\",\"layout\":{\"type\":\"constrained\"}} -->\n<div id=\"top-header\" class=\"wp-block-group top-header\"><!-- wp:heading {\"style\":{\"typography\":{\"fontSize\":\"4.51rem\"}}} -->\n<h2 class=\"wp-block-heading\" style=\"font-size:4.51rem\">デジタル時代の幸せづくり</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"style\":{\"typography\":{\"fontSize\":\"1.7rem\"}}} -->\n<p style=\"font-size:1.7rem\">デジタルトランスフォーメーション（DX）の推進において、</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"style\":{\"typography\":{\"fontSize\":\"1.7rem\"}}} -->\n<p style=\"font-size:1.7rem\">革新的な技術を活用することでビジネスを成長させることだけを目的とするのではなく、</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"style\":{\"typography\":{\"fontSize\":\"1.7rem\"}}} -->\n<p style=\"font-size:1.7rem\">お客様や従業員、関係者の皆様の幸せを通じて社会全体の幸福を追求していくことを目指しています。</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:carbon-fields/block-media {\"data\":{\"media_spt\":\"\",\"type_media\":\"video\",\"image_media\":102,\"type_video\":\"upload\",\"video_upload\":418,\"video_embed\":\"http://localhost:8080/wp-content/uploads/2024/09/202409271046-.mp4\",\"text_welcome\":\"AIoTへようこそ\"}} /-->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div id=\"top-about-us\" class=\"wp-block-group\"><!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"intro_title\":\"About Us\",\"intro_desc\":\"私たちのミッションは急速に変化する現在のテクノロジーの世界で企業様がその潜在能力を最大限に引き出せるようサポートすることです。革新的なソリューションを提供し続けることでお客様のビジネスの成長を促進し、より豊かで幸せな社会の実現に貢献したいと考えています。私たちが持つグローバルな視点と日本で培った経験を活かし、クライアントだけでなく、その先にいる人々や地域社会にもポジティブな影響を与えることを目指しています。\",\"intro_page_url\":\"#\",\"media_spt\":\"Media\",\"type_media\":\"slider\",\"image\":\"\",\"video\":\"\",\"img_slider\":[91,90,89,92,93,94]},\"className\":\"about-us-header\"} /-->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"></div>\n<!-- /wp:group -->\n\n<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":true,\"intro_title\":\"企業情報\",\"intro_desc\":\"社会の課題を解決するために最新のテクノロジーを活用する先駆者であり、フラットな世界の実現を目指す企業であるAIoT株式会社について紹介します。\",\"intro_page_url\":\"/company\",\"media_spt\":\"Media\",\"type_media\":\"image\",\"image\":420,\"video\":\"https://www.youtube.com/watch?v=g_1oiJqE3OI\",\"img_slider\":[]}} /--></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div id=\"top-services\" class=\"wp-block-group\"><!-- wp:carbon-fields/block-service {\"data\":{\"service_spt\":\"\",\"service_guide\":\"\\u003cbutton class=\\u0022service-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"service_title\":\"事業紹介\",\"service_desc\":\"イノベーションで拓く新たな可能性\\n\\u003cfigure class=\\u0022media\\u0022 style=\\u0022margin-bottom:24px; border-radius: 3rem;\\u0022\\u003e\\n                        \\u003cimg decoding=\\u0022async\\u0022 src=\\u0022http://localhost:8080/wp-content/uploads/2024/10/202410111408-Banner-Video4.jpg\\u0022 alt=\\u0022image\\u0022 loading=\\u0022lazy\\u0022\\u003e\\n                    \\u003c/figure\\u003e\",\"service_page_url\":\"/business\",\"services\":[{\"_id\":\"cf-CwTrHL9fNOsqlfV9muZNR\",\"_type\":\"_\",\"name\":\"DXシステム開発関連事業\",\"url\":\"/business/dx-system-development/\",\"desc\":\"お客様のビジネスニーズに合わせ、AIやIoTをはじめとする最先端技術を活用した企画・開発・設計から、保守・管理までを一貫して提供します。技術的な課題を解決し、ビジネスの成長を力強くサポートいたします。\"},{\"_id\":\"cf-cGI648xSibk2xQZYE36P4\",\"_type\":\"_\",\"name\":\"BPO支援事業\",\"url\":\"/business/bpo-services/\",\"desc\":\"コンピュータシステムを駆使したデータ入力業務や事務処理業務を承ります。効率的で正確なデータ管理を通じて、業務の負担を軽減し、生産性の向上を実現します。\"},{\"_id\":\"cf-dsWQi9JGb7EzxXrnS_rnh\",\"_type\":\"_\",\"name\":\"経営戦略コンサルティング・M\\u0026A支援事業\",\"url\":\"/business/corporate-strategy-and-ma-support/\",\"desc\":\"企業の成長戦略や革新プロジェクトの立案、さらにはM\\u0026A（合併・買収）の支援を通じて、企業価値の最大化に向けた包括的なサポートを提供します。\"},{\"_id\":\"cf-yrN_PjMxytJkkSsa1CVeA\",\"_type\":\"_\",\"name\":\"ベトナム進出支援事業\",\"url\":\"/business/vietnam-expansion-support/\",\"desc\":\"お客様のビジネスの成長と発展を支えるため、ベトナムへの投資戦略の立案や投資に関するコンサルティングを提供しています。お客様のビジネスの未来を共に考え、最適なアプローチでベトナム進出成功をサポートします。\"}]}} /-->\n\n<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":true,\"intro_title\":\"技術スタック\",\"intro_desc\":\"最先端の技術を活用してクライアントのニーズに対応し、ビジネスの成長を促進しています。\",\"intro_page_url\":\"/company\",\"media_spt\":\"Media\",\"type_media\":\"image\",\"image\":387,\"video\":\"https://www.youtube.com/watch?v=g_1oiJqE3OI\",\"img_slider\":[]}} /--></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div id=\"top-solutions\" class=\"wp-block-group\"><!-- wp:carbon-fields/block-service {\"data\":{\"service_spt\":\"\",\"service_guide\":\"\\u003cbutton class=\\u0022service-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"service_title\":\"ソリューション\",\"service_desc\":\"\\u003cfigure class=\\u0022media\\u0022 style=\\u0022margin-bottom:24px; border-radius: 3rem;\\u0022\\u003e\\n                        \\u003cimg decoding=\\u0022async\\u0022 src=\\u0022http://localhost:8080/wp-content/uploads/2024/10/202410060300-Banner-Video2.jpg\\u0022 alt=\\u0022image\\u0022 loading=\\u0022lazy\\u0022\\u003e\\n                    \\u003c/figure\\u003e\",\"service_page_url\":\"\",\"services\":[{\"_id\":\"cf-kD9gBaQxrawTUwwXCcO5E\",\"_type\":\"_\",\"name\":\"デジタルトランスフォーメーション（DX）ソリューション\",\"url\":\"\",\"desc\":\"お客様のビジネスをデジタル化し、持続可能な成長を実現するために包括的なDXソリューションを提供します。業務プロセスの自動化やデータの可視化、顧客体験の向上など、企業の競争力を強化するために必要なデジタルツールと戦略を設計し、効率的に実装します。\"},{\"_id\":\"cf-j2AVmwEz9iQ1x9IKBDzq8\",\"_type\":\"_\",\"name\":\"オリジナルソフトウェア開発\",\"url\":\"\",\"desc\":\"お客様のビジネスニーズに応じたオリジナルソフトウェア開発を提供します。ERPシステム、CRM、データベース管理ツールなど、業界特有の要件に対応した最適なソリューションを構築し、導入後の運用支援まで一貫してサポートします。\"},{\"_id\":\"cf-0umiZ30354SXYw0Bx53ts\",\"_type\":\"_\",\"name\":\"ハイエンドオフショア開発\",\"url\":\"\",\"desc\":\"日本が直面する深刻な課題であるIT人材不足に対応するため、ベトナムの優秀なITエンジニアを活用したオフショア開発を提供します。日本標準に準拠した高いパフォーマンスと品質を維持しつつ、リーズナブルなコストでソリューションを実現します。\"},{\"_id\":\"cf-gAUc7U_fYVMAx0qF_eG7l\",\"_type\":\"_\",\"name\":\"M\\u0026Aおよび企業戦略コンサルティング\",\"url\":\"\",\"desc\":\"企業の成長や再編を実現するため、M\\u0026A支援や企業戦略の立案を包括的にサポートします。市場調査、ビジネスデューデリジェンス、クロスボーダー取引の調整など、豊富な専門知識を駆使しお客様のビジネス目標達成に向けた最適なソリューションを提供します。\"}]}} /-->\n\n<!-- wp:carbon-fields/block-service {\"data\":{\"service_spt\":\"\",\"service_guide\":\"\\u003cbutton class=\\u0022service-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":true,\"service_title\":\"事例・実績\",\"service_desc\":\"\\u003cfigure class=\\u0022media\\u0022 style=\\u0022margin-bottom:24px; border-radius: 3rem;\\u0022\\u003e\\n                        \\u003cimg decoding=\\u0022async\\u0022 src=\\u0022http://localhost:8080/wp-content/uploads/2024/10/202410060258-Banner-Video1.jpg\\u0022 alt=\\u0022image\\u0022 loading=\\u0022lazy\\u0022\\u003e\\n                    \\u003c/figure\\u003e\",\"service_page_url\":\"/company/portfolio/\",\"services\":[{\"_id\":\"cf-HxcrtV_n3gFCwURZrQS5q\",\"_type\":\"_\",\"name\":\"越境EC支援プラットフォーム\",\"url\":\"\",\"desc\":\"日本国内外のECマーケットプレイスを連携させるため、商品情報の自動連携掲載を可能にする基盤システムの開発・運用を行っています。\"},{\"_id\":\"cf-7inqlhUhGUHYSXfYf0YGq\",\"_type\":\"_\",\"name\":\"DXシステム開発\",\"url\":\"\",\"desc\":\"建設業企業様へ業務効率化や生産性向上を支援するDXシステムの開発・運用を行っています。\"},{\"_id\":\"cf-MdSdVVcw8qYqYibyjlOlq\",\"_type\":\"_\",\"name\":\"行政機関および外交機関でのAIチャットボット\",\"url\":\"\",\"desc\":\"正確なデータ各種を学習させたAIがユーザーのオンライン上での問い合わせに対して、有人対応と同等の知識やクオリティを持ち、且つ自然な口調で対応できるチャットボットを開発し、行政・外交両機関に導入されています。\"}]}} /--></div>\n<!-- /wp:group -->\n\n<!-- wp:carbon-fields/block-blog {\"data\":{\"blog_spt\":\"\",\"blog_guide\":\"\\u003cbutton class=\\u0022blog-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"blog_title\":\"ニュースリリース\",\"blog_page_url\":\"/blogs\",\"article_spt\":\"Choose article\",\"display_type\":\"auto\",\"auto_spt\":\"\",\"manual_spt\":\"\",\"manual_blog\":[]}} /-->', 'ホームページ', '', 'publish', 'closed', 'closed', '', 'homepage', '', '', '2025-07-25 16:56:07', '2025-07-25 07:56:07', '', 0, 'http://localhost:8080/?page_id=20', 0, 'page', '', 0),
(22, 1, '2024-10-05 23:02:07', '2024-09-26 00:52:41', ' ', '', '', 'publish', 'closed', 'closed', '', '22', '', '', '2024-10-05 23:02:07', '2024-10-05 14:02:07', '', 0, 'http://localhost:8080/?p=22', 1, 'nav_menu_item', '', 0),
(23, 1, '2024-09-26 09:53:23', '2024-09-26 00:53:23', '', 'About Us', '', 'publish', 'closed', 'closed', '', 'about-us', '', '', '2024-09-26 09:53:23', '2024-09-26 00:53:23', '', 0, 'http://localhost:8080/?page_id=23', 0, 'page', '', 0),
(34, 1, '2024-09-27 18:06:59', '2024-09-27 09:06:59', '<!-- wp:paragraph -->\n<p>Dear our Clients, Partners, and Friends,</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>At AIoT Inc., we are committed to creating a more connected and intelligent future through the use of technology. We are not only at the forefront of innovation in artificial intelligence (AI) and the Internet of Things (IoT), but we also provide the tools and knowledge necessary for businesses to grow globally in an increasingly complex digital environment.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The rapid evolution of technology presents both challenges and opportunities. AIoT Inc. faces these challenges with a spirit of collaboration, creativity, and an unwavering pursuit of excellence. Our team is dedicated to solving today\'s problems while also providing solutions that anticipate the needs of the future.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>As we continue to grow, we remain true to our core values of <strong>integrity</strong>, <strong>innovation</strong>, and <strong>customer</strong>-<strong>central</strong>. Every product we develop, every partnership we build, and every service we offer reflects our deep commitment to creating value for our stakeholders and fostering the sustainable development of the platform (organization) that allows us to deliver valuable services to the world.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We sincerely appreciate the trust you have placed in us. Let us continue to build a smarter, deeper, and more connected future together.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Warm regards,</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>NGUYEN MANH HUNG</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>AIoT Inc.</strong><br><strong>Chief Executive Officer (CEO)</strong><br></p>\n<!-- /wp:paragraph -->', 'Message From CEO', 'At AIOT-Global, we are committed to revolutionizing the future with innovative AI and IoT solutions. Our vision is to empower global businesses through advanced technology, fostering growth and navigating the complexities of the digital era. As we continue to push the boundaries of innovation, we remain dedicated to delivering excellence, forging strong partnerships, and creating sustainable value for our clients and communities.', 'publish', 'closed', 'closed', '', 'message-from-ceo', '', '', '2024-12-06 12:31:08', '2024-12-06 03:31:08', '', 36, 'http://localhost:8080/?page_id=34', 0, 'page', '', 0),
(36, 1, '2024-09-27 18:07:11', '2024-09-27 09:07:11', '', 'Company', 'AIOT-Global is a leading technology company specializing in groundbreaking solutions in Artificial Intelligence (AI) and the Internet of Things (IoT). Our mission is to enhance operational efficiency and optimize business processes by continuously innovating and developing advanced technological products that enable global enterprises to connect, manage, and intelligently harness data effectively.\n\nAt AIOT-Global, we combine the power of AI and IoT to build automated systems that deliver safety, convenience, and an optimized user experience. With a team of experienced professionals and a commitment to quality, we are proud to be the trusted technology partner of many leading businesses worldwide.', 'publish', 'closed', 'closed', '', 'company', '', '', '2024-10-04 18:02:57', '2024-10-04 09:02:57', '', 0, 'http://localhost:8080/?page_id=36', 0, 'page', '', 0),
(38, 1, '2024-09-27 18:07:24', '2024-09-27 09:07:24', '<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\">Building a Happy Future with Our Clients</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We are committed to sincerely addressing the challenges our customers face and providing optimal solutions. Through our technological expertise and innovation, we support business growth and build relationships that share joy and success with our customers. We celebrate success together and pursue true happiness through long-term partnerships.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Creating a Happy Environment with Our Employees</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We value the growth and happiness of each employee. We respect free thinking and a spirit of challenge, providing an environment that supports self-actualization. In a workplace where colleagues support one another, we foster a culture of shared growth, achievement, and joy, creating an environment where everyone thrives.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Contributing to Society and Spreading Happiness</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Through our business, we contribute to the development of society and work towards creating a world where more people can experience happiness. By utilizing technology to solve social challenges, we aim to create a sustainable and harmonious future. Our philosophy of \"Happy Together\" focuses not only on corporate success but also on contributing to the happiness of society as a whole.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\"Happy Together\" is the belief we cherish in our business. By walking together, growing together, and building happiness together, we create a rich and happy future for ourselves and all our stakeholders.</p>\n<!-- /wp:paragraph -->', 'Vision＆Mission', 'Our company vision is centered around \"Happy Together.\" This phrase embodies our commitment to fostering collaboration, mutual growth, and shared happiness among all stakeholders.', 'publish', 'closed', 'closed', '', 'purpose', '', '', '2024-12-06 12:35:49', '2024-12-06 03:35:49', '', 36, 'http://localhost:8080/?page_id=38', 0, 'page', '', 0),
(40, 1, '2024-09-27 18:07:34', '2024-09-27 09:07:34', '<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"intro_title\":\"Information\",\"intro_desc\":\"\",\"intro_page_url\":\"\",\"media_spt\":\"Media\",\"type_media\":\"image\",\"image\":\"\",\"video\":\"\",\"img_slider\":[]}} /-->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<figure class=\"wp-block-table is-style-stripes\"><table class=\"has-fixed-layout\"><tbody><tr><td>Name</td><td>AIoT Inc.</td></tr><tr><td>Address</td><td>2nd Floor, Central Building, 1-1-5 Kyobashi, Chuo-ku, Tokyo, Japan<br><br>5th Floor, 50 Cuu Long Street, Tan Son Hoa Ward, Ho Chi Minh City, Vietnam<br><br>6th Floor, 132-136 Le Dinh Ly Street, Thanh Khe Ward, Da Nang City, Vietnam</td></tr><tr><td>Established</td><td>September 20, 2024</td></tr><tr><td>Capital</td><td>5,000,000 Yen</td></tr><tr><td>CEO</td><td>Nguyen Manh Hung</td></tr><tr><td>Business</td><td>DX System Development<br>BPO Services<br>Business Strategy and M&amp;A Consulting<br>Vietnam Expansion Support</td></tr><tr><td>Employee number</td><td>Japan　　　　 8<br>Vietnam　　　60</td></tr><tr><td>Main Banks</td><td>MUFG Bank, Ltd.<br>SMBC<br>Rakuten Bank</td></tr><tr><td>Company number</td><td>2010001248552</td></tr><tr><td>Group</td><td>Amazing IT（Da Nang）<br>AIoT Solutions（Ho Chi Minh）</td></tr></tbody></table></figure>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Outline', 'With a presence in both Tokyo and major cities in Vietnam, we integrate the cultures and business practices of Japan and Vietnam, providing regionally rooted yet globally minded services. This approach not only enhances our international competitiveness but also enables us to respond swiftly to the needs of our clients.', 'publish', 'closed', 'closed', '', 'outline', '', '', '2025-07-25 16:13:15', '2025-07-25 07:13:15', '', 36, 'http://localhost:8080/?page_id=40', 0, 'page', '', 0),
(42, 1, '2024-09-27 18:07:43', '2024-09-27 09:07:43', '<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"intro_title\":\"MEMBERS\",\"intro_desc\":\"\",\"intro_page_url\":\"\",\"media_spt\":\"Media\",\"type_media\":\"image\",\"image\":\"\",\"video\":\"\",\"img_slider\":[]}} /-->\n\n<!-- wp:tsb/team {\"members\":[{\"background\":{\"color\":\"#0000\"},\"border\":{\"radius\":\"3px\"},\"shadow\":[],\"photo\":{\"id\":170,\"url\":\"http://localhost:8080/wp-content/uploads/2024/10/202410040601-Dien-gia-1-Nguyen-Manh-Hung.jpg\",\"alt\":\"\",\"title\":\"Diễn giả 1 - Nguyễn Mạnh Hùng\"},\"photoBorder\":{\"radius\":\"50%\"},\"name\":\"Nguyen Manh Hung\",\"nameColor\":\"#333\",\"title\":\"CEO\",\"titleColor\":\"#333\",\"separator\":{\"width\":\"20%\",\"height\":\"3px\",\"color\":\"#777\"},\"bio\":\"I am a self-motivated and self-taught professional who likes to solve problems.\",\"bioColor\":\"#333\",\"social\":[{\"link\":\"#\",\"icon\":{\"class\":\"fab fa-facebook-f\"}},{\"link\":\"#\",\"icon\":{\"class\":\"fab fa-twitter\"}},{\"link\":\"#\",\"icon\":{\"class\":\"fab fa-linkedin-in\"}}],\"socialIconColors\":{\"type\":\"object\",\"default\":{\"color\":\"#fff\",\"bg\":\"#4527a4\"}}}],\"isSocial\":false} /-->', 'Company Executives', 'Walking together, growing together, and building happiness together. The key to our success lies in our talented members, who come from diverse backgrounds. Their expertise, passion, and teamwork are the driving forces behind our growth and customer satisfaction. Here, we introduce our team members and showcase how they embody the spirit of \"walking together, growing together, and building happiness together.\"', 'publish', 'closed', 'closed', '', 'officer', '', '', '2025-07-25 16:17:01', '2025-07-25 07:17:01', '', 36, 'http://localhost:8080/?page_id=42', 0, 'page', '', 0),
(44, 1, '2024-09-27 18:07:53', '2024-09-27 09:07:53', '<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"intro_title\":\"HEAD OFFICE\",\"intro_desc\":\"Web : www.aiot-global.com\\nAddress : 東京都中央区京橋1-1-5 セントラルビル 2階\\nTokyo, Chuo, Kyobashi 1-1-5 Central Building 2F\\nPhone : 03-4500-6968\\nEmail : info@aiot-fixing.local\",\"intro_page_url\":\"\",\"media_spt\":\"Media\",\"type_media\":\"image\",\"image\":\"\",\"video\":\"\",\"img_slider\":[]}} /-->', 'Network', '私たちの企業は、グローバルなビジネス展開を支えるために、国内外の信頼できるパートナーシップと広範なネットワークを構築しています。これにより、より幅広いソリューションを提供し、お客様の多様なニーズに迅速に応えることが可能です。', 'publish', 'closed', 'closed', '', 'network', '', '', '2024-10-04 18:30:34', '2024-10-04 09:30:34', '', 36, 'http://localhost:8080/?page_id=44', 0, 'page', '', 0),
(46, 1, '2024-09-27 18:09:04', '2024-09-27 09:09:04', '<!-- wp:carbon-fields/block-contact {\"data\":{\"contact_spt\":\"\",\"contact_guide\":\"\\u003cbutton class=\\u0022contact-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"contact_title\":\"\",\"contact_desc\":\"Get in touch for more information.\\nWe will hit you back as soon as possible.\",\"google_map\":\"\\u003ciframe src=\\u0022https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3240.9090375065953!2d139.77096899999998!3d35.6792417!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x60188bfd2fdaaaab%3A0xca3ad0245cfb8e73!2sCentral%20Building!5e0!3m2!1svi!2s!4v1727683004005!5m2!1svi!2s\\u0022 width=\\u0022100%\\u0022 height=\\u0022100%\\u0022 style=\\u0022border:0;\\u0022 allowfullscreen=\\u0022\\u0022 loading=\\u0022lazy\\u0022 referrerpolicy=\\u0022no-referrer-when-downgrade\\u0022\\u003e\\u003c/iframe\\u003e\",\"contact_method_spt\":\"Other contact methods\",\"contact_method\":[{\"_id\":\"cf-nNWjupd0ZX3EBPH4pEQRr\",\"_type\":\"_\",\"name\":\"Chat support\",\"url\":\"https://facebook.com/\"}]}} /-->', 'Contact', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2024-12-06 12:32:09', '2024-12-06 03:32:09', '', 0, 'http://localhost:8080/?page_id=46', 0, 'page', '', 0),
(52, 1, '2024-10-05 23:02:07', '2024-09-27 09:14:31', 'Default description', 'News Release', '', 'publish', 'closed', 'closed', '', '52', '', '', '2024-10-05 23:02:07', '2024-10-05 14:02:07', '', 0, 'http://localhost:8080/?p=52', 4, 'nav_menu_item', '', 0),
(53, 1, '2024-10-05 23:02:07', '2024-09-27 09:14:31', ' ', '', '', 'publish', 'closed', 'closed', '', '53', '', '', '2024-10-05 23:02:07', '2024-10-05 14:02:07', '', 0, 'http://localhost:8080/?p=53', 2, 'nav_menu_item', '', 0),
(55, 1, '2024-10-05 22:38:48', '2024-09-27 09:15:22', ' ', '', '', 'publish', 'closed', 'closed', '', '55', '', '', '2024-10-05 22:38:48', '2024-10-05 13:38:48', '', 0, 'http://localhost:8080/?p=55', 1, 'nav_menu_item', '', 0),
(57, 1, '2024-10-05 22:38:49', '2024-09-27 09:15:22', ' ', '', '', 'publish', 'closed', 'closed', '', '57', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 0, 'http://localhost:8080/?p=57', 4, 'nav_menu_item', '', 0),
(58, 1, '2024-10-05 22:38:49', '2024-09-27 09:15:22', ' ', '', '', 'publish', 'closed', 'closed', '', '58', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 36, 'http://localhost:8080/?p=58', 5, 'nav_menu_item', '', 0),
(59, 1, '2024-10-05 22:38:49', '2024-09-27 09:15:22', ' ', '', '', 'publish', 'closed', 'closed', '', '59', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 36, 'http://localhost:8080/?p=59', 9, 'nav_menu_item', '', 0),
(60, 1, '2024-10-05 22:38:49', '2024-09-27 09:15:22', ' ', '', '', 'publish', 'closed', 'closed', '', '60', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 36, 'http://localhost:8080/?p=60', 7, 'nav_menu_item', '', 0),
(61, 1, '2024-10-05 22:38:49', '2024-09-27 09:15:22', ' ', '', '', 'publish', 'closed', 'closed', '', '61', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 36, 'http://localhost:8080/?p=61', 8, 'nav_menu_item', '', 0),
(62, 1, '2024-10-05 22:38:49', '2024-09-27 09:15:22', ' ', '', '', 'publish', 'closed', 'closed', '', '62', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 36, 'http://localhost:8080/?p=62', 6, 'nav_menu_item', '', 0),
(63, 1, '2024-10-05 22:38:49', '2024-09-27 09:15:22', ' ', '', '', 'publish', 'closed', 'closed', '', '63', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 0, 'http://localhost:8080/?p=63', 15, 'nav_menu_item', '', 0),
(68, 1, '2024-10-05 22:38:48', '2024-09-27 09:21:43', 'Default description', '', '', 'publish', 'closed', 'closed', '', '68', '', '', '2024-10-05 22:38:48', '2024-10-05 13:38:48', '', 0, 'http://localhost:8080/?p=68', 2, 'nav_menu_item', '', 0),
(77, 1, '2024-09-27 19:27:27', '2024-09-27 10:27:27', '', 'banner', '', 'inherit', 'open', 'closed', '', 'banner', '', '', '2024-09-27 19:27:27', '2024-09-27 10:27:27', '', 8, 'http://localhost:8080/wp-content/uploads/2024/09/202409271027-banner.png', 0, 'attachment', 'image/png', 0),
(79, 1, '2024-09-27 19:41:20', '2024-09-27 10:41:20', '', 'Banner - Video', '', 'inherit', 'open', 'closed', '', 'banner-video', '', '', '2024-09-27 19:41:20', '2024-09-27 10:41:20', '', 8, 'http://localhost:8080/wp-content/uploads/2024/09/202409271041-Banner-Video.mp4', 0, 'attachment', 'video/mp4', 0),
(82, 1, '2024-09-27 19:46:24', '2024-09-27 10:46:24', '', '名称未設定のデザイン', '', 'inherit', 'open', 'closed', '', '%e5%90%8d%e7%a7%b0%e6%9c%aa%e8%a8%ad%e5%ae%9a%e3%81%ae%e3%83%87%e3%82%b6%e3%82%a4%e3%83%b3', '', '', '2024-09-27 19:46:24', '2024-09-27 10:46:24', '', 8, 'http://localhost:8080/wp-content/uploads/2024/09/202409271046-.mp4', 0, 'attachment', 'video/mp4', 0),
(89, 1, '2024-09-27 21:30:01', '2024-09-27 12:30:01', '', '1', '', 'inherit', 'open', 'closed', '', '1', '', '', '2024-09-27 21:30:01', '2024-09-27 12:30:01', '', 0, 'http://localhost:8080/wp-content/uploads/2024/09/202409271230-1.png', 0, 'attachment', 'image/png', 0),
(90, 1, '2024-09-27 21:30:08', '2024-09-27 12:30:08', '', '2', '', 'inherit', 'open', 'closed', '', '2', '', '', '2024-09-27 21:30:08', '2024-09-27 12:30:08', '', 0, 'http://localhost:8080/wp-content/uploads/2024/09/202409271230-2.png', 0, 'attachment', 'image/png', 0),
(91, 1, '2024-09-27 21:30:13', '2024-09-27 12:30:13', '', '3', '', 'inherit', 'open', 'closed', '', '3', '', '', '2024-09-27 21:30:13', '2024-09-27 12:30:13', '', 0, 'http://localhost:8080/wp-content/uploads/2024/09/202409271230-3.png', 0, 'attachment', 'image/png', 0),
(92, 1, '2024-09-27 21:30:23', '2024-09-27 12:30:23', '', '4', '', 'inherit', 'open', 'closed', '', '4', '', '', '2024-09-27 21:30:23', '2024-09-27 12:30:23', '', 0, 'http://localhost:8080/wp-content/uploads/2024/09/202409271230-4.png', 0, 'attachment', 'image/png', 0),
(93, 1, '2024-09-27 21:30:30', '2024-09-27 12:30:30', '', '5', '', 'inherit', 'open', 'closed', '', '5', '', '', '2024-09-27 21:30:30', '2024-09-27 12:30:30', '', 0, 'http://localhost:8080/wp-content/uploads/2024/09/202409271230-5.png', 0, 'attachment', 'image/png', 0),
(94, 1, '2024-09-27 21:30:34', '2024-09-27 12:30:34', '', '6', '', 'inherit', 'open', 'closed', '', '6', '', '', '2024-09-27 21:30:34', '2024-09-27 12:30:34', '', 0, 'http://localhost:8080/wp-content/uploads/2024/09/202409271230-6.png', 0, 'attachment', 'image/png', 0),
(95, 1, '2024-09-27 21:40:00', '2024-09-27 12:40:00', 'http://localhost:8080/wp-content/uploads/2024/09/202409271240-cropped-202409271027-AIOT-LOGO-1024x1024-1.png', 'AIOT-LOGO-1024x1024', '', 'inherit', 'open', 'closed', '', 'aiot-logo-1024x1024-2', '', '', '2024-09-27 21:40:00', '2024-09-27 12:40:00', '', 76, 'http://localhost:8080/wp-content/uploads/2024/09/202409271240-cropped-202409271027-AIOT-LOGO-1024x1024-1.png', 0, 'attachment', 'image/png', 0),
(101, 1, '2024-09-27 22:30:48', '2024-09-27 13:30:48', '', 'LOGO_M@360', '', 'inherit', 'open', 'closed', '', 'logo_m360', '', '', '2024-09-27 22:30:48', '2024-09-27 13:30:48', '', 0, 'http://localhost:8080/wp-content/uploads/2024/09/202409271330-LOGOM360.png', 0, 'attachment', 'image/png', 0),
(102, 1, '2024-09-27 23:20:50', '2024-09-27 14:20:50', '', 'Banner - Video', '', 'inherit', 'open', 'closed', '', 'banner-video-2', '', '', '2024-09-27 23:20:50', '2024-09-27 14:20:50', '', 8, 'http://localhost:8080/wp-content/uploads/2024/09/202409271420-Banner-Video.jpg', 0, 'attachment', 'image/jpeg', 0),
(138, 1, '2024-09-28 21:22:04', '2024-09-28 12:22:04', '', 'AIOT', '', 'inherit', 'open', 'closed', '', 'aiot-2', '', '', '2024-09-28 21:22:04', '2024-09-28 12:22:04', '', 20, 'http://localhost:8080/wp-content/uploads/2024/09/202409281222-AIOT.mp4', 0, 'attachment', 'video/mp4', 0),
(146, 1, '2024-09-28 22:49:22', '2024-09-28 13:49:22', '', 'DIGITAL TRANSFORMATION', '', 'inherit', 'open', 'closed', '', 'digital-transformation', '', '', '2024-09-28 22:49:22', '2024-09-28 13:49:22', '', 20, 'http://localhost:8080/wp-content/uploads/2024/09/202409281349-DIGITAL-TRANSFORMATION.mp4', 0, 'attachment', 'video/mp4', 0),
(160, 1, '2024-09-29 22:56:58', '2024-09-29 13:56:58', '<!-- wp:paragraph -->\n<p>The National Innovation Centre (NIC) proudly marks its fifth anniversary with the grand celebration of Innovate Vietnam 2024. This landmark event, hosted by the Ministry of Planning and Investment (MPI) and co-organised by NIC and VCCorp, is set to take place on October 1-2, 2024, at the NIC campus in Hoa Lac High-Tech Park, Hanoi.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>A Vision for the Future</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Innovate Vietnam 2024 is poised to ignite the future of innovation in Vietnam. Under the theme “Aspiration - Pioneering - Breakthrough,” the event aims to highlight NIC’s remarkable transformation over the past five years and its pivotal role in advancing Vietnam’s innovation ecosystem.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Distinguished Guests and Keynote Speakers</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The event will be graced by the presence of Prime Minister Pham Minh Chinh, along with key leaders from various ministries, government agencies, research institutions, universities, companies, banks, investment funds, and global organisations. Their participation underscores the significance of NIC’s contributions to fostering a vibrant and dynamic innovation landscape in Vietnam.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Highlights of Innovate Vietnam 2024</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Keynote Addresses</strong>: Insightful speeches from prominent figures in the innovation and technology sectors.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Panel Discussions</strong>: Engaging dialogues on the future of innovation, technology trends, and investment opportunities.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Exhibitions</strong>: Showcasing cutting-edge technologies and innovative solutions from leading companies and startups.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Networking Opportunities</strong>: Facilitating connections between innovators, investors, and industry leaders.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p><strong>AIOT CEO’s Participation</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>A notable highlight of the event is the participation of the AIOT CEO, who will share insights on the integration of AI and IoT technologies in driving innovation. Their presence signifies the growing importance of these technologies in shaping the future of various industries.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>NIC’s Journey and Achievements</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Over the past five years, NIC has emerged as a cornerstone of Vietnam’s innovation ecosystem. Through its initiatives and collaborations, NIC has fostered a culture of innovation, supported startups, and facilitated the development of cutting-edge technologies. Innovate Vietnam 2024 serves as a testament to NIC’s commitment to pioneering breakthroughs and inspiring aspirations for a brighter future.</p>\n<!-- /wp:paragraph -->', 'Celebrating Innovation: NIC’s Fifth Anniversary and Innovate Vietnam 2024', '', 'publish', 'closed', 'closed', '', 'nic-innovate-vietnam-2024', '', '', '2024-10-05 22:55:14', '2024-10-05 13:55:14', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=160', 0, 'blog', '', 0),
(164, 1, '2024-09-30 22:51:48', '2024-09-30 13:51:48', '', 'AIoT-facebook-post', '', 'inherit', 'open', 'closed', '', 'aiot-facebook-post', '', '', '2024-09-30 22:51:48', '2024-09-30 13:51:48', '', 0, 'http://localhost:8080/wp-content/uploads/2024/09/202409301351-AIoT-facebook-post.png', 0, 'attachment', 'image/png', 0),
(169, 1, '2024-10-04 15:01:46', '2024-10-04 06:01:46', '', 'DSCF1923', '', 'inherit', 'open', 'closed', '', 'dscf1923', '', '', '2024-10-04 15:01:46', '2024-10-04 06:01:46', '', 0, 'http://localhost:8080/wp-content/uploads/2024/10/202410040601-DSCF1923.jpg', 0, 'attachment', 'image/jpeg', 0),
(170, 1, '2024-10-04 15:01:55', '2024-10-04 06:01:55', '', 'Diễn giả 1 - Nguyễn Mạnh Hùng', 'CEO Nguyen Manh Hung', 'inherit', 'open', 'closed', '', 'dien-gia-1-nguyen-manh-hung', '', '', '2024-10-04 17:47:13', '2024-10-04 08:47:13', '', 0, 'http://localhost:8080/wp-content/uploads/2024/10/202410040601-Dien-gia-1-Nguyen-Manh-Hung.jpg', 0, 'attachment', 'image/jpeg', 0),
(172, 1, '2024-10-04 15:16:06', '2024-10-04 06:16:06', '', 'aiot-feature-image', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image', '', '', '2024-10-04 15:16:06', '2024-10-04 06:16:06', '', 38, 'http://localhost:8080/wp-content/uploads/2024/10/202410040616-aiot-feature-image.jpg', 0, 'attachment', 'image/jpeg', 0),
(175, 1, '2024-10-04 15:29:32', '2024-10-04 06:29:32', '', 'aiot-feature-image(3)', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image3', '', '', '2024-10-04 15:29:32', '2024-10-04 06:29:32', '', 38, 'http://localhost:8080/wp-content/uploads/2024/10/202410040629-aiot-feature-image3.jpg', 0, 'attachment', 'image/jpeg', 0),
(176, 1, '2024-10-04 16:36:52', '2024-10-04 07:36:52', '', '3', '', 'inherit', 'open', 'closed', '', '3-2', '', '', '2024-10-04 16:36:52', '2024-10-04 07:36:52', '', 44, 'http://localhost:8080/wp-content/uploads/2024/10/202410040736-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(179, 1, '2024-10-04 16:44:55', '2024-10-04 07:44:55', '', 'aiot-feature-image', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image-2', '', '', '2024-10-04 16:44:55', '2024-10-04 07:44:55', '', 40, 'http://localhost:8080/wp-content/uploads/2024/10/202410040744-aiot-feature-image.jpg', 0, 'attachment', 'image/jpeg', 0),
(182, 1, '2024-10-04 17:44:38', '2024-10-04 08:44:38', '', 'aiot-feature-image(1)', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image1', '', '', '2024-10-04 17:44:38', '2024-10-04 08:44:38', '', 42, 'http://localhost:8080/wp-content/uploads/2024/10/202410040844-aiot-feature-image1.jpg', 0, 'attachment', 'image/jpeg', 0),
(190, 1, '2024-10-04 18:02:51', '2024-10-04 09:02:51', '', 'aiot-feature-image(2)', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image2', '', '', '2024-10-04 18:02:51', '2024-10-04 09:02:51', '', 36, 'http://localhost:8080/wp-content/uploads/2024/10/202410040902-aiot-feature-image2.jpg', 0, 'attachment', 'image/jpeg', 0),
(204, 1, '2025-10-03 15:03:07', '2024-10-04 09:40:10', ' ', '', '', 'publish', 'closed', 'closed', '', '204', '', '', '2025-10-03 15:03:07', '2025-10-03 06:03:07', '', 0, 'http://localhost:8080/?p=204', 1, 'nav_menu_item', '', 0),
(207, 1, '2024-10-04 18:43:48', '2024-10-04 09:43:48', '', '企業情報', 'AIoT株式会社は、人工知能（AI）とモノのインターネット（IoT）における画期的なソリューションを専門とする先進的なテクノロジー企業です。私たちの使命は、継続的なイノベーションと高度な技術製品の開発を通じて、グローバル企業がデータを効果的に接続、管理し、知的に活用できるようにすることで、業務効率を向上させ、ビジネスプロセスを最適化することです。\n\nAIoT株式会社では、AIとIoTの力を結集し、安全性、利便性、そして最適化されたユーザー体験を提供する自動化システムを構築しています。経験豊富なプロフェッショナルチームと品質への強いコミットメントを持ち、世界中の多くの有力企業から信頼されるテクノロジーパートナーであることを誇りに思っています。', 'publish', 'closed', 'closed', '', 'company', '', '', '2024-10-04 19:46:36', '2024-10-04 10:46:36', '', 0, 'http://localhost:8080/?page_id=207', 0, 'page', '', 0),
(210, 1, '2024-10-04 18:45:36', '2024-10-04 09:45:36', '<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\"><strong>顧客との幸せな未来を築く</strong></h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>私たちは、顧客が抱える課題に真摯に向き合い、最適なソリューションを提供することを使命としています。技術力と革新を通じて、ビジネスの成長を支援し、顧客と共に喜びと成果を分かち合う関係を築きます。成功を共に喜び合い、長期的なパートナーシップを通じて、真の幸せを追求します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\"><strong>従業員との幸せな環境作り</strong></h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>私たちは、従業員一人ひとりの成長と幸福を大切にしています。自由な発想とチャレンジ精神を尊重し、自己実現をサポートする環境を提供します。仲間同士が支え合い、明るく前向きな職場で、全員が共に成長し、達成感と喜びを共有する文化を築いていきます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\"><strong>社会に貢献し、共に幸せを広げる</strong></h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>私たちは、事業を通じて社会の発展に貢献し、より多くの人々が幸せを感じられる社会づくりに取り組んでいます。テクノロジーを活用して社会的な課題を解決し、持続可能で調和のとれた未来を創造することを目指しています。企業としての成功だけでなく、社会全体の幸福を目指すことが、私たちの「Happy Together」の理念です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:spacer {\"height\":\"16px\"} -->\n<div style=\"height:16px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->\n\n<!-- wp:spacer {\"height\":\"16px\"} -->\n<div style=\"height:16px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:paragraph -->\n<p>「Happy Together」は、私たちがビジネスにおいて大切にしている信念です。共に歩み、共に成長し、共に幸せを築くことで、私たちとすべてのステークホルダーが豊かで幸せな未来を創造します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'ビジョン・ミッション', 'Happy Together - 共に幸せを創る\n私たちの企業のビジョンは、「Happy Together」を中心に据えています。この言葉には、すべての関係者が協力し合い、共に成長し、幸せを分かち合うという思いが込められています。', 'publish', 'closed', 'closed', '', 'vision', '', '', '2024-10-10 01:16:17', '2024-10-09 16:16:17', '', 207, 'http://localhost:8080/?page_id=210', 2, 'page', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(213, 1, '2024-10-04 18:46:23', '2024-10-04 09:46:23', '<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">お客様、パートナー、そして友人の皆様へ</h3>\n<!-- /wp:heading -->\n\n<!-- wp:spacer {\"height\":\"16px\"} -->\n<div style=\"height:16px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:paragraph -->\n<p>AIoT株式会社は、テクノロジーを活用し、よりつながりのある知的な未来を創造することを目指しています。私たちは、人工知能（AI）とモノのインターネット（IoT）分野のイノベーションを牽引し、最先端のソリューションを開発するだけでなく、複雑化するデジタル環境において、企業がグローバルに成長するためのツールと知識を提供しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>テクノロジーの急速な進化は、新たな課題と機会を生み出しています。AIoT株式会社は、これらの課題に対し、協力、創造性、そして卓越性を絶え間なく追求していく精神と姿勢を持ち取り組んでいます。私たちのチームは、今日の問題を解決するだけでなく、未来のニーズを見据えたソリューションを提供することに全力を注いでいます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>成長を続ける中でも、私たちは「誠実さ」「革新性」「顧客重視」という私たちの核心的な価値に忠実であり続けます。私たちが開発するすべての製品、築き上げるすべてのパートナーシップ、提供するすべてのサービスには、ステークホルダーの皆様に価値を創出し、私たちが世に価値のあるサービスを展開していくプラットフォーム（組織）のサステナブルな発展を促進させるという私たちの深いコミットメントが反映されています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>皆様からの信頼に心より感謝申し上げます。より賢明に、より深くつながれる未来を共に築いてまいりましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"right\",\"style\":{\"typography\":{\"fontSize\":\"26px\"}}} -->\n<p class=\"has-text-align-right\" style=\"font-size:26px\"><br>AIoT株式会社・最高経営責任者 (CEO)</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"right\",\"style\":{\"typography\":{\"fontSize\":\"36px\"}}} -->\n<p class=\"has-text-align-right\" style=\"font-size:36px\"><strong>グエン　マン　フン</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"right\",\"style\":{\"typography\":{\"fontSize\":\"36px\"}}} -->\n<p class=\"has-text-align-right\" style=\"font-size:36px\"><strong>グエン　タケオ</strong></p>\n<!-- /wp:paragraph -->', 'トップメッセージ', 'AIoT株式会社では、世界がテクノロジーを活用して、よりつながりのある知的な未来を創り出す方法を革新するという一つのビジョンに駆り立てられています。私たちは、人工知能（AI）とモノのインターネット（IoT）におけるイノベーションの最前線に立ち、単に最先端のソリューションを開発するだけでなく、複雑化するデジタル環境の中で企業がグローバルに成長し続けるためのツールと知識を提供することを目指しています。', 'publish', 'closed', 'closed', '', 'message-from-ceo', '', '', '2025-07-23 13:58:51', '2025-07-23 04:58:51', '', 207, 'http://localhost:8080/?page_id=213', 0, 'page', '', 0),
(215, 1, '2024-10-04 18:46:59', '2024-10-04 09:46:59', '<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"intro_title\":\"Information\",\"intro_desc\":\"\",\"intro_page_url\":\"\",\"media_spt\":\"Media\",\"type_media\":\"image\",\"image\":\"\",\"video\":\"\",\"img_slider\":[]}} /-->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<figure class=\"wp-block-table is-style-stripes\"><table class=\"has-fixed-layout\"><tbody><tr><td>社名</td><td>AIoT株式会社<br>AIoT Inc.</td></tr><tr><td>本社所在地</td><td>東京都中央区京橋1-1-5 セントラルビル 2階</td></tr><tr><td>設立</td><td>2024年9月20日</td></tr><tr><td>資本金</td><td>5,000,000 円</td></tr><tr><td>代表取締役</td><td>Nguyen Manh Hung</td></tr><tr><td>事業内容</td><td>DXシステム開発関連事業<br>BPO支援事業<br>経営戦略・M＆A支援コンサルティング事業<br>ベトナム進出支援事業</td></tr><tr><td>従業員数</td><td>日本　　　　8名<br>ベトナム　60名以上</td></tr><tr><td>主要取引銀行</td><td>三菱UFJ銀行<br>三井住友銀行<br>楽天銀行</td></tr><tr><td>法人番号</td><td>2010001248552</td></tr><tr><td>関連会社</td><td>Amazing IT (ダナン市)<br>代表取締役社長：Tran Dinh Tri<br><br>AIoT Solutions (ホーチミン市)<br>代表取締役社長：Nguyen Ba Tu</td></tr></tbody></table></figure>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '会社概要', '東京とベトナムの大都市を基盤とする拠点展開により、私たちは日越両国の文化とビジネス慣習を融合し、地域に根ざしつつもグローバルな視野を持ったサービスを提供しています。これにより、国際的な競争力を高めるだけでなく、顧客のニーズに迅速に対応できる体制を整えています。', 'publish', 'closed', 'closed', '', 'outline', '', '', '2025-07-25 15:42:51', '2025-07-25 06:42:51', '', 207, 'http://localhost:8080/?page_id=215', 4, 'page', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(217, 1, '2024-10-04 18:47:26', '2024-10-04 09:47:26', '<!-- wp:icb/cards {\"clientId\":\"5bb00681-58ac-43c0-ba83-fed3afd823fd\",\"cards\":[{\"background\":{\"color\":\"#fff\"},\"img\":\"http://localhost:8080/wp-content/uploads/2025/07/202507230410-CEO.png\",\"title\":\"\\u003cstrong\\u003e代表取締役社長\\u003c/strong\\u003e\",\"desc\":\"NGUYEN MANH HUNG\\u003cbr\\u003e\\u003cstrong\\u003e阮 孟 雄 ゲン タケオ\\u003c/strong\\u003e\",\"btnLabal\":\"Button\",\"btnUrl\":\"#\",\"isBtn\":true,\"cardUrl\":\"\"},{\"background\":{\"color\":\"#fff\"},\"img\":\"http://localhost:8080/wp-content/uploads/2025/07/202507230655-CEOThuat.png\",\"title\":\"\\u003cstrong\\u003e最高執行責任者\\u003c/strong\\u003e\",\"desc\":\"NGUYEN THANH THUAT\\u003cbr\\u003e\\u003cstrong\\u003eグエン タン チュアット\\u003c/strong\\u003e\",\"btnLabal\":\"Button\",\"btnUrl\":\"#\",\"isBtn\":true,\"cardUrl\":\"\"},{\"background\":{\"color\":\"#fff\"},\"img\":\"http://localhost:8080/wp-content/uploads/2025/07/202507230702-CEOBINH.png\",\"title\":\"\\u003cstrong\\u003e最高技術責任者\\u003c/strong\\u003e\",\"desc\":\"BUI DUC BINH\\u003cbr\\u003e\\u003cstrong\\u003eブイ ドク ビン\\u003c/strong\\u003e\",\"btnLabal\":\"Button\",\"btnUrl\":\"#\",\"isBtn\":true,\"cardUrl\":\"\"},{\"background\":{\"color\":\"#fff\"},\"img\":\"http://localhost:8080/wp-content/uploads/2025/07/202507230721-CEOOSHIMA.png\",\"title\":\"\\u003cstrong\\u003e上級顧問\\u003c/strong\\u003e\",\"desc\":\"HIDEKI OSHIMA\\u003cbr\\u003e\\u003cstrong\\u003e大島 秀樹\\u003c/strong\\u003e\",\"btnLabal\":\"Button\",\"btnUrl\":\"#\",\"isBtn\":true,\"cardUrl\":\"\"}],\"isTab\":true,\"btnColors\":{\"color\":\"#fff\",\"bg\":\"rgba(68, 39, 163, 0)\"},\"btnHovColors\":{\"color\":\"#fff\",\"bg\":\"rgba(255, 102, 0, 0)\"},\"btnPadding\":{\"top\":\"0px\",\"right\":\"0px\",\"bottom\":\"0px\",\"left\":\"0px\"},\"btnRadius\":\"0px\"} /-->\n\n<!-- wp:cp-timeline/content-timeline-block {\"block_id\":\"1063389c-8561-4a9f-809a-f1fd3f04ed1c\"} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block Cool-Content-Timeline\"><div class=\"cool-timeline-block-1063389c-8561-4a9f-809a-f1fd3f04ed1c\"><div class=\"cool-vertical-timeline-body ctlb-wrapper both-sided left\"><div class=\"cool-timeline-block-list\"><!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon is born\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"block_id\":\"94a96f32-a71d-4e65-ba64-0aa871ed0490\",\"t_date\":\"\\u003cstrong\\u003e代表取締役社長 (CEO)\\u003c/strong\\u003e\",\"blockPosition\":\"right\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"content\":\"Amazon is born\",\"level\":3,\"pll_lang\":\"\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"dropCap\":false,\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p><strong>代表取締役社長 (CEO)</strong></p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:image {\"id\":696,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/07/202507230410-CEO.png\" alt=\"\" class=\"wp-image-696\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">NGUYEN MANH HUNG<br>阮 孟 雄 ゲン タケオ</h3>\n<!-- /wp:heading --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"dbd1f734-71b1-4782-9cb7-21892f26d483\",\"t_date\":\"2006年06月\",\"blockPosition\":\"right\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2006年06月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">卒業</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">ベトナム国立ハノイ工科大学卒業</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"2dd6bf6b-d19d-4caa-8701-0425ab707df8\",\"t_date\":\"2010年03月\",\"blockPosition\":\"left\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2010年03月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">修了</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">日本国立豊橋技術科学大学大学院修了</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\"></p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"dcf84802-1d7d-4535-8daa-3dce1d298eb6\",\"t_date\":\"2010年04月\",\"blockPosition\":\"right\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2010年04月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">入社</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">アクセンチュア株式会社入社</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\"></p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"a4a566bc-08ec-424b-a20e-70720bbd4be7\",\"t_date\":\"2017年05月\",\"blockPosition\":\"left\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2017年05月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">デリバリーマネージャー</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">株式会社ハイブリッドテクノロジーズ入社</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"10d2d2a2-6a7a-40c3-893a-772fc6c3fb0d\",\"t_date\":\"2018年09月\",\"blockPosition\":\"right\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2018年09月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">取締役・COO</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">NewIT株式会社共同創立</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"b34776b3-1b47-4b63-9c90-2d8b7d102c08\",\"t_date\":\"2023年05月\",\"blockPosition\":\"left\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2023年05月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">理事・副会長</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">一般社団法人在日ベトナム人起業家支援協会共同創立</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon acquires Audible\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon3-1-600x338.png\",\"block_id\":\"3275b293-e2f1-4b47-b3d2-9ae22fde0a14\",\"t_date\":\"2024年07月\",\"blockPosition\":\"right\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"content\":\"Amazon acquires Audible\",\"level\":3,\"pll_lang\":\"\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"dropCap\":false,\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2024年07月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">副会長</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">一般社団法人在日ベトナムDX協会共同創立</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon Prime debuts\",\"time_desc\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"block_id\":\"07f02fc3-6c7c-4610-b0e2-2cd0c20ab152\",\"t_date\":\"2024年09月\",\"blockPosition\":\"left\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"content\":\"Amazon Prime debuts\",\"level\":3,\"pll_lang\":\"\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"dropCap\":false,\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2024年09月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">代表取締役・CEO</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">AIoT株式会社設立</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child --></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block -->\n\n<!-- wp:cp-timeline/content-timeline-block {\"block_id\":\"f404c27d-71f8-4baf-9f01-820198de4c56\"} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block Cool-Content-Timeline\"><div class=\"cool-timeline-block-f404c27d-71f8-4baf-9f01-820198de4c56\"><div class=\"cool-vertical-timeline-body ctlb-wrapper both-sided left\"><div class=\"cool-timeline-block-list\"><!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon is born\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"block_id\":\"4786c27b-0639-4a71-9b90-da64b006f445\",\"t_date\":\"\\u003cstrong\\u003e最高執行責任者 (COO)\\u003c/strong\\u003e\",\"blockPosition\":\"right\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon is born\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p><strong>最高執行責任者 (COO)</strong></p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:image {\"id\":704,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/07/202507230655-CEOThuat.png\" alt=\"\" class=\"wp-image-704\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">NGUYEN THANH THUAT<br>グエン タン チュアット</h3>\n<!-- /wp:heading --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"b8598800-0ee9-441c-ad15-6dd4631b2944\",\"t_date\":\"2003年08月\",\"blockPosition\":\"right\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2003年08月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">卒業</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">ベトナム国立ホーチミン自然科学大学</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"eccd36fa-6431-4083-91b3-0e73d8e10e92\",\"t_date\":\"2006年08月\",\"blockPosition\":\"left\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2006年08月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">入社</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">株式会社Murakumo入社</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"f8b6d166-2fbf-4015-b238-77780266c743\",\"t_date\":\"2011年11月\",\"blockPosition\":\"right\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2011年11月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">入社</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">株式会社VTM入社</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"c4e9bff0-1205-4731-8b52-5a58f1ee7921\",\"t_date\":\"2017年08月\",\"blockPosition\":\"left\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2017年08月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">入社</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">株式会社ラクス入社</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon acquires Audible\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon3-1-600x338.png\",\"block_id\":\"1ec2356b-1fb5-45ba-b703-6a7b764894ac\",\"t_date\":\"2021年02月\",\"blockPosition\":\"right\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"content\":\"Amazon acquires Audible\",\"level\":3,\"pll_lang\":\"\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"dropCap\":false,\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2021年02月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">CTO</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">NewIT株式会社設立</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon Prime debuts\",\"time_desc\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"block_id\":\"635dd38d-6b48-42d6-9243-c0431e761905\",\"t_date\":\"2024年09月\",\"blockPosition\":\"left\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon Prime debuts\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2024年09月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">COO</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">AIoT株式会社設立</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child --></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block -->\n\n<!-- wp:cp-timeline/content-timeline-block {\"block_id\":\"c036a169-57ac-4184-a8c1-6ab6741e7959\"} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block Cool-Content-Timeline\"><div class=\"cool-timeline-block-c036a169-57ac-4184-a8c1-6ab6741e7959\"><div class=\"cool-vertical-timeline-body ctlb-wrapper both-sided left\"><div class=\"cool-timeline-block-list\"><!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon is born\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"block_id\":\"bbb4ddc5-67f1-4f58-92d0-af9330f37933\",\"t_date\":\"最高技術責任者 (CTO)\",\"blockPosition\":\"right\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon is born\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>最高技術責任者 (CTO)</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:image {\"id\":705,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/07/202507230702-CEOBINH.png\" alt=\"\" class=\"wp-image-705\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">BUI DUC BINH<br>ブイ ドク ビン</h3>\n<!-- /wp:heading --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"9d37d3e8-22e7-4db5-bc74-7426849d8225\",\"t_date\":\"2008年10月\",\"blockPosition\":\"right\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2008年10月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">入学</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">ベトナム国立ハノイ工科大学</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"afdeeb47-ab82-4ed0-aae2-f0352287a50c\",\"t_date\":\"2014年09月\",\"blockPosition\":\"left\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2014年09月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">卒業</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">早稲田大学基幹理工学部情報理工・情報通信専攻</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"a050be57-41a1-49c5-bf78-038ad85871e9\",\"t_date\":\"2016年09月\",\"blockPosition\":\"right\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2016年09月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">修了</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">早稲田大学基幹理工研究科情報理工・情報通信専攻</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"e225f721-522a-41c8-b5e4-725cbde3f4c6\",\"t_date\":\"2016年10月\",\"blockPosition\":\"left\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2016年10月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">ソフトウェア開発</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">日本IBM株式会社入社</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon acquires Audible\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon3-1-600x338.png\",\"block_id\":\"3c847ee5-af31-41c2-b3bb-9a6f9e3f1dc1\",\"t_date\":\"2021年01月\",\"blockPosition\":\"right\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon3-1-600x338.png\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon acquires Audible\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2021年01月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">CTO</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">Habibi株式会社CTO就任</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon Prime debuts\",\"time_desc\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"block_id\":\"798efca3-e911-471b-ab3c-3ea0d81850d4\",\"t_date\":\"2024年09月\",\"blockPosition\":\"left\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon Prime debuts\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2024年09月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">CTO</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">AIoT株式会社設立</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child --></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block -->\n\n<!-- wp:cp-timeline/content-timeline-block {\"block_id\":\"d70cbed5-c386-41ad-a042-f8f52c7dd1b0\"} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block Cool-Content-Timeline\"><div class=\"cool-timeline-block-d70cbed5-c386-41ad-a042-f8f52c7dd1b0\"><div class=\"cool-vertical-timeline-body ctlb-wrapper both-sided left\"><div class=\"cool-timeline-block-list\"><!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon is born\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"block_id\":\"39604a15-8a53-469c-ac7e-01923b2d2955\",\"t_date\":\"上級顧問(Senior Advisor)\",\"blockPosition\":\"right\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon is born\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>上級顧問(Senior Advisor)</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:image {\"id\":706,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/07/202507230721-CEOOSHIMA.png\" alt=\"\" class=\"wp-image-706\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">HIDEKI OSHIMA<br>大島 秀樹</h3>\n<!-- /wp:heading --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"65672a71-d700-47cd-ad4e-ff0fb26b7d47\",\"t_date\":\"1985年03月\",\"blockPosition\":\"right\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>1985年03月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">卒業</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">国立大学法人神戸大学経営学部専攻</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"a48ed821-05cf-43c1-8854-291f4079f9c5\",\"t_date\":\"1985年04月\",\"blockPosition\":\"left\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>1985年04月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">入社</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">日本航空株式会社入社</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"586ba945-94e6-44ca-ad81-c349a2bea95e\",\"t_date\":\"2009年06月\",\"blockPosition\":\"right\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2009年06月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">就任</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">日本航空株式会社サンフランシスコ支店長</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"7c51ff83-7fe9-4c84-b189-6b5763c805b8\",\"t_date\":\"2012年07月\",\"blockPosition\":\"left\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2012年07月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">就任</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">日本航空株式会社成田空港支店長</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"b857152f-6307-4f8e-a046-6e497664115f\",\"t_date\":\"2014年04月\",\"blockPosition\":\"right\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2014年04月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">就任</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">日本航空株式会社執行役員<br>国際提携担当</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"edd2fcdf-40b7-4735-b227-deec1a6d6fd8\",\"t_date\":\"2021年04月\",\"blockPosition\":\"left\",\"block_position_active\":false,\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2021年04月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">就任</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">関西外国語大学教授(エアライン・ビジネス)</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon acquires Audible\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon3-1-600x338.png\",\"block_id\":\"623215ca-9c89-497a-811b-26c8c1ccc4ee\",\"t_date\":\"2023年06月\",\"blockPosition\":\"right\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon3-1-600x338.png\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon acquires Audible\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2023年06月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">就任</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">Bamboo Airways上級顧問</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon Prime debuts\",\"time_desc\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"block_id\":\"84d3f3f5-1f3e-494f-b97b-0297bc771905\",\"t_date\":\"2025年08月\",\"blockPosition\":\"left\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon Prime debuts\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2025年08月</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">就任</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">AIoT株式会社上級顧問</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child --></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block -->', '役員紹介', '共に歩み、共に成長し、共に幸せを築く。 私たちの成功の鍵は、優秀で多様なバックグラウンドを持つメンバーたちです。彼らの専門知識、情熱、そしてチームワークが、私たちの成長と顧客満足を支えています。ここでは、私たちのメンバーたちを紹介し、彼らがどのように「共に歩み、共に成長し、共に幸せを築く」を実現しているかをご紹介します。', 'publish', 'closed', 'closed', '', 'officer', '', '', '2025-09-23 12:49:44', '2025-09-23 03:49:44', '', 207, 'http://localhost:8080/?page_id=217', 5, 'page', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(219, 1, '2024-10-04 18:47:48', '2024-10-04 09:47:48', '<!-- wp:carbon-fields/block-intro {\"data\":{\"intro_spt\":\"\",\"intro_guide\":\"\\u003cbutton class=\\u0022intro-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"reversed\":false,\"intro_title\":\"HEAD OFFICE\",\"intro_desc\":\"\",\"intro_page_url\":\"\",\"media_spt\":\"Media\",\"type_media\":\"image\",\"image\":\"\",\"video\":\"\",\"img_slider\":[]}} /-->\n\n<!-- wp:table {\"className\":\"is-style-stripes\"} -->\n<figure class=\"wp-block-table is-style-stripes\"><table class=\"has-fixed-layout\"><tbody><tr><td>Address</td><td>東京都中央区京橋1-1-5 セントラルビル 2階<br>Tokyo, Chuo, Kyobashi 1-1-5 Central Building 2F<br><br>5th Floor, 50 Cuu Long Street, Tan Son Hoa Ward, Ho Chi Minh City, Vietnam<br><br>6th Floor, 132-136 Le Dinh Ly Street, Thanh Khe Ward, Da Nang City, Vietnam</td></tr><tr><td>Phone</td><td>(Tokyo) (+81)3-4500-6968<br>(Da Nang) (+84)78-979-6559<br>(Ho Chi Minh) (+84)90-688-9060</td></tr><tr><td>Email</td><td>info@aiot-fixing.local</td></tr><tr><td>Web</td><td>www.aiot-global.com</td></tr></tbody></table></figure>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'パートナーズ・ネットワーク', '私たちの企業は、グローバルなビジネス展開を支えるために、国内外の信頼できるパートナーシップと広範なネットワークを構築しています。これにより、より幅広いソリューションを提供し、お客様の多様なニーズに迅速に応えることが可能です。', 'publish', 'closed', 'closed', '', 'network', '', '', '2025-07-25 15:48:00', '2025-07-25 06:48:00', '', 207, 'http://localhost:8080/?page_id=219', 3, 'page', '', 0),
(238, 1, '2025-10-03 15:03:07', '2024-10-04 10:10:20', ' ', '', '', 'publish', 'closed', 'closed', '', '238', '', '', '2025-10-03 15:03:07', '2025-10-03 06:03:07', '', 0, 'http://localhost:8080/?p=238', 2, 'nav_menu_item', '', 0),
(239, 1, '2025-10-03 15:03:07', '2024-10-04 10:10:20', '', 'ニュースリリース', '', 'publish', 'closed', 'closed', '', '%e3%83%8b%e3%83%a5%e3%83%bc%e3%82%b9%e3%83%aa%e3%83%aa%e3%83%bc%e3%82%b9', '', '', '2025-10-03 15:03:07', '2025-10-03 06:03:07', '', 0, 'http://localhost:8080/?p=239', 9, 'nav_menu_item', '', 0),
(240, 1, '2025-08-20 16:24:24', '2024-10-04 10:20:30', ' ', '', '', 'publish', 'closed', 'closed', '', '240', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 0, 'http://localhost:8080/?p=240', 1, 'nav_menu_item', '', 0),
(241, 1, '2025-08-20 16:24:24', '2024-10-04 10:20:30', ' ', '', '', 'publish', 'closed', 'closed', '', '241', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 0, 'http://localhost:8080/?p=241', 2, 'nav_menu_item', '', 0),
(242, 1, '2025-08-20 16:24:24', '2024-10-04 10:20:30', ' ', '', '', 'publish', 'closed', 'closed', '', '242', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 207, 'http://localhost:8080/?p=242', 3, 'nav_menu_item', '', 0),
(243, 1, '2025-08-20 16:24:24', '2024-10-04 10:20:30', ' ', '', '', 'publish', 'closed', 'closed', '', '243', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 207, 'http://localhost:8080/?p=243', 4, 'nav_menu_item', '', 0),
(244, 1, '2025-08-20 16:24:24', '2024-10-04 10:20:30', ' ', '', '', 'publish', 'closed', 'closed', '', '244', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 207, 'http://localhost:8080/?p=244', 5, 'nav_menu_item', '', 0),
(245, 1, '2025-08-20 16:24:24', '2024-10-04 10:20:30', ' ', '', '', 'publish', 'closed', 'closed', '', '245', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 207, 'http://localhost:8080/?p=245', 6, 'nav_menu_item', '', 0),
(246, 1, '2025-08-20 16:24:24', '2024-10-04 10:20:30', ' ', '', '', 'publish', 'closed', 'closed', '', '246', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 207, 'http://localhost:8080/?p=246', 7, 'nav_menu_item', '', 0),
(247, 1, '2025-08-20 16:24:24', '2024-10-04 10:20:30', '', 'ニュースリリース', '', 'publish', 'closed', 'closed', '', '%e3%83%8b%e3%83%a5%e3%83%bc%e3%82%b9%e3%83%aa%e3%83%aa%e3%83%bc%e3%82%b9-2', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 0, 'http://localhost:8080/?p=247', 13, 'nav_menu_item', '', 0),
(248, 1, '2025-08-20 16:24:24', '2024-10-04 10:20:30', '', 'お問い合わせ', '', 'publish', 'closed', 'closed', '', '%e3%81%8a%e5%95%8f%e3%81%84%e5%90%88%e3%82%8f%e3%81%9b', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 0, 'http://localhost:8080/?p=248', 15, 'nav_menu_item', '', 0),
(283, 1, '2024-10-04 23:22:06', '2024-10-04 14:22:06', '', 'Business', '', 'publish', 'closed', 'closed', '', 'business', '', '', '2024-10-04 23:22:07', '2024-10-04 14:22:07', '', 0, 'http://localhost:8080/?page_id=283', 0, 'page', '', 0),
(284, 1, '2024-10-04 23:21:56', '2024-10-04 14:21:56', '', 'aiot-feature-image(3)', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image3-2', '', '', '2024-10-04 23:21:56', '2024-10-04 14:21:56', '', 283, 'http://localhost:8080/wp-content/uploads/2024/10/202410041421-aiot-feature-image3.jpg', 0, 'attachment', 'image/jpeg', 0),
(286, 1, '2024-10-04 23:23:59', '2024-10-04 14:23:59', '<!-- wp:paragraph -->\n<p>AIoT Inc. provides end-to-end support for planning, development, design, maintenance, and management, leveraging cutting-edge technologies such as AI and IoT to meet our clients\' business needs. We are dedicated to solving technical challenges and driving the growth of our clients\' businesses.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Our mission is to deliver flexible and effective solutions tailored to our clients\' challenges and industry-specific needs. Rather than simply introducing technology, we work closely with clients from the initial stages of a project to propose optimal strategies and technical approaches that align with their goals. This approach minimizes risks and ensures the efficient and effective implementation of systems.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We place particular emphasis on post-implementation operational support, providing continuous maintenance and care to ensure our clients can confidently utilize the systems. This long-term commitment allows us to adapt to changing business environments and help our clients evolve over time.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We value growth alongside our clients and prioritize building long-term trust. By leveraging advanced technologies, we aim to deliver valuable services that contribute to a sustainable future.</p>\n<!-- /wp:paragraph -->', 'DX System Development', 'We provide comprehensive services from planning, development, and design to maintenance and management using cutting-edge technologies such as AI and IoT, tailored to our clients’ business needs. We solve technical challenges and support business growth.', 'publish', 'closed', 'closed', '', 'dx-system-development', '', '', '2024-12-06 12:03:06', '2024-12-06 03:03:06', '', 283, 'http://localhost:8080/?page_id=286', 1, 'page', '', 0),
(287, 1, '2024-10-04 23:23:42', '2024-10-04 14:23:42', '', 'aiot-feature-image(4)', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image4', '', '', '2024-10-04 23:23:42', '2024-10-04 14:23:42', '', 286, 'http://localhost:8080/wp-content/uploads/2024/10/202410041423-aiot-feature-image4.jpg', 0, 'attachment', 'image/jpeg', 0),
(289, 1, '2024-10-04 23:25:32', '2024-10-04 14:25:32', '', '事業紹介', '', 'publish', 'closed', 'closed', '', 'business', '', '', '2024-10-04 23:25:33', '2024-10-04 14:25:33', '', 0, 'http://localhost:8080/?page_id=289', 0, 'page', '', 0),
(291, 1, '2024-10-04 23:26:47', '2024-10-04 14:26:47', '<!-- wp:paragraph -->\n<p>AIoT株式会社はお客様のビジネスニーズに応じて、AIやIoTなどの最先端技術を活用した企画、開発、設計から保守・管理までのすべての工程を一貫してサポートします。私たちは、技術的な課題を解決し、お客様の事業成長を支援することに専念しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>お客様が抱える課題や業界特有のニーズに対して、柔軟かつ効果的なソリューションを提供することを使命としています。単に技術を導入するだけでなく、プロジェクトの初期段階からお客様と密に連携を図りながらゴールに最適な戦略と技術的なアプローチプランをご提案します。これによりあらゆるリスクを最小限に抑え、効率的かつ効果的なシステムの導入をご支援します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>またシステム導入後の運用サポートには特に注力しており、納品後もお客様に安心してシステムを活用していただけるよう継続的な保守・メンテナンスを実施します。この長期的なサポートにより、お客様のビジネスが変化する環境にも柔軟に対応し、常に進化し続けることを支援することが可能となります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>私たちは、お客様と共に成長し、長期的な信頼関係を築くことを大切にしています。最先端技術を駆使し、持続可能な未来を築くことを目指して、価値あるサービスを提供し続けます。</p>\n<!-- /wp:paragraph -->', 'DXシステム開発関連事業', 'お客様のビジネスニーズに応じて、AI・ IoTなど最先端の技術での企画、開発、設計から保守・管理までを一貫して提供します。技術的な課題を解決し、ビジネスの成長をサポートします。', 'publish', 'closed', 'closed', '', 'dx-system-development', '', '', '2024-12-04 12:32:15', '2024-12-04 03:32:15', '', 289, 'http://localhost:8080/?page_id=291', 1, 'page', '', 0),
(293, 1, '2024-10-04 23:28:06', '2024-10-04 14:28:06', '<!-- wp:paragraph -->\n<p>AIoT Inc. provides outsourcing services for data entry and administrative tasks using computer systems. As businesses become more diversified and operations more complex, efficiently and accurately handling these tasks has become a critical challenge for companies.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Our BPO support services leverage the latest technologies to ensure accurate data management and efficient processing. This significantly reduces your business workload and maximizes productivity. By utilizing automated and standardized information processing systems, we minimize data entry errors and delays, providing highly reliable data processing services.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Additionally, we offer flexible solutions tailored to your business workflow. This allows for efficient data management, regardless of industry-specific characteristics, enabling your business to focus on core operations.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Our BPO support services go beyond simple outsourcing of tasks; we build partnerships that maximize your business growth. By delivering fast and high-quality data entry and administrative services, we support the smooth operation of your business and contribute to enhancing your company\'s competitive edge.</p>\n<!-- /wp:paragraph -->', 'BPO (Business Process Outsourcing) Support', 'We offer outsourcing services for data entry and administrative processing using advanced computer systems. By ensuring efficient and accurate data management, we help reduce operational burdens and enhance productivity.', 'publish', 'closed', 'closed', '', 'bpo-services', '', '', '2024-12-06 12:04:48', '2024-12-06 03:04:48', '', 283, 'http://localhost:8080/?page_id=293', 2, 'page', '', 0),
(294, 1, '2024-10-04 23:27:46', '2024-10-04 14:27:46', '', 'aiot-feature-image(5)', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image5', '', '', '2024-10-04 23:27:46', '2024-10-04 14:27:46', '', 293, 'http://localhost:8080/wp-content/uploads/2024/10/202410041427-aiot-feature-image5.jpg', 0, 'attachment', 'image/jpeg', 0),
(296, 1, '2024-10-04 23:29:04', '2024-10-04 14:29:04', '<!-- wp:paragraph -->\n<p>AIoT株式会社はコンピュータシステムを活用したデータ入力業務や事務処理業務のアウトソーシングサービスを提供しています。ビジネスの多様化や業務の複雑化が進む中、これらの業務を効率的かつ正確に行うことは、企業様にとって重要な課題となっています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>私たちのBPO支援サービスでは、最新のテクノロジー技術を駆使しているためデータの正確な管理と効率的な処理を可能としています。このため、お客様の業務負担を大幅に軽減し、生産性向上に最大限寄与することができます。システムによって業務の自動化や標準化されている最新の情報処理プロセスにより、データの入力ミスや遅延を最小限に抑え、信頼性の高いデータ処理を提供しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>さらに、私たちはお客様の業務フローに柔軟に対応し、必要に応じてカスタマイズされたソリューションをご提案します。これにより、業界の特性に縛られることなく効率的なデータ管理を行うことが可能となり、お客様がビジネスのコア業務に集中できる環境を提供します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>私たちのBPO支援サービスは、単なる”作業”の外部委託ではなく、パートナーシップの構築によってお客様の事業成長を最大限支援することができます。迅速かつ高品質なデータ入力・事務処理サービスの提供により、お客様のビジネスのスムーズな運営を支援し、企業の競争力向上に貢献します。</p>\n<!-- /wp:paragraph -->', 'BPO支援事業', 'コンピュータシステムを駆使したデータ入力業務や事務処理業務のアウトソーシングを承ります。効率的で正確なデータ管理により、業務の負担を軽減し、生産性を向上させます。', 'publish', 'closed', 'closed', '', 'bpo-services', '', '', '2024-12-04 12:35:34', '2024-12-04 03:35:34', '', 289, 'http://localhost:8080/?page_id=296', 2, 'page', '', 0),
(298, 1, '2024-10-04 23:30:38', '2024-10-04 14:30:38', '<!-- wp:paragraph -->\n<p>AIoT Inc. provides comprehensive support aimed at maximizing corporate value through the development of growth strategies, innovation projects, and M&amp;A (mergers and acquisitions) assistance. In the face of rapid business changes and increasing global market competition, formulating the right strategy is crucial for companies to achieve sustainable growth.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We build growth strategies tailored to our clients\' unique needs and propose concrete plans to establish a competitive advantage in the market. We support innovation projects aimed at expanding into new markets, growing existing businesses, and improving operational efficiency, accelerating the growth of our clients\' operations.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Leveraging our extensive experience in M&amp;A, we provide end-to-end support for mergers and acquisitions. We assist with market research, due diligence, and deal negotiations, ensuring companies make optimal decisions. Furthermore, we offer expertise in cross-border transactions, using our deep knowledge of different countries and cultures to ensure smooth and successful deals.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>At AIoT Inc., our mission goes beyond simply providing strategic recommendations; we are committed to offering comprehensive support that helps businesses grow long-term and maximize their corporate value. We promise to help our clients\' businesses develop steadily and build a solid foundation for the future through our guidance.</p>\n<!-- /wp:paragraph -->', 'Business Strategy Consulting &amp; M&amp;A Support', 'We assist in the formulation of corporate growth strategies, innovation projects, and provide support for M&A (mergers and acquisitions). We offer comprehensive solutions to maximize corporate value.', 'publish', 'closed', 'closed', '', 'corporate-strategy-and-ma-support', '', '', '2024-12-06 12:08:02', '2024-12-06 03:08:02', '', 283, 'http://localhost:8080/?page_id=298', 3, 'page', '', 0),
(299, 1, '2024-10-04 23:30:10', '2024-10-04 14:30:10', '', 'aiot-feature-image(6)', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image6', '', '', '2024-10-04 23:30:10', '2024-10-04 14:30:10', '', 298, 'http://localhost:8080/wp-content/uploads/2024/10/202410041430-aiot-feature-image6.jpg', 0, 'attachment', 'image/jpeg', 0),
(301, 1, '2024-10-04 23:32:04', '2024-10-04 14:32:04', '<!-- wp:paragraph -->\n<p>AIoT株式会社は企業の成長戦略、革新プロジェクトの立案、及びM&amp;A（合併・買収）の支援を通じて、企業価値の最大化を目指した包括的なサポートを提供しています。ビジネスの急速な変化やグローバル市場での競争が激化する中、企業が持続的な成長を遂げるためには適切な戦略の策定が不可欠です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>私たちはお客様の独自のニーズに基づいた成長戦略を構築し、市場における競争優位性を確立するための具体的な計画を提案します。新しい市場への進出や既存ビジネスの拡大、業務効率の向上を目指した革新プロジェクトをサポートし、お客様の事業の成長を加速させます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>また、M&amp;Aに関する豊富な経験を活かし、企業合併や買収の全プロセスを包括的にサポートします。市場調査やデューデリジェンス、取引交渉のサポートを行い、企業が最適な意思決定を行えるよう支援します。さらに、クロスボーダー取引にも対応し、異なる国や文化に精通した専門知識を駆使してスムーズな取引を実現します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>AIoT株式会社の目指すところは単なる戦略提案にとどまらず、企業が長期的に成長し企業価値を最大限に引き出すための包括的な支援です。お客様の事業が私たちの支援により確実に発展し、未来に向けた強固な基盤を築いていただけることをお約束します。</p>\n<!-- /wp:paragraph -->', '経営戦略コンサルティング・M&amp;A支援事業', '企業の成長戦略、革新プロジェクトの立案、及びM&A（合併・買収）の支援を行います。企業価値の最大化に向けた包括的なサポートを提供します。', 'publish', 'closed', 'closed', '', 'corporate-strategy-and-ma-support', '', '', '2024-12-04 13:42:30', '2024-12-04 04:42:30', '', 289, 'http://localhost:8080/?page_id=301', 3, 'page', '', 0),
(303, 1, '2024-10-04 23:33:32', '2024-10-04 14:33:32', '<!-- wp:paragraph -->\n<p>AIoT Inc. offers expert consulting and strategic planning for businesses seeking to invest in Vietnam. In recent years, Vietnam has become a highly attractive investment destination, with significant economic growth and an expanding market. Our goal is to collaborate with clients to develop effective approaches for entering this growing market and ensure that your business thrives in the future.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>First, we conduct a detailed analysis of the market trends, laws, and regulations in Vietnam, assessing the risks and benefits for your business. Based on this information, we design an investment strategy that aligns with your business model and the industry you wish to enter, offering support for creating a tailored market entry plan. For companies seeking to expand into Vietnam, we provide comprehensive support, leveraging our knowledge and experience of the local business environment and potential partnerships.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Our consulting services extend beyond just strategy proposals; we also focus on the implementation phase in the local market. From setting up and managing local subsidiaries to providing ongoing support for business operations, we ensure that your Vietnam market entry is smooth and successful. Additionally, we offer advice on cross-cultural communication to facilitate business interactions and ensure that your entry into the Vietnamese market is seamless.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>AIoT Inc. is committed to being a long-term partner in helping your business succeed in the Vietnamese market and grow post-entry. By adopting a strategic approach alongside our clients, we maximize new business opportunities, improve competitiveness, and ensure sustainable growth.</p>\n<!-- /wp:paragraph -->', 'Support for Vietnam expansion', 'We provide consulting and strategy development for businesses looking to invest in Vietnam for growth and expansion. Together with our clients, we propose the optimal approach for their business future.', 'publish', 'closed', 'closed', '', 'vietnam-expansion-support', '', '', '2024-12-06 12:10:24', '2024-12-06 03:10:24', '', 283, 'http://localhost:8080/?page_id=303', 4, 'page', '', 0),
(304, 1, '2024-10-04 23:33:17', '2024-10-04 14:33:17', '', 'aiot-feature-image(7)', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image7', '', '', '2024-10-04 23:33:17', '2024-10-04 14:33:17', '', 303, 'http://localhost:8080/wp-content/uploads/2024/10/202410041433-aiot-feature-image7.jpg', 0, 'attachment', 'image/jpeg', 0),
(306, 1, '2024-10-04 23:34:32', '2024-10-04 14:34:32', '<!-- wp:paragraph -->\n<p>AIoT株式会社は、企業の成長と発展を促進するためにベトナムへの投資戦略の立案や投資に関するコンサルティングを提供しています。近年、ベトナムは経済発展と市場の拡大が著しく、魅力的な投資先として多くの企業から注目されています。私たちはこうした成長市場への効果的なアプローチを通じて、お客様のビジネスの未来を共に考え、最適な戦略を提案します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>まず、ベトナムの市場動向や法律、規制などの情報を基にリスクとベネフィットを詳細に分析します。その上でお客様のビジネスモデルや参入する業界に最も適した投資戦略を立案し、具体的な進出プランをサポートします。新規参入を目指す企業様には現地のビジネス環境やパートナーシップの可能性についての知識と経験を活かした包括的なサポートを提供します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>さらに、私たちのコンサルティングは単なる戦略提案にとどまらず、現地での実行フェーズにも力を入れています。ベトナム市場でのビジネス展開を支援し、現地法人の設立から運営、管理までの一貫したサポートを行います。また、異文化間のビジネスコミュニケーションを円滑に進めるためのアドバイスも提供し、ベトナム進出成功を確実なものにしていただけます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>AIoT株式会社は、お客様がベトナム市場で成功を収め、進出後の成長に貢献できるパートナーとして継続的にサポートしてまいります。お客様と共に未来を見据えた戦略的なアプローチで、新たなビジネスチャンスを最大限に活かし、競争力を高めるお手伝いをします。</p>\n<!-- /wp:paragraph -->', 'ベトナム進出支援事業', '企業の成長と発展に向けたベトナムへ投資戦略の立案や、投資に関するコンサルティングを提供しています。お客様のビジネスの未来を共に考え、最適なアプローチを提案します。', 'publish', 'closed', 'closed', '', 'vietnam-expansion-support', '', '', '2024-12-05 19:04:21', '2024-12-05 10:04:21', '', 289, 'http://localhost:8080/?page_id=306', 4, 'page', '', 0),
(308, 1, '2024-10-05 23:02:07', '2024-10-04 14:35:40', ' ', '', '', 'publish', 'closed', 'closed', '', '308', '', '', '2024-10-05 23:02:07', '2024-10-05 14:02:07', '', 0, 'http://localhost:8080/?p=308', 3, 'nav_menu_item', '', 0),
(309, 1, '2024-10-05 22:38:49', '2024-10-04 14:36:20', ' ', '', '', 'publish', 'closed', 'closed', '', '309', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 0, 'http://localhost:8080/?p=309', 10, 'nav_menu_item', '', 0),
(310, 1, '2024-10-05 22:38:49', '2024-10-04 14:36:20', ' ', '', '', 'publish', 'closed', 'closed', '', '310', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 283, 'http://localhost:8080/?p=310', 11, 'nav_menu_item', '', 0),
(311, 1, '2024-10-05 22:38:49', '2024-10-04 14:36:20', ' ', '', '', 'publish', 'closed', 'closed', '', '311', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 283, 'http://localhost:8080/?p=311', 12, 'nav_menu_item', '', 0),
(312, 1, '2024-10-05 22:38:49', '2024-10-04 14:36:20', ' ', '', '', 'publish', 'closed', 'closed', '', '312', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 283, 'http://localhost:8080/?p=312', 13, 'nav_menu_item', '', 0),
(313, 1, '2024-10-05 22:38:49', '2024-10-04 14:36:20', ' ', '', '', 'publish', 'closed', 'closed', '', '313', '', '', '2024-10-05 22:38:49', '2024-10-05 13:38:49', '', 283, 'http://localhost:8080/?p=313', 14, 'nav_menu_item', '', 0),
(314, 1, '2025-08-20 16:24:24', '2024-10-04 14:37:02', ' ', '', '', 'publish', 'closed', 'closed', '', '314', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 0, 'http://localhost:8080/?p=314', 8, 'nav_menu_item', '', 0),
(315, 1, '2025-08-20 16:24:24', '2024-10-04 14:37:02', ' ', '', '', 'publish', 'closed', 'closed', '', '315', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 289, 'http://localhost:8080/?p=315', 9, 'nav_menu_item', '', 0),
(316, 1, '2025-08-20 16:24:24', '2024-10-04 14:37:02', ' ', '', '', 'publish', 'closed', 'closed', '', '316', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 289, 'http://localhost:8080/?p=316', 10, 'nav_menu_item', '', 0),
(317, 1, '2025-08-20 16:24:24', '2024-10-04 14:37:02', ' ', '', '', 'publish', 'closed', 'closed', '', '317', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 289, 'http://localhost:8080/?p=317', 11, 'nav_menu_item', '', 0),
(318, 1, '2025-08-20 16:24:24', '2024-10-04 14:37:02', ' ', '', '', 'publish', 'closed', 'closed', '', '318', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 289, 'http://localhost:8080/?p=318', 12, 'nav_menu_item', '', 0),
(319, 1, '2025-10-03 15:03:07', '2024-10-04 14:37:16', ' ', '', '', 'publish', 'closed', 'closed', '', '319', '', '', '2025-10-03 15:03:07', '2025-10-03 06:03:07', '', 0, 'http://localhost:8080/?p=319', 3, 'nav_menu_item', '', 0),
(320, 1, '2024-10-04 23:40:05', '2024-10-04 14:40:05', '<!-- wp:carbon-fields/block-contact {\"data\":{\"contact_spt\":\"\",\"contact_guide\":\"\\u003cbutton class=\\u0022contact-guide button\\u0022\\u003eHướng dẫn nhập\\u003c/button\\u003e\",\"contact_title\":\"\",\"contact_desc\":\"AIoT株式会社へのご相談やお見積もりなど下記フォームをご利用いただき、お気軽にお問合せくださいませ。\\n担当者より追ってご連絡させていただきます。\\n※内容によりお返事に日数を要する場合もございます。ご理解のほどお願い申し上げます。\",\"google_map\":\"\\u003ciframe src=\\u0022https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3240.9090375065953!2d139.77096899999998!3d35.6792417!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x60188bfd2fdaaaab%3A0xca3ad0245cfb8e73!2sCentral%20Building!5e0!3m2!1svi!2s!4v1727683004005!5m2!1svi!2s\\u0022 width=\\u0022100%\\u0022 height=\\u0022100%\\u0022 style=\\u0022border:0;\\u0022 allowfullscreen=\\u0022\\u0022 loading=\\u0022lazy\\u0022 referrerpolicy=\\u0022no-referrer-when-downgrade\\u0022\\u003e\\u003c/iframe\\u003e\",\"contact_method_spt\":\"Other contact methods\",\"contact_method\":[]}} /-->', 'お問合せ', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2024-12-04 13:43:58', '2024-12-04 04:43:58', '', 0, 'http://localhost:8080/?page_id=320', 0, 'page', '', 0),
(357, 1, '2024-10-05 22:36:26', '2024-10-05 13:36:26', '<!-- wp:paragraph -->\n<p>国家イノベーションセンター（NIC）は、Innovate Vietnam 2024の盛大な祝典とともに5周年を迎えます。この記念すべきイベントは、計画投資省（MPI）が主催し、NICとVCCorpが共催するもので、2024年10月1日から2日にかけて、ハノイのHoa LacハイテクパークにあるNICキャンパスで開催されます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>未来へのビジョン</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Innovate Vietnam 2024は、ベトナムのイノベーションの未来を点火することを目指しています。「志 - 先駆 - 突破」というテーマのもと、過去5年間にわたるNICの驚異的な変革と、ベトナムのイノベーションエコシステムの発展における重要な役割を強調します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>著名なゲストと基調講演者</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>イベントには、ファム・ミン・チン首相をはじめ、各省庁、政府機関、研究機関、大学、企業、銀行、投資ファンド、国際機関の主要リーダーが出席します。彼らの参加は、ベトナムの活気に満ちたダイナミックなイノベーション環境を育むためのNICの貢献の重要性を強調しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Innovate Vietnam 2024のハイライト</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>基調講演</strong>：イノベーションと技術分野の著名な人物による洞察に満ちた講演。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>パネルディスカッション</strong>：イノベーションの未来、技術トレンド、投資機会についての活発な対話。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>展示会</strong>：主要企業やスタートアップによる最先端技術と革新的なソリューションの展示。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>ネットワーキングの機会</strong>：イノベーター、投資家、業界リーダー間のつながりを促進。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p><strong>AIOT CEOの参加</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>イベントの注目すべきハイライトの一つは、AIOT CEOの参加です。彼は、イノベーションを推進するAIとIoT技術の統合についての洞察を共有します。彼の参加は、これらの技術がさまざまな産業の未来を形作る上での重要性を示しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>NICの歩みと成果</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>過去5年間で、NICはベトナムのイノベーションエコシステムの礎として台頭してきました。そのイニシアチブと協力を通じて、NICはイノベーションの文化を育み、スタートアップを支援し、最先端技術の開発を促進してきました。Innovate Vietnam 2024は、画期的な突破口を開拓し、明るい未来への志を鼓舞するというNICのコミットメントを証明するものです。</p>\n<!-- /wp:paragraph -->', 'イノベーションの祝典：NICの5周年記念とInnovate Vietnam 2024', '', 'publish', 'closed', 'closed', '', 'nic-innovate-vietnam-2024', '', '', '2025-07-23 21:58:40', '2025-07-23 12:58:40', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=357', 0, 'blog', '', 0),
(358, 1, '2024-10-05 22:38:48', '2024-10-05 13:38:48', ' ', '', '', 'publish', 'closed', 'closed', '', '358', '', '', '2024-10-05 22:38:48', '2024-10-05 13:38:48', '', 0, 'http://localhost:8080/?p=358', 3, 'nav_menu_item', '', 0),
(359, 1, '2025-08-20 16:24:24', '2024-10-05 13:39:14', ' ', '', '', 'publish', 'closed', 'closed', '', '359', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 0, 'http://localhost:8080/?p=359', 14, 'nav_menu_item', '', 0),
(364, 1, '2024-10-05 22:51:17', '2024-10-05 13:51:17', '', 'launching-innovate-vietnam-2024-a-hub-for-the-innovation-ecosystem-20241001113125', '', 'inherit', 'open', 'closed', '', 'launching-innovate-vietnam-2024-a-hub-for-the-innovation-ecosystem-20241001113125', '', '', '2024-10-05 22:51:17', '2024-10-05 13:51:17', '', 0, 'http://localhost:8080/wp-content/uploads/2024/10/202410051351-launching-innovate-vietnam-2024-a-hub-for-the-innovation-ecosystem-20241001113125.jpg', 0, 'attachment', 'image/jpeg', 0),
(375, 1, '2024-10-06 11:58:16', '2024-10-06 02:58:16', '', 'Banner - Video(1)', '', 'inherit', 'open', 'closed', '', 'banner-video1', '', '', '2024-10-06 11:58:16', '2024-10-06 02:58:16', '', 8, 'http://localhost:8080/wp-content/uploads/2024/10/202410060258-Banner-Video1.jpg', 0, 'attachment', 'image/jpeg', 0),
(377, 1, '2024-10-06 12:00:52', '2024-10-06 03:00:52', '', 'Banner - Video(2)', '', 'inherit', 'open', 'closed', '', 'banner-video2', '', '', '2024-10-06 12:00:52', '2024-10-06 03:00:52', '', 8, 'http://localhost:8080/wp-content/uploads/2024/10/202410060300-Banner-Video2.jpg', 0, 'attachment', 'image/jpeg', 0),
(379, 1, '2024-10-06 12:17:12', '2024-10-06 03:17:12', '', 'aiot-feature-image(8)', '', 'inherit', 'open', 'closed', '', 'aiot-feature-image8', '', '', '2024-10-06 12:17:12', '2024-10-06 03:17:12', '', 8, 'http://localhost:8080/wp-content/uploads/2024/10/202410060317-aiot-feature-image8.jpg', 0, 'attachment', 'image/jpeg', 0),
(387, 1, '2024-10-08 14:58:44', '2024-10-08 05:58:44', '', 'aiot-tech-stack', '', 'inherit', 'open', 'closed', '', 'aiot-tech-stack', '', '', '2024-10-08 14:58:44', '2024-10-08 05:58:44', '', 20, 'http://localhost:8080/wp-content/uploads/2024/10/202410080558-aiot-tech-stack.jpg', 0, 'attachment', 'image/jpeg', 0),
(418, 1, '2024-10-11 22:30:35', '2024-10-11 13:30:35', '', 'AIOT-Banner-White', '', 'inherit', 'open', 'closed', '', 'aiot-banner-white', '', '', '2024-10-11 22:30:35', '2024-10-11 13:30:35', '', 0, 'http://localhost:8080/wp-content/uploads/2024/10/202410111330-AIOT-Banner-White.mp4', 0, 'attachment', 'video/mp4', 0),
(420, 1, '2024-10-11 22:58:50', '2024-10-11 13:58:50', '', 'Banner - Video(3)', '', 'inherit', 'open', 'closed', '', 'banner-video3', '', '', '2024-10-11 22:58:50', '2024-10-11 13:58:50', '', 20, 'http://localhost:8080/wp-content/uploads/2024/10/202410111358-Banner-Video3.jpg', 0, 'attachment', 'image/jpeg', 0),
(422, 1, '2024-10-11 23:08:21', '2024-10-11 14:08:21', '', 'Banner - Video(4)', '', 'inherit', 'open', 'closed', '', 'banner-video4', '', '', '2024-10-11 23:08:21', '2024-10-11 14:08:21', '', 20, 'http://localhost:8080/wp-content/uploads/2024/10/202410111408-Banner-Video4.jpg', 0, 'attachment', 'image/jpeg', 0),
(424, 1, '2024-10-12 18:28:58', '2024-10-12 09:28:58', '', 'mask', '', 'inherit', 'open', 'closed', '', 'mask', '', '', '2024-10-12 18:28:58', '2024-10-12 09:28:58', '', 0, 'http://localhost:8080/wp-content/uploads/2024/10/202410120928-mask.png', 0, 'attachment', 'image/png', 0),
(440, 2, '2024-10-17 15:35:19', '2024-10-17 06:35:19', '<!-- wp:paragraph -->\n<p>Recently, in celebration of Vietnam Entrepreneurs\' Day and Hanoi University of Science and Technology’s anniversary, AIoT was honored to participate and co-host the event \"STARTUP IN TECH – Tech Startups\". This was a valuable opportunity to share real-world experiences from leading tech CEOs, offering fresh perspectives to the startup community.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>🎤 At the event, AIoT’s CEO – Mr. Nguyen Manh Hung shared heartfelt insights about his entrepreneurial journey in digital transformation and technology. With his extensive experience, he inspired many with strategies on how to discover niche markets, build distinctive businesses, and thrive in a competitive environment.<br><br>💡 Key takeaways from the discussion: <br>✔️ How to overcome challenges when starting up in the tech industry <br>✔️ The role of AI and IoT technology in digital transformation <br>✔️ Creating differentiation in business models in a crowded market <br>✔️ The importance of building a dedicated team for long-term growth</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>📘 The event delivered valuable knowledge and strong inspiration to young tech enthusiasts and aspiring entrepreneurs. AIoT is proud to have contributed by sharing insights and promoting tech solutions in the digital era, helping businesses and organizations optimize processes and enhance efficiency.<br><br>🎯 About AIoT: AIoT is a pioneer in digital transformation, applying AI and IoT technology to business solutions. We are committed to delivering innovative solutions, helping businesses fully harness the power of technology in an optimal and sustainable way.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>✨ Contact AIoT now to explore advanced tech solutions and join us on the journey of growing your business!<br></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":445} -->\n<figure class=\"wp-block-image\"><img src=\"http://localhost:8080/wp-content/uploads/2024/10/202410170640-4624576345377638623416678100198556909098138n.jpg\" alt=\"\" class=\"wp-image-445\"/></figure>\n<!-- /wp:image -->', '🌟 The \"STARTUP IN TECH – The Journey of Tech Startups\" Webinar was a Great Success! 🌟', '', 'publish', 'closed', 'closed', '', '__trashed', '', '', '2024-10-17 18:05:40', '2024-10-17 09:05:40', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=440', 0, 'blog', '', 0),
(445, 2, '2024-10-17 15:40:26', '2024-10-17 06:40:26', '', '462457634_537763862341667_8100198556909098138_n', '', 'inherit', 'open', 'closed', '', '462457634_537763862341667_8100198556909098138_n', '', '', '2024-10-17 15:40:26', '2024-10-17 06:40:26', '', 440, 'http://localhost:8080/wp-content/uploads/2024/10/202410170640-4624576345377638623416678100198556909098138n.jpg', 0, 'attachment', 'image/jpeg', 0),
(450, 2, '2024-10-17 18:06:09', '2024-10-17 09:06:09', '<!-- wp:paragraph -->\n<p>先日、ベトナム企業家の日およびハノイ工科大学の創立記念日に際し、AIoTはイベント「STARTUP IN TECH – テクノロジー起業」の共催者として参加させていただきました。このイベントは、トップテクノロジーCEOから実践的な経験を共有し、スタートアップコミュニティに新たな視点を提供する貴重な機会となりました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>イベントでは、AIoTのCEOであるグエン・マイン・フン氏が、デジタル変革およびテクノロジー分野における起業の旅について情熱的な話をしました。彼の豊富な経験に基づき、ニッチ市場を見つける方法や、競争の激しい環境で独自のビジネスを構築し成功するためのインスピレーションを多くの人々に与えました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>主な議論内容：<br>✔️ テクノロジー分野で起業する際の課題をどう克服するか<br>✔️ デジタル変革におけるAIやIoT技術の役割<br>✔️ 混雑した市場の中でビジネスモデルに差別化をもたらす方法<br>✔️ 長期的な成長を目指すチームの構築の重要性</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>このイベントは、テクノロジーや起業に情熱を持つ若者にとって価値ある知識と強いインスピレーションを提供しました。AIoTは、デジタル時代におけるテクノロジーソリューションの共有と促進に貢献できたことを誇りに思います。企業や組織がプロセスを最適化し、業務の効率を向上させるために、私たちの技術ソリューションが役立つことを願っています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>AIoTについて：AIoTは、AIやIoT技術をビジネスソリューションに適用するデジタル変革のパイオニアです。私たちは、企業がテクノロジーの潜在能力を最適かつ持続可能な形で活用できるよう、革新的なソリューションを提供することに尽力しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>ぜひAIoTにご連絡いただき、最新の技術ソリューションを探求し、私たちとともにビジネスの成長の旅にご参加ください！</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":445,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2024/10/202410170640-4624576345377638623416678100198556909098138n.jpg\" alt=\"\" class=\"wp-image-445\"/></figure>\n<!-- /wp:image -->', 'ウェビナー「STARTUP IN TECH – テクノロジー起業の旅」が大成功で開催されました！', '', 'publish', 'closed', 'closed', '', 'the-webinar-startup-in-tech-a-journey-into-tech-entrepreneurship-was-successfully-held', '', '', '2025-07-28 18:57:16', '2025-07-28 09:57:16', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=450', 0, 'blog', '', 0),
(451, 2, '2024-10-17 17:14:32', '2024-10-17 08:14:32', '', 'z5939313079336_31eef6f60c9178e2e6a013b6fe3035b5', '', 'inherit', 'open', 'closed', '', 'z5939313079336_31eef6f60c9178e2e6a013b6fe3035b5', '', '', '2024-10-17 17:14:32', '2024-10-17 08:14:32', '', 450, 'http://localhost:8080/wp-content/uploads/2024/10/202410170814-z593931307933631eef6f60c9178e2e6a013b6fe3035b5.jpg', 0, 'attachment', 'image/jpeg', 0),
(453, 2, '2024-11-08 13:15:06', '2024-11-08 04:15:06', '<!-- wp:paragraph -->\n<p id=\"81e7cc8d-83a8-4e34-8347-ccd9020ef863\">私たちの使命は、持続可能な発展と生活の質の向上という核心的な価値を追求する道のりの中で、「つながり」を重視しています。それは、人と人、アイデア、そして無限の可能性を結びつけることです。今回、ハノイ Bach Khoa 大学に戻れることは、特別な機会であるだけでなく、この目標を実現するための次の一歩でもあります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"66af7b00-7503-41ac-9230-f9d3f98b6801\">この機会に恵まれ、私たちは二つの名門大学と、大学から生まれた二つのスピンオフ企業を結びつけることができることを誇りに思っています。毎日の協力は喜びであり、社会に具体的な解決策を提供するための新たな一歩です。日常生活や都市での水の汚染問題がますます深刻になる中、私たちが取り組んでいる分野は、最先端技術を実社会に適用し、問題解決に取り組むことに焦点を当てています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"94b8dac7-a1bd-4067-a49d-b1d7d23f567e\">今回の訪問により、共同研究や市場開発の機会が広がり、先進技術を生活用水の浄化に効果的に応用し、地域社会に具体的な利益をもたらすことが期待されています。ただし、協力の物語は、大学自身によって語られるべきものです。私たちにとって重要なのは、つながりの使命を果たすことであり、研究と実践、理想と解決策を結びつけ、共に持続可能な緑豊かな未来を目指すことです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":455,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2024/11/202411070312-3.png\" alt=\"\" class=\"wp-image-455\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'つながりの使命とHanoi University of Science and Technology大学への帰還', '', 'publish', 'closed', 'closed', '', 'the-mission-of-connection-and-our-return-to-hanoi-university-of-science-and-technology', '', '', '2025-07-25 17:48:15', '2025-07-25 08:48:15', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=453', 0, 'blog', '', 0),
(454, 2, '2024-11-07 12:12:13', '2024-11-07 03:12:13', '', '2', '', 'inherit', 'open', 'closed', '', '2-2', '', '', '2024-11-07 12:12:13', '2024-11-07 03:12:13', '', 453, 'http://localhost:8080/wp-content/uploads/2024/11/202411070312-2.png', 0, 'attachment', 'image/png', 0),
(455, 2, '2024-11-07 12:12:38', '2024-11-07 03:12:38', '', '3', '', 'inherit', 'open', 'closed', '', '3-3', '', '', '2024-11-07 12:12:38', '2024-11-07 03:12:38', '', 453, 'http://localhost:8080/wp-content/uploads/2024/11/202411070312-3.png', 0, 'attachment', 'image/png', 0),
(459, 2, '2024-11-08 13:22:41', '2024-11-08 04:22:41', '<!-- wp:paragraph -->\n<p>In our pursuit of sustainable development and improved quality of life, we always prioritize our mission of \"connection\"—connecting people, ideas, and possibilities. This return to Hanoi University of Science and Technology is not only a special occasion but also a significant step in realizing this mission.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We are proud to have the opportunity to connect with two renowned universities and university-born venture companies. Each collaboration brings us joy and takes us closer to providing practical solutions for society, particularly in using advanced technology to improve the quality of drinking and urban water.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>This visit opens up opportunities for research collaboration to advance water purification technology, bringing concrete benefits to the community. Although our specialty is IT, we are fully committed to this project, even if it isn’t directly related to our field, as part of our responsibility to the community. We strive to contribute to a clean, sustainable future for Vietnam.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":455,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2024/11/202411070312-3.png\" alt=\"\" class=\"wp-image-455\"/></figure>\n<!-- /wp:image -->', 'The Mission of Connection and Our Return to Hanoi University of Science and Technology', '', 'publish', 'closed', 'closed', '', 'the-mission-of-connection-and-our-return-to-hanoi-university-of-science-and-technology', '', '', '2024-11-08 13:22:41', '2024-11-08 04:22:41', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=459', 0, 'blog', '', 0),
(460, 2, '2024-11-15 11:58:58', '2024-11-15 02:58:58', '<!-- wp:paragraph -->\n<p>AIoTのディレクターであり、日越スタートアップ企業家協会 (E-Future) の副会長でもあるタケオ氏 は、ビジネスだけでなくコミュニティに持続可能な価値を提供するために尽力しています。最近、ホーチミン市で開催された「シンダイクリスタル」技術の紹介イベントにおいて、日本からの専門家をベトナムに招き、重金属や有害物質を除去できる革新的な水処理技術をベトナムの人々の生活に届けるための架け橋として活躍しました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"170235f4-845c-4d92-a278-d508aaf1e3c1\">タケオ氏は、ビジネスは利益のみを追求するべきではないと信じています。その哲学のもと、E-Futureと共に「シンダイクリスタル」プロジェクトのような非営利プロジェクトにも参加し、すべての人にとってクリーンで安全な環境を創造することを目指しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>AIoTと共に歩んできたタケオ氏の旅は、知識の共有とコミュニティへの責任を重視し、より良い未来をベトナムにもたらすための物語です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":462,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2024/11/202411120225-13.png\" alt=\"\" class=\"wp-image-462\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":463,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2024/11/202411120226-14.png\" alt=\"\" class=\"wp-image-463\"/></figure>\n<!-- /wp:image -->', 'タケオ (Nguyen Manh Hung) – コミュニティと共に歩む、持続可能でクリーンな未来を目指す道', '', 'publish', 'closed', 'closed', '', 'takeo-sustainable-clean-future', '', '', '2025-07-23 21:57:16', '2025-07-23 12:57:16', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=460', 0, 'blog', '', 0),
(461, 2, '2024-11-12 11:25:32', '2024-11-12 02:25:32', '', '12', '', 'inherit', 'open', 'closed', '', '12', '', '', '2024-11-12 11:25:32', '2024-11-12 02:25:32', '', 460, 'http://localhost:8080/wp-content/uploads/2024/11/202411120225-12.png', 0, 'attachment', 'image/png', 0),
(462, 2, '2024-11-12 11:25:53', '2024-11-12 02:25:53', '', '13', '', 'inherit', 'open', 'closed', '', '13', '', '', '2024-11-12 11:25:53', '2024-11-12 02:25:53', '', 460, 'http://localhost:8080/wp-content/uploads/2024/11/202411120225-13.png', 0, 'attachment', 'image/png', 0),
(463, 2, '2024-11-12 11:26:13', '2024-11-12 02:26:13', '', '14', '', 'inherit', 'open', 'closed', '', '14', '', '', '2024-11-12 11:26:13', '2024-11-12 02:26:13', '', 460, 'http://localhost:8080/wp-content/uploads/2024/11/202411120226-14.png', 0, 'attachment', 'image/png', 0),
(464, 2, '2024-11-15 12:17:21', '2024-11-15 03:17:21', '<!-- wp:paragraph -->\n<p>As the AIoT Director and Vice President of the Vietnam-Japan Startup Business Association (E-Future), Nguyen Manh Hung is committed not only to business but also to creating sustainable value for the community. Recently, during an event introducing the \"Shindai Crystal\" technology in Ho Chi Minh City, he facilitated connections between Japanese experts and Vietnam to bring this advanced water treatment technology – capable of removing heavy metals and harmful substances – closer to people\'s lives.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Takeo believes that business should not be solely for profit. With this philosophy, he and E-Future participate in nonprofit projects, such as the \"Shindai Crystal\" project, with the hope of contributing to a clean, safe environment for everyone.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Takeo’s journey with AIoT is a story of connecting knowledge and responsibility with the community, working toward a brighter future for Vietnam.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>4</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":465,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2024/11/202411150316-13.png\" alt=\"\" class=\"wp-image-465\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":466,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2024/11/202411150317-14.png\" alt=\"\" class=\"wp-image-466\"/></figure>\n<!-- /wp:image -->', 'Nguyen Manh Hung – A Journey Alongside the Community for a Sustainable, Clean, and Green Future', '', 'publish', 'closed', 'closed', '', 'nguyen-manh-hung-a-journey-alongside-the-community-for-a-sustainable-clean-and-green-future', '', '', '2024-11-15 12:17:21', '2024-11-15 03:17:21', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=464', 0, 'blog', '', 0),
(465, 2, '2024-11-15 12:16:47', '2024-11-15 03:16:47', '', '13', '', 'inherit', 'open', 'closed', '', '13-2', '', '', '2024-11-15 12:16:47', '2024-11-15 03:16:47', '', 464, 'http://localhost:8080/wp-content/uploads/2024/11/202411150316-13.png', 0, 'attachment', 'image/png', 0),
(466, 2, '2024-11-15 12:17:01', '2024-11-15 03:17:01', '', '14', '', 'inherit', 'open', 'closed', '', '14-2', '', '', '2024-11-15 12:17:01', '2024-11-15 03:17:01', '', 464, 'http://localhost:8080/wp-content/uploads/2024/11/202411150317-14.png', 0, 'attachment', 'image/png', 0),
(467, 2, '2025-07-23 21:58:22', '0000-00-00 00:00:00', '', 'シンダイクリスタルプロジェクトで未来のグリーンを築く', '', 'draft', 'closed', 'closed', '', '', '', '', '2025-07-23 21:58:22', '2025-07-23 12:58:22', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=467', 0, 'blog', '', 0),
(468, 2, '2025-07-23 21:58:27', '0000-00-00 00:00:00', '<!-- wp:paragraph -->\n<p>2024年11月7日、ベトナムと日本のパートナーが集まり、非営利プロジェクト「Shindai Crystal」の発表が行われました。このプロジェクトは、先進的な水処理技術を通じて、グリーンテクノロジー分野での協力を促進する重要な一歩です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Shindai Crystalは、化学薬品を使用せずに水を処理し、エネルギーを節約し、重金属を効果的に除去する技術です。この技術は、革新的な水処理解決策であり、同時に公衆の健康と環境保護にも貢献しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>この技術は、アフリカのタンザニアで成功裏に試験され、現在は東南アジア、特にベトナムでも適用が広がっています。この協力は、生活用水の質を改善し、環境への悪影響を軽減するための新たな可能性を開くことが期待されています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>E-Futureの役割とグエン・マン・フン氏の参加</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>E-Future協会は、ベトナムと日本の間での協力を促進する重要な架け橋として、グエン・マン・フン氏の積極的な参加により、両国のリソース、知恵、そして情熱が集結する場を提供しています。専門分野ではないにもかかわらず、グエン氏は常に社会貢献を重視した非営利プロジェクトを優先し、全ての人々にとって安全で清潔な緑の環境の構築を目指しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>今回のプロジェクトは、単なる技術革新にとどまらず、社会に対する強い責任感を表すものです。研究から実施に至るまで、Shindai Crystalはベトナム全土や地域で成功するモデルとなることが期待されています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>持続可能な未来のための協力</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>この会議は単なる情報交換ではなく、ベトナムと日本が共に持続可能な未来を築くための決意を示すものでした。両国の知恵とリソース、そして社会的責任の精神が一つになり、グリーンテクノロジーの発展を加速させる原動力となりました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>E-Futureとそのパートナーは、このプロジェクトに共に取り組むことを誇りに思い、地域社会に前向きな価値をもたらすことに貢献しています。Shindai Crystalプロジェクトは、単なる技術的解決策ではなく、環境と人々への責任を持った希望の象徴でもあります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>このプロジェクトの次のステップに注目し、共にクリーンで持続可能な世界を作りましょう！</strong></p>\n<!-- /wp:paragraph -->', 'Shindai Crystalプロジェクトで緑の未来を共に築こう', '', 'draft', 'closed', 'closed', '', '', '', '', '2025-07-23 21:58:27', '2025-07-23 12:58:27', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=468', 0, 'blog', '', 0),
(550, 1, '2024-12-10 13:23:45', '2024-12-10 04:23:45', '', 'john-doe', '', 'inherit', 'open', 'closed', '', 'john-doe', '', '', '2024-12-10 13:23:45', '2024-12-10 04:23:45', '', 0, 'http://localhost:8080/wp-content/uploads/2024/12/202412100423-john-doe.vcf', 0, 'attachment', 'text/vcard', 0),
(551, 1, '2025-07-24 08:50:10', '0000-00-00 00:00:00', '', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2025-07-24 08:50:10', '2025-07-23 23:50:10', '', 0, 'http://localhost:8080/?post_type=rm_content_editor&#038;p=551', 0, 'rm_content_editor', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(552, 1, '2025-01-20 15:07:16', '2025-01-20 06:07:16', '<!-- wp:paragraph -->\n<p>近年、ビジネスのグローバル化が進む中で、<strong>オフショア開発</strong>を活用する企業が増えています。オフショア開発とは、自国以外の国や地域にソフトウェア開発やIT関連の業務を委託することを指します。特に、人件費が比較的安価な国々での開発が主流となっています。しかし、オフショア開発にはメリットだけでなく、デメリットも存在します。本記事では、オフショア開発のメリットとデメリットを詳しく解説し、成功させるためのポイントを紹介します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\">オフショア×メリット</h1>\n<!-- /wp:heading --></div>\n<!-- /wp:group -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">1. コスト削減</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発の最大のメリットは、<strong>人件費の削減</strong>です。日本や欧米諸国に比べ、東南アジアやインドなどの国々では人件費が大幅に安いため、開発コストを抑えることができます。特に、大規模なプロジェクトや長期的な開発において、コスト削減効果は顕著です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2.&nbsp;<strong>高度な技術力の活用</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発先の国々には、IT技術に特化した優秀なエンジニアが多く存在します。特に、ベトナムやインド、東欧諸国はIT教育が充実しており、高い技術力を有する人材が豊富です。自社では確保が難しい専門的なスキルを持つ人材を活用できるため、質の高い開発が可能となります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3. <strong>リソースの柔軟な調整</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発では、プロジェクトの規模に応じてリソースを柔軟に調整できます。短期間のプロジェクトや突発的な作業量の増加に対応するため、臨時のエンジニアを追加で確保することも可能です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\">オフショア×デメリット</h1>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">1. <strong>コミュニケーションの課題</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発では、<strong>言語や文化の違い</strong>によるコミュニケーションの課題が発生しやすいです。特に、細かい仕様や要件の伝達がうまくいかないと、期待通りの成果物が得られないことがあります。また、時差があるため、リアルタイムでのやり取りが難しい場合もあります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2.&nbsp;<strong>品質管理の難しさ</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア先の開発チームが自社の品質基準を満たしているかどうかを確認する必要があります。特に、開発プロセスやテストの実施状況をしっかりと監視しないと、品質にばらつきが生じるリスクがあります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3.&nbsp;<strong>セキュリティリスク</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発では、自社の機密情報や顧客データを外部に委託することになります。そのため、<strong>情報漏洩</strong>や<strong>セキュリティ侵害</strong>のリスクが高まります。契約書やNDA（秘密保持契約）を締結するなど、セキュリティ対策を徹底することが重要です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4.&nbsp;<strong>管理体制の負担</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発を成功させるためには、現地チームとの連携や進捗管理に多くの時間と労力を割く必要があります。特に、プロジェクトマネジメントの経験が少ない場合、管理体制の構築が大きな負担となることがあります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\">オフショア開発を成功させるためのポイント</h1>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\">1.&nbsp;<strong>信頼できるパートナーの選定</strong></h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発を成功させるためには、信頼できる開発パートナーを選ぶことが最も重要です。実績や評価をしっかりと確認し、自社のニーズに合ったパートナーを見極めましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>当社は、大使館などの官公庁や建設業などの多様な業界でのオフショア開発実績を既に持ち、お客様のニーズに合わせた柔軟な対応が可能です。また、日本品質に徹底的にこだわりを持っている姿がお客様からも高い評価をいただいており、信頼性の高いパートナーとして選ばれています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2.&nbsp;<strong>明確な要件定義とコミュニケーション</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>プロジェクト開始前に、要件定義書や仕様書をしっかりと作成し、双方で認識を合わせることが重要です。また、定期的なミーティングや進捗報告を通じて、コミュニケーションを密に取り合いましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>当社は、プロジェクト開始前に詳細な要件定義書を作成し、お客様との認識をしっかりと合わせます。また、定期的なミーティングや進捗報告を通じて、透明性の高いコミュニケーションを実現することを心がけています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3.&nbsp;<strong>品質管理とテストの徹底</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>開発プロセス全体を通じて、品質管理を徹底することが不可欠です。特に、テスト工程を重視し、バグや不具合を早期に発見・修正する体制を整えましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>当社は、自社で構築し培ってきた日本基準の品質管理プロセスを採用しており、開発の各段階で厳格なテストを実施します。高品質な成果物を提供し続けており、バグや不具合を最小限に抑えています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4.&nbsp;<strong>セキュリティ対策の強化</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>機密情報の取り扱いについては、契約書やNDAを締結するだけでなく、アクセス権限の管理やデータ暗号化などのセキュリティ対策を実施しましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>当社は、社内での厳格なルール策定を行っており、社員全体で高いセキュリティ意識を持ち続ける体制を構築しております。機密情報の取り扱いには万全のセキュリティ対策を講じており、お客様のデータを安全に保護します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">5.&nbsp;<strong>現地チームとの信頼関係の構築</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発では、現地チームとの信頼関係がプロジェクトの成功を左右します。文化や習慣の違いを理解し、相互尊重の姿勢で接することが大切です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>当社は、現地チームとの信頼関係構築に力を入れており、文化や習慣の違いを理解した上で、相互尊重の姿勢でプロジェクトに臨みます。オフショア開発先では、現地スタッフのみがマネジメントを行うケースが多く、仕様の伝達やトラブル解決に時間がかかることがあります。<br>当社では、現地に日本人スタッフを駐在させ、コミュニケーションのサポートや進捗管理、品質管理を徹底しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">当社が選ばれる理由！</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>◎時差の問題を解消</strong></li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>当社は本社を東京に、開発拠点をベトナムに置いています。<br>日本とベトナムの時差はわずか2時間であり、ベトナム拠点の始業時間を日本のコアタイムに合わせているため、リアルタイムでの連携が可能です。具体的には、ベトナム拠点は8時始業（日本時間10時）となっており、日本の朝会やミーティング後にスムーズに作業を進められます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true,\"start\":2} -->\n<ol start=\"2\" class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>◎徹底した品質管理</strong></li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>当社は、単に開発リソースを提供するだけではありません。<br>現地の日本人スタッフが仕様理解や進捗管理をサポートするほか、専属のQAチームが各開発チームの品質をチェックします。また、定期的な人材評価を行い、問題の早期発見と改善を徹底しています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true,\"start\":3} -->\n<ol start=\"3\" class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>◎高度な案件にも対応可能</strong></li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>当社は、開発・製造フェーズだけでなく、保守・運用フェーズにも強みを持っています。<br>24時間高稼働するサーバーの安定運用など、高度な技術を要する案件にも対応可能です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">お任せください！</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発は、コスト削減や高度な技術力の活用など、多くのメリットを提供します。一方で、コミュニケーションや品質管理、セキュリティリスクなどのデメリットも存在します。これらの課題を克服し、オフショア開発を成功させるためには、信頼できるパートナーの選定や明確な要件定義、品質管理の徹底が不可欠です。適切な対策を講じることで、オフショア開発のメリットを最大限に活かし、ビジネスの成長を加速させましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>当社は、お客様の成功を全力でサポートします。</strong><br>オフショア開発でお悩みの方、新しいプロジェクトを検討されている方、ぜひ一度当社にご相談ください。私たちは、豊富な実績と高い技術力、そして徹底した品質管理とセキュリティ対策で、お客様のビジネスを成功に導きます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>☆コスト削減と高品質な開発を両立したい</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>☆スピーディーな開発体制で市場競争力を高めたい</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>☆信頼できるパートナーと共に、長期的な関係を築きたい</strong></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>そんなご要望に、当社はお応えします。<br>まずはお気軽にお問い合わせください。専門のコンサルタントが、お客様のニーズに合わせた最適なソリューションをご提案いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>今こそ、オフショア開発でビジネスの可能性を広げましょう！</strong><br>お問い合わせは≪お問い合わせ≫より！<br>または、以下の電話番号までお気軽にご連絡ください：<br>TEL: <a href=\"tel:0345006968\">03-4500-6968</a></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>私たちが、お客様の成功を全力でサポートします。</p>\n<!-- /wp:paragraph -->', '成功の鍵を握るオフショアのコツ・ポイント！', '', 'publish', 'closed', 'closed', '', 'offshore-development-what-are-the-key-points-to-success', '', '', '2025-07-25 17:50:18', '2025-07-25 08:50:18', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=552', 0, 'blog', '', 0),
(555, 1, '2025-01-20 15:18:06', '2025-01-20 06:18:06', '<!-- wp:paragraph -->\n<p>In recent years, as business globalization advances, more companies are utilizing offshore development. Offshore development refers to outsourcing software development or IT-related tasks to countries or regions outside one\'s own. Particularly, development in countries with relatively low labor costs has become mainstream. However, offshore development comes with both advantages and disadvantages. This article will explain the pros and cons of offshore development in detail and introduce key points for success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"metadata\":{\"categories\":[\"text\"],\"patternName\":\"core/heading\",\"name\":\"Heading\"},\"align\":\"wide\",\"style\":{\"typography\":{\"fontSize\":\"48px\",\"lineHeight\":\"1.1\"}}} -->\n<h2 class=\"wp-block-heading alignwide\" id=\"we-re-a-studio-in-berlin-with-an-international-practice-in-architecture-urban-planning-and-interior-design-we-believe-in-sharing-knowledge-and-promoting-dialogue-to-increase-the-creative-potential-of-collaboration\" style=\"font-size:48px;line-height:1.1\">Offshore × Advantages</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">1. Cost Reduction</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>The biggest advantage of offshore development is&nbsp;<strong>labor cost reduction</strong>. Compared to Japan or Western countries, labor costs in regions such as Southeast Asia and India are significantly lower, allowing companies to reduce development expenses. This cost-saving effect is especially notable in large-scale or long-term projects.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">2. Leveraging Advanced Technical Skills</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Countries that serve as offshore development hubs are home to many skilled engineers specializing in IT. For example, Vietnam, India, and Eastern Europe have robust IT education systems, producing a wealth of highly skilled professionals. By utilizing these talents, companies can achieve high-quality development that may be difficult to achieve in-house.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">3. Flexible Resource Allocation</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Offshore development allows for flexible scaling of resources based on project size. Companies can quickly add temporary engineers to handle short-term projects or sudden increases in workload.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\">Offshore × Disadvantages</h1>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">1. Communication Challenges</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Offshore development often faces communication challenges due to language and cultural differences. Miscommunication of detailed specifications or requirements can lead to deliverables that do not meet expectations. Additionally, time zone differences can make real-time communication difficult.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">2. Difficulty in Quality Control</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>It is essential to ensure that the offshore development team meets your company\'s quality standards. Without proper monitoring of the development process and testing, there is a risk of inconsistent quality.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">3. Security Risks</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Offshore development involves outsourcing confidential information and customer data, increasing the risk of data leaks or security breaches. It is crucial to implement thorough security measures, such as contracts and NDAs (Non-Disclosure Agreements).</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">4. Management Burden</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Successfully managing offshore development requires significant time and effort to coordinate with the local team and monitor progress. For those with limited project management experience, building an effective management system can be challenging.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\">Key Points for Successful Offshore Development</h1>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">1. Choosing a Reliable Partner</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Selecting a trustworthy development partner is the most critical factor for successful offshore development. Carefully evaluate their track record and reputation to find a partner that aligns with your company\'s needs.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Why Choose Us?</strong><br>We have extensive experience in offshore development across diverse industries, including government agencies and construction. Our commitment to Japanese-quality standards has earned us high praise from clients, making us a reliable partner.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">2. Clear Requirement Definitions and Communication</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Before starting a project, it is essential to create detailed requirement documents and specifications to align expectations. Regular meetings and progress reports ensure transparent communication.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Why Choose Us?</strong><br>We prepare detailed requirement documents and ensure alignment with clients before project initiation. We prioritize transparent communication through regular meetings and progress updates.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">3. Thorough Quality Management and Testing</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Quality management must be maintained throughout the development process. Emphasize testing to identify and fix bugs or issues early.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Why Choose Us?</strong><br>We adhere to our own Japanese-standard quality management processes, conducting rigorous testing at every development stage. This ensures high-quality deliverables with minimal bugs or defects.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">4. Strengthening Security Measures</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>In addition to contracts and NDAs, implement access control and data encryption to protect confidential information.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Why Choose Us?</strong><br>We have established strict internal rules and maintain a high level of security awareness among our staff. We take comprehensive measures to safeguard your data.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">5. Building Trust with the Local Team</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Trust between your company and the offshore team is crucial for project success. Understanding cultural differences and maintaining mutual respect is key.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Why Choose Us?</strong><br>We prioritize building trust with local teams by understanding cultural differences and fostering mutual respect. Unlike many offshore setups where only local staff manage projects, we station Japanese staff onsite to support communication, progress management, and quality control.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\">Why Choose Us?</h1>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">◎ Minimizing Time Zone Challenges</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our headquarters are in Tokyo, and our development base is in Vietnam. With only a 2-hour time difference, we align Vietnam\'s working hours with Japan\'s core business hours. For example, our Vietnam office starts at 8 AM (10 AM Japan time), enabling seamless collaboration after morning meetings in Japan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">◎ Rigorous Quality Control</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We go beyond simply providing development resources. Our Japanese staff onsite support requirement understanding and progress management, while a dedicated QA team ensures quality across all development teams. Regular personnel evaluations help identify and resolve issues early.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">◎ Capability to Handle Complex Projects</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We excel not only in development and production but also in maintenance and operations. We can handle highly technical projects, such as ensuring stable operation of 24/7 high-availability servers.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\">Leave It to Us!</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Offshore development offers numerous benefits, including cost reduction and access to advanced technical skills. However, challenges such as communication, quality control, and security risks must be addressed. To succeed, it is essential to choose a reliable partner, define requirements clearly, and maintain rigorous quality management. With the right approach, offshore development can maximize its advantages and accelerate business growth.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We are committed to supporting your success.<br>If you are considering offshore development or have a new project in mind, please feel free to consult with us. With our extensive experience, advanced technical capabilities, and unwavering commitment to quality and security, we will guide your business to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Want to achieve both <strong>cost reduction</strong> and <strong>high-quality development</strong>?</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Looking to enhance market competitiveness with a <strong>speedy development process</strong>?</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Seeking a <strong>trusted partner</strong> for a long-term relationship?</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>We are here to meet your needs.<br>Contact us today! Our expert consultants will provide the optimal solution tailored to your requirements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Now is the time to expand your business potential with offshore development!</strong><br>Click&nbsp;<strong>≪Contact Us≫</strong>&nbsp;to get started!<br>Or call us at:<br><strong>TEL: 03-4500-6968</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We are here to support your success every step of the way.</p>\n<!-- /wp:paragraph -->', 'Offshore Development! What Are the Key Points to Success?', '', 'publish', 'closed', 'closed', '', 'offshore-development-what-are-the-key-points-to-success', '', '', '2025-01-20 15:18:06', '2025-01-20 06:18:06', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=555', 0, 'blog', '', 0),
(556, 1, '2025-01-24 16:48:39', '2025-01-24 07:48:39', '<!-- wp:paragraph -->\n<p>オフショア開発をご検討されている企業様にとって、最も大きな不安は「開発プロジェクトが失敗してしまうこと」ではないでしょうか。システム開発は、自社内で行う場合でも、国内外に委託する場合でも、スケジュールの遅延や品質の問題など、さまざまな課題がつきものです。特に海外でのオフショア開発では、文化や言語の違い、距離やタイムゾーンの問題などが重なり、「本当に成功するのか？」という懸念が生まれやすいでしょう。<br>しかし、当社はこれまで多くの日本企業様のオフショア開発プロジェクトを成功に導いてきた実績があります。他のオフショア開発会社ではうまくいかなかったという企業様でも当社にご依頼いただいたことで、長年にわたり継続的なパートナーシップを築いている事例も数多くございます。<br>本記事では、オフショア開発が失敗する主な原因と、それらを解決し、成功へと導くための具体的な方法について詳しくご説明します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><mark style=\"background-color:rgba(0, 0, 0, 0)\" class=\"has-inline-color has-material-red-color\">オフショア開発が失敗する理由</mark></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\"><strong>1. コミュニケーションの齟齬</strong> &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発では、地理的な距離やタイムゾーンの違い、言語の壁が大きな障壁となります。これにより、プロジェクトの要件や進捗状況が正確に伝わらず、期待通りの成果が得られないことがあります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\"><strong>2. 文化の違い</strong> &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>ビジネス文化や働き方の違いが、プロジェクトの進行を妨げることがあります。例えば、意思決定のスピードや報告の頻度、品質に対する考え方の違いが、プロジェクトの遅延や品質低下を招くことがあります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3. 要件定義の不備 &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発では、最初の要件定義が非常に重要です。要件が曖昧なままプロジェクトが進むと、開発途中で仕様変更が頻発し、コストや時間がかさんでしまいます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4. 品質管理の不徹底 &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア先の開発チームのスキルや品質管理が不十分だと、納品物の品質が低くなり、修正に多くの時間とコストがかかることがあります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">5. プロジェクト管理の不足 &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発では、現地チームとの連携や進捗管理が重要です。プロジェクト管理が不十分だと、進捗が遅れたり、問題が早期に発見されずに手遅れになることがあります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><mark style=\"background-color:rgba(0, 0, 0, 0)\" class=\"has-inline-color has-material-blue-color\">オフショア開発を成功させるための戦略</mark></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">1. 明確な要件定義とドキュメント化 &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>プロジェクト開始前に、要件を詳細に定義し、ドキュメントとして共有することが重要です。これにより、オフショアチームが正確に理解し、開発を進めることができます。また、変更が生じた場合も、ドキュメントを更新して共有することで齟齬を防げます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2. 効果的なコミュニケーション体制の構築 &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>定期的なミーティングや進捗報告の仕組みを整えることで、コミュニケーションの齟齬を防ぎます。ツールとしては、SlackやMicrosoft Teamsなどのチャットツール、ZoomやGoogle Meetなどのビデオ会議ツールを活用すると効果的です。また、タイムゾーンの違いを考慮したスケジュール調整も重要です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3. 文化の違いを理解し、尊重する &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア先の文化や働き方を理解し、尊重することが重要です。例えば、現地の祝日や労働習慣を考慮したスケジュールを組むことで、チームのモチベーションを維持できます。また、現地チームとの信頼関係を築くために、定期的なフィードバックや感謝の意を示すことも効果的です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4. 品質管理の徹底 &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>品質管理を徹底するために、コードレビューやテストのプロセスを明確にし、定期的に実施することが重要です。また、オフショアチームのスキルアップを支援するために、トレーニングや技術サポートを提供することも有効です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">5. 適切なプロジェクト管理 &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>プロジェクト管理ツール（Jira、Trello、Asanaなど）を活用し、タスクの進捗状況や課題を可視化します。また、プロジェクトマネージャーを配置し、オフショアチームとの連携や進捗管理を徹底することで、問題を早期に発見・解決できます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">6. パイロットプロジェクトの実施 &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>大規模なプロジェクトをいきなりオフショアに委託するのではなく、小さなパイロットプロジェクトを実施して、オフショア先の能力やコミュニケーションの課題を確認することが有効です。これにより、本格的なプロジェクト開始前に改善点を洗い出せます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">7. 信頼できるパートナーの選定 &nbsp;</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発を成功させるためには、信頼できるパートナーを選ぶことが最も重要です。実績や評価、技術力、コミュニケーション能力を慎重に検討し、自社のニーズに合ったパートナーを選定しましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\"><strong><mark style=\"background-color:rgba(0, 0, 0, 0)\" class=\"has-inline-color has-material-yellow-color\">AIoTを選んでいただく理由</mark></strong></h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoTは、オフショア開発においてお客様のプロジェクトを必ず成功に導くための強力な基盤を持っています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong><mark style=\"background-color:rgba(0, 0, 0, 0)\" class=\"has-inline-color has-material-orange-color\">◎正確な仕様理解と徹底した品質管理</mark></strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:group {\"layout\":{\"type\":\"flex\",\"orientation\":\"vertical\"}} -->\n<div class=\"wp-block-group\"><!-- wp:paragraph -->\n<p>当社では、プロジェクト開始時に要件や仕様を詳細にドキュメント化し、クライアントとの確認プロセスを徹底しています。これにより、関係者全員が同じ認識を持ち、プロジェクトの方向性を明確にします。さらに、コーディング規約の遵守や多段階のテストプロセスを通じて、高品質なコードとバグの少ない成果物を提供します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong><mark style=\"background-color:rgba(0, 0, 0, 0)\" class=\"has-inline-color has-material-orange-color\">◎セキュリティとユーザビリティの両立 </mark> </strong>　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当社は、日本の法律や国際基準に準拠したデータ保護と脆弱性対策を徹底しています。同時に、ユーザー目線での設計を重視し、使いやすいインターフェースや機能を提供します。ユーザーフィードバックを迅速に反映し、継続的な改善を行います。</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong><mark style=\"background-color:rgba(0, 0, 0, 0)\" class=\"has-inline-color has-material-orange-color\">◎明確な進捗管理と柔軟な対応力</mark></strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":1,\"align\":\"wide\"} -->\n<h1 class=\"wp-block-heading alignwide\"><strong><mark style=\"background-color:rgba(0, 0, 0, 0)\" class=\"has-inline-color has-material-grey-color\">お任せください！</mark></strong></h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoTはお客様のビジネス成功を支える信頼できるパートナーとして、オフショア開発における課題を解決し、長期的な関係を築くことを目指しています。ぜひ、AIoTにお任せいただき、共に成功を目指しましょう。<br>オフショア開発でお悩みの方、新しいプロジェクトを検討されている方、ぜひ一度当社にご相談ください。私たちは、豊富な実績と高い技術力、そして徹底した品質管理とセキュリティ対策で、お客様のビジネスを成功に導きます。<br>☆コスト削減と高品質な開発を両立したい<br>☆スピーディーな開発体制で市場競争力を高めたい<br>☆信頼できるパートナーと共に、長期的な関係を築きたい<br>そんなご要望に、当社はお応えします。<br>まずはお気軽にお問い合わせください。専門のコンサルタントが、お客様のニーズに合わせた最適なソリューションをご提案いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>お問い合わせは<strong>≪お問い合わせ≫</strong>より！<br>または、以下の電話番号までお気軽にご連絡ください：<br><strong>TEL: 03-4500-6968</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Happy Together!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->', '☆失敗と成功（オフショア開発）☆', '', 'publish', 'closed', 'closed', '', 'reasons-why-offshore-development-fails-and-strategies-for-success-2', '', '', '2025-07-25 17:50:32', '2025-07-25 08:50:32', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=556', 0, 'blog', '', 0),
(558, 1, '2025-01-24 17:14:31', '2025-01-24 08:14:31', '<!-- wp:paragraph -->\n<p>For companies considering offshore development, the biggest concern is likely the fear of project failure. System development, whether conducted in-house or outsourced domestically or internationally, comes with various challenges such as schedule delays and quality issues. Particularly in offshore development, cultural and language differences, as well as distance and time zone issues, can amplify concerns about whether the project will truly succeed.<br>However, our company has a proven track record of successfully guiding offshore development projects for many Japanese companies. We have numerous cases where companies that struggled with other offshore development providers have achieved long-term, continuous partnerships with us.<br>In this article, we will explain in detail the main reasons why offshore development fails and specific methods to overcome these challenges and achieve success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Reasons Why Offshore Development Fails</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:list {\"ordered\":true,\"start\":1} -->\n<ol start=\"1\" class=\"wp-block-list\"><!-- wp:list-item -->\n<li>・<strong>Communication Gaps</strong><br>Offshore development faces significant barriers due to geographical distance, time zone differences, and language barriers. This can lead to misunderstandings about project requirements and progress, resulting in outcomes that do not meet expectations.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>・Cultural Differences</strong><br>Differences in business culture and work styles can hinder project progress. For example, variations in decision-making speed, reporting frequency, and quality standards can lead to delays and quality issues.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>・<strong>Inadequate Requirement Definition</strong><br>In offshore development, initial requirement definition is critical. If requirements are unclear, frequent specification changes during development can lead to increased costs and time overruns.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>・<strong>Insufficient Quality Control</strong><br>If the offshore team lacks skills or proper quality management, the delivered product may be of low quality, requiring significant time and cost to fix.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>・Lack of Project Management</strong><br>Effective coordination and progress management with the offshore team are essential. Insufficient project management can lead to delays and issues being discovered too late to resolve.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Strategies for Successful Offshore Development</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:list {\"ordered\":true,\"start\":1} -->\n<ol start=\"1\" class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>○Clear Requirement Definition and Documentation</strong><br>Before starting the project, it is crucial to define requirements in detail and share them as documentation. This ensures the offshore team understands the project accurately and can proceed with development. Any changes should also be documented and shared to prevent misunderstandings.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>○Effective Communication Systems</strong><br>Regular meetings and progress reporting mechanisms help prevent communication gaps. Tools like Slack, Microsoft Teams, Zoom, and Google Meet are effective for communication. Scheduling adjustments to account for time zone differences are also important.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>○Understanding and Respecting Cultural Differences</strong><br>Understanding and respecting the offshore team\'s culture and work style is key. For example, considering local holidays and work habits when scheduling can maintain team motivation. Regular feedback and showing appreciation also help build trust.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>○Thorough Quality Control</strong><br>Implementing clear processes for code reviews and testing is essential for quality control. Providing training and technical support to the offshore team can also enhance their skills.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>○Proper Project Management</strong><br>Using project management tools like Jira, Trello, or Asana to visualize task progress and issues is effective. Assigning a project manager to coordinate with the offshore team ensures early detection and resolution of problems.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong><strong>○</strong>Pilot Project Implementation</strong><br>Instead of outsourcing a large project immediately, starting with a small pilot project helps identify the offshore team\'s capabilities and communication challenges. This allows for improvements before the full-scale project begins.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>○Choosing a Reliable Partner</strong><br>Selecting a trustworthy partner is the most critical factor for successful offshore development. Carefully evaluate their track record, technical capabilities, and communication skills to find a partner that meets your needs.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Why Choose AIoT?</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT has a strong foundation to ensure the success of your offshore development projects.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>☆<strong>Accurate Requirement Understanding and Thorough Quality Control</strong><br>We document project requirements and specifications in detail at the start and confirm them with clients to ensure alignment. Adherence to coding standards and multi-stage testing processes deliver high-quality, low-defect outcomes.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>☆<strong>Balancing Security and Usability</strong><br>We comply with Japanese laws and international standards for data protection and vulnerability measures. At the same time, we prioritize user-centric design to provide intuitive interfaces and features, incorporating user feedback for continuous improvement.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>☆<strong>Clear Progress Management and Flexible Response</strong><br>Leave it to us! AIoT aims to be a trusted partner supporting your business success, resolving offshore development challenges, and building long-term relationships.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Let’s Work Together!</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you are facing challenges with offshore development or considering a new project, please feel free to consult with us. With our extensive experience, technical expertise, and commitment to quality and security, we will guide your business to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Looking to reduce costs while maintaining high-quality development?</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Want to enhance market competitiveness with a speedy development process?</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Seeking a reliable partner for a long-term relationship?</strong></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>We are here to meet your needs. Contact us today! Our expert consultants will propose the best solutions tailored to your requirements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Inquiries:</strong><br>Please visit our&nbsp;<strong>Contact Us</strong>&nbsp;page or call us at:<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Happy Together!</strong></p>\n<!-- /wp:paragraph -->', 'Reasons Why Offshore Development Fails and Strategies for Success', '', 'publish', 'closed', 'closed', '', 'reasons-why-offshore-development-fails-and-strategies-for-success', '', '', '2025-01-24 17:15:33', '2025-01-24 08:15:33', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=558', 0, 'blog', '', 0),
(561, 1, '2025-02-03 12:33:24', '2025-02-03 03:33:24', '<!-- wp:paragraph -->\n<p>近年ITシステム開発オフショア先としてベトナムが選ばれることが一般的になってきました。当社は設立以来、日本の企業様に対して他の日本企業にも引けを取らない品質や信頼を目指し、自社サービスを展開しています。本記事では、ベトナムにおけるオフショア開発の魅力について、当社独自の視点から解説いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">① コストの優位性</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>ベトナムのシステム開発単価は、日本と比較して約35%程度に収まります。ベトナムの物価自体が日本の物価と比べ1/2〜1/3程度で安価である背景があり、実態調査によるとIT人材の給料額は日本のIT人材の約1/3程度に抑えられています。2024年のデータによると、ベトナムのITエンジニアの平均月収は約812ドルで、日本の約2,500ドルに対しコスト面での優位性があります。諸々の諸経費も含めた人月単位で見ても明らかなコスト面での差を感じていただけるでしょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">② 優秀なIT人材の豊富さ</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>ベトナム政府は2020年に国家DXプログラムを発表し、2025年までの目標を設定して人材育成に注力しています。国内の約70%の大学にIT関連学部が設置され、年間5万人以上のIT人材が育成されています。この結果、国内のIT人材は53万人を超え、IT産業は毎年約10%の成長を続けています。特に日本企業からの新規投資が増加しており、情報通信分野が注目されています。また、日本企業向けの案件は高度化しており、モバイルやWeb系からAIやクラウド関連の案件に移行しています。さらに、民間企業は大学設立に出資し、実践的な教育プログラムを提供することで日本市場を意識した人材育成を行っています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">③ 地理的優位性と時差の優位性</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>ベトナムと日本の時差はわずか2時間程度です。ベトナム人の習慣として朝が早いため、日本のコアタイムに合わせて就業時間を調整することが大前提可能です。そのため開発拠点（ベトナム）とのコミュニケーションもスムーズな点が他国との大きな差別化ポイントです。東京から主要都市（ホーチミン・ダナン・ハノイ）までのフライト時間も約6時間で、視察やミーティングにもアクセスしやすい距離です。この地理的な利点により、リアルタイムでのやり取りが可能となり、プロジェクトの進行が円滑になります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">④ 安定したインフラ</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>ベトナムはインフラが整っており、電力供給や通信環境が安定しています。2024年、全国的なインターネット普及率が約79%を超え、特に都市部では高速インターネットが利用可能です。これにより、開発作業がスムーズに行える環境が既に整っています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">⑤ 親日的な文化</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>ベトナム人は日本製品や文化に親しみを持ち、日本に対するリスペクトが強いです。調査によると、ベトナム人の約80%が日本に対して好意的な印象を持っており、文化的な親近感も高まっています。このため、仕事がしやすく、良好なコミュニケーションが期待できます。ちなみに当社では社内での日本語学習希望者も多く、ダナン拠点、ホーチミン拠点でもそれぞれ日本語学習時間を独自で社内教育の一環として採り入れています！社内全員が日本人の方々と働けることに大きな期待を持っているところが他のオフショア拠点との大きな差別化ポイントです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">※他のオフショア開発先との比較</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>中国はオフショア開発の歴史が長いですが、コストはベトナムの約2倍となっています。人件費は上昇傾向にあり、コストメリットが薄れています。また、言語の壁や文化の違い、商習慣の違いも大きな課題となっているようです。<br>インドもオフショア開発先としての歴史がありますが、コストが上昇しているため、ベトナムの方が圧倒的にコスト面での優位性があります。日本語話者の数も少なく、コアタイムやスケジュール感の調整などに若干の難がある声があるのも事実です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>上記のように、「コスト面」「文化的な側面」で圧倒的に日本に対しての優位性を寄与できるところがベトナムの最大の魅力だと考えております。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">まとめ</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発を行う際には、コスト、優秀な人材、安定したインフラ、そして親日的な文化を持つベトナムがおすすめです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>さらにAIoTは品質、信頼度、親日度で他のオフショア拠点と比べて日本企業様の最適なパートナーとなれる自身がございます。ぜひ、ベトナムでのオフショア開発を検討していただき、当社にお任せください！</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":5} -->\n<h5 class=\"wp-block-heading\"><br>AIoTはお客様のビジネス成功を支える信頼できるパートナーとして、オフショア開発における課題を解決し、長期的な関係を築くことを目指しています。ぜひ、AIoTにお任せいただき、共に成功を目指しましょう。<br>オフショア開発でお悩みの方、新しいプロジェクトを検討されている方、ぜひ一度当社にご相談ください。</h5>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":5} -->\n<h5 class=\"wp-block-heading\">私たちは、豊富な実績と高い技術力、そして徹底した品質管理とセキュリティ対策で、お客様のビジネスを成功に導きます。<br>☆コスト削減と高品質な開発を両立したい<br>☆スピーディーな開発体制で市場競争力を高めたい<br>☆信頼できるパートナーと共に、長期的な関係を築きたい<br>そんなご要望に、当社はお応えします。<br>まずはお気軽にお問い合わせください。専門のコンサルタントがお客様のニーズに合わせた最適なソリューションをご提案いたします。</h5>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":5} -->\n<h5 class=\"wp-block-heading\">お問い合わせは≪お問い合わせ≫より！<br>または、以下の電話番号までお気軽にご連絡ください：<br>TEL: 03-4500-6968</h5>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":5} -->\n<h5 class=\"wp-block-heading\">Happy Together!</h5>\n<!-- /wp:heading -->', 'オフショア開発はベトナム一択！', '', 'publish', 'closed', 'closed', '', 'reasons-to-conduct-offshore-development-in-vietnam-2', '', '', '2025-07-28 16:19:50', '2025-07-28 07:19:50', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=561', 0, 'blog', '', 0),
(563, 1, '2025-02-03 12:48:52', '2025-02-03 03:48:52', '<!-- wp:paragraph -->\n<p>In recent years, Vietnam has increasingly become a popular choice for offshore IT system development. Since our establishment, we have aimed to provide services that match the quality and trustworthiness. In this article, we will discuss the attractiveness of offshore development in Vietnam from our unique perspective.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"></ol>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">1 Cost Advantages</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>The cost of system development in Vietnam is approximately 35% lower than in Japan. This is due to the lower cost of living in Vietnam, which is about 1/2 to 1/3 that of Japan. According to surveys, the salaries of IT personnel in Vietnam are about one-third of those in Japan. In 2024, the average monthly salary for IT engineers in Vietnam is expected to be around $812, compared to about $2,500 in Japan. You will notice a significant cost difference when considering all related expenses on a man-month basis.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">2 Abundance of Skilled IT Personnel</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>The Vietnamese government launched a national DX program in 2020, focusing on talent development with goals set for 2025. About 70% of universities in the country have IT-related faculties, producing over 50,000 IT professionals annually. As a result, the number of IT personnel in Vietnam exceeds 530,000, and the IT industry continues to grow at about 10% per year. There is an increasing amount of new investment from Japanese companies, particularly in the information and communication sectors. Additionally, projects for Japanese companies are becoming more advanced, shifting from mobile and web-based systems to AI and cloud-related projects. Furthermore, private firms are investing in establishing universities and providing practical educational programs aimed at the Japanese market.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">3 Geographical and Time Zone Advantages</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Vietnam has a time difference of only about 2 hours with Japan. Due to the local culture of early rising, it is feasible to adjust working hours to align with Japanese core hours. This allows for smooth communication with the development base in Vietnam, setting it apart from other countries. The flight time from Tokyo to major cities (Ho Chi Minh City, Da Nang, Hanoi) is about 6 hours, making it easy to visit and hold meetings. This geographical advantage facilitates real-time interactions and smooth project progress.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">4 Stable Infrastructure</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Vietnam has a well-established infrastructure, with reliable power supply and stable communications. By 2024, the nationwide internet penetration rate is expected to exceed 79%, particularly in urban areas where high-speed internet is accessible. This infrastructure supports smooth development operations.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">5 Pro-Foreign Culture</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Vietnamese people have a strong affinity for foreign products and culture, showing a high level of respect for other countries. Surveys indicate that Vietnamese have a favorable impression of other countries, enhancing cultural familiarity. This makes collaboration easier and communication more effective. Many employees at our company express a desire to learn from foreign cultures. This strong expectation among our staff to work with customers from all over the world sets us apart from other offshore bases.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comparison with Other Offshore Development Locations</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>While China has a long history of offshore development, its costs are about twice those of Vietnam. Labor costs are on the rise, diminishing cost advantages. Additionally, language barriers, cultural differences, and variations in business practices pose significant challenges. India also has a history as an offshore development destination, but its rising costs make Vietnam a more attractive option in terms of cost. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In summary, the significant advantages of Vietnam in terms of cost and cultural compatibility make it an attractive destination for offshore development.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Conclusion</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>When considering offshore development, Vietnam stands out for its cost-effectiveness, skilled workforce, stable infrastructure, and pro-Japanese culture.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>At AIoT, we believe we can be the optimal partner for companies from any countries, offering quality, reliability, and cultural alignment that surpass other offshore locations. We invite you to consider offshore development in Vietnam and trust us with your projects!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Leave It to Us!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT aims to be a reliable partner that supports your business success by solving challenges in offshore development and building long-term relationships. If you are facing issues with offshore development or are considering a new project, please consult us.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>With our extensive experience, high technical capabilities, and rigorous quality management and security measures, we are committed to leading your business to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆If you want to achieve cost reduction while maintaining high-quality development</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆If you aim to enhance market competitiveness with a speedy development structure</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆If you wish to build a long-term relationship with a trustworthy partner</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We are here to meet your needs. Please feel free to contact us. Our specialized consultants will propose optimal solutions tailored to your requirements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Contact us via the “Contact Us” link!<br>Or call us at:<br>TEL: 03-4500-6968<br><strong>Happy Together!</strong></p>\n<!-- /wp:paragraph -->', 'Reasons to Conduct Offshore Development in Vietnam', '', 'publish', 'closed', 'closed', '', 'reasons-to-conduct-offshore-development-in-vietnam', '', '', '2025-02-03 12:48:52', '2025-02-03 03:48:52', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=563', 0, 'blog', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(564, 1, '2025-02-05 13:39:20', '2025-02-05 04:39:20', '<!-- wp:paragraph -->\n<p>オフショア開発を初めて検討する企業にとって、その道のりにはさまざまな悩みが伴います。特に、言語や文化の違いからくるコミュニケーションの不安は大きな課題です。また、開発品質が国内の基準に達するかどうかの心配も尽きません。さらに、時差やリモート環境での進捗管理の難しさに頭を悩ませる企業も少なくありません。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>信頼できる開発会社を見つけることや、コストの透明性を確保することも大きな関心事です。法的な契約や知的財産権の保護についての疑問も、オフショア開発を進める上での大きな障害となります。そして、異なる文化的背景がプロジェクトに与える影響を考慮することも忘れてはならないポイントです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>このように、初めてのオフショア開発には多くの不安や疑問がつきまとう中、成功へと導くための手順を見つけることが求められています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>オフショア開発を成功させるための鍵は、<mark style=\"background-color:rgba(0, 0, 0, 0)\" class=\"has-inline-color has-material-amber-color\">準備段階からの綿密な≪プランニング≫と効果的な≪コミュニケーション≫</mark>にあります。</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>プロジェクトの目的や要件を明確に定義し、関係者全員が共有できるビジョンを持つことで期待値のズレを防ぎ、スムーズな進行が可能になります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>この記事では、ベトナムでオフショア開発事業を展開するAIoTが、オフショア開発の具体的な進め方と最適な見つけ方を実践的な知見を交えながら7つのステップのステップ１について紹介します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Step 1：社内調整とプロジェクト体制の確立</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発を始めるにあたり、最も重要なのは社内での調整です。プロジェクトが成功するためには、IT部門だけでなく、経営層や関連部門を含む全社的な体制を整える必要があります。この段階での取り組みが、後のプロジェクトの進行を大きく左右します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">社内調整の進め方</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>１　経営層の巻き込み</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>プロジェクトの成功には、経営層の理解と支援が不可欠です。彼らがプロジェクトの重要性を認識することで、予算の確保やリソースの配分がスムーズに行えます。定期的に進捗報告を行い、経営層の意見を反映させることで、彼らの関与を促進します。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>２　プロジェクトの目的と期待効果の説明</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>オフショア開発の目的を明確にし、期待される効果を社内に周知させることが重要です。コスト削減や開発スピードの向上といった具体的なメリットを示すことで、全社的な支持を得やすくなります。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>３　予算の確保</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>プロジェクトを円滑に進めるためには、十分な予算を確保する必要があります。経営層にプロジェクトのROI（投資対効果）を示し、予算の</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>妥当性を説明することが鍵です。予算が承認されることで、安心してプロジェクトを進められます。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>４　リスクと対策の共有</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>オフショア開発にはリスクが伴います。リスクを事前に特定し、それに対する対策を共有することで、プロジェクトの透明性を高め、関係者の信頼を得ることができます。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>５　関連部門との連携</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>プロジェクトに関与するすべての部門との連携を強化することが不可欠です。要件定義に関わる部門を特定し、各部門の役割と責任を明確化することで、効率的な作業が可能になります。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>６　スケジュールの調整</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>各部門がスムーズに連携できるよう、スケジュールの調整を行います。特に、オフショア開発チームとのタイムラインを合わせることが、プロジェクトの進行において重要です。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>７　コミュニケーション体制の整備</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>時差を考慮した会議体の設計が必要です。オフショアチームと円滑にコミュニケーションを図るために、定期的なミーティングをスケジュールし、リアルタイムでの情報共有ができる環境を整備しましょう。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>８　コミュニケーションツールの選定</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>効率的な情報共有には適切なコミュニケーションツールが欠かせません。チャットツールやプロジェクト管理ツールを選定し、全員が使いやすい環境を整えることが重要です。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>９　情報共有ルールの策定</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>プロジェクトに関する情報の共有ルールを策定し、関係者間での情報の流れをスムーズにします。これにより、情報の取りこぼしや誤解を防ぐことができます。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">まとめ</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発を担当する部門と現場の間に温度差があると、プロジェクトの進行に支障をきたす可能性が高くなります。特に経営層の理解と支援は、予算確保や部門間調整の面で極めて重要です。これらのポイントを押さえ、社内調整を進めることで、オフショア開発の基盤をしっかりと築くことができるのです。成功に向けた第一歩を踏み出しましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">お任せください！</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoTはお客様のビジネス成功を支える信頼できるパートナーとして、オフショア開発における課題を解決し、長期的な関係を築くことを目指しています。ぜひ、AIoTにお任せいただき、共に成功を目指しましょう。<br>オフショア開発でお悩みの方、新しいプロジェクトを検討されている方、ぜひ一度当社にご相談ください。私たちは、豊富な実績と高い技術力、そして徹底した品質管理とセキュリティ対策で、お客様のビジネスを成功に導きます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆コスト削減と高品質な開発を両立したい<br>☆スピーディーな開発体制で市場競争力を高めたい<br>☆信頼できるパートナーと共に、長期的な関係を築きたい<br><br>そんなご要望に、当社はお応えします。<br>まずはお気軽にお問い合わせください。専門のコンサルタントが、お客様のニーズに合わせた最適なソリューションをご提案いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>お問い合わせは≪お問い合わせ≫より！<br>または、以下の電話番号までお気軽にご連絡ください：<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Happy Together!</p>\n<!-- /wp:paragraph -->', 'オフショア開発の進め方：7つの具体的ステップ　Part１', '', 'publish', 'closed', 'closed', '', 'steps-to-progress-offshore-development-7-specific-steps-part-1', '', '', '2025-07-28 16:38:48', '2025-07-28 07:38:48', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=564', 0, 'blog', '', 0),
(566, 1, '2025-02-05 13:49:25', '2025-02-05 04:49:25', '<!-- wp:paragraph -->\n<p>For companies considering offshore development for the first time, the journey is often fraught with various concerns. Particularly, anxiety over communication issues arising from language and cultural differences is a significant challenge. Additionally, worries about whether the development quality will meet domestic standards are common. Many companies also struggle with the difficulties of progress management in a remote environment, compounded by time zone differences.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Finding a reliable development company and ensuring cost transparency are major concerns as well. Questions about legal contracts and the protection of intellectual property can pose significant obstacles in advancing offshore development. Moreover, it is crucial to consider the impact of different cultural backgrounds on the project.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In this context, it is essential to identify steps that will lead to success in offshore development, despite the many uncertainties and questions that accompany it.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The key to successfully navigating offshore development lies in meticulous <strong>planning</strong> from the preparation stage and effective <strong>communication</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>By clearly defining the project\'s purpose and requirements, and sharing a vision that all stakeholders can align with, discrepancies in expectations can be prevented, allowing for smoother progress.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In this article, AIoT, which operates an offshore development business in Vietnam, will introduce the specific steps to successfully advance offshore development, incorporating practical insights, starting with Step 1.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Step 1: Internal Coordination and Establishing Project Structure</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>The most important factor when starting offshore development is internal coordination. For the project to succeed, it is necessary to establish a company-wide framework that includes not only the IT department but also management and related departments. The efforts made at this stage can significantly influence the later progress of the project.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How to Advance Internal Coordination</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">1. Involve Management</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>It is essential to secure the understanding and support of management for the project\'s success. Their recognition of the project\'s importance facilitates smooth budget approval and resource allocation. Regular progress reports and incorporating management feedback can enhance their engagement.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">2. Explain Project Goals and Expected Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>It is crucial to clarify the purpose of offshore development and communicate the anticipated benefits within the company. Demonstrating specific advantages, such as cost reduction and improved development speed, makes it easier to gain company-wide support.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">3. Secure Budget</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Sufficient budget allocation is necessary for the smooth progress of the project. Presenting the project\'s ROI (Return on Investment) to management and explaining the budget\'s validity is key. Once the budget is approved, the project can proceed confidently.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">4. Share Risks and Countermeasures</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Offshore development comes with risks. Identifying these risks in advance and sharing countermeasures increases project transparency and builds trust among stakeholders.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">5. Strengthen Collaboration with Related Departments</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>It is vital to enhance collaboration with all departments involved in the project. Identifying departments involved in requirements definition and clarifying their roles and responsibilities enables efficient work.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">6. Adjust Schedules</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Adjusting schedules to ensure smooth collaboration among departments is essential. Particularly, aligning timelines with the offshore development team is crucial for the project\'s progress.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">7. Establish Communication Structure</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>It is necessary to design a meeting structure that considers time zone differences. Scheduling regular meetings with the offshore team and creating an environment for real-time information sharing is important.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">8. Select Communication Tools</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Appropriate communication tools are essential for efficient information sharing. Choosing chat and project management tools and ensuring that they are user-friendly for everyone is important.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">9. Develop Information Sharing Rules</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Establishing rules for sharing project-related information facilitates smooth information flow among stakeholders, helping to prevent misunderstandings and information loss.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Summary</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>A significant gap between the department handling offshore development and the field can hinder project progress. Particularly, the understanding and support of management are crucial for budget approval and interdepartmental coordination. By addressing these points and advancing internal coordination, a solid foundation for offshore development can be established. Take the first step towards success!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Leave it to us!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT aims to be a trustworthy partner in supporting your business success, solving challenges in offshore development, and building long-term relationships. If you have concerns about offshore development or are considering a new project, please consult us. With rich experience, high technical capabilities, and thorough quality management and security measures, we are committed to leading your business to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Want to achieve both cost reduction and high-quality development?</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Looking to enhance market competitiveness with a speedy development system?</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Seeking to build a long-term relationship with a reliable partner?</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>We are here to meet those needs.<br>Feel free to contact us, and our specialized consultants will propose optimal solutions tailored to your requirements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>For inquiries, please visit the <strong>Contact Us</strong> section or call us at:<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Happy Together!</p>\n<!-- /wp:paragraph -->', 'Steps to Progress Offshore Development: 7 Specific Steps - Part 1', '', 'publish', 'closed', 'closed', '', 'steps-to-progress-offshore-development-7-specific-steps-part-1', '', '', '2025-02-05 13:49:26', '2025-02-05 04:49:26', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=566', 0, 'blog', '', 0),
(568, 1, '2025-02-07 16:47:20', '2025-02-07 07:47:20', '<label> Your name\n    [text* your-name autocomplete:name] </label>\n\n<label> Your email\n    [email* your-email autocomplete:email] </label>\n\n<label> Subject\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit \"Submit\"]\n[_site_title] \"[your-subject]\"\n[_site_title] <info@aiot-fixing.local>\nFrom: [your-name] [your-email]\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis is a notification that a contact form was submitted on your website ([_site_title] [_site_url]).\n[_site_admin_email]\nReply-To: [your-email]\n\n0\n0\n\n[_site_title] \"[your-subject]\"\n[_site_title] <info@aiot-fixing.local>\nMessage Body:\n[your-message]\n\n-- \nThis email is a receipt for your contact form submission on our website ([_site_title] [_site_url]) in which your email address was used. If that was not you, please ignore this message.\n[your-email]\nReply-To: [_site_admin_email]\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nPlease fill out this field.\nThis field has a too long input.\nThis field has a too short input.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe uploaded file is too large.\nThere was an error uploading the file.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2025-02-07 16:47:20', '2025-02-07 07:47:20', '', 0, 'http://localhost:8080/?post_type=wpcf7_contact_form&p=568', 0, 'wpcf7_contact_form', '', 0),
(569, 1, '2025-02-10 17:58:00', '2025-02-10 08:58:00', '<!-- wp:paragraph -->\n<p>前回の記事では、≪<strong>社内体制の構築</strong>≫について紹介させていただきました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>本日は７つのステップPart２、≪<strong>要件の整理</strong>≫について紹介します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>国内での開発と違って、コミュニケーション面で対面よりも限られるため、しっかりとした要件に整理が大切になります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>次のようなことに注意して≪<strong>要件の整理</strong>≫を行ってみましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\">要件の明確化</h1>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">システムで実現したい目的</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>・システムの導入目的を明確に定義します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">期待される効果</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>・システム導入によって得られる具体的な効果を示します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">予算や納期の制約条件</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>・プロジェクトにおける予算や納期の制約を明確にします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">機能要件の具体化</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>・必須機能と追加機能の切り分けを行い、具体的な要件を整理します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>・画面イメージやワイヤーフレームを作成し、視覚的に理解しやすくします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">データ構造やシステム間連携</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>・システム内のデータ構造や、他システムとの連携方法を定義します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">非機能要件の定義</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>・パフォーマンス要件、セキュリティ要件、運用保守要件を明確にします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>特に重要なのは、要件を見える形（書類）で残しておくことです。<br>口頭での説明や認識合わせだけでは、確実な開発は望めません。この書類は社内の関連部門全てで共有し、まずは内部で認識を常に合わせておくことが重要です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">お任せください！</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoTはお客様のビジネス成功を支える信頼できるパートナーとして、オフショア開発における課題を解決し、長期的な関係を築くことを目指しています。ぜひ、AIoTにお任せいただき、共に成功を目指しましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発でお悩みの方、新しいプロジェクトを検討されている方、ぜひ一度当社にご相談ください。私たちは、豊富な実績と高い技術力、そして徹底した品質管理とセキュリティ対策で、お客様のビジネスを成功に導きます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆コスト削減と高品質な開発を両立したい<br>☆スピーディーな開発体制で市場競争力を高めたい<br>☆信頼できるパートナーと共に、長期的な関係を築きたい</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>そんなご要望に、当社はお応えします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>まずはお気軽にお問い合わせください。専門のコンサルタントが、お客様のニーズに合わせた最適なソリューションをご提案いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>お問い合わせは≪お問い合わせ≫より！<br>または、以下の電話番号までお気軽にご連絡ください：<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Happy Together!</h2>\n<!-- /wp:heading -->', 'オフショア開発の進め方：7つの具体的ステップ　Part２', '', 'publish', 'closed', 'closed', '', 'offshore-development-process-7-concrete-steps-part-2', '', '', '2025-07-25 17:50:55', '2025-07-25 08:50:55', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=569', 0, 'blog', '', 0),
(571, 1, '2025-02-10 18:03:12', '2025-02-10 09:03:12', '<!-- wp:paragraph -->\n<p>In the previous article, we introduced the topic of <strong>Establishing an Internal Structure</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Today, in Part 2 of the 7 steps, we will discuss <strong>Requirements Organization</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Unlike domestic development, communication in offshore settings is often limited compared to face-to-face interactions, making it essential to organize requirements thoroughly.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Let’s pay attention to the following aspects while organizing <strong>requirements</strong>:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\">Clarification of Requirements</h1>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Purpose of the System</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Clearly define the objectives for implementing the system.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Expected Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Specify the tangible benefits that will result from the system\'s implementation.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Budget and Deadline Constraints</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Clearly outline the budget and time constraints for the project.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Specification of Functional Requirements</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>・Differentiate between essential and additional features, and organize specific requirements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>・Create screen images and wireframes to enhance visual understanding.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Data Structure and System Integration</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Define the data structure within the system and how it will integrate with other systems.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Definition of Non-Functional Requirements</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Clearly specify performance, security, and operational maintenance requirements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It is particularly important to document the requirements in a visible format (i.e., written documents). Relying solely on verbal explanations or agreement may not ensure successful development. This documentation should be shared with all relevant internal departments to maintain a consistent understanding.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Count on Us!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT aims to be a trusted partner in supporting your business success by addressing challenges in offshore development and building long-term relationships. We invite you to rely on AIoT as we strive for success together.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are facing challenges with offshore development or considering a new project, please consult with us. We bring extensive experience, high technical expertise, and meticulous quality management and security measures to guide your business toward success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\"><strong>☆Looking to balance cost reduction with high-quality development?</strong></h4>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\">☆<strong>Want to enhance market competitiveness with a speedy development process?</strong></h4>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\">☆<strong>Seeking to build a long-term relationship with a reliable partner?</strong></h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our company is here to meet those needs.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Feel free to reach out to us. Our specialized consultants will propose the optimal solutions tailored to your needs.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>For inquiries, please visit the <strong>Contact Us</strong> page!<br>Alternatively, feel free to call us at:<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Happy Together!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Offshore Development Process: 7 Concrete Steps - Part 2', '', 'publish', 'closed', 'closed', '', 'offshore-development-process-7-concrete-steps-part-2', '', '', '2025-02-10 18:03:12', '2025-02-10 09:03:12', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=571', 0, 'blog', '', 0),
(574, 1, '2025-03-04 17:04:46', '2025-03-04 08:04:46', '<!-- wp:paragraph -->\n<p>オフショア開発を初めて検討する企業にとって、その道のりにはさまざまな悩みが伴います。特に、言語や文化の違いからくるコミュニケーションの不安は大きな課題です。また、開発品質が国内の基準に達するかどうかの心配も尽きません。さらに、時差やリモート環境での進捗管理の難しさに頭を悩ませる企業も少なくありません。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>信頼できる開発会社を見つけることや、コストの透明性を確保することも大きな関心事です。法的な契約や知的財産権の保護についての疑問も、オフショア開発を進める上での大きな障害となります。そして、異なる文化的背景がプロジェクトに与える影響を考慮することも忘れてはならないポイントです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>このように、初めてのオフショア開発には多くの不安や疑問がつきまとう中、成功へと導くための手順を見つけることが求められています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>オフショア開発を成功させるための鍵は、<mark>準備段階からの綿密な≪プランニング≫と効果的な≪コミュニケーション≫</mark>にあります。</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>プロジェクトの目的や要件を明確に定義し、関係者全員が共有できるビジョンを持つことで期待値のズレを防ぎ、スムーズな進行が可能になります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>この記事では、ベトナムでオフショア開発事業を展開するAIoTが、オフショア開発の具体的な進め方と最適な見つけ方を実践的な知見を交えながら7つのステップのステップ３について紹介します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">ステップ3：ベンダー選定と見積もり依頼</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>要件が整理できたら、それを基にベンダーの選定を行います。具体的には、RFI（情報提供依頼書）を送付し、候補を絞り込むプロセスに入ります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>まず重要なのは、秘密保持契約（NDA）を締結することです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>オフショア開発においては、見積もり依頼の段階で自社の機密情報をベンダーと共有する必要があります。具体的な相談を開始する前に、必ずNDAを結ぶことが求められます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>NDAで確認すべき主なポイントは以下の通りです：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>秘密情報の定義とその範囲</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>情報の管理方法</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>契約の有効期間と義務の存続期間</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>違反時の罰則規定</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>準拠法および管轄裁判所</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>NDAを締結した後は、次の点に留意しながらベンダー選定を進めます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>複数のベンダーに対して見積もりを依頼すること</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>技術力だけでなく、コミュニケーション能力も重視すること</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>日本語でのやり取りが可能か確認すること</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>過去の類似プロジェクトに関する実績を調査すること</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>これらの要素を考慮したRFP（提案依頼書）を作成し、見積もりと提案の依頼を行います。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>見積もりを依頼する際には、Step2で作成した要件定義書を基に、できる限り詳細な情報を提供するよう心掛けましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">お任せください！</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoTはお客様のビジネス成功を支える信頼できるパートナーとして、オフショア開発における課題を解決し、長期的な関係を築くことを目指しています。ぜひ、AIoTにお任せいただき、共に成功を目指しましょう。<br>オフショア開発でお悩みの方、新しいプロジェクトを検討されている方、ぜひ一度当社にご相談ください。私たちは、豊富な実績と高い技術力、そして徹底した品質管理とセキュリティ対策で、お客様のビジネスを成功に導きます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br>☆コスト削減と高品質な開発を両立したい<br>☆スピーディーな開発体制で市場競争力を高めたい<br>☆信頼できるパートナーと共に、長期的な関係を築きたい</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br>そんなご要望に、当社はお応えします。<br>まずはお気軽にお問い合わせください。専門のコンサルタントが、お客様のニーズに合わせた最適なソリューションをご提案いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>お問い合わせは≪お問い合わせ≫より！<br>または、以下の電話番号までお気軽にご連絡ください：<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Happy Together!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'オフショア開発の進め方：7つの具体的ステップ　Part3', '', 'publish', 'closed', 'closed', '', 'how-to-proceed-with-offshore-development-7-specific-steps-part-3', '', '', '2025-07-25 17:52:43', '2025-07-25 08:52:43', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=574', 0, 'blog', '', 0),
(575, 1, '2025-03-04 17:09:09', '2025-03-04 08:09:09', '<!-- wp:paragraph -->\n<p>For companies considering offshore development for the first time, there are various challenges along the way. In particular, concerns about communication arising from language and cultural differences are significant hurdles. Additionally, there are ongoing worries about whether the development quality will meet domestic standards. Many companies also struggle with the difficulties of progress management in remote environments and time zone differences.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Finding a reliable development company and ensuring cost transparency are also major concerns. Questions regarding legal contracts and the protection of intellectual property rights pose significant obstacles to advancing offshore development. Furthermore, it is crucial to consider the impact that different cultural backgrounds can have on the project.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In this way, there are many anxieties and uncertainties surrounding first-time offshore development, and it is essential to find the steps that lead to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The key to successful offshore development lies in meticulous <strong>planning</strong> from the preparation stage and effective <strong>communication</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>By clearly defining the project’s objectives and requirements and having a shared vision among all stakeholders, discrepancies in expectations can be prevented, allowing for smoother progress.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In this article, AIoT, which operates offshore development projects in Vietnam, will introduce the specific steps for advancing offshore development and the best practices for finding partners, focusing on Step 3 of the seven steps.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Step 3: Vendor Selection and Request for Quotation</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Once the requirements are organized, the next step is to select vendors based on that information. Specifically, this involves sending out a Request for Information (RFI) and entering the process of narrowing down candidates.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The first important step is to establish a Non-Disclosure Agreement (NDA).</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In offshore development, it is necessary to share confidential information with the vendor during the quotation request stage. Before initiating specific discussions, it is essential to sign an NDA.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Key points to confirm in the NDA include:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Definition and scope of confidential information</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Management methods for the information</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Duration of the contract and the period of obligation</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Penalty provisions for breaches</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Governing law and jurisdiction</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>After signing the NDA, proceed with vendor selection while keeping the following points in mind:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Request quotations from multiple vendors</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Emphasize not only technical skills but also communication abilities</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Confirm whether they can communicate in Japanese</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Research past accomplishments related to similar projects</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Create a Request for Proposal (RFP) considering these elements and request quotations and proposals.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>When requesting estimates, make sure to provide as much detailed information as possible based on the requirements document created in Step 2.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Leave it to us!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT aims to be a reliable partner supporting your business success by solving challenges in offshore development and building long-term relationships. We invite you to trust AIoT and strive for success together.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are struggling with offshore development or considering a new project, please consult us. With our extensive experience, high technical skills, and thorough quality management and security measures, we will guide your business to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>☆ We want to achieve cost reduction while maintaining high-quality development.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>☆ We want to enhance market competitiveness with a speedy development system.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>☆ We want to build long-term relationships with a reliable partner.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>We are here to meet those needs.<br>Feel free to contact us first. Our specialized consultants will propose the best solutions tailored to your needs.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>For inquiries, please visit the [Contact Us] page!<br>Or feel free to reach us at the following phone number:<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Happy Together!</p>\n<!-- /wp:paragraph -->', 'How to Proceed with Offshore Development: 7 Specific Steps – Part 3', '', 'publish', 'closed', 'closed', '', 'how-to-proceed-with-offshore-development-7-specific-steps-part-3', '', '', '2025-03-04 17:09:09', '2025-03-04 08:09:09', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=575', 0, 'blog', '', 0),
(584, 1, '2025-03-12 18:00:03', '2025-03-12 09:00:03', '<!-- wp:paragraph -->\n<p>オフショア開発を初めて検討する企業にとって、その道のりにはさまざまな悩みが伴います。特に、言語や文化の違いからくるコミュニケーションの不安は大きな課題です。また、開発品質が国内の基準に達するかどうかの心配も尽きません。さらに、時差やリモート環境での進捗管理の難しさに頭を悩ませる企業も少なくありません。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>信頼できる開発会社を見つけることや、コストの透明性を確保することも大きな関心事です。法的な契約や知的財産権の保護についての疑問も、オフショア開発を進める上での大きな障害となります。そして、異なる文化的背景がプロジェクトに与える影響を考慮することも忘れてはならないポイントです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>このように、初めてのオフショア開発には多くの不安や疑問がつきまとう中、成功へと導くための手順を見つけることが求められています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>オフショア開発を成功させるための鍵は、<mark>準備段階からの綿密な≪プランニング≫と効果的な≪コミュニケーション≫</mark>にあります。</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>プロジェクトの目的や要件を明確に定義し、関係者全員が共有できるビジョンを持つことで期待値のズレを防ぎ、スムーズな進行が可能になります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>この記事では、ベトナムでオフショア開発事業を展開するAIoTが、オフショア開発の具体的な進め方と最適な見つけ方を実践的な知見を交えながら7つのステップのステップ３について紹介します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Step4：契約と社内体制整備</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">1. コミュニケーション体制</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>定期的なミーティング</strong><br>プロジェクトの進捗確認や問題解決のために、定期的なオンラインミーティングを設定します。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>情報共有ツールの導入</strong><br>SlackやTeamsなどのコミュニケーションツールを使用して、リアルタイムで情報を共有します。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2. プロジェクト管理</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>プロジェクトマネージャーの選定</strong><br>オフショアチームと連携し、プロジェクト全体を管理するプロジェクトマネージャーを選任します。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>タスク管理システムの使用</strong><br>JIRAやTrelloなどのプロジェクト管理ツールを用いて、タスクの進捗を管理します。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3. 品質管理</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>品質保証体制の構築</strong><br>定期的なコードレビューやテストを実施し、品質を確保します。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>基準の設定</strong><br>成果物の品質基準や検収プロセスを明確にし、オフショアチームに周知します。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4. 知識の共有と教育</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>オンボーディングプログラム</strong><br>オフショアチームがプロジェクトに迅速に適応できるよう、オンボーディングプログラムを準備します。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>技術的なトレーニング</strong><br>必要な技術やツールに関するトレーニングを定期的に行います。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">5. リスク管理</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>リスクアセスメント</strong><br>プロジェクトにおけるリスクを事前に特定し、対策を講じる体制を整えます。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>問題解決プロセス</strong><br>問題が発生した際の対応フローを明確にしておきます。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">請負契約における支払い</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>請負契約の場合、一般的には以下のような支払い形態が採用されます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>前払い金の支払い</strong><br>契約締結時に、プロジェクト開始前のリソース確保や準備費用として、契約金額の一定割合（通常20%〜30%）を前払いします。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>マイルストーンベースの支払い</strong><br>プロジェクトの進捗に応じて、定められたマイルストーンの達成時に支払いを行います。成果物の品質を確認しながら進めることができる方法です。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>最終納品時の支払い</strong><br>プロジェクトの最終納品前に、残りの契約金額の一定割合を支払います。この際に、検収条件を満たしていることが求められます。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li></li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">お任せください！</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoTはお客様のビジネス成功を支える信頼できるパートナーとして、オフショア開発における課題を解決し、長期的な関係を築くことを目指しています。ぜひ、AIoTにお任せいただき、共に成功を目指しましょう。<br>オフショア開発でお悩みの方、新しいプロジェクトを検討されている方、ぜひ一度当社にご相談ください。私たちは、豊富な実績と高い技術力、そして徹底した品質管理とセキュリティ対策で、お客様のビジネスを成功に導きます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br>☆コスト削減と高品質な開発を両立したい<br>☆スピーディーな開発体制で市場競争力を高めたい<br>☆信頼できるパートナーと共に、長期的な関係を築きたい<br><br>そんなご要望に、当社はお応えします。<br>まずはお気軽にお問い合わせください。専門のコンサルタントが、お客様のニーズに合わせた最適なソリューションをご提案いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>お問い合わせは≪お問い合わせ≫より！<br>または、以下の電話番号までお気軽にご連絡ください：<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Happy Together!</p>\n<!-- /wp:paragraph -->', 'オフショア開発の進め方：7つの具体的ステップ　Part4', '', 'publish', 'closed', 'closed', '', 'how-to-proceed-with-offshore-development-7-specific-steps-part-4', '', '', '2025-07-28 16:53:53', '2025-07-28 07:53:53', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=584', 0, 'blog', '', 0),
(585, 1, '2025-03-12 18:03:10', '2025-03-12 09:03:10', '<!-- wp:paragraph -->\n<p>For companies considering offshore development for the first time, there are various challenges along the way. In particular, concerns about communication due to language and cultural differences are significant issues. Additionally, worries about whether the development quality will meet domestic standards persist. Furthermore, many companies struggle with progress management in a remote environment and the challenges posed by time zone differences.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Finding a reliable development company and ensuring cost transparency are also major concerns. Legal contracts and the protection of intellectual property rights represent significant obstacles to advancing offshore development. It\'s essential to consider the impact that different cultural backgrounds may have on the project.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Thus, as many anxieties and questions accompany the initial steps into offshore development, it is crucial to find a clear path to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The key to successful offshore development lies in meticulous <strong>planning</strong> from the preparation stage and effective <strong>communication</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>By clearly defining the project\'s objectives and requirements and ensuring that all stakeholders share a common vision, you can prevent misalignments in expectations and facilitate smooth progress.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In this article, AIoT, which operates offshore development projects in Vietnam, will introduce the practical steps to advance offshore development, focusing on Step 3 of the seven-step process.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Step 4: Contracts and Internal System Setup</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Communication System</strong><!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Regular Meetings</strong><br>Set up regular online meetings for project progress checks and problem-solving.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Information Sharing Tools</strong><br>Use communication tools like Slack or Teams to share information in real-time.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Project Management</strong><!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Selection of Project Manager</strong><br>Appoint a project manager to manage the overall project in collaboration with the offshore team.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Use of Task Management Systems</strong><br>Utilize project management tools such as JIRA or Trello to track task progress.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Quality Management</strong><!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Establish Quality Assurance System</strong><br>Conduct regular code reviews and tests to ensure quality.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Set Standards</strong><br>Clearly define quality standards for deliverables and the acceptance process, sharing this information with the offshore team.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Knowledge Sharing and Training</strong><!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Onboarding Program</strong><br>Prepare an onboarding program to help the offshore team adapt quickly to the project.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Technical Training</strong><br>Conduct regular training sessions on necessary technologies and tools.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Risk Management</strong><!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Risk Assessment</strong><br>Identify potential project risks in advance and establish a system to address them.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Problem-Solving Process</strong><br>Clearly outline the response flow for any issues that may arise.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Payment Structure in a Contract</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>In a typical contract, the following payment structures are generally adopted:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Advance Payment</strong><br>At the time of contract signing, an advance payment of a certain percentage (usually 20% to 30%) of the contract amount is made for resource allocation and preparation costs before the project starts.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Milestone-Based Payments</strong><br>Payments are made upon achieving defined project milestones. This method allows for quality checks of deliverables as the project progresses.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Final Payment Upon Delivery</strong><br>Before the final delivery of the project, a certain percentage of the remaining contract amount is paid, contingent on meeting acceptance criteria.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Trust Us!</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT aims to be a reliable partner that supports your business success by addressing the challenges of offshore development and building long-term relationships. Please entrust your needs to AIoT, and let’s work together towards success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are struggling with offshore development or considering a new project, please consult us. We possess abundant experience, high technical capabilities, and thorough quality management and security measures to guide your business to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>☆ I want to balance cost reduction with high-quality development.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>☆ I want to enhance market competitiveness with a speedy development system.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>☆ I want to build a long-term relationship with a trusted partner.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>We are here to meet those needs.<br>Feel free to contact us. Our specialized consultants will propose optimal solutions tailored to your requirements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>For inquiries, please visit the <strong>Contact Us</strong> page!<br>Alternatively, feel free to reach us at the following phone number:<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Happy Together!</p>\n<!-- /wp:paragraph -->', 'How to Proceed with Offshore Development: 7 Specific Steps – Part 4', '', 'publish', 'closed', 'closed', '', 'how-to-proceed-with-offshore-development-7-specific-steps-part-4', '', '', '2025-03-12 18:03:10', '2025-03-12 09:03:10', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=585', 0, 'blog', '', 0),
(595, 2, '2025-03-17 12:30:17', '2025-03-17 03:30:17', '', 'AIoTシステム開発ギャラリー', 'mo ta', 'publish', 'closed', 'closed', '', 'aiot-projects', '', '', '2025-03-17 12:31:30', '2025-03-17 03:31:30', '', 0, 'http://localhost:8080/?page_id=595', 0, 'page', '', 0),
(606, 1, '2025-03-17 12:36:22', '2025-03-17 03:36:22', '<!-- wp:paragraph -->\n<p><strong>種別</strong>: WEB、アプリ</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>既存越境ECプラットフォームの運用・保守、追加機能実装、並びに、新規越境ECプラットフォームの構築。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p> <strong>導入先</strong>: Eコマース 事業者</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '越境ECサイトプラットフォーム構築', '', 'publish', 'closed', 'closed', '', 'child-page-aiot-2', '', '', '2025-03-17 22:06:13', '2025-03-17 13:06:13', '', 595, 'http://localhost:8080/?page_id=606', 0, 'page', '', 0),
(609, 1, '2025-03-17 12:38:47', '2025-03-17 03:38:47', '', 'AIOT PROJECTS', '', 'publish', 'closed', 'closed', '', 'aiot-projects', '', '', '2025-03-17 12:38:48', '2025-03-17 03:38:48', '', 0, 'http://localhost:8080/?page_id=609', 0, 'page', '', 0),
(613, 2, '2025-03-17 22:04:38', '2025-03-17 13:04:38', '', '133444258000458214', '', 'inherit', 'open', 'closed', '', '133444258000458214', '', '', '2025-03-17 22:04:38', '2025-03-17 13:04:38', '', 606, 'http://localhost:8080/wp-content/uploads/2025/03/202503171304-133444258000458214.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(616, 2, '2025-03-17 22:18:51', '2025-03-17 13:18:51', '<!-- wp:paragraph -->\n<p><strong>種別</strong>: WEB</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>橋梁の諸元データや点検データ、補修データを取り込み、データの集計や閲覧、帳票・公開資料の自動作成等を可能に。またAI等を使用し、統一的なデータ分析による予算の平準化、補修の対策優先順位の評価などができるように適切にデータ蓄積ができるシステムの構築。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>導入先</strong>: 建設コンサルティング事業者</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '橋梁管理システム', '', 'publish', 'closed', 'closed', '', '%e6%a9%8b%e6%a2%81%e7%ae%a1%e7%90%86%e3%82%b7%e3%82%b9%e3%83%86%e3%83%a0', '', '', '2025-03-17 22:18:51', '2025-03-17 13:18:51', '', 595, 'http://localhost:8080/?page_id=616', 0, 'page', '', 0),
(617, 2, '2025-03-17 22:18:27', '2025-03-17 13:18:27', '', 'crm-la-gi', '', 'inherit', 'open', 'closed', '', 'crm-la-gi', '', '', '2025-03-17 22:18:27', '2025-03-17 13:18:27', '', 616, 'http://localhost:8080/wp-content/uploads/2025/03/202503171318-crm-la-gi.webp', 0, 'attachment', 'image/webp', 0),
(619, 2, '2025-03-18 11:30:47', '2025-03-18 02:30:47', '<!-- wp:paragraph -->\n<p><strong>種別</strong>: WEB<br>「CCTVカメラ」「気象情報」「震度情報」「レーダー雨量」「AIを使用した異常検知機能」を実装したポータルサイト。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>導入先</strong>: 建設コンサルティング事業者</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '防災業務支援ポータルサイト構築', '', 'publish', 'closed', 'closed', '', '%e9%98%b2%e7%81%bd%e6%a5%ad%e5%8b%99%e6%94%af%e6%8f%b4%e3%83%9d%e3%83%bc%e3%82%bf%e3%83%ab%e3%82%b5%e3%82%a4%e3%83%88%e6%a7%8b%e7%af%89', '', '', '2025-03-18 11:30:47', '2025-03-18 02:30:47', '', 595, 'http://localhost:8080/?page_id=619', 0, 'page', '', 0),
(620, 2, '2025-03-18 11:30:00', '2025-03-18 02:30:00', '', 'gis-quan-ly-thien-tai-300x237', '', 'inherit', 'open', 'closed', '', 'gis-quan-ly-thien-tai-300x237', '', '', '2025-03-18 11:30:00', '2025-03-18 02:30:00', '', 619, 'http://localhost:8080/wp-content/uploads/2025/03/202503180230-gis-quan-ly-thien-tai-300x237-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(622, 2, '2025-03-18 11:35:41', '2025-03-18 02:35:41', '<!-- wp:paragraph -->\n<p><strong>種別</strong>: WEB</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>マクロの詳細設計並びに実装・テスト</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>導入先</strong>: 建設コンサルティング事業者、その他</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'マクロ作成', '', 'publish', 'closed', 'closed', '', '%e3%83%9e%e3%82%af%e3%83%ad%e4%bd%9c%e6%88%90', '', '', '2025-03-18 11:42:14', '2025-03-18 02:42:14', '', 595, 'http://localhost:8080/?page_id=622', 0, 'page', '', 0),
(623, 2, '2025-03-18 11:34:29', '2025-03-18 02:34:29', '', 'nang-luong-tai-tao111', '', 'inherit', 'open', 'closed', '', 'nang-luong-tai-tao111', '', '', '2025-03-18 11:34:29', '2025-03-18 02:34:29', '', 622, 'http://localhost:8080/wp-content/uploads/2025/03/202503180234-nang-luong-tai-tao111.png', 0, 'attachment', 'image/png', 0),
(632, 1, '2025-03-24 17:24:36', '2025-03-24 08:24:36', '<!-- wp:paragraph -->\n<p>オフショア開発を初めて検討する企業にとって、その道のりにはさまざまな悩みが伴います。特に、言語や文化の違いからくるコミュニケーションの不安は大きな課題です。また、開発品質が国内の基準に達するかどうかの心配も尽きません。さらに、時差やリモート環境での進捗管理の難しさに頭を悩ませる企業も少なくありません。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>信頼できる開発会社を見つけることや、コストの透明性を確保することも大きな関心事です。法的な契約や知的財産権の保護についての疑問も、オフショア開発を進める上での大きな障害となります。そして、異なる文化的背景がプロジェクトに与える影響を考慮することも忘れてはならないポイントです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>このように、初めてのオフショア開発には多くの不安や疑問がつきまとう中、成功へと導くための手順を見つけることが求められています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>オフショア開発を成功させるための鍵は、<mark>準備段階からの綿密な≪プランニング≫と効果的な≪コミュニケーション≫</mark>にあります。</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>プロジェクトの目的や要件を明確に定義し、関係者全員が共有できるビジョンを持つことで期待値のズレを防ぎ、スムーズな進行が可能になります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>この記事では、ベトナムでオフショア開発事業を展開するAIoTが、オフショア開発の具体的な進め方と最適な見つけ方を実践的な知見を交えながら7つのステップのステップ5について紹介します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"fontSize\":\"l\"} -->\n<h2 class=\"wp-block-heading has-l-font-size\">ステップ5：キックオフミーティングの実施</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>キックオフミーティングは、プロジェクトの成功に向けた重要なステップです。このミーティングでは、以下の内容を詳細に確認し、全員の理解を深めることを目的とします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">1. プロジェクトの目的と目標の共有</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>　‐ <strong>目的の明確化</strong>： プロジェクトが解決しようとしている問題やニーズを具体的に説明します。この目的がチーム全体の共通理解となるよう、関係者からの意見を聞く時間を設けます。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>　‐ <strong>SMART目標の設定</strong>： 具体的（Specific）、測定可能（Measurable）、達成可能（Achievable）、関連性（Relevant）、期限（Time-bound）の基準に基づいた目標を設定し、各メンバーがそれに向けて動けるようにします。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2. 開発スケジュールの確認</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>　‐ <strong>マイルストーンの設定</strong>： プロジェクトの主要なマイルストーンを定義し、各段階での重要な成果物や納期を確認します。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>　‐ <strong>タスクの優先順位付け</strong>： 各タスクの重要度を評価し、優先順位をつけることで、リソースの効果的な配分を図ります。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3. 役割分担の明確化</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>　‐ <strong>各メンバーの役割</strong>： チームメンバーの役割や責任を明確にし、誰が何を担当するのかを具体的に示します。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>　‐ <strong>リーダーシップの設定</strong>： プロジェクトリーダーやサブリーダーを決定し、意思決定プロセスを明確にします。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4. コミュニケーション方法の確立</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>　‐ <strong>連絡手段の選定</strong>： メール、チャットツール、定期的な会議など、コミュニケーションの手段を決定します。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>　‐ <strong>情報共有のルール</strong>： 進捗状況や問題点を共有するための定期的な報告の頻度や形式を設定します。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">5. 課題管理の方法の合意</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>　‐ <strong>課題管理ツールの選定</strong>： 課題を追跡・管理するためのツール（例：JIRA、Trelloなど）を選定し、全員がその使用方法を理解します。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>　‐ <strong>優先順位の付け方</strong>： 課題の優先順位をどのように決定するか、基準やプロセスを合意します。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>キックオフミーティングは、プロジェクトの基盤を築くための重要な機会です。全員が同じ方向を向いて進むために、これらのポイントを丁寧に確認し、合意形成を図ることが求められます。管理メンバー、開発メンバー可能であれば全員が参加し、意見を出し合うことで、より良いプロジェクトを実現するための土台を築きましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"fontSize\":\"l\"} -->\n<h2 class=\"wp-block-heading has-l-font-size\">お任せください！</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoTはお客様のビジネス成功を支える信頼できるパートナーとして、オフショア開発における課題を解決し、長期的な関係を築くことを目指しています。ぜひ、AIoTにお任せいただき、共に成功を目指しましょう。<br>オフショア開発でお悩みの方、新しいプロジェクトを検討されている方、ぜひ一度当社にご相談ください。私たちは、豊富な実績と高い技術力、そして徹底した品質管理とセキュリティ対策で、お客様のビジネスを成功に導きます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br>☆コスト削減と高品質な開発を両立したい<br>☆スピーディーな開発体制で市場競争力を高めたい<br>☆信頼できるパートナーと共に、長期的な関係を築きたい</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br>そんなご要望に、当社はお応えします。<br>まずはお気軽にお問い合わせください。専門のコンサルタントが、お客様のニーズに合わせた最適なソリューションをご提案いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>お問い合わせは≪お問い合わせ≫より！<br>または、以下の電話番号までお気軽にご連絡ください：<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Happy Together!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'オフショア開発の進め方：7つの具体的ステップ　Part 5', '', 'publish', 'closed', 'closed', '', 'how-to-proceed-with-offshore-development-7-specific-steps-part-5', '', '', '2025-07-25 17:52:34', '2025-07-25 08:52:34', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=632', 0, 'blog', '', 0),
(634, 1, '2025-03-24 17:30:50', '2025-03-24 08:30:50', '<!-- wp:paragraph -->\n<p>For companies considering offshore development for the first time, the journey comes with various concerns. In particular, communication issues arising from language and cultural differences pose significant challenges. There are also worries about whether the development quality will meet domestic standards. Additionally, many companies struggle with the difficulties of progress management in a remote environment and dealing with time zone differences.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Finding a reliable development company and ensuring cost transparency are also major concerns. Questions about legal contracts and the protection of intellectual property rights can be significant obstacles to advancing offshore development. Furthermore, it is essential to consider the impact of different cultural backgrounds on the project.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Given these many uncertainties and questions associated with first-time offshore development, it is crucial to find steps that lead to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The key to successful offshore development lies in meticulous <strong>planning</strong> from the preparation stage and effective <strong>communication</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>By clearly defining the project’s objectives and requirements, and having a shared vision among all stakeholders, discrepancies in expectations can be avoided, allowing for smooth progress.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In this article, AIoT, which operates offshore development projects in Vietnam, introduces the fifth step of a seven-step process on how to proceed with offshore development, along with practical insights.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Step 5: Conducting a Kick-off Meeting</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>The kick-off meeting is a vital step toward the success of the project. In this meeting, the following points will be reviewed in detail to enhance understanding among all participants:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li>1. <strong>Sharing the Project\'s Purpose and Goals</strong><!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>　- <strong>Clarification of Purpose</strong>: Specifically explain the problems or needs the project aims to resolve. Time will be allocated to gather opinions from stakeholders to ensure a common understanding of this purpose among the entire team.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>　- <strong>Setting SMART Goals</strong>: Establish goals based on the criteria of being Specific, Measurable, Achievable, Relevant, and Time-bound, allowing each member to work toward these objectives.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>2. <strong>Reviewing the Development Schedule</strong><!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>　- <strong>Setting Milestones</strong>: Define the main milestones of the project and confirm important deliverables and deadlines at each stage.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>　- <strong>Prioritizing Tasks</strong>: Evaluate the importance of each task and prioritize them to effectively allocate resources.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>3. <strong>Clarifying Roles and Responsibilities</strong><!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>　- <strong>Defining Member Roles</strong>: Clearly outline the roles and responsibilities of team members, specifying who is in charge of what.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>　- <strong>Establishing Leadership</strong>: Determine the project leader and sub-leaders, clarifying the decision-making process.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>4. <strong>Establishing Communication Methods</strong><!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>　- <strong>Choosing Communication Channels</strong>: Decide on communication methods such as email, chat tools, and regular meetings.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>　- <strong>Setting Information Sharing Rules</strong>: Establish the frequency and format of regular reports to share progress and issues.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>5. <strong>Agreeing on Issue Management Methods</strong><!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>　- <strong>Selecting Issue Management Tools</strong>: Choose tools for tracking and managing issues (e.g., JIRA, Trello) and ensure everyone understands how to use them.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>　- <strong>Determining Prioritization Methods</strong>: Agree on the criteria and processes for determining the priority of issues.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>The kick-off meeting is an important opportunity to lay the foundation for the project. It is essential to carefully review these points and form agreements so that everyone is aligned. If possible, all management and development members should participate and share their opinions to build a solid foundation for a better project.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Leave it to us!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT aims to be a trusted partner supporting your business success by solving challenges in offshore development and building long-term relationships. We invite you to trust AIoT as we strive for success together.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are struggling with offshore development or considering a new project, please consult with us. With our extensive experience, high technical capabilities, and thorough quality management and security measures, we will lead your business to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>・<strong>Want to achieve both cost reduction and high-quality development?</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>・<strong>Want to enhance market competitiveness with a speedy development system?</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>・<strong>Want to build a long-term relationship with a reliable partner?</strong></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>We are here to meet those needs. Please feel free to contact us. Our specialized consultants will propose optimal solutions tailored to your requirements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>For inquiries, please visit the <strong>Contact Us</strong> page!<br>Or feel free to reach us at the following phone number:<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Happy Together!</h2>\n<!-- /wp:heading -->', 'How to Proceed with Offshore Development: 7 Specific Steps – Part 5', '', 'publish', 'closed', 'closed', '', 'how-to-proceed-with-offshore-development-7-specific-steps-part-5', '', '', '2025-03-24 17:30:51', '2025-03-24 08:30:51', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=634', 0, 'blog', '', 0),
(635, 2, '2025-03-26 16:21:11', '0000-00-00 00:00:00', '<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>開発内容 </strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Administrator/Editor Back office:<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Input / edit / delete page information</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Collect the application form</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>User front:<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>List seminar</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Detail seminar</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Application form</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list --></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:spacer {\"height\":\"30px\"} -->\n<div style=\"height:30px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\"><strong>金額内訳 (Pricing Details)</strong></h4>\n<!-- /wp:heading -->\n\n<!-- wp:table -->\n<figure class=\"wp-block-table\"><table class=\"has-fixed-layout\"><tbody><tr><th>項目 (Description)</th><th>単価 (Unit Price)</th><th>数量 (Quantity)</th><th>合計 (Total)</th></tr><tr><td>WordPress Development</td><td>2,500 USD</td><td>3</td><td>7,500 USD</td></tr></tbody></table></figure>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p><strong>合計金額 (Total Amount):</strong>&nbsp;<strong>7,500 USD</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>備考 (Notes):</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>上記金額にはデザイン、開発、テストが含まれます。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>追加要件が発生した場合、別途費用が発生する可能性があります。</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>本見積書の有効期限は [有効期限日] までです。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p><strong>AIoT</strong></p>\n<!-- /wp:paragraph -->', '見積書', '', 'draft', 'closed', 'closed', '', '', '', '', '2025-03-26 16:21:11', '2025-03-26 07:21:11', '', 0, 'http://localhost:8080/?page_id=635', 0, 'page', '', 0),
(654, 1, '2025-03-31 16:00:02', '2025-03-31 07:00:02', '<!-- wp:paragraph -->\n<p>オフショア開発を初めて検討する企業にとって、その道のりにはさまざまな悩みが伴います。特に、言語や文化の違いからくるコミュニケーションの不安は大きな課題です。また、開発品質が国内の基準に達するかどうかの心配も尽きません。さらに、時差やリモート環境での進捗管理の難しさに頭を悩ませる企業も少なくありません。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>信頼できる開発会社を見つけることや、コストの透明性を確保することも大きな関心事です。法的な契約や知的財産権の保護についての疑問も、オフショア開発を進める上での大きな障害となります。そして、異なる文化的背景がプロジェクトに与える影響を考慮することも忘れてはならないポイントです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>このように、初めてのオフショア開発には多くの不安や疑問がつきまとう中、成功へと導くための手順を見つけることが求められています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>オフショア開発を成功させるための鍵は、<mark>準備段階からの綿密な≪プランニング≫と効果的な≪コミュニケーション≫</mark>にあります。</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>プロジェクトの目的や要件を明確に定義し、関係者全員が共有できるビジョンを持つことで期待値のズレを防ぎ、スムーズな進行が可能になります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>この記事では、ベトナムでオフショア開発事業を展開するAIoTが、オフショア開発の具体的な進め方と最適な見つけ方を実践的な知見を交えながら7つのステップのステップ6について紹介します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">ステップ6：進捗管理と品質管理の実施</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>開発開始後には定期的な【進捗管理】と【品質管理】が重要になります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>このような内容に注意して定期的な確認を行うようにしてみましょう！</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>①週ごとの定例ミーティングの実施</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>②品質メトリクスの測定と評価</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>③リスク管理とリスク対策方法の確認</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>④課題の管理とフォロー</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>よくオフショア開発に失敗している企業に見られることとしては「オフショアだから仕方ない」と問題の早期解決を行わずに、問題が大きくなってから、多くのリソースを使って解決しようとする動きです。オフショアだからこそ、いつも以上に問題に気をつけながら進捗管理をする必要があります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>当社AIoTでは、全てお客様の責任だとは考えずに細かい問題も当事者意識を持ち自発的に対処させていただいております。つまり、他の拠点に比べて日本人のマインドに限りなく近いエンジニアたちとのプロジェクト進行が可能です！</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">お任せください！</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoTはお客様のビジネス成功を支える信頼できるパートナーとして、オフショア開発における課題を解決し、長期的な関係を築くことを目指しています。ぜひ、AIoTにお任せいただき、共に成功を目指しましょう。<br>オフショア開発でお悩みの方、新しいプロジェクトを検討されている方、ぜひ一度当社にご相談ください。私たちは、豊富な実績と高い技術力、そして徹底した品質管理とセキュリティ対策で、お客様のビジネスを成功に導きます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br>☆コスト削減と高品質な開発を両立したい<br>☆スピーディーな開発体制で市場競争力を高めたい<br>☆信頼できるパートナーと共に、長期的な関係を築きたい</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br>そんなご要望に、当社はお応えします。<br>まずはお気軽にお問い合わせください。専門のコンサルタントが、お客様のニーズに合わせた最適なソリューションをご提案いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>お問い合わせは≪お問い合わせ≫より！<br>または、以下の電話番号までお気軽にご連絡ください：<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Happy Together!</h2>\n<!-- /wp:heading -->', 'オフショア開発の進め方：7つの具体的ステップ　Part 6', '', 'publish', 'closed', 'closed', '', 'how-to-proceed-with-offshore-development-7-specific-steps-part-6', '', '', '2025-07-25 17:45:22', '2025-07-25 08:45:22', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=654', 0, 'blog', '', 0),
(655, 1, '2025-03-31 16:04:20', '2025-03-31 07:04:20', '<!-- wp:paragraph -->\n<p>For companies considering offshore development for the first time, the journey comes with various concerns. In particular, communication issues arising from language and cultural differences pose significant challenges. There are also worries about whether the development quality will meet domestic standards. Additionally, many companies struggle with the difficulties of progress management in a remote environment and dealing with time zone differences.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Finding a reliable development company and ensuring cost transparency are also major concerns. Questions about legal contracts and the protection of intellectual property rights can be significant obstacles to advancing offshore development. Furthermore, it is essential to consider the impact of different cultural backgrounds on the project.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Given these many uncertainties and questions associated with first-time offshore development, it is crucial to find steps that lead to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The key to successful offshore development lies in meticulous&nbsp;<strong>planning</strong>&nbsp;from the preparation stage and effective&nbsp;<strong>communication</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>By clearly defining the project’s objectives and requirements, and having a shared vision among all stakeholders, discrepancies in expectations can be avoided, allowing for smooth progress.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In this article, AIoT, which operates offshore development projects in Vietnam, introduces the sixth step of a seven-step process on how to proceed with offshore development, along with practical insights.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Step 6: Implementation of Progress Management and Quality Control</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>After the development starts, regular <strong>progress management</strong> and <strong>quality control</strong> become crucial.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Let\'s aim to conduct regular checks with this focus in mind!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Conduct weekly regular meetings</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Measure and evaluate quality metrics</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Review risk management and risk mitigation strategies</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Manage and follow up on issues</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>A common issue seen in companies that fail in offshore development is the mindset of \"it\'s acceptable because it\'s offshore,\" leading to a delay in resolving problems. They often wait until issues escalate, then expend significant resources to address them. Because it\'s offshore, it\'s even more important to be vigilant about issues and manage progress carefully.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>At AIoT, we don\'t believe that all responsibilities lie solely with the client. We take a proactive approach to address even minor issues with a strong sense of ownership. This means we can execute projects with engineers whose mindset closely aligns with that of Japanese professionals compared to other locations!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Leave it to us!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT aims to be a trusted partner supporting your business success by solving challenges in offshore development and building long-term relationships. We invite you to trust AIoT as we strive for success together.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are struggling with offshore development or considering a new project, please consult with us. With our extensive experience, high technical capabilities, and thorough quality management and security measures, we will lead your business to success.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>・<strong>Want to achieve both cost reduction and high-quality development?</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>・<strong>Want to enhance market competitiveness with a speedy development system?</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>・<strong>Want to build a long-term relationship with a reliable partner?</strong></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>We are here to meet those needs. Please feel free to contact us. Our specialized consultants will propose optimal solutions tailored to your requirements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>For inquiries, please visit the&nbsp;<strong>Contact Us</strong>&nbsp;page!<br>Or feel free to reach us at the following phone number:<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Happy Together!</h2>\n<!-- /wp:heading -->', 'How to Proceed with Offshore Development: 7 Specific Steps – Part 6', '', 'publish', 'closed', 'closed', '', 'how-to-proceed-with-offshore-development-7-specific-steps-part-6', '', '', '2025-03-31 16:04:20', '2025-03-31 07:04:20', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=655', 0, 'blog', '', 0),
(657, 2, '2025-04-01 11:57:11', '2025-04-01 02:57:11', '', '1', '', 'inherit', 'open', 'closed', '', '1-2', '', '', '2025-04-01 11:57:11', '2025-04-01 02:57:11', '', 0, 'http://localhost:8080/wp-content/uploads/2025/04/202504010257-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(658, 2, '2025-04-01 11:57:33', '2025-04-01 02:57:33', '', '4', '', 'inherit', 'open', 'closed', '', '4-2', '', '', '2025-04-01 11:57:33', '2025-04-01 02:57:33', '', 0, 'http://localhost:8080/wp-content/uploads/2025/04/202504010257-4.jpg', 0, 'attachment', 'image/jpeg', 0),
(659, 2, '2025-04-01 11:57:52', '2025-04-01 02:57:52', '', '3', '', 'inherit', 'open', 'closed', '', '3-4', '', '', '2025-04-01 11:57:52', '2025-04-01 02:57:52', '', 0, 'http://localhost:8080/wp-content/uploads/2025/04/202504010257-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(660, 2, '2025-04-01 11:58:09', '2025-04-01 02:58:09', '', '2', '', 'inherit', 'open', 'closed', '', '2-3', '', '', '2025-04-01 11:58:09', '2025-04-01 02:58:09', '', 0, 'http://localhost:8080/wp-content/uploads/2025/04/202504010258-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(663, 2, '2025-04-01 12:07:10', '2025-04-01 03:07:10', '', 'Image', '', 'inherit', 'open', 'closed', '', 'image', '', '', '2025-04-01 12:07:10', '2025-04-01 03:07:10', '', 0, 'http://localhost:8080/wp-content/uploads/2025/04/202504010307-Image.jpeg', 0, 'attachment', 'image/jpeg', 0),
(667, 2, '2025-04-01 12:14:17', '2025-04-01 03:14:17', '<!-- wp:paragraph -->\n<p>2025年3月26日から29日にかけて、在日ベトナムデジタルトランスフォーメーション協会（VADX）の代表団は、ファム・クアン・ヒエウ駐日ベトナム大使の随行として九州地域を訪問しました。宮崎、大分、熊本、佐賀の各県を巡り、地方自治体のリーダーと会談し、デジタルトランスフォーメーション、技術協力、人材育成について議論しました。AIoTの代表取締役であるグエン・マイン・フン氏もVADXのメンバーとともに参加し、意見交換に貢献しました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":663,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/04/202504010307-Image.jpeg\" alt=\"\" class=\"wp-image-663\"/><figcaption class=\"wp-element-caption\">AIoTの代表取締役グエン・マイン・フン氏がVADXのメンバーと共に会議に参加し、意見交換を行っている様子。</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\"><strong>九州 – チャンスの地</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>九州の地方自治体のリーダーたちは、日本で活躍するベトナム人コミュニティ、特にITエンジニア  に大きな関心を寄せています。彼らは、ベトナム人労働者の貢献を高く評価し、従来の産業分野にとどまらず、高度技術分野でも協力を拡大したいと考えています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>会談では、AIを活用した製造業やスマート農業、さらにベトナム人労働者が日本に渡航する前の研修支援についても話し合われました。特に、日本の運転免許取得を支援することも、ベトナム人コミュニティにとって実用的な解決策として検討されました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":659,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/04/202504010257-3.jpg\" alt=\"\" class=\"wp-image-659\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\"><strong>未来への握手</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>今回の訪問は、単なる交流にとどまらず、実際の協力関係を築くきっかけとなりました。両国の企業を支援し、ベトナム人エンジニアが日本でより良い環境で活躍できるよう、具体的な計画が進行中です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>九州は今回の訪問で終わりではなく、つながりの道はこれからも続きます。新しいプロジェクトでまたお会いしましょう – ベトナムのテクノロジーと人材がさらに輝く未来へ! </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '九州の旅: テクノロジーで握手し、ベトナム-日本の人材をつなぐ!', '', 'publish', 'closed', 'closed', '', 'kyushu-journey-vietnam-japan', '', '', '2025-07-23 21:59:15', '2025-07-23 12:59:15', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=667', 0, 'blog', '', 0),
(672, 2, '2025-04-01 12:42:21', '2025-04-01 03:42:21', '<!-- wp:paragraph -->\n<p>From March 26 to 29, 2025, a delegation from the Vietnam Digital Transformation Association in Japan (VADX) accompanied Vietnamese Ambassador to Japan, Pham Quang Hieu, on a visit to the Kyushu region. The delegation traveled through Miyazaki, Oita, Kumamoto, and Saga, meeting with local government leaders to discuss digital transformation, technological cooperation, and human resource development. Nguyen Manh Hung, CEO of AIoT, also participated alongside VADX members, contributing to discussions and exchanges.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":663,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/04/202504010307-Image.jpeg\" alt=\"\" class=\"wp-image-663\"/><figcaption class=\"wp-element-caption\">Nguyen Manh Hung - CEO of AIoT participating in a meeting alongside VADX members and engaging in discussions.</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\"><strong>Kyushu – A Land of Opportunities</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Local leaders in Kyushu expressed great interest in the Vietnamese community in Japan, particularly IT engineers. They highly valued the contributions of Vietnamese workers and aimed to expand cooperation beyond traditional industries into high-tech fields.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Discussions covered various key topics, including the application of AI in manufacturing and smart agriculture, as well as support for training Vietnamese workers before they travel to Japan. Notably, facilitating the acquisition of Japanese driver’s licenses for the Vietnamese community was also considered a practical solution.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":659,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/04/202504010257-3.jpg\" alt=\"\" class=\"wp-image-659\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\"><strong>Handshake for the Future</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>This visit was not just an exchange of ideas but also a step toward establishing concrete collaborations. Plans are underway to support businesses in both countries and create better opportunities for Vietnamese engineers to thrive in Japan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Kyushu is just one stop on this journey, but the path of connection continues. We look forward to new projects where Vietnamese technology and talent will shine even brighter! </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Kyushu Journey: Handshake for Technology and Talent Connection between Vietnam and Japan', '', 'publish', 'closed', 'closed', '', 'kyushu-journey-vietnam-japan', '', '', '2025-04-01 12:46:48', '2025-04-01 03:46:48', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=672', 0, 'blog', '', 0),
(673, 1, '2025-04-02 17:17:52', '2025-04-02 08:17:52', '<!-- wp:paragraph -->\n<p>オフショア開発を初めて検討する企業にとって、その道のりにはさまざまな悩みが伴います。特に、言語や文化の違いからくるコミュニケーションの不安は大きな課題です。また、開発品質が国内の基準に達するかどうかの心配も尽きません。さらに、時差やリモート環境での進捗管理の難しさに頭を悩ませる企業も少なくありません。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>信頼できる開発会社を見つけることや、コストの透明性を確保することも大きな関心事です。法的な契約や知的財産権の保護についての疑問も、オフショア開発を進める上での大きな障害となります。そして、異なる文化的背景がプロジェクトに与える影響を考慮することも忘れてはならないポイントです。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>このように、初めてのオフショア開発には多くの不安や疑問がつきまとう中、成功へと導くための手順を見つけることが求められています。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>オフショア開発を成功させるための鍵は、<mark>準備段階からの綿密な≪プランニング≫と効果的な≪コミュニケーション≫</mark>にあります。</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>プロジェクトの目的や要件を明確に定義し、関係者全員が共有できるビジョンを持つことで期待値のズレを防ぎ、スムーズな進行が可能になります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>この記事では、ベトナムでオフショア開発事業を展開するAIoTが、オフショア開発の具体的な進め方と最適な見つけ方を実践的な知見を交えながら7つのステップの最後のステップ7について紹介します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Step7：検収と運用保守フェーズへの移行</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>開発が完了したら、検収作業、運用保守フェーズへ進みましょう。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">検収作業の実施</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>要件定義書との整合性確認</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>機能テストの実施と結果確認</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>非機能要件の達成度確認</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>必要に応じたフィードバックと修正依頼</strong></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">検収完了の判断</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>検収基準の達成確認</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>関係者からの承認取得</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>検収完了書の発行</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>契約に基づく残金の支払い手続き</strong><br>※受託開発の場合、着手時50%、検収後50%の支払いが一般的です。<br>ラボ型では通常、月次での人月精算となります。</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">保証期間と運用保守フェーズへの移行</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\">受託開発の場合</h4>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>契約で定めた保証期間の開始</strong>（通常3～6ヶ月）</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>不具合発生時の対応体制の確認</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>保証期間終了後の有償保守契約の検討</strong></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4 class=\"wp-block-heading\">ラボ型開発の場合</h4>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>開発フェーズから運用保守フェーズへの体制移行</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>必要に応じたチーム規模の見直し</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>保守運用における役割分担の明確化</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>定例会議体制の見直し</strong></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>特に重要なのは、検収後における保証期間や運用保守フェーズに関する責任の範囲を事前に明確にすることです。受託開発の場合、保証期間中の対応内容について、ラボ型開発の場合は運用保守フェーズでの具体的な作業内容について、開発ベンダーとの合意をしっかりと確立しておく必要があります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">お任せください！</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoTはお客様のビジネス成功を支える信頼できるパートナーとして、オフショア開発における課題を解決し、長期的な関係を築くことを目指しています。ぜひ、AIoTにお任せいただき、共に成功を目指しましょう。<br>オフショア開発でお悩みの方、新しいプロジェクトを検討されている方、ぜひ一度当社にご相談ください。私たちは、豊富な実績と高い技術力、そして徹底した品質管理とセキュリティ対策で、お客様のビジネスを成功に導きます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br>☆コスト削減と高品質な開発を両立したい<br>☆スピーディーな開発体制で市場競争力を高めたい<br>☆信頼できるパートナーと共に、長期的な関係を築きたい</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br>そんなご要望に、当社はお応えします。<br>まずはお気軽にお問い合わせください。専門のコンサルタントが、お客様のニーズに合わせた最適なソリューションをご提案いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>お問い合わせは≪お問い合わせ≫より！<br>または、以下の電話番号までお気軽にご連絡ください：<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Happy Together!</h2>\n<!-- /wp:heading -->', 'オフショア開発の進め方：7つの具体的ステップ　Part 7', '', 'publish', 'closed', 'closed', '', 'offshore-development-process-7-specific-steps-part-7', '', '', '2025-07-25 17:50:05', '2025-07-25 08:50:05', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=673', 0, 'blog', '', 0),
(674, 1, '2025-04-02 17:21:18', '2025-04-02 08:21:18', '<!-- wp:paragraph -->\n<p>For companies considering offshore development for the first time, the journey comes with various challenges. In particular, concerns about communication stemming from language and cultural differences pose significant issues. There are also ongoing worries about whether the development quality will meet domestic standards. Additionally, many companies struggle with managing progress across time zones and remote environments.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Finding a reliable development company and ensuring cost transparency are also major concerns. Questions regarding legal contracts and the protection of intellectual property rights can serve as significant obstacles to advancing offshore development. Furthermore, it’s crucial not to overlook the impact that different cultural backgrounds can have on the project.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In this context, companies must seek out steps that lead to success amid many uncertainties and questions.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The key to successful offshore development lies in meticulous planning from the preparation stage and effective communication.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>By clearly defining the project’s objectives and requirements, and by having a shared vision among all stakeholders, the potential for misaligned expectations can be minimized, allowing for smoother progress.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In this article, AIoT, which conducts offshore development in Vietnam, will introduce the last of the seven specific steps for offshore development, along with practical insights on how to proceed effectively.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Step 7: Transition to Acceptance and Maintenance Phase</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p><br>Once development is complete, it’s time to move on to the acceptance work and then to the maintenance phase.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Implementation of Acceptance Work</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Confirm consistency with the requirement definition document</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Conduct functional testing and verify results</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Check the achievement of non-functional requirements</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Provide feedback and request revisions as necessary</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Judging Acceptance Completion</h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Confirm achievement of acceptance criteria</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Obtain approval from stakeholders</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Issue the acceptance completion document</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Process payment of the remaining balance based on the contract<br><em>Note: In the case of commissioned development, it is common to pay 50% at the start and 50% after acceptance. In the lab model, monthly billing based on man-months is typical.</em></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Transition to Guarantee Period and Maintenance Phase</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p><strong>In the case of commissioned development:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Start of the contractually defined guarantee period (typically 3–6 months)</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Confirm the response system for any issues that arise</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Consider paid maintenance contracts after the guarantee period ends</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p><strong>In the case of lab model development:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Transition from the development phase to the maintenance phase</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Review team size as necessary</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Clarify roles and responsibilities in maintenance operations</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Reassess regular meeting structures</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>It is particularly important to clarify the scope of responsibilities regarding the guarantee period and maintenance phase post-acceptance. For commissioned development, it is necessary to establish a solid agreement with the development vendor regarding the scope of responses during the guarantee period. In the case of lab model development, clarity on specific tasks during the maintenance phase is also essential.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Leave it to us!</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p><br>AIoT aims to be a trusted partner in supporting your business success by solving challenges in offshore development and building long-term relationships. We invite you to rely on AIoT as we work together towards success. If you are facing issues with offshore development or considering a new project, please consult us. We bring extensive experience, high technical capabilities, and thorough quality management and security measures to ensure your business succeeds.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Want to balance cost reduction with high-quality development?</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Looking to enhance market competitiveness with a speedy development system?</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Aiming to build a long-term relationship with a trusted partner?</strong></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>We can meet those needs.<br>Feel free to contact us. Our specialized consultants will propose the best solutions tailored to your requirements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>For inquiries, please visit the <strong>Contact Us</strong> page!<br>Or feel free to reach us at the following phone number:<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Happy Together!</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Offshore Development Process: 7 Specific Steps - Part 7', '', 'publish', 'closed', 'closed', '', 'offshore-development-process-7-specific-steps-part-7', '', '', '2025-04-02 17:21:18', '2025-04-02 08:21:18', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=674', 0, 'blog', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(675, 1, '2025-06-19 09:45:07', '2025-06-19 00:45:07', '<!-- wp:paragraph -->\n<p>プライバシーポリシー（個人情報保護方針）</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>AIoT株式会社（以下、「当社」といいます）は、AIおよび最新技術を活用したDX推進、システム開発、ベトナムを拠点としたオフショア開発を含むITサービスを提供する企業として、個人情報の重要性を認識し、以下のとおりプライバシーポリシーを定め、個人情報の保護と適切な取扱いを推進いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">1. 個人情報の取得</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当社は、事業活動の過程において、お客様・取引先・求職者などから、適法かつ公正な手段により個人情報を取得します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>取得する主な情報は、以下のとおりです：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>・氏名、会社名、部署名、役職、電話番号、メールアドレスなどの連絡先情報<br>・業務内容、案件情報、契約内容等<br>・採用に関連する履歴書、職務経歴書などの情報</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2. 利用目的</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当社は、取得した個人情報を以下の目的で利用いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>・お問い合わせやご相談への対応<br>・見積・契約・業務遂行・連絡・請求・支払等の取引遂行<br>・DX推進、AI・システム開発における案件対応およびパートナーシップの構築<br>・採用活動に伴う連絡および選考手続き<br>・法令に基づく対応および社内管理業務</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3. 個人情報の第三者提供</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当社は、以下の場合を除き、個人情報を第三者に提供いたしません。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>・本人の同意がある場合<br>・法令に基づく場合<br>・業務遂行上、委託先または共同開発先（例：ベトナム現地開発パートナー）に提供する必要がある場合（この場合は、契約に基づき適切な管理・監督を行います）</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4. 海外への個人情報移転について</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当社は、業務上必要な場合に限り、ベトナムのオフショア開発拠点等、個人情報を海外に移転することがあります。その際は、適用法令を遵守し、適切な安全管理措置を講じます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">5. 安全管理措置</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当社は、取得した個人情報について、不正アクセス、紛失、破壊、改ざんおよび漏えい等を防止するため、合理的なセキュリティ対策を講じます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">6. 委託先の管理</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>個人情報の取り扱いを外部に委託する場合は、守秘義務契約を締結し、適切な監督を行います。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">7. 開示・訂正・削除等の請求</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>ご本人からの求めに応じて、保有する個人情報の開示、訂正、利用停止、削除等の手続きを、適切かつ迅速に対応いたします。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">8. Cookie等の利用について</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当社ウェブサイトでは、サービス向上・アクセス解析等を目的としてCookieを使用しています。Cookieは個人を特定する情報を含まず、ブラウザ設定により無効にすることが可能です。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">9. 改定について</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当社は、法令改正やサービス内容の変更等に応じて、本ポリシーを随時改定することがあります。変更内容は本サイト上で速やかに公開します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">10. お問い合わせ窓口</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本ポリシーに関するお問い合わせ、ご相談は、以下までご連絡ください。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->\n\n<!-- wp:paragraph -->\n<p><strong>AIoT株式会社</strong><br>〒104-0031<br>東京都中央区京橋1-1-5　セントラルビル2階<br>電話：03-4500-6968<br>メール：<a>info@aiot-fixing.local</a><br>ウェブサイト：<a class=\"\" href=\"https://www.aiot.co.jp\">http://localhost:8080/</a></p>\n<!-- /wp:paragraph -->', '個人情報保護方針', '　　', 'publish', 'closed', 'closed', '', 'privacy-policy', '', '', '2025-06-19 10:03:38', '2025-06-19 01:03:38', '', 0, 'http://localhost:8080/?page_id=675', 0, 'page', '', 0),
(688, 1, '2025-08-20 16:24:24', '2025-06-19 00:50:42', ' ', '', '', 'publish', 'closed', 'closed', '', '688', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 0, 'http://localhost:8080/?p=688', 16, 'nav_menu_item', '', 0),
(689, 1, '2025-06-19 10:02:15', '2025-06-19 01:02:15', '<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Privacy Policy</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT Corporation (hereinafter referred to as \"the Company\") recognizes the importance of protecting personal information. As an IT company utilizing AI and advanced technologies to promote DX (Digital Transformation) and system development projects both in Japan and abroad—with offshore development operations based in Vietnam—we are committed to the appropriate handling and protection of personal information in accordance with applicable laws and regulations.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">1. Acquisition of Personal Information</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We collect personal information by lawful and fair means in the course of our business activities. The types of information we may collect include:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>・Names, company names, departments, job titles, email addresses, and phone numbers<br>・Project-related details and contractual information<br>・Resume and career history for recruitment purposes</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2. Purpose of Use</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We use personal information only for the following purposes:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>・Responding to inquiries and consultations<br>・Executing business operations including proposals, contracts, development, payments, and communication<br>・Identifying and responding to DX and AI/system development opportunities<br>・Human resources and recruitment activities<br>・Compliance with applicable laws and internal administrative purposes</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We will not use the information beyond these purposes without obtaining prior consent, unless permitted by law.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3. Provision to Third Parties</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We will not provide personal information to third parties without the individual\'s consent, except in the following cases:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>When required by law<br>When it is necessary to protect a person’s life, body, or property<br>When it is necessary for the public interest or for cooperating with legal authorities<br>When providing to subcontractors or partners (e.g., offshore development teams in Vietnam) to the extent necessary for business execution<br>In such cases, we will supervise the third parties appropriately under confidentiality agreements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>When providing to subcontractors or partners (e.g., offshore development teams in Vietnam) to the extent necessary for business execution<br>In such cases, we will supervise the third parties appropriately under confidentiality agreements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4. International Transfers of Personal Data</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We may transfer personal information to countries outside of Japan (such as Vietnam) for the purpose of software development and project collaboration. In such cases, we will comply with relevant legal requirements and implement proper security measures.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">5. Security Management</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We take appropriate technical and organizational measures to prevent unauthorized access, loss, destruction, falsification, or leakage of personal information.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">6. Supervision of Contractors</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>When outsourcing the handling of personal information, we select contractors based on appropriate standards and ensure proper supervision through contractual agreements.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">7. Requests for Disclosure, Correction, or Deletion</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you request disclosure, correction, suspension of use, or deletion of your personal information, we will respond in accordance with applicable laws and regulations after verifying your identity.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">8. Use of Cookies</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our website uses cookies to improve user experience and analyze access. Cookies do not identify individual users. You may disable cookies via your browser settings.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">9. Revisions to this Policy</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We may revise this policy in response to changes in applicable laws or business practices. The revised policy will be posted on our website.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">10. Contact Information</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>For inquiries regarding this privacy policy or the handling of personal information, please contact:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->\n\n<!-- wp:paragraph -->\n<p><strong>AIoT Corporation</strong><br>Address: 104-0031 東京都中央区京橋1-1-5　セントラルビル2階<br>Phone: +81-03-4500-6968<br>Email: <a>info@aiot-fixing.local</a><br>Website: <a class=\"\" href=\"https://www.aiot.co.jp\">http://localhost:8080/</a></p>\n<!-- /wp:paragraph -->', 'Privacy Policy', '  ', 'publish', 'closed', 'closed', '', 'privacy-policy', '', '', '2025-06-19 10:02:15', '2025-06-19 01:02:15', '', 0, 'http://localhost:8080/?page_id=689', 0, 'page', '', 0),
(694, 1, '2025-07-23 12:56:11', '2025-07-23 03:56:11', '', 'BAO05906', '', 'inherit', 'open', 'closed', '', 'bao05906', '', '', '2025-07-23 12:56:11', '2025-07-23 03:56:11', '', 213, 'http://localhost:8080/wp-content/uploads/2025/07/202507230356-BAO05906.jpg', 0, 'attachment', 'image/jpeg', 0),
(696, 1, '2025-07-23 13:10:29', '2025-07-23 04:10:29', '', 'CEO', '', 'inherit', 'open', 'closed', '', 'ceo', '', '', '2025-07-23 13:10:29', '2025-07-23 04:10:29', '', 213, 'http://localhost:8080/wp-content/uploads/2025/07/202507230410-CEO.png', 0, 'attachment', 'image/png', 0),
(704, 1, '2025-07-23 15:55:32', '2025-07-23 06:55:32', '', 'CEO_Thuat', '', 'inherit', 'open', 'closed', '', 'ceo_thuat', '', '', '2025-07-23 15:55:32', '2025-07-23 06:55:32', '', 217, 'http://localhost:8080/wp-content/uploads/2025/07/202507230655-CEOThuat.png', 0, 'attachment', 'image/png', 0),
(705, 1, '2025-07-23 16:02:55', '2025-07-23 07:02:55', '', 'CEO_BINH', '', 'inherit', 'open', 'closed', '', 'ceo_binh', '', '', '2025-07-23 16:02:55', '2025-07-23 07:02:55', '', 217, 'http://localhost:8080/wp-content/uploads/2025/07/202507230702-CEOBINH.png', 0, 'attachment', 'image/png', 0),
(706, 1, '2025-07-23 16:21:28', '2025-07-23 07:21:28', '', 'CEO_OSHIMA', '', 'inherit', 'open', 'closed', '', 'ceo_oshima', '', '', '2025-07-23 16:21:28', '2025-07-23 07:21:28', '', 217, 'http://localhost:8080/wp-content/uploads/2025/07/202507230721-CEOOSHIMA.png', 0, 'attachment', 'image/png', 0),
(708, 1, '2025-07-23 16:59:11', '2025-07-23 07:59:11', '<!-- wp:cp-timeline/content-timeline-block {\"contentAlignment\":\"left\",\"block_id\":\"aae3c0ba-b3bc-4e9f-b66c-721776fad834\",\"timelineDesign\":\"one-sided\"} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block Cool-Content-Timeline\"><div class=\"cool-timeline-block-aae3c0ba-b3bc-4e9f-b66c-721776fad834\"><style>.cool-timeline-block-aae3c0ba-b3bc-4e9f-b66c-721776fad834 .cool-vertical-timeline-body{--ctlb-content-alignment: left;}</style><div class=\"cool-vertical-timeline-body ctlb-wrapper one-sided left\"><div class=\"cool-timeline-block-list\"><!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon is born\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"block_id\":\"1d2c6fc1-5041-406d-af9b-93140d357e96\",\"t_date\":\"2018\",\"blockPosition\":\"right\",\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon is born\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2018</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">越境EC支援プラットフォーム</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">越境EC支援プラットフォーム<br>日本国内外のECマーケットプレイス間での商品情報を自動連動させる仕組みを開発。<br>海外販売の障壁を下げ、グローバル展開を支援する基盤を構築しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon Prime debuts\",\"time_desc\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"block_id\":\"ce2cc167-2caa-481b-996e-b121ea4a7df3\",\"t_date\":\"  2019\",\"blockPosition\":\"left\",\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon Prime debuts\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>  2019</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">日本の建設業界でのDX</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">橋梁管理システム<br>防災ポータルサイト<br>日本の建設業界に向けた業務効率化・現場の生産性向上を支援<br>橋梁管理システム、防災ポータルサイトなど、社会インフラを支えるシステムを開発しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon acquires Audible\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon3-1-600x338.png\",\"block_id\":\"3b7f4340-38e2-4dd6-8780-fe88ee79c6a2\",\"t_date\":\"2020\",\"blockPosition\":\"right\",\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon3-1-600x338.png\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon acquires Audible\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2020</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">情報管理で業務効率化</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">企業内の情報をデジタルで一元管理する仕組みを構築し、業務の自動化・効率化を実現。<br>オンライン取引システムの導入により、非対面ビジネスへの移行を支援しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"1c80a04a-8c36-4535-9804-8b8aba8ba8b6\",\"t_date\":\"2021\",\"blockPosition\":\"left\",\"block_position_active\":false,\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2021</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">ゲーム業界開発</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">エンターテインメント分野に進出し、NFCカードを活用したアプリケーションを開発。<br>ユーザー体験と物理的デバイスの連携を強化するプロジェクトに取り組みました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"4ab5ffc6-4f29-4f8a-8a44-04c568d81a45\",\"t_date\":\"2022\",\"blockPosition\":\"right\",\"block_position_active\":false,\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2022</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">自治体DX支援</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">地方自治体様向けに住民サービスアプリを開発。<br>市区町村の業務効率化と住民利便性の向上に貢献しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"f3bd2318-c89b-42be-9d44-86805b7fec40\",\"t_date\":\"2023\",\"blockPosition\":\"left\",\"block_position_active\":false,\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2023</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">施設管理基幹システム</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">公共施設や商業施設における予約・順番管理などのシステムを開発・導入。<br>現場の混雑解消や管理の効率化を実現しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"b6f35a28-cb3e-423c-9601-d5dd5e16865b\",\"t_date\":\"2024\",\"blockPosition\":\"right\",\"block_position_active\":false,\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2024</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">次世代ロボット利用した配送システム</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">駅併設型商業施設を対象に、販売・注文・ロボット配送を連携させたスマート物流システムを構築。<br>人手不足解消と非接触サービスの両立を支援しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"c7ba04d9-7ce9-4c8c-bca6-e8ccf3d479d8\",\"t_date\":\"2025\",\"blockPosition\":\"left\",\"block_position_active\":false,\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2025</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">官公庁様のDX支援</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">行政機関向けに、住民からの問い合わせを自動応答するチャットボットを開発。<br>人員負担の軽減とサービス対応力の向上に寄与しています。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child --></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block -->', '沿革', 'AIoT株式会社は、2018年の越境EC支援プラットフォーム開発を皮切りに、建設・医療・自治体・官公庁・商業施設など多様な分野でDX推進を支援してきました。\n橋梁管理、防災情報、オンライン取引、NFCアプリ、自治体アプリ、施設予約・順番管理、ロボット配送、AIチャットボットなど、業務効率化やユーザー体験向上を目的としたシステムを一貫して開発・運用。\n日本企業との連携・オフショア開発体制を強みに、社会課題に対応するソリューションを継続的に提供しています。', 'publish', 'closed', 'closed', '', 'history', '', '', '2025-07-25 16:41:16', '2025-07-25 07:41:16', '', 207, 'http://localhost:8080/?page_id=708', 1, 'page', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(710, 1, '2025-07-23 21:14:09', '2025-07-23 12:14:09', '<!-- wp:cp-timeline/content-timeline-block {\"contentAlignment\":\"left\",\"block_id\":\"7545cdba-3c0c-40ee-b8f3-b3a38e8583cf\",\"timelineDesign\":\"one-sided\"} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block Cool-Content-Timeline\"><div class=\"cool-timeline-block-7545cdba-3c0c-40ee-b8f3-b3a38e8583cf\"><style>.cool-timeline-block-7545cdba-3c0c-40ee-b8f3-b3a38e8583cf .cool-vertical-timeline-body{--ctlb-content-alignment: left;}</style><div class=\"cool-vertical-timeline-body ctlb-wrapper one-sided left\"><div class=\"cool-timeline-block-list\"><!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon is born\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"block_id\":\"e06ad461-cccb-4583-8b15-402ddc784887\",\"t_date\":\"2018\",\"blockPosition\":\"right\",\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon1-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon is born\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim res aperta. Ne discipulum abducam, times. Primum quid tu dicis breve? An haec ab eo non dicuntur?\",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2018</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">越境EC支援プラットフォーム</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">日本国内外のECマーケットプレイス間での商品情報を自動連動させる仕組みを開発。<br>海外販売の障壁を下げ、グローバル展開を支援する基盤を構築しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon Prime debuts\",\"time_desc\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"block_id\":\"bc9af1e8-5210-4109-a984-616a60270123\",\"t_date\":\"  2019\",\"blockPosition\":\"left\",\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon2-600x338.jpg\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon Prime debuts\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Aliter homines, aliter philosophos loqui putas oportere? Sin aliud quid voles, postea. Mihi enim satis est, ipsis non satis. Negat enim summo bono afferre incrementum diem. Quod ea non occurrentia fingunt, vincunt Aristonem., you can change me anytime click here, \",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>  2019</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">日本の建設業界でのDX</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">日本の建設業界に向けた業務効率化・現場の生産性向上を支援。<br>橋梁管理システム、防災ポータルサイトなど、社会インフラを支えるシステムを開発しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"time_heading\":\"Amazon acquires Audible\",\"time_desc\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"timeLineImage\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon3-1-600x338.png\",\"block_id\":\"fdbfbae8-c03e-4bff-8f4a-e0c6c6fe880d\",\"t_date\":\"2020\",\"blockPosition\":\"right\",\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/image\",{\"url\":\"https://cooltimeline.com/wp-content/uploads/2022/11/amazon3-1-600x338.png\",\"className\":\"ctlb-block-image\",\"aspectRatio\":\"4/3\",\"scale\":\"cover\"}],[\"core/heading\",{\"level\":3,\"content\":\"Amazon acquires Audible\",\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]],\"mediaBlock\":true} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2020</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">情報管理で業務効率化</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">企業内の情報をデジタルで一元管理する仕組みを構築し、業務の自動化・効率化を実現。<br>オンライン取引システムの導入により、非対面ビジネスへの移行を支援しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"c7cbd3ca-435a-461d-a190-72e1b155d2aa\",\"t_date\":\"2021\",\"blockPosition\":\"left\",\"block_position_active\":false,\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2021</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">ゲーム業界開発</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">エンターテインメント分野に進出し、NFCカードを活用したアプリケーションを開発。<br>ユーザー体験と物理的デバイスの連携を強化するプロジェクトに取り組みました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"5a507597-ee9b-4a3e-8ab5-14b2dd404db9\",\"t_date\":\"2022\",\"blockPosition\":\"right\",\"block_position_active\":false,\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2022</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">自治体DX支援</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">地方自治体様向けに住民サービスアプリを開発。<br>市区町村の業務効率化と住民利便性の向上に貢献しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"d68c414f-e328-48c5-ab38-53ca046eaad5\",\"t_date\":\"2023\",\"blockPosition\":\"left\",\"block_position_active\":false,\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2023</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">施設管理基幹システム</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">公共施設や商業施設における予約・順番管理などのシステムを開発・導入。<br>現場の混雑解消や管理の効率化を実現しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"5d555f45-e21a-42dc-ad66-3359c72685c3\",\"t_date\":\"2024\",\"blockPosition\":\"right\",\"block_position_active\":false,\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-right\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2024</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">次世代ロボット利用した配送システム</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">駅併設型商業施設を対象に、販売・注文・ロボット配送を連携させたスマート物流システムを構築。<br>人手不足解消と非接触サービスの両立を支援しました。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child -->\n\n<!-- wp:cp-timeline/content-timeline-block-child {\"block_id\":\"c3f38faf-7d11-493f-80f2-ad8f46ed455c\",\"t_date\":\"2025\",\"blockPosition\":\"left\",\"block_position_active\":false,\"timelineDesign\":\"one-sided\",\"wodpressBlock\":true,\"innerBlockTemplate\":[[\"core/heading\",{\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}],[\"core/paragraph\",{\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}}]]} -->\n<div class=\"wp-block-cp-timeline-content-timeline-block-child swiper-slide\"><div class=\"timeline-content icon-false \"><div class=\"timeline-block-timeline ctl-row  position-left\"><div class=\"ctl-6 timeline-block-time\"><div class=\"story-time\"><p>2025</p></div></div><div class=\"timeline-block-icon\"><svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z\"></path></svg></div><div class=\"ctl-6 timeline-block-detail\"><div class=\"story-details\"><div class=\"story-content\"><!-- wp:heading {\"level\":3,\"className\":\"ctlb-block-title\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<h3 class=\"wp-block-heading ctlb-block-title\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">官公庁様のDX支援</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"placeholder\":\"Add your description here\",\"className\":\"ctlb-block-desc\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0px\",\"left\":\"0px\",\"bottom\":\"0px\",\"right\":\"0px\"}}}} -->\n<p class=\"ctlb-block-desc\" style=\"padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px\">行政機関向けに、住民からの問い合わせを自動応答するチャットボットを開発。<br>人員負担の軽減とサービス対応力の向上に寄与しています。</p>\n<!-- /wp:paragraph --></div></div></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block-child --></div></div></div></div>\n<!-- /wp:cp-timeline/content-timeline-block -->\n\n<!-- wp:buttons {\"layout\":{\"type\":\"flex\",\"justifyContent\":\"center\"}} -->\n<div class=\"wp-block-buttons\"><!-- wp:button -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link wp-element-button\" href=\"https://drive.google.com/file/d/1M_k_rIESMrSNiqWDRYlIPo7lYyJFvRnq/view?usp=sharing\">AIoT株式会社開発実績をダウンロードする</a></div>\n<!-- /wp:button --></div>\n<!-- /wp:buttons -->', '開発実績', 'AIoT株式会社は、EC、建設、医療、自治体、官公庁など多様な業界に対応し、業務効率化・DX推進を支援してきた実績があります。Webシステム、モバイルアプリ、IoT、ロボティクス、AIチャットボットなど幅広い技術領域に精通し、要件定義から開発・運用まで一貫対応。日本国内外の企業と連携し、高品質かつ柔軟なオフショア開発体制を構築しています。ビジネスの課題に合わせた最適なソリューションを提供できるのが強みです。', 'publish', 'closed', 'closed', '', 'portfolio', '', '', '2025-07-25 16:43:23', '2025-07-25 07:43:23', '', 207, 'http://localhost:8080/?page_id=710', 6, 'page', '', 0),
(717, 1, '2025-07-23 21:29:52', '2025-07-23 12:29:52', '', 'CEO_key', '', 'inherit', 'open', 'closed', '', 'ceo_key', '', '', '2025-07-23 21:29:52', '2025-07-23 12:29:52', '', 552, 'http://localhost:8080/wp-content/uploads/2025/01/202507231229-CEOkey.png', 0, 'attachment', 'image/png', 0),
(718, 1, '2025-07-23 21:33:05', '2025-07-23 12:33:05', '', 'CEO_failed_success', '', 'inherit', 'open', 'closed', '', 'ceo_failed_success', '', '', '2025-07-23 21:33:05', '2025-07-23 12:33:05', '', 556, 'http://localhost:8080/wp-content/uploads/2025/01/202507231233-CEOfailedsuccess.png', 0, 'attachment', 'image/png', 0),
(720, 1, '2025-07-23 21:36:35', '2025-07-23 12:36:35', '', 'CEO_no1', '', 'inherit', 'open', 'closed', '', 'ceo_no1', '', '', '2025-07-23 21:36:35', '2025-07-23 12:36:35', '', 561, 'http://localhost:8080/wp-content/uploads/2025/02/202507231236-CEOno1.png', 0, 'attachment', 'image/png', 0),
(721, 1, '2025-07-23 21:46:39', '2025-07-23 12:46:39', '', 'CEO_8', '', 'inherit', 'open', 'closed', '', 'ceo_8', '', '', '2025-07-23 21:46:39', '2025-07-23 12:46:39', '', 564, 'http://localhost:8080/wp-content/uploads/2025/02/202507231246-CEO8.png', 0, 'attachment', 'image/png', 0),
(722, 1, '2025-07-23 21:46:40', '2025-07-23 12:46:40', '', 'CEO_7', '', 'inherit', 'open', 'closed', '', 'ceo_7', '', '', '2025-07-23 21:46:40', '2025-07-23 12:46:40', '', 564, 'http://localhost:8080/wp-content/uploads/2025/02/202507231246-CEO7.png', 0, 'attachment', 'image/png', 0),
(723, 1, '2025-07-23 21:46:43', '2025-07-23 12:46:43', '', 'CEO_6', '', 'inherit', 'open', 'closed', '', 'ceo_6', '', '', '2025-07-23 21:46:43', '2025-07-23 12:46:43', '', 564, 'http://localhost:8080/wp-content/uploads/2025/02/202507231246-CEO6.png', 0, 'attachment', 'image/png', 0),
(724, 1, '2025-07-23 21:46:46', '2025-07-23 12:46:46', '', 'CEO_5', '', 'inherit', 'open', 'closed', '', 'ceo_5', '', '', '2025-07-23 21:46:46', '2025-07-23 12:46:46', '', 564, 'http://localhost:8080/wp-content/uploads/2025/02/202507231246-CEO5.png', 0, 'attachment', 'image/png', 0),
(725, 1, '2025-07-23 21:46:48', '2025-07-23 12:46:48', '', 'CEO_4', '', 'inherit', 'open', 'closed', '', 'ceo_4', '', '', '2025-07-23 21:46:48', '2025-07-23 12:46:48', '', 564, 'http://localhost:8080/wp-content/uploads/2025/02/202507231246-CEO4.png', 0, 'attachment', 'image/png', 0),
(726, 1, '2025-07-23 21:46:49', '2025-07-23 12:46:49', '', 'CEO_3', '', 'inherit', 'open', 'closed', '', 'ceo_3', '', '', '2025-07-23 21:46:49', '2025-07-23 12:46:49', '', 564, 'http://localhost:8080/wp-content/uploads/2025/02/202507231246-CEO3.png', 0, 'attachment', 'image/png', 0),
(727, 1, '2025-07-23 21:46:52', '2025-07-23 12:46:52', '', 'CEO_2', '', 'inherit', 'open', 'closed', '', 'ceo_2', '', '', '2025-07-23 21:46:52', '2025-07-23 12:46:52', '', 564, 'http://localhost:8080/wp-content/uploads/2025/02/202507231246-CEO2.png', 0, 'attachment', 'image/png', 0),
(728, 1, '2025-07-23 21:47:37', '2025-07-23 12:47:37', '', 'CEO_2', '', 'inherit', 'open', 'closed', '', 'ceo_2-2', '', '', '2025-07-23 21:47:37', '2025-07-23 12:47:37', '', 564, 'http://localhost:8080/wp-content/uploads/2025/02/202507231247-CEO2.png', 0, 'attachment', 'image/png', 0),
(729, 1, '2025-07-23 21:47:40', '2025-07-23 12:47:40', '', 'CEO_1', '', 'inherit', 'open', 'closed', '', 'ceo_1', '', '', '2025-07-23 21:47:40', '2025-07-23 12:47:40', '', 564, 'http://localhost:8080/wp-content/uploads/2025/02/202507231247-CEO1.png', 0, 'attachment', 'image/png', 0),
(753, 2, '2025-07-25 17:44:02', '2025-07-25 08:44:02', '<!-- wp:paragraph -->\n<p>The other day, on the occasion of <strong>Vietnamese Entrepreneurs\' Day</strong> and the <strong>anniversary of Hanoi University of Science and Technology</strong>, <strong>AIoT</strong> had the honor of participating as a co-organizer of the event <strong>\"STARTUP IN TECH – A Journey into Tech Entrepreneurship.\"</strong><br>This event served as a valuable opportunity to share practical insights from leading technology CEOs and to offer fresh perspectives to the startup community.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>At the event, <strong>Mr. Nguyễn Mạnh Hùng</strong>, CEO of <strong>AIoT</strong>, delivered a passionate talk about his entrepreneurial journey in the fields of digital transformation and technology.<br>Drawing from his extensive experience, he inspired many by sharing insights on how to identify niche markets and build a unique business that thrives in a highly competitive environment.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Key discussion topics included:</strong><br>✔️ How to overcome challenges when starting a business in the tech industry<br>✔️ The role of AI and IoT technologies in digital transformation<br>✔️ How to differentiate your business model in a crowded market<br>✔️ The importance of building a team for long-term growth</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>This event provided valuable knowledge and strong inspiration for young people passionate about technology and entrepreneurship.<br><strong>AIoT</strong> is proud to have contributed to the sharing and promotion of technology solutions in the digital age.<br>We hope our technological solutions will support businesses and organizations in optimizing processes and improving operational efficiency.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>About AIoT:<br>AIoT is a pioneer in digital transformation, applying AI and IoT technologies to business solutions. We are committed to delivering innovative solutions that enable companies to harness the full potential of technology in an optimal and sustainable way.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>We warmly invite you to contact AIoT, explore the latest technological solutions, and join us on a journey of business growth!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":445,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2024/10/202410170640-4624576345377638623416678100198556909098138n.jpg\" alt=\"\" class=\"wp-image-445\"/></figure>\n<!-- /wp:image -->', 'The webinar \"STARTUP IN TECH – A Journey into Tech Entrepreneurship\" was successfully held!', '', 'publish', 'closed', 'closed', '', 'the-webinar-startup-in-tech-a-journey-into-tech-entrepreneurship-was-successfully-held', '', '', '2025-07-25 17:44:02', '2025-07-25 08:44:02', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=753', 0, 'blog', '', 0),
(760, 2, '2025-07-28 16:19:04', '2025-07-28 07:19:04', '<!-- wp:paragraph -->\n<p>Trong những năm gần đây, việc lựa chọn Việt Nam làm điểm đến cho phát triển hệ thống IT offshore đã trở nên phổ biến. Kể từ khi thành lập, công ty chúng tôi luôn nỗ lực cung cấp dịch vụ với chất lượng và độ tin cậy không thua kém bất kỳ doanh nghiệp Nhật Bản nào. Bài viết này sẽ giới thiệu về sức hút của phát triển offshore tại Việt Nam từ góc nhìn riêng của chúng tôi.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>① Lợi thế về chi phí</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Chi phí phát triển hệ thống tại Việt Nam chỉ khoảng 35% so với Nhật Bản. Điều này xuất phát từ mức giá sinh hoạt tại Việt Nam chỉ bằng khoảng 1/2 đến 1/3 của Nhật. Theo khảo sát thực tế, mức lương của nhân sự IT tại Việt Nam chỉ bằng khoảng 1/3 so với Nhật Bản. Dữ liệu năm 2024 cho thấy, thu nhập trung bình của kỹ sư IT Việt Nam là khoảng 812 USD/tháng, so với khoảng 2,500 USD ở Nhật Bản – một sự khác biệt rõ rệt về chi phí. Ngay cả khi tính tổng chi phí nhân sự theo đơn vị man-month (người-tháng), sự chênh lệch này vẫn rất rõ ràng.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>② Nguồn nhân lực IT dồi dào và chất lượng</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Chính phủ Việt Nam đã công bố chương trình chuyển đổi số quốc gia vào năm 2020, đặt mục tiêu đến năm 2025 và tập trung mạnh mẽ vào đào tạo nguồn nhân lực. Khoảng 70% các trường đại học trong nước có ngành liên quan đến IT, với hơn 50.000 sinh viên IT tốt nghiệp mỗi năm. Nhờ vậy, tổng số nhân lực IT đã vượt 530.000 người, ngành công nghiệp IT đang tăng trưởng khoảng 10% mỗi năm.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Đặc biệt, các khoản đầu tư mới từ doanh nghiệp Nhật Bản đang gia tăng, lĩnh vực truyền thông và công nghệ thông tin đang nhận được sự quan tâm lớn. Các dự án cũng ngày càng phức tạp hơn, chuyển từ các hệ thống Web, Mobile sang AI, Cloud. Thêm vào đó, các công ty tư nhân còn đầu tư vào các trường đại học và cung cấp chương trình đào tạo thực tiễn, hướng đến việc phát triển nhân lực phù hợp với thị trường Nhật.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>③ Vị trí địa lý và múi giờ thuận lợi</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Việt Nam và Nhật Bản chỉ chênh lệch múi giờ khoảng 2 tiếng. Người Việt có thói quen bắt đầu ngày mới sớm, vì vậy có thể dễ dàng điều chỉnh thời gian làm việc sao cho phù hợp với giờ làm việc cốt lõi của Nhật. Điều này giúp việc giao tiếp với các trung tâm phát triển tại Việt Nam diễn ra mượt mà – là điểm khác biệt lớn so với các quốc gia khác.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Thời gian bay từ Tokyo đến các thành phố lớn như Hồ Chí Minh, Đà Nẵng, Hà Nội chỉ khoảng 6 tiếng, rất tiện lợi cho việc khảo sát, họp hành. Lợi thế địa lý này giúp trao đổi theo thời gian thực, góp phần đẩy nhanh tiến độ dự án.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>④ Hạ tầng ổn định</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Việt Nam đã xây dựng được hệ thống hạ tầng ổn định, với nguồn điện và môi trường mạng đáng tin cậy. Năm 2024, tỷ lệ sử dụng Internet toàn quốc vượt 79%, đặc biệt tại các thành phố lớn đều có mạng tốc độ cao, tạo điều kiện thuận lợi cho việc phát triển phần mềm không bị gián đoạn.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>⑤ Văn hóa thân thiện với Nhật Bản</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Người Việt rất quen thuộc và yêu thích sản phẩm, văn hóa Nhật Bản, đồng thời dành sự tôn trọng sâu sắc với đất nước Nhật. Theo khảo sát, khoảng 80% người Việt có thiện cảm với Nhật Bản, điều này giúp tăng cường sự đồng cảm văn hóa và cải thiện hiệu quả giao tiếp công việc.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tại công ty chúng tôi, rất nhiều nhân viên có nguyện vọng học tiếng Nhật, các chi nhánh tại Đà Nẵng và Hồ Chí Minh đều đưa giờ học tiếng Nhật vào chương trình đào tạo nội bộ. Tất cả nhân viên đều mong muốn được làm việc cùng người Nhật – đây chính là yếu tố khác biệt rõ rệt so với các trung tâm offshore khác.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>※ So sánh với các quốc gia offshore khác</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Trung Quốc có lịch sử lâu dài trong phát triển offshore, nhưng chi phí hiện tại cao gấp đôi Việt Nam. Lương nhân công đang tăng, làm giảm lợi thế chi phí. Ngoài ra, rào cản ngôn ngữ, khác biệt văn hóa và tập quán kinh doanh cũng là những khó khăn lớn.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ấn Độ cũng là quốc gia có nhiều kinh nghiệm offshore, nhưng chi phí ngày càng cao, khiến Việt Nam trở thành lựa chọn vượt trội về mặt tài chính. Số lượng người nói tiếng Nhật tại Ấn Độ cũng ít, và có một số phản hồi rằng việc điều chỉnh giờ làm việc theo giờ Nhật gặp khó khăn.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Tổng kết</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Khi triển khai phát triển offshore, Việt Nam là lựa chọn lý tưởng nhờ có: <strong>chi phí hợp lý</strong>, <strong>nguồn nhân lực chất lượng</strong>, <strong>hạ tầng ổn định</strong>, và <strong>văn hóa thân thiện với Nhật Bản</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Hơn thế nữa, <strong>AIoT tự tin là đối tác tối ưu dành cho các doanh nghiệp Nhật Bản</strong>, vượt trội so với các điểm đến offshore khác về <strong>chất lượng</strong>, <strong>độ tin cậy</strong>, và <strong>sự thấu hiểu văn hóa Nhật</strong>. <strong>Hãy cân nhắc phát triển offshore tại Việt Nam và tin tưởng lựa chọn AIoT làm đối tác đồng hành của bạn!</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>AIoT luôn hướng đến việc trở thành đối tác đáng tin cậy</strong>, đồng hành cùng sự thành công trong kinh doanh của quý khách hàng. Chúng tôi không chỉ giải quyết các thách thức trong phát triển offshore, mà còn xây dựng <strong>mối quan hệ hợp tác bền vững, lâu dài</strong>. Hãy để <strong>AIoT trở thành đối tác của bạn trên hành trình chinh phục thành công!</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nếu bạn đang gặp khó khăn trong quá trình phát triển offshore, hoặc đang cân nhắc triển khai một dự án mới, <strong>đừng ngần ngại liên hệ với chúng tôi để được tư vấn!</strong> <br>Chúng tôi cam kết đồng hành cùng sự thành công của quý khách hàng bằng <strong>kinh nghiệm dày dạn</strong>, <strong>năng lực kỹ thuật cao</strong>, cùng với <strong>quy trình kiểm soát chất lượng và bảo mật chặt chẽ</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆ Muốn <strong>giảm chi phí</strong> nhưng vẫn đảm bảo <strong>chất lượng phát triển cao</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆ Muốn <strong>đẩy nhanh tiến độ phát triển</strong> để nâng cao <strong>năng lực cạnh tranh trên thị trường</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆ Muốn <strong>hợp tác lâu dài</strong> với một <strong>đối tác đáng tin cậy</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>→ Chúng tôi hoàn toàn có thể đáp ứng những kỳ vọng đó.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vui lòng liên hệ với chúng tôi qua mục ≪Liên hệ≫!<br>Hoặc gọi ngay đến số điện thoại dưới đây để được hỗ trợ nhanh chóng:<br><strong>TEL: 03-4500-6968</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Happy Together!</strong></p>\n<!-- /wp:paragraph -->', 'Phát triển offshore – chỉ có thể là Việt Nam!', '', 'publish', 'closed', 'closed', '', 'reasons-to-conduct-offshore-development-in-vietnam-2', '', '', '2025-07-28 16:19:04', '2025-07-28 07:19:04', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=760', 0, 'blog', '', 0),
(761, 2, '2025-07-28 16:39:00', '2025-07-28 07:39:00', '<!-- wp:paragraph -->\n<p>Đối với các doanh nghiệp lần đầu tiên cân nhắc triển khai phát triển offshore, hành trình này thường đi kèm với nhiều nỗi lo và băn khoăn. Đặc biệt, sự khác biệt về ngôn ngữ và văn hóa gây ra không ít lo ngại trong giao tiếp, trở thành một thách thức lớn. Ngoài ra, nhiều doanh nghiệp còn lo lắng liệu chất lượng phát triển có đạt được tiêu chuẩn nội địa hay không. Hơn nữa, cũng không ít doanh nghiệp trăn trở về sự khó khăn trong việc quản lý tiến độ trong môi trường làm việc từ xa và chênh lệch múi giờ.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tìm được công ty phát triển đáng tin cậy và đảm bảo tính minh bạch trong chi phí cũng là mối quan tâm lớn. Bên cạnh đó, những thắc mắc liên quan đến hợp đồng pháp lý hay bảo vệ quyền sở hữu trí tuệ cũng trở thành những rào cản lớn khi tiến hành phát triển offshore. Việc cân nhắc đến ảnh hưởng từ sự khác biệt văn hóa đối với dự án cũng là một điểm không thể bỏ qua.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Như vậy, khi bắt đầu phát triển offshore, luôn có nhiều nỗi lo và nghi vấn đi kèm, đòi hỏi doanh nghiệp phải tìm ra quy trình phù hợp để dẫn đến thành công.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Chìa khóa để triển khai phát triển offshore thành công nằm ở việc lập kế hoạch (planning) kỹ lưỡng ngay từ giai đoạn chuẩn bị và giao tiếp (communication) hiệu quả trong suốt quá trình.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Việc xác định rõ mục tiêu và yêu cầu của dự án, cũng như xây dựng một tầm nhìn chung mà tất cả các bên liên quan đều có thể chia sẻ, sẽ giúp tránh được sự sai lệch về kỳ vọng và đảm bảo tiến độ diễn ra suôn sẻ.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Trong bài viết này, <strong>AIoT</strong>, đơn vị đang triển khai dịch vụ phát triển offshore tại Việt Nam, sẽ chia sẻ <strong>bước 1 trong 7 bước cụ thể để triển khai phát triển offshore</strong>, kết hợp với kinh nghiệm thực tiễn nhằm giúp bạn hiểu rõ cách tiếp cận đúng đắn và cách tìm kiếm đối tác phù hợp.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Bước 1: Điều phối nội bộ và xây dựng cơ cấu dự án</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Trước khi bắt đầu phát triển offshore, điều quan trọng nhất chính là sự điều phối nội bộ trong doanh nghiệp. Để dự án thành công, không chỉ bộ phận IT mà cả ban lãnh đạo và các phòng ban liên quan cũng cần cùng nhau thiết lập một cơ cấu tổ chức mang tính toàn diện. Những nỗ lực ngay từ giai đoạn này sẽ có ảnh hưởng lớn đến tiến độ và kết quả của dự án về sau.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cách tiến hành điều phối nội bộ</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>1. Thu hút sự tham gia của ban lãnh đạo</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Để dự án thành công, sự thấu hiểu và hỗ trợ từ ban lãnh đạo là điều không thể thiếu. Khi họ nhận thức được tầm quan trọng của dự án, việc phân bổ ngân sách và nguồn lực sẽ trở nên suôn sẻ hơn. Việc báo cáo tiến độ định kỳ và phản ánh ý kiến từ ban lãnh đạo sẽ giúp thúc đẩy sự tham gia của họ.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>2. Giải thích mục tiêu và hiệu quả kỳ vọng của dự án</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Việc làm rõ mục tiêu của phát triển offshore và phổ biến hiệu quả kỳ vọng trong nội bộ là rất quan trọng. Bằng cách nêu bật các lợi ích cụ thể như tiết giảm chi phí hay tăng tốc độ phát triển, doanh nghiệp sẽ dễ dàng nhận được sự ủng hộ từ toàn công ty.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>3. Đảm bảo ngân sách</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Để dự án diễn ra thuận lợi, cần đảm bảo có đủ ngân sách. Trình bày rõ chỉ số ROI (hiệu quả đầu tư) với ban lãnh đạo và giải thích tính hợp lý của ngân sách là chìa khóa. Khi ngân sách được phê duyệt, dự án có thể tiến hành với sự yên tâm cao hơn.<br></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>4. Chia sẻ rủi ro và biện pháp đối phó</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Phát triển offshore luôn tiềm ẩn rủi ro. Việc xác định rủi ro từ trước và chia sẻ các biện pháp ứng phó sẽ giúp nâng cao tính minh bạch của dự án và tạo được sự tin tưởng từ các bên liên quan.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><br><strong>5. Phối hợp với các bộ phận liên quan</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Việc tăng cường phối hợp với tất cả các bộ phận tham gia vào dự án là điều không thể thiếu. Xác định rõ các phòng ban liên quan đến việc định nghĩa yêu cầu và làm rõ vai trò, trách nhiệm của từng bộ phận sẽ giúp công việc được thực hiện hiệu quả hơn.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><br><strong>6. Điều chỉnh lịch trình</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Cần điều chỉnh lịch trình sao cho các bộ phận có thể phối hợp nhịp nhàng. Đặc biệt, việc đồng bộ hóa mốc thời gian với đội ngũ phát triển offshore là yếu tố quan trọng giúp dự án tiến triển thuận lợi.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><br><strong>7. Thiết lập hệ thống giao tiếp</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Cần thiết kế cơ chế họp phù hợp với chênh lệch múi giờ. Để đảm bảo giao tiếp trơn tru với đội offshore, hãy lên lịch các cuộc họp định kỳ và xây dựng môi trường cho phép chia sẻ thông tin theo thời gian thực.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><br><strong>8. Lựa chọn công cụ giao tiếp</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Các công cụ giao tiếp phù hợp là không thể thiếu để chia sẻ thông tin hiệu quả. Việc lựa chọn các công cụ chat hoặc quản lý dự án mà mọi người đều dễ sử dụng sẽ giúp tạo môi trường làm việc thông suốt.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><br><strong>9. Thiết lập quy tắc chia sẻ thông tin</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Cần xây dựng quy tắc chia sẻ thông tin liên quan đến dự án để đảm bảo luồng thông tin giữa các bên liên quan diễn ra trôi chảy. Nhờ đó, có thể tránh được việc bỏ sót thông tin hoặc hiểu nhầm.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Tổng kết</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Khi giữa bộ phận phụ trách phát triển offshore và đội ngũ thực tế tại hiện trường có sự chênh lệch về nhận thức, khả năng cao tiến độ của dự án sẽ bị ảnh hưởng. Đặc biệt, sự thấu hiểu và hỗ trợ từ ban lãnh đạo đóng vai trò vô cùng quan trọng trong việc đảm bảo ngân sách và điều phối giữa các bộ phận. Bằng cách nắm vững những điểm này và thúc đẩy quá trình điều phối nội bộ, doanh nghiệp có thể xây dựng nền tảng vững chắc cho phát triển offshore. Hãy cùng nhau bước những bước đầu tiên hướng đến thành công.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Hãy để chúng tôi đồng hành cùng bạn!</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT luôn hướng đến việc trở thành đối tác đáng tin cậy, hỗ trợ sự thành công trong kinh doanh của khách hàng bằng cách giải quyết các thách thức trong phát triển offshore và xây dựng mối quan hệ hợp tác lâu dài. Rất mong nhận được sự tin tưởng của quý khách, cùng nhau hướng đến thành công.<br>Nếu bạn đang gặp khó khăn với phát triển offshore, hoặc đang cân nhắc bắt đầu một dự án mới, đừng ngần ngại liên hệ với chúng tôi. Chúng tôi sẽ đồng hành cùng bạn với bề dày kinh nghiệm, năng lực kỹ thuật cao, cùng quy trình kiểm soát chất lượng và bảo mật chặt chẽ, nhằm dẫn dắt doanh nghiệp đến thành công.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆ Muốn vừa tiết kiệm chi phí vừa đảm bảo chất lượng phát triển cao<br>☆ Muốn tăng cường năng lực cạnh tranh trên thị trường bằng quy trình phát triển nhanh chóng<br>☆ Muốn xây dựng mối quan hệ lâu dài với một đối tác đáng tin cậy</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Chúng tôi hoàn toàn có thể đáp ứng những nhu cầu đó.<br>Hãy liên hệ với chúng tôi ngay hôm nay.<br>Các chuyên gia tư vấn của chúng tôi sẽ đề xuất giải pháp tối ưu, phù hợp với nhu cầu cụ thể của quý khách.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vui lòng liên hệ với chúng tôi qua mục ≪Liên hệ≫!<br>Hoặc gọi ngay đến số điện thoại sau để được hỗ trợ:<br><strong>TEL: 03-4500-6968</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Happy Together!</p>\n<!-- /wp:paragraph -->', 'Cách triển khai phát triển offshore: 7 bước cụ thể – Phần 1', '', 'publish', 'closed', 'closed', '', 'steps-to-progress-offshore-development-7-specific-steps-part-1', '', '', '2025-07-28 16:39:00', '2025-07-28 07:39:00', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=761', 0, 'blog', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(764, 2, '2025-07-28 16:53:50', '2025-07-28 07:53:50', '<!-- wp:paragraph -->\n<p>Đối với các doanh nghiệp lần đầu tiên cân nhắc triển khai phát triển offshore, hành trình này đi kèm với nhiều nỗi lo và băn khoăn. Đặc biệt, những lo ngại trong giao tiếp do sự khác biệt về ngôn ngữ và văn hóa là một vấn đề lớn. Ngoài ra, việc phát triển có đạt được tiêu chuẩn chất lượng như trong nước hay không cũng là mối quan tâm không nhỏ. Hơn nữa, không ít doanh nghiệp cảm thấy khó khăn trong việc quản lý tiến độ trong môi trường làm việc từ xa và sự chênh lệch múi giờ.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Việc tìm được một công ty phát triển đáng tin cậy hay đảm bảo tính minh bạch về chi phí cũng là những mối quan tâm quan trọng. Những thắc mắc liên quan đến hợp đồng pháp lý hay bảo vệ quyền sở hữu trí tuệ cũng trở thành rào cản lớn trong quá trình triển khai phát triển offshore. Và việc cân nhắc ảnh hưởng từ sự khác biệt về nền tảng văn hóa đến dự án cũng là điều không thể bỏ qua.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Như vậy, trong bối cảnh có rất nhiều nỗi lo và nghi vấn vây quanh việc phát triển offshore lần đầu tiên, điều quan trọng là doanh nghiệp phải tìm ra được quy trình phù hợp để hướng đến thành công.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Chìa khóa để phát triển offshore thành công nằm ở việc lên kế hoạch (≪planning≫) kỹ lưỡng ngay từ giai đoạn chuẩn bị và thiết lập giao tiếp (≪communication≫) hiệu quả.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Bằng cách xác định rõ mục tiêu và yêu cầu của dự án, đồng thời xây dựng một tầm nhìn chung mà tất cả các bên liên quan đều có thể chia sẻ, doanh nghiệp có thể tránh được sự chênh lệch về kỳ vọng và đảm bảo dự án tiến triển một cách suôn sẻ.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Trong bài viết này, AIoT – đơn vị đang triển khai dịch vụ phát triển offshore tại Việt Nam – sẽ giới thiệu&nbsp;<strong>Bước 3 trong 7 bước cụ thể</strong>&nbsp;về cách triển khai phát triển offshore, kết hợp cùng những kinh nghiệm thực tiễn để giúp bạn tìm ra phương pháp phù hợp nhất.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Bước 4: Ký kết hợp đồng và xây dựng cơ cấu nội bộ</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">1. <strong>Hệ thống giao tiếp</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Họp định kỳ</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Thiết lập các cuộc họp trực tuyến thường xuyên để kiểm tra tiến độ dự án và giải quyết các vấn đề phát sinh.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Triển khai công cụ chia sẻ thông tin</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Sử dụng các công cụ giao tiếp như Slack hoặc Teams để chia sẻ thông tin theo thời gian thực.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">2. <strong>Quản lý dự án</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Bổ nhiệm quản lý dự án (PM)</strong><br>Chỉ định quản lý dự án có nhiệm vụ phối hợp với đội offshore và chịu trách nhiệm quản lý toàn bộ dự án.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Sử dụng hệ thống quản lý công việc</strong><br>Dùng các công cụ quản lý như JIRA hoặc Trello để theo dõi tiến độ các đầu việc.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">3. <strong>Quản lý chất lượng</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:list {\"ordered\":true,\"start\":3} -->\n<ol start=\"3\" class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Xây dựng hệ thống đảm bảo chất lượng</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Thực hiện review mã và kiểm thử định kỳ để đảm bảo chất lượng sản phẩm.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Thiết lập tiêu chuẩn rõ ràng</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Xác định rõ tiêu chuẩn chất lượng và quy trình nghiệm thu sản phẩm, đồng thời phổ biến cho đội offshore.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">4. <strong>Chia sẻ kiến thức và đào tạo</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:list {\"ordered\":true,\"start\":4} -->\n<ol start=\"4\" class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Chương trình onboarding</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Chuẩn bị chương trình onboarding để đội offshore nhanh chóng thích nghi với dự án.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Đào tạo kỹ thuật</strong></li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Thực hiện các buổi đào tạo định kỳ về công nghệ và công cụ cần thiết cho dự án.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">5. <strong>Quản lý rủi ro</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Đánh giá rủi ro</strong><br>Xác định trước các rủi ro có thể xảy ra trong dự án và xây dựng hệ thống đối phó phù hợp.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Quy trình xử lý sự cố</strong><br>Thiết lập rõ ràng quy trình ứng phó khi có sự cố xảy ra.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p><strong>Thanh toán trong hợp đồng khoán trọn gói (請負契約)</strong><br>Trong hợp đồng khoán trọn gói, hình thức thanh toán phổ biến thường bao gồm:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Thanh toán tạm ứng</strong><br>Khi ký hợp đồng, một tỷ lệ nhất định của tổng giá trị hợp đồng (thường là 20%–30%) sẽ được thanh toán trước để đảm bảo nguồn lực và chi phí chuẩn bị trước khi bắt đầu dự án.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Thanh toán theo từng mốc tiến độ (milestone)</strong><br>Thanh toán được thực hiện sau khi đạt được các mốc tiến độ đã được xác định trước. Đây là phương thức giúp đảm bảo có thể kiểm tra chất lượng sản phẩm từng giai đoạn trong quá trình thực hiện.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Thanh toán khi bàn giao cuối cùng</strong><br>Trước khi bàn giao sản phẩm cuối cùng, một phần còn lại của giá trị hợp đồng sẽ được thanh toán. Lúc này, cần đáp ứng đầy đủ các điều kiện nghiệm thu đã quy định.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Hãy để chúng tôi đồng hành cùng bạn!</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT luôn hướng đến việc trở thành đối tác đáng tin cậy, hỗ trợ sự thành công trong kinh doanh của khách hàng bằng cách giải quyết các thách thức trong phát triển offshore và xây dựng mối quan hệ hợp tác lâu dài.<br>Rất mong nhận được sự tin tưởng của quý khách, cùng nhau hướng đến thành công.<br>Nếu bạn đang gặp khó khăn với phát triển offshore, hoặc đang cân nhắc bắt đầu một dự án mới, đừng ngần ngại liên hệ với chúng tôi. Chúng tôi sẽ đồng hành cùng bạn với bề dày kinh nghiệm, năng lực kỹ thuật cao, cùng quy trình kiểm soát chất lượng và bảo mật nghiêm ngặt, nhằm dẫn dắt doanh nghiệp đến thành công.<br><br>☆ Muốn vừa tiết kiệm chi phí vừa đảm bảo chất lượng phát triển cao<br>☆ Muốn xây dựng hệ thống phát triển nhanh chóng để nâng cao năng lực cạnh tranh trên thị trường<br>☆ Muốn xây dựng mối quan hệ lâu dài với một đối tác đáng tin cậy</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Chúng tôi hoàn toàn có thể đáp ứng những yêu cầu đó.<br>Hãy liên hệ với chúng tôi ngay hôm nay – các chuyên gia tư vấn của chúng tôi sẽ đề xuất giải pháp tối ưu, phù hợp với nhu cầu của quý khách.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vui lòng liên hệ qua mục ≪Liên hệ≫!<br>Hoặc gọi đến số điện thoại dưới đây:<br><strong>TEL: 03-4500-6968</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Happy Together!</strong></p>\n<!-- /wp:paragraph -->', 'Cách triển khai phát triển offshore: 7 bước cụ thể – Phần 4', '', 'publish', 'closed', 'closed', '', 'how-to-proceed-with-offshore-development-7-specific-steps-part-4', '', '', '2025-07-28 16:55:21', '2025-07-28 07:55:21', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=764', 0, 'blog', '', 0),
(767, 2, '2025-07-28 18:06:07', '2025-07-28 09:06:07', '<!-- wp:paragraph -->\n<p>Đối với các doanh nghiệp đang cân nhắc phát triển offshore, nỗi lo lớn nhất có lẽ là: <strong>“Liệu dự án phát triển có thất bại không?”</strong> Ngay cả khi phát triển hệ thống trong nội bộ công ty hay thuê ngoài trong nước, việc chậm tiến độ hay gặp vấn đề về chất lượng đều là những rủi ro phổ biến.Đặc biệt, với phát triển offshore ở nước ngoài, những khác biệt về văn hóa, ngôn ngữ, khoảng cách địa lý hay chênh lệch múi giờ càng làm tăng thêm sự lo ngại: <strong>“Liệu mình có thể thực sự thành công không?”</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tuy nhiên, AIoT tự hào đã dẫn dắt nhiều doanh nghiệp Nhật Bản đi đến thành công trong các dự án phát triển offshore.<br>Ngay cả những công ty từng gặp thất bại khi hợp tác với các đơn vị offshore khác, sau khi chuyển sang hợp tác cùng chúng tôi, đều đã xây dựng được mối quan hệ đối tác ổn định và lâu dài.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Trong bài viết này, chúng tôi sẽ phân tích chi tiết các nguyên nhân chính dẫn đến thất bại trong phát triển offshore, đồng thời đưa ra những giải pháp cụ thể để vượt qua khó khăn và hướng tới thành công.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Lý do khiến phát triển offshore thất bại</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">1. <strong>Thiếu đồng bộ trong giao tiếp</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Trong phát triển offshore, khoảng cách địa lý, chênh lệch múi giờ và rào cản ngôn ngữ là những trở ngại lớn. Điều này dẫn đến việc yêu cầu dự án hoặc tiến độ không được truyền đạt chính xác, khiến kết quả không đạt như kỳ vọng.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">2. <strong>Khác biệt văn hóa</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Sự khác nhau trong văn hóa kinh doanh và phong cách làm việc có thể cản trở tiến độ dự án. Ví dụ, sự khác biệt về tốc độ ra quyết định, tần suất báo cáo hay quan điểm về chất lượng có thể gây ra trì hoãn hoặc làm giảm chất lượng sản phẩm.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">3. <strong>Thiếu sót trong việc xác định yêu cầu</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Trong phát triển offshore, việc định nghĩa yêu cầu ngay từ đầu là vô cùng quan trọng. Nếu bắt đầu dự án khi yêu cầu còn mơ hồ, sẽ dễ phát sinh nhiều thay đổi giữa chừng, dẫn đến phát sinh thêm chi phí và thời gian.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">4. <strong>Quản lý chất lượng không chặt chẽ</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Nếu đội phát triển tại offshore có kỹ năng hoặc quy trình quản lý chất lượng yếu, sản phẩm bàn giao có thể bị lỗi nhiều, làm tăng thời gian và chi phí chỉnh sửa.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">5. <strong>Thiếu năng lực quản lý dự án</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Việc phối hợp và theo dõi tiến độ với đội offshore là yếu tố then chốt. Nếu thiếu quản lý dự án hiệu quả, tiến độ sẽ bị trì trệ, và các vấn đề nhỏ có thể bị bỏ sót cho đến khi quá muộn để xử lý.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Chiến lược để thành công trong phát triển offshore</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>1. Xác định yêu cầu rõ ràng và lập tài liệu</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Trước khi bắt đầu dự án, việc xác định chi tiết các yêu cầu và chia sẻ dưới dạng tài liệu là rất quan trọng. Nhờ đó, đội offshore có thể hiểu chính xác và tiến hành phát triển theo đúng định hướng. Ngoài ra, khi có thay đổi phát sinh, việc cập nhật và chia sẻ lại tài liệu sẽ giúp ngăn ngừa sai lệch trong quá trình triển khai.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>2. Xây dựng hệ thống giao tiếp hiệu quả</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Việc thiết lập các cuộc họp định kỳ và cơ chế báo cáo tiến độ sẽ giúp ngăn ngừa các sai lệch trong giao tiếp. Các công cụ như Slack, Microsoft Teams (cho chat), hoặc Zoom, Google Meet (cho họp video) sẽ rất hữu ích. Ngoài ra, điều chỉnh lịch trình phù hợp với múi giờ khác nhau cũng là yếu tố quan trọng.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>3. Hiểu và tôn trọng sự khác biệt văn hóa</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Việc hiểu và tôn trọng văn hóa, phong cách làm việc của đối tác offshore là rất quan trọng. Chẳng hạn, lên lịch trình có tính đến các ngày lễ và thói quen lao động địa phương sẽ giúp duy trì động lực làm việc của nhóm. Việc xây dựng mối quan hệ tin cậy bằng cách phản hồi thường xuyên và thể hiện sự cảm ơn cũng rất hiệu quả.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>4. Quản lý chất lượng một cách nghiêm ngặt</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Để đảm bảo chất lượng, cần làm rõ và thực hiện thường xuyên các quy trình như kiểm tra mã (code review) và kiểm thử (testing). Ngoài ra, việc hỗ trợ đào tạo và kỹ thuật cho nhóm offshore để nâng cao kỹ năng cũng rất hữu ích.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>5. Quản lý dự án phù hợp</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Sử dụng các công cụ quản lý dự án như Jira, Trello, Asana để trực quan hóa tiến độ công việc và các vấn đề cần xử lý. Việc bố trí quản lý dự án (PM) có vai trò điều phối và theo sát tiến độ giữa hai bên sẽ giúp phát hiện và xử lý vấn đề kịp thời.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>6. Triển khai dự án thử nghiệm (Pilot Project)</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Thay vì giao ngay một dự án lớn cho đơn vị offshore, việc thực hiện trước một dự án thử nhỏ sẽ giúp kiểm tra năng lực và đánh giá các vấn đề trong giao tiếp. Qua đó, có thể rút ra các điểm cần cải thiện trước khi bắt đầu dự án chính thức.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>7. Lựa chọn đối tác đáng tin cậy</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Để phát triển offshore thành công, điều quan trọng nhất là chọn đúng đối tác tin cậy. Cần xem xét kỹ lưỡng về thành tích thực hiện, đánh giá của khách hàng, năng lực kỹ thuật và khả năng giao tiếp để chọn đối tác phù hợp với nhu cầu của doanh nghiệp.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Lý do nên chọn AIoT</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT sở hữu nền tảng vững chắc để đảm bảo đưa dự án phát triển offshore của quý khách hàng đến thành công.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">◎ Hiểu chính xác yêu cầu và quản lý chất lượng nghiêm ngặt</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Chúng tôi tiến hành lập tài liệu chi tiết các yêu cầu và đặc tả kỹ thuật ngay từ giai đoạn khởi động dự án, đồng thời thực hiện quy trình xác nhận kỹ lưỡng với khách hàng. Nhờ đó, tất cả các bên liên quan đều nắm rõ cùng một định hướng, giúp quá trình triển khai diễn ra suôn sẻ. Ngoài ra, chúng tôi tuân thủ nghiêm ngặt quy chuẩn coding và thực hiện kiểm thử đa tầng nhằm mang đến sản phẩm có chất lượng cao, ít lỗi.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">◎ Đảm bảo cả tính bảo mật và khả năng sử dụng</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Chúng tôi tuân thủ các quy định pháp luật của Nhật Bản cũng như các tiêu chuẩn quốc tế về bảo mật dữ liệu và phòng chống lỗ hổng. Đồng thời, chúng tôi chú trọng đến trải nghiệm người dùng, cung cấp các chức năng và giao diện dễ sử dụng. Phản hồi từ người dùng được tiếp nhận nhanh chóng và áp dụng cho việc cải tiến liên tục.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">◎ Quản lý tiến độ rõ ràng và năng lực thích ứng linh hoạt</h2>\n<!-- /wp:heading -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"level\":1,\"align\":\"wide\"} -->\n<h1 class=\"wp-block-heading alignwide\"><strong><mark style=\"background-color:rgba(0, 0, 0, 0)\" class=\"has-inline-color has-material-grey-color\">Hãy yên tâm để chúng tôi hỗ trợ bạn!</mark></strong></h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT luôn nỗ lực trở thành đối tác đáng tin cậy, đồng hành cùng sự thành công trong kinh doanh của Quý khách hàng bằng cách giải quyết các thách thức trong phát triển offshore và xây dựng mối quan hệ hợp tác lâu dài. Hãy để AIoT đồng hành cùng Quý khách hướng tới thành công!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Đối với những doanh nghiệp đang băn khoăn về việc phát triển offshore hay đang lên kế hoạch cho một dự án mới, xin đừng ngần ngại liên hệ với chúng tôi. Với kinh nghiệm phong phú, năng lực kỹ thuật cao cùng quy trình kiểm soát chất lượng và bảo mật chặt chẽ, AIoT cam kết sẽ hỗ trợ đưa doanh nghiệp của Quý khách đến thành công.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆ Muốn giảm chi phí mà vẫn đảm bảo chất lượng cao<br>☆ Muốn nâng cao năng lực cạnh tranh bằng mô hình phát triển nhanh, hiệu quả<br>☆ Muốn xây dựng mối quan hệ hợp tác bền vững với đối tác đáng tin cậy</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Chúng tôi sẵn sàng đáp ứng mọi nhu cầu đó.<br>Hãy liên hệ với chúng tôi ngay hôm nay – các chuyên gia tư vấn của AIoT sẽ đề xuất giải pháp tối ưu, phù hợp nhất với nhu cầu của Quý khách.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Vui lòng liên hệ với chúng tôi qua mục ≪Liên hệ≫!<br>Hoặc gọi đến số điện thoại dưới đây:<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Happy Together!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '☆ Thất bại và thành công trong phát triển offshore ☆', '', 'publish', 'closed', 'closed', '', 'reasons-why-offshore-development-fails-and-strategies-for-success-2', '', '', '2025-07-28 18:06:07', '2025-07-28 09:06:07', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=767', 0, 'blog', '', 0),
(769, 2, '2025-07-28 18:42:36', '2025-07-28 09:42:36', '<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Lễ hội Đổi mới sáng tạo: Kỷ niệm 5 năm NIC và sự kiện Innovate Vietnam 2024</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Trung tâm Đổi mới sáng tạo Quốc gia (NIC) sẽ kỷ niệm 5 năm thành lập cùng với sự kiện&nbsp;<em>Innovate Vietnam 2024</em>&nbsp;đầy sôi động. Sự kiện đặc biệt này do Bộ Kế hoạch và Đầu tư (MPI) chủ trì, phối hợp tổ chức cùng NIC và VCCorp, sẽ diễn ra từ ngày 1 đến ngày 2 tháng 10 năm 2024 tại khuôn viên NIC trong Khu công nghệ cao Hòa Lạc, Hà Nội.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Tầm nhìn cho tương lai</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Với chủ đề&nbsp;<strong>“Khát vọng - Tiên phong - Bứt phá”</strong>, Innovate Vietnam 2024 hướng đến khơi dậy tương lai đổi mới sáng tạo của Việt Nam. Sự kiện nhấn mạnh hành trình chuyển mình mạnh mẽ của NIC trong 5 năm qua và vai trò then chốt của trung tâm trong việc phát triển hệ sinh thái đổi mới sáng tạo quốc gia.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Khách mời và diễn giả danh tiếng</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Sự kiện sẽ có sự tham dự của Thủ tướng Phạm Minh Chính cùng các lãnh đạo bộ ngành, cơ quan chính phủ, viện nghiên cứu, trường đại học, doanh nghiệp, ngân hàng, quỹ đầu tư và tổ chức quốc tế. Sự hiện diện của họ thể hiện tầm quan trọng của NIC trong việc kiến tạo một môi trường đổi mới năng động tại Việt Nam.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Điểm nhấn của Innovate Vietnam 2024</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Diễn thuyết chính</strong>: Những chia sẻ đầy cảm hứng từ các chuyên gia hàng đầu trong lĩnh vực đổi mới và công nghệ.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Tọa đàm chuyên đề</strong>: Các cuộc đối thoại sôi nổi về tương lai đổi mới, xu hướng công nghệ và cơ hội đầu tư.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Triển lãm công nghệ</strong>: Trưng bày các giải pháp đột phá và công nghệ tiên tiến đến từ các doanh nghiệp lớn và startup.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Kết nối mạng lưới</strong>: Tạo điều kiện giao lưu, hợp tác giữa các nhà sáng tạo, nhà đầu tư và lãnh đạo ngành.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Sự góp mặt của CEO AIoT</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Một trong những điểm sáng của sự kiện là sự tham gia của&nbsp;<strong>CEO AIoT</strong>, người sẽ chia sẻ góc nhìn về việc tích hợp AI và IoT để thúc đẩy đổi mới. Sự hiện diện của ông cho thấy tầm quan trọng của các công nghệ này trong việc định hình tương lai của nhiều ngành công nghiệp.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\"><strong>Hành trình và thành tựu của NIC</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Trong 5 năm qua, NIC đã khẳng định vai trò là nền tảng cốt lõi trong hệ sinh thái đổi mới sáng tạo tại Việt Nam. Thông qua các sáng kiến và hợp tác chiến lược, NIC đã thúc đẩy văn hóa đổi mới, hỗ trợ startup và khuyến khích phát triển công nghệ tiên tiến.&nbsp;<em>Innovate Vietnam 2024</em>&nbsp;chính là minh chứng cho cam kết của NIC trong việc kiến tạo đột phá và truyền cảm hứng cho một tương lai đầy hứa hẹn.</p>\n<!-- /wp:paragraph -->', 'Lễ hội Đổi mới sáng tạo: Kỷ niệm 5 năm thành lập NIC và Innovate Vietnam 2024', '', 'publish', 'closed', 'closed', '', 'nic-innovate-vietnam-2024', '', '', '2025-07-28 18:42:36', '2025-07-28 09:42:36', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=769', 0, 'blog', '', 0),
(770, 2, '2025-07-28 18:50:01', '2025-07-28 09:50:01', '<!-- wp:paragraph -->\n<p>Từ ngày 26 đến ngày 29 tháng 3 năm 2025, đoàn đại biểu của Hiệp hội Chuyển đổi số Việt Nam tại Nhật Bản (VADX) đã tháp tùng Đại sứ Việt Nam tại Nhật Bản Phạm Quang Hiệu trong chuyến thăm khu vực Kyushu. Đoàn đã đến thăm các tỉnh Miyazaki, Oita, Kumamoto và Saga, đồng thời gặp gỡ và trao đổi với các lãnh đạo địa phương về chuyển đổi số, hợp tác công nghệ và phát triển nguồn nhân lực. Ông Nguyễn Mạnh Hùng, Giám đốc điều hành AIoT, cũng đã tham gia cùng các thành viên của VADX và đóng góp tích cực vào các cuộc thảo luận.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":663,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/04/202504010307-Image.jpeg\" alt=\"\" class=\"wp-image-663\"/><figcaption class=\"wp-element-caption\">Ông Nguyễn Mạnh Hùng, Giám đốc điều hành AIoT, cùng với các thành viên của VADX tham gia cuộc họp và tiến hành trao đổi ý kiến.</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><strong>Kyushu – Vùng đất của cơ hội</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Các lãnh đạo địa phương ở Kyushu rất quan tâm đến cộng đồng người Việt Nam đang hoạt động tại Nhật Bản, đặc biệt là các kỹ sư IT. Họ đánh giá cao đóng góp của lao động Việt và mong muốn mở rộng hợp tác không chỉ trong các ngành công nghiệp truyền thống mà còn trong các lĩnh vực công nghệ cao.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Trong các cuộc họp, cũng đã thảo luận về việc ứng dụng AI trong sản xuất và nông nghiệp thông minh, cũng như hỗ trợ đào tạo trước khi lao động Việt Nam sang Nhật. Đặc biệt, hỗ trợ người Việt trong việc lấy bằng lái xe tại Nhật được xem là một giải pháp thiết thực cho cộng đồng người Việt.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":659,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/04/202504010257-3.jpg\" alt=\"\" class=\"wp-image-659\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><strong>Bắt tay vì tương lai</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Chuyến thăm lần này không chỉ dừng lại ở việc giao lưu mà đã trở thành bước khởi đầu xây dựng quan hệ hợp tác thực tế. Các kế hoạch cụ thể đang được tiến hành nhằm hỗ trợ doanh nghiệp hai nước, giúp kỹ sư Việt Nam có thể phát triển trong môi trường tốt hơn tại Nhật Bản.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Kyushu không phải là điểm kết thúc của chuyến thăm này, mà con đường kết nối vẫn sẽ tiếp tục mở rộng. Hẹn gặp lại trong những dự án mới – hướng tới tương lai tươi sáng hơn cho công nghệ và nguồn nhân lực Việt Nam!</p>\n<!-- /wp:paragraph -->', 'Hành trình đến Kyushu: Bắt tay bằng công nghệ – Kết nối nhân lực Việt Nam – Nhật Bản!', '', 'publish', 'closed', 'closed', '', 'kyushu-journey-vietnam-japan', '', '', '2025-07-28 18:50:01', '2025-07-28 09:50:01', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=770', 0, 'blog', '', 0),
(773, 2, '2025-07-28 18:57:09', '2025-07-28 09:57:09', '<!-- wp:paragraph -->\n<p>Vừa qua, nhân dịp Ngày Doanh nhân Việt Nam và kỷ niệm ngày thành lập Trường Đại học Bách Khoa Hà Nội, AIoT đã vinh dự đồng tổ chức sự kiện&nbsp;<strong>\"STARTUP IN TECH – Hành trình khởi nghiệp công nghệ\"</strong>. Đây là cơ hội quý giá để chia sẻ những kinh nghiệm thực tiễn từ các CEO công nghệ hàng đầu, mang đến góc nhìn mới cho cộng đồng khởi nghiệp.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tại sự kiện, ông <strong>Nguyễn Mạnh Hùng</strong> – CEO của AIoT – đã có bài chia sẻ đầy nhiệt huyết về hành trình khởi nghiệp trong lĩnh vực chuyển đổi số và công nghệ. Từ kinh nghiệm phong phú của mình, ông đã truyền cảm hứng đến nhiều bạn trẻ thông qua những câu chuyện về cách tìm ra thị trường ngách và xây dựng doanh nghiệp thành công trong môi trường cạnh tranh khốc liệt.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Nội dung chính được thảo luận bao gồm</strong>:<br>✔️ Làm thế nào để vượt qua những thách thức khi khởi nghiệp trong lĩnh vực công nghệ<br>✔️ Vai trò của AI và IoT trong quá trình chuyển đổi số<br>✔️ Cách tạo sự khác biệt cho mô hình kinh doanh trong thị trường đông đúc<br>✔️ Tầm quan trọng của việc xây dựng đội ngũ hướng đến tăng trưởng dài hạn</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Sự kiện đã mang lại những kiến thức giá trị và nguồn cảm hứng mạnh mẽ cho các bạn trẻ đam mê công nghệ và khởi nghiệp. AIoT tự hào được góp phần thúc đẩy và chia sẻ các giải pháp công nghệ trong thời đại số, hỗ trợ doanh nghiệp tối ưu hóa quy trình và nâng cao hiệu quả hoạt động.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Về AIoT</strong>: AIoT là đơn vị tiên phong trong việc ứng dụng công nghệ AI và IoT vào các giải pháp chuyển đổi số cho doanh nghiệp. Chúng tôi luôn nỗ lực cung cấp các giải pháp đổi mới giúp doanh nghiệp khai thác tiềm năng công nghệ một cách tối ưu và bền vững.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Hãy liên hệ với AIoT để cùng khám phá các giải pháp công nghệ tiên tiến và đồng hành trên hành trình phát triển doanh nghiệp của bạn!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":445,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2024/10/202410170640-4624576345377638623416678100198556909098138n.jpg\" alt=\"\" class=\"wp-image-445\"/></figure>\n<!-- /wp:image -->', 'Hội thảo trực tuyến \"STARTUP IN TECH – Hành trình khởi nghiệp công nghệ\" đã được tổ chức thành công rực rỡ!', '', 'publish', 'closed', 'closed', '', 'the-webinar-startup-in-tech-a-journey-into-tech-entrepreneurship-was-successfully-held', '', '', '2025-07-28 18:57:09', '2025-07-28 09:57:09', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=773', 0, 'blog', '', 0),
(777, 2, '2025-08-13 16:12:51', '2025-08-13 07:12:51', '', 'FONG0062', '', 'inherit', 'open', 'closed', '', 'fong0062', '', '', '2025-08-13 16:12:51', '2025-08-13 07:12:51', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130712-FONG0062.jpg', 0, 'attachment', 'image/jpeg', 0),
(778, 2, '2025-08-13 16:13:40', '2025-08-13 07:13:40', '', 'FONG0062', '', 'inherit', 'open', 'closed', '', 'fong0062-2', '', '', '2025-08-13 16:13:40', '2025-08-13 07:13:40', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130713-FONG0062.jpg', 0, 'attachment', 'image/jpeg', 0),
(779, 2, '2025-08-13 16:13:40', '2025-08-13 07:13:40', '', 'FONG0079', '', 'inherit', 'open', 'closed', '', 'fong0079', '', '', '2025-08-13 16:13:40', '2025-08-13 07:13:40', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130713-FONG0079.jpg', 0, 'attachment', 'image/jpeg', 0),
(780, 2, '2025-08-13 16:13:40', '2025-08-13 07:13:40', '', 'FONG0092', '', 'inherit', 'open', 'closed', '', 'fong0092', '', '', '2025-08-13 16:13:40', '2025-08-13 07:13:40', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130713-FONG0092.jpg', 0, 'attachment', 'image/jpeg', 0),
(781, 2, '2025-08-13 16:13:41', '2025-08-13 07:13:41', '', 'FONG0116', '', 'inherit', 'open', 'closed', '', 'fong0116', '', '', '2025-08-13 16:13:41', '2025-08-13 07:13:41', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130713-FONG0116.jpg', 0, 'attachment', 'image/jpeg', 0),
(782, 2, '2025-08-13 16:13:41', '2025-08-13 07:13:41', '', 'FONG0586', '', 'inherit', 'open', 'closed', '', 'fong0586', '', '', '2025-08-13 16:13:41', '2025-08-13 07:13:41', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130713-FONG0586.jpg', 0, 'attachment', 'image/jpeg', 0),
(783, 2, '2025-08-13 16:13:42', '2025-08-13 07:13:42', '', 'FONG0234', '', 'inherit', 'open', 'closed', '', 'fong0234', '', '', '2025-08-13 16:13:42', '2025-08-13 07:13:42', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130713-FONG0234.jpg', 0, 'attachment', 'image/jpeg', 0),
(784, 2, '2025-08-13 16:13:42', '2025-08-13 07:13:42', '', 'FONG0218', '', 'inherit', 'open', 'closed', '', 'fong0218', '', '', '2025-08-13 16:13:42', '2025-08-13 07:13:42', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130713-FONG0218.jpg', 0, 'attachment', 'image/jpeg', 0),
(785, 2, '2025-08-13 16:13:43', '2025-08-13 07:13:43', '', 'FONG0204', '', 'inherit', 'open', 'closed', '', 'fong0204', '', '', '2025-08-13 16:13:43', '2025-08-13 07:13:43', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130713-FONG0204.jpg', 0, 'attachment', 'image/jpeg', 0),
(786, 2, '2025-08-13 16:13:43', '2025-08-13 07:13:43', '', 'FONG0629', '', 'inherit', 'open', 'closed', '', 'fong0629', '', '', '2025-08-13 16:13:43', '2025-08-13 07:13:43', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130713-FONG0629.jpg', 0, 'attachment', 'image/jpeg', 0),
(787, 2, '2025-08-13 16:16:01', '2025-08-13 07:16:01', '', '', '', 'inherit', 'open', 'closed', '', 'logo-mau', '', '', '2025-08-13 16:16:31', '2025-08-13 07:16:31', '', 0, 'http://localhost:8080/wp-content/uploads/2025/08/202508130716-Logo-mau.pdf', 0, 'attachment', 'application/pdf', 0),
(790, 1, '2025-08-13 16:24:33', '2025-08-13 07:24:33', '<!-- wp:paragraph -->\n<p>先日、AIoTファミリーは、ダラットで心に残るカンパニートリップを行いました。<br>澄んだ空気と美しい自然に囲まれたこの地で、メンバー全員が日常から少し離れ、新しい発見や貴重な体験を共有することができました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>旅の間、笑顔が絶えないアクティビティやチームワークを深めるゲーム、そして温かく心のこもった食事を共に楽しみました。こうした一つ一つの瞬間が重なり合い、2025年を彩る鮮やかな思い出となりました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>この旅は、単なる休暇ではなく、お互いをより深く理解し合い、信頼関係を強化する大切な時間でもありました。仲間との絆は一層強まり、これからの挑戦に向けて新たなエネルギーとモチベーションを得ることができました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>参加してくださった全てのメンバーの笑顔と熱意に心から感謝いたします。<br>AIoTは、これからも一丸となって成長を続け、次のステップへと進んでまいります。<br>次回の旅でまた素晴らしい時間を共有できることを楽しみにしています！COMPANY TRIP 2025 [WE ARE FAMILY] – 絆を深め、エネルギーを分かち合う旅&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":791,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0062-scaled.jpg\" alt=\"\" class=\"wp-image-791\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":792,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0079-scaled.jpg\" alt=\"\" class=\"wp-image-792\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":793,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0092-scaled.jpg\" alt=\"\" class=\"wp-image-793\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":794,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0116-scaled.jpg\" alt=\"\" class=\"wp-image-794\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":799,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0204-scaled.jpg\" alt=\"\" class=\"wp-image-799\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":797,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0218-scaled.jpg\" alt=\"\" class=\"wp-image-797\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":796,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0234-scaled.jpg\" alt=\"\" class=\"wp-image-796\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":795,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0586-scaled.jpg\" alt=\"\" class=\"wp-image-795\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":798,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0629-scaled.jpg\" alt=\"\" class=\"wp-image-798\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->', 'COMPANY TRIP 2025 [WE ARE FAMILY] – 絆を深め、エネルギーを分かち合う旅 ', '', 'publish', 'closed', 'closed', '', 'company-trip-2025', '', '', '2025-09-26 11:58:59', '2025-09-26 02:58:59', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=790', 0, 'blog', '', 0),
(791, 2, '2025-08-13 16:24:03', '2025-08-13 07:24:03', '', 'FONG0062', '', 'inherit', 'open', 'closed', '', 'fong0062-3', '', '', '2025-08-13 16:24:03', '2025-08-13 07:24:03', '', 790, 'http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0062.jpg', 0, 'attachment', 'image/jpeg', 0),
(792, 2, '2025-08-13 16:24:03', '2025-08-13 07:24:03', '', 'FONG0079', '', 'inherit', 'open', 'closed', '', 'fong0079-2', '', '', '2025-08-13 16:24:03', '2025-08-13 07:24:03', '', 790, 'http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0079.jpg', 0, 'attachment', 'image/jpeg', 0),
(793, 2, '2025-08-13 16:24:03', '2025-08-13 07:24:03', '', 'FONG0092', '', 'inherit', 'open', 'closed', '', 'fong0092-2', '', '', '2025-08-13 16:24:03', '2025-08-13 07:24:03', '', 790, 'http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0092.jpg', 0, 'attachment', 'image/jpeg', 0),
(794, 2, '2025-08-13 16:24:04', '2025-08-13 07:24:04', '', 'FONG0116', '', 'inherit', 'open', 'closed', '', 'fong0116-2', '', '', '2025-08-13 16:24:04', '2025-08-13 07:24:04', '', 790, 'http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0116.jpg', 0, 'attachment', 'image/jpeg', 0),
(795, 2, '2025-08-13 16:24:04', '2025-08-13 07:24:04', '', 'FONG0586', '', 'inherit', 'open', 'closed', '', 'fong0586-2', '', '', '2025-08-13 16:24:04', '2025-08-13 07:24:04', '', 790, 'http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0586.jpg', 0, 'attachment', 'image/jpeg', 0),
(796, 2, '2025-08-13 16:24:05', '2025-08-13 07:24:05', '', 'FONG0234', '', 'inherit', 'open', 'closed', '', 'fong0234-2', '', '', '2025-08-13 16:24:05', '2025-08-13 07:24:05', '', 790, 'http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0234.jpg', 0, 'attachment', 'image/jpeg', 0),
(797, 2, '2025-08-13 16:24:05', '2025-08-13 07:24:05', '', 'FONG0218', '', 'inherit', 'open', 'closed', '', 'fong0218-2', '', '', '2025-08-13 16:24:05', '2025-08-13 07:24:05', '', 790, 'http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0218.jpg', 0, 'attachment', 'image/jpeg', 0),
(798, 2, '2025-08-13 16:24:06', '2025-08-13 07:24:06', '', 'FONG0629', '', 'inherit', 'open', 'closed', '', 'fong0629-2', '', '', '2025-08-13 16:24:06', '2025-08-13 07:24:06', '', 790, 'http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0629.jpg', 0, 'attachment', 'image/jpeg', 0),
(799, 2, '2025-08-13 16:24:06', '2025-08-13 07:24:06', '', 'FONG0204', '', 'inherit', 'open', 'closed', '', 'fong0204-2', '', '', '2025-08-13 16:24:06', '2025-08-13 07:24:06', '', 790, 'http://localhost:8080/wp-content/uploads/2025/08/202508130724-FONG0204.jpg', 0, 'attachment', 'image/jpeg', 0),
(800, 1, '2025-08-20 16:23:03', '2025-08-20 07:23:03', '<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">1. 目的</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当社は、開発事業を通じてお客様の大切な情報資産を取り扱っています。<br>お客様からお預かりする情報資産を適切に保護し、安心して業務を任せていただける体制を構築するため、情報セキュリティ基本方針を定めます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">2. 適用範囲</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本方針は、当社のすべての役員・社員・契約社員・派遣社員および業務委託先に適用されます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">3. 情報資産の保護</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>お客様から受託した情報資産は、契約および法令に基づき、厳格に管理します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>外部記憶媒体（USB、外付けHDD 等）や私物端末への保存を原則禁止します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>不要になった情報資産は、安全な方法で消去・廃棄します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">4. アクセス管理</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>作業担当者は名簿で管理し、業務に必要な者に限定して権限を付与します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>ID/パスワードは適切に管理し、他者との共有を禁止します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>VPN・多要素認証等を用い、外部からの不正アクセスを防止します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">5. 物理的セキュリティ</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>情報を取り扱う区域は施錠管理し、第三者の立ち入りを制限します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>やむを得ず第三者を入室させる場合は、許可書を必須とし、入退室記録を管理します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">6. リモートワーク</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>リモートワーク時には、VPN、セキュリティソフトの利用を義務付けます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>個人所有PCでの作業は禁止し、会社付与PCを必ず使用します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>「リモートワークポリシー」に従い、情報の漏洩防止を徹底します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">7. 教育・訓練</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>入社時および定期的に、情報セキュリティや個人情報の取り扱いに関する教育を行います。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>研修後は理解度テスト等を実施し、周知徹底を図ります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">8. インシデント対応</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>情報セキュリティインシデント（情報漏えい、改ざん、消失等）が発生、または疑われる場合は、直ちに CTO に報告します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>CTO は状況を確認し、顧客に速やかに連絡するとともに、原因究明および再発防止策を講じます。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">9. 継続的改善</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本方針に基づく体制を定期的に見直し、必要に応じて改善します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>内部監査・自己点検・外部診断を通じて、セキュリティレベルを維持・向上します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">10. 責任体制</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>情報セキュリティに関する責任者は CTO が統括します。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>将来的には、専任の「情報セキュリティ管理責任者」を設置し、役割と責任を明確化します。</p>\n<!-- /wp:paragraph -->', 'AIoT情報セキュリティ方針', '情報資産を適切に維持管理するために、情報セキュリティマネジメントを構築し、以下の方針に基づき会社全体で情報セキュリティに取り組みます。', 'publish', 'closed', 'closed', '', 'securitypolicy', '', '', '2025-08-20 16:28:28', '2025-08-20 07:28:28', '', 0, 'http://localhost:8080/?page_id=800', 0, 'page', '', 0),
(803, 1, '2025-08-20 16:24:24', '2025-08-20 07:24:24', ' ', '', '', 'publish', 'closed', 'closed', '', '803', '', '', '2025-08-20 16:24:24', '2025-08-20 07:24:24', '', 0, 'http://localhost:8080/?p=803', 17, 'nav_menu_item', '', 0),
(811, 2, '2025-09-03 12:55:18', '2025-09-03 03:55:18', '<!-- wp:paragraph -->\n<p>Đối với những doanh nghiệp lần đầu tiên cân nhắc đến phát triển offshore, hành trình này thường đi kèm với nhiều trăn trở. Đặc biệt, sự khác biệt về ngôn ngữ và văn hóa khiến cho vấn đề giao tiếp trở thành một thách thức lớn. Bên cạnh đó, mối lo ngại về việc chất lượng phát triển có đáp ứng được tiêu chuẩn trong nước hay không cũng luôn hiện hữu. Thêm vào đó, không ít doanh nghiệp còn đau đầu với khó khăn trong việc quản lý tiến độ do chênh lệch múi giờ và môi trường làm việc từ xa.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Việc tìm được một công ty phát triển đáng tin cậy hay đảm bảo tính minh bạch trong chi phí cũng là mối quan tâm hàng đầu. Những câu hỏi liên quan đến hợp đồng pháp lý và bảo vệ quyền sở hữu trí tuệ cũng có thể trở thành rào cản lớn trong quá trình triển khai offshore. Đồng thời, doanh nghiệp cũng không thể bỏ qua yếu tố tác động của sự khác biệt văn hóa đối với dự án.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Như vậy, trong bối cảnh có quá nhiều lo lắng và nghi vấn xoay quanh việc phát triển offshore lần đầu, điều cần thiết là tìm ra những bước đi đúng đắn để có thể dẫn dắt dự án đến thành công.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Chìa khóa để thành công trong phát triển offshore nằm ở việc <mark style=\"background-color:#ffeb3b\" class=\"has-inline-color has-material-yellow-color\">lập kế hoạch kỹ lưỡng ngay từ giai đoạn chuẩn bị và duy trì giao tiếp hiệu quả.</mark></strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Việc xác định rõ ràng mục tiêu và yêu cầu của dự án, đồng thời xây dựng một tầm nhìn chung mà tất cả các bên liên quan đều có thể chia sẻ, sẽ giúp tránh được sự sai lệch về kỳ vọng và đảm bảo tiến trình diễn ra thuận lợi.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Trong bài viết này, AIoT – doanh nghiệp đang triển khai hoạt động phát triển offshore tại Việt Nam – sẽ giới thiệu&nbsp;<strong>bước 6 trong 7 bước tiến hành phát triển offshore</strong>, cùng với những kiến thức thực tiễn về cách triển khai cụ thể và cách tìm kiếm đối tác tối ưu.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Bước 6: Thực hiện quản lý tiến độ và quản lý chất lượng</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Sau khi bắt đầu phát triển, việc&nbsp;<strong>quản lý tiến độ</strong>&nbsp;và&nbsp;<strong>quản lý chất lượng</strong>&nbsp;định kỳ đóng vai trò rất quan trọng.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Hãy chú ý đến những nội dung sau và thực hiện việc kiểm tra thường xuyên:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>① Tổ chức họp định kỳ hàng tuần<br>② Đo lường và đánh giá các chỉ số chất lượng<br>③ Kiểm soát rủi ro và xác nhận phương án ứng phó rủi ro<br>④ Quản lý và theo dõi các vấn đề phát sinh</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Một sai lầm thường thấy ở các doanh nghiệp thất bại trong phát triển offshore là tâm lý “do làm offshore nên đành chấp nhận”, dẫn đến việc không xử lý sớm các vấn đề. Hậu quả là khi vấn đề trở nên nghiêm trọng mới phải tốn nhiều nguồn lực để khắc phục. Chính vì là offshore, việc quản lý tiến độ càng cần được chú trọng hơn bình thường, với tinh thần phát hiện và giải quyết vấn đề kịp thời.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tại AIoT, chúng tôi không xem mọi vấn đề đều là trách nhiệm của khách hàng, mà luôn giữ tinh thần trách nhiệm như chính người trong cuộc, chủ động xử lý cả những vấn đề nhỏ nhất. Nói cách khác, việc triển khai dự án sẽ được thực hiện cùng với các kỹ sư có tư duy và tác phong làm việc gần gũi với người Nhật hơn so với nhiều đơn vị khác!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Xin hãy yên tâm giao phó cho chúng tôi!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>AIoT luôn hướng tới trở thành đối tác đáng tin cậy, đồng hành cùng khách hàng trong việc giải quyết những thách thức của phát triển offshore, đồng thời xây dựng mối quan hệ hợp tác bền vững. Hãy để AIoT cùng bạn chinh phục thành công.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nếu bạn đang trăn trở với phát triển offshore, hay đang cân nhắc khởi động một dự án mới, đừng ngần ngại trao đổi với chúng tôi. Với kinh nghiệm phong phú, năng lực kỹ thuật cao, cùng quy trình quản lý chất lượng và bảo mật chặt chẽ, chúng tôi cam kết sẽ đưa dự án của bạn đến thành công.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>☆ Muốn vừa tiết kiệm chi phí vừa đảm bảo chất lượng phát triển<br>☆ Muốn có đội ngũ phát triển nhanh chóng để nâng cao năng lực cạnh tranh trên thị trường<br>☆ Muốn xây dựng mối quan hệ lâu dài với một đối tác đáng tin cậy</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mọi mong muốn trên, AIoT đều có thể đáp ứng.<br>Hãy liên hệ với chúng tôi ngay hôm nay. Đội ngũ tư vấn chuyên nghiệp của AIoT sẽ đưa ra giải pháp tối ưu, phù hợp với nhu cầu của bạn.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Liên hệ qua mục ≪Liên hệ≫ trên website hoặc số điện thoại dưới đây:<br>TEL: 03-4500-6968</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Happy Together!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Cách tiến hành phát triển Offshore: 7 bước cụ thể – Phần 6', '', 'publish', 'closed', 'closed', '', 'how-to-proceed-with-offshore-development-7-specific-steps-part-6', '', '', '2025-09-03 12:55:18', '2025-09-03 03:55:18', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=811', 0, 'blog', '', 0),
(813, 2, '2025-09-04 13:17:58', '0000-00-00 00:00:00', '<!-- wp:paragraph -->\n<p>Trong bài viết trước, chúng tôi đã giới thiệu về&nbsp;<strong>“Xây dựng hệ thống nội bộ”</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Hôm nay, ở Phần 2 của 7 bước, chúng tôi sẽ giới thiệu về&nbsp;<strong>“Sắp xếp yêu cầu”</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Khác với việc phát triển trong nước, do hạn chế về giao tiếp trực tiếp, nên việc sắp xếp, làm rõ yêu cầu trở nên đặc biệt quan trọng.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Hãy thử tiến hành&nbsp;<strong>“Sắp xếp yêu cầu”</strong>&nbsp;với sự chú ý đến những điểm sau đây.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Xác định rõ yêu cầu</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Mục tiêu mà hệ thống cần đạt được</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>・Xác định rõ ràng mục đích triển khai hệ thống.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Cách thúc đẩy phát triển offshore: 7 bước cụ thể – Phần 2', '', 'draft', 'closed', 'closed', '', '', '', '', '2025-09-04 13:17:58', '2025-09-04 04:17:58', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=813', 0, 'blog', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(814, 2, '2025-09-12 17:15:33', '2025-09-12 08:15:33', '<!-- wp:paragraph -->\n<p>9月9日、大阪にて「ベトナム・関西経済フォーラム2025」が開催され、レ・タン・ロン副首相をはじめ、ベトナム各省庁の指導者、関西地域の自治体関係者、そして両国の多数の企業が出席しました</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>「包括的な協力の強化、新たな原動力の創出－ベトナム・日本関係の発展へ」をテーマに掲げた本フォーラムでは、貿易・投資・イノベーション・持続可能な発展といった分野における両国協力の大きな可能性が改めて確認されました。副首相は挨拶の中で、関西が日本の重要な経済・産業の中心地であり、ベトナムの発展方向性に合致する多くの強みを有していることを強調しました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":818,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/09/202509120815-z6993733168581de632d76da75b620bf67d4497971d90a.jpg\" alt=\"\" class=\"wp-image-818\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>本フォーラムにおいて、AIoTを代表してグエン・マン・フン氏が出席し、日本の主要企業、業界団体、金融機関と交流する貴重な機会を得ました。AIoTは、スマート技術の開発や人工知能の経営・生活分野への応用に関するビジョンを共有しました。この機会は、AIoTがその実力を示すと同時に、関西経済圏―日本でも有数の活力ある地域―との協力関係を拡大する契機となりました。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":817,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost:8080/wp-content/uploads/2025/09/202509120815-z6993733131331078d57e622febd358e24119f3592b6ec.jpg\" alt=\"\" class=\"wp-image-817\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>AIoTの参加は、国際的な統合への努力を示すだけでなく、ベトナムと日本の協力関係における技術的なつながりをさらに強化するものでもあります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>🇻🇳🇯🇵 ベトナムと日本の協力関係はますます拡大し、包括的かつ持続可能なモデルとなっています。AIoTは今後も、ベトナム・日本間の協力における技術的な架け橋となり、両国の共通の発展に積極的に貢献してまいります。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '大阪での忘れられない印象：ベトナム・関西経済フォーラム2025', '', 'publish', 'closed', 'closed', '', 'vietnam-kansai-forum-2025', '', '', '2025-09-12 17:18:13', '2025-09-12 08:18:13', '', 0, 'http://localhost:8080/?post_type=blog&#038;p=814', 0, 'blog', '', 0),
(815, 2, '2025-09-12 16:49:05', '2025-09-12 07:49:05', '', 'z6993733163855_b9110ea0a6ba79df8d3fd646167ab2d0', '', 'inherit', 'open', 'closed', '', 'z6993733163855_b9110ea0a6ba79df8d3fd646167ab2d0', '', '', '2025-09-12 16:49:05', '2025-09-12 07:49:05', '', 814, 'http://localhost:8080/wp-content/uploads/2025/09/202509120749-z6993733163855b9110ea0a6ba79df8d3fd646167ab2d0.jpg', 0, 'attachment', 'image/jpeg', 0),
(816, 2, '2025-09-12 16:51:12', '2025-09-12 07:51:12', '', 'z6993733163855_b9110ea0a6ba79df8d3fd646167ab2d0', '', 'inherit', 'open', 'closed', '', 'z6993733163855_b9110ea0a6ba79df8d3fd646167ab2d0-2', '', '', '2025-09-12 16:51:12', '2025-09-12 07:51:12', '', 814, 'http://localhost:8080/wp-content/uploads/2025/09/202509120751-z6993733163855b9110ea0a6ba79df8d3fd646167ab2d0.jpg', 0, 'attachment', 'image/jpeg', 0),
(817, 2, '2025-09-12 17:15:02', '2025-09-12 08:15:02', '', 'z6993733131331_078d57e622febd358e24119f3592b6ec', '', 'inherit', 'open', 'closed', '', 'z6993733131331_078d57e622febd358e24119f3592b6ec', '', '', '2025-09-12 17:15:02', '2025-09-12 08:15:02', '', 814, 'http://localhost:8080/wp-content/uploads/2025/09/202509120815-z6993733131331078d57e622febd358e24119f3592b6ec.jpg', 0, 'attachment', 'image/jpeg', 0),
(818, 2, '2025-09-12 17:15:13', '2025-09-12 08:15:13', '', 'z6993733168581_de632d76da75b620bf67d4497971d90a', '', 'inherit', 'open', 'closed', '', 'z6993733168581_de632d76da75b620bf67d4497971d90a', '', '', '2025-09-12 17:15:13', '2025-09-12 08:15:13', '', 814, 'http://localhost:8080/wp-content/uploads/2025/09/202509120815-z6993733168581de632d76da75b620bf67d4497971d90a.jpg', 0, 'attachment', 'image/jpeg', 0),
(826, 2, '2025-09-25 11:16:36', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2025-09-25 11:16:36', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/?post_type=blog&p=826', 0, 'blog', '', 0),
(827, 1, '2025-10-03 15:03:07', '2025-10-03 04:44:05', ' ', '', '', 'publish', 'closed', 'closed', '', '827', '', '', '2025-10-03 15:03:07', '2025-10-03 06:03:07', '', 289, 'http://localhost:8080/?p=827', 5, 'nav_menu_item', '', 0),
(828, 1, '2025-10-03 15:03:07', '2025-10-03 04:44:05', ' ', '', '', 'publish', 'closed', 'closed', '', '828', '', '', '2025-10-03 15:03:07', '2025-10-03 06:03:07', '', 289, 'http://localhost:8080/?p=828', 6, 'nav_menu_item', '', 0),
(829, 1, '2025-10-03 15:03:07', '2025-10-03 04:44:05', ' ', '', '', 'publish', 'closed', 'closed', '', '829', '', '', '2025-10-03 15:03:07', '2025-10-03 06:03:07', '', 289, 'http://localhost:8080/?p=829', 7, 'nav_menu_item', '', 0),
(830, 1, '2025-10-03 15:03:07', '2025-10-03 04:44:05', ' ', '', '', 'publish', 'closed', 'closed', '', '830', '', '', '2025-10-03 15:03:07', '2025-10-03 06:03:07', '', 289, 'http://localhost:8080/?p=830', 8, 'nav_menu_item', '', 0),
(831, 1, '2025-10-03 13:51:12', '2025-10-03 04:49:03', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2025-10-03 13:51:12', '2025-10-03 04:51:12', '', 0, 'http://localhost:8080/?p=831', 1, 'nav_menu_item', '', 0),
(832, 1, '2025-10-03 13:51:12', '2025-10-03 04:49:03', '', 'Bussiness', '', 'publish', 'closed', 'closed', '', 'bussiness', '', '', '2025-10-03 13:51:12', '2025-10-03 04:51:12', '', 0, 'http://localhost:8080/?p=832', 2, 'nav_menu_item', '', 0),
(833, 1, '2025-10-03 13:51:12', '2025-10-03 04:49:03', '', 'Contact', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2025-10-03 13:51:12', '2025-10-03 04:51:12', '', 0, 'http://localhost:8080/?p=833', 3, 'nav_menu_item', '', 0),
(834, 1, '2025-10-03 13:50:28', '2025-10-03 04:50:28', '', 'home', '', 'inherit', 'open', 'closed', '', 'home-2', '', '', '2025-10-03 13:50:28', '2025-10-03 04:50:28', '', 0, 'http://localhost:8080/wp-content/uploads/2025/10/202510030450-home.png', 0, 'attachment', 'image/png', 0),
(835, 1, '2025-10-03 15:03:07', '2025-10-03 05:55:40', ' ', '', '', 'publish', 'closed', 'closed', '', '835', '', '', '2025-10-03 15:03:07', '2025-10-03 06:03:07', '', 0, 'http://localhost:8080/?p=835', 4, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_rank_math_analytics_gsc`
--

CREATE TABLE `wp_rank_math_analytics_gsc` (
  `id` bigint UNSIGNED NOT NULL,
  `created` timestamp NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `page` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `clicks` mediumint NOT NULL,
  `impressions` mediumint NOT NULL,
  `position` double NOT NULL,
  `ctr` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_rank_math_analytics_inspections`
--

CREATE TABLE `wp_rank_math_analytics_inspections` (
  `id` bigint UNSIGNED NOT NULL,
  `page` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created` timestamp NOT NULL,
  `index_verdict` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `indexing_state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `coverage_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `page_fetch_state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `robots_txt_state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `rich_results_verdict` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `rich_results_items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_crawl_time` timestamp NOT NULL,
  `crawled_as` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `google_canonical` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_canonical` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sitemap` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `referring_urls` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `raw_api_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_rank_math_analytics_objects`
--

CREATE TABLE `wp_rank_math_analytics_objects` (
  `id` bigint UNSIGNED NOT NULL,
  `created` timestamp NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `page` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_subtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_id` bigint UNSIGNED NOT NULL,
  `primary_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `seo_score` tinyint NOT NULL DEFAULT '0',
  `page_score` tinyint NOT NULL DEFAULT '0',
  `is_indexable` tinyint(1) NOT NULL DEFAULT '1',
  `schemas_in_use` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `desktop_interactive` double DEFAULT '0',
  `desktop_pagescore` double DEFAULT '0',
  `mobile_interactive` double DEFAULT '0',
  `mobile_pagescore` double DEFAULT '0',
  `pagespeed_refreshed` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_rank_math_analytics_objects`
--

INSERT INTO `wp_rank_math_analytics_objects` (`id`, `created`, `title`, `page`, `object_type`, `object_subtype`, `object_id`, `primary_key`, `seo_score`, `page_score`, `is_indexable`, `schemas_in_use`, `desktop_interactive`, `desktop_pagescore`, `mobile_interactive`, `mobile_pagescore`, `pagespeed_refreshed`) VALUES
(1, '2024-09-29 15:57:16', '秋のデジタルエッグハント＆遊具レンタル」イベント開催します。', '/en/blogs/blog-test/', 'post', 'blog', 160, '', 0, 0, 1, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(2, '2024-09-30 10:47:03', 'Contact', '/en/contact/', 'post', 'page', 46, '', 0, 0, 1, 'Article', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(3, '2024-09-27 11:08:47', 'Network', '/en/company/network/', 'post', 'page', 44, '', 0, 0, 1, 'Article', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(4, '2024-09-27 11:08:39', 'Officer', '/en/company/officer/', 'post', 'page', 42, '', 0, 0, 1, 'Article', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(5, '2024-09-27 11:08:33', 'Outline', '/en/company/outline/', 'post', 'page', 40, '', 0, 0, 1, 'Article', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(6, '2024-09-27 11:08:25', 'Purpose', '/en/company/purpose/', 'post', 'page', 38, '', 0, 0, 1, 'Article', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(7, '2024-09-27 11:07:11', 'Company', '/en/company/', 'post', 'page', 36, '', 0, 0, 1, 'Article', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(8, '2024-09-27 11:08:16', 'Message From CEO', '/en/company/message-from-ceo/', 'post', 'page', 34, '', 0, 0, 1, 'Article', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(9, '2024-09-26 02:53:23', 'About Us', '/en/about-us/', 'post', 'page', 23, '', 0, 0, 1, 'Article', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(10, '2024-09-29 14:27:12', 'Homepage', '/en/', 'post', 'page', 8, '', 0, 0, 1, 'Article', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(11, '2024-09-25 12:15:35', 'Hello world!', '/en/hello-world/', 'post', 'post', 1, '', 0, 0, 1, 'Article', 0, 0, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wp_rank_math_internal_links`
--

CREATE TABLE `wp_rank_math_internal_links` (
  `id` bigint UNSIGNED NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `target_post_id` bigint UNSIGNED NOT NULL,
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_rank_math_internal_links`
--

INSERT INTO `wp_rank_math_internal_links` (`id`, `url`, `post_id`, `target_post_id`, `type`) VALUES
(1051, 'tel:', 320, 0, 'external'),
(1052, 'mailto:', 320, 0, 'external'),
(1230, 'https://facebook.com/', 46, 0, 'external'),
(1231, 'tel:', 46, 0, 'external'),
(1232, 'mailto:', 46, 0, 'external'),
(1243, '/en/business', 8, 283, 'internal'),
(1244, '/business', 8, 283, 'internal'),
(1245, '/en/business/dx-system-development/', 8, 286, 'internal'),
(1246, '/en/business/bpo-services/', 8, 293, 'internal'),
(1247, '/en/business/corporate-strategy-and-ma-support/', 8, 298, 'internal'),
(1248, '/en/business/vietnam-expansion-support/', 8, 303, 'internal'),
(1249, 'http://aiot-fixing.local/en/blogs/nguyen-manh-hung-a-journey-alongside-the-community-for-a-sustainable-clean-and-green-future/', 8, 464, 'internal'),
(1250, 'http://aiot-fixing.local/blogs/%e3%82%bf%e3%82%b1%e3%82%aa-nguyen-manh-hung-%e3%82%b3%e3%83%9f%e3%83%a5%e3%83%8b%e3%83%86%e3%82%a3%e3%81%a8%e5%85%b1%e3%81%ab%e6%ad%a9%e3%82%80%e3%80%81%e6%8c%81%e7%b6%9a%e5%8f%af/', 8, 460, 'internal'),
(1251, 'http://aiot-fixing.local/en/blogs/the-mission-of-connection-and-our-return-to-hanoi-university-of-science-and-technology/', 8, 459, 'internal'),
(1252, '/en/blogs', 8, 0, 'internal'),
(1268, 'tel:0345006968', 554, 0, 'external'),
(1308, 'https://www.aiot.co.jp', 689, 0, 'external'),
(1309, 'https://www.aiot.co.jp', 675, 0, 'external'),
(1320, 'https://drive.google.com/file/d/1M_k_rIESMrSNiqWDRYlIPo7lYyJFvRnq/view?usp=sharing', 710, 0, 'external'),
(1333, '/company', 20, 207, 'internal'),
(1334, '/business', 20, 289, 'internal'),
(1335, '/business/dx-system-development/', 20, 291, 'internal'),
(1336, '/business/bpo-services/', 20, 296, 'internal'),
(1337, '/business/corporate-strategy-and-ma-support/', 20, 301, 'internal'),
(1338, '/business/vietnam-expansion-support/', 20, 306, 'internal'),
(1339, '/company', 20, 207, 'internal'),
(1340, '/company/portfolio/', 20, 710, 'internal'),
(1341, 'http://aiot-fixing.local/blogs/%e3%82%aa%e3%83%95%e3%82%b7%e3%83%a7%e3%82%a2%e9%96%8b%e7%99%ba%e3%81%ae%e9%80%b2%e3%82%81%e6%96%b9%ef%bc%9a7%e3%81%a4%e3%81%ae%e5%85%b7%e4%bd%93%e7%9a%84%e3%82%b9%e3%83%86%e3%83%83%e3%83%97-7/', 20, 673, 'internal'),
(1342, 'http://aiot-fixing.local/blogs/kyushu-journey-vietnam-japan/', 20, 667, 'internal'),
(1343, 'http://aiot-fixing.local/blogs/%e3%82%aa%e3%83%95%e3%82%b7%e3%83%a7%e3%82%a2%e9%96%8b%e7%99%ba%e3%81%ae%e9%80%b2%e3%82%81%e6%96%b9%ef%bc%9a7%e3%81%a4%e3%81%ae%e5%85%b7%e4%bd%93%e7%9a%84%e3%82%b9%e3%83%86%e3%83%83%e3%83%97-6/', 20, 654, 'internal'),
(1344, '/blogs', 20, 0, 'internal'),
(1348, 'tel:0345006968', 552, 0, 'external');

-- --------------------------------------------------------

--
-- Table structure for table `wp_rank_math_internal_meta`
--

CREATE TABLE `wp_rank_math_internal_meta` (
  `object_id` bigint UNSIGNED NOT NULL,
  `internal_link_count` int UNSIGNED DEFAULT '0',
  `external_link_count` int UNSIGNED DEFAULT '0',
  `incoming_link_count` int UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_rank_math_internal_meta`
--

INSERT INTO `wp_rank_math_internal_meta` (`object_id`, `internal_link_count`, `external_link_count`, `incoming_link_count`) VALUES
(1, 0, 0, 0),
(8, 10, 0, 0),
(18, 0, 0, 0),
(20, 12, 0, 0),
(23, 0, 0, 0),
(34, 0, 0, 0),
(36, 0, 0, 0),
(38, 0, 0, 0),
(40, 0, 0, 0),
(42, 0, 0, 0),
(44, 0, 0, 0),
(46, 0, 3, 0),
(48, 0, 0, 0),
(50, 0, 0, 0),
(51, 0, 0, 0),
(160, 0, 0, 0),
(207, 0, 0, 2),
(210, 0, 0, 0),
(213, 0, 0, 0),
(215, 0, 0, 0),
(217, 0, 0, 0),
(219, 0, 0, 0),
(283, 0, 0, 2),
(286, 0, 0, 1),
(289, 0, 0, 1),
(291, 0, 0, 1),
(293, 0, 0, 1),
(296, 0, 0, 1),
(298, 0, 0, 1),
(301, 0, 0, 1),
(303, 0, 0, 1),
(306, 0, 0, 1),
(320, 0, 2, 0),
(357, 0, 0, 0),
(435, 0, 0, 0),
(440, 0, 0, 0),
(446, 0, 0, 0),
(447, 0, 0, 0),
(449, 0, 0, 0),
(450, 0, 0, 0),
(453, 0, 0, 0),
(459, 0, 0, 1),
(460, 0, 0, 1),
(464, 0, 0, 1),
(467, 0, 0, 0),
(468, 0, 0, 0),
(552, 0, 1, 0),
(554, 0, 1, 0),
(555, 0, 0, 0),
(556, 0, 0, 0),
(558, 0, 0, 0),
(561, 0, 0, 0),
(563, 0, 0, 0),
(564, 0, 0, 0),
(566, 0, 0, 0),
(569, 0, 0, 0),
(571, 0, 0, 0),
(574, 0, 0, 0),
(575, 0, 0, 0),
(584, 0, 0, 0),
(585, 0, 0, 0),
(592, 0, 0, 0),
(595, 0, 0, 0),
(606, 0, 0, 0),
(609, 0, 0, 0),
(616, 0, 0, 0),
(619, 0, 0, 0),
(622, 0, 0, 0),
(632, 0, 0, 0),
(634, 0, 0, 0),
(635, 0, 0, 0),
(654, 0, 0, 1),
(655, 0, 0, 0),
(656, 0, 0, 0),
(667, 0, 0, 1),
(672, 0, 0, 0),
(673, 0, 0, 1),
(674, 0, 0, 0),
(675, 0, 1, 0),
(689, 0, 1, 0),
(708, 0, 0, 0),
(710, 0, 1, 1),
(753, 0, 0, 0),
(760, 0, 0, 0),
(761, 0, 0, 0),
(764, 0, 0, 0),
(767, 0, 0, 0),
(769, 0, 0, 0),
(770, 0, 0, 0),
(773, 0, 0, 0),
(776, 0, 0, 0),
(790, 0, 0, 0),
(800, 0, 0, 0),
(811, 0, 0, 0),
(813, 0, 0, 0),
(814, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_realmedialibrary`
--

CREATE TABLE `wp_realmedialibrary` (
  `id` mediumint NOT NULL,
  `parent` mediumint NOT NULL DEFAULT '-1',
  `name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `absolute` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `owner` bigint NOT NULL,
  `ord` mediumint NOT NULL DEFAULT '0',
  `oldCustomOrder` mediumint DEFAULT NULL,
  `contentCustomOrder` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `restrictions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cnt` mediumint DEFAULT NULL,
  `importId` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_realmedialibrary`
--

INSERT INTO `wp_realmedialibrary` (`id`, `parent`, `name`, `slug`, `absolute`, `owner`, `ord`, `oldCustomOrder`, `contentCustomOrder`, `type`, `restrictions`, `cnt`, `importId`) VALUES
(1, -1, 'vcard', '202412100419-vcard', '202412100419-vcard', 1, 1, NULL, 0, '0', '', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_realmedialibrary_meta`
--

CREATE TABLE `wp_realmedialibrary_meta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `realmedialibrary_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_realmedialibrary_posts`
--

CREATE TABLE `wp_realmedialibrary_posts` (
  `attachment` bigint NOT NULL,
  `fid` mediumint NOT NULL DEFAULT '-1',
  `isShortcut` bigint NOT NULL DEFAULT '0',
  `nr` bigint DEFAULT NULL,
  `oldCustomNr` bigint DEFAULT NULL,
  `importData` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_realmedialibrary_posts`
--

INSERT INTO `wp_realmedialibrary_posts` (`attachment`, `fid`, `isShortcut`, `nr`, `oldCustomNr`, `importData`) VALUES
(550, 1, 0, NULL, NULL, NULL),
(613, -1, 0, NULL, NULL, NULL),
(617, -1, 0, NULL, NULL, NULL),
(620, -1, 0, NULL, NULL, NULL),
(623, -1, 0, NULL, NULL, NULL),
(657, -1, 0, NULL, NULL, NULL),
(658, -1, 0, NULL, NULL, NULL),
(659, -1, 0, NULL, NULL, NULL),
(660, -1, 0, NULL, NULL, NULL),
(663, -1, 0, NULL, NULL, NULL),
(694, -1, 0, NULL, NULL, NULL),
(696, -1, 0, NULL, NULL, NULL),
(704, -1, 0, NULL, NULL, NULL),
(705, -1, 0, NULL, NULL, NULL),
(706, -1, 0, NULL, NULL, NULL),
(717, -1, 0, NULL, NULL, NULL),
(718, -1, 0, NULL, NULL, NULL),
(720, -1, 0, NULL, NULL, NULL),
(721, -1, 0, NULL, NULL, NULL),
(722, -1, 0, NULL, NULL, NULL),
(723, -1, 0, NULL, NULL, NULL),
(724, -1, 0, NULL, NULL, NULL),
(725, -1, 0, NULL, NULL, NULL),
(726, -1, 0, NULL, NULL, NULL),
(727, -1, 0, NULL, NULL, NULL),
(728, -1, 0, NULL, NULL, NULL),
(729, -1, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_realmedialibrary_tmp`
--

CREATE TABLE `wp_realmedialibrary_tmp` (
  `id` mediumint NOT NULL,
  `parent` mediumint NOT NULL DEFAULT '-1',
  `name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ord` mediumint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_redirection_404`
--

CREATE TABLE `wp_redirection_404` (
  `id` int UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `referrer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `http_code` int UNSIGNED NOT NULL DEFAULT '0',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `request_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_redirection_groups`
--

CREATE TABLE `wp_redirection_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tracking` int NOT NULL DEFAULT '1',
  `module_id` int UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('enabled','disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'enabled',
  `position` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_redirection_groups`
--

INSERT INTO `wp_redirection_groups` (`id`, `name`, `tracking`, `module_id`, `status`, `position`) VALUES
(1, 'Redirections', 1, 1, 'enabled', 0),
(2, 'Modified Posts', 1, 1, 'enabled', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_redirection_items`
--

CREATE TABLE `wp_redirection_items` (
  `id` int UNSIGNED NOT NULL,
  `url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `match_url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `match_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `regex` int UNSIGNED NOT NULL DEFAULT '0',
  `position` int UNSIGNED NOT NULL DEFAULT '0',
  `last_count` int UNSIGNED NOT NULL DEFAULT '0',
  `last_access` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `group_id` int NOT NULL DEFAULT '0',
  `status` enum('enabled','disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'enabled',
  `action_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `action_code` int UNSIGNED NOT NULL,
  `action_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `match_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_redirection_items`
--

INSERT INTO `wp_redirection_items` (`id`, `url`, `match_url`, `match_data`, `regex`, `position`, `last_count`, `last_access`, `group_id`, `status`, `action_type`, `action_code`, `action_data`, `match_type`, `title`) VALUES
(1, '/contacts/john-doe', '/contacts/john-doe', NULL, 0, 0, 7, '2024-12-10 13:38:13', 1, 'enabled', 'url', 301, 'http://aiot-fixing.local/wp-content/uploads/2024/12/202412100423-john-doe.vcf', 'url', NULL),
(2, '/aiotシステム開発ギャラリー/', '/aiot%e3%82%b7%e3%82%b9%e3%83%86%e3%83%a0%e9%96%8b%e7%99%ba%e3%82%ae%e3%83%a3%e3%83%a9%e3%83%aa%e3%83%bc', '{\"source\":{\"flag_regex\":false}}', 0, 1, 8, '2025-05-07 04:08:34', 1, 'enabled', 'url', 301, '/aiot-projects/', 'url', NULL),
(3, '/child-page-aiot/', '/child-page-aiot', '{\"source\":{\"flag_regex\":false}}', 0, 2, 5, '2025-08-11 01:33:56', 1, 'enabled', 'url', 301, '/aiot-projects/child-page-aiot/', 'url', NULL),
(4, '/🚀-九州の旅-テクノロジーで握手し、ベトナム-日/', '/%f0%9f%9a%80-%e4%b9%9d%e5%b7%9e%e3%81%ae%e6%97%85-%e3%83%86%e3%82%af%e3%83%8e%e3%83%ad%e3%82%b8%e3%83%bc%e3%81%a7%e6%8f%a1%e6%89%8b%e3%81%97%e3%80%81%e3%83%99%e3%83%88%e3%83%8a%e3%83%a0-%e6%97%a5', '{\"source\":{\"flag_regex\":false}}', 0, 3, 3, '2025-06-05 11:45:41', 1, 'enabled', 'url', 301, '/kyushu-journey-vietnam-japan/', 'url', NULL),
(5, '/privacypolicy/', '/privacypolicy', '{\"source\":{\"flag_regex\":false}}', 0, 4, 1, '2025-06-21 14:55:47', 1, 'enabled', 'url', 301, '/privacy-policy/', 'url', NULL),
(6, '/company-trip-2025-we-are-family-絆を深め、エネルギーを分かち合う旅/', '/company-trip-2025-we-are-family-%e7%b5%86%e3%82%92%e6%b7%b1%e3%82%81%e3%80%81%e3%82%a8%e3%83%8d%e3%83%ab%e3%82%ae%e3%83%bc%e3%82%92%e5%88%86%e3%81%8b%e3%81%a1%e5%90%88%e3%81%86%e6%97%85', '{\"source\":{\"flag_regex\":false}}', 0, 5, 1, '2025-08-13 16:31:19', 1, 'enabled', 'url', 301, '/company-trip-2025/', 'url', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_redirection_logs`
--

CREATE TABLE `wp_redirection_logs` (
  `id` int UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sent_to` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `agent` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `referrer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `http_code` int UNSIGNED NOT NULL DEFAULT '0',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `request_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `redirect_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `redirection_id` int UNSIGNED DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(2, 5, '_pll_strings_translations', 'a:3:{i:0;a:2:{i:0;s:3:\"H:i\";i:1;s:3:\"H:i\";}i:1;a:2:{i:0;s:7:\"&ndash;\";i:1;s:1:\"-\";}i:2;a:2:{i:0;s:3:\"TOP\";i:1;s:4:\"Home\";}}'),
(3, 9, '_pll_strings_translations', 'a:3:{i:0;a:2:{i:0;s:3:\"H:i\";i:1;s:5:\"g:i A\";}i:1;a:2:{i:0;s:7:\"&ndash;\";i:1;s:7:\"&ndash;\";}i:2;a:2:{i:0;s:3:\"TOP\";i:1;s:3:\"TOP\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, '未分類', 'uncategorized', 0),
(4, 'pll_66f4aa81993a8', 'pll_66f4aa81993a8', 0),
(5, '日本語', 'ja', 0),
(6, '日本語', 'pll_ja', 0),
(7, 'Uncategorized', 'uncategorized-ja', 0),
(9, 'English', 'en', 1),
(10, 'English', 'pll_en', 0),
(11, 'Uncategorized', 'uncategorized-en', 0),
(13, 'pll_66f4ae5e65108', 'pll_66f4ae5e65108', 0),
(14, 'Main menu (EN)', 'main-menu-en', 0),
(15, 'Footer Menu (EN)', 'footer-menu-en', 0),
(16, 'Blog category', 'blog-category', 0),
(17, 'News category', 'news-category', 0),
(18, 'News', 'news', 0),
(19, 'pll_66f95d9035762', 'pll_66f95d9035762', 0),
(21, 'Header Menu JP', 'header-menu-jp', 0),
(22, 'pll_66ffb8cfe0452', 'pll_66ffb8cfe0452', 0),
(23, 'pll_66ffb92c0a8f1', 'pll_66ffb92c0a8f1', 0),
(24, 'pll_66ffb96f44245', 'pll_66ffb96f44245', 0),
(25, 'pll_66ffb98fd0b5c', 'pll_66ffb98fd0b5c', 0),
(26, 'pll_66ffb9aed5285', 'pll_66ffb9aed5285', 0),
(27, 'pll_66ffb9c4494cf', 'pll_66ffb9c4494cf', 0),
(28, 'Footer Menu JP', 'footer-menu-jp', 0),
(29, 'pll_66fffadcb02c5', 'pll_66fffadcb02c5', 0),
(30, 'pll_66fffb2742b04', 'pll_66fffb2742b04', 0),
(31, 'pll_66fffbb095c6e', 'pll_66fffbb095c6e', 0),
(32, 'pll_66fffc64a7fab', 'pll_66fffc64a7fab', 0),
(33, 'pll_66fffcf82d6ff', 'pll_66fffcf82d6ff', 0),
(34, 'pll_66fffe45057fe', 'pll_66fffe45057fe', 0),
(35, 'pll_670140da81194', 'pll_670140da81194', 0),
(36, 'News', 'news', 0),
(37, 'pll_6701448a25614', 'pll_6701448a25614', 0),
(38, 'Article', 'article', 0),
(39, 'pll_670144c9cb7bf', 'pll_670144c9cb7bf', 0),
(41, 'pll_6710b4b40a484', 'pll_6710b4b40a484', 0),
(42, 'pll_672d921105e05', 'pll_672d921105e05', 0),
(43, 'pll_6736bd4195bfb', 'pll_6736bd4195bfb', 0),
(44, 'pll_678de9549d430', 'pll_678de9549d430', 0),
(45, 'pll_67934be7dbb51', 'pll_67934be7dbb51', 0),
(46, 'pll_67a03ca43d891', 'pll_67a03ca43d891', 0),
(47, 'pll_67a2edd5c6a4d', 'pll_67a2edd5c6a4d', 0),
(48, 'pll_67a9c0d032033', 'pll_67a9c0d032033', 0),
(49, 'pll_67c6b525527f0', 'pll_67c6b525527f0', 0),
(50, 'pll_67d14dce26a59', 'pll_67d14dce26a59', 0),
(51, 'pll_67d7994713ca2', 'pll_67d7994713ca2', 0),
(52, 'pll_67e1183aa8b4e', 'pll_67e1183aa8b4e', 0),
(53, 'pll_67ea3e746c473', 'pll_67ea3e746c473', 0),
(54, 'pll_67eb609d01ca5', 'pll_67eb609d01ca5', 0),
(55, 'pll_67ecf37e732ba', 'pll_67ecf37e732ba', 0),
(56, 'pll_685360c68dfe1', 'pll_685360c68dfe1', 0),
(57, 'ニュース', 'news', 0),
(59, '技術記事', 'tech-article', 0),
(60, 'pll_6880dbb323287', 'pll_6880dbb323287', 0),
(61, 'ニュース', 'news', 0),
(62, 'pll_6880dc05674ce', 'pll_6880dc05674ce', 0),
(63, '技術記事', 'tech-article', 0),
(64, 'pll_6880dc18bdfc8', 'pll_6880dc18bdfc8', 0),
(65, 'pll_688343d1ef356', 'pll_688343d1ef356', 0),
(66, 'Tiếng Việt', 'vi', 0),
(67, 'Tiếng Việt', 'pll_vi', 0),
(68, 'Uncategorized', 'uncategorized-vi', 0),
(69, 'pll_6887204bf40fc', 'pll_6887204bf40fc', 0),
(70, 'Mobile (JP)', 'mobile-jp', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(1, 9, 0),
(5, 9, 0),
(7, 4, 0),
(7, 6, 0),
(8, 9, 0),
(8, 13, 0),
(11, 4, 0),
(11, 10, 0),
(18, 5, 0),
(18, 10, 0),
(18, 19, 0),
(20, 5, 0),
(20, 13, 0),
(22, 14, 0),
(23, 9, 0),
(34, 9, 0),
(34, 24, 0),
(36, 9, 0),
(36, 10, 0),
(36, 22, 0),
(36, 37, 0),
(38, 9, 0),
(38, 10, 0),
(38, 23, 0),
(38, 39, 0),
(40, 9, 0),
(40, 25, 0),
(42, 9, 0),
(42, 26, 0),
(44, 9, 0),
(44, 27, 0),
(46, 9, 0),
(46, 34, 0),
(52, 14, 0),
(53, 14, 0),
(55, 15, 0),
(57, 6, 0),
(57, 15, 0),
(57, 19, 0),
(58, 15, 0),
(59, 6, 0),
(59, 15, 0),
(59, 60, 0),
(60, 15, 0),
(61, 6, 0),
(61, 15, 0),
(61, 62, 0),
(62, 15, 0),
(63, 6, 0),
(63, 15, 0),
(63, 64, 0),
(68, 4, 0),
(68, 15, 0),
(68, 67, 0),
(160, 9, 0),
(160, 35, 0),
(160, 36, 0),
(204, 21, 0),
(207, 5, 0),
(207, 22, 0),
(210, 5, 0),
(210, 23, 0),
(213, 5, 0),
(213, 24, 0),
(215, 5, 0),
(215, 25, 0),
(217, 5, 0),
(217, 26, 0),
(219, 5, 0),
(219, 27, 0),
(238, 21, 0),
(239, 21, 0),
(240, 28, 0),
(241, 28, 0),
(242, 28, 0),
(243, 28, 0),
(244, 28, 0),
(245, 28, 0),
(246, 28, 0),
(247, 28, 0),
(248, 28, 0),
(283, 9, 0),
(283, 29, 0),
(286, 9, 0),
(286, 30, 0),
(289, 5, 0),
(289, 29, 0),
(291, 5, 0),
(291, 30, 0),
(293, 9, 0),
(293, 31, 0),
(296, 5, 0),
(296, 31, 0),
(298, 9, 0),
(298, 32, 0),
(301, 5, 0),
(301, 32, 0),
(303, 9, 0),
(303, 33, 0),
(306, 5, 0),
(306, 33, 0),
(308, 14, 0),
(309, 15, 0),
(310, 15, 0),
(311, 15, 0),
(312, 15, 0),
(313, 15, 0),
(314, 28, 0),
(315, 28, 0),
(316, 28, 0),
(317, 28, 0),
(318, 28, 0),
(319, 21, 0),
(320, 5, 0),
(320, 34, 0),
(357, 5, 0),
(357, 35, 0),
(357, 61, 0),
(358, 15, 0),
(359, 28, 0),
(440, 9, 0),
(440, 41, 0),
(450, 5, 0),
(450, 61, 0),
(450, 65, 0),
(453, 5, 0),
(453, 42, 0),
(453, 61, 0),
(459, 9, 0),
(459, 42, 0),
(460, 5, 0),
(460, 43, 0),
(460, 61, 0),
(464, 9, 0),
(464, 43, 0),
(467, 5, 0),
(467, 61, 0),
(468, 5, 0),
(468, 61, 0),
(552, 5, 0),
(552, 44, 0),
(552, 63, 0),
(555, 9, 0),
(555, 44, 0),
(556, 5, 0),
(556, 45, 0),
(556, 63, 0),
(558, 9, 0),
(558, 45, 0),
(561, 5, 0),
(561, 46, 0),
(561, 63, 0),
(563, 9, 0),
(563, 46, 0),
(564, 5, 0),
(564, 47, 0),
(564, 63, 0),
(566, 9, 0),
(566, 47, 0),
(569, 5, 0),
(569, 48, 0),
(569, 63, 0),
(571, 9, 0),
(571, 48, 0),
(574, 5, 0),
(574, 49, 0),
(574, 63, 0),
(575, 9, 0),
(575, 49, 0),
(584, 5, 0),
(584, 50, 0),
(584, 63, 0),
(585, 9, 0),
(585, 50, 0),
(595, 5, 0),
(595, 51, 0),
(606, 5, 0),
(609, 9, 0),
(609, 51, 0),
(616, 5, 0),
(619, 5, 0),
(622, 5, 0),
(632, 5, 0),
(632, 52, 0),
(632, 63, 0),
(634, 9, 0),
(634, 52, 0),
(635, 5, 0),
(654, 5, 0),
(654, 53, 0),
(654, 63, 0),
(655, 9, 0),
(655, 53, 0),
(667, 5, 0),
(667, 54, 0),
(667, 61, 0),
(672, 9, 0),
(672, 54, 0),
(673, 5, 0),
(673, 55, 0),
(673, 63, 0),
(674, 9, 0),
(674, 55, 0),
(675, 5, 0),
(675, 56, 0),
(688, 28, 0),
(689, 9, 0),
(689, 56, 0),
(708, 5, 0),
(710, 5, 0),
(753, 9, 0),
(753, 65, 0),
(760, 46, 0),
(760, 66, 0),
(761, 47, 0),
(761, 66, 0),
(764, 50, 0),
(764, 66, 0),
(767, 45, 0),
(767, 66, 0),
(769, 35, 0),
(769, 66, 0),
(770, 54, 0),
(770, 66, 0),
(773, 65, 0),
(773, 66, 0),
(790, 5, 0),
(790, 61, 0),
(800, 5, 0),
(803, 28, 0),
(811, 53, 0),
(811, 66, 0),
(813, 66, 0),
(814, 5, 0),
(826, 66, 0),
(827, 21, 0),
(828, 21, 0),
(829, 21, 0),
(830, 21, 0),
(831, 70, 0),
(832, 70, 0),
(833, 70, 0),
(835, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(4, 4, 'term_translations', 'a:3:{s:2:\"ja\";i:7;s:2:\"en\";i:11;s:2:\"vi\";i:68;}', 0, 3),
(5, 5, 'language', 'a:4:{s:9:\"fallbacks\";a:0:{}s:6:\"locale\";s:2:\"ja\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"jp\";}', 0, 40),
(6, 6, 'term_language', '', 0, 5),
(7, 7, 'category', '', 0, 0),
(9, 9, 'language', 'a:4:{s:9:\"fallbacks\";a:0:{}s:6:\"locale\";s:5:\"en_US\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"us\";}', 0, 34),
(10, 10, 'term_language', '', 0, 4),
(11, 11, 'category', '', 0, 0),
(13, 13, 'post_translations', 'a:2:{s:2:\"en\";i:8;s:2:\"ja\";i:20;}', 0, 2),
(14, 14, 'nav_menu', '', 0, 4),
(15, 15, 'nav_menu', '', 0, 15),
(16, 16, 'blog_cat', '', 0, 0),
(17, 17, 'blog_cat', '', 0, 0),
(18, 18, 'blog_tags', 'Tin tức', 0, 0),
(19, 19, 'term_translations', 'a:2:{s:2:\"en\";i:18;s:2:\"ja\";i:57;}', 0, 2),
(21, 21, 'nav_menu', '', 0, 9),
(22, 22, 'post_translations', 'a:2:{s:2:\"ja\";i:207;s:2:\"en\";i:36;}', 0, 2),
(23, 23, 'post_translations', 'a:2:{s:2:\"ja\";i:210;s:2:\"en\";i:38;}', 0, 2),
(24, 24, 'post_translations', 'a:2:{s:2:\"ja\";i:213;s:2:\"en\";i:34;}', 0, 2),
(25, 25, 'post_translations', 'a:2:{s:2:\"ja\";i:215;s:2:\"en\";i:40;}', 0, 2),
(26, 26, 'post_translations', 'a:2:{s:2:\"ja\";i:217;s:2:\"en\";i:42;}', 0, 2),
(27, 27, 'post_translations', 'a:2:{s:2:\"ja\";i:219;s:2:\"en\";i:44;}', 0, 2),
(28, 28, 'nav_menu', '', 0, 17),
(29, 29, 'post_translations', 'a:2:{s:2:\"ja\";i:289;s:2:\"en\";i:283;}', 0, 2),
(30, 30, 'post_translations', 'a:2:{s:2:\"ja\";i:291;s:2:\"en\";i:286;}', 0, 2),
(31, 31, 'post_translations', 'a:2:{s:2:\"ja\";i:296;s:2:\"en\";i:293;}', 0, 2),
(32, 32, 'post_translations', 'a:2:{s:2:\"ja\";i:301;s:2:\"en\";i:298;}', 0, 2),
(33, 33, 'post_translations', 'a:2:{s:2:\"ja\";i:306;s:2:\"en\";i:303;}', 0, 2),
(34, 34, 'post_translations', 'a:2:{s:2:\"ja\";i:320;s:2:\"en\";i:46;}', 0, 2),
(35, 35, 'post_translations', 'a:3:{s:2:\"ja\";i:357;s:2:\"en\";i:160;s:2:\"vi\";i:769;}', 0, 3),
(36, 36, 'blog_cat', '', 0, 1),
(37, 37, 'term_translations', 'a:1:{s:2:\"en\";i:36;}', 0, 1),
(38, 38, 'blog_cat', '', 0, 0),
(39, 39, 'term_translations', 'a:1:{s:2:\"en\";i:38;}', 0, 1),
(41, 41, 'post_translations', 'a:1:{s:2:\"en\";i:440;}', 0, 1),
(42, 42, 'post_translations', 'a:2:{s:2:\"en\";i:459;s:2:\"ja\";i:453;}', 0, 2),
(43, 43, 'post_translations', 'a:2:{s:2:\"en\";i:464;s:2:\"ja\";i:460;}', 0, 2),
(44, 44, 'post_translations', 'a:2:{s:2:\"en\";i:555;s:2:\"ja\";i:552;}', 0, 2),
(45, 45, 'post_translations', 'a:3:{s:2:\"en\";i:558;s:2:\"ja\";i:556;s:2:\"vi\";i:767;}', 0, 3),
(46, 46, 'post_translations', 'a:3:{s:2:\"en\";i:563;s:2:\"ja\";i:561;s:2:\"vi\";i:760;}', 0, 3),
(47, 47, 'post_translations', 'a:3:{s:2:\"en\";i:566;s:2:\"ja\";i:564;s:2:\"vi\";i:761;}', 0, 3),
(48, 48, 'post_translations', 'a:2:{s:2:\"en\";i:571;s:2:\"ja\";i:569;}', 0, 2),
(49, 49, 'post_translations', 'a:2:{s:2:\"en\";i:575;s:2:\"ja\";i:574;}', 0, 2),
(50, 50, 'post_translations', 'a:3:{s:2:\"en\";i:585;s:2:\"ja\";i:584;s:2:\"vi\";i:764;}', 0, 3),
(51, 51, 'post_translations', 'a:2:{s:2:\"en\";i:609;s:2:\"ja\";i:595;}', 0, 2),
(52, 52, 'post_translations', 'a:2:{s:2:\"en\";i:634;s:2:\"ja\";i:632;}', 0, 2),
(53, 53, 'post_translations', 'a:3:{s:2:\"en\";i:655;s:2:\"ja\";i:654;s:2:\"vi\";i:811;}', 0, 3),
(54, 54, 'post_translations', 'a:3:{s:2:\"en\";i:672;s:2:\"ja\";i:667;s:2:\"vi\";i:770;}', 0, 3),
(55, 55, 'post_translations', 'a:2:{s:2:\"en\";i:674;s:2:\"ja\";i:673;}', 0, 2),
(56, 56, 'post_translations', 'a:2:{s:2:\"en\";i:689;s:2:\"ja\";i:675;}', 0, 2),
(57, 57, 'blog_tags', '', 0, 0),
(59, 59, 'blog_tags', '', 0, 0),
(60, 60, 'term_translations', 'a:1:{s:2:\"ja\";i:59;}', 0, 1),
(61, 61, 'blog_cat', '', 0, 6),
(62, 62, 'term_translations', 'a:1:{s:2:\"ja\";i:61;}', 0, 1),
(63, 63, 'blog_cat', '', 0, 10),
(64, 64, 'term_translations', 'a:1:{s:2:\"ja\";i:63;}', 0, 1),
(65, 65, 'post_translations', 'a:3:{s:2:\"en\";i:753;s:2:\"ja\";i:450;s:2:\"vi\";i:773;}', 0, 3),
(66, 66, 'language', 'a:4:{s:9:\"fallbacks\";a:0:{}s:6:\"locale\";s:2:\"vi\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"vn\";}', 0, 8),
(67, 67, 'term_language', '', 0, 1),
(68, 68, 'category', '', 0, 0),
(69, 69, 'term_translations', 'a:1:{s:2:\"ja\";i:68;}', 0, 0),
(70, 70, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'BinhBD'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice,wpdbbkp_subscribe_pointer'),
(15, 1, 'show_welcome_panel', '0'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '733'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:12:\"192.168.65.0\";}'),
(20, 1, 'wp_persisted_preferences', 'a:3:{s:4:\"core\";a:11:{s:26:\"isComplementaryAreaVisible\";b:1;s:21:\"showListViewByDefault\";b:1;s:14:\"mostUsedBlocks\";b:1;s:14:\"showIconLabels\";b:1;s:20:\"keepCaretInsideBlock\";b:1;s:15:\"distractionFree\";b:0;s:12:\"fixedToolbar\";b:0;s:9:\"focusMode\";b:0;s:20:\"showBlockBreadcrumbs\";b:1;s:24:\"allowRightClickOverrides\";b:1;s:10:\"editorMode\";s:6:\"visual\";}s:14:\"core/edit-post\";a:2:{s:12:\"welcomeGuide\";b:0;s:14:\"fullscreenMode\";b:0;}s:9:\"_modified\";s:24:\"2025-09-26T02:58:22.083Z\";}'),
(21, 1, 'wp_user-settings', 'libraryContent=browse&mfold=o&posts_list_mode=excerpt'),
(22, 1, 'wp_user-settings-time', '1727451158'),
(23, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:15:\"title-attribute\";i:2;s:11:\"css-classes\";i:3;s:3:\"xfn\";i:4;s:11:\"description\";}'),
(24, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:19:\"pll_lang_switch_box\";i:1;s:12:\"add-post_tag\";}'),
(25, 1, 'closedpostboxes_nav-menus', 'a:0:{}'),
(26, 1, 'nav_menu_recently_edited', '21'),
(27, 1, 'manageedit-pagecolumnshidden', 'a:2:{i:0;s:15:\"rank_math_title\";i:1;s:21:\"rank_math_description\";}'),
(28, 1, 'edit_page_per_page', '20'),
(29, 1, 'manageedit-postcolumnshidden', 'a:3:{i:0;s:0:\"\";i:1;s:15:\"rank_math_title\";i:2;s:21:\"rank_math_description\";}'),
(30, 1, 'manageedit-postcolumnshidden_default', '1'),
(31, 1, 'manageedit-pagecolumnshidden_default', '1'),
(32, 1, 'manageedit-blogcolumnshidden', 'a:3:{i:0;s:0:\"\";i:1;s:15:\"rank_math_title\";i:2;s:21:\"rank_math_description\";}'),
(33, 1, 'manageedit-blogcolumnshidden_default', '1'),
(34, 1, 'meta-box-order_page', 'a:2:{i:0;b:0;s:4:\"side\";s:38:\"submitdiv,rank_math_metabox_content_ai\";}'),
(35, 1, 'last_update', '1759503787'),
(36, 1, 'meta-box-order_blog', 'a:2:{i:0;b:0;s:4:\"side\";s:38:\"submitdiv,rank_math_metabox_content_ai\";}'),
(37, 2, 'nickname', 'vyntk'),
(38, 2, 'first_name', 'Vy'),
(39, 2, 'last_name', 'Khánh'),
(40, 2, 'description', ''),
(41, 2, 'rich_editing', 'true'),
(42, 2, 'syntax_highlighting', 'true'),
(43, 2, 'comment_shortcuts', 'false'),
(44, 2, 'admin_color', 'fresh'),
(45, 2, 'use_ssl', '0'),
(46, 2, 'show_admin_bar_front', 'true'),
(47, 2, 'locale', 'en_US'),
(48, 2, 'wp_capabilities', 'a:1:{s:6:\"editor\";b:1;}'),
(49, 2, 'wp_user_level', '7'),
(50, 2, 'last_update', '1755102246'),
(51, 2, 'dismissed_wp_pointers', ''),
(52, 2, 'twitter', ''),
(53, 2, 'facebook', ''),
(54, 2, 'additional_profile_urls', ''),
(55, 2, 'session_tokens', 'a:1:{s:64:\"d004295fddcb78542b1ba8f6a88def8801274f13958bebaa3a9ec135b4020aa5\";a:4:{s:10:\"expiration\";i:1758771976;s:2:\"ip\";s:14:\"14.224.147.134\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\";s:5:\"login\";i:1758599176;}}'),
(56, 2, 'manageedit-postcolumnshidden', 'a:3:{i:0;s:0:\"\";i:1;s:15:\"rank_math_title\";i:2;s:21:\"rank_math_description\";}'),
(57, 2, 'manageedit-postcolumnshidden_default', '1'),
(58, 2, 'manageedit-pagecolumnshidden', 'a:3:{i:0;s:0:\"\";i:1;s:15:\"rank_math_title\";i:2;s:21:\"rank_math_description\";}'),
(59, 2, 'manageedit-pagecolumnshidden_default', '1'),
(60, 2, 'manageedit-blogcolumnshidden', 'a:3:{i:0;s:0:\"\";i:1;s:15:\"rank_math_title\";i:2;s:21:\"rank_math_description\";}'),
(61, 2, 'manageedit-blogcolumnshidden_default', '1'),
(62, 2, 'wp_persisted_preferences', 'a:3:{s:4:\"core\";a:3:{s:26:\"isComplementaryAreaVisible\";b:1;s:20:\"showBlockBreadcrumbs\";b:0;s:10:\"editorMode\";s:6:\"visual\";}s:14:\"core/edit-post\";a:2:{s:12:\"welcomeGuide\";b:0;s:14:\"fullscreenMode\";b:0;}s:9:\"_modified\";s:24:\"2025-09-03T03:54:42.504Z\";}'),
(64, 2, 'description_en', ''),
(65, 2, 'wp_user-settings', 'libraryContent=browse&mfold=o&posts_list_mode=list'),
(66, 2, 'wp_user-settings-time', '1742973594'),
(67, 1, 'rml_1_lastquery', '0'),
(68, 1, 'session_tokens', 'a:3:{s:64:\"4efd01c0db84a9576cd17a814ea49cdbb4d797da77c561e8a8cb459b1ca4a477\";a:4:{s:10:\"expiration\";i:1759542262;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\";s:5:\"login\";i:1759369462;}s:64:\"cf8eb38a989b7fd6d09d12f28ef7bb2775a1ae237b2992c31cff80a6de282681\";a:4:{s:10:\"expiration\";i:1759562584;s:2:\"ip\";s:12:\"192.168.65.1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\";s:5:\"login\";i:1759389784;}s:64:\"8abc0177ca9967c1e45587c6a2fa1a8e8e3d364d4f30610f13b279cd7e7aeea3\";a:4:{s:10:\"expiration\";i:1759639158;s:2:\"ip\";s:12:\"192.168.65.1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\";s:5:\"login\";i:1759466358;}}'),
(69, 2, 'rml_1_lastquery', '0'),
(70, 1, 'pll_filter_content', 'ja'),
(71, 2, 'edit_page_per_page', '50'),
(72, 2, 'pll_filter_content', 'ja'),
(73, 1, 'description_en', ''),
(74, 1, 'twitter', ''),
(75, 1, 'facebook', ''),
(76, 1, 'additional_profile_urls', ''),
(77, 3, 'nickname', 'kido_aiot'),
(78, 3, 'first_name', 'Kido'),
(79, 3, 'last_name', 'Takahiro'),
(80, 3, 'description', ''),
(81, 3, 'rich_editing', 'true'),
(82, 3, 'syntax_highlighting', 'true'),
(83, 3, 'comment_shortcuts', 'false'),
(84, 3, 'admin_color', 'fresh'),
(85, 3, 'use_ssl', '0'),
(86, 3, 'show_admin_bar_front', 'true'),
(87, 3, 'locale', ''),
(88, 3, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(89, 3, 'wp_user_level', '10'),
(90, 3, 'last_update', '1751511457'),
(91, 3, 'dismissed_wp_pointers', ''),
(92, 3, 'twitter', ''),
(93, 3, 'facebook', ''),
(94, 3, 'additional_profile_urls', ''),
(95, 3, 'description_en', ''),
(96, 1, '_new_email', 'a:2:{s:4:\"hash\";s:32:\"3f31748a4e8861d59418836f29aa2f9f\";s:8:\"newemail\";s:24:\"binhbd@aiot-fixing.local\";}'),
(97, 3, 'session_tokens', 'a:1:{s:64:\"8bb9a71baad99463eabdc58752ef7236da1031f3cb445b9c4e4f27db225f2e9c\";a:4:{s:10:\"expiration\";i:1752721218;s:2:\"ip\";s:12:\"14.241.246.5\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36\";s:5:\"login\";i:1751511618;}}'),
(98, 1, 'wp_media_library_mode', 'list'),
(99, 1, 'wfls-last-login', '1759466358'),
(100, 1, 'manageedit-projectcolumnshidden', 'a:3:{i:0;s:0:\"\";i:1;s:15:\"rank_math_title\";i:2;s:21:\"rank_math_description\";}'),
(101, 1, 'manageedit-projectcolumnshidden_default', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint UNSIGNED NOT NULL,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'aiot', '$wp$2y$10$qjlTQavcRh00Z0dwKqlrPOAjuPBIsLyh1lp7ibxBBjTMHC/i5.UC.', 'aiot', 'info@aiot-fixing.local', 'http://aiot-fixing.local', '2024-09-25 10:15:35', '', 0, 'BinhBD'),
(2, 'aiot-media', '$wp$2y$10$3/S95E6ZBhWX40BzkrbxNuanqzEvbAVPJhJPMKGtiFCvA8kjSx/02', 'aiot-media', 'vyntk@aiot-fixing.local', 'http://aiot-fixing.local', '2024-10-17 05:39:19', '', 0, 'Khánh Vy'),
(3, 'kido_aiot', '$wp$2y$10$aotguojdMS2WxcWb/qPU1uuNcZ1/bk8SqH/kI66efdJKk18HX0dlq', 'kido_aiot', 'takahiro_kido@aiot-fixing.local', '', '2025-07-03 02:55:52', '', 0, 'Kido Takahiro');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfauditevents`
--

CREATE TABLE `wp_wfauditevents` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `event_time` double(14,4) NOT NULL,
  `request_id` bigint UNSIGNED NOT NULL,
  `state` enum('new','sending','sent') NOT NULL DEFAULT 'new',
  `state_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfblockediplog`
--

CREATE TABLE `wp_wfblockediplog` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `countryCode` varchar(2) NOT NULL,
  `blockCount` int UNSIGNED NOT NULL DEFAULT '0',
  `unixday` int UNSIGNED NOT NULL,
  `blockType` varchar(50) NOT NULL DEFAULT 'generic'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfblocks7`
--

CREATE TABLE `wp_wfblocks7` (
  `id` bigint UNSIGNED NOT NULL,
  `type` int UNSIGNED NOT NULL DEFAULT '0',
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `blockedTime` bigint NOT NULL,
  `reason` varchar(255) NOT NULL,
  `lastAttempt` int UNSIGNED DEFAULT '0',
  `blockedHits` int UNSIGNED DEFAULT '0',
  `expiration` bigint UNSIGNED NOT NULL DEFAULT '0',
  `parameters` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfconfig`
--

CREATE TABLE `wp_wfconfig` (
  `name` varchar(100) NOT NULL,
  `val` longblob,
  `autoload` enum('no','yes') NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `wp_wfconfig`
--

INSERT INTO `wp_wfconfig` (`name`, `val`, `autoload`) VALUES
('activatingIP', 0x3132372e302e302e31, 'yes'),
('actUpdateInterval', 0x32, 'yes'),
('addCacheComment', 0x30, 'yes'),
('advancedCommentScanning', 0x31, 'yes'),
('ajaxWatcherDisabled_admin', 0x30, 'yes'),
('ajaxWatcherDisabled_front', 0x30, 'yes'),
('alertEmails', 0x6d6f6f6d732e64657640676d61696c2e636f6d, 'yes'),
('alertOn_adminLogin', 0x31, 'yes'),
('alertOn_block', 0x31, 'yes'),
('alertOn_breachLogin', 0x31, 'yes'),
('alertOn_firstAdminLoginOnly', 0x30, 'yes'),
('alertOn_firstNonAdminLoginOnly', 0x30, 'yes'),
('alertOn_loginLockout', 0x31, 'yes'),
('alertOn_lostPasswdForm', 0x31, 'yes'),
('alertOn_nonAdminLogin', 0x30, 'yes'),
('alertOn_scanIssues', 0x31, 'yes'),
('alertOn_severityLevel', 0x3235, 'yes'),
('alertOn_throttle', 0x30, 'yes'),
('alertOn_update', 0x30, 'yes'),
('alertOn_wafDeactivated', 0x31, 'yes'),
('alertOn_wordfenceDeactivated', 0x31, 'yes'),
('alert_maxHourly', 0x30, 'yes'),
('allowed404s', 0x2f66617669636f6e2e69636f0a2f6170706c652d746f7563682d69636f6e2a2e706e670a2f2a4032782e706e670a2f62726f77736572636f6e6669672e786d6c0a2f77702d6c6f67696e2e7068700a2f786d6c7270632e7068700a2f77702d61646d696e2f, 'yes'),
('allowed404s6116Migration', 0x31, 'yes'),
('allowHTTPSCaching', 0x30, 'yes'),
('allowLegacy2FA', 0x30, 'yes'),
('allowMySQLi', 0x31, 'yes'),
('allScansScheduled', 0x613a303a7b7d, 'yes'),
('apiKey', 0x3164376661613539303233373837376230386133313832376437646465663063323561653336373130633133373738313936333337303439373165323332383664613633386332353132383331653530643161663037656138373833343334393834343639323030343833353664336565333664626638643638613931373636, 'yes'),
('auditLogMode', 0x64656661756c74, 'yes'),
('autoBlockScanners', 0x31, 'yes'),
('autoUpdate', 0x31, 'yes'),
('autoUpdateAttempts', 0x30, 'yes'),
('bannedURLs', '', 'yes'),
('blockCustomText', '', 'yes'),
('blockedTime', 0x333030, 'yes'),
('blocks702Migration', 0x31, 'yes'),
('cacheType', 0x64697361626c6564, 'yes'),
('cbl_action', 0x626c6f636b, 'yes'),
('cbl_bypassRedirDest', '', 'yes'),
('cbl_bypassRedirURL', '', 'yes'),
('cbl_bypassViewURL', '', 'yes'),
('cbl_cookieVal', 0x36383831656232356261616135, 'yes'),
('cbl_loggedInBlocked', 0x30, 'yes'),
('cbl_redirURL', '', 'yes'),
('cbl_restOfSiteBlocked', 0x31, 'yes'),
('checkSpamIP', 0x31, 'yes'),
('config701Migration', 0x31, 'yes'),
('config720Migration', 0x31, 'yes'),
('dashboardData', 0x613a343a7b733a393a2267656e657261746564223b693a313735393339303032383b733a333a22746466223b613a333a7b733a393a22636f6d6d756e697479223b693a373034303b733a373a227072656d69756d223b693a373039393b733a393a22626c61636b6c697374223b693a363036313b7d733a31303a2261747461636b64617461223b613a333a7b733a333a22323468223b613a32343a7b693a303b613a323a7b733a313a2274223b693a313735393330323030303b733a313a2263223b693a333931353430313b7d693a313b613a323a7b733a313a2274223b693a313735393330353630303b733a313a2263223b693a343833373039353b7d693a323b613a323a7b733a313a2274223b693a313735393330393230303b733a313a2263223b693a363030353339353b7d693a333b613a323a7b733a313a2274223b693a313735393331323830303b733a313a2263223b693a353836383139323b7d693a343b613a323a7b733a313a2274223b693a313735393331363430303b733a313a2263223b693a353933323138393b7d693a353b613a323a7b733a313a2274223b693a313735393332303030303b733a313a2263223b693a353739383632313b7d693a363b613a323a7b733a313a2274223b693a313735393332333630303b733a313a2263223b693a353833363438303b7d693a373b613a323a7b733a313a2274223b693a313735393332373230303b733a313a2263223b693a353833323335303b7d693a383b613a323a7b733a313a2274223b693a313735393333303830303b733a313a2263223b693a353737333634393b7d693a393b613a323a7b733a313a2274223b693a313735393333343430303b733a313a2263223b693a353634323634333b7d693a31303b613a323a7b733a313a2274223b693a313735393333383030303b733a313a2263223b693a353232313634343b7d693a31313b613a323a7b733a313a2274223b693a313735393334313630303b733a313a2263223b693a353635383635353b7d693a31323b613a323a7b733a313a2274223b693a313735393334353230303b733a313a2263223b693a353832393639303b7d693a31333b613a323a7b733a313a2274223b693a313735393334383830303b733a313a2263223b693a353131363431373b7d693a31343b613a323a7b733a313a2274223b693a313735393335323430303b733a313a2263223b693a333936363236343b7d693a31353b613a323a7b733a313a2274223b693a313735393335363030303b733a313a2263223b693a333735393131323b7d693a31363b613a323a7b733a313a2274223b693a313735393335393630303b733a313a2263223b693a333936323439333b7d693a31373b613a323a7b733a313a2274223b693a313735393336333230303b733a313a2263223b693a333832383131373b7d693a31383b613a323a7b733a313a2274223b693a313735393336363830303b733a313a2263223b693a333836303133303b7d693a31393b613a323a7b733a313a2274223b693a313735393337303430303b733a313a2263223b693a333833353232363b7d693a32303b613a323a7b733a313a2274223b693a313735393337343030303b733a313a2263223b693a373036383232363b7d693a32313b613a323a7b733a313a2274223b693a313735393337373630303b733a313a2263223b693a383238303536373b7d693a32323b613a323a7b733a313a2274223b693a313735393338313230303b733a313a2263223b693a383033343535353b7d693a32333b613a323a7b733a313a2274223b693a313735393338343830303b733a313a2263223b693a373639353035313b7d7d733a323a223764223b613a373a7b693a303b613a323a7b733a313a2274223b693a313735383735383430303b733a313a2263223b693a3136343435303133323b7d693a313b613a323a7b733a313a2274223b693a313735383834343830303b733a313a2263223b693a3136393230363039323b7d693a323b613a323a7b733a313a2274223b693a313735383933313230303b733a313a2263223b693a3132383030393234373b7d693a333b613a323a7b733a313a2274223b693a313735393031373630303b733a313a2263223b693a3136393831333934303b7d693a343b613a323a7b733a313a2274223b693a313735393130343030303b733a313a2263223b693a3134323132383433323b7d693a353b613a323a7b733a313a2274223b693a313735393139303430303b733a313a2263223b693a3132383439363134333b7d693a363b613a323a7b733a313a2274223b693a313735393237363830303b733a313a2263223b693a3131363131393236353b7d7d733a333a22333064223b613a33303a7b693a303b613a323a7b733a313a2274223b693a313735363737313230303b733a313a2263223b693a3339363436383437383b7d693a313b613a323a7b733a313a2274223b693a313735363835373630303b733a313a2263223b693a3332303236313530333b7d693a323b613a323a7b733a313a2274223b693a313735363934343030303b733a313a2263223b693a3334363537383335363b7d693a333b613a323a7b733a313a2274223b693a313735373033303430303b733a313a2263223b693a3338333337313734323b7d693a343b613a323a7b733a313a2274223b693a313735373131363830303b733a313a2263223b693a3239303633323538393b7d693a353b613a323a7b733a313a2274223b693a313735373230333230303b733a313a2263223b693a3332323939383435393b7d693a363b613a323a7b733a313a2274223b693a313735373238393630303b733a313a2263223b693a3235323336353937353b7d693a373b613a323a7b733a313a2274223b693a313735373337363030303b733a313a2263223b693a3238343938323731393b7d693a383b613a323a7b733a313a2274223b693a313735373436323430303b733a313a2263223b693a3237393538353230333b7d693a393b613a323a7b733a313a2274223b693a313735373534383830303b733a313a2263223b693a3232373130383137313b7d693a31303b613a323a7b733a313a2274223b693a313735373633353230303b733a313a2263223b693a3234303934343934323b7d693a31313b613a323a7b733a313a2274223b693a313735373732313630303b733a313a2263223b693a3138393836303134343b7d693a31323b613a323a7b733a313a2274223b693a313735373830383030303b733a313a2263223b693a3134363036303237363b7d693a31333b613a323a7b733a313a2274223b693a313735373839343430303b733a313a2263223b693a3235353836393736373b7d693a31343b613a323a7b733a313a2274223b693a313735373938303830303b733a313a2263223b693a3238393235323238363b7d693a31353b613a323a7b733a313a2274223b693a313735383036373230303b733a313a2263223b693a3237323030313039313b7d693a31363b613a323a7b733a313a2274223b693a313735383135333630303b733a313a2263223b693a3233363633333239323b7d693a31373b613a323a7b733a313a2274223b693a313735383234303030303b733a313a2263223b693a3230353032343134303b7d693a31383b613a323a7b733a313a2274223b693a313735383332363430303b733a313a2263223b693a3234383534323038303b7d693a31393b613a323a7b733a313a2274223b693a313735383431323830303b733a313a2263223b693a3230343835303134323b7d693a32303b613a323a7b733a313a2274223b693a313735383439393230303b733a313a2263223b693a3138333738333038393b7d693a32313b613a323a7b733a313a2274223b693a313735383538353630303b733a313a2263223b693a3138303131343434343b7d693a32323b613a323a7b733a313a2274223b693a313735383637323030303b733a313a2263223b693a3135353030383133333b7d693a32333b613a323a7b733a313a2274223b693a313735383735383430303b733a313a2263223b693a3136343435303133323b7d693a32343b613a323a7b733a313a2274223b693a313735383834343830303b733a313a2263223b693a3136393230363039323b7d693a32353b613a323a7b733a313a2274223b693a313735383933313230303b733a313a2263223b693a3132383030393234373b7d693a32363b613a323a7b733a313a2274223b693a313735393031373630303b733a313a2263223b693a3136393831333934303b7d693a32373b613a323a7b733a313a2274223b693a313735393130343030303b733a313a2263223b693a3134323132383433323b7d693a32383b613a323a7b733a313a2274223b693a313735393139303430303b733a313a2263223b693a3132383439363134333b7d693a32393b613a323a7b733a313a2274223b693a313735393237363830303b733a313a2263223b693a3131363131393236353b7d7d7d733a393a22636f756e7472696573223b613a313a7b733a323a223764223b613a31303a7b693a303b613a323a7b733a323a226364223b733a323a225553223b733a323a226374223b693a3635353535383734303b7d693a313b613a323a7b733a323a226364223b733a323a224e4c223b733a323a226374223b693a3235363338333737333b7d693a323b613a323a7b733a323a226364223b733a323a225347223b733a323a226374223b693a3139353730303739383b7d693a333b613a323a7b733a323a226364223b733a323a224445223b733a323a226374223b693a3138313938383537313b7d693a343b613a323a7b733a323a226364223b733a323a224652223b733a323a226374223b693a3133343233363731383b7d693a353b613a323a7b733a323a226364223b733a323a22494e223b733a323a226374223b693a3130353436393539353b7d693a363b613a323a7b733a323a226364223b733a323a224742223b733a323a226374223b693a38343330323633393b7d693a373b613a323a7b733a323a226364223b733a323a22434e223b733a323a226374223b693a37343538343438323b7d693a383b613a323a7b733a323a226364223b733a323a22564e223b733a323a226374223b693a35373830323037353b7d693a393b613a323a7b733a323a226364223b733a323a224944223b733a323a226374223b693a34303939383231363b7d7d7d7d, 'no'),
('dbTest', 0x613a313a7b733a353a226e6f6e6365223b733a36343a2266383735313739323439663131643834353466353537633064323665633664363636623430633936633634613939363034376434666338353932393865333135223b7d, 'no'),
('dbVersion', 0x382e302e3335, 'yes'),
('debugOn', 0x30, 'yes'),
('deleteTablesOnDeact', 0x30, 'yes'),
('detectProxyNextCheck', '', 'no'),
('detectProxyNonce', 0x65653339323131383936653666363832303233383161633261373338646261313638353766663837343565613436313966366530383662366661653431373765, 'no'),
('detectProxyRecommendation', 0x4445464552524544, 'no'),
('diagnosticsWflogsRemovalHistory', 0x5b5d, 'no'),
('disableCodeExecutionUploads', '', 'yes'),
('disableConfigCaching', 0x30, 'yes'),
('disableWAFIPBlocking', 0x30, 'yes'),
('dismissAutoPrependNotice', 0x30, 'yes'),
('displayAutomaticBlocks', 0x31, 'yes'),
('displayTopLevelAuditLog', 0x31, 'yes'),
('displayTopLevelBlocking', 0x30, 'yes'),
('displayTopLevelLiveTraffic', 0x30, 'yes'),
('displayTopLevelOptions', 0x31, 'yes'),
('email_summary_dashboard_widget_enabled', 0x31, 'yes'),
('email_summary_enabled', 0x31, 'yes'),
('email_summary_excluded_directories', 0x77702d636f6e74656e742f63616368650a77702d636f6e74656e742f77666c6f6773, 'yes'),
('email_summary_interval', 0x7765656b6c79, 'yes'),
('enableRemoteIpLookup', 0x31, 'yes'),
('encKey', 0x30326338643662643061383737653835, 'yes'),
('fileContentsGSB6315Migration', 0x31, 'yes'),
('firewallEnabled', 0x31, 'yes'),
('hasKeyConflict', 0x30, 'yes'),
('howGetIPs', '', 'yes'),
('howGetIPs_trusted_proxies', '', 'yes'),
('howGetIPs_trusted_proxy_preset', '', 'yes'),
('isPaid', '', 'yes'),
('keyType', 0x66726565, 'yes'),
('lastAdminLogin', 0x613a363a7b733a363a22757365724944223b693a313b733a383a22757365726e616d65223b733a343a2261696f74223b733a393a2266697273744e616d65223b733a303a22223b733a383a226c6173744e616d65223b733a303a22223b733a343a2274696d65223b733a32383a2246726920337264204f63746f62657220402030313a33393a3138504d223b733a323a224950223b733a31323a223139322e3136382e36352e31223b7d, 'yes'),
('lastAuditEvents', 0x613a32303a7b693a303b613a323a7b693a303b613a323a7b693a303b733a31393a22757365722e617574682e6c6f676765642d696e223b693a313b693a313735393436363335383b7d693a313b613a323a7b693a303b733a32303a22757365722e617574682e636f6f6b69652d736574223b693a313b693a313735393436363335383b7d7d693a313b613a323a7b693a303b613a323a7b693a303b733a32333a22736974652e706c7567696e2e6465616374697661746564223b693a313b693a313735393339343338373b7d693a313b613a323a7b693a303b733a32333a22736974652e706c7567696e2e6465616374697661746564223b693a313b693a313735393339343338373b7d7d693a323b613a313a7b693a303b613a323a7b693a303b733a32333a22736974652e706c7567696e2e6465616374697661746564223b693a313b693a313735393339343136363b7d7d693a333b613a363a7b693a303b613a323a7b693a303b733a33343a22776f726466656e63652e626c6f636b696e672e636f756e7472792e75706461746564223b693a313b693a313735393339323133333b7d693a313b613a323a7b693a303b733a33343a22776f726466656e63652e626c6f636b696e672e636f756e7472792e75706461746564223b693a313b693a313735393339323133333b7d693a323b613a323a7b693a303b733a33343a22776f726466656e63652e626c6f636b696e672e636f756e7472792e75706461746564223b693a313b693a313735393339323133333b7d693a333b613a323a7b693a303b733a33343a22776f726466656e63652e626c6f636b696e672e636f756e7472792e75706461746564223b693a313b693a313735393339323133333b7d693a343b613a323a7b693a303b733a33343a22776f726466656e63652e626c6f636b696e672e636f756e7472792e75706461746564223b693a313b693a313735393339323133333b7d693a353b613a323a7b693a303b733a33343a22776f726466656e63652e626c6f636b696e672e636f756e7472792e75706461746564223b693a313b693a313735393339323133333b7d7d693a343b613a313a7b693a303b613a323a7b693a303b733a31363a22736974652e7570646174652e636f7265223b693a313b693a313735393339303732333b7d7d693a353b613a313a7b693a303b613a323a7b693a303b733a31383a22736974652e7570646174652e706c7567696e223b693a313b693a313735393339303632393b7d7d693a363b613a313a7b693a303b613a323a7b693a303b733a31383a22736974652e7570646174652e706c7567696e223b693a313b693a313735393339303538383b7d7d693a373b613a313a7b693a303b613a323a7b693a303b733a32333a22736974652e706c7567696e2e6465616374697661746564223b693a313b693a313735393339303534383b7d7d693a383b613a313a7b693a303b613a323a7b693a303b733a32313a22736974652e706c7567696e2e616374697661746564223b693a313b693a313735393339303032303b7d7d693a393b613a323a7b693a303b613a323a7b693a303b733a31393a22757365722e617574682e6c6f676765642d696e223b693a313b693a313735393338393738343b7d693a313b613a323a7b693a303b733a32303a22757365722e617574682e636f6f6b69652d736574223b693a313b693a313735393338393738343b7d7d693a31303b613a313a7b693a303b613a323a7b693a303b733a31393a22736974652e706c7567696e2e64656c65746564223b693a313b693a313735393337313531303b7d7d693a31313b613a313a7b693a303b613a323a7b693a303b733a32333a22736974652e706c7567696e2e6465616374697661746564223b693a313b693a313735393337313530363b7d7d693a31323b613a313a7b693a303b613a323a7b693a303b733a32313a22736974652e706c7567696e2e616374697661746564223b693a313b693a313735393336393532313b7d7d693a31333b613a313a7b693a303b613a323a7b693a303b733a32313a22736974652e706c7567696e2e696e7374616c6c6564223b693a313b693a313735393336393531363b7d7d693a31343b613a313a7b693a303b613a323a7b693a303b733a31393a22736974652e706c7567696e2e64656c65746564223b693a313b693a313735393336393438343b7d7d693a31353b613a313a7b693a303b613a323a7b693a303b733a31393a22736974652e706c7567696e2e64656c65746564223b693a313b693a313735393336393438323b7d7d693a31363b613a323a7b693a303b613a323a7b693a303b733a31393a22757365722e617574682e6c6f676765642d696e223b693a313b693a313735393336393436323b7d693a313b613a323a7b693a303b733a32303a22757365722e617574682e636f6f6b69652d736574223b693a313b693a313735393336393436323b7d7d693a31373b613a323a7b693a303b613a323a7b693a303b733a31393a22757365722e617574682e6c6f676765642d696e223b693a313b693a313735383835343637313b7d693a313b613a323a7b693a303b733a32303a22757365722e617574682e636f6f6b69652d736574223b693a313b693a313735383835343637313b7d7d693a31383b613a313a7b693a303b613a323a7b693a303b733a31383a22736974652e7570646174652e706c7567696e223b693a313b693a313735383738313838303b7d7d693a31393b613a313a7b693a303b613a323a7b693a303b733a31383a22736974652e7570646174652e706c7567696e223b693a313b693a313735383738313836373b7d7d7d, 'yes'),
('lastBlockAggregation', 0x31373539333639343533, 'yes'),
('lastDashboardCheck', 0x31373539333931373330, 'yes'),
('lastEmailHash', 0x313735393436363335383a3839373838376433653264626564663162623265313466336433643564336534, 'yes'),
('lastNotificationID', 0x39, 'no'),
('lastPermissionsTemplateCheck', 0x31373539343435353438, 'yes'),
('liveActivityPauseEnabled', 0x31, 'yes'),
('liveTrafficEnabled', 0x30, 'yes'),
('liveTraf_displayExpandedRecords', 0x30, 'yes'),
('liveTraf_ignoreIPs', '', 'yes'),
('liveTraf_ignorePublishers', 0x31, 'yes'),
('liveTraf_ignoreUA', '', 'yes'),
('liveTraf_ignoreUsers', '', 'yes'),
('liveTraf_maxAge', 0x3330, 'yes'),
('liveTraf_maxRows', 0x32303030, 'yes'),
('loginSecurityEnabled', 0x31, 'yes'),
('loginSec_blockAdminReg', 0x31, 'yes'),
('loginSec_breachPasswds', 0x61646d696e73, 'yes'),
('loginSec_breachPasswds_enabled', 0x31, 'yes'),
('loginSec_countFailMins', 0x35, 'yes'),
('loginSec_disableApplicationPasswords', 0x31, 'yes'),
('loginSec_disableAuthorScan', 0x31, 'yes'),
('loginSec_disableOEmbedAuthor', 0x30, 'yes'),
('loginSec_enableSeparateTwoFactor', 0x30, 'yes'),
('loginSec_lockInvalidUsers', 0x31, 'yes'),
('loginSec_lockoutMins', 0x3630, 'yes'),
('loginSec_maskLoginErrors', 0x31, 'yes'),
('loginSec_maxFailures', 0x35, 'yes'),
('loginSec_maxForgotPasswd', 0x35, 'yes'),
('loginSec_requireAdminTwoFactor', 0x30, 'yes'),
('loginSec_strongPasswds', 0x70756273, 'yes'),
('loginSec_strongPasswds_enabled', 0x31, 'yes'),
('loginSec_userBlacklist', '', 'yes'),
('longEncKey', 0x63313562376161346239663233313737346238323931386338336232336138383830363732653230626161363937353665623631623637633439393437383564, 'yes'),
('lowResourceScansEnabled', 0x30, 'yes'),
('manualScanType', 0x6f6e63654461696c79, 'yes'),
('max404Crawlers', 0x44495341424c4544, 'yes'),
('max404Crawlers_action', 0x7468726f74746c65, 'yes'),
('max404Humans', 0x44495341424c4544, 'yes'),
('max404Humans_action', 0x7468726f74746c65, 'yes'),
('maxExecutionTime', 0x30, 'yes'),
('maxGlobalRequests', 0x323430, 'yes'),
('maxGlobalRequests_action', 0x7468726f74746c65, 'yes'),
('maxMem', 0x323536, 'yes'),
('maxRequestsCrawlers', 0x313230, 'yes'),
('maxRequestsCrawlers_action', 0x7468726f74746c65, 'yes'),
('maxRequestsHumans', 0x44495341424c4544, 'yes'),
('maxRequestsHumans_action', 0x7468726f74746c65, 'yes'),
('migration636_email_summary_excluded_directories', 0x31, 'no'),
('needsNewTour_auditlog', 0x31, 'yes'),
('needsNewTour_blocking', 0x31, 'yes'),
('needsNewTour_dashboard', 0x30, 'yes'),
('needsNewTour_firewall', 0x31, 'yes'),
('needsNewTour_livetraffic', 0x31, 'yes'),
('needsNewTour_loginsecurity', 0x31, 'yes'),
('needsNewTour_scan', 0x31, 'yes'),
('needsUpgradeTour_auditlog', 0x30, 'yes'),
('needsUpgradeTour_blocking', 0x30, 'yes'),
('needsUpgradeTour_dashboard', 0x30, 'yes'),
('needsUpgradeTour_firewall', 0x30, 'yes'),
('needsUpgradeTour_livetraffic', 0x30, 'yes'),
('needsUpgradeTour_loginsecurity', 0x30, 'yes'),
('needsUpgradeTour_scan', 0x30, 'yes'),
('neverBlockBG', 0x6e65766572426c6f636b5665726966696564, 'yes'),
('notification_blogHighlights', 0x31, 'yes'),
('notification_productUpdates', 0x31, 'yes'),
('notification_promotions', 0x31, 'yes'),
('notification_scanStatus', 0x31, 'yes'),
('notification_securityAlerts', 0x31, 'yes'),
('notification_updatesNeeded', 0x31, 'yes'),
('onboardingAttempt1', 0x736b6970706564, 'yes'),
('onboardingAttempt2', '', 'no'),
('onboardingAttempt3', '', 'no'),
('onboardingAttempt3Initial', 0x31, 'yes'),
('onboardingDelayedAt', 0x31373538383535343238, 'yes'),
('onboardingLastVersion', '', 'no'),
('other_blockBadPOST', 0x30, 'yes'),
('other_bypassLitespeedNoabort', 0x30, 'yes'),
('other_hideWPVersion', '', 'yes'),
('other_pwStrengthOnUpdate', 0x31, 'yes'),
('other_scanComments', 0x31, 'yes'),
('other_scanOutside', 0x30, 'yes'),
('other_WFNet', 0x31, 'yes'),
('previousWflogsFileList', 0x5b2261747461636b2d646174612e706870222c2272756c65732e706870222c22636f6e6669672d6c6976657761662e706870222c22636f6e6669672d73796e6365642e706870222c22636f6e6669672e706870222c22636f6e6669672d7472616e7369656e742e706870222c2247656f4c697465322d436f756e7472792e6d6d6462222c2274656d706c6174652e706870222c226970732e706870222c222e6874616363657373225d, 'yes'),
('satisfactionPromptDismissed', 0x30, 'yes'),
('satisfactionPromptInstallDate', 0x31373533333434383033, 'yes'),
('satisfactionPromptOverride', 0x31, 'yes'),
('scanSched', 0x613a303a7b7d, 'yes'),
('scansEnabled_checkGSB', 0x31, 'yes'),
('scansEnabled_checkHowGetIPs', 0x31, 'yes'),
('scansEnabled_checkReadableConfig', 0x31, 'yes'),
('scansEnabled_comments', 0x31, 'yes'),
('scansEnabled_core', 0x31, 'yes'),
('scansEnabled_coreUnknown', 0x31, 'yes'),
('scansEnabled_diskSpace', 0x31, 'yes'),
('scansEnabled_fileContents', 0x31, 'yes'),
('scansEnabled_fileContentsGSB', 0x31, 'yes'),
('scansEnabled_geoipSupport', 0x31, 'yes'),
('scansEnabled_highSense', 0x30, 'yes'),
('scansEnabled_malware', 0x31, 'yes'),
('scansEnabled_oldVersions', 0x31, 'yes'),
('scansEnabled_options', 0x31, 'yes'),
('scansEnabled_passwds', 0x31, 'yes'),
('scansEnabled_plugins', 0x30, 'yes'),
('scansEnabled_posts', 0x31, 'yes'),
('scansEnabled_scanImages', 0x30, 'yes'),
('scansEnabled_suspectedFiles', 0x31, 'yes'),
('scansEnabled_suspiciousAdminUsers', 0x31, 'yes'),
('scansEnabled_suspiciousOptions', 0x31, 'yes'),
('scansEnabled_themes', 0x30, 'yes'),
('scansEnabled_wafStatus', 0x31, 'yes'),
('scansEnabled_wpscan_directoryListingEnabled', 0x31, 'yes'),
('scansEnabled_wpscan_fullPathDisclosure', 0x31, 'yes'),
('scanType', 0x7374616e64617264, 'yes'),
('scan_exclude', '', 'yes'),
('scan_force_ipv4_start', 0x30, 'yes'),
('scan_include_extra', '', 'yes'),
('scan_maxDuration', '', 'yes'),
('scan_maxIssues', 0x31303030, 'yes'),
('scan_max_resume_attempts', 0x32, 'yes'),
('schedMode', 0x6175746f, 'yes'),
('schedStartHour', 0x32, 'yes'),
('scheduledScansEnabled', 0x31, 'yes'),
('serverDNS', 0x313735393430343932383b31353b3132352e3233352e342e3539, 'yes'),
('showAdminBarMenu', 0x31, 'yes'),
('spamvertizeCheck', 0x31, 'yes'),
('ssl_verify', 0x31, 'yes'),
('startScansRemotely', 0x30, 'yes'),
('supportContent', 0x7b7d, 'no'),
('supportHash', '', 'no'),
('timeoffset_wf', 0x30, 'yes'),
('timeoffset_wf_updated', 0x31373539333931373330, 'yes'),
('totalAlertsSent', 0x32, 'yes'),
('totalLoginHits', 0x3234, 'yes'),
('totalLogins', 0x32, 'yes'),
('touppBypassNextCheck', 0x30, 'yes'),
('touppPromptNeeded', '', 'yes'),
('vulnerabilities_plugin', 0x613a31313a7b693a303b613a333a7b733a343a22736c7567223b733a31343a22636f6e746163742d666f726d2d37223b733a31313a2266726f6d56657273696f6e223b733a333a22362e31223b733a31303a2276756c6e657261626c65223b623a303b7d693a313b613a333a7b733a343a22736c7567223b733a31393a22656d6265642d6c6f747469652d706c61796572223b733a31313a2266726f6d56657273696f6e223b733a353a22312e322e30223b733a31303a2276756c6e657261626c65223b623a303b7d693a323b613a333a7b733a343a22736c7567223b733a33353a22656e61626c652d7669727475616c2d636172642d75706c6f61642d7663617264766366223b733a31313a2266726f6d56657273696f6e223b733a353a22322e332e30223b733a31303a2276756c6e657261626c65223b623a303b7d693a333b613a333a7b733a343a22736c7567223b733a31343a226c6f636f2d7472616e736c617465223b733a31313a2266726f6d56657273696f6e223b733a353a22322e382e30223b733a31303a2276756c6e657261626c65223b623a303b7d693a343b613a333a7b733a343a22736c7567223b733a31363a2273656f2d62792d72616e6b2d6d617468223b733a31313a2266726f6d56657273696f6e223b733a373a22312e302e323439223b733a31303a2276756c6e657261626c65223b623a303b7d693a353b613a333a7b733a343a22736c7567223b733a32333a227265616c2d6d656469612d6c6962726172792d6c697465223b733a31313a2266726f6d56657273696f6e223b733a373a22342e32322e3437223b733a31303a2276756c6e657261626c65223b623a303b7d693a363b613a333a7b733a343a22736c7567223b733a31313a227265646972656374696f6e223b733a31313a2266726f6d56657273696f6e223b733a353a22352e352e32223b733a31303a2276756c6e657261626c65223b623a303b7d693a373b613a333a7b733a343a22736c7567223b733a31323a227465616d2d73656374696f6e223b733a31313a2266726f6d56657273696f6e223b733a353a22312e312e30223b733a31303a2276756c6e657261626c65223b623a303b7d693a383b613a333a7b733a343a22736c7567223b733a393a22776f726466656e6365223b733a31313a2266726f6d56657273696f6e223b733a353a22382e302e35223b733a31303a2276756c6e657261626c65223b623a303b7d693a393b613a333a7b733a343a22736c7567223b733a31343a227770732d686964652d6c6f67696e223b733a31313a2266726f6d56657273696f6e223b733a383a22312e392e31372e32223b733a31303a2276756c6e657261626c65223b623a303b7d693a31303b613a333a7b733a343a22736c7567223b733a31323a22706f6c796c616e672d70726f223b733a31313a2266726f6d56657273696f6e223b733a353a22332e362e33223b733a31303a2276756c6e657261626c65223b623a303b7d7d, 'no'),
('wafAlertInterval', 0x363030, 'yes'),
('wafAlertOnAttacks', 0x31, 'yes'),
('wafAlertThreshold', 0x313030, 'yes'),
('wafAlertWhitelist', '', 'yes'),
('waf_status', 0x656e61626c6564, 'yes'),
('whitelisted', '', 'yes'),
('whitelistedServices', 0x7b7d, 'yes'),
('whitelistHash', '', 'no'),
('whitelistPresets', 0x7b7d, 'no'),
('wordfenceI18n', 0x31, 'yes'),
('wordpressPluginVersions', 0x613a393a7b733a31343a22636f6e746163742d666f726d2d37223b733a353a22362e312e32223b733a33353a22656e61626c652d7669727475616c2d636172642d75706c6f61642d7663617264766366223b733a353a22322e332e30223b733a31343a226c6f636f2d7472616e736c617465223b733a353a22322e382e30223b733a31323a22706f6c796c616e672d70726f223b733a353a22332e362e33223b733a31363a2273656f2d62792d72616e6b2d6d617468223b733a373a22312e302e323534223b733a31313a227265646972656374696f6e223b733a353a22352e352e32223b733a31323a227465616d2d73656374696f6e223b733a353a22312e312e30223b733a393a22776f726466656e6365223b733a353a22382e312e30223b733a31343a227770732d686964652d6c6f67696e223b733a383a22312e392e31372e32223b7d, 'yes'),
('wordpressThemeVersions', 0x613a313a7b733a31353a226d6f6f6d735f6465762f7468656d65223b733a333a22332e30223b7d, 'yes'),
('wordpressVersion', 0x362e382e32, 'yes'),
('wp_home_url', 0x687474703a2f2f6c6f63616c686f73743a38303830, 'yes'),
('wp_site_url', 0x687474703a2f2f6c6f63616c686f73743a38303830, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfcrawlers`
--

CREATE TABLE `wp_wfcrawlers` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `patternSig` binary(16) NOT NULL,
  `status` char(8) NOT NULL,
  `lastUpdate` int UNSIGNED NOT NULL,
  `PTR` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wffilechanges`
--

CREATE TABLE `wp_wffilechanges` (
  `filenameHash` char(64) NOT NULL,
  `file` varchar(1000) NOT NULL,
  `md5` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfFileMods`
--

CREATE TABLE `wp_wfFileMods` (
  `filenameMD5` binary(16) NOT NULL,
  `filename` varchar(1000) NOT NULL,
  `real_path` text NOT NULL,
  `knownFile` tinyint UNSIGNED NOT NULL,
  `oldMD5` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `newMD5` binary(16) NOT NULL,
  `SHAC` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `stoppedOnSignature` varchar(255) NOT NULL DEFAULT '',
  `stoppedOnPosition` int UNSIGNED NOT NULL DEFAULT '0',
  `isSafeFile` varchar(1) NOT NULL DEFAULT '?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfhits`
--

CREATE TABLE `wp_wfhits` (
  `id` int UNSIGNED NOT NULL,
  `attackLogTime` double(17,6) UNSIGNED NOT NULL,
  `ctime` double(17,6) UNSIGNED NOT NULL,
  `IP` binary(16) DEFAULT NULL,
  `jsRun` tinyint DEFAULT '0',
  `statusCode` int NOT NULL DEFAULT '200',
  `isGoogle` tinyint NOT NULL,
  `userID` int UNSIGNED NOT NULL,
  `newVisit` tinyint UNSIGNED NOT NULL,
  `URL` text,
  `referer` text,
  `UA` text,
  `action` varchar(64) NOT NULL DEFAULT '',
  `actionDescription` text,
  `actionData` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `wp_wfhits`
--

INSERT INTO `wp_wfhits` (`id`, `attackLogTime`, `ctime`, `IP`, `jsRun`, `statusCode`, `isGoogle`, `userID`, `newVisit`, `URL`, `referer`, `UA`, `action`, `actionDescription`, `actionData`) VALUES
(1, 0.000000, 1759389768.285966, 0x00000000000000000000ffffc0a84101, 0, 302, 0, 1, 0, 'http://localhost:8080/wp-login.php', 'http://localhost:8080/wp-login.php', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'loginOK', NULL, NULL),
(2, 0.000000, 1759466358.744935, 0x00000000000000000000ffffc0a84101, 0, 302, 0, 1, 0, 'http://localhost:8080/wp-login.php', 'http://localhost:8080/wp-login.php', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'loginOK', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfhoover`
--

CREATE TABLE `wp_wfhoover` (
  `id` int UNSIGNED NOT NULL,
  `owner` text,
  `host` text,
  `path` text,
  `hostKey` varbinary(124) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfissues`
--

CREATE TABLE `wp_wfissues` (
  `id` int UNSIGNED NOT NULL,
  `time` int UNSIGNED NOT NULL,
  `lastUpdated` int UNSIGNED NOT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `severity` tinyint UNSIGNED NOT NULL,
  `ignoreP` char(32) NOT NULL,
  `ignoreC` char(32) NOT NULL,
  `shortMsg` varchar(255) NOT NULL,
  `longMsg` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfknownfilelist`
--

CREATE TABLE `wp_wfknownfilelist` (
  `id` int UNSIGNED NOT NULL,
  `path` text NOT NULL,
  `wordpress_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wflivetraffichuman`
--

CREATE TABLE `wp_wflivetraffichuman` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `identifier` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `expiration` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wflocs`
--

CREATE TABLE `wp_wflocs` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ctime` int UNSIGNED NOT NULL,
  `failed` tinyint UNSIGNED NOT NULL,
  `city` varchar(255) DEFAULT '',
  `region` varchar(255) DEFAULT '',
  `countryName` varchar(255) DEFAULT '',
  `countryCode` char(2) DEFAULT '',
  `lat` float(10,7) DEFAULT '0.0000000',
  `lon` float(10,7) DEFAULT '0.0000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `wp_wflocs`
--

INSERT INTO `wp_wflocs` (`IP`, `ctime`, `failed`, `city`, `region`, `countryName`, `countryCode`, `lat`, `lon`) VALUES
(0x00000000000000000000ffffc0a84101, 1759392009, 1, '', '', '', '', 0.0000000, 0.0000000);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wflogins`
--

CREATE TABLE `wp_wflogins` (
  `id` int UNSIGNED NOT NULL,
  `hitID` int DEFAULT NULL,
  `ctime` double(17,6) UNSIGNED NOT NULL,
  `fail` tinyint UNSIGNED NOT NULL,
  `action` varchar(40) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userID` int UNSIGNED NOT NULL,
  `IP` binary(16) DEFAULT NULL,
  `UA` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `wp_wflogins`
--

INSERT INTO `wp_wflogins` (`id`, `hitID`, `ctime`, `fail`, `action`, `username`, `userID`, `IP`, `UA`) VALUES
(1, 1, 1759389784.518710, 0, 'loginOK', 'aiot', 1, 0x00000000000000000000ffffc0a84101, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(2, 2, 1759466358.866501, 0, 'loginOK', 'aiot', 1, 0x00000000000000000000ffffc0a84101, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfls_2fa_secrets`
--

CREATE TABLE `wp_wfls_2fa_secrets` (
  `id` int UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `secret` tinyblob NOT NULL,
  `recovery` blob NOT NULL,
  `ctime` int UNSIGNED NOT NULL,
  `vtime` int UNSIGNED NOT NULL,
  `mode` enum('authenticator') NOT NULL DEFAULT 'authenticator'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfls_role_counts`
--

CREATE TABLE `wp_wfls_role_counts` (
  `serialized_roles` varbinary(255) NOT NULL,
  `two_factor_inactive` tinyint(1) NOT NULL,
  `user_count` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfls_settings`
--

CREATE TABLE `wp_wfls_settings` (
  `name` varchar(191) NOT NULL DEFAULT '',
  `value` longblob,
  `autoload` enum('no','yes') NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `wp_wfls_settings`
--

INSERT INTO `wp_wfls_settings` (`name`, `value`, `autoload`) VALUES
('2fa-user-grace-period', 0x3130, 'yes'),
('allow-disabling-ntp', 0x31, 'yes'),
('allow-xml-rpc', 0x31, 'yes'),
('captcha-stats', 0x7b22636f756e7473223a5b302c302c302c302c302c302c302c302c302c302c305d2c22617667223a307d, 'yes'),
('delete-deactivation', '', 'yes'),
('disable-temporary-tables', 0x30, 'yes'),
('enable-auth-captcha', '', 'yes'),
('enable-login-history-columns', 0x31, 'yes'),
('enable-shortcode', '', 'yes'),
('enable-woocommerce-account-integration', '', 'yes'),
('enable-woocommerce-integration', '', 'yes'),
('global-notices', 0x5b5d, 'yes'),
('ip-source', '', 'yes'),
('ip-trusted-proxies', '', 'yes'),
('last-secret-refresh', 0x31373533333434383033, 'yes'),
('ntp-failure-count', 0x33, 'yes'),
('ntp-offset', 0x30, 'yes'),
('recaptcha-threshold', 0x302e35, 'yes'),
('remember-device', '', 'yes'),
('remember-device-duration', 0x32353932303030, 'yes'),
('require-2fa-grace-period-enabled', '', 'yes'),
('require-2fa.administrator', '', 'yes'),
('schema-version', 0x32, 'yes'),
('shared-hash-secret', 0x32663261316537633362383333336234353832323836623266626635326535656466393432623437336236636636326665386264376239663066313430386536, 'yes'),
('shared-symmetric-secret', 0x66386262313664386132616161623664386636333235376337626536633063336630616236376535663837366631383635613235663235616135333461386438, 'yes'),
('stack-ui-columns', 0x31, 'yes'),
('use-ntp', '', 'yes'),
('user-count-query-state', 0x30, 'yes'),
('whitelisted', '', 'yes'),
('xmlrpc-enabled', 0x31, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfnotifications`
--

CREATE TABLE `wp_wfnotifications` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `new` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `category` varchar(255) NOT NULL,
  `priority` int NOT NULL DEFAULT '1000',
  `ctime` int UNSIGNED NOT NULL,
  `html` text NOT NULL,
  `links` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `wp_wfnotifications`
--

INSERT INTO `wp_wfnotifications` (`id`, `new`, `category`, `priority`, `ctime`, `html`, `links`) VALUES
('site-AEAAAAA', 0, 'wfplugin_updates', 502, 1758781409, '<a href=\"http://aiot-fixing.local/wp-admin/update-core.php\">An update is available for 4 plugins</a>', '[]'),
('site-AMAAAAA', 0, 'wfplugin_updates', 502, 1758781869, '<a href=\"http://aiot-fixing.local/wp-admin/update-core.php\">An update is available for 1 plugin</a>', '[]'),
('site-AUAAAAA', 1, 'wfplugin_updates', 502, 1759390636, '<a href=\"http://localhost:8080/wp-admin/update-core.php\">An update is available for WordPress (v6.8.3)</a>', '[]'),
('site-AYAAAAA', 1, 'wfplugin_updates', 502, 1759369454, '<a href=\"http://aiot-fixing.local/wp-admin/update-core.php\">An update is available for WordPress (v6.8.3)</a>', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfpendingissues`
--

CREATE TABLE `wp_wfpendingissues` (
  `id` int UNSIGNED NOT NULL,
  `time` int UNSIGNED NOT NULL,
  `lastUpdated` int UNSIGNED NOT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `severity` tinyint UNSIGNED NOT NULL,
  `ignoreP` char(32) NOT NULL,
  `ignoreC` char(32) NOT NULL,
  `shortMsg` varchar(255) NOT NULL,
  `longMsg` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfreversecache`
--

CREATE TABLE `wp_wfreversecache` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `host` varchar(255) NOT NULL,
  `lastUpdate` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `wp_wfreversecache`
--

INSERT INTO `wp_wfreversecache` (`IP`, `host`, `lastUpdate`) VALUES
(0x00000000000000000000ffffc0a84101, '192.168.65.1', 1759466358);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfsecurityevents`
--

CREATE TABLE `wp_wfsecurityevents` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `event_time` double(14,4) NOT NULL,
  `state` enum('new','sending','sent') NOT NULL DEFAULT 'new',
  `state_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfsnipcache`
--

CREATE TABLE `wp_wfsnipcache` (
  `id` int UNSIGNED NOT NULL,
  `IP` varchar(45) NOT NULL DEFAULT '',
  `expiration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `body` varchar(255) NOT NULL DEFAULT '',
  `count` int UNSIGNED NOT NULL DEFAULT '0',
  `type` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfstatus`
--

CREATE TABLE `wp_wfstatus` (
  `id` bigint UNSIGNED NOT NULL,
  `ctime` double(17,6) UNSIGNED NOT NULL,
  `level` tinyint UNSIGNED NOT NULL,
  `type` char(5) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `wp_wfstatus`
--

INSERT INTO `wp_wfstatus` (`id`, `ctime`, `level`, `type`, `msg`) VALUES
(1, 1759391731.473881, 2, 'error', 'Call to Wordfence API to resolve IPs failed: Wordfence API error: Your site did not send an API key when contacting the Wordfence servers.');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wftrafficrates`
--

CREATE TABLE `wp_wftrafficrates` (
  `eMin` int UNSIGNED NOT NULL,
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `hitType` enum('hit','404') NOT NULL DEFAULT 'hit',
  `hits` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wfwaffailures`
--

CREATE TABLE `wp_wfwaffailures` (
  `id` int UNSIGNED NOT NULL,
  `throwable` text NOT NULL,
  `rule_id` int UNSIGNED DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wpdbbkp_processed_files`
--

CREATE TABLE `wp_wpdbbkp_processed_files` (
  `id` mediumint NOT NULL,
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `processed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('added','updated','deleted') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'added'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook_status_scheduled_date_gmt` (`hook`(163),`status`,`scheduled_date_gmt`),
  ADD KEY `status_scheduled_date_gmt` (`status`,`scheduled_date_gmt`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id_status_scheduled_date_gmt` (`claim_id`,`status`,`scheduled_date_gmt`),
  ADD KEY `claim_id_status_priority_scheduled_date_gmt` (`claim_id`,`status`,`priority`,`scheduled_date_gmt`),
  ADD KEY `status_last_attempt_gmt` (`status`,`last_attempt_gmt`),
  ADD KEY `status_claim_id` (`status`,`claim_id`);

--
-- Indexes for table `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Indexes for table `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Indexes for table `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_rank_math_analytics_gsc`
--
ALTER TABLE `wp_rank_math_analytics_gsc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytics_query` (`query`(190)),
  ADD KEY `analytics_page` (`page`(190)),
  ADD KEY `clicks` (`clicks`),
  ADD KEY `rank_position` (`position`);

--
-- Indexes for table `wp_rank_math_analytics_inspections`
--
ALTER TABLE `wp_rank_math_analytics_inspections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytics_object_page` (`page`(190)),
  ADD KEY `created` (`created`),
  ADD KEY `index_verdict` (`index_verdict`),
  ADD KEY `page_fetch_state` (`page_fetch_state`),
  ADD KEY `robots_txt_state` (`robots_txt_state`),
  ADD KEY `rich_results_verdict` (`rich_results_verdict`);

--
-- Indexes for table `wp_rank_math_analytics_objects`
--
ALTER TABLE `wp_rank_math_analytics_objects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytics_object_page` (`page`(190));

--
-- Indexes for table `wp_rank_math_internal_links`
--
ALTER TABLE `wp_rank_math_internal_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_direction` (`post_id`,`type`),
  ADD KEY `target_post_id` (`target_post_id`);

--
-- Indexes for table `wp_rank_math_internal_meta`
--
ALTER TABLE `wp_rank_math_internal_meta`
  ADD PRIMARY KEY (`object_id`);

--
-- Indexes for table `wp_realmedialibrary`
--
ALTER TABLE `wp_realmedialibrary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_realmedialibrary_meta`
--
ALTER TABLE `wp_realmedialibrary_meta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `realmedialibrary_id` (`realmedialibrary_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_realmedialibrary_posts`
--
ALTER TABLE `wp_realmedialibrary_posts`
  ADD PRIMARY KEY (`attachment`,`isShortcut`),
  ADD KEY `rmljoin` (`attachment`,`fid`);

--
-- Indexes for table `wp_realmedialibrary_tmp`
--
ALTER TABLE `wp_realmedialibrary_tmp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_redirection_404`
--
ALTER TABLE `wp_redirection_404`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `referrer` (`referrer`(191)),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `wp_redirection_groups`
--
ALTER TABLE `wp_redirection_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wp_redirection_items`
--
ALTER TABLE `wp_redirection_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `regex` (`regex`),
  ADD KEY `group_idpos` (`group_id`,`position`),
  ADD KEY `group` (`group_id`),
  ADD KEY `match_url` (`match_url`(191));

--
-- Indexes for table `wp_redirection_logs`
--
ALTER TABLE `wp_redirection_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `redirection_id` (`redirection_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `wp_wfauditevents`
--
ALTER TABLE `wp_wfauditevents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wfblockediplog`
--
ALTER TABLE `wp_wfblockediplog`
  ADD PRIMARY KEY (`IP`,`unixday`,`blockType`);

--
-- Indexes for table `wp_wfblocks7`
--
ALTER TABLE `wp_wfblocks7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `IP` (`IP`),
  ADD KEY `expiration` (`expiration`);

--
-- Indexes for table `wp_wfconfig`
--
ALTER TABLE `wp_wfconfig`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `wp_wfcrawlers`
--
ALTER TABLE `wp_wfcrawlers`
  ADD PRIMARY KEY (`IP`,`patternSig`);

--
-- Indexes for table `wp_wffilechanges`
--
ALTER TABLE `wp_wffilechanges`
  ADD PRIMARY KEY (`filenameHash`);

--
-- Indexes for table `wp_wfFileMods`
--
ALTER TABLE `wp_wfFileMods`
  ADD PRIMARY KEY (`filenameMD5`);

--
-- Indexes for table `wp_wfhits`
--
ALTER TABLE `wp_wfhits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k1` (`ctime`),
  ADD KEY `k2` (`IP`,`ctime`),
  ADD KEY `attackLogTime` (`attackLogTime`);

--
-- Indexes for table `wp_wfhoover`
--
ALTER TABLE `wp_wfhoover`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k2` (`hostKey`);

--
-- Indexes for table `wp_wfissues`
--
ALTER TABLE `wp_wfissues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lastUpdated` (`lastUpdated`),
  ADD KEY `status` (`status`),
  ADD KEY `ignoreP` (`ignoreP`),
  ADD KEY `ignoreC` (`ignoreC`);

--
-- Indexes for table `wp_wfknownfilelist`
--
ALTER TABLE `wp_wfknownfilelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wflivetraffichuman`
--
ALTER TABLE `wp_wflivetraffichuman`
  ADD PRIMARY KEY (`IP`,`identifier`),
  ADD KEY `expiration` (`expiration`);

--
-- Indexes for table `wp_wflocs`
--
ALTER TABLE `wp_wflocs`
  ADD PRIMARY KEY (`IP`);

--
-- Indexes for table `wp_wflogins`
--
ALTER TABLE `wp_wflogins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k1` (`IP`,`fail`),
  ADD KEY `hitID` (`hitID`);

--
-- Indexes for table `wp_wfls_2fa_secrets`
--
ALTER TABLE `wp_wfls_2fa_secrets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_wfls_role_counts`
--
ALTER TABLE `wp_wfls_role_counts`
  ADD PRIMARY KEY (`serialized_roles`,`two_factor_inactive`);

--
-- Indexes for table `wp_wfls_settings`
--
ALTER TABLE `wp_wfls_settings`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `wp_wfnotifications`
--
ALTER TABLE `wp_wfnotifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wfpendingissues`
--
ALTER TABLE `wp_wfpendingissues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lastUpdated` (`lastUpdated`),
  ADD KEY `status` (`status`),
  ADD KEY `ignoreP` (`ignoreP`),
  ADD KEY `ignoreC` (`ignoreC`);

--
-- Indexes for table `wp_wfreversecache`
--
ALTER TABLE `wp_wfreversecache`
  ADD PRIMARY KEY (`IP`);

--
-- Indexes for table `wp_wfsecurityevents`
--
ALTER TABLE `wp_wfsecurityevents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wfsnipcache`
--
ALTER TABLE `wp_wfsnipcache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expiration` (`expiration`),
  ADD KEY `IP` (`IP`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `wp_wfstatus`
--
ALTER TABLE `wp_wfstatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k1` (`ctime`),
  ADD KEY `k2` (`type`);

--
-- Indexes for table `wp_wftrafficrates`
--
ALTER TABLE `wp_wftrafficrates`
  ADD PRIMARY KEY (`eMin`,`IP`,`hitType`);

--
-- Indexes for table `wp_wfwaffailures`
--
ALTER TABLE `wp_wfwaffailures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wpdbbkp_processed_files`
--
ALTER TABLE `wp_wpdbbkp_processed_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_path` (`file_path`(250));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  MODIFY `action_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  MODIFY `claim_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  MODIFY `group_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  MODIFY `log_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157037;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1690;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=836;

--
-- AUTO_INCREMENT for table `wp_rank_math_analytics_gsc`
--
ALTER TABLE `wp_rank_math_analytics_gsc`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_rank_math_analytics_inspections`
--
ALTER TABLE `wp_rank_math_analytics_inspections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_rank_math_analytics_objects`
--
ALTER TABLE `wp_rank_math_analytics_objects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wp_rank_math_internal_links`
--
ALTER TABLE `wp_rank_math_internal_links`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1349;

--
-- AUTO_INCREMENT for table `wp_realmedialibrary`
--
ALTER TABLE `wp_realmedialibrary`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_realmedialibrary_meta`
--
ALTER TABLE `wp_realmedialibrary_meta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_realmedialibrary_tmp`
--
ALTER TABLE `wp_realmedialibrary_tmp`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_redirection_404`
--
ALTER TABLE `wp_redirection_404`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_redirection_groups`
--
ALTER TABLE `wp_redirection_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_redirection_items`
--
ALTER TABLE `wp_redirection_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wp_redirection_logs`
--
ALTER TABLE `wp_redirection_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_wfauditevents`
--
ALTER TABLE `wp_wfauditevents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfblocks7`
--
ALTER TABLE `wp_wfblocks7`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfhits`
--
ALTER TABLE `wp_wfhits`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_wfhoover`
--
ALTER TABLE `wp_wfhoover`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfissues`
--
ALTER TABLE `wp_wfissues`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfknownfilelist`
--
ALTER TABLE `wp_wfknownfilelist`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wflogins`
--
ALTER TABLE `wp_wflogins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_wfls_2fa_secrets`
--
ALTER TABLE `wp_wfls_2fa_secrets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfpendingissues`
--
ALTER TABLE `wp_wfpendingissues`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfsecurityevents`
--
ALTER TABLE `wp_wfsecurityevents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfsnipcache`
--
ALTER TABLE `wp_wfsnipcache`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wfstatus`
--
ALTER TABLE `wp_wfstatus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_wfwaffailures`
--
ALTER TABLE `wp_wfwaffailures`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wpdbbkp_processed_files`
--
ALTER TABLE `wp_wpdbbkp_processed_files`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
