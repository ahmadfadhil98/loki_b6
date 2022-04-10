-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for loki
CREATE DATABASE IF NOT EXISTS `loki` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `loki`;

-- Dumping structure for table loki.courses
CREATE TABLE IF NOT EXISTS `courses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `curriculum_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias_name` text COLLATE utf8mb4_unicode_ci,
  `credit` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_curriculum_id_foreign` (`curriculum_id`),
  CONSTRAINT `courses_curriculum_id_foreign` FOREIGN KEY (`curriculum_id`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.courses: ~0 rows (approximately)
DELETE FROM `courses`;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;

-- Dumping structure for table loki.course_los
CREATE TABLE IF NOT EXISTS `course_los` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_plan_id` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_los_course_plan_id_foreign` (`course_plan_id`),
  KEY `course_los_parent_id_foreign` (`parent_id`),
  CONSTRAINT `course_los_course_plan_id_foreign` FOREIGN KEY (`course_plan_id`) REFERENCES `course_plans` (`id`),
  CONSTRAINT `course_los_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `course_los` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_los: ~0 rows (approximately)
DELETE FROM `course_los`;
/*!40000 ALTER TABLE `course_los` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_los` ENABLE KEYS */;

-- Dumping structure for table loki.course_lo_details
CREATE TABLE IF NOT EXISTS `course_lo_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `curriculum_lo_id` bigint(20) unsigned NOT NULL,
  `course_lo_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_lo_details_curriculum_lo_id_foreign` (`curriculum_lo_id`),
  KEY `course_lo_details_course_lo_id_foreign` (`course_lo_id`),
  CONSTRAINT `course_lo_details_course_lo_id_foreign` FOREIGN KEY (`course_lo_id`) REFERENCES `course_los` (`id`),
  CONSTRAINT `course_lo_details_curriculum_lo_id_foreign` FOREIGN KEY (`curriculum_lo_id`) REFERENCES `curriculum_los` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_lo_details: ~0 rows (approximately)
DELETE FROM `course_lo_details`;
/*!40000 ALTER TABLE `course_lo_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_lo_details` ENABLE KEYS */;

-- Dumping structure for table loki.course_plans
CREATE TABLE IF NOT EXISTS `course_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned NOT NULL,
  `rev` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias_name` text COLLATE utf8mb4_unicode_ci,
  `credit` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `material` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `validated_by` bigint(20) unsigned DEFAULT NULL,
  `validated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_plans_course_id_foreign` (`course_id`),
  KEY `course_plans_created_by_foreign` (`created_by`),
  KEY `course_plans_validated_by_foreign` (`validated_by`),
  CONSTRAINT `course_plans_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `course_plans_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `created_bies` (`id`),
  CONSTRAINT `course_plans_validated_by_foreign` FOREIGN KEY (`validated_by`) REFERENCES `validated_bies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_plans: ~0 rows (approximately)
DELETE FROM `course_plans`;
/*!40000 ALTER TABLE `course_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_plans` ENABLE KEYS */;

-- Dumping structure for table loki.course_plan_assessments
CREATE TABLE IF NOT EXISTS `course_plan_assessments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_plan_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `flag` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_plan_assessments_course_plan_id_foreign` (`course_plan_id`),
  CONSTRAINT `course_plan_assessments_course_plan_id_foreign` FOREIGN KEY (`course_plan_id`) REFERENCES `course_plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_plan_assessments: ~0 rows (approximately)
DELETE FROM `course_plan_assessments`;
/*!40000 ALTER TABLE `course_plan_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_plan_assessments` ENABLE KEYS */;

-- Dumping structure for table loki.course_plan_details
CREATE TABLE IF NOT EXISTS `course_plan_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_plan_id` bigint(20) unsigned NOT NULL,
  `week` int(11) NOT NULL,
  `material` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_experience` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_plan_details_course_plan_id_foreign` (`course_plan_id`),
  CONSTRAINT `course_plan_details_course_plan_id_foreign` FOREIGN KEY (`course_plan_id`) REFERENCES `course_plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_plan_details: ~0 rows (approximately)
DELETE FROM `course_plan_details`;
/*!40000 ALTER TABLE `course_plan_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_plan_details` ENABLE KEYS */;

-- Dumping structure for table loki.course_plan_detail_assessments
CREATE TABLE IF NOT EXISTS `course_plan_detail_assessments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_plan_detail_id` bigint(20) unsigned NOT NULL,
  `course_plan_assessment_id` bigint(20) unsigned NOT NULL,
  `percentage` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_plan_detail_assessments_course_plan_detail_id_foreign` (`course_plan_detail_id`),
  KEY `course_plan_detail_assessments_course_plan_assessment_id_foreign` (`course_plan_assessment_id`),
  CONSTRAINT `course_plan_detail_assessments_course_plan_assessment_id_foreign` FOREIGN KEY (`course_plan_assessment_id`) REFERENCES `course_plan_assessments` (`id`),
  CONSTRAINT `course_plan_detail_assessments_course_plan_detail_id_foreign` FOREIGN KEY (`course_plan_detail_id`) REFERENCES `course_plan_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_plan_detail_assessments: ~0 rows (approximately)
DELETE FROM `course_plan_detail_assessments`;
/*!40000 ALTER TABLE `course_plan_detail_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_plan_detail_assessments` ENABLE KEYS */;

-- Dumping structure for table loki.course_plan_detail_outcomes
CREATE TABLE IF NOT EXISTS `course_plan_detail_outcomes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_plan_detail_id` bigint(20) unsigned NOT NULL,
  `course_lo_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_plan_detail_outcomes_course_plan_detail_id_foreign` (`course_plan_detail_id`),
  KEY `course_plan_detail_outcomes_course_lo_id_foreign` (`course_lo_id`),
  CONSTRAINT `course_plan_detail_outcomes_course_lo_id_foreign` FOREIGN KEY (`course_lo_id`) REFERENCES `course_los` (`id`),
  CONSTRAINT `course_plan_detail_outcomes_course_plan_detail_id_foreign` FOREIGN KEY (`course_plan_detail_id`) REFERENCES `course_plan_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_plan_detail_outcomes: ~0 rows (approximately)
DELETE FROM `course_plan_detail_outcomes`;
/*!40000 ALTER TABLE `course_plan_detail_outcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_plan_detail_outcomes` ENABLE KEYS */;

-- Dumping structure for table loki.course_plan_detail_refs
CREATE TABLE IF NOT EXISTS `course_plan_detail_refs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_plan_detail_id` bigint(20) unsigned NOT NULL,
  `course_plan_reference_id` bigint(20) unsigned NOT NULL,
  `category` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_plan_detail_refs_course_plan_detail_id_foreign` (`course_plan_detail_id`),
  KEY `course_plan_detail_refs_course_plan_reference_id_foreign` (`course_plan_reference_id`),
  CONSTRAINT `course_plan_detail_refs_course_plan_detail_id_foreign` FOREIGN KEY (`course_plan_detail_id`) REFERENCES `course_plan_details` (`id`),
  CONSTRAINT `course_plan_detail_refs_course_plan_reference_id_foreign` FOREIGN KEY (`course_plan_reference_id`) REFERENCES `course_plan_references` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_plan_detail_refs: ~0 rows (approximately)
DELETE FROM `course_plan_detail_refs`;
/*!40000 ALTER TABLE `course_plan_detail_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_plan_detail_refs` ENABLE KEYS */;

-- Dumping structure for table loki.course_plan_lecturers
CREATE TABLE IF NOT EXISTS `course_plan_lecturers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_plan_id` bigint(20) unsigned NOT NULL,
  `lecturer_id` bigint(20) unsigned NOT NULL,
  `creator` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_plan_lecturers_course_plan_id_foreign` (`course_plan_id`),
  KEY `course_plan_lecturers_lecturer_id_foreign` (`lecturer_id`),
  CONSTRAINT `course_plan_lecturers_course_plan_id_foreign` FOREIGN KEY (`course_plan_id`) REFERENCES `course_plans` (`id`),
  CONSTRAINT `course_plan_lecturers_lecturer_id_foreign` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_plan_lecturers: ~0 rows (approximately)
DELETE FROM `course_plan_lecturers`;
/*!40000 ALTER TABLE `course_plan_lecturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_plan_lecturers` ENABLE KEYS */;

-- Dumping structure for table loki.course_plan_references
CREATE TABLE IF NOT EXISTS `course_plan_references` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_plan_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_plan_references_course_plan_id_foreign` (`course_plan_id`),
  CONSTRAINT `course_plan_references_course_plan_id_foreign` FOREIGN KEY (`course_plan_id`) REFERENCES `course_plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_plan_references: ~0 rows (approximately)
DELETE FROM `course_plan_references`;
/*!40000 ALTER TABLE `course_plan_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_plan_references` ENABLE KEYS */;

-- Dumping structure for table loki.course_requirements
CREATE TABLE IF NOT EXISTS `course_requirements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned NOT NULL,
  `required_course_id` bigint(20) unsigned NOT NULL,
  `required_level` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_requirements_course_id_foreign` (`course_id`),
  KEY `course_requirements_required_course_id_foreign` (`required_course_id`),
  CONSTRAINT `course_requirements_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `course_requirements_required_course_id_foreign` FOREIGN KEY (`required_course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.course_requirements: ~0 rows (approximately)
DELETE FROM `course_requirements`;
/*!40000 ALTER TABLE `course_requirements` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_requirements` ENABLE KEYS */;

-- Dumping structure for table loki.curricula
CREATE TABLE IF NOT EXISTS `curricula` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_start` int(11) NOT NULL,
  `year_end` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.curricula: ~0 rows (approximately)
DELETE FROM `curricula`;
/*!40000 ALTER TABLE `curricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `curricula` ENABLE KEYS */;

-- Dumping structure for table loki.curriculum_los
CREATE TABLE IF NOT EXISTS `curriculum_los` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `curriculum_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curriculum_los_curriculum_id_foreign` (`curriculum_id`),
  CONSTRAINT `curriculum_los_curriculum_id_foreign` FOREIGN KEY (`curriculum_id`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.curriculum_los: ~0 rows (approximately)
DELETE FROM `curriculum_los`;
/*!40000 ALTER TABLE `curriculum_los` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum_los` ENABLE KEYS */;

-- Dumping structure for table loki.curriculum_profiles
CREATE TABLE IF NOT EXISTS `curriculum_profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `curriculum_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curriculum_profiles_curriculum_id_foreign` (`curriculum_id`),
  CONSTRAINT `curriculum_profiles_curriculum_id_foreign` FOREIGN KEY (`curriculum_id`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.curriculum_profiles: ~0 rows (approximately)
DELETE FROM `curriculum_profiles`;
/*!40000 ALTER TABLE `curriculum_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum_profiles` ENABLE KEYS */;

-- Dumping structure for table loki.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table loki.lecturers
CREATE TABLE IF NOT EXISTS `lecturers` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `lecturers_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.lecturers: ~0 rows (approximately)
DELETE FROM `lecturers`;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` (`id`, `name`, `reg_id`, `phone`, `status`, `created_at`, `updated_at`) VALUES
	(2, 'Husnil Kamil', '198201182008121002', '081363491004', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(3, 'Hasdi Putra', '198307272008121003', '081363390627', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(4, 'Fajril Akbar', '198001102008121002', '085220229350', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(5, 'Surya Afnarius', '196404091995121001', '081210232425', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(6, 'Meza Silvana', '198103252008122003', '081363310161', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(7, 'Ricky Akbar', '198410062012121001', '085263098489', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(8, 'Haris Suryamen', '197503232012121001', '081366387648', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(9, 'Wahyudi', '198105052014041001', '085271869761', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(547, 'Alizar Hasan', '195312181980031002', '-', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(548, 'Syafii', '197405051998021001', '-', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(550, 'Hafid Yoza Putra', '1308051406930001', '-', 4, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(551, 'Rahmatika Pratama Santi', '1371085508930003', '-', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(552, 'Difana Meilani', '198005252005012005', '081317044255', 3, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(553, 'Darwison', '196409141995121001', '-', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(554, 'Rahmat Hidayat', '197804152000121002', '-', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(555, 'Darmawan', '197708162005011002', '-', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(559, 'Jefril Rahmadoni', '198904152019031009', '085278911989', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(560, 'Afriyanti Dwi Kartika', '198904212019032024', '081363592144', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(561, 'Ullya Mega Wahyuni', '199011032019032008', '082388776117', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(562, 'Dwi Welly Sukma Nirad', '199108122019032018', '087792350245', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(563, 'Adi Arga Arifnur', '199208202019031005', '083181528152', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(564, 'Hafizah Hanim', '199309292019032022', '082385912660', 1, '2022-03-25 07:43:20', '2022-03-25 07:43:20');
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;

-- Dumping structure for table loki.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.migrations: ~8 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2021_03_18_154920_create_permission_tables', 1),
	(5, '2022_03_02_205828_create_lecturers_table', 1),
	(6, '2022_03_02_205829_create_curricula_table', 1),
	(7, '2022_03_02_205830_create_curriculum_profiles_table', 1),
	(8, '2022_03_02_205831_create_curriculum_los_table', 1),
	(9, '2022_03_02_205832_create_courses_table', 1),
	(10, '2022_03_02_205833_create_course_requirements_table', 1),
	(11, '2022_03_02_205834_create_course_plans_table', 1),
	(12, '2022_03_02_205835_create_course_plan_references_table', 1),
	(13, '2022_03_02_205836_create_course_plan_assessments_table', 1),
	(14, '2022_03_02_205837_create_course_plan_details_table', 1),
	(15, '2022_03_02_205838_create_course_los_table', 1),
	(16, '2022_03_02_205839_create_course_lo_details_table', 1),
	(17, '2022_03_02_205840_create_course_plan_detail_outcomes_table', 1),
	(18, '2022_03_02_205841_create_course_plan_detail_refs_table', 1),
	(19, '2022_03_02_205842_create_course_plan_detail_assessments_table', 1),
	(20, '2022_03_02_205843_create_course_plan_lecturers_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table loki.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table loki.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.model_has_roles: ~0 rows (approximately)
DELETE FROM `model_has_roles`;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table loki.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table loki.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.permissions: ~0 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table loki.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.roles: ~0 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table loki.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.role_has_permissions: ~0 rows (approximately)
DELETE FROM `role_has_permissions`;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table loki.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('M','D','T') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table loki.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `type`, `created_at`, `updated_at`) VALUES
	(2, 'Husnil Kamil', '198201182008121002@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(3, 'Hasdi Putra', '198307272008121003@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(4, 'Fajril Akbar', '198001102008121002@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(5, 'Surya Afnarius', '196404091995121001@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(6, 'Meza Silvana', '198103252008122003@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(7, 'Ricky Akbar', '198410062012121001@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(8, 'Haris Suryamen', '197503232012121001@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(9, 'Wahyudi', '198105052014041001@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(547, 'Alizar Hasan', '195312181980031002@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(548, 'Syafii', '197405051998021001@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(550, 'Hafid Yoza Putra', '1308051406930001@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(551, 'Rahmatika Pratama Santi', '1371085508930003@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(552, 'Difana Meilani', '198005252005012005@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(553, 'Darwison', '196409141995121001@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(554, 'Rahmat Hidayat', '197804152000121002@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(555, 'Darmawan', '197708162005011002@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(559, 'Jefril Rahmadoni', '198904152019031009@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(560, 'Afriyanti Dwi Kartika', '198904212019032024@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(561, 'Ullya Mega Wahyuni', '199011032019032008@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(562, 'Dwi Welly Sukma Nirad', '199108122019032018@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(563, 'Adi Arga Arifnur', '199208202019031005@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20'),
	(564, 'Hafizah Hanim', '199309292019032022@unand.ac.id', NULL, '12345', NULL, 'D', '2022-03-25 07:43:20', '2022-03-25 07:43:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
