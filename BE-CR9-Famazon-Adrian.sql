-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Mar 2022, 17:31
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `famazon`
--
CREATE DATABASE IF NOT EXISTS `famazon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `famazon`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `fk_order_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `cart`
--

INSERT INTO `cart` (`cart_id`, `fk_order_id`, `fk_product_id`) VALUES
(1, 100001, 10004),
(2, 100003, 10007),
(3, 100003, 10004),
(4, 100004, 10007),
(5, 100004, 10002);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `company`
--

CREATE TABLE `company` (
  `name` varchar(30) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `ZIP` int(11) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `company`
--

INSERT INTO `company` (`name`, `address`, `ZIP`, `city`) VALUES
('Famazon', '351 South Harrison Dr', 28752, 'New York City');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `address` varchar(30) NOT NULL,
  `ZIP` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `fk_name` varchar(30) NOT NULL,
  `fk_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `customer`
--

INSERT INTO `customer` (`customer_id`, `f_name`, `l_name`, `gender`, `address`, `ZIP`, `city`, `fk_name`, `fk_product_id`) VALUES
(1001, 'Isadora ', 'Gilbert', 'F', '8925 Vulputate St', 22987, 'Baltimore', 'Famazon', 0),
(1002, 'Libby ', 'Vargas', 'F', 'Ap #851-533 Duis St', 78432, 'Dacota', 'Famazon', 0),
(1003, 'Dean', 'Rhodes', 'M', 'Ap #858-4380 Praesent Road', 56987, 'Los Angeles', 'Famazon', 0),
(1004, 'Ivory ', 'Mckay', 'M', '856-5335 Nullam Street', 90210, 'Beverly Hills', 'Famazon', 0),
(1005, 'Ezekiel', 'Henry', 'M', '9015 Quam Street', 22987, 'New York', 'Famazon', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `order_date` date NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `fk_payment_id` varchar(30) NOT NULL,
  `fk_shipping_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `order_product`
--

INSERT INTO `order_product` (`order_id`, `payment_date`, `order_date`, `fk_customer_id`, `fk_payment_id`, `fk_shipping_id`) VALUES
(100001, '2022-03-13', '2022-03-13', 1003, '', ''),
(100002, '2022-03-04', '2022-03-02', 1001, '', ''),
(100003, '2022-03-06', '2022-03-05', 1005, '', ''),
(100004, '2022-03-03', '2022-03-01', 1002, '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `program` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `payment`
--

INSERT INTO `payment` (`payment_id`, `program`) VALUES
(1, 'Card MasterCard'),
(2, 'PayPal');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `fk_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`product_id`, `name`, `brand`, `category`, `price`, `fk_name`) VALUES
(10000, 'Product Name 0', 'Brand Name 0', 'Plants', 150, 'Famazon'),
(10001, 'Product Name 1', 'Brand Name 1', 'Plants', 30, 'Famazon'),
(10002, 'Product Name 2', 'Brand Name 2', 'Cosmetics', 15, 'Famazon'),
(10003, 'Product Name 3', 'Brand Name 3', 'Clothes', 50, 'Famazon'),
(10004, 'Product Name 4', 'Brand Name 4', 'Shoes', 100, 'Famazon'),
(10005, 'Product Name 5', 'Brand Name 5', 'Kitchen', 10, 'Famazon'),
(10006, 'Product Name 6', 'Brand Name 2', 'Cosmetics', 30, 'Famazon'),
(10007, 'Product Name 7', 'Brand Name 4', 'Shoes', 30, 'Famazon');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_account`
--

CREATE TABLE `user_account` (
  `user_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `e_mail` varchar(30) NOT NULL,
  `fk_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user_account`
--

INSERT INTO `user_account` (`user_id`, `name`, `password`, `e_mail`, `fk_customer_id`) VALUES
(1001, 'Custom1001', 'Hgsf527%', 'isadora@gmail.com', 1001),
(1002, 'Custom1002', 'jsdanJH6', 'libby@o2.com', 1002),
(1003, 'Custom1003', 'HSDHSJHB', 'dean234@msn.com', 1003),
(1004, 'Custom1004', '762GGTEos2', 'piggy@hotmail.com', 1004);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_order_id` (`fk_order_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indeksy dla tabeli `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_name` (`fk_name`);

--
-- Indeksy dla tabeli `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indeksy dla tabeli `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_name` (`fk_name`);

--
-- Indeksy dla tabeli `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT dla tabeli `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `user_account`
--
ALTER TABLE `user_account`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `order_product` (`order_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`product_id`);

--
-- Ograniczenia dla tabeli `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_name`) REFERENCES `company` (`name`);

--
-- Ograniczenia dla tabeli `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Ograniczenia dla tabeli `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_name`) REFERENCES `company` (`name`);

--
-- Ograniczenia dla tabeli `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
