-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `coralcove`
--

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- dump ตาราง `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('e20ca02c9f05e69f6f5220a2a5c668f7', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1429176741, 'a:4:{s:9:"user_data";s:0:"";s:8:"id_admin";s:1:"1";s:9:"user_name";s:5:"admin";s:10:"id_profile";s:1:"1";}'),
('58207ac7cc2b0887eff5eb7012b76a32', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1429176574, 'a:4:{s:9:"user_data";s:0:"";s:8:"id_admin";s:1:"1";s:9:"user_name";s:5:"admin";s:10:"id_profile";s:1:"1";}'),
('7b374a37da6b0a80fceeda1f09ace992', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1429176741, ''),
('80ac427caffb8df7e0aab9ec9437d93d', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1429176059, 'a:3:{s:8:"id_admin";s:1:"1";s:9:"user_name";s:5:"admin";s:10:"id_profile";s:1:"1";}'),
('5312e0f23a276e773605badce7455653', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1429175277, 'a:4:{s:9:"user_data";s:0:"";s:8:"id_admin";s:1:"1";s:9:"user_name";s:5:"admin";s:10:"id_profile";s:1:"1";}'),
('57dc6de18b7bc9c8925fa03eb29d3ddc', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1429179764, 'a:4:{s:9:"user_data";s:0:"";s:8:"id_admin";s:1:"1";s:9:"user_name";s:5:"admin";s:10:"id_profile";s:1:"1";}'),
('55fa00a97b8e3f781fa3dd181874e799', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1429179764, ''),
('74f6412c9096042c30cab5e26ce0f955', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1429179764, 'a:5:{s:9:"user_data";s:0:"";s:8:"id_admin";s:1:"1";s:9:"user_name";s:5:"admin";s:10:"id_profile";s:1:"1";s:4:"lang";s:7:"english";}');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `tbl_access`
--

CREATE TABLE IF NOT EXISTS `tbl_access` (
  `id_access` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT '0',
  `add` tinyint(1) NOT NULL DEFAULT '0',
  `edit` tinyint(1) NOT NULL DEFAULT '0',
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  `print` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_access`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- dump ตาราง `tbl_access`
--

INSERT INTO `tbl_access` (`id_access`, `id_menu`, `id_profile`, `view`, `add`, `edit`, `delete`, `print`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `tbl_accommodation`
--

CREATE TABLE IF NOT EXISTS `tbl_accommodation` (
  `id_accommodation` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `max_person` tinyint(2) NOT NULL,
  `max_child` tinyint(2) NOT NULL,
  `price_from` decimal(17,2) NOT NULL,
  `description` text NOT NULL,
  `id_type` int(11) NOT NULL,
  PRIMARY KEY (`id_accommodation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `tbl_admin`
--

CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `supper_admin` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- dump ตาราง `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `id_employee`, `id_profile`, `user_name`, `password`, `supper_admin`, `active`, `last_login`) VALUES
(1, 1, 1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `tbl_config`
--

CREATE TABLE IF NOT EXISTS `tbl_config` (
  `id_config` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `date_upd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_config`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- dump ตาราง `tbl_config`
--

INSERT INTO `tbl_config` (`id_config`, `config_name`, `value`, `id_employee`, `date_upd`) VALUES
(1, 'ALLOW_UNDER_ZERO', '0', 1, '2015-04-08 08:54:16'),
(2, 'MULTI_LANG', '1', 1, '2015-04-09 04:58:29');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `tbl_employee`
--

CREATE TABLE IF NOT EXISTS `tbl_employee` (
  `id_employee` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `post_code` varchar(12) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `birthday` date NOT NULL,
  `start_date` date NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_employee`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- dump ตาราง `tbl_employee`
--

INSERT INTO `tbl_employee` (`id_employee`, `code`, `first_name`, `last_name`, `address1`, `address2`, `post_code`, `phone`, `email`, `birthday`, `start_date`, `date_add`, `date_upd`, `active`) VALUES
(1, 'KM001', 'สุทัศ', 'สังข์สวัสดิ์', '75/65 หมู่ 2 ต.ไร่ขิง อ.สามพราน', 'นครปฐม', '73210', '089 174 7597', 'admin@koolsport.co.th', '1983-04-18', '2009-03-01', '2015-03-19 12:29:29', '2015-03-19 09:41:51', 1);

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `tbl_site`
--

CREATE TABLE IF NOT EXISTS `tbl_site` (
  `id_site` int(11) NOT NULL AUTO_INCREMENT,
  `site_code` varchar(10) NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `site_type` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_site`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- dump ตาราง `tbl_site`
--

INSERT INTO `tbl_site` (`id_site`, `site_code`, `site_name`, `site_type`, `active`) VALUES
(1, 'COV01', 'Coralcove', 5, 1),
(2, 'COV02', 'Coralbeach', 6, 1);

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `tbl_site_emp`
--

CREATE TABLE IF NOT EXISTS `tbl_site_emp` (
  `id_emp` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `id_site` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_emp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `tbl_site_type`
--

CREATE TABLE IF NOT EXISTS `tbl_site_type` (
  `id_site_type` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_site_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- dump ตาราง `tbl_site_type`
--

INSERT INTO `tbl_site_type` (`id_site_type`, `type_name`) VALUES
(1, 'Apartment'),
(2, 'Camping'),
(3, 'Hotel'),
(4, 'Residence'),
(5, 'Resort'),
(6, 'Villa');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_emp` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL DEFAULT '0',
  `id_site` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- dump ตาราง `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `id_emp`, `id_profile`, `id_site`, `user_name`, `password`, `date_add`, `date_upd`, `last_login`) VALUES
(1, 1, 1, 0, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2015-03-19 00:00:00', '2015-03-19 00:00:00', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
