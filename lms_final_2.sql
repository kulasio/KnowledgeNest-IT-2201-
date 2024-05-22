-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2024 at 09:14 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `assessment_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `quiz1_score` varchar(50) DEFAULT NULL,
  `quiz2_score` varchar(50) DEFAULT NULL,
  `quiz3_score` varchar(50) DEFAULT NULL,
  `act1_score` varchar(50) DEFAULT NULL,
  `act2_score` varchar(50) DEFAULT NULL,
  `act3_score` varchar(50) DEFAULT NULL,
  `Midterm_score` varchar(50) DEFAULT NULL,
  `FinalExam_score` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment`
--

INSERT INTO `assessment` (`assessment_id`, `course_id`, `student_id`, `quiz1_score`, `quiz2_score`, `quiz3_score`, `act1_score`, `act2_score`, `act3_score`, `Midterm_score`, `FinalExam_score`) VALUES
(1, 1, 1, '90', '85', '88', '95', '92', '91', '87', '88'),
(2, 2, 2, '85', '82', '90', '88', '86', '89', '84', '87'),
(3, 3, 3, '88', '90', '86', '91', '89', '87', '85', '89'),
(4, 4, 4, '92', '89', '91', '90', '88', '90', '88', '90'),
(5, 5, 5, '85', '88', '90', '86', '87', '88', '85', '89');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `course_description` text DEFAULT NULL,
  `course_start_date` date DEFAULT NULL,
  `course_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_code`, `course_description`, `course_start_date`, `course_end_date`) VALUES
(1, 'Java', 'JAVA101', 'Introduction to Java programming language.', '2024-05-10', '2024-08-01'),
(2, 'JavaScript', 'JS101', 'Introduction to JavaScript programming language.', '2024-05-15', '2024-08-15'),
(3, 'HTML', 'HTML101', 'Introduction to HTML.', '2024-05-20', '2024-08-20'),
(4, 'CSS', 'CSS101', 'Introduction to CSS.', '2024-05-25', '2024-08-25'),
(5, 'C++', 'CPP101', 'Introduction to C++ programming language.', '2024-05-30', '2024-08-30');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `e_fname` varchar(50) DEFAULT NULL,
  `e_lname` varchar(50) DEFAULT NULL,
  `e_username` varchar(50) DEFAULT NULL,
  `e_bdate` date DEFAULT NULL,
  `e_password` varchar(50) DEFAULT NULL,
  `e_email` varchar(100) DEFAULT NULL,
  `e_lastlogin` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `e_recanswer` varchar(50) DEFAULT NULL,
  `e_contactnumber` varchar(20) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `e_fname`, `e_lname`, `e_username`, `e_bdate`, `e_password`, `e_email`, `e_lastlogin`, `e_recanswer`, `e_contactnumber`, `course_id`) VALUES
(1, 'Emily', 'Wilson', 'emilywilson', '1980-06-06', 'password123', 'emily@example.com', '2024-05-05 01:00:00', 'answer1', '111-222-3333', 1),
(2, 'Daniel', 'Martinez', 'danielmartinez', '1975-07-07', 'password456', 'daniel@example.com', '2024-05-04 00:30:00', 'answer2', '444-555-6666', 2),
(3, 'Olivia', 'Taylor', 'oliviataylor', '1982-08-08', 'password789', 'olivia@example.com', '2024-05-03 02:15:00', 'answer3', '777-888-9999', 3),
(4, 'William', 'Anderson', 'williamanderson', '1978-09-09', 'passwordabc', 'william@example.com', '2024-05-02 04:30:00', 'answer4', '000-111-2222', 4),
(5, 'Sophia', 'Thomas', 'sophiathomas', '1984-10-10', 'passwordxyz', 'sophia@example.com', '2024-05-01 06:45:00', 'answer5', '333-444-5555', 5);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `student_id`, `course_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackid` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `s_contactnumber` varchar(20) DEFAULT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `feedbacktext` text DEFAULT NULL,
  `feedbackdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackid`, `student_id`, `employee_id`, `s_contactnumber`, `s_email`, `feedbacktext`, `feedbackdate`) VALUES
