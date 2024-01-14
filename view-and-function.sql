-- Database: college_assignments (dummy data)
-- Queried using: MySQL on phpMyAdmin

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `NIP` int(11) DEFAULT NULL,
  `nama_depan` varchar(10) DEFAULT NULL,
  `nama_blkg` varchar(10) DEFAULT NULL,
  `email` varchar(10) DEFAULT NULL,
  `tlp` int(11) DEFAULT NULL,
  `alamat` varchar(10) DEFAULT NULL
);

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`NIP`, `nama_depan`, `nama_blkg`, `email`, `tlp`, `alamat`) VALUES
(9001, 'Rani', 'Putri', 'rani@upi.e', 983678899, 'Bandung'),
(9002, 'Andre', 'Taulani', 'andre@upi.', 812658899, 'Jakarta'),
(9003, 'Elsa', 'Fitri', 'elsa@upi.e', 8390862, 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` int(11) DEFAULT NULL,
  `nama` varchar(10) DEFAULT NULL,
  `email` varchar(10) DEFAULT NULL,
  `tlp` varchar(10) DEFAULT NULL,
  `alamat` varchar(10) DEFAULT NULL
);

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `nama`, `email`, `tlp`, `alamat`) VALUES
(202201, 'Daus', 'daus@upi.e', '0812334455', 'Cisitu'),
(202202, 'Indra', 'indra@upi.', '0878912345', 'Cisitu'),
(202203, 'Vina', 'vina@upi.e', '0852889933', 'Cinunuk'),
(202204, 'Annisa', 'nisa@upi.e', '0864123456', 'Cibiru'),
(202205, 'Mustika', 'tika@upi.e', '0986541377', 'Cinunuk');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `KodeMK` int(11) DEFAULT NULL,
  `NamaMK` varchar(20) DEFAULT NULL,
  `SKS` int(11) DEFAULT NULL,
  `DosenPengampu` int(11) DEFAULT NULL
);

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`KodeMK`, `NamaMK`, `SKS`, `DosenPengampu`) VALUES
(0, 'Basis Data', 3, 9001),
(0, 'PRPL', 3, 9002),
(0, 'Sistem Operasi', 3, 9003),
(0, 'Jaringan Komputer', 3, 9002),
(0, 'Kalkulus', 2, 9001);

-- --------------------------------------------------------

--
-- Table structure for table `detailmk`
--

CREATE TABLE `detailmk` (
  `Jadwal` varchar(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `KodeMK` varchar(10) DEFAULT NULL,
  `NIM` int(11) DEFAULT NULL
);

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `KodeTugas` varchar(10) DEFAULT NULL,
  `Judul` varchar(20) DEFAULT NULL,
  `Deskripsi` varchar(20) DEFAULT NULL,
  `Deadline` varchar(20) DEFAULT NULL,
  `Kode_MK` varchar(10) DEFAULT NULL
);

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`KodeTugas`, `Judul`, `Deskripsi`, `Deadline`, `Kode_MK`) VALUES
('T001', 'Subquery', 'Selesaikan latihan y', '2022-02-13', 'RL209'),
('T002', 'Fungsi', 'Latihan pada \nslide ', '2022-02-13', 'RL101'),
('T003', 'Turunan', 'Latihan pada slide p', '2022-03-01', 'RL101'),
('T004', 'NetID dan IP Address', 'Mengerjakan latihan ', '2022-03-01', 'RL110'),
('T005', 'Algoritma Round Robi', 'Mempraktikkan comman', '2022-03-10', 'RL303'),
('T006', 'White \nBox Testing &', 'Membedakan penggunaa', '2022-03-10', 'RL100');

-- --------------------------------------------------------

--
-- Table structure for table `upload_tugas`
--

CREATE TABLE `upload_tugas` (
  `Tanggal` varchar(10) DEFAULT NULL,
  `File` varchar(20) DEFAULT NULL,
  `Nilai` int(11) DEFAULT NULL,
  `KodeTugas` varchar(15) DEFAULT NULL,
  `NIM` int(11) DEFAULT NULL
);

--
-- Dumping data for table `upload_tugas`
--

INSERT INTO `upload_tugas` (`Tanggal`, `File`, `Nilai`, `KodeTugas`, `NIM`) VALUES
('2022-02-13', 'Tugas1_Daus.pdf', 100, 'T001', 202201),
('2022-02-14', 'Tugas1_Indra.pdf', 80, 'T001', 202202),
('2022-02-15', 'Tugas1_Vina.pdf', 78, 'T001', 202203),
('2022-02-13', 'Tugas2_Daus.pdf', 89, 'T002', 202201),
('2022-02-13', 'Tugas2_Indra.pdf', 76, 'T002', 202202),
('2022-02-13', 'Tugas3_Vina.pdf', 90, 'T002', 202203),
('2022-03-01', 'Tugas4_Annisa.pdf', 71, 'T003', 202204),
('2022-03-01', 'Tugas3_Indra.pdf', 88, 'T003', 202202),
('2022-03-01', 'Tugas3_Daus.pdf', 86, 'T003', 202201),
('2022-03-01', 'Tugas3_Vina.pdf', 92, 'T003', 202203),
('2022-03-04', 'Tugas5_Annisa.pdf', 100, 'T004', 202204);

-- --------------------------------------------------------

-- Get an overview of the data
SELECT * FROM dosen;
SELECT * FROM mahasiswa;
SELECT * FROM mata_kuliah;
SELECT * FROM detail_mk;
SELECT * FROM tugas;
SELECT * FROM upload_tugas;

-- --------------------------------------------------------

-- During the grade reporting meeting, lecturers are asked to display data on students who have 
-- grades above average in each course to be awarded by the study program. 
-- The grade data is created in a virtual table so that during the meeting the lecturer can be more efficient in displaying the data. 
-- Create a view based on that case!
CREATE VIEW mahasiswaAward AS
    SELECT m.NIM, m.Nama, m.Email, m.Telepon, m.Alamat, upt.Nilai
    FROM mahasiswa m 
    INNER JOIN upload_tugas upt
    WHERE Nilai > (SELECT AVG(Nilai) FROM upload_tugas)
;

SELECT * FROM mahasiswaAward;

-- --------------------------------------------------------

-- One of the lecturers is conducting research related to student grades based on their residence address. 
-- The lecturer often accesses the database to see the number of students from each address, the lecturer thinks of creating a view of the student table. 
-- Create a view based on that case!
CREATE VIEW jmlMhs_Alamat AS   
    SELECT Alamat, COUNT(Alamat) AS Jumlah_Mahasiswa
    FROM mahasiswa
    GROUP BY Alamat
;

SELECT * FROM jmlMhs_Alamat;

-- --------------------------------------------------------

-- At the end of the semester, the lecturer records students who must get a reduction in grades due to late submission of assignments. 
-- Based on the following case, create a view that displays the data of students who have submitted the assignment but exceeded the deadline of the assignment!
CREATE VIEW telat_mengumpulkan_tugas AS
    SELECT m.NIM, m.Nama, t.Kode_MK, t.Kode_Tugas, t.Deadline, upt.Tanggal
    FROM mahasiswa m
    JOIN upload_tugas upt ON m.NIM = upt.NIM
    JOIN tugas t ON upt.Kode_Tugas = t.Kode_Tugas
    WHERE upt.Tanggal > t.Deadline
;

SELECT * FROM telat_mengumpulkan_tugas;

-- --------------------------------------------------------

-- Student exam time is divided into two batches. 
-- The first group of students with even NIM and the second group of students with odd NIM.
-- Create a function so that you can see directly who is taking the exam in that cluster in ascending order.
DELIMITER //
CREATE FUNCTION get_exam_batch(NIM INT) RETURNS VARCHAR
BEGIN
    DECLARE exam_batch VARCHAR(50);
    IF nim % 2 = 0 THEN
        SET exam_batch = 'Kloter 1';
    ELSE
        SET exam_batch = 'Kloter 2';
    END IF;
    RETURN exam_batch;
END //
DELIMITER ;

SELECT * FROM mahasiswa ORDER BY exam_batch ASC;

-- --------------------------------------------------------

-- Create a function to determine student graduation based on the average grade of assignments from all courses.
-- When a student's nim is inputted, the average score will appear and a description of passing [>=80], not passing [=<50] and repeating [50<x<80].
DELIMITER //
CREATE FUNCTION get_grade_status(NIM INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE avg_grade FLOAT;
    DECLARE grade_status VARCHAR(20);
    SELECT AVG(Nilai) INTO avg_grade FROM upload_tugas
    WHERE NIM = NIM;
    IF avg_grade >= 80 THEN
        SET grade_status = 'Lulus';
    ELSEIF avg_grade <= 50 THEN
        SET grade_status = 'Tidak Lulus';
    ELSE 
        SET avg_grade = 'Mengulang';
    END IF;
    RETURN grade_status;
END //
DELIMITER ;

SELECT get_grade_status(202204);

-- -------------------------------------------------------

-- Create a function to display students who have never collected assignments in each course.
-- When the course code is entered, the name of the student who has not submitted the assignment at all is displayed.
DELIMITER //
CREATE FUNCTION not_submited(Kode_MK VARCHAR(5)) RETURNS VARCHAR(100)
BEGIN
    DEVLARE hasil VARCHAR(100);
    SELECT GROUP_CONCAT(m.Nama ORDER BY m.Nama ASC SEPARATOR ', ') INTO hasil FROM mahasiswa m
    WHERE m.NIM NOT IN(
        SELECT upt.NIM FROM upload_tugas upt
        JOIN TUGAS t ON upt.Kode_Tugas = t.Kode_Tugas AND t.Kode_MK = Kode_MK
        );
    RETURN hasil;
END //
DELIMITER ;

SELECT Kode_MK, Nama_MK, not_submited(Kode_MK) FROM mata_kuliah;

-- -------------------------------------------------------

