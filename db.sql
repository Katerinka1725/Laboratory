-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 26 2025 г., 22:51
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Accountants`
--

CREATE TABLE `Accountants` (
  `id` int NOT NULL,
  `Login` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `LastLogin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Accountants`
--

INSERT INTO `Accountants` (`id`, `Login`, `PasswordHash`, `name`, `surname`, `LastLogin`) VALUES
(1, 'nata22', '87689', 'Наталья', 'Косточенко', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Admins`
--

CREATE TABLE `Admins` (
  `id` int NOT NULL,
  `Login` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Admins`
--

INSERT INTO `Admins` (`id`, `Login`, `PasswordHash`) VALUES
(1, 'jenia1', 'jenia42');

-- --------------------------------------------------------

--
-- Структура таблицы `Analyzers`
--

CREATE TABLE `Analyzers` (
  `id` int NOT NULL,
  `AnalyzerName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Analyzers`
--

INSERT INTO `Analyzers` (`id`, `AnalyzerName`) VALUES
(1, 'гематологический(позволяют определить содержание в крови отдельных разновидностей клеток)'),
(2, 'иммуноферментный(диагностика инфекционных, эндокринных болезней)'),
(3, 'газоанализатор(определяют уровень кислорода крови, газовый состав ее или воздуха во внешней среде)\r\n'),
(4, 'гемоглобинометр (измеряют уровень гемоглобина крови)');

-- --------------------------------------------------------

--
-- Структура таблицы `insuranceCompanies`
--

CREATE TABLE `insuranceCompanies` (
  `id` int NOT NULL,
  `CompanyName` varchar(255) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `BankAccount` varchar(20) DEFAULT NULL,
  `BIC` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `insuranceCompanies`
--

INSERT INTO `insuranceCompanies` (`id`, `CompanyName`, `address`, `BankAccount`, `BIC`) VALUES
(1, 'ИнвитроМед', 'г.Москва, Юсуповский проспект, д.45', '78217838388383', '346578392'),
(2, 'АвиМед', 'г.Москва, Кубанский переулок, д.23', '7381738173187389', '546372819');

-- --------------------------------------------------------

--
-- Структура таблицы `LabAssistants`
--

CREATE TABLE `LabAssistants` (
  `id` int NOT NULL,
  `Login` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `LastLogin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `LabAssistants`
--

INSERT INTO `LabAssistants` (`id`, `Login`, `PasswordHash`, `name`, `surname`, `LastLogin`) VALUES
(1, 'lena1', '746583', 'Елена', 'Загорная', NULL),
(2, 'ira4', '1774024', 'Ирина', 'Шейдлин', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `LoginHistory`
--

CREATE TABLE `LoginHistory` (
  `LoginHistoryID` int NOT NULL,
  `LoginTime` datetime NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `PatientID` int DEFAULT NULL,
  `datecreation` date DEFAULT NULL,
  `services` int DEFAULT NULL,
  `orderstatus` varchar(100) DEFAULT NULL,
  `statusservices` varchar(100) DEFAULT NULL,
  `ordertime` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `OrderServices`
--

CREATE TABLE `OrderServices` (
  `id` int NOT NULL,
  `OrderID` int NOT NULL,
  `ServiceID` int NOT NULL,
  `Status` varchar(50) NOT NULL,
  `ExecutionTime` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `patronymic` varchar(100) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `PassportSeries` varchar(10) DEFAULT NULL,
  `PassportNumber` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `typepolicy` int DEFAULT NULL,
  `insurancecompany` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `ProvidedServices`
--

CREATE TABLE `ProvidedServices` (
  `id` int NOT NULL,
  `OrderServiceID` int NOT NULL,
  `AnalyzerID` int DEFAULT NULL,
  `LabAssistantID` int DEFAULT NULL,
  `ProvidedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Services`
--

CREATE TABLE `Services` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `ServiceCode` int DEFAULT NULL,
  `duedate` int DEFAULT NULL,
  `averageDeviation` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Services`
--

INSERT INTO `Services` (`id`, `name`, `price`, `ServiceCode`, `duedate`, `averageDeviation`) VALUES
(1, 'TSH', '262.71', 619, 1, '0.50'),
(2, 'Амилаза', '361.88', 311, 1, '0.60'),
(3, 'Альбумин', '234.09', 548, 1, '0.70'),
(4, 'Креатинин', '143.22', 258, 1, '0.80'),
(5, 'Билирубин общий', '102.85', 176, 1, '0.90'),
(6, 'Гепатит В', '176.83', 501, 1, '0.10'),
(7, 'Гепатит С', '289.99', 543, 1, '0.11'),
(8, 'ВИЧ', '490.77', 557, 1, '0.12'),
(9, 'СПИД', '341.78', 229, 1, '0.13'),
(10, 'Кальций общий', '419.90', 415, 1, '0.14'),
(11, 'Глюкоза', '447.65', 323, 1, '0.15'),
(12, 'Ковид IgM', '209.78', 855, 1, '0.16'),
(13, 'Общий белок', '396.03', 346, 1, '0.17'),
(14, 'Железо', '105.32', 836, 1, '0.18'),
(15, 'Сифилис RPR', '443.66', 659, 1, '0.19'),
(16, 'АТ и АГ к ВИЧ 1/2', '370.62', 797, 1, '0.20'),
(17, 'Волчаночный антикоагулянт', '290.11', 287, 1, '0.21');

-- --------------------------------------------------------

--
-- Структура таблицы `typepolicy`
--

CREATE TABLE `typepolicy` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `typepolicy`
--

INSERT INTO `typepolicy` (`id`, `name`) VALUES
(1, 'VIP'),
(2, 'Постоянный клиент'),
(3, 'Первый визит');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Accountants`
--
ALTER TABLE `Accountants`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Admins`
--
ALTER TABLE `Admins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Analyzers`
--
ALTER TABLE `Analyzers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `insuranceCompanies`
--
ALTER TABLE `insuranceCompanies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `LabAssistants`
--
ALTER TABLE `LabAssistants`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `LoginHistory`
--
ALTER TABLE `LoginHistory`
  ADD PRIMARY KEY (`LoginHistoryID`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_ibfk_1` (`services`),
  ADD KEY `orders_ibfk_2` (`PatientID`);

--
-- Индексы таблицы `OrderServices`
--
ALTER TABLE `OrderServices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderservices_ibfk_1` (`OrderID`),
  ADD KEY `orderservices_ibfk_2` (`ServiceID`);

--
-- Индексы таблицы `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_ibfk_1` (`typepolicy`),
  ADD KEY `patients_ibfk_2` (`insurancecompany`);

--
-- Индексы таблицы `ProvidedServices`
--
ALTER TABLE `ProvidedServices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providedservices_ibfk_1` (`OrderServiceID`),
  ADD KEY `providedservices_ibfk_2` (`AnalyzerID`),
  ADD KEY `providedservices_ibfk_3` (`LabAssistantID`);

--
-- Индексы таблицы `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `typepolicy`
--
ALTER TABLE `typepolicy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Accountants`
--
ALTER TABLE `Accountants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Admins`
--
ALTER TABLE `Admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Analyzers`
--
ALTER TABLE `Analyzers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `insuranceCompanies`
--
ALTER TABLE `insuranceCompanies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `LabAssistants`
--
ALTER TABLE `LabAssistants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `LoginHistory`
--
ALTER TABLE `LoginHistory`
  MODIFY `LoginHistoryID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `OrderServices`
--
ALTER TABLE `OrderServices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `ProvidedServices`
--
ALTER TABLE `ProvidedServices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Services`
--
ALTER TABLE `Services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `typepolicy`
--
ALTER TABLE `typepolicy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`services`) REFERENCES `Services` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `Patients` (`id`);

--
-- Ограничения внешнего ключа таблицы `OrderServices`
--
ALTER TABLE `OrderServices`
  ADD CONSTRAINT `orderservices_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`id`),
  ADD CONSTRAINT `orderservices_ibfk_2` FOREIGN KEY (`ServiceID`) REFERENCES `Services` (`id`);

--
-- Ограничения внешнего ключа таблицы `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`typepolicy`) REFERENCES `typepolicy` (`id`),
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`insurancecompany`) REFERENCES `insuranceCompanies` (`id`);

--
-- Ограничения внешнего ключа таблицы `ProvidedServices`
--
ALTER TABLE `ProvidedServices`
  ADD CONSTRAINT `providedservices_ibfk_1` FOREIGN KEY (`OrderServiceID`) REFERENCES `OrderServices` (`id`),
  ADD CONSTRAINT `providedservices_ibfk_2` FOREIGN KEY (`AnalyzerID`) REFERENCES `Analyzers` (`id`),
  ADD CONSTRAINT `providedservices_ibfk_3` FOREIGN KEY (`LabAssistantID`) REFERENCES `LabAssistants` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
