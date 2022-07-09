-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2021 at 12:40 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `level`, `jenis_kelamin`, `alamat`) VALUES
('1', 'Kepala perpus', '123', 'Kepala Perpus', 'Perempuan', 'Jakarta'),
('2', 'petugas', '12345', 'Petugas', 'Laki-laki', 'Pancoran'),
('3', 'bayuis', '123', 'admin', 'Perempuan', 'pancoran');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `nis` int(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(11) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`nis`, `nama`, `jurusan`, `jenis_kelamin`, `alamat`) VALUES
(70334, 'Andy tri wahyudi', 'MULTIMEDIA', 'Laki-laki', 'Condet'),
(70335, 'Adinda rosita', 'IPS', 'Perempuan', 'Pejaten'),
(70337, 'Destra Apriliansyah', 'TKJ', 'Laki-laki', 'Pasar MInggu');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kd_buku` varchar(12) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `nama_pengarang` varchar(50) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `tahun_terbit` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kd_buku`, `judul_buku`, `nama_pengarang`, `penerbit`, `tahun_terbit`) VALUES
('A001', 'Malin kundang', 'Pak hajie', 'Gramedia', 2008),
('A002', 'Unindra Press', 'Sumaryoto', 'Multimedia', 2010),
('A003', 'PWL', 'Aldian', 'Irfan', 2015);

-- --------------------------------------------------------

--
-- Table structure for table `inventaris`
--

CREATE TABLE `inventaris` (
  `kode_barang` varchar(20) NOT NULL,
  `Nama_barang` varchar(100) NOT NULL,
  `Jumlah_barang` int(100) NOT NULL,
  `Kondisi_barang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventaris`
--

INSERT INTO `inventaris` (`kode_barang`, `Nama_barang`, `Jumlah_barang`, `Kondisi_barang`) VALUES
('B001', 'meja', 2, 'Rusak'),
('B002', 'kursi', 2, 'Rusak');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `kd_pinjam` varchar(12) NOT NULL,
  `nis` int(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kd_buku` varchar(50) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `tgl_pinjam` varchar(30) NOT NULL,
  `tgl_kembali` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`kd_pinjam`, `nis`, `nama`, `kd_buku`, `judul_buku`, `tgl_pinjam`, `tgl_kembali`) VALUES
('P001', 2018345679, 'Bayu iswahyudi', 'A001', 'Malin kundang', '02-07-2021', '04-07-2021'),
('P002', 2018435013, 'Fahmi', 'A003', 'Pemrograman', '02-07-2021', '06-07-2021'),
('P003', 2018463823, 'Robiyanto', 'A002', 'Unindra Press', '04-07-2021', '06-07-2021');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `kd_kembali` varchar(10) NOT NULL,
  `kd_pinjam` varchar(10) NOT NULL,
  `nis` int(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kd_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `tgl_pinjam` varchar(30) NOT NULL,
  `tgl_kembali` varchar(30) NOT NULL,
  `tgl_pengembalian` varchar(30) NOT NULL,
  `denda` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`kd_kembali`, `kd_pinjam`, `nis`, `nama`, `kd_buku`, `judul_buku`, `tgl_pinjam`, `tgl_kembali`, `tgl_pengembalian`, `denda`) VALUES
('K002', 'P001', 2018345679, 'Bayu iswahyudi', 'A001', 'Malin kundang', '02-07-2021', '04-07-2021', '04-07-2021', 5000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kd_buku`);

--
-- Indexes for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`kd_pinjam`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`kd_kembali`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
