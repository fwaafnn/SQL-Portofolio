-- Database: college_assignments (dummy data)
-- Queried using: MySQL on phpMyAdmin

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `Id_barang` varchar(5) DEFAULT NULL,
  `Nama_barang` varchar(10) DEFAULT NULL,
  `Tanggal_input` date DEFAULT NULL,
  `Harga_barang` int(11) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL
);

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`Id_barang`, `Nama_barang`, `Tanggal_input`, `Harga_barang`, `Stok`) VALUES
('P011', 'Mouse', '2020-07-15', 850000, 19),
('P022', 'Mousepad', '2020-08-25', 32000, 26),
('P033', 'Printer', '2020-09-20', 1990000, 100),
('P044', 'Headset', '2020-08-30', 249000, 42),
('P055', 'Scanner', '2020-07-28', 499000, 53),
('P066', 'Cover', '2020-09-24', 52200, 90);

-- --------------------------------------------------------

-- Get an overview of the data
SELECT * FROM produk;

-- --------------------------------------------------------

-- Show the item name and week number from the date inputted in week 38
SELECT Nama_barang, WEEK(Tanggal_input) as Nomor_minggu 
FROM produk 
WHERE WEEK(Tanggal_input) = 38;

-- --------------------------------------------------------

-- Show item name, input date and item price for items that have no less than 30 and no more than 80 items in stock
SELECT Nama_barang, Tanggal_input, Harga_barang
FROM produk
WHERE Stok > 29 AND Stok < 81;

-- --------------------------------------------------------

-- Show average item price with rounding down
SELECT FLOOR(AVG(Harga_barang)) AS Rerata_harga_barang
FROM produk;

-- --------------------------------------------------------

-- Show item ID by changing ID 'P' to 'B'
SELECT REPLACE(`Id_barang`, 'P', 'B') AS Id_barang
FROM produk;

-- --------------------------------------------------------

-- Show the item name and input date by including the name of the day
SELECT Nama_barang, CONCAT(DAYNAME(`Tanggal_input`), ', ', `Tanggal_input`) AS Tanggal_input
FROM produk;

