-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cricprediction
--

CREATE DATABASE IF NOT EXISTS cricprediction;
USE cricprediction;

--
-- Definition of table `indiadata`
--

DROP TABLE IF EXISTS `indiadata`;
CREATE TABLE `indiadata` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Team` varchar(45) NOT NULL,
  `Score` varchar(45) NOT NULL,
  `Overs` varchar(45) NOT NULL,
  `RPO` varchar(45) NOT NULL,
  `Inns` varchar(45) NOT NULL,
  `Opposition` varchar(45) NOT NULL,
  `Ground` varchar(45) NOT NULL,
  `StartDate` varchar(45) NOT NULL,
  `Result` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indiadata`
--

/*!40000 ALTER TABLE `indiadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `indiadata` ENABLE KEYS */;


--
-- Definition of table `odidata`
--

DROP TABLE IF EXISTS `odidata`;
CREATE TABLE `odidata` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Result` varchar(45) NOT NULL,
  `Margin` varchar(45) NOT NULL,
  `Matchs` varchar(45) NOT NULL,
  `HomeAway` varchar(45) NOT NULL,
  `Ground` longtext NOT NULL,
  `MatchDate` varchar(45) NOT NULL,
  `MatchMonth` varchar(45) NOT NULL,
  `MatchYear` varchar(45) NOT NULL,
  `MatchPeriod` varchar(45) NOT NULL,
  `Matches` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `odidata`
--

/*!40000 ALTER TABLE `odidata` DISABLE KEYS */;
/*!40000 ALTER TABLE `odidata` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
