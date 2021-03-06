-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `classbooks`;
CREATE TABLE `classbooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `ocenka` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `lesson_id` (`lesson_id`),
  CONSTRAINT `classbooks_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  CONSTRAINT `classbooks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `genders`;
CREATE TABLE `genders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(45) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `genders` (`id`, `gender`, `desc`, `created_at`, `updated_at`) VALUES
(1,	'Male',	' normal man',	NULL,	NULL),
(2,	'Female',	'normal women',	NULL,	NULL),
(3,	'Gay',	'wrong men',	NULL,	NULL),
(4,	'Lesbian',	'wrong women',	NULL,	NULL),
(5,	'bisexual',	'WTF?',	NULL,	NULL),
(6,	'transgender',	'don\'t fuck that',	NULL,	NULL);

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazvanie` varchar(45) NOT NULL,
  `curator_id` int(11) NOT NULL,
  `otdel_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curator_id` (`curator_id`),
  KEY `otdel_id` (`otdel_id`),
  CONSTRAINT `groups_ibfk_4` FOREIGN KEY (`otdel_id`) REFERENCES `otdels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`curator_id`) REFERENCES `professors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `groups` (`id`, `nazvanie`, `curator_id`, `otdel_id`, `created_at`, `updated_at`) VALUES
(1,	'121',	133,	2,	NULL,	NULL),
(2,	'131',	115,	2,	NULL,	NULL),
(3,	'141',	134,	2,	NULL,	NULL),
(5,	'711',	117,	2,	NULL,	NULL),
(6,	'721',	128,	2,	NULL,	NULL),
(7,	'741',	106,	2,	NULL,	NULL),
(9,	'821',	132,	2,	NULL,	NULL),
(10,	'831',	40,	2,	NULL,	NULL),
(11,	'841',	72,	2,	NULL,	NULL),
(13,	'331',	26,	2,	NULL,	NULL),
(14,	'341',	26,	1,	NULL,	NULL),
(16,	'921',	8,	1,	NULL,	NULL),
(17,	'931',	98,	2,	NULL,	NULL),
(18,	'941',	2,	2,	NULL,	NULL),
(20,	'1011',	7,	1,	NULL,	NULL),
(21,	'1031',	7,	1,	NULL,	NULL),
(23,	'1121',	11,	1,	NULL,	NULL),
(24,	'1131',	11,	1,	NULL,	NULL),
(25,	'1141',	8,	1,	NULL,	NULL),
(27,	'421',	90,	1,	NULL,	NULL),
(28,	'422',	136,	1,	NULL,	NULL),
(29,	'431',	90,	1,	NULL,	NULL),
(31,	'441',	28,	1,	NULL,	NULL),
(34,	'621',	19,	1,	NULL,	NULL),
(35,	'631',	20,	1,	NULL,	NULL),
(36,	'641',	21,	1,	NULL,	NULL),
(38,	'1211',	95,	1,	NULL,	NULL),
(39,	'1221',	102,	1,	NULL,	NULL),
(41,	'1021',	5,	2,	NULL,	NULL),
(42,	'111',	113,	2,	NULL,	NULL),
(43,	'1111',	28,	1,	NULL,	NULL),
(44,	'1231',	112,	1,	NULL,	NULL),
(45,	'321',	62,	1,	NULL,	NULL),
(46,	'911',	5,	1,	NULL,	NULL),
(47,	'411',	94,	1,	NULL,	NULL),
(50,	'811',	134,	2,	NULL,	NULL),
(51,	'611',	138,	1,	NULL,	NULL),
(52,	'1241',	95,	1,	NULL,	NULL),
(53,	'432',	17,	1,	NULL,	NULL),
(55,	'1041',	3,	1,	NULL,	NULL),
(56,	'415',	108,	1,	NULL,	NULL);

DROP TABLE IF EXISTS `lessons`;
CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  `predmet_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `uroknomer` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `professor_id` (`professor_id`),
  KEY `predmet_id` (`predmet_id`),
  CONSTRAINT `lessons_ibfk_6` FOREIGN KEY (`predmet_id`) REFERENCES `predmets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lessons_ibfk_4` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lessons_ibfk_5` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


SET NAMES utf8mb4;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `otdels`;
CREATE TABLE `otdels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `otdels` (`id`, `name`, `description`) VALUES
(1,	'mex',	''),
(2,	'econom',	'');

DROP TABLE IF EXISTS `predmets`;
CREATE TABLE `predmets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(500) NOT NULL,
  `predmet` varchar(500) NOT NULL,
  `vsegochasov` int(11) NOT NULL,
  `semchas1` int(11) NOT NULL,
  `teor1` int(11) NOT NULL,
  `prakt1` int(11) NOT NULL,
  `semchas2` int(11) NOT NULL,
  `teor2` int(11) NOT NULL,
  `prarkt2` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `professor_id` (`professor_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `predmets_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`),
  CONSTRAINT `predmets_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `predmets` (`id`, `cod`, `predmet`, `vsegochasov`, `semchas1`, `teor1`, `prakt1`, `semchas2`, `teor2`, `prarkt2`, `professor_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1,	'ОГСЭ.03',	'Иностранный язык',	38,	29,	0,	29,	9,	0,	9,	101,	25,	NULL,	NULL),
