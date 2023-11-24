-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Nov 2023 pada 04.53
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `nama_dokter` varchar(50) NOT NULL DEFAULT '0',
  `spesialis` varchar(50) NOT NULL DEFAULT '0',
  `nomor` varchar(50) NOT NULL DEFAULT '0',
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `alamat` varchar(225) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `doctor`
--

INSERT INTO `doctor` (`id`, `nama_dokter`, `spesialis`, `nomor`, `jenis_kelamin`, `alamat`, `tanggal_lahir`) VALUES
(1, 'Putri', 'Gigi', '087810639060', 'P', 'Kepanjen', '2003-11-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `drug`
--

CREATE TABLE `drug` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(225) NOT NULL DEFAULT '0',
  `ketersediaan` int(11) NOT NULL DEFAULT 0,
  `tanggal_kadaluarsa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `drug`
--

INSERT INTO `drug` (`id`, `nama_obat`, `ketersediaan`, `tanggal_kadaluarsa`) VALUES
(3, 'paracetamnol', 14, '2025-11-22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `pasien_id` varchar(225) NOT NULL DEFAULT '0',
  `tanggal` date DEFAULT NULL,
  `rincian` varchar(225) DEFAULT NULL,
  `total_biaya` int(11) NOT NULL,
  `metode_pembayaran` varchar(225) NOT NULL,
  `status_pembayaran` enum('lunas','belum lunas') DEFAULT NULL,
  `tanggal_pembayaran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `medical_records`
--

CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL,
  `pasien_id` varchar(50) NOT NULL,
  `tanggal_pemeriksaan` date DEFAULT NULL,
  `jenis_pemeriksaan` varchar(50) NOT NULL DEFAULT '',
  `hasil_pemeriksaan` varchar(50) NOT NULL DEFAULT '',
  `resep_obat` varchar(225) NOT NULL,
  `catatan` varchar(225) DEFAULT NULL,
  `dokter_id` varchar(11) NOT NULL,
  `ruangan` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `medical_records`
--

INSERT INTO `medical_records` (`id`, `pasien_id`, `tanggal_pemeriksaan`, `jenis_pemeriksaan`, `hasil_pemeriksaan`, `resep_obat`, `catatan`, `dokter_id`, `ruangan`) VALUES
(1, 'Rudi', '2023-11-24', 'Pemeriksaan gigi', 'pencabutan gigi', 'paracetamnol', 'lebih diperhatikan lagi kebersihannya', 'Putri', 'intensif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama_pasien` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `nomor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama_pasien`, `alamat`, `jenis_kelamin`, `tanggal_lahir`, `nomor`) VALUES
(1, 'Rudi', 'Kepanjen', 'L', '2005-11-03', '087810639060');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `metode_pembayaran` varchar(225) NOT NULL DEFAULT '0',
  `jumlah_pembayaran` int(11) NOT NULL DEFAULT 0,
  `tanggal_pembayaran` date DEFAULT NULL,
  `faktur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `nomor_ruangan` int(11) NOT NULL DEFAULT 0,
  `jenis_ruangan` varchar(225) NOT NULL DEFAULT '0',
  `kapasitas` int(11) NOT NULL DEFAULT 0,
  `ketersediaan` enum('ya','tidak') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `room`
--

INSERT INTO `room` (`id`, `nomor_ruangan`, `jenis_ruangan`, `kapasitas`, `ketersediaan`) VALUES
(1, 1, 'intensif', 2, 'ya');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_dokter` (`nama_dokter`);

--
-- Indeks untuk tabel `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_obat` (`nama_obat`);

--
-- Indeks untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pasien_id`),
  ADD KEY `metode_pembayaran` (`metode_pembayaran`),
  ADD KEY `total_biaya` (`total_biaya`),
  ADD KEY `tanggal_pembayaran` (`tanggal_pembayaran`),
  ADD KEY `status_pembayaran` (`status_pembayaran`);

--
-- Indeks untuk tabel `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pasien_id`),
  ADD KEY `dokter_id` (`dokter_id`),
  ADD KEY `ruangan` (`ruangan`),
  ADD KEY `resep_obat` (`resep_obat`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_pasien` (`nama_pasien`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `metode_pembayaran` (`metode_pembayaran`),
  ADD KEY `jumlah_pembayaran` (`jumlah_pembayaran`),
  ADD KEY `tanggal_pembayaran` (`tanggal_pembayaran`),
  ADD KEY `jumlah_pembayaran_2` (`jumlah_pembayaran`);

--
-- Indeks untuk tabel `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jenis_ruangan` (`jenis_ruangan`),
  ADD KEY `nomor_ruangan` (`nomor_ruangan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `drug`
--
ALTER TABLE `drug`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`nama_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`tanggal_pembayaran`) REFERENCES `payment` (`tanggal_pembayaran`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `medical_records_ibfk_2` FOREIGN KEY (`dokter_id`) REFERENCES `doctor` (`nama_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medical_records_ibfk_3` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`nama_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medical_records_ibfk_4` FOREIGN KEY (`ruangan`) REFERENCES `room` (`jenis_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medical_records_ibfk_5` FOREIGN KEY (`resep_obat`) REFERENCES `drug` (`nama_obat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`metode_pembayaran`) REFERENCES `invoice` (`metode_pembayaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`jumlah_pembayaran`) REFERENCES `invoice` (`total_biaya`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
