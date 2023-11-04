CREATE TABLE `Transaksi_Anggota` (
  `id` varchar(50) NOT NULL,
  `id_anggota` varchar(50) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  KEY `FK_id_transaksi` (`id_transaksi`),
  CONSTRAINT `FK_id_transaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  CONSTRAINT `Transaksi_Anggota_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `Anggota` (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci