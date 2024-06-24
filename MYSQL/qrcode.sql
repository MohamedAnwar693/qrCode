-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2024 at 09:23 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qrcode`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2014_10_12_000000_create_qrcode_table', 2),
(6, '2024_06_12_181339_create_qr_code_logs_table', 3),
(7, '2024_06_12_181915_create_qr_code_logs_table', 4),
(8, '2024_06_13_234704_create_qr_code_logs_table', 5),
(9, '2024_06_14_145034_create_users_table', 6),
(10, '2024_06_14_151318_create_users_table', 7),
(11, '2024_06_14_152733_add_phone_to_users_table', 8),
(12, '2024_06_14_153200_create_users_table', 9),
(13, '2024_06_14_153250_add_phone_to_users_table', 10),
(14, '2024_06_14_154601_create_users_table', 11),
(15, '2024_06_14_154751_add_phone_to_users_table', 12),
(16, '2024_06_14_181928_create_contacts_table', 13),
(17, '2024_06_14_191424_create_orders_table', 14),
(18, '2024_06_17_113525_create_qr_code_logs_table', 15),
(19, '2024_06_17_162102_create_form_data_table', 16),
(20, '2024_06_19_162011_add_phone_to_users_table', 17),
(21, '2024_06_19_165838_add_phone_to_users_table', 18),
(22, '2024_06_19_172836_add_phone_to_users_table', 19),
(23, '2024_06_19_182744_create_orders_table', 20),
(24, '2024_06_19_184740_create_orders_table', 21),
(25, '2024_06_19_185816_create_orders_table', 22),
(26, '2024_06_19_190754_create_qr_code_logs_table', 22),
(27, '2024_06_19_201258_create_orders_table', 23);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `qrcode_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `email`, `text`, `user_id`, `qrcode_id`, `created_at`, `updated_at`) VALUES
(5, 'user', '01000000000', 'user2@gmail.com', 'test13', 1, NULL, '2024-06-21 11:41:29', '2024-06-21 11:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'API Token', 'be75849286457612c64120a2043ea6f69edf05d11381a8d8ad86e5c064763238', '[\"*\"]', NULL, '2024-06-11 13:15:40', '2024-06-11 13:15:40'),
(2, 'App\\Models\\User', 2, 'API Token', '99a75aa62772b7eb2e43ddef209a06154eef0313b8cfc63e48f447e1c1c375ba', '[\"*\"]', NULL, '2024-06-11 13:35:55', '2024-06-11 13:35:55'),
(3, 'App\\Models\\User', 3, 'API Token', '1edcd2d5a96d1c0a35c326093646160fa306ccb7d7573e94f9ff4b38cb206472', '[\"*\"]', NULL, '2024-06-11 14:47:23', '2024-06-11 14:47:23'),
(4, 'App\\Models\\User', 2, 'API Token', '8dfb8079c39ada7d65344dea831b236e869525c5f73648061282734f62bec523', '[\"*\"]', NULL, '2024-06-11 15:27:56', '2024-06-11 15:27:56'),
(5, 'App\\Models\\User', 2, 'API Token', '117ceef3ecefa9ceb18ecb82ac64368cc4a1bda3f075bd7fda2698fd13f435f6', '[\"*\"]', NULL, '2024-06-11 15:29:37', '2024-06-11 15:29:37'),
(6, 'App\\Models\\User', 2, 'API Token', 'b53c8c2e6c996ac627bf7bbe8b12c1b36c707c2e84c60c8eb45e981a900c66b3', '[\"*\"]', NULL, '2024-06-11 15:33:06', '2024-06-11 15:33:06'),
(7, 'App\\Models\\User', 2, 'API Token', '2b02b7a7871b1788654db5c8ca0be9f0d90c6a0475b54dd18f7ab860fe2c333a', '[\"*\"]', NULL, '2024-06-11 15:33:40', '2024-06-11 15:33:40'),
(8, 'App\\Models\\User', 2, 'API Token', 'e1c541e859d89b0c0db0fbac19a86ef117c859d2cbd4597b9be763dc7c738a55', '[\"*\"]', NULL, '2024-06-11 15:34:20', '2024-06-11 15:34:20'),
(9, 'App\\Models\\User', 2, 'API Token', 'e0b1c3b4fe8a38aededcdfa86e9aa75ea18039f534b46f6ee14f49cc46dab3be', '[\"*\"]', NULL, '2024-06-11 15:43:50', '2024-06-11 15:43:50'),
(10, 'App\\Models\\User', 2, 'API Token', '3fa4f5f3ec978846908cfcbfa01543b9070f9c46afe8446e1a2e2c2a947eb5b3', '[\"*\"]', NULL, '2024-06-11 15:44:15', '2024-06-11 15:44:15'),
(11, 'App\\Models\\User', 4, 'API Token', '0e90ac5db90ea667036282f5747a073baa075b85f738c331bcc6f2eebe0ec52f', '[\"*\"]', NULL, '2024-06-11 16:28:50', '2024-06-11 16:28:50'),
(12, 'App\\Models\\User', 4, 'API Token', '9ea8965c552b5907491b39a36578f7d9e8e4717d9293aec4257157edec9c5a6c', '[\"*\"]', NULL, '2024-06-11 16:29:18', '2024-06-11 16:29:18'),
(13, 'App\\Models\\User', 2, 'API Token', 'db8e428f0572871725bac8f82905274e6ea4f2452f6b1d06e467e8cabe68e058', '[\"*\"]', NULL, '2024-06-11 16:39:12', '2024-06-11 16:39:12'),
(15, 'App\\Models\\User', 2, 'API Token', 'ad7a64ffc87c8f27bb48aabec206cb81da15b88c9833b6d1f8e146520afd5e5d', '[\"*\"]', NULL, '2024-06-11 20:25:12', '2024-06-11 20:25:12'),
(17, 'App\\Models\\User', 1, 'API Token', '46bd008a093f128ac3ac8f65ebbe94961f5d87c1b92d7dd5b1e1d1afbd1bc794', '[\"*\"]', NULL, '2024-06-14 12:59:23', '2024-06-14 12:59:23'),
(18, 'App\\Models\\User', 2, 'API Token', '0c4564c64cd6a6085e39a9878754a49b821bce83e46acfd25990682ebea161ea', '[\"*\"]', NULL, '2024-06-14 12:59:36', '2024-06-14 12:59:36'),
(20, 'App\\Models\\User', 2, 'API Token', 'c4c0c73edc2c5459fa9200360a490df00eff8c5f6736a993853768e6141486de', '[\"*\"]', NULL, '2024-06-17 08:41:15', '2024-06-17 08:41:15'),
(21, 'App\\Models\\User', 2, 'API Token', '0007f7da0e4de60cd40e0c73826ff4896139e959828c50f65d35802320e372ae', '[\"*\"]', NULL, '2024-06-17 11:41:10', '2024-06-17 11:41:10'),
(22, 'App\\Models\\User', 2, 'API Token', '1b7bdc0c2e9a59aab5671b06edc19b116363201df67eb74b2ec475b5df44456f', '[\"*\"]', NULL, '2024-06-17 11:50:03', '2024-06-17 11:50:03'),
(23, 'App\\Models\\User', 2, 'API Token', '975e256fcbd5068018968d2a1d69562f025667395997181ec7b015b46bbe2b20', '[\"*\"]', NULL, '2024-06-17 12:34:32', '2024-06-17 12:34:32'),
(24, 'App\\Models\\User', 2, 'API Token', 'b63d7d0b8f23053d0350ebb37d69b97cf061ac9828659cbd06c7fa9c4a17cb0b', '[\"*\"]', NULL, '2024-06-17 12:38:11', '2024-06-17 12:38:11'),
(25, 'App\\Models\\User', 6, 'API Token', '42693bcbf2cb66cca2768762796f35cd57921278b2d6d2dfc2e49beeeacf012f', '[\"*\"]', NULL, '2024-06-18 17:13:03', '2024-06-18 17:13:03'),
(26, 'App\\Models\\User', 7, 'API Token', '814f6dbc144651256363d0ebdfd7c5c98d1f5e73948680f0d2631c00990566a3', '[\"*\"]', NULL, '2024-06-18 17:15:27', '2024-06-18 17:15:27'),
(27, 'App\\Models\\User', 8, 'API Token', 'b53e389f4770519e3bb96d31f24f1fe0a075b98e7c6136ccf4118f24ae38d726', '[\"*\"]', NULL, '2024-06-18 17:15:46', '2024-06-18 17:15:46'),
(28, 'App\\Models\\User', 2, 'API Token', '0b339511385eb44e33cae8dfeacd8484e2a54f624732d2e627e9ee7ae6c16491', '[\"*\"]', NULL, '2024-06-19 11:28:02', '2024-06-19 11:28:02'),
(29, 'App\\Models\\User', 9, 'API Token', '1f7a423ee5afab45c4c2369fcc4ea8340e52f3a252c1e0bed853914dab10e6cd', '[\"*\"]', NULL, '2024-06-19 12:00:12', '2024-06-19 12:00:12'),
(31, 'App\\Models\\User', 10, 'API Token', '5d775a08ed5f53057c5a43318b5326b164d6cf624f0a4dd2a6e6fca1b4d81ec6', '[\"*\"]', NULL, '2024-06-19 13:55:22', '2024-06-19 13:55:22'),
(32, 'App\\Models\\User', 11, 'API Token', '8f7e33b688572415fa14155dfb5f8b4899e17da93c1bf79195bb769864bc1a4c', '[\"*\"]', NULL, '2024-06-19 13:59:57', '2024-06-19 13:59:57'),
(33, 'App\\Models\\User', 12, 'API Token', '6a2ff77631a319602c148045289d1fe6b6d906948c21af789cc2130636959c74', '[\"*\"]', NULL, '2024-06-19 14:00:29', '2024-06-19 14:00:29'),
(34, 'App\\Models\\User', 13, 'API Token', '692d2f4359fd818465ae886a4486ab41825805e28c6d8966427e4bd00c726ad7', '[\"*\"]', NULL, '2024-06-19 14:33:03', '2024-06-19 14:33:03'),
(35, 'App\\Models\\User', 14, 'API Token', '89aaabe6e656cc8f0625e57f96736639dbd25696ac3757b4aaa6dc03c648b8fa', '[\"*\"]', NULL, '2024-06-19 14:36:37', '2024-06-19 14:36:37'),
(36, 'App\\Models\\User', 1, 'API Token', '7e4e0b0e362e59a3ee6bc5570b928408faf47ad1dbc602b2f147e9d27fa09746', '[\"*\"]', NULL, '2024-06-19 14:37:35', '2024-06-19 14:37:35'),
(37, 'App\\Models\\User', 2, 'API Token', '0e8f985cd5a04101be370642d044c374a953392f9e05d3e334faaca84cf3f80a', '[\"*\"]', NULL, '2024-06-19 14:41:03', '2024-06-19 14:41:03'),
(38, 'App\\Models\\User', 1, 'API Token', 'b82c1ad228aeed78c6726db7659447f6ce3956ae0f3ca299b213631e7f5c496e', '[\"*\"]', NULL, '2024-06-19 20:06:52', '2024-06-19 20:06:52'),
(39, 'App\\Models\\User', 1, 'API Token', '2fcecc183bab2939cd68f71a39ac8c3be9b51555c8cc14b6da7e7628cb49f18b', '[\"*\"]', NULL, '2024-06-20 12:38:19', '2024-06-20 12:38:19'),
(40, 'App\\Models\\User', 4, 'API Token', '9b6fed8922baadde87b25a71fdc5ffc8552d9ccdc59f3ad96ef4853e5f077a59', '[\"*\"]', NULL, '2024-06-21 11:36:20', '2024-06-21 11:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `qr_code_logs`
--

CREATE TABLE `qr_code_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qr_code_logs`
--

INSERT INTO `qr_code_logs` (`id`, `user_id`, `text`, `reference`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://Qawl-talabak.com', 'CHhMVTaszzM', '2024-06-19 16:10:15', '2024-06-19 16:10:15'),
(2, 1, 'https://Qawl-talabak.com', 'C33ZbRtxcWG', '2024-06-19 16:31:44', '2024-06-19 16:31:44'),
(3, 2, 'https://Qawl-talabak.com', 'qE0UQmwcVgn', '2024-06-19 17:17:29', '2024-06-19 17:17:29'),
(4, 2, 'https://Qawl-talabak.com', 'LqYehmTmLr8', '2024-06-19 19:04:14', '2024-06-19 19:04:14'),
(6, 1, 'https://Qawl-talabak.com', 'ld8Z8qkaQyr', '2024-06-19 20:05:10', '2024-06-19 20:05:10'),
(7, 3, 'https://Qawl-talabak.com', 'r3iLypCEuY4', '2024-06-20 12:38:52', '2024-06-20 12:38:52'),
(9, 4, 'https://Qawl-talabak.com', 'ZqlX2bkjE1E', '2024-06-21 11:45:01', '2024-06-21 11:45:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone`, `type`, `logo`, `company_name`) VALUES
(1, 'user', 'user2@gmail.com', NULL, '$2y$10$C8MnyrHthfTgkrvec33WC.WYIWJVtg78nWZotNEE2SDODj2J.TSQG', NULL, '2024-06-19 14:37:35', '2024-06-19 14:37:35', '01000000000', 'company', 'logos/uBLB4ZnYtEK7UMoS4mt4zCNW3ccY4xpFXpSWGXri.jpg', 'google'),
(2, 'user', 'user3@gmail.com', NULL, '$2y$10$uJ4RVUZyxRpUYpt.CprUDu5Voeq3RfjUsrIq6B7Lmsl.bwe3nw25W', NULL, '2024-06-19 14:41:03', '2024-06-19 14:41:03', '01000000000', 'client', NULL, NULL),
(3, 'Guest', 'guest@example.com', NULL, '$2y$10$HURuiW0CqVDHVwknawmgyOKD1pKdnippmch6z5zk0uUYX.3UsJyd6', NULL, '2024-06-19 18:40:13', '2024-06-19 18:40:13', NULL, 'Guest', NULL, NULL),
(4, 'user', 'user7@gmail.com', NULL, '$2y$10$51WT5yUvCdXARvQvM4S9ZujY.otte07ROzbKnyB/S1Ha5u3KOGWTG', NULL, '2024-06-21 11:36:20', '2024-06-21 11:36:20', '01000000000', 'company', 'logos/vpBotWkxsVQIAGtMm7Zvl9QXQCi8okkF2SmvaEC5.jpg', 'google');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `qr_code_logs`
--
ALTER TABLE `qr_code_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qr_code_logs_reference_unique` (`reference`),
  ADD KEY `qr_code_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `qr_code_logs`
--
ALTER TABLE `qr_code_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `qr_code_logs`
--
ALTER TABLE `qr_code_logs`
  ADD CONSTRAINT `qr_code_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
