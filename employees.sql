-- Database: college_assignments (dummy data)
-- Queried using: MySQL on phpMyAdmin

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `job_id` int(11) NOT NULL,
  `salary` decimal(8,2) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
);

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `manager_id`, `department_id`) VALUES
(5039, 'Paul', 'Steve', 'stevepaul@yahoo.com', '021290193', '2018-11-20', 666, 9000.00, 9344, 1434),
(5084, 'Loui', 'Pamela', 'pamelaloui@yahoo.com', '021920220', '2019-09-11', 444, 8500.00, 9234, 1178),
(5096, 'Jill', 'Bays', 'baysjill@yahoo.com', '021903440', '2018-03-31', 888, 9000.00, 9273, 1340),
(5109, 'Jared', 'James', 'jamesjared@yahoo.com', '021901220', '2019-05-11', 777, 9500.00, 9019, 1123),
(5150, 'Ben', 'Rico', 'ricoben@yahoo.com', '21890980', '2018-07-15', 888, 9500.00, 9803, 1823),
(5198, 'Kim', 'Grace', 'gracekim@yahoo.com', '021857394', '2019-06-15', 555, 9000.00, 9450, 1342),
(5210, 'Tom', 'Brand', 'brandtom@yahoo.com', '021932454', '2018-06-02', 444, 5000.00, 9820, 1291),
(5237, 'Cailtin', 'Rawr', 'rawrcaitlin@yahoo.com', '021209129', '2018-02-09', 888, 7500.00, 9920, 1904),
(5329, 'Marry', 'Jane', 'janemarry@yahoo.com', '021291023', '2018-12-05', 666, 5500.00, 9364, 1456),
(5345, 'Bott', 'Andy', 'andybott@yahoo.com', '021392039', '2019-08-12', 555, 6500.00, 9930, 1345),
(5349, 'Lucas', 'Ben', 'benlucas@yahoo.com', '021293203', '2019-09-12', 444, 12500.00, 9344, 1434),
(5455, 'Park', 'Jung', 'jungpark@yahoo.com', '21930536', '2019-05-12', 777, 6000.00, 9425, 1120),
(5485, 'Billie', 'Wong', 'wongbillie@yahoo.com', '021202390', '2019-02-18', 555, 14500.00, 9349, 1439),
(5489, 'Alicia', 'Chase', 'chasealicia@yahoo.com', '021759309', '2019-06-12', 888, 8000.00, 9344, 1958),
(5604, 'Bond', 'Matt', 'mattbond@yahoo.com', '021291023', '2019-07-13', 666, 15000.00, 9364, 1456),
(5639, 'Mars', 'Bjorka', 'bjorkamars@yahoo.com', '021765902', '2019-03-22', 444, 7500.00, 9890, 1470),
(5726, 'Raline', 'Yoon', 'yoonraline@yahoo.com', '21894230', '2019-09-08', 555, 8500.00, 9348, 1290),
(5745, 'Ray', 'Smith', 'smithray@yahoo.com', '021839202', '2018-07-11', 777, 8500.00, 9976, 1235),
(5830, 'Carl', 'Drew', 'drewcarl@yahoo.com', '021903940', '2018-05-18', 888, 12500.00, 9974, 1290),
(5875, 'Yu', 'Peter', 'peteryu@yahoo.com', '021902849', '2018-03-02', 666, 7500.00, 9349, 1540),
(5902, 'John', 'Mark', 'markjohn@yahoo.com', '021236893', '2019-01-22', 777, 15000.00, 9328, 1393),
(5985, 'Arnold', 'King', 'kingarnold@yahoo.com', '021746903', '2019-11-24', 777, 12000.00, 9393, 1349);

-- --------------------------------------------------------

-- Get an overview of the data
SELECT * FROM employees;

-- --------------------------------------------------------

-- Show the average salary of all employees
SELECT AVG(salary) AS AverageSalary
FROM employees;

-- --------------------------------------------------------

-- Show the average salary for each job_id type
SELECT job_id, AVG(salary) AS AverageSalary
FROM employees
GROUP BY job_id;

-- --------------------------------------------------------

-- Show the highest and lowest salary for each type of job_id
SELECT job_id, MIN(salary) AS MinSalary, MAX(salary) AS MaxSalary
FROM employees
GROUP BY job_id;

-- --------------------------------------------------------

-- Show the employee names and job_ids that have salries above Rp3.000 and below Rp10.000 sorted by first_name
SELECT first_name, job_id, salary 
FROM employees
WHERE salary > 3000.00 AND salary < 10000.00 
ORDER BY first_name ASC;

-- --------------------------------------------------------

-- Show the average salary for each job_id whose average salary is greater than Rp5.000
SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) > 5000.00;