(2,	'ОГСЭ.03',	'Иностранный язык',	38,	29,	0,	29,	9,	0,	9,	69,	25,	NULL,	NULL),
(3,	'ОГСЭ.04',	'Физическая культура',	38,	29,	0,	29,	9,	0,	9,	70,	25,	NULL,	NULL),
(4,	'В.ОГСЭ.05',	'Основы социологии и политологии',	32,	32,	32,	0,	0,	0,	0,	8,	25,	NULL,	NULL),
(5,	'ОП.09',	'Правовое обеспечение профессиональной деятельности',	40,	40,	30,	10,	0,	0,	0,	88,	25,	NULL,	NULL),
(6,	'В.ОП.12',	'Программирование в 1С',	132,	132,	20,	112,	0,	0,	0,	10,	25,	NULL,	NULL),
(7,	'В.ОП.13',	'Web-программирование',	108,	80,	30,	50,	0,	0,	0,	64,	25,	NULL,	NULL),
(8,	'В.ОП.14',	'Информационная безопасность на предприятии',	72,	72,	25,	47,	0,	0,	0,	64,	25,	NULL,	NULL),
(9,	'В.ОП.15',	'Экономика организации',	70,	70,	26,	44,	0,	0,	0,	11,	25,	NULL,	NULL),
(10,	'ПМ.02 МДК.02.01',	'Информационные технологии и платформы разработки информационных систем',	138,	42,	16,	26,	96,	30,	0,	66,	25,	NULL,	NULL),
(11,	'ПМ.02 МДК.02.02',	'Управление проектами',	94,	0,	0,	0,	94,	40,	54,	66,	25,	NULL,	NULL),
(12,	'УП.2.01',	'Информационные технологии и платформы разработки информационных систем',	72,	0,	0,	72,	0,	0,	0,	66,	25,	NULL,	NULL),
(13,	'ПП.2.01',	'Информационные технологии и платформы разработки информационных систем',	324,	0,	0,	0,	0,	0,	69,	66,	25,	NULL,	NULL),
(14,	'ПM.02.ЭК',	'КЭ Участие в разработке информационных систем',	8,	0,	0,	0,	0,	0,	0,	66,	25,	NULL,	NULL),
(15,	'ОГСЭ.01',	'Основы философии',	48,	0,	0,	0,	48,	48,	0,	62,	24,	NULL,	NULL),
(16,	'ОГСЭ.03',	'Иностранный язык',	56,	22,	0,	22,	34,	0,	34,	61,	24,	NULL,	NULL),
(17,	'ОГСЭ.03',	'Иностранный язык',	56,	22,	0,	22,	34,	0,	34,	28,	24,	NULL,	NULL),
(18,	'ОГСЭ.04',	'Физическая культура',	56,	22,	0,	22,	34,	0,	34,	113,	24,	NULL,	NULL),
(19,	'В.ОГСЭ.05',	'Основы социологии и политологии',	32,	0,	0,	0,	32,	32,	0,	8,	24,	NULL,	NULL),
(20,	'ЕН.03',	'Теория вероятностей и математическая статистика',	30,	30,	10,	20,	0,	0,	0,	95,	24,	NULL,	NULL),
(21,	'ОП.10',	'Безопасность жизнедеятельности',	68,	68,	68,	0,	0,	0,	0,	88,	24,	NULL,	NULL),
(22,	'В.ОП.11',	'Бухгалтерский учет',	32,	0,	0,	0,	32,	12,	20,	11,	24,	NULL,	NULL),
(23,	'В.ОП.12',	'Программирование в 1С',	74,	0,	0,	0,	74,	10,	64,	2,	24,	NULL,	NULL),
(24,	'В.ОП.12',	'Программирование в 1С',	74,	0,	0,	0,	74,	10,	64,	26,	24,	NULL,	NULL),
(25,	'В.ОП.13',	'Web-программирование',	212,	76,	24,	52,	136,	40,	96,	64,	24,	NULL,	NULL),
(26,	'ПМ.01 МДК.01.02',	'Проектирование информационных систем',	158,	158,	70,	88,	0,	0,	0,	66,	24,	NULL,	NULL),
(27,	'УП.1.02',	'Проектирование информационных систем',	144,	0,	0,	144,	0,	0,	0,	66,	24,	NULL,	NULL),
(28,	'ПП.1.02',	'Проектирование информационных систем',	36,	0,	0,	102,	0,	0,	0,	66,	24,	NULL,	NULL),
(29,	'ПM.01.ЭК',	'КЭ Эксплуатация и модификация информационных систем',	8,	0,	0,	0,	0,	0,	0,	66,	24,	NULL,	NULL),
(30,	'ПП.3.01',	'Организация работ оператора электронно-вычислительных и вычислительных машин',	72,	0,	0,	0,	0,	0,	102,	97,	24,	NULL,	NULL),
(31,	'ОГСЭ.02',	'История',	48,	48,	48,	0,	0,	0,	0,	19,	23,	NULL,	NULL),
(32,	'ОГСЭ.03',	'Иностранный язык',	74,	32,	0,	32,	42,	0,	42,	69,	23,	NULL,	NULL),
(33,	'ОГСЭ.03',	'Иностранный язык',	74,	32,	0,	32,	42,	0,	42,	101,	23,	NULL,	NULL),
(34,	'ОГСЭ.04',	'Физическая культура',	74,	32,	0,	32,	42,	0,	42,	113,	23,	NULL,	NULL),
(35,	'ЕН.01',	'Элементы высшей математики',	140,	30,	30,	0,	110,	70,	40,	25,	23,	NULL,	NULL),
(36,	'ЕН.02',	'Элементы математической логики',	90,	60,	30,	30,	30,	20,	10,	98,	23,	NULL,	NULL),
(37,	'ЕН.03',	'Теория вероятностей и математическая статистика',	28,	0,	0,	0,	28,	14,	14,	95,	23,	NULL,	NULL),
(38,	'ОП.01',	'Основы архитектуры, устройство и функционирование вычислительных систем',	70,	70,	30,	40,	0,	0,	0,	95,	23,	NULL,	NULL),
(39,	'ОП.01',	'Основы архитектуры, устройство и функционирование вычислительных систем',	70,	70,	30,	40,	0,	0,	0,	90,	23,	NULL,	NULL),
(40,	'ОП.02',	'Операционные системы',	110,	58,	38,	20,	52,	36,	16,	112,	23,	NULL,	NULL),
(41,	'ОП.03',	'Компьютерные сети',	70,	0,	0,	0,	70,	30,	40,	112,	23,	NULL,	NULL),
(42,	'ОП.04',	'Метрология, стандартизация, сертификация и техническое документоведение',	40,	0,	0,	0,	40,	40,	0,	17,	23,	NULL,	NULL),
(43,	'ОП.05',	'Устройство и функционирование информационной системы',	60,	30,	10,	20,	30,	10,	20,	112,	23,	NULL,	NULL),
(44,	'ОП.05',	'Устройство и функционирование информационной системы',	60,	30,	10,	20,	30,	10,	20,	138,	23,	NULL,	NULL),
(45,	'ОП.06',	'Основы алгоритмизации и программирования',	240,	126,	36,	90,	114,	18,	30,	66,	23,	NULL,	NULL),
(46,	'ОП.07',	'Основы проектирования баз данных',	90,	90,	30,	60,	0,	0,	0,	64,	23,	NULL,	NULL),
(47,	'ОП.08',	'Технические средства информатизации',	70,	0,	0,	0,	70,	30,	40,	90,	23,	NULL,	NULL),
(48,	'ПМ.01 МДК.01.01',	'Эксплуатация и модификация информационных систем',	174,	0,	0,	0,	174,	86,	88,	66,	23,	NULL,	NULL),
(49,	'УП.1.01',	'Учебная практика Эксплуатация и модификация информационных систем',	36,	0,	0,	0,	0,	0,	36,	66,	23,	NULL,	NULL),
(50,	'ПП.1.01',	'Производственная практика Эксплуатация и модификация информационных систем',	72,	0,	0,	0,	0,	0,	108,	66,	23,	NULL,	NULL),
(51,	'ОГСЭ.04',	'Иностранный язык',	52,	33,	0,	33,	19,	0,	19,	28,	55,	NULL,	NULL),
(52,	'ОГСЭ.04',	'Иностранный язык',	52,	33,	0,	33,	19,	0,	19,	61,	55,	NULL,	NULL),
(53,	'ОГСЭ.05',	'Физическая культура',	52,	33,	0,	33,	19,	0,	19,	71,	55,	NULL,	NULL),
(54,	'В.ОГСЭ.06',	'Основы социологии и политологии',	32,	32,	32,	0,	0,	0,	0,	8,	55,	NULL,	NULL),
(55,	'ОП.05',	'Иностранный язык (профессиональный)',	90,	44,	0,	44,	46,	0,	46,	28,	55,	NULL,	NULL),
(56,	'ОП.05',	'Иностранный язык (профессиональный)',	90,	44,	0,	44,	46,	0,	46,	61,	55,	NULL,	NULL),
(57,	'ОП.06',	'Профессиональная этика и психология делового общения',	38,	38,	28,	10,	0,	0,	0,	3,	55,	NULL,	NULL),
(58,	'ОП.07',	'Компьютерная обработка документов',	90,	90,	0,	90,	0,	0,	0,	2,	55,	NULL,	NULL),
(59,	'ОП.11',	'Основы исследовательской деятельности',	32,	0,	0,	0,	32,	32,	0,	131,	55,	NULL,	NULL),
(60,	'ОП.14',	'Организация государственных учреждений России',	52,	52,	44,	8,	0,	0,	0,	33,	55,	NULL,	NULL),
(61,	'ПМ.03 МДК.03.01',	'Информационные технологии в документационном обеспечении управления и архивном деле',	50,	50,	44,	6,	0,	0,	0,	26,	55,	NULL,	NULL),
(62,	'ПМ.03 МДК.03.02',	'Методика рационализации документационного обеспечения управления и архивного дела',	97,	64,	32,	32,	33,	0,	0,	33,	55,	NULL,	NULL),
(63,	'ПМ.03 МДК.03.03',	'Организация работы с электронными документами',	364,	138,	30,	108,	226,	30,	196,	10,	55,	NULL,	NULL),
(64,	'ПМ.03 МДК.03.03',	'Организация работы с электронными документами',	364,	138,	30,	108,	226,	30,	196,	26,	55,	NULL,	NULL),
(65,	'УП.3.01',	'Практика для получения первичных навыков (организация работы с электронными документами)',	36,	0,	0,	0,	0,	0,	36,	10,	55,	NULL,	NULL),
(66,	'ПП.3.01',	'Практика для получения первичных навыков (организация работы с электронными документами)',	108,	0,	0,	0,	0,	0,	69,	10,	55,	NULL,	NULL),
(67,	'ПM.03.ЭК',	'КЭ Осуществление документационного обеспечения управления и архивного дела с использованием программных средств учета, хранения, обработки и поиска документов',	8,	0,	0,	0,	0,	0,	0,	10,	55,	NULL,	NULL),
(68,	'ПM.03.ЭК',	'КЭ Осуществление документационного обеспечения управления и архивного дела с использованием программных средств учета, хранения, обработки и поиска документов',	8,	0,	0,	0,	0,	0,	0,	26,	55,	NULL,	NULL),
(69,	'ОГСЭ.01',	'Основы философии',	48,	48,	48,	0,	0,	0,	0,	62,	21,	NULL,	NULL),
(70,	'ОГСЭ.03',	'Психология общения',	48,	0,	0,	0,	48,	20,	28,	62,	21,	NULL,	NULL),
(71,	'ОГСЭ.04',	'Иностранный язык',	72,	32,	0,	32,	40,	0,	40,	28,	21,	NULL,	NULL),
(72,	'ОГСЭ.04',	'Иностранный язык',	72,	32,	0,	32,	40,	0,	40,	61,	21,	NULL,	NULL),
(73,	'ОГСЭ.05',	'Физическая культура',	72,	32,	0,	32,	40,	0,	40,	71,	21,	NULL,	NULL),
(74,	'ОП.05',	'Иностранный язык (профессиональный)',	76,	0,	0,	0,	76,	0,	76,	28,	21,	NULL,	NULL),
(75,	'ОП.05',	'Иностранный язык (профессиональный)',	76,	0,	0,	0,	76,	0,	76,	61,	21,	NULL,	NULL),
(76,	'ОП.06',	'Профессиональная этика и психология делового общения',	82,	0,	0,	0,	82,	72,	10,	3,	21,	NULL,	NULL),
(77,	'ОП.07',	'Компьютерная обработка документов',	110,	0,	0,	0,	110,	0,	110,	2,	21,	NULL,	NULL),
(78,	'ОП.07',	'Компьютерная обработка документов',	110,	0,	0,	0,	110,	0,	110,	10,	21,	NULL,	NULL),
(79,	'ОП.08',	'Правовое обеспечение профессиональной деятельности',	48,	48,	48,	0,	0,	0,	0,	33,	21,	NULL,	NULL),
(80,	'ОП.09',	'Управление качеством',	46,	46,	46,	0,	0,	0,	0,	7,	21,	NULL,	NULL),
(81,	'ОП.10',	'Управление персоналом',	78,	42,	24,	18,	36,	14,	22,	131,	21,	NULL,	NULL),
(82,	'ОП.13',	'Система государственного управления',	52,	0,	0,	0,	52,	44,	8,	131,	21,	NULL,	NULL),
(83,	'ПМ.01 МДК 01.01',	'Документационное обеспечение управления',	56,	56,	36,	20,	0,	0,	0,	3,	21,	NULL,	NULL),
(84,	'ПМ.01 МДК 01.01',	'Документационное обеспечение управления',	56,	56,	36,	20,	0,	0,	0,	33,	21,	NULL,	NULL),
(85,	'ПМ.01 МДК.01.03',	'Организация секретарского обслуживания',	82,	82,	12,	70,	0,	0,	0,	3,	21,	NULL,	NULL),
(86,	'ПM.01.ЭК',	'КЭ Организация документационного обеспечения управления и функционирования организации',	8,	0,	0,	0,	0,	0,	0,	3,	21,	NULL,	NULL),
(87,	'ПM.01.ЭК',	'КЭ Организация документационного обеспечения управления и функционирования организации',	8,	0,	0,	0,	0,	0,	0,	33,	21,	NULL,	NULL),
(88,	'ПМ.02 МДК.02.01',	'Организация и нормативно-правовые основы архивного дела',	82,	82,	58,	24,	0,	0,	0,	33,	21,	NULL,	NULL),
(89,	'ПМ.02 МДК.02.02',	'Государственные, муниципальные архивы и архивы организаций',	88,	88,	54,	34,	0,	0,	0,	33,	21,	NULL,	NULL),
(90,	'ПМ.02 МДК.02.03',	'Методика и практика архивоведения',	282,	141,	0,	0,	141,	76,	32,	33,	21,	NULL,	NULL),
(91,	'ПМ.02 МДК.02.04',	'Обеспечение сохранности документов',	216,	108,	0,	0,	108,	72,	36,	33,	21,	NULL,	NULL),
(92,	'ПП.2.01',	'Практика для получения первичных профессиональных навыков (по архивному делу)',	108,	0,	0,	0,	0,	0,	66,	33,	21,	NULL,	NULL),
(93,	'ПM.02.ЭК',	'КЭ Организация архивной и справочно-информационной работы по документам организации',	8,	0,	0,	0,	0,	0,	0,	33,	21,	NULL,	NULL),
(94,	'ОГСЭ.02',	'История',	48,	48,	48,	0,	0,	0,	0,	19,	41,	NULL,	NULL),
(95,	'ОГСЭ.04',	'Иностранный язык',	72,	32,	0,	32,	40,	0,	40,	61,	41,	NULL,	NULL),
(96,	'ОГСЭ.04',	'Иностранный язык',	72,	32,	0,	32,	40,	0,	40,	28,	41,	NULL,	NULL),
(97,	'ОГСЭ.05',	'Физическая культура',	72,	32,	0,	32,	40,	0,	40,	71,	41,	NULL,	NULL),
(98,	'ЕН.01',	'Математика',	40,	40,	40,	0,	0,	0,	0,	98,	41,	NULL,	NULL),
(99,	'ЕН.02',	'Информатика',	89,	89,	40,	49,	0,	0,	0,	2,	41,	NULL,	NULL),
(100,	'ЕН.02',	'Информатика',	89,	89,	40,	49,	0,	0,	0,	112,	41,	NULL,	NULL),
(101,	'ЕН.03',	'Экологические основы природопользования',	39,	0,	0,	0,	39,	32,	0,	7,	41,	NULL,	NULL),
(102,	'ЕН.04',	'Информационные системы в профессиональной деятельности',	101,	0,	0,	0,	101,	0,	99,	2,	41,	NULL,	NULL),
(103,	'ЕН.04',	'Информационные системы в профессиональной деятельности',	109,	0,	0,	0,	109,	0,	99,	10,	41,	NULL,	NULL),
(104,	'ОП.01',	'Экономическая теория',	140,	78,	78,	0,	62,	0,	0,	62,	41,	NULL,	NULL),
(105,	'ОП.02',	'Экономика организации',	61,	0,	0,	0,	61,	30,	20,	11,	41,	NULL,	NULL),
(106,	'ОП.03',	'Менеджмент',	206,	75,	40,	35,	131,	0,	0,	131,	41,	NULL,	NULL),
(107,	'ОП.04',	'Государственная и муниципальная служба',	85,	0,	0,	0,	85,	52,	0,	33,	41,	NULL,	NULL),
(108,	'ОП.12',	'Государственное регулирование экономики',	57,	0,	0,	0,	57,	46,	0,	11,	41,	NULL,	NULL),
(109,	'ОП.15',	'Безопасность жизнедеятельности',	84,	0,	0,	0,	84,	20,	48,	16,	41,	NULL,	NULL),
(110,	'В.ОП.17',	'Стилистика делового русского языка',	67,	34,	34,	0,	33,	30,	0,	3,	41,	NULL,	NULL),
(111,	'ПМ.01 МДК.01.01',	'Документационное обеспечение управления',	133,	62,	42,	20,	71,	48,	20,	3,	41,	NULL,	NULL),
(112,	'ПМ.01 МДК.01.02',	'Правовое регулирование управленческой деятельности',	81,	0,	0,	0,	81,	20,	28,	33,	41,	NULL,	NULL),
(113,	'ПМ.01 МДК.01.03',	'Организация секретарского обслуживания',	172,	66,	42,	24,	106,	59,	44,	3,	41,	NULL,	NULL),
(114,	'ПМ.01 МДК.01.03',	'Организация секретарского обслуживания',	202,	66,	42,	24,	136,	59,	44,	33,	41,	NULL,	NULL),
(115,	'УП.1.01',	'Секретарское обслуживание',	36,	0,	0,	0,	0,	0,	36,	3,	41,	NULL,	NULL),
(116,	'УП.1.02',	'Документационное обеспечение управления',	36,	0,	0,	0,	0,	0,	36,	33,	41,	NULL,	NULL),
(117,	'ПМ.04 МДК.04.01',	'Организация деятельности делопроизводителя',	97,	20,	20,	0,	77,	0,	44,	33,	41,	NULL,	NULL),
(118,	'ПП.4.01',	'Практика для получения первичных профессиональных навыков',	36,	0,	0,	0,	0,	0,	84,	33,	41,	NULL,	NULL),
(119,	'ОГСЭ.04',	'Иностранный язык',	46,	27,	0,	27,	19,	0,	19,	101,	18,	NULL,	NULL),
(120,	'ОГСЭ.05',	'Физическая культура',	46,	27,	0,	27,	19,	0,	19,	71,	18,	NULL,	NULL),
(121,	'ОП.06',	'Управленческая психология',	44,	44,	34,	10,	0,	0,	0,	3,	18,	NULL,	NULL),
(122,	'ОП.07',	'Деловой иностранный язык (китайский)',	252,	92,	0,	92,	160,	0,	160,	123,	18,	NULL,	NULL),
(123,	'ПМ.04 МДК.04.01',	'Организация продаж гостиничного продукта',	198,	54,	42,	12,	144,	74,	70,	87,	18,	NULL,	NULL),
(124,	'ПМ.04 МДК.04.01',	'Организация продаж гостиничного продукта',	198,	54,	42,	12,	144,	74,	70,	101,	18,	NULL,	NULL),
(125,	'ПП.4.01',	'Организация продаж гостиничного продукта',	144,	0,	0,	0,	0,	0,	39,	87,	18,	NULL,	NULL),
(126,	'ПМ.05 МДК.05.01',	'Управление персоналом',	484,	353,	96,	126,	131,	0,	0,	131,	18,	NULL,	NULL),
(127,	'ПМ.05 МДК.05.01',	'Управление персоналом',	274,	248,	96,	126,	26,	0,	0,	26,	18,	NULL,	NULL),
(128,	'ПП.5.01',	'Управление персоналом',	108,	0,	0,	108,	131,	0,	0,	131,	18,	NULL,	NULL),
(129,	'ОГСЭ.01',	'Основы философии',	48,	48,	48,	0,	0,	0,	0,	62,	17,	NULL,	NULL),
(130,	'ОГСЭ.04',	'Иностранный язык',	64,	32,	0,	32,	32,	0,	32,	101,	17,	NULL,	NULL),
(131,	'ОГСЭ.05',	'Физическая культура',	64,	32,	0,	32,	32,	0,	32,	71,	17,	NULL,	NULL),
(132,	'В.ОГСЭ.06',	'Основы социологии и политологии',	32,	0,	0,	0,	32,	32,	0,	8,	17,	NULL,	NULL),
(133,	'ОП.04',	'Бухгалтерский учет',	124,	98,	78,	20,	26,	0,	0,	26,	17,	NULL,	NULL),
(134,	'ОП.06',	'Управленческая психология',	39,	0,	0,	0,	39,	26,	10,	3,	17,	NULL,	NULL),
(135,	'ОП.07',	'Деловой иностранный язык (китайский)',	323,	106,	0,	106,	217,	0,	94,	123,	17,	NULL,	NULL),
(136,	'ОП.08',	'Безопасность жизнедеятельности',	84,	0,	0,	0,	84,	48,	20,	16,	17,	NULL,	NULL),
(137,	'МДК.02.01',	'Организация деятельности службы приема, размещения и выписки гостей',	112,	112,	28,	84,	0,	0,	0,	52,	17,	NULL,	NULL),
(138,	'МДК.02.01',	'Организация деятельности службы приема, размещения и выписки гостей',	112,	112,	28,	84,	0,	0,	0,	101,	17,	NULL,	NULL),
(139,	'ПМ.03 МДК.03.01',	'Организация обслуживания гостей в процессе проживания',	352,	148,	108,	40,	204,	80,	72,	52,	17,	NULL,	NULL),
(140,	'ПМ.03 МДК.03.01',	'Организация обслуживания гостей в процессе проживания',	401,	148,	108,	40,	253,	80,	72,	101,	17,	NULL,	NULL),
(141,	'УП.3.01',	'Организация и технология работы по обслуживанию гостей',	108,	0,	0,	0,	0,	0,	108,	52,	17,	NULL,	NULL),
(142,	'ПП.3.01',	'Организация и технология работы по обслуживанию гостей',	144,	0,	0,	0,	0,	0,	63,	52,	17,	NULL,	NULL),
(143,	'ПМ.04 МДК.04.01',	'Организация продаж гостиничного продукта',	197,	0,	0,	0,	197,	50,	60,	87,	17,	NULL,	NULL),
(144,	'ОГСЭ.01',	'Основы философии',	48,	0,	0,	0,	48,	48,	0,	8,	16,	NULL,	NULL),
(145,	'ОГСЭ.02',	'История',	48,	48,	48,	0,	0,	0,	0,	8,	16,	NULL,	NULL),
(146,	'ОГСЭ.03',	'Психология общения',	48,	0,	0,	0,	48,	20,	28,	62,	16,	NULL,	NULL),
(147,	'ОГСЭ.04',	'Иностранный язык',	68,	26,	0,	26,	42,	0,	42,	69,	16,	NULL,	NULL),
(148,	'ОГСЭ.05',	'Физическая культура',	68,	26,	0,	26,	42,	0,	42,	71,	16,	NULL,	NULL),
(149,	'ЕН.01',	'Информатика и информационно-коммуникационные технологии в профессиональной деятельности',	126,	66,	30,	36,	60,	30,	28,	2,	16,	NULL,	NULL),
(150,	'ЕН.01',	'Информатика и информационно-коммуникационные технологии в профессиональной деятельности',	134,	66,	30,	36,	68,	30,	28,	10,	16,	NULL,	NULL),
(151,	'ОП.01',	'Менеджмент',	231,	50,	30,	20,	181,	30,	20,	131,	16,	NULL,	NULL),
(152,	'ОП.02',	'Правовое и документационное обеспечение профессиональной деятельности',	228,	40,	40,	0,	188,	50,	6,	132,	16,	NULL,	NULL),
(153,	'ОП.03',	'Экономика организации',	91,	34,	20,	14,	57,	30,	16,	11,	16,	NULL,	NULL),
(154,	'ОП.04',	'Бухгалтерский учет',	124,	0,	0,	0,	124,	78,	20,	26,	16,	NULL,	NULL),
(155,	'ОП.05',	'Здания и инженерные системы гостиниц',	137,	0,	0,	0,	137,	30,	20,	87,	16,	NULL,	NULL),
(156,	'ОП.07',	'Деловой иностранный язык (китайский)',	157,	0,	0,	0,	157,	0,	34,	123,	16,	NULL,	NULL),
(157,	'В.ОП.09',	'Гостиничная индустрия',	102,	50,	40,	10,	52,	0,	0,	52,	16,	NULL,	NULL),
(158,	'ПМ.01 МДК.01.01',	'Организация деятельности служб бронирования гостиничных услуг',	281,	48,	18,	30,	233,	68,	96,	69,	16,	NULL,	NULL),
(159,	'ПМ.01 МДК.01.01',	'Организация деятельности служб бронирования гостиничных услуг',	264,	48,	18,	30,	216,	68,	96,	52,	16,	NULL,	NULL),
(160,	'УП.1.01',	'Учебная практика Бронирование гостиничных услуг',	36,	0,	0,	0,	0,	0,	36,	52,	16,	NULL,	NULL),
(161,	'ПП.01.01',	'Производственная практика Бронирование гостиничных услуг',	72,	0,	0,	0,	0,	0,	81,	52,	16,	NULL,	NULL),
(162,	'ПМ.06 МДК.06.01',	'Организация и технология работы горничной',	132,	80,	40,	40,	52,	0,	0,	52,	16,	NULL,	NULL),
(163,	'УП.06.01',	'Учебная практика Выполнение работ по должности Горничная',	36,	0,	0,	36,	52,	0,	0,	52,	16,	NULL,	NULL),
(164,	'ПП.6.01',	'Производственная практика Выполнение работ по должности Горничная',	72,	0,	0,	81,	52,	0,	0,	52,	16,	NULL,	NULL),
(165,	'ПM.06.ЭК',	'Кв.экз. Выполнение работ по должности Горничная',	8,	0,	0,	0,	52,	0,	0,	52,	16,	NULL,	NULL);

