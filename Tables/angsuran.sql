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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci