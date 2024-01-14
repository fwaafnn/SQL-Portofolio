-- Database: college_assignments (dummy data)
-- Queried using: MySQL on phpMyAdmin

--
-- Table structure for table `mhs_kelas_a`
--

CREATE TABLE `mhs_kelas_a` (
  `NIM` int(11) DEFAULT NULL,
  `Nama` varchar(10) DEFAULT NULL,
  `Jenis Kelamin` varchar(20) DEFAULT NULL,
  `Mata Kuliah` varchar(20) DEFAULT NULL,
  `Nilai` int(11) DEFAULT NULL
);

--
-- Dumping data for table `mhs_kelas_a`
--

INSERT INTO `mhs_kelas_a` (`NIM`, `Nama`, `Jenis Kelamin`, `Mata Kuliah`, `Nilai`) VALUES
(201131, 'Arni', 'Perempuan', 'Basis Data', 97),
(201553, 'Enno', 'Perempuan', 'AI', 90),
(203212, 'Berly', 'Perempuan', 'Kalkulus', 87),
(204133, 'Fika', 'Perempuan', 'Kalkulus', 88),
(204213, 'Jeremy', 'Laki-Laki', 'Kalkulus', 85),
(205137, 'Dian', 'Perempuan', 'AI', 92),
(201524, 'Githa', 'Perempuan', 'AI', 87),
(205533, 'Cepi', 'Laki-Laki', 'Basis Data', 98),
(206251, 'Herto', 'Laki-Laki', 'Kalkulus', 90),
(206435, 'Irza', 'Laki-Laki', 'AI', 84),
(192833, 'Harly', 'Laki-Laki', 'Basis Data', 93),
(192834, 'Deni', 'Laki-Laki', 'AI', 87);

-- --------------------------------------------------------

--
-- Table structure for table `mhs_kelas_b`
--

CREATE TABLE `mhs_kelas_b` (
  `NIM` int(11) DEFAULT NULL,
  `Nama` varchar(10) DEFAULT NULL,
  `Jenis Kelamin` varchar(20) DEFAULT NULL,
  `Mata Kuliah` varchar(20) DEFAULT NULL,
  `Nilai` int(11) DEFAULT NULL
);

--
-- Dumping data for table `mhs_kelas_b`
--

INSERT INTO `mhs_kelas_b` (`NIM`, `Nama`, `Jenis Kelamin`, `Mata Kuliah`, `Nilai`) VALUES
(192113, 'Irsa', 'Laki-Laki', 'AI', 95),
(192144, 'Gery', 'Laki-Laki', 'Kalkulus', 90),
(192221, 'Alvi', 'Laki-Laki', 'Kalkulus', 92),
(192234, 'Cherly', 'Perempuan', 'Kalkulus', 87),
(192319, 'Fiky', 'Laki-Laki', 'AI', 93),
(192321, 'Bella', 'Perempuan', 'AI', 100),
(192663, 'Eriza', 'Perempuan', 'Basis Data', 95),
(192774, 'Donny', 'Laki-Laki', 'Basis Data', 98),
(192776, 'John', 'Laki-Laki', 'Basis Data', 100),
(192833, 'Harly', 'Laki-Laki', 'Matematika Diskrit', 84),
(201524, 'Githa', 'Perempuan', 'Matematika Diskrit', 88),
(192834, 'Deni', 'Laki-Laki', 'Matematika Diskrit', 89);

-- --------------------------------------------------------

-- Get an overview of the data
SELECT * FROM mhs_kelas_a;
SELECT * FROM mhs_kelas_b;

-- --------------------------------------------------------

-- Combination of class A and class B students [UNION]
SELECT * FROM mhs_kelas_a
UNION
SELECT * FROM mhs_kelas_b;

-- --------------------------------------------------------

-- All courses in both classes [INTERSECT]
SELECT `Mata Kuliah` AS `Mata kuliah yang ada di kelas A dan kelas B`
FROM  mhs_kelas_a
INTERSECT
SELECT `Mata Kuliah`
FROM mhs_kelas_b

-- --------------------------------------------------------

-- Courses that are only available in class B but not in class A [EXCEPT]
SELECT `Mata Kuliah` AS `Mata kuliah yang hanya terdapat di kelas b`
FROM mhs_kelas_b
EXCEPT
SELECT `Mata Kuliah`
FROM mhs_kelas_a;

-- --------------------------------------------------------

-- Students in class A and class B [INTERSECT]
SELECT NIM, Nama, `Jenis Kelamin`
FROM mhs_kelas_a
INTERSECT
SELECT NIM, Nama, `Jenis Kelamin`
FROM mhs_kelas_b;

-- --------------------------------------------------------

-- Students who take Database and AI courses [UNION]
SELECT * FROM mhs_kelas_a 
WHERE `Mata Kuliah` = 'Basis Data' OR `Mata Kuliah` = 'AI'
UNION
SELECT * FROM mhs_kelas_b 
WHERE `Mata Kuliah` = 'Basis Data' OR `Mata Kuliah` = 'AI';

-- --------------------------------------------------------

-- Students who take AI and Calculus sequentially [UNION]
SELECT * FROM mhs_kelas_a
WHERE `Mata Kuliah` = 'AI' OR `Mata Kuliah` = 'Kalkulus'
UNION
SELECT * FROM mhs_kelas_b
WHERE `Mata Kuliah` = 'AI' OR `Mata Kuliah` = 'Kalkulus'
ORDER BY `Mata Kuliah` ASC;

-- --------------------------------------------------------

-- Students who only take Calculus [UNION]
SELECT NIM, Nama, `Jenis Kelamin`, `Mata Kuliah`
FROM mhs_kelas_a
WHERE `Mata Kuliah`= 'Kalkulus'
UNION
SELECT NIM, Nama, `Jenis Kelamin`, `Mata Kuliah`
FROM mhs_kelas_b
WHERE `Mata Kuliah`= 'Kalkulus';

-- --------------------------------------------------------

-- Students who only take Database courses in class A [EXCEPT]
SELECT NIM, Nama, `Jenis Kelamin`, `Mata Kuliah`
FROM mhs_kelas_a
WHERE `Mata Kuliah` = 'Basis Data'
EXCEPT
SELECT NIM, Nama, `Jenis Kelamin`, `Mata Kuliah`
FROM mhs_kelas_b;
