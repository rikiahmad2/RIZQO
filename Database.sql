-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.36-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for akuntansi
CREATE DATABASE IF NOT EXISTS `akuntansi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `akuntansi`;

-- Dumping structure for table akuntansi.angsuran
CREATE TABLE IF NOT EXISTS `angsuran` (
  `kode_bayar` int(11) NOT NULL AUTO_INCREMENT,
  `kode_pinjaman` int(11) DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `angsuran_ke` int(11) DEFAULT NULL,
  `kualitas` varchar(50) DEFAULT NULL,
  `hari_ke` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_bayar`),
  KEY `FK_angsuran_pinjaman` (`kode_pinjaman`),
  CONSTRAINT `FK_angsuran_pinjaman` FOREIGN KEY (`kode_pinjaman`) REFERENCES `pinjaman` (`kode_pinjaman`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Dumping data for table akuntansi.angsuran: ~5 rows (approximately)
/*!40000 ALTER TABLE `angsuran` DISABLE KEYS */;
INSERT INTO `angsuran` (`kode_bayar`, `kode_pinjaman`, `tanggal_bayar`, `angsuran_ke`, `kualitas`, `hari_ke`) VALUES
	(38, 7, '2020-06-06', 1, 'Pinjaman Lancar', 12),
	(39, 7, '2020-06-04', 2, 'Pinjaman Lancar', 1),
	(40, 7, '2020-06-06', 3, 'Pinjaman Lancar', 3),
	(41, 18, '2020-06-05', 1, '', 0),
	(43, 18, '2020-06-06', 2, 'Pinjaman Lancar', 1),
	(44, 7, '2020-06-04', 4, 'Pinjaman Lancar', 1),
	(45, 20, '2020-06-05', 1, 'Pinjaman Lancar', 1);
/*!40000 ALTER TABLE `angsuran` ENABLE KEYS */;

-- Dumping structure for table akuntansi.mitra
CREATE TABLE IF NOT EXISTS `mitra` (
  `kode` int(11) NOT NULL AUTO_INCREMENT,
  `no` int(12) DEFAULT NULL,
  `nama_mb` varchar(50) DEFAULT NULL,
  `nama_pemilik` varchar(50) DEFAULT NULL,
  `tahun` varchar(50) DEFAULT NULL,
  `sektor_usaha` varchar(50) DEFAULT NULL,
  `alamat_usaha` varchar(50) DEFAULT NULL,
  `desa_kelurahan` varchar(50) DEFAULT NULL,
  `kecamatan` varchar(50) DEFAULT NULL,
  `wilayah` varchar(50) DEFAULT NULL,
  `no_spk` varchar(50) DEFAULT NULL,
  `tgl_spk` varchar(50) DEFAULT NULL,
  `pinj_tahap` int(11) DEFAULT NULL,
  `bentuk_jaminan` varchar(50) DEFAULT NULL,
  `jenis_jaminan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=33334 DEFAULT CHARSET=latin1;

-- Dumping data for table akuntansi.mitra: ~3 rows (approximately)
/*!40000 ALTER TABLE `mitra` DISABLE KEYS */;
INSERT INTO `mitra` (`kode`, `no`, `nama_mb`, `nama_pemilik`, `tahun`, `sektor_usaha`, `alamat_usaha`, `desa_kelurahan`, `kecamatan`, `wilayah`, `no_spk`, `tgl_spk`, `pinj_tahap`, `bentuk_jaminan`, `jenis_jaminan`) VALUES
	(6, 55555, 'REKIKI', 'REKIKI', '2009', 'MANCING', 'CIBIRU', 'CIBIRU', 'CIBIRU', 'CIBIRU', '232334', '21 MARET 2009', 150000, 'RIBA', 'CICIL'),
	(8888, 800997656, 'ASEP SETIAWAN', 'ASEP', '2009', 'PETERNAKAN', 'BANDUNG', 'CILEUNYI', 'CILEUNYI', 'CILEUNYI', '77777', '16 Juli 2009', 7000000, 'KREDIT', 'KREDIT'),
	(33333, 1233, 'TREYA', 'TREYA', '2009', 'asdasd', 'asdsad', 'asdsad', 'sadasd', 'asdasd', '12321', 'sadasd', 123123, 'sdfdsfds', 'sdfsdf');
/*!40000 ALTER TABLE `mitra` ENABLE KEYS */;

-- Dumping structure for table akuntansi.pinjaman
CREATE TABLE IF NOT EXISTS `pinjaman` (
  `kode_pinjaman` int(11) NOT NULL AUTO_INCREMENT,
  `kode_mitra` int(11) DEFAULT NULL,
  `jumlah_pinjaman` int(11) DEFAULT NULL,
  `tgl_pinjaman` date DEFAULT NULL,
  `tgl_tempo` date DEFAULT NULL,
  `lama_pinjaman` int(11) DEFAULT NULL,
  `angsuran_pokok` int(11) DEFAULT NULL,
  `non_bunga` int(11) DEFAULT NULL,
  `total_pinjaman` int(11) DEFAULT NULL,
  `bunga` float DEFAULT NULL,
  `bunga_bln` int(11) DEFAULT NULL,
  `cr` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_pinjaman`),
  KEY `FK_pinjaman_mitra` (`kode_mitra`),
  CONSTRAINT `FK_pinjaman_mitra` FOREIGN KEY (`kode_mitra`) REFERENCES `mitra` (`kode`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table akuntansi.pinjaman: ~3 rows (approximately)
/*!40000 ALTER TABLE `pinjaman` DISABLE KEYS */;
INSERT INTO `pinjaman` (`kode_pinjaman`, `kode_mitra`, `jumlah_pinjaman`, `tgl_pinjaman`, `tgl_tempo`, `lama_pinjaman`, `angsuran_pokok`, `non_bunga`, `total_pinjaman`, `bunga`, `bunga_bln`, `cr`) VALUES
	(7, 6, 600000, '2020-06-03', '2020-06-13', 15, 64000, 40000, 550400, 4, 24000, 440000),
	(18, 33333, 500000, '2020-06-05', '2020-06-20', 16, 46250, 31250, 647500, 3, 15000, 437500),
	(20, 6, 1000000, '2020-06-04', '2020-06-20', 12, 103333, 83333, 1136667, 2, 20000, 916667);
/*!40000 ALTER TABLE `pinjaman` ENABLE KEYS */;

-- Dumping structure for table akuntansi.user
CREATE TABLE IF NOT EXISTS `user` (
  `kd_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`kd_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table akuntansi.user: ~2 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`kd_user`, `username`, `password`, `level`) VALUES
	(1, 'user', 'user', 1),
	(5, 'admin', 'admin', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