DROP TABLE IF EXISTS `professors`;
CREATE TABLE `professors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` text NOT NULL,
  `SecondName` text NOT NULL,
  `lastname` text NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `professors` (`id`, `firstname`, `SecondName`, `lastname`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1,	'Л',	'С',	'Жанаева',	'',	'',	NULL,	NULL),
(2,	'И',	'В',	'Дитковская',	'',	'',	NULL,	NULL),
(3,	'А',	'А',	'Савина',	'',	'',	NULL,	NULL),
(5,	'Л',	'С',	'Ягубкина',	'',	'',	NULL,	NULL),
(7,	'Л',	'М',	'Горелкина',	'',	'',	NULL,	NULL),
(8,	'Е',	'Л',	'Пугачева',	'',	'',	NULL,	NULL),
(10,	'Е',	'В',	'Здобина',	'',	'',	NULL,	NULL),
(11,	'Т',	'А',	'Юдина',	'',	'',	NULL,	NULL),
(13,	'В',	'А',	'Иванов',	'',	'',	NULL,	NULL),
(16,	'А',	'Н',	'Полунин',	'',	'',	NULL,	NULL),
(17,	'О',	'М',	'Журавлева',	'',	'',	NULL,	NULL),
(19,	'Л',	'А',	'Глушенко',	'',	'',	NULL,	NULL),
(20,	'Е',	'Е',	'Волкова',	'',	'',	NULL,	NULL),
(21,	'Т',	'Ю',	'Холоднякова',	'',	'',	NULL,	NULL),
(24,	'И',	'В',	'Белобрицкая',	'',	'',	NULL,	NULL),
(25,	'Н',	'И',	'Болотина',	'',	'',	NULL,	NULL),
(26,	'Г',	'Н',	'Бурова',	'',	'',	NULL,	NULL),
(28,	'Л',	'В',	'Васильева',	'',	'',	NULL,	NULL),
(30,	'А',	'В',	'Володичев',	'',	'',	NULL,	NULL),
(33,	'М',	'Н',	'Лаврентьева',	'',	'',	NULL,	NULL),
(39,	'И',	'В',	'Попович',	'',	'',	NULL,	NULL),
(40,	'Б',	'С',	'Ким',	'',	'',	NULL,	NULL),
(44,	'Д',	'Е',	'Иващенко',	'',	'',	NULL,	NULL),
(46,	'И',	'Н',	'Коновалова',	'',	'',	NULL,	NULL),
(47,	'Г',	'М',	'Косаченко',	'',	'',	NULL,	NULL),
(49,	'К',	'С',	'Крючков',	'',	'',	NULL,	NULL),
(51,	'С',	'А',	'Куликова',	'',	'',	NULL,	NULL),
(52,	'О',	'А',	'Лесина',	'',	'',	NULL,	NULL),
(54,	'К',	'А',	'Мартынов',	'',	'',	NULL,	NULL),
(55,	'О',	'А',	'Медведева',	'',	'',	NULL,	NULL),
(58,	'Б',	'М',	'Морозов',	'',	'',	NULL,	NULL),
(59,	'И',	'В',	'Морозова',	'',	'',	NULL,	NULL),
(61,	'О',	'В',	'Оселедец',	'',	'',	NULL,	NULL),
(62,	'Н',	'Б',	'Пасещнюк',	'',	'',	NULL,	NULL),
(63,	'Н',	'И',	'Плясунова',	'',	'',	NULL,	NULL),
(64,	'М',	'В',	'Побежимов',	'MadHowl',	'123',	NULL,	NULL),
(66,	'А',	'А',	'Пушкин',	'StenlyMan',	'',	NULL,	NULL),
(67,	'Г',	'А',	'Пфляум',	'',	'',	NULL,	NULL),
(68,	'Т',	'А',	'Руднева',	'',	'',	NULL,	NULL),
(69,	'Э',	'Н',	'Рябчикова',	'',	'',	NULL,	NULL),
(70,	'С',	'Р',	'Саркисян',	'',	'',	NULL,	NULL),
(71,	'Е',	'Ф',	'Тарасова',	'',	'',	NULL,	NULL),
(72,	'Е',	'И',	'Трифан',	'',	'',	NULL,	NULL),
(73,	'А',	'Г',	'Трофимук',	'',	'',	NULL,	NULL),
(74,	'Н',	'Я',	'Харитончик',	'',	'',	NULL,	NULL),
(75,	'И',	'К',	'Чеснокова',	'',	'',	NULL,	NULL),
(80,	'Л',	'В',	'Клепикова',	'',	'',	NULL,	NULL),
(81,	'В',	'П',	'Клишевич',	'',	'',	NULL,	NULL),
(85,	'Л',	'Н',	'Романенко',	'',	'',	NULL,	NULL),
(86,	'А',	'С',	'Троицкий',	'',	'',	NULL,	NULL),
(87,	'Л',	'Ю',	'Тучина',	'',	'',	NULL,	NULL),
(88,	'Н',	'И',	'Чернышов',	'',	'',	NULL,	NULL),
(89,	'Н',	'Н',	'Матюсова',	'',	'',	NULL,	NULL),
(90,	'Е',	'В',	'Цивинская',	'',	'',	NULL,	NULL),
(92,	'Ю',	'П',	'Сохан',	'',	'',	NULL,	NULL),
(94,	'А',	'С',	'Карапетян',	'',	'',	NULL,	NULL),
(95,	'С',	'Н',	'Пекарская',	'',	'',	NULL,	NULL),
(96,	'С',	'Г',	'Филиппов',	'',	'',	NULL,	NULL),
(97,	'Р',	'Н',	'Бабенко',	'',	'',	NULL,	NULL),
(98,	'М',	'М',	'Абросимова',	'',	'',	NULL,	NULL),
(100,	'В',	'П',	'Малахов',	'',	'',	NULL,	NULL),
(101,	'Л',	'А',	'Половец',	'',	'',	NULL,	NULL),
(102,	'М',	'П',	'Узлова',	'',	'',	NULL,	NULL),
(106,	'Г',	'Н',	'Пономарева',	'',	'',	NULL,	NULL),
(108,	'Л',	'В',	'Михальченко',	'',	'',	NULL,	NULL),
(112,	'А',	'А',	'Тимошенко',	'',	'',	NULL,	NULL),
(113,	'Л',	'В',	'Иванушко',	'',	'',	NULL,	NULL),
(115,	'О',	'А',	'Качнова',	'',	'',	NULL,	NULL),
(117,	'Н',	'И',	'Попова',	'',	'',	NULL,	NULL),
(120,	'Е',	'С',	'Золотилова',	'',	'',	NULL,	NULL),
(121,	'Л',	'М',	'Войтенко',	'',	'',	NULL,	NULL),
(123,	'Л',	'Г',	'Квон',	'',	'',	NULL,	NULL),
(128,	'Е',	'Н',	'Ятчук',	'',	'',	NULL,	NULL),
(131,	'О',	'Ю',	'Бабашко',	'',	'',	NULL,	NULL),
(132,	'А',	'С',	'Барсукова',	'',	'',	NULL,	NULL),
(133,	'А',	'В',	'Кондратюк',	'',	'',	NULL,	NULL),
(134,	'П',	'В',	'Медведев',	'',	'',	NULL,	NULL),
(135,	'А',	'В',	'Фунтикова',	'',	'',	NULL,	NULL),
(136,	'А',	'Е',	'Туча',	'',	'',	NULL,	NULL),
(137,	'О',	'И',	'Борсова',	'',	'',	NULL,	NULL),
(138,	'Е',	'А',	'Малыхина',	'',	'',	NULL,	NULL),
(139,	'М',	'А',	'Попович',	'',	'',	NULL,	NULL);

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `familia` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `otchestvo` varchar(500) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `birthday` varchar(500) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `gender_id` (`gender_id`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `students` (`id`, `familia`, `name`, `otchestvo`, `gender_id`, `birthday`, `group_id`, `created_at`, `updated_at`) VALUES
(1,	'Белаш',	'Никита',	'Сергеевич',	1,	'08.11.1999',	25,	NULL,	NULL),
(2,	'Белокопытов',	'Иван',	'Васильевич',	1,	'15.07.1997',	25,	NULL,	NULL),
(3,	'Белошапкин',	'Роман',	'Игоревич',	1,	'25.05.1999',	25,	NULL,	NULL),
(4,	'Богданов',	'Виктор',	'Евгеньевич',	1,	'06.06.1999',	25,	NULL,	NULL),
(5,	'Воблый',	'Егор',	'Борисович',	1,	'20.03.1998',	25,	NULL,	NULL),
(6,	'Волков',	'Георгий',	'Романович',	1,	'20.12.1998',	25,	NULL,	NULL),
(7,	'Гаврилов',	'Сергей',	'Сергеевич',	1,	'14.03.1999',	25,	NULL,	NULL),
(8,	'Дуденков',	'Илья',	'Юрьевич',	1,	'07.07.1999',	25,	NULL,	NULL),
(9,	'Зинков',	'Кирилл',	'Геннадьевич',	1,	'19.06.1999',	25,	NULL,	NULL),
(10,	'Камшилов',	'Константин',	'Сергеевич',	1,	'17.07.1996',	25,	NULL,	NULL),
(11,	'Ключников',	'Максим',	'Александрович',	1,	'14.05.1997',	25,	NULL,	NULL),
(12,	'Коваленко',	'Алексей',	'Андреевич',	1,	'01.09.1996',	25,	NULL,	NULL),
(13,	'Король',	'Руслан',	'Русланович',	1,	'14.08.1999',	25,	NULL,	NULL),
(14,	'Крайнова (Мамзерова)',	'Юлия',	'Витальевна',	2,	'03.03.1998',	25,	NULL,	NULL),
(15,	'Кузнецов',	'Владимир',	'Евгеньевич',	1,	'23.08.1999',	25,	NULL,	NULL),
(16,	'Майоров',	'Иван',	'Сергеевич',	1,	'31.07.1997',	25,	NULL,	NULL),
(17,	'Матвеев',	'Иван',	'Сергеевич',	1,	'08.11.1999',	25,	NULL,	NULL),
(18,	'Назаров',	'Игорь',	'Алексеевич',	1,	'21.08.1997',	25,	NULL,	NULL),
(19,	'Одобеско',	'Никита',	'Вячеславович',	1,	'29.09.1999',	25,	NULL,	NULL),
(20,	'Савритдинов',	'Суннатилло',	'Савритдинович',	1,	'11.12.1999',	25,	NULL,	NULL),
(21,	'Тартышный',	'Николай',	'Андреевич',	1,	'07.07.1997',	25,	NULL,	NULL),
(22,	'Чаус',	'Иван',	'Николаевич',	1,	'24.11.1998',	25,	NULL,	NULL),
(23,	'Шепетун',	'Роман',	'Вячеславович',	1,	'04.03.1999',	25,	NULL,	NULL),
(24,	'Бемещук',	'Каролина',	'Андреевна',	2,	'06.30.2000',	21,	NULL,	NULL),
(25,	'Воронина',	'Клавдия',	'Владимировна',	2,	'09.07.1997',	21,	NULL,	NULL),
(26,	'Ганиева',	'Исмигул',	'Алишеровна',	2,	'06.16.2000',	21,	NULL,	NULL),
(27,	'Граф',	'Юлия',	'Дмитриевна',	2,	'01.07.2000',	21,	NULL,	NULL),
(28,	'Дубинина',	'Елена',	'Сергеевна',	2,	'06.18.1999',	21,	NULL,	NULL),
(29,	'Ишонова',	'Мадинахон',	'Ахмадчоновна',	2,	'03.09.2000',	21,	NULL,	NULL),
(30,	'Кафанова',	'Екатерина',	'Алексеевна',	1,	'06.24.1998',	21,	NULL,	NULL),
(31,	'Киенко',	'Ольга',	'Вячеславовна',	2,	'07.18.2000',	21,	NULL,	NULL),
(32,	'Кожухова',	'Дианна',	'Олеговна',	2,	'08.31.1998',	21,	NULL,	NULL),
(33,	'Коржевая',	'Виктория',	'Андреевна',	2,	'01.01.2000',	21,	NULL,	NULL),
(34,	'Лазуренко',	'Елизавета',	'Константиновна',	1,	'03.08.2000',	21,	NULL,	NULL),
(35,	'Лисовская',	'Инна',	'Владимировна',	2,	'02.27.2000',	21,	NULL,	NULL),
(36,	'Мирошниченко',	'Галина',	'Владимировна',	2,	'03.03.2000',	21,	NULL,	NULL),
(37,	'Новах',	'Ольга',	'Павловна',	2,	'09.13.1995',	21,	NULL,	NULL),
(38,	'Павлова',	'Мария',	'Антоновна',	2,	'08.30.2000',	21,	NULL,	NULL),
(39,	'Прибыткина',	'Дарья',	'Андреевна',	2,	'08.07.1999',	21,	NULL,	NULL),
(40,	'Радова',	'Анастасия',	'Александровна',	2,	'11.07.2000',	21,	NULL,	NULL),
(41,	'Радченко',	'Дарья',	'Андреевна',	2,	'06.27.2000',	21,	NULL,	NULL),
(42,	'Сайбель',	'Диана',	'Александровна',	2,	'08.29.2000',	21,	NULL,	NULL),
(43,	'Син',	'Де Сук',	'',	1,	'12.09.1999',	21,	NULL,	NULL),
(44,	'Скрипник',	'Александра',	'Викторовна',	2,	'01.29.2001',	21,	NULL,	NULL),
(45,	'Снеткова',	'Яна',	'Анатольевна',	2,	'05.07.1999',	21,	NULL,	NULL),
(46,	'Степанченко',	'Анна',	'Владимировна',	2,	'04.04.2000',	21,	NULL,	NULL),
(47,	'Тавылдыева',	'Ймут',	'Тавылдыевна',	2,	'03.26.1999',	21,	NULL,	NULL),
(48,	'Тубольцева',	'Виктория',	'Андреевна',	2,	'06.06.1999',	21,	NULL,	NULL),
(49,	'Холошенко',	'Анастасия',	'Геннадьевна',	2,	'07.14.2000',	21,	NULL,	NULL),
(50,	'Чепелюк',	'Ирина',	'Евгеньевна',	2,	'10.04.1999',	21,	NULL,	NULL),
(51,	'Шашкина',	'Марина',	'Сергеевна',	2,	'03.26.2001',	21,	NULL,	NULL),
(52,	'Ялалдинова',	'Марина',	'Руслановна',	2,	'07.01.2001',	21,	NULL,	NULL),
(53,	'Ярлыков',	'Владимир',	'Сергеевич',	1,	'11.19.1997',	21,	NULL,	NULL),
(54,	'Деревнин',	'Вячеслав',	'Олегович',	1,	'01.01.2001',	24,	NULL,	NULL),
(55,	'Дойников',	'Роман',	'Александрович',	1,	'11.15.2000',	24,	NULL,	NULL),
(56,	'Загорулько',	'Виталий',	'Александрович',	1,	'08.20.2000',	24,	NULL,	NULL),
(57,	'Ивантеев',	'Евгений',	'Сергеевич',	1,	'11.03.1999',	24,	NULL,	NULL),
(58,	'Коваленко',	'Арсений',	'Андреевич',	1,	'06.19.2000',	24,	NULL,	NULL),
(59,	'Ковиненко',	'Елена',	'Александровна',	2,	'09.22.2000',	24,	NULL,	NULL),
(60,	'Кожемяко',	'Владимир',	'Юрьевич',	1,	'01.01.2000',	24,	NULL,	NULL),
(61,	'Корвин',	'Виктор',	'Александрович',	1,	'08.18.2000',	24,	NULL,	NULL),
(62,	'Кочуров',	'Максим',	'Александрович',	1,	'08.19.2000',	24,	NULL,	NULL),
(63,	'Крутоголовец',	'Илья',	'Евгеньевич',	1,	'11.29.2000',	24,	NULL,	NULL),
(64,	'Минкин',	'Роман',	'Дмитриевич',	1,	'08.11.2000',	24,	NULL,	NULL),
(65,	'Михайлов',	'Владимир',	'Сергеевич',	1,	'08.24.2000',	24,	NULL,	NULL),
(66,	'Невленинов',	'Владислав',	'Ильич',	1,	'03.17.2000',	24,	NULL,	NULL),
(67,	'Нефедов',	'Дмитрий',	'Ильич',	1,	'08.11.2000',	24,	NULL,	NULL),
(68,	'Палей',	'Денис',	'Александрович',	1,	'02.25.2000',	24,	NULL,	NULL),
(69,	'Пальшин',	'Дмитрий',	'Сергеевич',	1,	'06.14.2000',	24,	NULL,	NULL),
(70,	'Панишев',	'Игорь',	'Аркадьевич',	1,	'12.07.2000',	24,	NULL,	NULL),
(71,	'Петров',	'Денис',	'Анатольевич',	1,	'07.21.1999',	24,	NULL,	NULL),
(72,	'Пищняк ',	'Денис',	'Александрович',	1,	'08.07.1999',	24,	NULL,	NULL),
(73,	'Поваров',	'Алексей',	'Дмитриевич',	1,	'02.24.2000',	24,	NULL,	NULL),
(74,	'Подопригора',	'Никита',	'Алексеевич',	1,	'06.09.2000',	24,	NULL,	NULL),
(75,	'Приказюк',	'Никита',	'Евгеньевич',	1,	'12.18.2000',	24,	NULL,	NULL),
(76,	'Родзавилов',	'Иван',	'Дмитриевич',	1,	'07.16.1998',	24,	NULL,	NULL),
(77,	'Романенко',	'Ярослав ',	'Юрьевич',	1,	'03.27.2000',	24,	NULL,	NULL),
(78,	'Руденко',	'Павел',	'Сергеевич',	1,	'05.16.2000',	24,	NULL,	NULL),
(79,	'Русс',	'Владислава ',	'Сергеевна',	2,	'07.23.2000',	24,	NULL,	NULL),
(80,	'Савчук',	'Никита ',	'Леонидович',	1,	'08.23.2000',	24,	NULL,	NULL),
(81,	'Свешников  ',	'Александр',	'Владимирович',	1,	'10.13.1995',	24,	NULL,	NULL),
(82,	'Семков',	'Дмитрий',	'Сергеевич',	1,	'04.01.2001',	24,	NULL,	NULL),
(83,	'Сироткин ',	'Дмитрий',	'Сергеевич',	1,	'11.19.1999',	24,	NULL,	NULL),
(84,	'Соколов',	'Артем',	'Сергеевич',	1,	'10.12.2000',	24,	NULL,	NULL),
(85,	'Соломко',	'Антон',	'Андреевич',	1,	'08.17.2000',	24,	NULL,	NULL),
(86,	'Таран',	'Виктор',	'Дмитриевич',	1,	'02.17.2000',	24,	NULL,	NULL),
(87,	'Трушников',	'Павел',	'Сергеевич',	1,	'02.22.2000',	24,	NULL,	NULL),
(88,	'Чаусов',	'Вячеслав',	'Евгеньевич',	1,	'09.19.2000',	24,	NULL,	NULL),
(89,	'Шапошников',	'Роман',	'Николаевич',	1,	'01.10.2000',	24,	NULL,	NULL),
(90,	'Щедрин',	'Максим',	'Алексеевич',	1,	'08.08.2000',	24,	NULL,	NULL),
(91,	'Щербаков',	'Денис',	'Романович',	1,	'10.02.2000',	24,	NULL,	NULL),
(92,	'Юдин',	'Николай',	'Денисович',	1,	'02.11.2000',	24,	NULL,	NULL),
(93,	'Яц',	'Евгений',	'Юрьевич',	1,	'04.14.1999',	24,	NULL,	NULL),
(94,	'Арипжанов',	'Достонбек',	'Адилжанович',	1,	'10.22.2000',	44,	NULL,	NULL),
(95,	'Бурейко',	'Леонид',	'Игоревич',	1,	'08.01.2000',	44,	NULL,	NULL),
(96,	'Головчак',	'Игорь',	'Викторович',	1,	'12.01.1999',	44,	NULL,	NULL),
(97,	'Деревнин',	'Денис',	'Сергеевич',	1,	'06.04.2000',	44,	NULL,	NULL),
(98,	'Долгушин',	'Владислав',	'Константинович',	1,	'08.14.2000',	44,	NULL,	NULL),
(99,	'Ермолаев',	'Олег',	'Георгиевич',	1,	'06.14.2000',	44,	NULL,	NULL),
(100,	'Ерыгин',	'Константин',	'Петрович',	1,	'04.10.2000',	44,	NULL,	NULL),
(101,	'Житник',	'Илья',	'Андреевич',	1,	'04.15.2000',	44,	NULL,	NULL),
(102,	'Кибирин',	'Никита',	'Андреевич',	1,	'09.14.1999',	44,	NULL,	NULL),
(103,	'Мартышов',	'Григорий',	'Алексеевич',	1,	'10.10.2000',	44,	NULL,	NULL),
(104,	'Муравьев',	'Евгений',	'Анатольевич',	1,	'08.08.2000',	44,	NULL,	NULL),
(105,	'Некрасов',	'Алексей',	'Дмитриевич',	1,	'02.25.1997',	44,	NULL,	NULL),
(106,	'Нечепуренко',	'Дмитрий',	'Алексеевич',	1,	'07.09.1998',	44,	NULL,	NULL),
(107,	'Пронский',	'Илья',	'Ильич',	1,	'08.01.2000',	44,	NULL,	NULL),
(108,	'Родин',	'Дмитрий',	'Алексеевич',	1,	'01.01.2000',	44,	NULL,	NULL),
(109,	'Рудица',	'Александр',	'Евгеньевич',	1,	'02.23.1999',	44,	NULL,	NULL),
(110,	'Сайранов',	'Михаил',	'Евгеньевич',	1,	'10.06.1996',	44,	NULL,	NULL),
(111,	'Старцев',	'Павел',	'Андреевич',	1,	'07.06.2000',	44,	NULL,	NULL),
(112,	'Степанов',	'Даниил',	'Артемович',	1,	'10.04.2000',	44,	NULL,	NULL),
(113,	'Тарасов',	'Андрей',	'Владиславович',	1,	'04.09.2000',	44,	NULL,	NULL),
(114,	'Торгунский',	'Даниил',	'Александрович',	1,	'06.08.1999',	44,	NULL,	NULL),
(115,	'Федорченко',	'Илья',	'Андреевич',	1,	'06.19.2000',	44,	NULL,	NULL),
(116,	'Холдобин',	'Владислав',	'Валерьевич',	1,	'08.06.1996',	44,	NULL,	NULL),
(117,	'Шевчук',	'Алексей',	'Александрович',	1,	'06.09.1999',	44,	NULL,	NULL),
(118,	'Шпикин',	'Никита',	'Владимирович',	1,	'04.18.2000',	44,	NULL,	NULL),
(119,	'Щипачев',	'Павел',	'Дмитриевич',	1,	'10.28.2000',	44,	NULL,	NULL),
(120,	'Эгамов',	'Азизбек',	'Абдуллаевич',	1,	'12.18.2000',	44,	NULL,	NULL);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'MadHowl',	'madhowl@yandex.ru',	NULL,	'$2y$10$O/5Oxl8npfYqsMqj2QqPReqIkMtV/KDbSYZiHq1stV/k4pf9R0tLG',	'xKpliLhaCHBCrlUu3dzgHzk1asJ7VxwTJWLsX7o2zYu3usGNexrzQsuSfRN5',	'2018-11-13 05:14:21',	'2018-11-13 05:14:21');

-- 2018-11-16 04:55:12
