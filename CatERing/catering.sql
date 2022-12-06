-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Dic 06, 2022 alle 03:33
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catering`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Events`
--

CREATE TABLE `Events` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `expected_participants` int(11) DEFAULT NULL,
  `organizer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `Events`
--

INSERT INTO `Events` (`id`, `name`, `date_start`, `date_end`, `expected_participants`, `organizer_id`) VALUES
(1, 'Convegno Agile Community', '2020-09-25', '2020-09-25', 100, 2),
(2, 'Compleanno di Manuela', '2020-08-13', '2020-08-13', 25, 2),
(3, 'Fiera del Sedano Rapa', '2020-10-02', '2020-10-04', 400, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `MenuFeatures`
--

CREATE TABLE `MenuFeatures` (
  `menu_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `MenuFeatures`
--

INSERT INTO `MenuFeatures` (`menu_id`, `name`, `value`) VALUES
(80, 'Richiede cuoco', 0),
(80, 'Buffet', 0),
(80, 'Richiede cucina', 0),
(80, 'Finger food', 0),
(80, 'Piatti caldi', 0),
(82, 'Richiede cuoco', 0),
(82, 'Buffet', 0),
(82, 'Richiede cucina', 0),
(82, 'Finger food', 0),
(82, 'Piatti caldi', 0),
(86, 'Richiede cuoco', 0),
(86, 'Buffet', 0),
(86, 'Richiede cucina', 0),
(86, 'Finger food', 0),
(86, 'Piatti caldi', 0),
(91, 'Richiede cuoco', 1),
(91, 'Buffet', 1),
(91, 'Richiede cucina', 1),
(91, 'Finger food', 1),
(91, 'Piatti caldi', 1),
(93, 'Richiede cuoco', 0),
(93, 'Buffet', 0),
(93, 'Richiede cucina', 0),
(93, 'Finger food', 0),
(93, 'Piatti caldi', 0),
(94, 'Richiede cuoco', 0),
(94, 'Buffet', 0),
(94, 'Richiede cucina', 0),
(94, 'Finger food', 0),
(94, 'Piatti caldi', 0),
(95, 'Richiede cuoco', 1),
(95, 'Buffet', 1),
(95, 'Richiede cucina', 1),
(95, 'Finger food', 1),
(95, 'Piatti caldi', 1),
(102, 'Richiede cuoco', 1),
(102, 'Buffet', 1),
(102, 'Richiede cucina', 1),
(102, 'Finger food', 1),
(102, 'Piatti caldi', 1),
(105, 'Richiede cuoco', 0),
(105, 'Buffet', 0),
(105, 'Richiede cucina', 0),
(105, 'Finger food', 0),
(105, 'Piatti caldi', 0),
(107, 'Richiede cuoco', 1),
(107, 'Buffet', 1),
(107, 'Richiede cucina', 1),
(107, 'Finger food', 1),
(107, 'Piatti caldi', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `MenuItems`
--

CREATE TABLE `MenuItems` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `recipe_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `MenuItems`
--

INSERT INTO `MenuItems` (`id`, `menu_id`, `section_id`, `description`, `recipe_id`, `position`) VALUES
(96, 80, 0, 'Croissant vuoti', 9, 0),
(97, 80, 0, 'Croissant alla marmellata', 9, 1),
(98, 80, 0, 'Pane al cioccolato mignon', 10, 2),
(99, 80, 0, 'Panini al latte con prosciutto crudo', 12, 4),
(100, 80, 0, 'Panini al latte con prosciutto cotto', 12, 5),
(101, 80, 0, 'Panini al latte con formaggio spalmabile alle erbe', 12, 6),
(102, 80, 0, 'Girelle all\'uvetta mignon', 11, 3),
(103, 82, 0, 'Biscotti', 13, 1),
(104, 82, 0, 'Lingue di gatto', 14, 2),
(105, 82, 0, 'Bigné alla crema', 15, 3),
(106, 82, 0, 'Bigné al caffè', 15, 4),
(107, 82, 0, 'Pizzette', 16, 5),
(108, 82, 0, 'Croissant al prosciutto crudo mignon', 9, 6),
(109, 82, 0, 'Tramezzini tonno e carciofini mignon', 17, 7),
(112, 86, 41, 'Vitello tonnato', 1, 0),
(113, 86, 41, 'Carpaccio di spada', 2, 1),
(114, 86, 41, 'Alici marinate', 3, 2),
(115, 86, 42, 'Penne alla messinese', 5, 0),
(116, 86, 42, 'Risotto alla zucca', 20, 1),
(117, 86, 43, 'Salmone al forno', 8, 0),
(118, 86, 44, 'Sorbetto al limone', 18, 0),
(119, 86, 44, 'Torta Saint Honoré', 19, 1),
(135, 91, 53, 'Vitello tonnato', 1, 0),
(136, 91, 53, 'Carpaccio di spada', 2, 1),
(137, 91, 53, 'Alici marinate', 3, 2),
(138, 91, 55, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(139, 91, 55, 'Salmone al forno', 8, 1),
(140, 91, 0, 'Insalata di riso', 4, 0),
(141, 91, 0, 'Penne al sugo di baccalà', 5, 1),
(149, 93, 59, 'Vitello tonnato', 1, 0),
(150, 93, 59, 'Carpaccio di spada', 2, 1),
(151, 93, 59, 'Alici marinate', 3, 2),
(152, 93, 61, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(153, 93, 61, 'Salmone al forno', 8, 1),
(154, 93, 0, 'Insalata di riso', 4, 0),
(155, 93, 0, 'Penne al sugo di baccalà', 5, 1),
(156, 94, 62, 'Vitello tonnato', 1, 0),
(157, 94, 62, 'Carpaccio di spada', 2, 1),
(158, 94, 62, 'Alici marinate', 3, 2),
(159, 94, 64, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(160, 94, 64, 'Salmone al forno', 8, 1),
(161, 94, 0, 'Insalata di riso', 4, 0),
(162, 94, 0, 'Penne al sugo di baccalà', 5, 1),
(163, 95, 65, 'Vitello tonnato', 1, 0),
(164, 95, 65, 'Carpaccio di spada', 2, 1),
(165, 95, 65, 'Alici marinate', 3, 2),
(166, 95, 67, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(167, 95, 67, 'Salmone al forno', 8, 1),
(168, 95, 0, 'Insalata di riso', 4, 0),
(169, 95, 0, 'Penne al sugo di baccalà', 5, 1),
(212, 102, 86, 'Vitello tonnato', 1, 0),
(213, 102, 86, 'Carpaccio di spada', 2, 1),
(214, 102, 86, 'Alici marinate', 3, 2),
(215, 102, 88, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(216, 102, 88, 'Salmone al forno', 8, 1),
(217, 102, 0, 'Insalata di riso', 4, 0),
(218, 102, 0, 'Penne al sugo di baccalà', 5, 1),
(226, 105, 93, 'Pizzette', 16, 0),
(227, 105, 93, 'Focaccine calde', 11, 1),
(228, 105, 94, 'Penne al sugo di baccalà', 5, 0),
(229, 105, 95, 'Vitello tonnato', 1, 0),
(230, 105, 95, 'Carpaccio di spada', 2, 1),
(231, 105, 96, 'Sorbetto al limone', 18, 0),
(238, 107, 101, 'Vitello tonnato', 1, 0),
(239, 107, 101, 'Carpaccio di spada', 2, 1),
(240, 107, 101, 'Alici marinate', 3, 2),
(241, 107, 103, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(242, 107, 103, 'Salmone al forno', 8, 1),
(243, 107, 0, 'Insalata di riso', 4, 0),
(244, 107, 0, 'Penne al sugo di baccalà', 5, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Menus`
--

CREATE TABLE `Menus` (
  `id` int(11) NOT NULL,
  `title` tinytext DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `Menus`
--

INSERT INTO `Menus` (`id`, `title`, `owner_id`, `published`) VALUES
(80, 'Coffee break mattutino', 2, 1),
(82, 'Coffee break pomeridiano', 2, 1),
(86, 'Cena di compleanno pesce', 3, 1),
(91, 'Titolo Nuovo', 2, 1),
(93, 'Menu da copiare', 2, 1),
(94, 'Menu da copiare', 2, 0),
(95, 'Titolo Nuovo', 2, 1),
(102, 'Titolo Nuovo', 2, 1),
(105, 'Compleanno di Carmine', 2, 1),
(107, 'Titolo Nuovo', 2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `MenuSections`
--

CREATE TABLE `MenuSections` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` tinytext DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `MenuSections`
--

INSERT INTO `MenuSections` (`id`, `menu_id`, `name`, `position`) VALUES
(41, 86, 'Antipasti', 0),
(42, 86, 'Primi', 1),
(43, 86, 'Secondi', 2),
(44, 86, 'Dessert', 3),
(45, 87, 'Antipasti', 0),
(53, 91, 'Antipasti', 0),
(54, 91, 'Primi', 1),
(55, 91, 'Secondi', 2),
(59, 93, 'Antipasti', 0),
(60, 93, 'Primi', 1),
(61, 93, 'Secondi', 2),
(62, 94, 'Antipasti', 0),
(63, 94, 'Primi', 1),
(64, 94, 'Secondi', 2),
(65, 95, 'Antipasti', 0),
(66, 95, 'Primi', 1),
(67, 95, 'Secondi', 2),
(86, 102, 'Antipasti', 0),
(87, 102, 'Primi', 1),
(88, 102, 'Secondi', 2),
(93, 105, 'Antipasto', 0),
(94, 105, 'Primo', 1),
(95, 105, 'Secondo', 2),
(96, 105, 'Dessert', 3),
(101, 107, 'Antipasti', 0),
(102, 107, 'Primi', 1),
(103, 107, 'Secondi', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `Recipes`
--

CREATE TABLE `Recipes` (
  `id` int(11) NOT NULL,
  `name` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `Recipes`
--

INSERT INTO `Recipes` (`id`, `name`) VALUES
(1, 'Vitello tonnato'),
(2, 'Carpaccio di spada'),
(3, 'Alici marinate'),
(4, 'Insalata di riso'),
(5, 'Penne al sugo di baccalà'),
(6, 'Pappa al pomodoro'),
(7, 'Hamburger con bacon e cipolla caramellata'),
(8, 'Salmone al forno'),
(9, 'Pizza al forno'),
(10, 'Torta di mele'),
(11, 'Focaccine calde'),
(12, 'Panini al latte'),
(13, 'Biscotti di pasta frolla'),
(14, 'Lingue di gatto'),
(15, 'Bigné farciti'),
(16, 'Pizzette'),
(17, 'Tramezzini'),
(18, 'Sorbetto al limone'),
(19, 'Torta Saint Honoré'),
(20, 'Risotto alla zucca');

-- --------------------------------------------------------

--
-- Struttura della tabella `Roles`
--

CREATE TABLE `Roles` (
  `id` char(1) NOT NULL,
  `role` varchar(128) NOT NULL DEFAULT 'servizio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `Roles`
--

INSERT INTO `Roles` (`id`, `role`) VALUES
('c', 'cuoco'),
('h', 'chef'),
('o', 'organizzatore'),
('s', 'servizio');

-- --------------------------------------------------------

--
-- Struttura della tabella `Service`
--

CREATE TABLE `Service` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `proposed_menu_id` int(11) NOT NULL DEFAULT 0,
  `approved_menu_id` int(11) DEFAULT 0,
  `service_date` date DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `expected_participants` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `Service`
--

INSERT INTO `Service` (`id`, `event_id`, `name`, `proposed_menu_id`, `approved_menu_id`, `service_date`, `time_start`, `time_end`, `expected_participants`, `id_menu`) VALUES
(1, 2, 'Cena', 86, 0, '2020-08-13', '20:00:00', '23:30:00', 25, 80),
(2, 1, 'Coffee break mattino', 0, 80, '2020-09-25', '10:30:00', '11:30:00', 100, 82),
(3, 1, 'Colazione di lavoro', 0, 0, '2020-09-25', '13:00:00', '14:00:00', 80, 86),
(4, 1, 'Coffee break pomeriggio', 0, 82, '2020-09-25', '16:00:00', '16:30:00', 100, NULL),
(5, 1, 'Cena sociale', 0, 0, '2020-09-25', '20:00:00', '22:30:00', 40, NULL),
(6, 3, 'Pranzo giorno 1', 0, 0, '2020-10-02', '12:00:00', '15:00:00', 200, NULL),
(7, 3, 'Pranzo giorno 2', 0, 0, '2020-10-03', '12:00:00', '15:00:00', 300, NULL),
(8, 3, 'Pranzo giorno 3', 0, 0, '2020-10-04', '12:00:00', '15:00:00', 400, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `Services`
--

CREATE TABLE `Services` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `proposed_menu_id` int(11) NOT NULL DEFAULT 0,
  `approved_menu_id` int(11) DEFAULT 0,
  `service_date` date DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `expected_participants` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `Services`
--

INSERT INTO `Services` (`id`, `event_id`, `name`, `proposed_menu_id`, `approved_menu_id`, `service_date`, `time_start`, `time_end`, `expected_participants`) VALUES
(1, 2, 'Cena', 86, 0, '2020-08-13', '20:00:00', '23:30:00', 25),
(2, 1, 'Coffee break mattino', 0, 80, '2020-09-25', '10:30:00', '11:30:00', 100),
(3, 1, 'Colazione di lavoro', 0, 0, '2020-09-25', '13:00:00', '14:00:00', 80),
(4, 1, 'Coffee break pomeriggio', 0, 82, '2020-09-25', '16:00:00', '16:30:00', 100),
(5, 1, 'Cena sociale', 0, 0, '2020-09-25', '20:00:00', '22:30:00', 40),
(6, 3, 'Pranzo giorno 1', 0, 0, '2020-10-02', '12:00:00', '15:00:00', 200),
(7, 3, 'Pranzo giorno 2', 0, 0, '2020-10-03', '12:00:00', '15:00:00', 300),
(8, 3, 'Pranzo giorno 3', 0, 0, '2020-10-04', '12:00:00', '15:00:00', 400);

-- --------------------------------------------------------

--
-- Struttura della tabella `Summarysheet`
--

CREATE TABLE `Summarysheet` (
  `id` int(11) NOT NULL,
  `id_chef` int(11) NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Task`
--

CREATE TABLE `Task` (
  `id` int(11) NOT NULL,
  `id_sheet` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `id_cook` int(11) DEFAULT NULL,
  `id_turn` int(11) DEFAULT NULL,
  `id_recipe` int(11) NOT NULL,
  `timeEstimate` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Turn`
--

CREATE TABLE `Turn` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `h_start` time NOT NULL,
  `h_end` time NOT NULL,
  `place` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Turn`
--

INSERT INTO `Turn` (`id`, `date`, `h_start`, `h_end`, `place`) VALUES
(1, '2022-08-30', '09:00:00', '18:00:00', 'sede'),
(2, '2022-08-30', '18:00:00', '23:00:00', 'sede'),
(3, '2022-08-31', '09:00:00', '18:00:00', 'sede'),
(4, '2022-08-31', '18:00:00', '23:00:00', 'sede');

-- --------------------------------------------------------

--
-- Struttura della tabella `UserRoles`
--

CREATE TABLE `UserRoles` (
  `user_id` int(11) NOT NULL,
  `role_id` char(1) NOT NULL DEFAULT 's'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `UserRoles`
--

INSERT INTO `UserRoles` (`user_id`, `role_id`) VALUES
(1, 'o'),
(2, 'o'),
(2, 'h'),
(3, 'h'),
(4, 'h'),
(4, 'c'),
(5, 'c'),
(6, 'c'),
(7, 'c'),
(8, 's'),
(9, 's'),
(10, 's'),
(7, 's');

-- --------------------------------------------------------

--
-- Struttura della tabella `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `Users`
--

INSERT INTO `Users` (`id`, `username`) VALUES
(1, 'Carlin'),
(2, 'Lidia'),
(3, 'Tony'),
(4, 'Marinella'),
(5, 'Guido'),
(6, 'Antonietta'),
(7, 'Paola'),
(8, 'Silvia'),
(9, 'Marco'),
(10, 'Piergiorgio');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Events`
--
ALTER TABLE `Events`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `MenuItems`
--
ALTER TABLE `MenuItems`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Menus`
--
ALTER TABLE `Menus`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `MenuSections`
--
ALTER TABLE `MenuSections`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Recipes`
--
ALTER TABLE `Recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Events`
--
ALTER TABLE `Events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `MenuItems`
--
ALTER TABLE `MenuItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT per la tabella `Menus`
--
ALTER TABLE `Menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT per la tabella `MenuSections`
--
ALTER TABLE `MenuSections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT per la tabella `Recipes`
--
ALTER TABLE `Recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `Services`
--
ALTER TABLE `Services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
