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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci