CREATE TABLE `Pinjaman` (
  `id_pinjaman` varchar(50) NOT NULL,
  `id_anggota` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `Nominal` int(11) DEFAULT NULL,
  `Bunga` float DEFAULT NULL,
  `Total_Pinjaman` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pinjaman`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci