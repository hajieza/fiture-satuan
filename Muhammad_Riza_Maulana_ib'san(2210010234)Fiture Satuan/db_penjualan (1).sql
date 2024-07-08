-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2024 at 10:37 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(8) NOT NULL,
  `barkode` int(20) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `harga_jual` bigint(20) DEFAULT NULL,
  `harga_beli` bigint(20) DEFAULT NULL,
  `stok` int(10) DEFAULT NULL,
  `kategori_id` int(8) DEFAULT NULL,
  `satuan_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `barkode`, `name`, `harga_jual`, `harga_beli`, `stok`, `kategori_id`, `satuan_id`, `user_id`, `supplier_id`) VALUES
(1, 123456789, 'Knit', 350000, 290000, 10, 1, 1, 1, 1),
(2, 987654321, 'Mobil Hr-v', 497000000, 480000000, 5, 2, 2, 2, 2),
(3, 111222333, 'iPhone 15 Promax', 30000000, 29000000, 7, 3, 3, 3, 3),
(4, 555666777, 'Air Conditioner', 2500000, 2350000, 15, 4, 4, 4, 4),
(5, 999888776, 'Lipstik YSL', 520000, 500000, 8, 5, 5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(1, 'PAKAIAN'),
(2, 'OTOMOTIF'),
(3, 'ELEKTRONIK'),
(4, 'PERLENGKAPAN RUMAH TANGGA'),
(5, 'KESEHATAN dan KECANTIKAN');

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `name`, `alamat`, `telp`, `email`) VALUES
(1, 90807, 'via', 'banjarbaru', '081344557788', 'viaagustin@gmail.com'),
(2, 90806, 'daffa', 'batulicin', '082344557788', 'daffaham@gmail.com'),
(3, 90805, 'faris', 'balangan', '083344557788', 'farisabd@gmail.com'),
(4, 90804, 'daniel', 'surabaya', '084344557788', 'danielmo@gmail.com'),
(5, 90803, 'nasha', 'banjarmasin', '085344557788', 'armnasha@gmail.com'),
(8, 90801, 'diki', 'banjarbaru', '0831567899', 'diki123@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `bayar`, `tanggal`, `deskripsi`, `supplier_id`, `user_id`) VALUES
(1, 112233, 2900000, 2900000, '2023-05-20', 'pembelian knit wear 10pcs', 1, 1),
(2, 445566, 2400000000, 2400000000, '2024-11-05', 'pembelian 5 unit hr-v', 2, 2),
(3, 778899, 90000000, 90000000, '2024-02-20', 'pembelian 7 unit iP 15 ProMax', 3, 3),
(4, 443322, 35250000, 35250000, '2023-08-10', 'pembellian AC 15 pcs', 4, 4),
(5, 665533, 4000000, 4000000, '2024-05-04', 'pembelian lipstik YSL sebanyak 8 pcs', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id` int(8) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `barang_id` int(8) DEFAULT NULL,
  `pembelian_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`id`, `harga`, `qty`, `subtotal`, `barang_id`, `pembelian_id`) VALUES
(1, 290000, 10, 2900000, 1, 1),
(2, 480000000, 5, 2400000000, 2, 2),
(3, 29000000, 3, 90000000, 3, 3),
(4, 2350000, 15, 35250000, 4, 4),
(5, 500000, 8, 4000000, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kustomer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `invoice`, `total`, `bayar`, `kembali`, `tanggal`, `kustomer_id`, `user_id`) VALUES
(1, 1678, 700000, 700000, 0, '2023-05-23', 1, 1),
(2, 2580, 497000000, 497000000, 0, '2024-02-11', 2, 2),
(3, 2789, 90000000, 90000000, 0, '2024-02-28', 3, 3),
(4, 3567, 20000000, 20000000, 0, '2024-03-05', 4, 4),
(5, 5980, 1040000, 1050000, 10000, '2024-05-07', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id` int(8) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `barang_id` int(8) DEFAULT NULL,
  `penjualan_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id`, `harga`, `qty`, `subtotal`, `barang_id`, `penjualan_id`) VALUES
