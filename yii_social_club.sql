-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Апр 12 2019 г., 15:14
-- Версия сервера: 5.7.25-0ubuntu0.18.04.2
-- Версия PHP: 7.2.15-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii_social_club`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(6) NOT NULL,
  `author_id` int(6) NOT NULL,
  `target_id` int(6) NOT NULL,
  `body` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `author_id`, `target_id`, `body`, `time`) VALUES
(1, 4, 5, 'Привет, это Max', '2019-04-12 11:36:30'),
(2, 4, 5, 'Это снова я, как прошло?', '2019-04-12 11:37:44'),
(3, 5, 5, 'Нормально, а у тебя как?', '2019-04-12 11:49:12'),
(4, 4, 7, 'Ник, как дела?\r\n', '2019-04-12 11:57:35'),
(5, 4, 5, 'вп\r\nвкпукпукпукупу\r\nпукп\r\nук\r\nукп\r\nукувпк\r\nренр\r\nкер', '2019-04-12 11:59:53'),
(6, 6, 5, 'И я тут', '2019-04-12 12:08:23');

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `filePath` varchar(400) NOT NULL,
  `itemId` int(11) DEFAULT NULL,
  `isMain` tinyint(1) DEFAULT NULL,
  `modelName` varchar(150) NOT NULL,
  `urlAlias` varchar(400) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `filePath`, `itemId`, `isMain`, `modelName`, `urlAlias`, `name`) VALUES
(5, 'Users/User4/b8cfc2.jpg', 4, 1, 'User', 'b0b3ad95c6-1', ''),
(7, 'Users/User7/77626d.jpg', 7, 1, 'User', '6652304e53-1', ''),
(8, 'Users/User6/b12f86.jpg', 6, 1, 'User', '49a57b280b-1', '');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1554969005),
('m140622_111540_create_image_table', 1554969010),
('m140622_111545_add_name_to_image_table', 1554969011);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facts` text CHARACTER SET utf8,
  `born` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `role` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `facts`, `born`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `role`) VALUES
(4, 'Max', '', '2019-04-11 08:57:21', 'D_GoKgwjiwmkv-LS4NjxM3bQOPpwmEP2', '$2y$13$WVeQOLcLEfgyYvEkNs0GT.G9gpu0jv7jLRxDITchIt6.gjYcnlcJi', NULL, 'max@max.ru', 10, 1554908254, 1554908254, 0),
(5, 'Yura', '', '2019-04-11 08:57:21', '2NZ4NkTM9OIcA28l_ZIwGS6OY0vi-QzH', '$2y$13$1T6ZQYtMD3FikGfCKr/wOugyFysk0/i2QnXnz5Ffn9tHaKOzPAwRa', NULL, 'yura@yura.ru', 10, 1554924629, 1554924629, 0),
(6, 'Dima', 'Hello', '1998-09-08 20:00:00', 'TsJSbUEvHlSZOFe8ukgtVEjwUfvBtWyy', '$2y$13$JXkbgc.LpmWoAltdHgrcAO7QBsh1v.rQaQmkYqZm..Yw525y0u5Ba', NULL, 'dima@dima.ru', 10, 1554924695, 1555060184, 0),
(7, 'Nick', 'Heloo, i am Nick\r\n', '2019-04-12 09:15:32', 'x01qx5XqA4KPsgT6uhClW0OgbLsL-TZR', '$2y$13$hOmET2eWQVHBVUUzYCG.HeWvrPu4V1pynAur7AMQqba5S28Bs1yM6', NULL, 'nick@nick.ru', 10, 1555060532, 1555060706, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