(1, 1, 1, '123-456-7890', 'john@example.com', 'Feedback text from John Doe to Emily Wilson', '2024-05-05 03:00:00'),
(2, 2, 2, '987-654-3210', 'alice@example.com', 'Feedback text from Alice Smith to Daniel Martinez', '2024-05-04 02:30:00'),
(3, 3, 3, '456-789-0123', 'bob@example.com', 'Feedback text from Bob Johnson to Olivia Taylor', '2024-05-03 04:45:00'),
(4, 4, 4, '789-012-3456', 'emma@example.com', 'Feedback text from Emma Brown to William Anderson', '2024-05-02 06:00:00'),
(5, 5, 5, '012-345-6789', 'michael@example.com', 'Feedback text from Michael Davis to Sophia Thomas', '2024-05-01 07:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `grade_id` bigint(20) UNSIGNED NOT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `grade_value` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`grade_id`, `assessment_id`, `student_id`, `grade_value`) VALUES
(1, 1, 1, 90.00),
(2, 2, 2, 86.00),
(3, 3, 3, 89.00),
(4, 4, 4, 90.00),
(5, 5, 5, 87.00);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(30) NOT NULL,
  `student_code` varchar(50) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `course_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_code`, `firstname`, `middlename`, `lastname`, `username`, `password`, `gender`, `address`, `course_id`, `date_created`) VALUES
(1, '62314', 'John', 'D', 'Smith', 'johnsmith', 'a', 'Female', 'Sample Address', 2, '2020-11-21 14:29:03'),
(2, '1415', 'Claire', 'G', 'Blake', 'claireblake', 'a', 'Female', 'Sample Address', 1, '2020-11-25 16:45:05'),
(3, '2001', 'Anthony', 'Edward', 'James', 'anthoyjames', 'a', 'Male', '123 Macatangay Street, Los Angeles, Batangas', 3, '2024-05-09 15:50:21'),
(4, '2002', 'Paul', 'Lee', 'Murray', 'paulmurray', 'a', 'Male', '456 Isaac Avenue, New York, Morato', 4, '2024-05-09 15:51:05'),
(5, '2003', 'Nik', 'Mak', 'Ino', 'nikino', 'a', 'Male', '789 Balmes Springs, Washington, Mataas na Kahoy', 5, '2024-05-09 15:51:51'),
(6, '2004', 'Siobe', 'Lemaw', 'Bols', 'siobebols', 'a', 'Female', '890 Albert Boulevard, North Korea, Ching Jong Un', 5, '2024-05-09 15:53:41'),
(7, '2005', 'Joannah', 'Simone', 'Bai', 'joannahbai', 'a', 'Female', '690 Villablanca Avenue, Oakland, Kahuyan City', 4, '2024-05-09 15:55:52'),
(8, '2006', 'Darrell', 'Plis', 'Pasa', 'darrellpasa', 'a', 'Male', '143 Teekyu Boulevard, Milwaukee, Sabang', 3, '2024-05-09 16:05:40'),
(9, '2007', 'Patricia', 'Uy', 'Halo', 'patriciahalo', 'a', 'Female', '315 Din Tai Fung Street, Shanghai, Lumpia', 2, '2024-05-09 16:06:39'),
(10, '2008', 'Pauleen', 'Letty', 'Macan', 'pauleenmacan', 'a', 'Female', '500 Phuc Street, New York, Cubao', 3, '2024-05-09 16:08:06'),
(11, '2009', 'Zion', 'Thanasis', 'Abubwebwe', 'zaionabubwebwe', 'a', 'Male', '765 Cherry Street, Satokyo, Hapon', 1, '2024-05-09 16:09:44'),
(12, '2010', 'Maria', 'EImi', 'Ozakada', 'mariaozakada', 'a', 'Female', '934 Blossom Street, Chernobyl, Rasha', 1, '2024-05-09 16:10:34'),
(24, '2069', 'Paul Nikko', 'd', 'Mission', 'nikkoM', 'passwor123', 'Male', 'anilao labac lipa batangas', 1, '2024-05-11 21:43:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`assessment_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackid`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessment`
--
ALTER TABLE `assessment`
  MODIFY `assessment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `enrollment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `grade_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
