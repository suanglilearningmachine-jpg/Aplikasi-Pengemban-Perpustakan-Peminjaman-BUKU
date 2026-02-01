-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2026 at 11:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `pengarang` varchar(100) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `pengarang`, `tahun`, `stok`) VALUES
(1, 'Software Engineering', 'Suangli,S.T.,M.Kom', 2024, 1992),
(2, 'Internet Of Thing', 'Fajrul Napitupulu .,M.Kom', 2024, 232),
(3, 'Filosofi Kehidupan', 'Suangli,S.T.,M.Kom', 2024, 211),
(4, 'Pemrograman WEB', 'Tito Sinaga,M.Kom', 2024, 97),
(5, 'BASIC PHP END BACK END', 'Suangli,S.T.,M.Kom', 2024, 26),
(6, 'Informatika', 'Ahnas Siregar, S.H.,M.pd', 2024, 432),
(7, 'Filosopi Kopi', 'Raihan Sitompul, S.T.,M.Pd', 2024, 20);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `status` enum('dipinjam','dikembalikan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `status`) VALUES
(1, 1, 1, '2026-01-22', '2026-01-23', 'dikembalikan'),
(2, 2, 1, '2026-01-22', '2026-01-26', 'dikembalikan'),
(3, 1, 1, '2026-01-22', NULL, 'dipinjam'),
(4, 1, 2, '2026-01-22', '2026-01-26', 'dikembalikan'),
(5, 2, 1, '2026-01-23', '2026-01-23', 'dikembalikan'),
(6, 1, 2, '2026-01-23', '2026-01-26', 'dikembalikan'),
(7, 2, 5, '2026-01-26', NULL, 'dipinjam'),
(8, 2, 6, '2026-01-26', NULL, 'dipinjam'),
(9, 2, 1, '2026-01-26', '2026-01-26', 'dikembalikan'),
(10, 2, 7, '2026-01-26', NULL, 'dipinjam'),
(11, 2, 3, '2026-01-26', '2026-02-01', 'dikembalikan'),
(12, 2, 3, '2026-01-26', '2026-01-26', 'dikembalikan'),
(13, 2, 4, '2026-01-26', NULL, 'dipinjam'),
(14, 2, 4, '2026-01-26', '2026-01-26', 'dikembalikan'),
(15, 2, 1, '2026-01-26', NULL, 'dipinjam'),
(16, 1, 1, '2026-01-26', NULL, 'dipinjam'),
(17, 1, 4, '2026-02-01', NULL, 'dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `level` enum('admin','user') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'suangli', '827ccb0eea8a706c4c34a16891f84e7b', 'admin'),
(2, 'user1', '827ccb0eea8a706c4c34a16891f84e7b', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
