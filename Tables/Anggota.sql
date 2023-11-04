CREATE TABLE `Anggota` (
  `id_anggota` varchar(50) NOT NULL,
  `No_KTP` varchar(50) DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Jenis_Kelamin` enum('L','P') DEFAULT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci