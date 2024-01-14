-- Database: college_assignments (dummy data)
-- Queried using: MySQL on phpMyAdmin

--
-- Table structure for table `penduduk`
--

CREATE TABLE `penduduk` (
  `Id_kota` int(11) DEFAULT NULL,
  `Nama_kota` varchar(20) DEFAULT NULL,
  `Jumlah_penduduk_pria` int(11) DEFAULT NULL,
  `Jumlah_penduduk_wanita` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penduduk`
--

INSERT INTO `penduduk` (`Id_kota`, `Nama_kota`, `Jumlah_penduduk_pria`, `Jumlah_penduduk_wanita`) VALUES
(483921, 'Banjarmasin', 34310, 27948),
(542854, 'Palembang', 54282, 43910),
(958724, 'Pekanbaru', 438921, 392120),
(546729, 'Dili', 801290, 728320),
(483281, 'Alor', 5232, 5222),
(943872, 'Makassar', 85920, 54931);

-- --------------------------------------------------------

-- Get an overview of the data
SELECT * FROM penduduk;

-- --------------------------------------------------------

-- Count the number of characters from each city
SELECT LENGTH(Id_kota), LENGTH(Nama_kota), LENGTH(Jumlah_penduduk_pria), LENGTH(Jumlah_penduduk_wanita)
FROM penduduk;

-- --------------------------------------------------------

-- Show cities that have a city name of 5-10 characters
SELECT Nama_kota
FROM penduduk
WHERE LENGTH(Nama_kota) > 4 AND LENGTH(Nama_kota) < 11;

-- --------------------------------------------------------

-- Show ID and city name with 00 added to the Id
SELECT CONCAT('00', `Id_kota`) AS ID_Kota, Nama_kota
FROM penduduk;

-- --------------------------------------------------------

-- Show the average male population, and the average female population rounded to 2 digits behind the comma
SELECT 
    ROUND((AVG(Jumlah_penduduk_pria)), 2) AS Rerata_populasi_pria,
    ROUND((AVG(Jumlah_penduduk_wanita)), 2) AS Rerata_populasi_wanita
FROM penduduk;

-- --------------------------------------------------------

-- Show the name of the city and the population of each city in order of the largest number
SELECT Nama_kota, SUM(Jumlah_penduduk_pria + Jumlah_penduduk_wanita) AS Jumlah_penduduk_pria
FROM penduduk
GROUP BY Nama_kota
ORDER BY  SUM(Jumlah_penduduk_pria + Jumlah_penduduk_wanita) DESC;