CREATE TABLE `Detail_Transaksi` (
  `id_detail_transaksi` varchar(50) NOT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `Nominal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detail_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci