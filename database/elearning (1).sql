-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2024 at 10:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewClass` (IN `department` INT(11), IN `course` INT(11), IN `level` VARCHAR(50), IN `section` VARCHAR(50))   BEGIN
    INSERT INTO class(
        department_id,
        course_id,
        level,
        section
    )
VALUES(
    department,
    course,
    LEVEL,
    section
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewCourse` (IN `course` VARCHAR(250), IN `description` TEXT)   BEGIN
    INSERT INTO course(
        course,
        description
    )
VALUES(
    course,
    description
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewDepartment` (IN `department` VARCHAR(250), IN `description` TEXT)   BEGIN
    INSERT INTO department(
        department,
        description
    )
VALUES(
    department,
    description
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewFaculty` (IN `p_firstname` VARCHAR(150), IN `p_middlename` VARCHAR(150), IN `p_lastname` VARCHAR(150), IN `p_email` VARCHAR(250), IN `p_contact` VARCHAR(150), IN `p_gender` VARCHAR(20), IN `p_address` TEXT, IN `p_department_id` INT(30))   BEGIN
    INSERT INTO faculty(
        firstname,
        middlename,
        lastname,
        email,
        contact,
        gender,
        address,
        department_id
    )
VALUES(
    p_firstname,
    p_middlename,
    p_lastname,
    p_email,
    p_contact,
    p_gender,
    p_address,
    p_department_id
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewStudent` (IN `p_student_id` VARCHAR(255), IN `p_firstname` VARCHAR(255), IN `p_middlename` VARCHAR(255), IN `p_lastname` VARCHAR(255), IN `p_email` VARCHAR(255), IN `p_contact` VARCHAR(255), IN `p_gender` VARCHAR(255), IN `p_address` TEXT, IN `p_class_no` INT(11))   BEGIN
    INSERT INTO students(
        student_id,
        firstname,
        middlename,
        lastname,
        email,
        contact,
        gender,
        address,
        class_no
    )
VALUES(
    p_student_id,
    p_firstname,
    p_middlename,
    p_lastname,
    p_email,
    p_contact,
    p_gender,
    p_address,
    p_class_no);
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewSubject` (IN `subject_code` VARCHAR(250), IN `description` TEXT)   BEGIN
    INSERT INTO subjects(
        subject_code,
        description
    )
VALUES(
    subject_code,
    description
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteClass` (IN `c_id` INT)   BEGIN
    DELETE FROM `class`
    WHERE `id` = c_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCourse` (IN `c_id` INT)   BEGIN
    DELETE FROM `course`
    WHERE `id` = c_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDepartment` (IN `d_id` INT)   BEGIN
    DELETE FROM `department`
    WHERE `id` = d_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFaculty` (IN `f_id` INT)   BEGIN
    DELETE FROM `faculty`
    WHERE `id` = f_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteStudent` (IN `s_id` INT)   BEGIN
    DELETE FROM `students`
    WHERE `id` = s_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteSubject` (IN `s_id` INT)   BEGIN
    DELETE FROM `subjects`
    WHERE `id` = s_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateClass` (IN `c_id` INT(11), IN `department` INT(11), IN `course` INT(11), IN `level` VARCHAR(50), IN `section` VARCHAR(50))   BEGIN
    UPDATE
        class
    SET
        department_id = department,
        course_id = course,
        LEVEL = LEVEL,
        section = section
    WHERE
        `id` = c_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCourse` (IN `c_id` INT(11), IN `course` VARCHAR(250), IN `description` TEXT)   BEGIN
    UPDATE
        course
    SET
        course = course,
        description = description
    WHERE
        `id` = c_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDepartment` (IN `d_id` INT(11), IN `department` VARCHAR(250), IN `description` TEXT)   BEGIN
    UPDATE
        department
    SET
        department = department,
        description = description
    WHERE
        `id` = d_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFaculty` (IN `f_id` INT, IN `p_firstname` VARCHAR(150), IN `p_middlename` VARCHAR(150), IN `p_lastname` VARCHAR(150), IN `p_email` VARCHAR(250), IN `p_contact` VARCHAR(150), IN `p_gender` VARCHAR(20), IN `p_address` TEXT, IN `p_deptid` INT(11))   BEGIN
    UPDATE
        faculty
    SET
    	firstname = p_firstname,
        middlename = p_middlename,
        lastname = p_lastname,
        email = p_email,
        contact = p_contact,
        gender = p_gender,
        address = p_address,
        department_id = p_deptid
    WHERE
        `id` = f_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStudent` (IN `s_id` INT, IN `p_firstname` VARCHAR(150), IN `p_middlename` VARCHAR(150), IN `p_lastname` VARCHAR(150), IN `p_email` VARCHAR(250), IN `p_contact` VARCHAR(150), IN `p_gender` VARCHAR(20), IN `p_address` TEXT, IN `p_class_no` INT(11))   BEGIN
	if p_firstname = (select firstname from students where id = s_id) THEN
       set p_firstname = (select firstname from students where id = s_id);
     end if;
    UPDATE
        students
    SET
        firstname = p_firstname,
        middlename = p_middlename,
        lastname = p_lastname,
        email = p_email,
        contact = p_contact,
        gender = p_gender,
        address = p_address,
        class_no = p_class_no
    WHERE
        `id` = s_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateSubject` (IN `s_id` INT(11), IN `subject_code` VARCHAR(250), IN `description` TEXT)   BEGIN
    UPDATE
        subjects
    SET
        subject_code = subject_code,
        description = description
    WHERE
        `id` = s_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `academic_year`
--

CREATE TABLE `academic_year` (
  `id` int(30) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `sy` varchar(150) NOT NULL,
  `status` tinyint(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_year`
--

INSERT INTO `academic_year` (`id`, `academic_year_id`, `sy`, `status`) VALUES
(1, 1, '2021-2025', 1);

-- --------------------------------------------------------

--
-- Table structure for table `backup_class`
--

CREATE TABLE `backup_class` (
  `id` int(11) NOT NULL,
  `department_id` int(30) NOT NULL,
  `course_id` int(30) NOT NULL,
  `level` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `backup_class`
--

INSERT INTO `backup_class` (`id`, `department_id`, `course_id`, `level`, `section`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '3', 'A', '2023-12-08 07:28:47', '2023-12-08 07:28:47'),
(2, 2, 1, '3', 'B', '2023-12-08 07:28:47', '2023-12-08 07:28:47'),
(3, 0, 0, '', '', '2023-12-08 07:28:47', '2023-12-08 07:28:47'),
(20, 3, 4, 'Qt', 'Z', '2024-01-07 05:41:38', '2024-01-07 05:41:38'),
(21, 7, 22, '4', '1', '2024-01-07 06:53:52', '2024-01-07 06:53:52'),
(21, 7, 22, '10', '1', '2024-01-07 06:53:52', '2024-01-07 06:59:19'),
(21, 4, 22, '10', '6', '2024-01-07 06:53:52', '2024-01-07 06:59:53'),
(21, 4, 22, '10', '6', '2024-01-07 06:53:52', '2024-01-07 06:59:53'),
(19, 4, 4, '0', 'QYRTRt', '2024-01-07 05:40:56', '2024-01-07 06:53:20'),
(22, 7, 2, 'ddddd', 'dddd', '2024-01-07 08:35:35', '2024-01-07 08:35:35'),
(22, 7, 2, 'dsdssd', 'dddd', '2024-01-07 08:35:35', '2024-01-07 08:35:58'),
(22, 7, 2, 'dsdssd', 'dddd', '2024-01-07 08:35:35', '2024-01-07 08:35:58'),
(23, 13, 5, 'SSSS', 'SSS', '2024-01-07 08:52:27', '2024-01-07 08:52:27'),
(23, 13, 5, 'SSSS', 'SSS', '2024-01-07 08:52:27', '2024-01-07 08:52:27'),
(24, 15, 2, '1', 'A', '2024-01-07 08:53:23', '2024-01-07 08:53:23'),
(25, 15, 2, '1', 'N', '2024-01-07 08:53:58', '2024-01-07 08:53:58'),
(25, 15, 2, '2', 'B', '2024-01-07 08:53:58', '2024-01-07 08:54:11'),
(26, 15, 1, '1', 'A', '2024-01-07 08:54:34', '2024-01-07 08:54:34'),
(27, 15, 1, '1', 'B', '2024-01-07 08:54:41', '2024-01-07 08:54:41'),
(28, 15, 1, '2', 'A', '2024-01-07 08:54:46', '2024-01-07 08:54:46'),
(29, 15, 1, '2', 'B', '2024-01-07 08:54:49', '2024-01-07 08:54:49');

-- --------------------------------------------------------

--
-- Table structure for table `backup_course`
--

CREATE TABLE `backup_course` (
  `id` int(11) NOT NULL,
  `course` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `backup_course`
--

INSERT INTO `backup_course` (`id`, `course`, `description`, `date_added`, `date_updated`) VALUES
(1, 'BSIS', 'BS INFORMATION SYSTEM', '2023-12-03 08:08:50', '2023-12-03 08:45:14'),
(2, 'BSCS', 'BS COMPUTER SCIENCE', '2023-12-03 06:23:11', '2023-12-03 06:21:44'),
(3, 'BSIT', 'BS INFORMATION TECHNOLOGY', '2023-12-03 06:23:11', '2023-12-03 06:22:00'),
(4, 'BSEMC', 'BS ENTERTAINMENT AND MULTIMEDIA COMPUTING', '2023-12-03 06:23:11', '2023-12-03 06:22:29'),
(5, 'BSE', 'BS EDUCATION MAJOR IN ENGLISHS', '2023-12-08 07:25:53', '2023-12-08 07:26:11'),
(3, 'BSIT', 'BS INFORMATION TECHNOLOGY1', '2023-12-03 06:23:11', '2023-12-08 08:08:49'),
(3, 'BSIT', 'BS INFORMATION TECHNOLOGY2', '2023-12-03 06:23:11', '2023-12-08 08:09:10'),
(3, 'BSIT', 'BS INFORMATION TECHNOLOGY', '2023-12-03 06:23:11', '2023-12-08 08:26:28'),
(2, 'BSCS', 'BS COMPUTER SCIENCED', '2023-12-03 06:23:11', '2023-12-08 12:26:52'),
(2, 'BSCS', 'BS COMPUTER SCIENCES', '2023-12-03 06:23:11', '2023-12-08 12:26:58'),
(2, 'BSCS', 'BS COMPUTER SCIENCE', '2023-12-03 06:23:11', '2023-12-08 15:51:59'),
(0, 'TEST2', 'HELLO WORLD1', '2023-12-09 02:21:18', '2023-12-09 02:22:18'),
(2, 'BSCS', 'BS COMPUTER SCIENCES', '2023-12-03 06:23:11', '2023-12-09 12:32:10'),
(2, 'BSCS', 'BS COMPUTER SCIENCE\r\n', '2023-12-03 06:23:11', '2023-12-09 12:32:20'),
(5, 'BSE', 'BS EDUCATION MAJOR IN ENGLISH', '2023-12-08 07:25:53', '2023-12-09 13:01:58'),
(14, 'PE', 'PHYSICAL EDUCATIONS', '2023-12-09 13:00:48', '2023-12-09 13:03:49'),
(15, 'PE', 'PHYSICAL EDUCATIONSSSSSS', '2023-12-09 14:22:33', '2023-12-09 14:25:09'),
(15, 'PE', 'PHYSICAL EDUCATION', '2023-12-09 14:22:33', '2023-12-09 14:32:53'),
(16, 'GEE', 'CONTEMPORARY WORLDS', '2023-12-09 14:33:57', '2023-12-09 14:35:48'),
(15, 'PEE', 'PHYSICAL EDUCATION', '2023-12-09 14:22:33', '2023-12-09 15:49:49'),
(15, 'PEE', 'PHYSICAL EDUCATIONS', '2023-12-09 14:22:33', '2023-12-09 15:50:19'),
(18, 'BSEE', 'TESTERS', '2023-12-10 15:08:36', '2023-12-10 15:08:55'),
(19, 'BSIIT', 'TESTEReros', '2023-12-10 15:13:30', '2023-12-10 15:14:56'),
(22, 'MONICA', 'DSDDDD', '2024-01-07 05:57:28', '2024-01-07 05:57:28'),
(22, 'MONICArt', 'DSDDDD', '2024-01-07 05:57:28', '2024-01-07 06:58:42'),
(22, 'MONICArt', 'DSDDDD', '2024-01-07 05:57:28', '2024-01-07 06:58:42'),
(19, 'BSIIT', 'TESTEReros', '2023-12-10 15:13:30', '2023-12-10 15:14:56'),
(23, 'DSD', 'DSDSD', '2024-01-07 07:45:10', '2024-01-07 07:45:10'),
(23, 'DSD', 'DSDSD', '2024-01-07 07:45:10', '2024-01-07 07:45:10'),
(24, 'DSSDS', 'DSDSDD', '2024-01-07 07:46:27', '2024-01-07 07:46:27'),
(25, 'DSDSD', 'DSDSD', '2024-01-07 07:46:33', '2024-01-07 07:46:33'),
(25, 'DSDSD', 'DSDSD', '2024-01-07 07:46:33', '2024-01-07 07:46:33'),
(26, 'MONICA', 'SS', '2024-01-07 08:36:36', '2024-01-07 08:36:36'),
(26, 'MONI', 'SS', '2024-01-07 08:36:36', '2024-01-07 08:37:24'),
(26, 'MONI', 'SS', '2024-01-07 08:36:36', '2024-01-07 08:37:24'),
(27, 'VAT', 'SSSSS', '2024-01-07 08:40:50', '2024-01-07 08:40:50'),
(28, 'SS', 'DDD', '2024-01-07 08:41:43', '2024-01-07 08:41:43'),
(28, 'SS', 'DDD', '2024-01-07 08:41:43', '2024-01-07 08:41:43'),
(27, 'VAT', 'SSSSS', '2024-01-07 08:40:50', '2024-01-07 08:40:50'),
(24, 'DSSDS', 'DSDSDD', '2024-01-07 07:46:27', '2024-01-07 07:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `backup_department`
--

CREATE TABLE `backup_department` (
  `id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `department` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `backup_department`
--

INSERT INTO `backup_department` (`id`, `department_id`, `department`, `description`, `date_added`, `date_updated`) VALUES
(0, NULL, 'CATa', 'ddsdsdddvtrgt', '2024-01-07 06:01:45', '2024-01-07 07:29:55'),
(1, 1, 'COE', 'COLLEGE OF EDUCATION', '2023-12-03 07:36:56', '2023-12-09 14:52:28'),
(2, 2, 'CSD', 'COMPUTER STUDIES DEPARTMENT\r\n', '2023-12-03 07:37:14', '2023-12-03 07:37:14'),
(6, 0, 'COCOMELON', 'TESTs\r\n', '2023-12-09 16:29:51', '2023-12-09 16:30:09'),
(7, NULL, 'CATssss', 'ddsdsdddvtrgt', '2024-01-07 06:01:45', '2024-01-07 06:01:45'),
(8, NULL, 'CATssss', 'ss', '2024-01-07 07:31:54', '2024-01-07 07:31:54'),
(8, NULL, 'CATrrr', 'ss', '2024-01-07 07:31:54', '2024-01-07 07:31:59'),
(8, NULL, 'CATrrr', 'ss', '2024-01-07 07:31:54', '2024-01-07 07:31:59'),
(9, NULL, 'BSIC', 'ss', '2024-01-07 08:37:59', '2024-01-07 08:37:59'),
(9, NULL, 'BSICa', 'ss', '2024-01-07 08:37:59', '2024-01-07 08:38:32'),
(9, NULL, 'BSICa', 'ss', '2024-01-07 08:37:59', '2024-01-07 08:38:32'),
(7, NULL, 'CATa', 'ddsdsdddvtrgt', '2024-01-07 06:01:45', '2024-01-07 07:29:55'),
(4, NULL, 'COP', 'ss', '2024-01-06 17:16:34', '2024-01-06 17:16:34'),
(3, NULL, 'COre', 'ss', '2024-01-06 17:05:25', '2024-01-06 17:05:31'),
(10, NULL, 'CSD', 'Computer Science Department', '2024-01-07 08:44:21', '2024-01-07 08:44:21'),
(11, NULL, 'COE', 'COLLEGE OF EDUCATION', '2024-01-07 08:47:05', '2024-01-07 08:47:05'),
(12, NULL, 'CBA ', 'COLLEGE OF BUSINESS AND ACCOUNTANCY', '2024-01-07 08:49:33', '2024-01-07 08:49:33'),
(13, NULL, 'CLAS', 'College of Liberal Arts and Sciences', '2024-01-07 08:49:58', '2024-01-07 08:49:58'),
(10, NULL, 'CSD', 'COMPUTER SCIENCE DEPARTMENT', '2024-01-07 08:44:21', '2024-01-07 08:50:18'),
(10, NULL, 'COC', 'COLLEGE OF CRIMINOLOGY', '2024-01-07 08:44:21', '2024-01-07 08:50:41'),
(14, NULL, 'COL', 'COLLEGE OF LAW', '2024-01-07 08:51:09', '2024-01-07 08:51:09'),
(13, NULL, 'CLAS', 'COLLEGE OF LIBERAL ARTS AND SCIENCES', '2024-01-07 08:49:58', '2024-01-07 08:51:52'),
(15, NULL, 'CSD', 'COMPUTER SCIENCE DEPARTMENT', '2024-01-07 08:53:07', '2024-01-07 08:53:07');

-- --------------------------------------------------------

--
-- Table structure for table `backup_faculty`
--

CREATE TABLE `backup_faculty` (
  `id` int(11) NOT NULL,
  `department_id` int(30) NOT NULL,
  `firstname` varchar(150) NOT NULL,
  `middlename` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `contact` varchar(150) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `backup_faculty`
--

INSERT INTO `backup_faculty` (`id`, `department_id`, `firstname`, `middlename`, `lastname`, `email`, `contact`, `gender`, `address`, `date_added`, `date_updated`) VALUES
(1, 1, 'Leonor', '', 'Rivera', 'leonor@rivera.abc', '09213391313', 'Female', 'Pasig, Philippines', '2023-12-03 06:25:48', '2023-12-03 06:25:48'),
(2, 2, 'Andres', '', 'Bonifacio', 'bonifacioandres@abc.com', '09349318870', 'Male', 'Caloocan, Philippines', '2023-12-03 06:28:10', '2023-12-03 06:28:10'),
(3, 2, 'Gabriella', '', 'Silang', 'gabriella.silang@xyz.com', '09303150890', 'Female', 'Pasay, Philippines', '2023-12-03 06:35:08', '2023-12-03 06:35:08'),
(6, 7, 'luffy', 'd', 'dsd', 'dsd', 'dadas', 'F', 'dsadadd', '2024-01-07 06:17:39', '2024-01-07 06:17:39'),
(6, 7, 'fully', 'd', 'dsd', 'dsd', 'dadas', 'F', 'dsadadd', '2024-01-07 06:17:39', '2024-01-07 06:49:35'),
(6, 7, 'potaaaaa', 'd', 'dsd', 'dsd', 'dadas', 'F', 'dsadadd', '2024-01-07 06:17:39', '2024-01-07 07:06:29'),
(6, 7, 'bitchcccc', 'd', 'dsd', 'dsd', 'dadas', 'F', 'dsadadd', '2024-01-07 06:17:39', '2024-01-07 07:06:41'),
(6, 7, 'bitchcccc', 'd', 'dsd', 'dsd', 'dadas', 'F', 'dsadadd', '2024-01-07 06:17:39', '2024-01-07 07:06:41'),
(7, 7, 'Naruto ', 's', 's', 'ss', 's', 'M', 's', '2024-01-07 08:39:01', '2024-01-07 08:39:01'),
(7, 7, 'Naruta', 's', 's', 'ss', 's', 'M', 's', '2024-01-07 08:39:01', '2024-01-07 08:39:12'),
(7, 7, 'Naruta', 's', 's', 'ss', 's', 'M', 's', '2024-01-07 08:39:01', '2024-01-07 08:39:12'),
(5, 4, 'swsw', 'www', 'ww', 's', 'www', 'F', 'wwww', '2024-01-07 02:05:37', '2024-01-07 02:05:37'),
(8, 11, 'Liam', 'zay', 'Alburo', 'liam@gmail.com', '0934638392323', 'M', 'Amparo', '2024-01-07 08:48:18', '2024-01-07 08:48:18'),
(3, 10, 'Monica', 'Rumbide', 'Alburo', 'monicalburo@gmail.com', '09276245251', 'M', 'amparo', '2024-01-06 15:09:00', '2024-01-07 08:48:24');

-- --------------------------------------------------------

--
-- Table structure for table `backup_students`
--

CREATE TABLE `backup_students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `firstname` varchar(150) NOT NULL,
  `middlename` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `contact` varchar(150) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `class_no` int(11) NOT NULL,
  `date_added` date NOT NULL DEFAULT current_timestamp(),
  `date_updated` int(11) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `backup_students`
--

INSERT INTO `backup_students` (`id`, `student_id`, `firstname`, `middlename`, `lastname`, `email`, `contact`, `gender`, `address`, `class_no`, `date_added`, `date_updated`) VALUES
(84, 'S2', 'fdf', 'Rumbide', 'Alburod', 'dddd', 'ddddd', 'F', 'ddd', 10, '2024-01-07', 2147483647),
(85, 'S2', 'ricaaa', 'Rumbide', 'Alburod', 'dddd', 'ddddd', 'F', 'ddd', 10, '2024-01-07', 2147483647),
(84, 'S2', 'ricooo', 'Rumbide', 'Alburod', 'dddd', 'ddddd', 'F', 'ddd', 10, '2024-01-07', 2147483647),
(84, 'S2', 'ricooo', 'Rumbide', 'Alburod', 'amaaa', 'ddddd', 'F', 'ddd', 10, '2024-01-07', 2147483647),
(84, 'S2', 'ricooo', 'Rumbide', 'Alburod', 'ptattata', 'ddddd', 'F', 'ddd', 10, '2024-01-07', 2147483647),
(85, 'S16', 'sweett', 'sweett', 'sweett', 'sweett', '2', 'F', 'sweett', 10, '2024-01-07', 2147483647),
(85, 'S16', 'sweett', 'sweett', 'sweett', 'sweett', '2', 'F', 'sweett', 10, '2024-01-07', 2147483647),
(81, 'ereeee', 'Naruto ', 'd', 'd', 'd', 'dd', 'M', 'd', 11, '2024-01-07', 2147483647),
(82, 'potsedsa', 'Naruto ', 'dsdsd', 'ssdsdsdsd', 'dsdd', 'dsd', 'M', 'dsd', 13, '2024-01-07', 2147483647),
(83, 'ereeee', 'bbubbub', 'buubbu', 'uubu', 'ubbbu', 'ubub', 'F', 'bubub', 10, '2024-01-07', 2147483647),
(84, 'S2', 'ricooo', 'Rumbide', 'Alburod', 'ptattata', 'ddddd', 'F', 'ddd', 10, '2024-01-07', 2147483647),
(79, 'ffdf', 'fakkkku', 'affafa', 'fafafaf', 'afaff', 'fafa', 'F', 'ffaf', 10, '2024-01-07', 2147483647),
(71, 'S8', 'Saradas', 'Haruno ', 'Uchiha', 'Boruto@gmail.com', '097857878909', 'F', 'Konohagakure', 7, '2024-01-05', 2147483647),
(71, 'S8', 'Saradas', 'Haruno ', 'Uchiha', 'Boruto@gmail.com', '097857878909', 'F', 'Konohagakure', 7, '2024-01-05', 2147483647),
(68, 'S3', 'Noelle', 'A', 'Silva', 'Asta@gmail.com', '093432023990', 'F', 'Clover Kingdom', 7, '2024-01-05', 2147483647),
(86, 'S2', 'Secre', 'A', 'Swallowtail', 'Secre@gmail.com', '0983743283', 'F', 'Clover Kingdom', 11, '2024-01-07', 2147483647),
(87, 'S10', 'Naruto ', 's', 's', 's', 's', 'F', 's', 11, '2024-01-07', 2147483647),
(87, 'S10', 'Naruta', 's', 's', 's', 's', 'F', 's', 11, '2024-01-07', 2147483647),
(87, 'S10', 'Naruta', 's', 's', 's', 's', 'F', 's', 11, '2024-01-07', 2147483647),
(88, 'S9', 'Izuku', 'A', 'Midoriya', 'midoriya@gmail.com', '43434342342443', 'M', 'UA', 24, '2024-01-07', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `backup_subjects`
--

CREATE TABLE `backup_subjects` (
  `id` int(11) NOT NULL,
  `subject_code` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `backup_subjects`
--

INSERT INTO `backup_subjects` (`id`, `subject_code`, `description`, `date_added`, `date_updated`) VALUES
(0, 'CCS 001', 'TECHNICAL COMPUTER CONCEPTS', '2023-12-08 10:11:27', '2023-12-08 10:11:27'),
(1, 'IS 102', 'ENTERPRISE RESOURCE PLANNING', '2023-12-02 22:11:23', '2023-12-02 22:11:23'),
(2, 'IS 103', 'DATABASE SYSTEMS ENTERPRISE', '2023-12-02 22:12:04', '2023-12-02 22:12:04'),
(3, 'IS 104', 'IS INNOVATIONS & NEW TECHNOLOGIES', '2023-12-02 22:12:37', '2023-12-02 22:12:37'),
(4, 'IS 105', 'ENTERPRISE ARCHITECTURE\r\n', '2023-12-02 22:13:05', '2023-12-02 22:13:05'),
(5, 'IS 106', 'IS MAJOR ELECTIVE 1', '2023-12-02 22:13:26', '2023-12-02 22:13:26'),
(6, 'CCS 118', 'MULTIMEDIA SYSTEMS', '2023-12-02 22:13:39', '2023-12-02 22:13:39'),
(7, 'RES 001', 'METHODS OF RESEARCH', '2023-12-03 00:30:13', '2023-12-03 00:30:13'),
(7, 'RES 001', 'METHODS OF RESEARCHS', '2023-12-03 00:30:13', '2023-12-08 10:13:54'),
(7, 'RES 001', 'METHODS OF RESEARCH', '2023-12-03 00:30:13', '2023-12-08 10:14:19'),
(7, 'RES 001', 'METHODS OF RESEARCHS', '2023-12-03 00:30:13', '2023-12-09 15:17:36'),
(8, 'MMA', 'TESTS\r\n', '2023-12-09 15:27:32', '2023-12-09 15:27:49'),
(8, 'MaMA', 'TESTS\r\n', '2023-12-09 15:27:32', '2023-12-09 15:49:16'),
(16, 'BITCH', 'SHIFF', '2024-01-07 05:52:03', '2024-01-07 05:52:03'),
(16, 'BITCHsssss', 'SHIFFsss', '2024-01-07 05:52:03', '2024-01-07 07:25:58'),
(17, 'C', 'CCCCX', '2024-01-07 07:55:56', '2024-01-07 07:55:56'),
(18, 'MATH', 'DDDDD', '2024-01-07 08:33:18', '2024-01-07 08:33:18'),
(18, 'MATH', 'ttttttt', '2024-01-07 08:33:18', '2024-01-07 08:33:45'),
(18, 'MATH', 'DDDDD', '2024-01-07 08:33:18', '2024-01-07 08:33:18'),
(16, 'BITCa', 'SHIFFsss', '2024-01-07 05:52:03', '2024-01-07 08:34:22'),
(16, 'BITCHsssss', 'SHIFFsss', '2024-01-07 05:52:03', '2024-01-07 07:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `level` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `department_id`, `course_id`, `level`, `section`, `created_at`, `updated_at`) VALUES
(7, 2, 3, '4', 'E', '2023-12-10 16:19:33', '2023-12-10 16:19:33'),
(10, 4, 4, 'xxxx', '1', '2024-01-07 01:47:53', '2024-01-07 01:47:53'),
(11, 4, 5, '4', 'E', '2024-01-07 01:48:34', '2024-01-07 01:48:34'),
(13, 3, 3, 'bababa', 'F', '2024-01-07 05:14:48', '2024-01-07 05:14:48'),
(14, 4, 4, 'teraaa', '1', '2024-01-07 05:30:48', '2024-01-07 05:30:48'),
(20, 3, 4, 'Qt', 'Z', '2024-01-07 05:41:38', '2024-01-07 05:41:38'),
(24, 15, 2, '1', 'A', '2024-01-07 08:53:23', '2024-01-07 08:53:23'),
(25, 15, 2, '2', 'B', '2024-01-07 08:53:58', '2024-01-07 08:54:11'),
(26, 15, 1, '1', 'A', '2024-01-07 08:54:34', '2024-01-07 08:54:34'),
(27, 15, 1, '1', 'B', '2024-01-07 08:54:41', '2024-01-07 08:54:41'),
(28, 15, 1, '2', 'A', '2024-01-07 08:54:46', '2024-01-07 08:54:46'),
(29, 15, 1, '2', 'B', '2024-01-07 08:54:49', '2024-01-07 08:54:49');

--
-- Triggers `class`
--
DELIMITER $$
CREATE TRIGGER `backup_class` AFTER INSERT ON `class` FOR EACH ROW BEGIN
INSERT INTO backup_class (id, department_id, course_id, level, section, created_at, updated_at) 

VALUES (NEW.id, NEW.department_id, NEW.course_id, NEW.level, NEW.section, NEW.created_at, NEW.updated_at); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_class_D` AFTER DELETE ON `class` FOR EACH ROW BEGIN
    INSERT INTO backup_class(
        id,
        department_id,
        course_id,
        LEVEL,
        section,
        created_at,
        updated_at
    )
VALUES(
    OLD.id,
    OLD.department_id,
    OLD.course_id,
    OLD.level,
    OLD.section,
    OLD.created_at,
    OLD.updated_at
);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_class_update` AFTER UPDATE ON `class` FOR EACH ROW BEGIN
INSERT INTO backup_class (id, department_id, course_id, level, section, created_at, updated_at) 

VALUES (NEW.id, NEW.department_id, NEW.course_id, NEW.level, NEW.section, NEW.created_at, NEW.updated_at); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `class_information`
-- (See below for the actual view)
--
CREATE TABLE `class_information` (
`id` int(11)
,`department_id` int(11)
,`course_id` int(11)
,`department` varchar(250)
,`course` varchar(250)
,`level` varchar(50)
,`section` varchar(50)
,`subject_description` text
);

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `academic_year_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_subjects`
--

INSERT INTO `class_subjects` (`academic_year_id`, `class_id`, `subject_id`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(2, 1, 1),
(2, 2, 2),
(1, 4, 3),
(1, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects_faculty`
--

CREATE TABLE `class_subjects_faculty` (
  `academic_year_id` int(30) NOT NULL,
  `faculty_id` varchar(50) NOT NULL,
  `class_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_subjects_faculty`
--

INSERT INTO `class_subjects_faculty` (`academic_year_id`, `faculty_id`, `class_id`, `subject_id`) VALUES
(1, '12345', 1, 1),
(1, '12345', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `course` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `course`, `description`, `date_added`, `date_updated`) VALUES
(1, 'BSIS', 'BS INFORMATION SYSTEM', '2023-12-03 08:08:50', '2023-12-03 08:45:14'),
(2, 'BSCS', 'BS COMPUTER SCIENCE\r\n', '2023-12-03 06:23:11', '2023-12-09 12:32:20'),
(3, 'BSIT', 'BS INFORMATION TECHNOLOGY', '2023-12-03 06:23:11', '2023-12-08 08:26:28'),
(4, 'BSEMC', 'BS ENTERTAINMENT AND MULTIMEDIA COMPUTING', '2023-12-03 06:23:11', '2023-12-08 07:24:48'),
(5, 'BSE', 'BS EDUCATION MAJOR IN ENGLISH', '2023-12-08 07:25:53', '2023-12-09 13:01:58');

--
-- Triggers `course`
--
DELIMITER $$
CREATE TRIGGER `backup_course` AFTER INSERT ON `course` FOR EACH ROW BEGIN
INSERT INTO backup_course (id,course, description, date_added, date_updated) 

VALUES (NEW.id, NEW.course, NEW.description, NEW.date_added, NEW.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_course_d` AFTER DELETE ON `course` FOR EACH ROW BEGIN
    INSERT INTO backup_course(
        id,
        course,
        description,
        date_added,
        date_updated
    )
VALUES(
    old.id,
    old.course,
    old.description,
    old.date_added,
    old.date_updated
);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_data_course` AFTER UPDATE ON `course` FOR EACH ROW BEGIN
INSERT INTO backup_course (id, course, description, date_added, date_updated) 
    VALUES (NEW.id, NEW.course, NEW.description,NEW.date_added, NEW.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `course_uppercase` BEFORE INSERT ON `course` FOR EACH ROW BEGIN
    SET NEW.course = UPPER(NEW.course);
    SET NEW.description = UPPER(NEW.description);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `course_information`
-- (See below for the actual view)
--
CREATE TABLE `course_information` (
`id` int(11)
,`course` varchar(250)
,`description` text
,`date_added` timestamp
,`date_updated` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `department` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department_id`, `department`, `description`, `date_added`, `date_updated`) VALUES
(10, NULL, 'COC', 'COLLEGE OF CRIMINOLOGY', '2024-01-07 08:44:21', '2024-01-07 08:50:41'),
(11, NULL, 'COE', 'COLLEGE OF EDUCATION', '2024-01-07 08:47:05', '2024-01-07 08:47:05'),
(12, NULL, 'CBA ', 'COLLEGE OF BUSINESS AND ACCOUNTANCY', '2024-01-07 08:49:33', '2024-01-07 08:49:33'),
(13, NULL, 'CLAS', 'COLLEGE OF LIBERAL ARTS AND SCIENCES', '2024-01-07 08:49:58', '2024-01-07 08:51:52'),
(14, NULL, 'COL', 'COLLEGE OF LAW', '2024-01-07 08:51:09', '2024-01-07 08:51:09'),
(15, NULL, 'CSD', 'COMPUTER SCIENCE DEPARTMENT', '2024-01-07 08:53:07', '2024-01-07 08:53:07');

--
-- Triggers `department`
--
DELIMITER $$
CREATE TRIGGER `backup_data_department` AFTER UPDATE ON `department` FOR EACH ROW BEGIN
INSERT INTO backup_department (id, department_id, department, description, date_added, date_updated) 

VALUES ( NEW.id, NEW.department_id, NEW.department, NEW.description, NEW.date_added, NEW.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_department` AFTER INSERT ON `department` FOR EACH ROW BEGIN
INSERT INTO backup_department (id, department_id, department, description, date_added , date_updated) 

VALUES (NEW.id, NEW.department_id, NEW.department, NEW.description, NEW.date_added, NEW.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_department_d` AFTER DELETE ON `department` FOR EACH ROW BEGIN
INSERT INTO backup_department (id, department_id, department, description, date_added, date_updated) 

VALUES ( old.id, old.department_id, old.department, old.description, old.date_added, old.date_updated); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `department_information`
-- (See below for the actual view)
--
CREATE TABLE `department_information` (
`id` int(11)
,`department` varchar(250)
,`description` text
,`date_added` timestamp
,`date_updated` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL,
  `firstname` varchar(150) DEFAULT NULL,
  `middlename` varchar(150) DEFAULT NULL,
  `lastname` varchar(150) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `contact` varchar(150) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `firstname`, `middlename`, `lastname`, `email`, `contact`, `gender`, `address`, `password`, `department_id`, `date_added`, `date_updated`) VALUES
(3, 'Monica', 'Rumbide', 'Alburo', 'monicalburo@gmail.com', '09276245251', 'M', 'amparo', NULL, 10, '2024-01-06 15:09:00', '2024-01-07 08:48:24'),
(8, 'Liam', 'zay', 'Alburo', 'liam@gmail.com', '0934638392323', 'M', 'Amparo', NULL, 11, '2024-01-07 08:48:18', '2024-01-07 08:48:18');

--
-- Triggers `faculty`
--
DELIMITER $$
CREATE TRIGGER `backup_data_faculty` AFTER UPDATE ON `faculty` FOR EACH ROW BEGIN
INSERT INTO backup_faculty (id, department_id, firstname, middlename, lastname, email, contact, gender, address, date_added, date_updated) 
    VALUES (NEW.id, NEW.department_id, NEW.firstname, NEW.middlename, NEW.lastname, NEW.email, NEW.contact, NEW.gender, NEW.address, NEW.date_added, NEW.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_faculty` AFTER INSERT ON `faculty` FOR EACH ROW BEGIN
INSERT INTO backup_faculty (id, department_id, firstname, middlename, lastname, email, contact, gender, address, date_added, date_updated) 

VALUES (NEW.id, NEW.department_id, NEW.firstname, NEW.middlename, NEW.lastname, NEW.email, NEW.contact, NEW.gender, NEW.address, NEW.date_added, NEW.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_faculty_d` AFTER DELETE ON `faculty` FOR EACH ROW BEGIN
INSERT INTO backup_faculty (id, department_id, firstname, middlename, lastname, email, contact, gender, address, date_added, date_updated) 
    VALUES (old.id, old.department_id, old.firstname, old.middlename, old.lastname, old.email, old.contact, old.gender, old.address, old.date_added, old.date_updated); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `faculty_information`
-- (See below for the actual view)
--
CREATE TABLE `faculty_information` (
`id` int(11)
,`firstname` varchar(150)
,`middlename` varchar(150)
,`lastname` varchar(150)
,`email` varchar(250)
,`contact` varchar(150)
,`gender` varchar(20)
,`address` text
,`password` text
,`department_id` int(11)
,`department` varchar(250)
);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(30) NOT NULL,
  `academic_year_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL,
  `faculty_id` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `ppt_path` text DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `academic_year_id`, `subject_id`, `faculty_id`, `title`, `description`, `ppt_path`, `date_added`, `date_updated`) VALUES
(1, 1, 2, '12345', 'Lesson 101 Test', '&lt;h2 style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;&quot;=&quot;&quot;&gt;&lt;b&gt;Sample Heading 1&lt;/b&gt;&lt;/h2&gt;&lt;h2 style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;&quot;=&quot;&quot;&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; font-size: 14px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed enim ipsum, rutrum eu erat sed, lacinia hendrerit sapien. Ut viverra dapibus velit nec pellentesque. Morbi ac gravida tortor. Curabitur scelerisque nisl metus. Fusce diam dui, feugiat vel congue a, convallis pulvinar dui. Donec ut felis vel dolor vehicula tincidunt vitae id nibh. Mauris mollis leo pulvinar vehicula sagittis. Sed bibendum arcu at eros imperdiet pellentesque non non orci. Etiam accumsan pulvinar egestas. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur nec odio nec quam ultrices facilisis. Nam tempor a neque dapibus lacinia. Etiam porttitor at urna sed pellentesque. Phasellus rhoncus mi at lobortis semper. Vivamus tempus urna nec sagittis vehicula. Nam sagittis velit nec quam molestie volutpat quis et ex.&lt;/p&gt;&lt;/h2&gt;&lt;h2&gt;&lt;b&gt;Sample Heading 2&lt;/b&gt;&lt;/h2&gt;&lt;h2&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; font-size: 14px;&quot;&gt;Sed in imperdiet nisi, non ultrices lectus. Donec auctor, ante sed vestibulum cursus, ex neque scelerisque augue, a faucibus libero lectus eu mauris. Morbi ac quam non felis malesuada lacinia vel laoreet tortor. Proin euismod risus sit amet scelerisque imperdiet. Phasellus ut neque mollis, porttitor velit a, congue libero. Ut cursus accumsan lectus, vitae congue mi pellentesque vitae. Integer pulvinar accumsan dignissim. Proin bibendum dapibus risus at accumsan. Donec a sapien sed arcu malesuada maximus. Integer eu feugiat eros.&lt;/p&gt;&lt;/h2&gt;', 'uploads/slides/lesson_1', '2023-12-03 05:51:18', '2023-12-03 05:51:18'),
(2, 1, 1, '12345', 'Sample 101', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Aliquam dictum ante at dapibus luctus. Maecenas semper pulvinar congue. Pellentesque semper, velit eget auctor euismod, ante sem vulputate augue, ut volutpat felis lorem nec ex. Praesent non porttitor nunc, non ullamcorper est. Donec eu arcu viverra augue tristique fermentum. Duis scelerisque bibendum augue, id laoreet massa tempor eu. Vivamus nec ante est. Fusce eu lacus sapien. Sed viverra lorem nec ante consequat tempor. Quisque ligula dolor, feugiat nec ligula porttitor, fermentum lacinia augue. Morbi fringilla vitae massa vitae tempus. Etiam ut vehicula lectus. Fusce cursus dolor vel dignissim volutpat. Etiam iaculis, justo vel fermentum varius, sem turpis hendrerit nulla, eget dapibus neque urna vitae arcu.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Ut euismod tempor turpis, quis fringilla enim varius eget. Duis id neque blandit, vehicula purus eu, molestie dolor. Aliquam erat volutpat. Pellentesque quis dapibus elit. Curabitur ac lectus tortor. Phasellus et nibh nisl. Phasellus eu imperdiet nisi, tempor semper purus&lt;/p&gt;', 'uploads/slides/lesson_2', '2023-12-03 05:51:18', '2023-12-03 05:51:18'),
(3, 0, 0, '', 'History of Computer Science', NULL, NULL, '2023-12-03 17:07:13', '2023-12-03 17:07:13'),
(4, 0, 0, '', 'Web Development Basics', NULL, NULL, '2023-12-03 17:07:13', '2023-12-03 17:07:13'),
(5, 0, 0, '', 'Data Structures and Algorithms', NULL, NULL, '2023-12-03 17:07:13', '2023-12-03 17:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_class`
--

CREATE TABLE `lesson_class` (
  `lesson_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lesson_class`
--

INSERT INTO `lesson_class` (`lesson_id`, `class_id`) VALUES
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `firstname` varchar(150) DEFAULT NULL,
  `middlename` varchar(150) DEFAULT NULL,
  `lastname` varchar(150) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `contact` varchar(150) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `class_no` int(11) DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `firstname`, `middlename`, `lastname`, `email`, `contact`, `gender`, `address`, `class_no`, `date_added`, `date_updated`) VALUES
(68, 'S3', 'Noelle', 'A', 'Silva', 'Asta@gmail.com', '093432023990', 'F', 'Clover Kingdom', 7, '2024-01-05 13:11:39', '2024-01-07 08:32:16'),
(70, 'S6', 'Naruto ', 'Uzumaka', 'Minazaki', 'Himawari12@gmail.com', '097343284637', 'F', 'Konohagakure', 1, '2024-01-05 14:24:44', '2024-01-06 05:25:31'),
(71, 'S8', 'Saradas', 'Haruno ', 'Uchiha', 'Boruto@gmail.com', '097857878909', 'F', 'Konohagakure', 7, '2024-01-05 14:26:01', '2024-01-06 14:28:20'),
(75, 'S1', 'Monica', 'Rumbide', 'Alburo', 'monicalburo@gmail.com', '09276245251', 'F', '179 Catmon St. Phase 2 Amparo Subd. Caloocan City', 7, '2024-01-07 01:49:54', '2024-01-07 01:49:54'),
(86, 'S2', 'Secre', 'A', 'Swallowtail', 'Secre@gmail.com', '0983743283', 'F', 'Clover Kingdom', 11, '2024-01-07 08:32:59', '2024-01-07 08:32:59'),
(88, 'S9', 'Izuku', 'A', 'Midoriya', 'midoriya@gmail.com', '43434342342443', 'M', 'UA', 24, '2024-01-07 08:57:03', '2024-01-07 08:57:03');

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `backup_data_students` AFTER UPDATE ON `students` FOR EACH ROW BEGIN
INSERT INTO backup_students (id, student_id, firstname, middlename, lastname, email, contact, gender, address, class_no, date_added, date_updated) 
    VALUES ( NEW.id, NEW.student_id, NEW.firstname, NEW.middlename, NEW.lastname, NEW.email, NEW.contact, NEW.gender, NEW.address, NEW.class_no, NEW.date_added, NEW.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_students` AFTER INSERT ON `students` FOR EACH ROW BEGIN
INSERT INTO backup_students (id, student_id, firstname, middlename, lastname, email, contact, gender, address, class_no, date_added, date_updated) 

VALUES (NEW.id, NEW.student_id, NEW.firstname, NEW.middlename, NEW.lastname, NEW.email, NEW.contact, NEW.gender, NEW.address, NEW.class_no, NEW.date_added, NEW.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_students_d` AFTER DELETE ON `students` FOR EACH ROW BEGIN
INSERT INTO backup_students (id, student_id, firstname, middlename, lastname, email, contact, gender, address, class_no, date_added, date_updated) 
    VALUES ( old.id, old.student_id, old.firstname, old.middlename, old.lastname, old.email, old.contact, old.gender, old.address, old.class_no, old.date_added, old.date_updated); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student_class`
--

CREATE TABLE `student_class` (
  `id` int(30) NOT NULL,
  `academic_year_id` int(30) NOT NULL,
  `student_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_class`
--

INSERT INTO `student_class` (`id`, `academic_year_id`, `student_id`, `class_id`) VALUES
(1, 1, 6231415, 1),
(2, 1, 0, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_information`
-- (See below for the actual view)
--
CREATE TABLE `student_information` (
`id` int(11)
,`student_id` varchar(50)
,`firstname` varchar(150)
,`middlename` varchar(150)
,`lastname` varchar(150)
,`email` varchar(250)
,`contact` varchar(150)
,`gender` varchar(20)
,`address` text
,`class_no` int(11)
,`current_class` varchar(351)
);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_code` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_code`, `description`, `date_added`, `date_updated`) VALUES
(1, 'IS 102', 'ENTERPRISE RESOURCE PLANNING', '2023-12-02 22:11:23', '2023-12-02 22:11:23'),
(2, 'IS 103', 'DATABASE SYSTEMS ENTERPRISE', '2023-12-02 22:12:04', '2023-12-02 22:12:04'),
(3, 'IS 104', 'IS INNOVATIONS & NEW TECHNOLOGIES', '2023-12-02 22:12:37', '2023-12-02 22:12:37'),
(4, 'IS 105', 'ENTERPRISE ARCHITECTURE\r\n', '2023-12-02 22:13:05', '2023-12-02 22:13:05'),
(5, 'IS 106', 'IS MAJOR ELECTIVE 1', '2023-12-02 22:13:26', '2023-12-02 22:13:26'),
(6, 'CCS 118', 'MULTIMEDIA SYSTEMS', '2023-12-02 22:13:39', '2023-12-02 22:13:39'),
(7, 'RES 001', 'METHODS OF RESEARCHS', '2023-12-03 00:30:13', '2023-12-09 15:17:36');

--
-- Triggers `subjects`
--
DELIMITER $$
CREATE TRIGGER `backup_data_subjects` AFTER UPDATE ON `subjects` FOR EACH ROW BEGIN
INSERT INTO backup_subjects (id, subject_code, description, date_added, date_updated) 

VALUES (NEW.id, NEW.subject_code, NEW.description, NEW.date_added, NEW.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_subjects` AFTER INSERT ON `subjects` FOR EACH ROW BEGIN
INSERT INTO backup_subjects (id, subject_code, description, date_added, date_updated) 

VALUES (NEW.id, NEW.subject_code, NEW.description, NEW.date_added, NEW.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `backup_subjects_d` AFTER UPDATE ON `subjects` FOR EACH ROW BEGIN
INSERT INTO backup_subjects (id, subject_code, description, date_added, date_updated) 

VALUES (old.id, old.subject_code, old.description, old.date_added, old.date_updated); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `subject_uppercase` BEFORE INSERT ON `subjects` FOR EACH ROW BEGIN
    SET NEW.subject_code = UPPER(NEW.subject_code);
    SET NEW.description = UPPER(NEW.description);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `subject_information`
-- (See below for the actual view)
--
CREATE TABLE `subject_information` (
`id` int(11)
,`subject_code` varchar(250)
,`description` text
,`date_added` timestamp
,`date_updated` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Academy LMS'),
(2, 'address', 'Philippines'),
(3, 'contact', '+1234567890'),
(4, 'email', 'info@sample.com'),
(6, 'short_name', 'ALMS'),
(9, 'logo', 'uploads/1701570840_logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT current_timestamp(),
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `date_added`, `date_updated`) VALUES
(1, 'John', 'Smith', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1619140500_avatar.png', NULL, '2021-01-20 06:02:37', '2023-12-03 01:31:45'),
(2, 'Sherlock', 'Holmes', 'admin2', '482c811da5d5b4bc6d497ffa98491e38', 'uploads/1701570840_uavatar2.png', NULL, '2023-12-03 01:23:55', '2023-12-03 02:34:29'),
(4, 'Hello', 'World', 'faculty1', 'password123', NULL, NULL, '2023-12-04 01:22:43', '2023-12-04 01:22:43');

-- --------------------------------------------------------

--
-- Structure for view `class_information`
--
DROP TABLE IF EXISTS `class_information`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `class_information`  AS SELECT `class`.`id` AS `id`, `class`.`department_id` AS `department_id`, `class`.`course_id` AS `course_id`, `department`.`department` AS `department`, `course`.`course` AS `course`, `class`.`level` AS `level`, `class`.`section` AS `section`, `course`.`description` AS `subject_description` FROM ((`class` join `course` on(`class`.`course_id` = `course`.`id`)) join `department` on(`class`.`department_id` = `department`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `course_information`
--
DROP TABLE IF EXISTS `course_information`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `course_information`  AS SELECT `course`.`id` AS `id`, `course`.`course` AS `course`, `course`.`description` AS `description`, `course`.`date_added` AS `date_added`, `course`.`date_updated` AS `date_updated` FROM `course` ;

-- --------------------------------------------------------

--
-- Structure for view `department_information`
--
DROP TABLE IF EXISTS `department_information`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `department_information`  AS SELECT `department`.`id` AS `id`, `department`.`department` AS `department`, `department`.`description` AS `description`, `department`.`date_added` AS `date_added`, `department`.`date_updated` AS `date_updated` FROM `department` ;

-- --------------------------------------------------------

--
-- Structure for view `faculty_information`
--
DROP TABLE IF EXISTS `faculty_information`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `faculty_information`  AS SELECT `faculty`.`id` AS `id`, `faculty`.`firstname` AS `firstname`, `faculty`.`middlename` AS `middlename`, `faculty`.`lastname` AS `lastname`, `faculty`.`email` AS `email`, `faculty`.`contact` AS `contact`, `faculty`.`gender` AS `gender`, `faculty`.`address` AS `address`, `faculty`.`password` AS `password`, `faculty`.`department_id` AS `department_id`, `department`.`department` AS `department` FROM (`faculty` left join `department` on(`faculty`.`department_id` = `department`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `student_information`
--
DROP TABLE IF EXISTS `student_information`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_information`  AS SELECT `students`.`id` AS `id`, `students`.`student_id` AS `student_id`, `students`.`firstname` AS `firstname`, `students`.`middlename` AS `middlename`, `students`.`lastname` AS `lastname`, `students`.`email` AS `email`, `students`.`contact` AS `contact`, `students`.`gender` AS `gender`, `students`.`address` AS `address`, `students`.`class_no` AS `class_no`, concat(`course`.`course`,' ',`class`.`level`,`class`.`section`) AS `current_class` FROM ((`students` left join `class` on(`students`.`class_no` = `class`.`id`)) join `course` on(`class`.`course_id` = `course`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `subject_information`
--
DROP TABLE IF EXISTS `subject_information`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subject_information`  AS SELECT `subjects`.`id` AS `id`, `subjects`.`subject_code` AS `subject_code`, `subjects`.`description` AS `description`, `subjects`.`date_added` AS `date_added`, `subjects`.`date_updated` AS `date_updated` FROM `subjects` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_year`
--
ALTER TABLE `academic_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_infos` (`firstname`,`middlename`,`lastname`,`email`,`contact`) USING HASH;

--
-- Indexes for table `student_class`
--
ALTER TABLE `student_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subject_indexing` (`subject_code`),
  ADD UNIQUE KEY `subjects_indexing` (`subject_code`,`description`) USING HASH;

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_indexing` (`username`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_year`
--
ALTER TABLE `academic_year`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `student_class`
--
ALTER TABLE `student_class`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `weekly_insert_subjects` ON SCHEDULE EVERY 1 WEEK STARTS '2023-12-04 01:07:13' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    INSERT INTO subjects (subject_code, description)
    VALUES ('CCS 101', 'History of Computer Scienc'),
           ('GEE 105', 'Web Development Basics'),
           ('CCS 107', 'Data Structures and Algorithms');
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
