-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2018 at 05:47 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

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

CREATE TABLE `bh_tasks` (
  `id` int(11) NOT NULL,
  `task` varchar(200) NOT NULL,
  `status` varchar(11) NOT NULL,
  `created_at` varchar(11) NOT NULL,
  `duedate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `bh_users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bh_users`
--

INSERT INTO `bh_users` (`id`, `username`, `password`, `updated_dt`) VALUES
(1, 'sadai', 'sadai', '2017-12-27 18:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `bh_users_session`
--

CREATE TABLE `bh_users_session` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `token` text NOT NULL,
  `created_timestamp` timestamp NULL DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `bh_user_master` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `created_at`, `updated_at`) VALUES
(1, 'Codeigniter Rest API', 'Momo Baruno', '2015-12-26 09:17:14', '2015-12-26 09:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `ci_news`
--

CREATE TABLE `ci_news` (
  `ne_id` int(11) NOT NULL,
  `ne_title` varchar(300) NOT NULL,
  `ne_desc` text NOT NULL COMMENT 'نص الخبر',
  `ne_img` varchar(255) NOT NULL,
  `ne_lang` varchar(2) NOT NULL,
  `ne_created` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
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

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `description`, `item_type`, `price`, `unit_measurement`, `quantity`, `totalamount`, `user`, `created_at`, `updated_at`) VALUES
(2, 'CountryMilk', 'CountryMilk', 'dairy', '4.00', 'Litre', '50', '200.00', 'hello', NULL, NULL),
(3, 'kkr1', 'kkr1', 'cos', '222.00', 'Nos', '1', '0.00', 'hello', NULL, NULL),
(4, 'kkr2', 'kkr2', 'dairy', '1.00', 'Litre', '12', '0.00', 'hello', NULL, NULL),
(5, 'q3', 'q3', 'Mobile', '5000.00', 'Nos', '1', '0.00', 'hello', NULL, NULL),
(8, 'sample1', 'sample1', 'cos', '12.00', 'Gram', '6', '0.00', 'hello', NULL, NULL),
(9, 'CountryMilk1', 'CountryMilk1', 'dairy', '20.00', 'Litre', '1', '0.00', 'hello', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `project_code` varchar(100) NOT NULL,
  `total_hrs` int(11) NOT NULL,
  `week_friday_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `purchase_entry` (
  `id` int(10) UNSIGNED NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase_entry`
--

INSERT INTO `purchase_entry` (`id`, `title`, `item_idfk`, `item_type`, `price`, `purchasedate`, `quantity`, `purchase_amount`, `user`, `created_at`, `updated_at`) VALUES
(8, 'CountryMilk', 2, 'dairy', '4.00', '2018-01-01', '50', '200.00', 'hello', '2018-01-24 04:19:31', NULL),
(10, 'CountryMilk', 2, 'dairy', '4.00', '2018-01-24', '50', '200.00', 'hello', '2018-01-24 04:47:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timesheet`
--

CREATE TABLE `timesheet` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `name`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$1$Dtqyvz7/$wZSaZbfHgn0UbLlVi1HHp0', 'admin', 'Admin', '2018-01-13 13:54:11', '2015-12-25 10:35:16', '2015-12-25 10:35:16'),
(2, 'demo', 'siGJzYXnzU9Ww', 'customer', 'demo', '2018-01-16 09:40:35', '2018-01-13 14:58:30', '2018-01-13 14:58:30'),
(3, 'demo', 'siGJzYXnzU9Ww', '', 'demo', '2018-01-13 14:58:33', '2018-01-13 14:58:33', '2018-01-13 14:58:33'),
(4, 'hello', 'siUx6wZJz6iH6', 'customer', 'hello', '2018-01-24 09:34:04', '2018-01-13 15:35:56', '2018-01-13 15:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `users_authentication`
--

CREATE TABLE `users_authentication` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expired_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_authentication`
--

INSERT INTO `users_authentication` (`id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES
(1, 1, '$1$6fjNSBRR$7lx.mxo/q1LbNO7f5.7w8.', '2015-12-27 23:28:00', '2015-12-27 11:28:00', '2015-12-27 11:28:00'),
(2, 1, '$1$HY2H7rB0$2U.dlCsoHX21s/gvjCypG/', '2018-01-14 01:11:52', '2015-12-27 11:28:10', '2018-01-13 13:11:52'),
(3, 1, '$1$574.od0.$6NESBQ0wn6iHJSa/Tuep50', '2018-01-14 01:54:11', '2018-01-13 13:54:11', '2018-01-13 13:54:11'),
(4, 2, '$1$zA3.AE3.$ooA.6t7nBDymPgIpZKxsZ1', '2018-01-14 03:00:02', '2018-01-13 15:00:02', '2018-01-13 15:00:02'),
(5, 2, '$1$PF4.sH0.$vXsqAgeUNBnvcVTCHOnoK0', '2018-01-14 03:08:03', '2018-01-13 15:08:03', '2018-01-13 15:08:03'),
(6, 4, '$1$ny2.kZ0.$7PUcJBVZXtI.bODlU7w2V0', '2018-01-14 03:37:25', '2018-01-13 15:37:25', '2018-01-13 15:37:25'),
(7, 4, 'sikDxBdoZZWM.', '2018-01-14 03:39:10', '2018-01-13 15:39:10', '2018-01-13 15:39:10'),
(8, 4, 'si8n6bcxhgXGU', '2018-01-14 05:32:09', '2018-01-13 15:39:55', '2018-01-13 17:32:09'),
(9, 4, 'sif8sqM4bnqRs', '2018-01-14 05:33:08', '2018-01-13 17:33:00', '2018-01-13 17:33:08'),
(10, 4, 'sikCGMyGGpkvw', '2018-01-14 10:29:16', '2018-01-13 17:40:24', '2018-01-13 22:29:16'),
(11, 4, 'sid.yd90ktt2Q', '2018-01-16 10:52:37', '2018-01-15 22:52:35', '2018-01-15 22:52:37'),
(12, 4, 'sieLiDy9g8pZM', '2018-01-16 11:40:49', '2018-01-15 22:55:02', '2018-01-15 23:40:49'),
(13, 4, 'siHj07a4IJkOk', '2018-01-16 21:30:16', '2018-01-16 09:29:19', '2018-01-16 09:30:16'),
(14, 2, 'siNcsfH2a.aDs', '2018-01-16 21:40:35', '2018-01-16 09:40:35', '2018-01-16 09:40:35'),
(15, 4, 'siTe8M8j6xSvU', '2018-01-16 22:24:38', '2018-01-16 10:24:29', '2018-01-16 10:24:38'),
(16, 4, 'siiKqz45Ypn6A', '2018-01-16 22:27:37', '2018-01-16 10:27:34', '2018-01-16 10:27:37'),
(17, 4, 'siOWZPHJfiuNI', '2018-01-16 22:31:49', '2018-01-16 10:31:05', '2018-01-16 10:31:49'),
(18, 4, 'sij9GS5bJgbbw', '2018-01-16 22:36:06', '2018-01-16 10:32:40', '2018-01-16 10:36:06'),
(19, 4, 'siY8qVHNbpPZE', '2018-01-16 22:43:02', '2018-01-16 10:42:52', '2018-01-16 10:43:02'),
(20, 4, 'siRlFSgKsSYdI', '2018-01-17 12:03:04', '2018-01-16 23:59:26', '2018-01-17 00:03:04'),
(21, 4, 'siQpOd1EB2Nmc', '2018-01-17 12:13:08', '2018-01-17 00:09:47', '2018-01-17 00:13:08'),
(22, 4, 'sir/jMEEQR8Cc', '2018-01-17 12:30:09', '2018-01-17 00:21:01', '2018-01-17 00:30:09'),
(23, 4, 'sid54V2G.W1A6', '2018-01-17 12:41:34', '2018-01-17 00:31:39', '2018-01-17 00:41:34'),
(24, 4, 'siAAoI7CgKn1U', '2018-01-17 12:51:14', '2018-01-17 00:42:21', '2018-01-17 00:51:14'),
(25, 4, 'sib90K8V.u2uc', '2018-01-17 13:02:07', '2018-01-17 00:56:21', '2018-01-17 01:02:07'),
(26, 4, 'siYTfxo9oPwGc', '2018-01-17 13:10:24', '2018-01-17 01:06:52', '2018-01-17 01:10:24'),
(27, 4, 'si6kcPUpsqjTE', '2018-01-17 15:52:08', '2018-01-17 03:42:12', '2018-01-17 03:52:08'),
(28, 4, 'si0chXt2pBQKU', '2018-01-17 16:02:20', '2018-01-17 03:52:53', '2018-01-17 04:02:20'),
(29, 4, 'siKRx4tcTbVx.', '2018-01-17 16:42:11', '2018-01-17 04:04:42', '2018-01-17 04:42:11'),
(30, 4, 'siYK8oqFkyi3c', '2018-01-17 22:26:59', '2018-01-17 09:27:00', '2018-01-17 10:26:59'),
(31, 4, 'sivo0F3qjBwio', '2018-01-17 23:31:38', '2018-01-17 11:29:01', '2018-01-17 11:31:38'),
(32, 4, 'siscLy06jRE6o', '2018-01-18 11:06:56', '2018-01-17 22:58:33', '2018-01-17 23:06:56'),
(33, 4, 'siEt1RcauRiEo', '2018-01-18 11:53:22', '2018-01-17 23:27:18', '2018-01-17 23:53:22'),
(34, 4, 'sirB3c5zqtKDk', '2018-01-18 21:53:40', '2018-01-18 09:02:09', '2018-01-18 09:53:40'),
(35, 4, 'siPHsRfS30GUg', '2018-01-18 22:19:04', '2018-01-18 10:01:16', '2018-01-18 10:19:04'),
(36, 4, 'sizgjH/861Ug2', '2018-01-18 22:17:23', '2018-01-18 10:03:49', '2018-01-18 10:17:23'),
(37, 4, 'siiQS2oiZid3M', '2018-01-19 13:27:33', '2018-01-19 00:29:31', '2018-01-19 01:27:33'),
(38, 4, 'siMx6IF4m6bK2', '2018-01-19 14:32:04', '2018-01-19 01:32:27', '2018-01-19 02:32:04'),
(39, 4, 'siiGigvXWOZl6', '2018-01-19 14:08:15', '2018-01-19 01:35:13', '2018-01-19 02:08:15'),
(40, 4, 'sihBAPtlUWV0w', '2018-01-19 14:47:43', '2018-01-19 02:33:40', '2018-01-19 02:47:43'),
(41, 4, 'siqblhNClc5QY', '2018-01-19 14:50:49', '2018-01-19 02:38:24', '2018-01-19 02:50:49'),
(42, 4, 'si2JUytrxgm9M', '2018-01-20 12:43:16', '2018-01-20 00:40:23', '2018-01-20 00:43:16'),
(43, 4, 'silpFHdQbkPhE', '2018-01-20 12:43:28', '2018-01-20 00:42:17', '2018-01-20 00:43:28'),
(44, 4, 'sii2ws11NCjcY', '2018-01-21 09:43:02', '2018-01-20 21:43:01', '2018-01-20 21:43:02'),
(45, 4, 'sieDjHN5OCZXo', '2018-01-21 11:36:16', '2018-01-20 23:36:16', '2018-01-20 23:36:16'),
(46, 4, 'siFeI4QWjQgOg', '2018-01-21 11:38:08', '2018-01-20 23:38:08', '2018-01-20 23:38:08'),
(47, 4, 'siXwX2zUAZYZA', '2018-01-22 06:55:03', '2018-01-21 18:55:03', '2018-01-21 18:55:03'),
(48, 4, 'si/Tx96K.0eZw', '2018-01-22 06:55:55', '2018-01-21 18:55:55', '2018-01-21 18:55:55'),
(49, 4, 'sipAYcsA.1daE', '2018-01-22 06:58:23', '2018-01-21 18:58:23', '2018-01-21 18:58:23'),
(50, 4, 'sinuYh0fZtlIc', '2018-01-22 07:04:07', '2018-01-21 19:04:07', '2018-01-21 19:04:07'),
(51, 4, 'siSyK8qQaD4SU', '2018-01-22 07:07:13', '2018-01-21 19:07:10', '2018-01-21 19:07:13'),
(52, 4, 'si52Ba5vpExeo', '2018-01-22 07:09:42', '2018-01-21 19:09:40', '2018-01-21 19:09:42'),
(53, 4, 'sigyvxyADk.K.', '2018-01-22 07:15:14', '2018-01-21 19:10:44', '2018-01-21 19:15:14'),
(54, 4, 'siiZfef5UOm4U', '2018-01-22 07:15:38', '2018-01-21 19:15:36', '2018-01-21 19:15:38'),
(55, 4, 'siL.k9CeajHjM', '2018-01-22 07:15:59', '2018-01-21 19:15:54', '2018-01-21 19:15:59'),
(56, 4, 'siSl7bNDsF9Uc', '2018-01-22 07:19:13', '2018-01-21 19:16:35', '2018-01-21 19:19:13'),
(57, 4, 'si15WFtiH2MVo', '2018-01-22 07:20:40', '2018-01-21 19:19:28', '2018-01-21 19:20:40'),
(58, 4, 'siQ4PxB3fdXBc', '2018-01-22 08:07:51', '2018-01-21 20:05:04', '2018-01-21 20:07:51'),
(59, 4, 'si3a3/gAQ.de6', '2018-01-22 10:13:31', '2018-01-21 21:48:23', '2018-01-21 22:13:31'),
(60, 4, 'sih.sVMIwlQC2', '2018-01-22 11:15:22', '2018-01-21 22:21:00', '2018-01-21 23:15:22'),
(61, 4, 'sifyH2X9LpX0.', '2018-01-22 11:17:32', '2018-01-21 23:15:45', '2018-01-21 23:17:32'),
(62, 4, 'si7bd0ezQzj/.', '2018-01-22 11:18:55', '2018-01-21 23:18:16', '2018-01-21 23:18:55'),
(63, 4, 'siI1KRz18YCvY', '2018-01-22 11:21:18', '2018-01-21 23:19:08', '2018-01-21 23:21:18'),
(64, 4, 'si5o.zWGZ.x.Y', '2018-01-22 12:17:21', '2018-01-21 23:21:32', '2018-01-22 00:17:21'),
(65, 4, 'siN8olBCwD6SA', '2018-01-22 12:35:37', '2018-01-22 00:34:32', '2018-01-22 00:35:37'),
(66, 4, 'sixfS/VqtqkzY', '2018-01-22 13:29:52', '2018-01-22 00:35:54', '2018-01-22 01:29:52'),
(67, 4, 'siNLJ0114u4wk', '2018-01-22 13:34:06', '2018-01-22 01:16:34', '2018-01-22 01:34:06'),
(68, 4, 'si4LCKtCEH8hA', '2018-01-23 20:18:35', '2018-01-23 08:04:56', '2018-01-23 08:18:35'),
(69, 4, 'sitTnW.48d3Lk', '2018-01-23 21:21:13', '2018-01-23 08:22:56', '2018-01-23 09:21:13'),
(70, 4, 'siQ9yHwlyr82o', '2018-01-23 20:27:56', '2018-01-23 08:25:07', '2018-01-23 08:27:56'),
(71, 4, 'siS6Rc/NjH4KA', '2018-01-23 22:09:19', '2018-01-23 09:23:42', '2018-01-23 10:09:19'),
(72, 4, 'si2dqrbCsTJZ.', '2018-01-24 20:18:20', '2018-01-24 07:20:08', '2018-01-24 08:18:20'),
(73, 4, 'sivkRdb6SD33c', '2018-01-24 21:18:42', '2018-01-24 08:22:37', '2018-01-24 09:18:42'),
(74, 4, 'si4wkznGa/NgU', '2018-01-24 22:18:23', '2018-01-24 09:34:04', '2018-01-24 10:18:23');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1225;
--
-- AUTO_INCREMENT for table `bh_users`
--
ALTER TABLE `bh_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bh_users_session`
--
ALTER TABLE `bh_users_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bh_user_master`
--
ALTER TABLE `bh_user_master`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ci_news`
--
ALTER TABLE `ci_news`
  MODIFY `ne_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `purchase_entry`
--
ALTER TABLE `purchase_entry`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `timesheet`
--
ALTER TABLE `timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=645;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_authentication`
--
ALTER TABLE `users_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
