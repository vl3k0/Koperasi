-- MariaDB dump 10.19  Distrib 10.5.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Koperasi
-- ------------------------------------------------------
-- Server version	10.5.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Anggota`
--

DROP TABLE IF EXISTS `Anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Anggota` (
  `id_anggota` varchar(50) NOT NULL,
  `No_KTP` varchar(50) DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Jenis_Kelamin` enum('L','P') DEFAULT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anggota`
--

LOCK TABLES `Anggota` WRITE;
/*!40000 ALTER TABLE `Anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `Anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detail_Transaksi`
--

DROP TABLE IF EXISTS `Detail_Transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Detail_Transaksi` (
  `id_detail_transaksi` varchar(50) NOT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `Nominal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detail_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detail_Transaksi`
--

LOCK TABLES `Detail_Transaksi` WRITE;
/*!40000 ALTER TABLE `Detail_Transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `Detail_Transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jenis_Transaksi`
--

DROP TABLE IF EXISTS `Jenis_Transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Jenis_Transaksi` (
  `id_jns_transaksi` varchar(50) NOT NULL,
  `Nama_Transaksi` varchar(255) NOT NULL,
  PRIMARY KEY (`id_jns_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jenis_Transaksi`
--

LOCK TABLES `Jenis_Transaksi` WRITE;
/*!40000 ALTER TABLE `Jenis_Transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `Jenis_Transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pinjaman`
--

DROP TABLE IF EXISTS `Pinjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pinjaman` (
  `id_pinjaman` varchar(50) NOT NULL,
  `id_anggota` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `Nominal` int(11) DEFAULT NULL,
  `Bunga` float DEFAULT NULL,
  `Total_Pinjaman` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pinjaman`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pinjaman`
--

LOCK TABLES `Pinjaman` WRITE;
/*!40000 ALTER TABLE `Pinjaman` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pinjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaksi_Anggota`
--

DROP TABLE IF EXISTS `Transaksi_Anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transaksi_Anggota` (
  `id` varchar(50) NOT NULL,
  `id_anggota` varchar(50) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  KEY `FK_id_transaksi` (`id_transaksi`),
  CONSTRAINT `FK_id_transaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  CONSTRAINT `Transaksi_Anggota_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `Anggota` (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaksi_Anggota`
--

LOCK TABLES `Transaksi_Anggota` WRITE;
/*!40000 ALTER TABLE `Transaksi_Anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transaksi_Anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `angsuran`
--

DROP TABLE IF EXISTS `angsuran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `angsuran` (
  `id_angsuran` varchar(50) NOT NULL,
  `id_anggota` varchar(50) DEFAULT NULL,
  `id_pinjaman` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_angsuran`),
  KEY `FK_id_anggota` (`id_anggota`),
  KEY `FK_id_pinjaman` (`id_pinjaman`),
  CONSTRAINT `FK_id_anggota` FOREIGN KEY (`id_anggota`) REFERENCES `Anggota` (`id_anggota`),
  CONSTRAINT `FK_id_pinjaman` FOREIGN KEY (`id_pinjaman`) REFERENCES `Pinjaman` (`id_pinjaman`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angsuran`
--

LOCK TABLES `angsuran` WRITE;
/*!40000 ALTER TABLE `angsuran` DISABLE KEYS */;
/*!40000 ALTER TABLE `angsuran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `id_transaksi` varchar(50) NOT NULL,
  `id_jns_transaksi` varchar(50) DEFAULT NULL,
  `id_detail_transaksi` varchar(50) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `FK_id_jns_transaksi` (`id_jns_transaksi`),
  KEY `FK_id_detail_transaksi` (`id_detail_transaksi`),
  CONSTRAINT `FK_id_detail_transaksi` FOREIGN KEY (`id_detail_transaksi`) REFERENCES `Detail_Transaksi` (`id_detail_transaksi`),
  CONSTRAINT `FK_id_jns_transaksi` FOREIGN KEY (`id_jns_transaksi`) REFERENCES `Jenis_Transaksi` (`id_jns_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-04 14:02:24
