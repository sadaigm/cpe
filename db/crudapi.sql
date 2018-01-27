-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2018 at 09:55 AM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crudapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `bh_tasks`
--

CREATE TABLE IF NOT EXISTS `bh_tasks` (
  `id` int(11) NOT NULL,
  `task` varchar(200) NOT NULL,
  `status` varchar(11) NOT NULL,
  `created_at` varchar(11) NOT NULL,
  `duedate` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1225 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bh_tasks`
--

INSERT INTO `bh_tasks` (`id`, `task`, `status`, `created_at`, `duedate`) VALUES
(1, 'My first task', '2', '1390815970', NULL),
(2, 'Perform unit testing', '2', '1390815993', NULL),
(3, 'Find bugs', '2', '1390817659', NULL),
(4, 'develop in small devices', 'Inactive', 'sunday', '2017-10-15'),
(9, 'sasa', '0', '1506964101', '2017-10-10'),
(11, 'sampletask1', '25', 'sunday', '2017-10-10'),
(12, 'sampletask1', 'Inactive', 'sunday', '2017-10-10'),
(13, 'sampletask111', 'Inactive', 'sunday', '2017-10-10'),
(15, 'sampleadd', '25', 'monday', '2017-10-10'),
(16, 'sampleadd', '25', 'monday', '2017-10-10'),
(122, 'sampl9090add', '25', 'monday', '2017-10-10'),
(1221, 'sampleadd', '25', 'monday', '2017-10-10'),
(1222, 'sampleadd', '25', 'monday', '2017-10-10'),
(1223, 'sampleadd', '25', 'monday', '2017-10-10'),
(1224, 'sampleadd', '25', 'monday', '2017-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `bh_users`
--

CREATE TABLE IF NOT EXISTS `bh_users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bh_users`
--

INSERT INTO `bh_users` (`id`, `username`, `password`, `updated_dt`) VALUES
(1, 'sadai', 'sadai', '2017-12-27 18:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `bh_users_session`
--

CREATE TABLE IF NOT EXISTS `bh_users_session` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `token` text NOT NULL,
  `created_timestamp` timestamp NULL DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bh_users_session`
--

INSERT INTO `bh_users_session` (`id`, `username`, `token`, `created_timestamp`, `status`) VALUES
(1, 'sadai', '55d097c9c5f14cb22fb3a48d0dd6f5ab', '0000-00-00 00:00:00', ''),
(2, 'sadai', '10959d1e29895f0e96b37d1c5721e93b', '2018-01-09 18:52:08', ''),
(3, 'sadai', '739aed2a39bccd8bba9f702dc7a8d1e0', '2018-01-10 16:21:48', ''),
(4, 'sadai', '2d560e0ef3dbb99a036a805b1cb9b279', '2018-01-12 05:01:27', '');

-- --------------------------------------------------------

--
-- Table structure for table `bh_user_master`
--

CREATE TABLE IF NOT EXISTS `bh_user_master` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` text NOT NULL,
  `register_date` datetime NOT NULL,
  `register_ipaddress` varchar(40) NOT NULL,
  `user_type` int(1) NOT NULL COMMENT '0:user,1: admin',
  `active_status` int(1) NOT NULL COMMENT '0:inactive, 1:active',
  `verify_code` varchar(100) NOT NULL,
  `verify_status` int(1) NOT NULL COMMENT '0:Pending, 1:Verified'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bh_user_master`
--

INSERT INTO `bh_user_master` (`user_id`, `firstname`, `lastname`, `email`, `password`, `register_date`, `register_ipaddress`, `user_type`, `active_status`, `verify_code`, `verify_status`) VALUES
(1, 'Jack', 'Thomas', 'gg@gg.com', 'QmhBckF0MzgzUEFybUFyMTIzNDU2', '2017-10-30 02:58:50', '::1', 0, 0, '', 0),
(2, 'Jack', 'Thomas', 'jackthomas@hmail.com', 'QmhBckF0MzgzUEFybUFyMTIzNDU2', '2017-10-30 03:01:34', '::1', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `created_at`, `updated_at`) VALUES
(1, 'Codeigniter Rest API', 'Momo Baruno', '2015-12-26 09:17:14', '2015-12-26 09:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `ci_news`
--

CREATE TABLE IF NOT EXISTS `ci_news` (
  `ne_id` int(11) NOT NULL,
  `ne_title` varchar(300) NOT NULL,
  `ne_desc` text NOT NULL COMMENT 'نص الخبر',
  `ne_img` varchar(255) NOT NULL,
  `ne_lang` varchar(2) NOT NULL,
  `ne_created` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_news`
--

INSERT INTO `ci_news` (`ne_id`, `ne_title`, `ne_desc`, `ne_img`, `ne_lang`, `ne_created`) VALUES
(38, 'Climate predicts bird populations', 'Populations of the most common bird species in Europe and the US are being altered by climate change, according to an international study.\nFor the first time researchers showed climate to be having a similar, significant impact on bird populations in large, distant areas of the world.\nTheir study used population-predicting models and three decades of field data, gathered by bird-watching volunteers.\nThe findings are published in the journal Science.\nLed by Durham University scientists, the team developed models that related each species'' habitat to long-term climate patterns.\nUsing annual climate records - from 1980 to 2010 - these models were able to predict where a species had experienced an improvement or a decline in suitable climate.', 'bird.jpg', 'en', '1459435234'),
(39, 'Google April Fool Gmail button sparks backlash', 'Google has removed an April Fool''s Gmail button, which sent a comical animation to recipients, after reports of people getting into trouble at work.', 'google_splash.jpg', 'en', '1459435249'),
(44, 'las poblaciones de aves de predicción del clima', 'Las poblaciones de las especies de aves más comunes en Europa y los EE.UU. están siendo alterados por el cambio climático, según un estudio internacional.\r\nPor primera vez, los investigadores mostraron que el clima puede tener un impacto similar, significativo sobre las poblaciones de aves en áreas grandes y distantes del mundo.\r\nEl estudio utiliza modelos de población-y la predicción de tres décadas de datos de campo recogidos por los voluntarios, la observación de aves.\r\nLos resultados se publican en la revista Science.\r\nDirigido por científicos de la Universidad de Durham, el equipo desarrolló modelos que relacionan el hábitat de cada especie a los patrones climáticos a largo plazo.\r\nEl uso de registros climáticos anuales - 1980-2010 - estos modelos fueron capaces de predecir donde una especie había experimentado una mejora o una disminución en el clima adecuado.', 'fa700191093777838ffbeca963d41b4d.jpg', 'es', '1475934784'),
(45, 'les populations d''oiseaux de prévision climatique', 'Les populations d''espèces d''oiseaux les plus communs en Europe et aux États-Unis sont modifiés par le changement climatique, selon une étude internationale.\r\nPour la première fois, des chercheurs ont montré le climat à avoir une incidence significative similaire sur les populations d''oiseaux dans de vastes zones, éloignées du monde.\r\nLeur étude a utilisé des modèles de population prédire et trois décennies de données sur le terrain, recueillies par des volontaires d''observation des oiseaux.\r\nLes résultats sont publiés dans la revue Science.\r\nDirigée par des scientifiques de l''Université de Durham, l''équipe a développé des modèles qui ont trait l''habitat de chaque espèce à des modèles climatiques à long terme.\r\nUtilisation de dossiers annuels climatiques - 1980-2010 - ces modèles ont été en mesure de prédire où une espèce a connu une amélioration ou une baisse dans le climat approprié.', '8556a9d28221b7d6b65f5abac3f84d97.jpg', 'fr', '1475934877'),
(46, 'Loco Google Gmail abril botón chispas reacción violenta', 'Google ha eliminado el botón de Gmail de los Inocentes, que envió una animación cómica a los destinatarios, después de los informes de las personas que reciben en problemas en el trabajo.\r\nEl botón apareció junto botón enviar normales de Gmail y permitía a los usuarios a cerrar un hilo de correo electrónico mediante el envío de un gif de un Minion dejando caer un micrófono.\r\nSin embargo, una serie de quejas sobre el botón apareció en los foros de Google.\r\nya que la firma ha retirado la función y se disculpó.', 'f3307816af8e0a8337338187afbd79a8.jpg', 'es', '1475934964'),
(47, 'Gmail Google Avril bouton Fool étincelles jeu', 'Google a supprimé le bouton Gmail un poisson d''Avril, qui a envoyé une animation comique à des destinataires, après des rapports des gens en difficulté au travail.\r\nLe bouton à côté de Apparue bouton d''envoi standard de Gmail et a permis aux utilisateurs de fermer un fil de courriel en envoyant un gif d''un Minion laisser tomber un microphone.\r\nCependant, une avalanche de plaintes au sujet du bouton est apparu sur les forums de Google.\r\nLa firme a depuis retiré la fonction et se sont excusés.', '4db683628d646549b296c0e3c27268bc.jpg', 'fr', '1475935037'),
(48, 'ரெயில் படியில் நின்று பயணம் செய்தால் பாஸ் சலுகை ரத்து சென்னை', 'ரயில் படிக்கட்டுகளில் பயணம் செய்யும் கல்லூரி மாணவர்களின் பயண அட்டை ரத்து செய்யப்படும் என எச்சரிக்கை விடுக்கப்பட்டுள்ளது. இதனை தெற்கு ரயில்வே கோட்ட பாதுகாப்பு ஆணையர் லூயிஸ் அமுதன் தெரிவித்துள்ளார். மாணவர்களின் மீது கல்லூரி நிர்வாகம் நடவடிக்கை எடுக்க வேண்டும் என லூயிஸ் அமுதன் வேண்டுகோள் விடுத்துள்ளார்.', '', 'tn', '');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('86f1f99c2ebc2dc6bd315e5f49901ba53a496864', '::1', 1513799761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333739393530303b6c616e677c733a323a22656e223b),
('f037e37d8c75bc94eb7221e309394406f4625b50', '::1', 1514908311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343930383331313b6c616e677c733a323a22656e223b),
('e990bb0d91c6b9437f201f49b10c62bda393a51a', '::1', 1514909014, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343930393031343b6c616e677c733a323a226672223b),
('b671b5a8f762e499e0782a064b108131b3e2bf53', '::1', 1514909316, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343930393331363b6c616e677c733a323a22656e223b),
('8db5c1a3a539c06b7006e2350fd5b7f1c015a52d', '::1', 1514909691, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343930393639313b6c616e677c733a323a226573223b),
('27ac77fb11606ddbf1bad6e82de45d61eff254dc', '::1', 1514910042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343931303034323b6c616e677c733a323a226573223b),
('d61e69f6af7a6c9e7d2efe35c1308de7305778a4', '::1', 1514910374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343931303337343b6c616e677c733a323a226573223b),
('86eceb1c6c350574200d1ca88316ec7c0e2adcb5', '::1', 1514910990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343931303939303b6c616e677c733a323a226573223b),
('03a34a60b884ecf9c93d7634521bf94fe38eee5b', '::1', 1514921123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343932313132333b6c616e677c733a323a226573223b),
('b587cfbb0639a1f9213dc7cf09207767749b97ef', '::1', 1514921198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343932313132333b6c616e677c733a323a226573223b);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `item_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit_measurement` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` decimal(10,0) NOT NULL,
  `totalamount` decimal(10,2) NOT NULL,
  `user` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `description`, `item_type`, `price`, `unit_measurement`, `quantity`, `totalamount`, `user`, `created_at`, `updated_at`) VALUES
(2, 'CountryMilk', 'CountryMilk', 'dairy', '4.00', 'Litre', '50', '200.00', 'hello', NULL, NULL),
(3, 'kkr1', 'kkr1', 'cos', '222.00', 'Nos', '1', '0.00', 'hello', NULL, NULL),
(4, 'kkr2', 'kkr2', 'dairy', '1.00', 'Litre', '12', '0.00', 'hello', NULL, NULL),
(5, 'q3', 'q3', 'Mobile', '5000.00', 'Nos', '1', '0.00', 'hello', NULL, NULL),
(8, 'sample1', 'sample1', 'cos', '12.00', 'Gram', '6', '0.00', 'hello', NULL, NULL),
(9, 'CountryMilk1', 'CountryMilk1', 'dairy', '20.00', 'Litre', '1', '0.00', 'hello', NULL, NULL),
(10, 'Yamaha Brake shoe', 'Bike Accessories', 'Motor Accessories', '200.00', 'Nos', '1', '200.00', 'sadai', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `project_code` varchar(100) NOT NULL,
  `total_hrs` int(11) NOT NULL,
  `week_friday_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `username`, `project_code`, `total_hrs`, `week_friday_date`) VALUES
(102, 'sadai', 'port', 14, '2017-12-08'),
(103, 'sadai', 'host', 32, '2017-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_entry`
--

CREATE TABLE IF NOT EXISTS `purchase_entry` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_idfk` int(11) NOT NULL,
  `item_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `purchasedate` date NOT NULL,
  `quantity` decimal(10,0) NOT NULL,
  `purchase_amount` decimal(10,2) NOT NULL,
  `user` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase_entry`
--

INSERT INTO `purchase_entry` (`id`, `title`, `item_idfk`, `item_type`, `price`, `purchasedate`, `quantity`, `purchase_amount`, `user`, `created_at`, `updated_at`) VALUES
(8, 'CountryMilk', 2, 'dairy', '55.25', '2018-01-01', '53', '2928.25', 'hello', '2018-01-24 04:19:31', NULL),
(10, 'CountryMilk', 2, 'dairy', '4.00', '2018-01-24', '50', '200.00', 'hello', '2018-01-24 04:47:38', NULL),
(11, 'CountryMilk', 2, 'dairy', '4.00', '2018-01-02', '500', '2000.00', 'hello', '2018-01-24 17:00:47', NULL),
(12, 'kkr2', 0, 'tt', '78.00', '2018-01-11', '89', '6942.00', 'hello', NULL, NULL),
(13, 'q3', 5, 'Mobile', '5000.00', '2018-01-10', '10', '50000.00', 'hello', NULL, NULL),
(14, 'Yamaha Brake shoe', 10, 'Motor Accessories', '200.00', '2018-01-03', '5', '1000.00', 'sadai', '2018-01-27 08:24:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timesheet`
--

CREATE TABLE IF NOT EXISTS `timesheet` (
  `id` int(11) NOT NULL,
  `project_code` varchar(50) NOT NULL,
  `project_fk` int(11) NOT NULL,
  `week_friday_date` date NOT NULL,
  `username` varchar(20) NOT NULL,
  `hours` int(11) NOT NULL,
  `comments` varchar(2000) NOT NULL,
  `date` date NOT NULL,
  `day` varchar(15) NOT NULL,
  `leave_day` varchar(5) NOT NULL,
  `holiday` varchar(5) NOT NULL,
  `last_updated_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=645 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timesheet`
--

INSERT INTO `timesheet` (`id`, `project_code`, `project_fk`, `week_friday_date`, `username`, `hours`, `comments`, `date`, `day`, `leave_day`, `holiday`, `last_updated_dt`) VALUES
(631, 'port', 102, '2017-12-08', 'sadai', 0, '', '2017-12-02', 'SATURDAY', 'N', 'Y', '2017-12-04 16:33:26'),
(632, 'port', 102, '2017-12-08', 'sadai', 3, '', '2017-12-03', 'SUNDAY', 'N', 'N', '2017-12-04 16:33:26'),
(633, 'port', 102, '2017-12-08', 'sadai', 3, '', '2017-12-04', 'MONDAY', 'N', 'N', '2017-12-04 16:33:26'),
(634, 'port', 102, '2017-12-08', 'sadai', 0, '', '2017-12-05', 'TUESDAY', 'Y', 'N', '2017-12-04 16:33:26'),
(635, 'port', 102, '2017-12-08', 'sadai', 3, '', '2017-12-06', 'WEDNESDAY', 'N', 'N', '2017-12-04 16:33:26'),
(636, 'port', 102, '2017-12-08', 'sadai', 3, '', '2017-12-07', 'THURSDAY', 'N', 'N', '2017-12-04 16:33:26'),
(637, 'port', 102, '2017-12-08', 'sadai', 2, '', '2017-12-08', 'FRIDAY', 'N', 'N', '2017-12-04 16:33:26'),
(638, 'host', 103, '2017-12-08', 'sadai', 0, '', '2017-12-02', 'SATURDAY', 'N', 'Y', '2017-12-04 16:33:26'),
(639, 'host', 103, '2017-12-08', 'sadai', 8, '', '2017-12-03', 'SUNDAY', 'N', 'N', '2017-12-04 16:33:26'),
(640, 'host', 103, '2017-12-08', 'sadai', 0, '', '2017-12-04', 'MONDAY', 'N', 'N', '2017-12-04 16:33:26'),
(641, 'host', 103, '2017-12-08', 'sadai', 0, '', '2017-12-05', 'TUESDAY', 'Y', 'N', '2017-12-04 16:33:26'),
(642, 'host', 103, '2017-12-08', 'sadai', 6, '', '2017-12-06', 'WEDNESDAY', 'N', 'N', '2017-12-04 16:33:26'),
(643, 'host', 103, '2017-12-08', 'sadai', 0, '', '2017-12-07', 'THURSDAY', 'N', 'N', '2017-12-04 16:33:26'),
(644, 'host', 103, '2017-12-08', 'sadai', 18, '', '2017-12-08', 'FRIDAY', 'N', 'N', '2017-12-04 16:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `name`, `last_login`, `created_at`, `updated_at`) VALUES
(5, 'sadai', '$2y$10$2Oen2i2nME/GppVCAD8AzOg.wX8R05Az0WBbL32CB0NdUvjxtEH.K', 'customer', 'sadai', '2018-01-27 13:55:42', '2018-01-27 13:47:00', '2018-01-27 13:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `users_authentication`
--

CREATE TABLE IF NOT EXISTS `users_authentication` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expired_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_authentication`
--

INSERT INTO `users_authentication` (`id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES
(86, 5, 'sijsHqpWa1cgw', '2018-01-28 01:54:25', '2018-01-27 13:49:24', '2018-01-27 13:54:25'),
(87, 5, 'siymI3aOpxEGM', '2018-01-28 01:55:42', '2018-01-27 13:55:42', '2018-01-27 13:55:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bh_tasks`
--
ALTER TABLE `bh_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bh_users`
--
ALTER TABLE `bh_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `bh_users_session`
--
ALTER TABLE `bh_users_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bh_user_master`
--
ALTER TABLE `bh_user_master`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_news`
--
ALTER TABLE `ci_news`
  ADD PRIMARY KEY (`ne_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`project_code`,`week_friday_date`);

--
-- Indexes for table `purchase_entry`
--
ALTER TABLE `purchase_entry`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_idfk` (`item_idfk`,`purchasedate`);

--
-- Indexes for table `timesheet`
--
ALTER TABLE `timesheet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_code` (`project_code`,`username`,`date`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `users_authentication`
--
ALTER TABLE `users_authentication`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bh_tasks`
--
ALTER TABLE `bh_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1225;
--
-- AUTO_INCREMENT for table `bh_users`
--
ALTER TABLE `bh_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bh_users_session`
--
ALTER TABLE `bh_users_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bh_user_master`
--
ALTER TABLE `bh_user_master`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ci_news`
--
ALTER TABLE `ci_news`
  MODIFY `ne_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `purchase_entry`
--
ALTER TABLE `purchase_entry`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `timesheet`
--
ALTER TABLE `timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=645;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users_authentication`
--
ALTER TABLE `users_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