(1, 350000, 2, 700000, 1, 1),
(2, 497000000, 1, 497000000, 2, 2),
(3, 30000000, 3, 90000000, 3, 3),
(4, 2500000, 8, 20000000, 4, 4),
(5, 520000, 2, 1040000, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `deskripsi`) VALUES
(1, 'pcs', 'pieces'),
(2, 'unit', 'unit'),
(3, 'unit', 'unit'),
(4, 'pcs', 'pieces'),
(5, 'pcs', 'pieces'),
(6, 'kotak', 'perkotak');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(8) NOT NULL,
  `nik` int(8) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `perusahaan` varchar(150) DEFAULT NULL,
  `name_bank` varchar(150) DEFAULT NULL,
  `name_akun_bank` varchar(150) DEFAULT NULL,
  `no_akun_bank` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `perusahaan`, `name_bank`, `name_akun_bank`, `no_akun_bank`) VALUES
(1, 320789012, 'Ahmad Santoso', '081234567890', 'ahmad.santoso@gmail.com', 'Jl. Pahlawan No. 123, Jakarta', 'Santoso Textile', 'Mandiri', 'Ahmad Santoso', '1234567890'),
(2, 320912340, 'Siti Nurhayati', '087654321098', 'siti.nurhayati@gmail.com', ' Jl. Merdeka No. 45, Bandung', 'Nurhayati Car', 'BCA', 'Siti Nurhayati', '9876543210\r\n'),
(3, 567890127, 'Bambang Susanto', '081112233445', 'bambang.susanto@gmail.com', 'Jl. Gatot Subroto No. 67, Surabaya', 'Susanto Electronics', 'BRI', 'Bambang Susanto', '5432109876'),
(4, 123456790, 'Fitriani Wijaya', '082233445566', 'fitriani.wijaya@gmail.com', 'Jl. Diponegoro No. 89, Semarang', 'Wijaya Enterprises', 'BSI', ' Fitriani Wijaya', '6543210987'),
(5, 567890124, 'Iwan Setiawan', '085678901234', 'iwan.setiawan@gmail.com', 'Jl. Sudirman No. 10, Medan', 'Setiawan Corporation', 'BCA', 'Iwan Setiawan', '8765432109'),
(6, 89076522, 'Reza Artamevia', '0813456788', 'artare@gmail.com', 'Pekanbaru', 'Indo LTD', 'Mandiri', 'Reno Dwiwangga', '765433');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `username` char(100) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tipe` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `is_active` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nik`, `username`, `full_name`, `password`, `tipe`, `email`, `alamat`, `telp`, `is_active`) VALUES
(1, 324565, 'diva', 'diva damayanti', 'diva123', 'admin', 'divadmy@gmail.com', 'banjarbaru', '081311220099', 'true'),
(2, 897654, 'pinkan', 'pinkan aprilia', 'pinkan298', 'admin', 'pinkanapr@gmail.com', 'banjarbaru', '081311223312', 'false'),
(3, 890453, 'ana', 'berliana', 'ana398', 'admin', 'berliana39@gmail.com', 'banjarbaru', '081344559912', 'true'),
(4, 345213, 'risa', 'clarissa paramesti', 'risa443', 'owner', 'risaclr@gmail.com', 'banjarbaru', '081254678899', 'true'),
(5, 246789, 'kurnia', 'kurnia sari', 'kurnia542', 'admin', 'kurniasr@gmail.com', 'banjarbaru', '089766554422', 'false');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kategori` (`kategori_id`),
  ADD KEY `fk_satuan` (`satuan_id`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `fk_supplier` (`supplier_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_supplier_2` (`supplier_id`),
  ADD KEY `fk_user_2` (`user_id`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_barang_3` (`barang_id`),
  ADD KEY `fk_pembelian_3` (`pembelian_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kustomer_1` (`kustomer_id`),
  ADD KEY `fk_user_1` (`user_id`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_barang` (`barang_id`),
  ADD KEY `fk_penjualan` (`penjualan_id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `fk_satuan` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`),
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `fk_supplier_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `fk_user_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD CONSTRAINT `fk_barang_3` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `fk_pembelian_3` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_kustomer_1` FOREIGN KEY (`kustomer_id`) REFERENCES `kustomer` (`id`),
  ADD CONSTRAINT `fk_user_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD CONSTRAINT `fk_barang` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `fk_penjualan` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
