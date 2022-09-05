-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Des 2019 pada 05.45
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_linkers3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(15) NOT NULL,
  `nama_paket` varchar(25) NOT NULL,
  `jumlah_waktu` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `nama_paket`, `jumlah_waktu`) VALUES
(1, 'Paket 1', 60),
(2, 'Paket 2', 120),
(3, 'Paket 3', 180),
(4, 'Paket 4', 240);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(15) NOT NULL,
  `id_waktu` int(15) NOT NULL,
  `id_transaksi` int(15) NOT NULL,
  `nama_pj` varchar(15) NOT NULL,
  `nama_perusahaan` varchar(15) NOT NULL,
  `jumlah_orang` varchar(15) NOT NULL,
  `alasan` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` varchar(15) NOT NULL,
  `hari` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `id_waktu`, `id_transaksi`, `nama_pj`, `nama_perusahaan`, `jumlah_orang`, `alasan`, `status`, `tanggal`, `waktu`, `hari`) VALUES
(29, 1, 167, 'bejo', 'PT.Admin Indone', '10', 'CCD LAU', 'Diterima', '0000-00-00', '', ''),
(29, 5, 168, 'bejo', 'PT.Admin Indone', '10', '', 'Menunggu', '0000-00-00', '', ''),
(29, 6, 169, 'bejo', 'PT.Admin Indone', '10', '', 'Menunggu', '0000-00-00', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_user` int(25) NOT NULL,
  `id_paket` int(25) NOT NULL,
  `id_pembelian` int(25) NOT NULL,
  `nama_perusahaan` varchar(35) NOT NULL,
  `nama_bank` varchar(45) NOT NULL,
  `nama_pengirim` varchar(45) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(60) NOT NULL,
  `alasan` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_user`, `id_paket`, `id_pembelian`, `nama_perusahaan`, `nama_bank`, `nama_pengirim`, `tanggal`, `status`, `alasan`) VALUES
(29, 1, 31, 'PT.Admin Indonesia', 'BRI', 'Tono', '1212-12-12', 'Pembayaran Belum Terkonfirmasi', ''),
(29, 1, 32, 'PT.Admin Indonesia', 'BRI', 'Tono', '1212-12-12', 'Pembayaran Belum Terkonfirmasi', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `nama_perusahaan` varchar(30) NOT NULL,
  `role` enum('admin','operator') NOT NULL,
  `sisa_waktu` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`, `nama_perusahaan`, `role`, `sisa_waktu`) VALUES
(29, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'PT.Admin Indonesia', 'admin', 200),
(32, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user', 'PT.User Indonesia', 'operator', 100),
(33, 'user2', '7e58d63b60197ceb55a1c487989a3720', 'user2', 'PT. zombie', 'operator', 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `waktu_peminjaman`
--

CREATE TABLE `waktu_peminjaman` (
  `waktu_hari` varchar(15) NOT NULL,
  `waktu_jam` varchar(6) NOT NULL,
  `id_waktu` int(6) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `waktu_peminjaman`
--

INSERT INTO `waktu_peminjaman` (`waktu_hari`, `waktu_jam`, `id_waktu`, `tanggal`) VALUES
('Senin', '10:00', 1, '2019-10-22'),
('Senin', '9:00', 5, '2020-01-04'),
('Senin', '12:00', 6, '1212-12-05');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD UNIQUE KEY `id_paket` (`id_paket`) USING BTREE;

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_waktu`),
  ADD UNIQUE KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `waktu_peminjaman`
--
ALTER TABLE `waktu_peminjaman`
  ADD PRIMARY KEY (`id_waktu`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_transaksi` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_pembelian` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `waktu_peminjaman`
--
ALTER TABLE `waktu_peminjaman`
  MODIFY `id_waktu` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_waktu`) REFERENCES `waktu_peminjaman` (`id_waktu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
