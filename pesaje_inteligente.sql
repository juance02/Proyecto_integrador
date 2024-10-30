-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2024 a las 17:41:16
-- Versión del servidor: 11.5.2-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pesaje_inteligente`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add cuentas', 6, 'add_cuentas'),
(22, 'Can change cuentas', 6, 'change_cuentas'),
(23, 'Can delete cuentas', 6, 'delete_cuentas'),
(24, 'Can view cuentas', 6, 'view_cuentas'),
(25, 'Can add reses', 7, 'add_reses'),
(26, 'Can change reses', 7, 'change_reses'),
(27, 'Can delete reses', 7, 'delete_reses'),
(28, 'Can view reses', 7, 'view_reses'),
(29, 'Can add genero', 8, 'add_genero'),
(30, 'Can change genero', 8, 'change_genero'),
(31, 'Can delete genero', 8, 'delete_genero'),
(32, 'Can view genero', 8, 'view_genero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-10-30 16:11:38.949756', '1', 'Genero object (1)', 1, '[{\"added\": {}}]', 8, 1),
(2, '2024-10-30 16:12:26.712225', '2', 'Genero object (2)', 1, '[{\"added\": {}}]', 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(8, 'gestion_ganado', 'genero'),
(7, 'gestion_ganado', 'reses'),
(5, 'sessions', 'session'),
(6, 'usuarios', 'cuentas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'usuarios', '0001_initial', '2024-10-12 20:25:32.869410'),
(2, 'contenttypes', '0001_initial', '2024-10-12 20:25:32.901439'),
(3, 'admin', '0001_initial', '2024-10-12 20:25:32.956489'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-10-12 20:25:32.959492'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-12 20:25:32.961493'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-10-12 20:25:33.000529'),
(7, 'auth', '0001_initial', '2024-10-12 20:25:33.132649'),
(8, 'auth', '0002_alter_permission_name_max_length', '2024-10-12 20:25:33.151666'),
(9, 'auth', '0003_alter_user_email_max_length', '2024-10-12 20:25:33.155670'),
(10, 'auth', '0004_alter_user_username_opts', '2024-10-12 20:25:33.158673'),
(11, 'auth', '0005_alter_user_last_login_null', '2024-10-12 20:25:33.163677'),
(12, 'auth', '0006_require_contenttypes_0002', '2024-10-12 20:25:33.164679'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-10-12 20:25:33.168682'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-10-12 20:25:33.171685'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-10-12 20:25:33.174688'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-10-12 20:25:33.191703'),
(17, 'auth', '0011_update_proxy_permissions', '2024-10-12 20:25:33.196707'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-10-12 20:25:33.199710'),
(19, 'sessions', '0001_initial', '2024-10-12 20:25:33.224733'),
(20, 'gestion_ganado', '0001_initial', '2024-10-24 19:56:31.816499'),
(21, 'gestion_ganado', '0002_genero_rename_nombre_reses_raza_remove_reses_image', '2024-10-30 15:56:40.170720'),
(22, 'gestion_ganado', '0003_reses_genero', '2024-10-30 16:00:29.721617');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1wob86084ylwep7rttxbj3xqqkzmez83', '.eJxVjMEOwiAQBf-FsyEsBZZ69O43EGBBqgaS0p6M_64kPej1zcx7Mef3rbi9p9UtxM4M2Ol3Cz4-Uh2A7r7eGo-tbusS-FD4QTu_NkrPy-H-HRTfy6jRJvJgjdEBKMzTZCFLDahJqZRxjiAhCPBGhCiRJHwFkQ0CWhVRsvcH0R022w:1szjaw:jiXcBzZpejP2U2eEz0IJnRU2DHNY3u4nxX9LeL72B48', '2024-10-26 21:24:14.860014'),
('drhu5kow5quxv0c4koo49x22fsjk7pwb', 'e30:1szjKy:8mD6Xtt3rGenGG7n3cjqTMa5_91_MPWLReGZ3oUXkRM', '2024-10-26 21:07:44.394090'),
('fqmzllvccr969oz1t4adqbr1xlqx1mks', 'e30:1szjU1:kzw0neiu-PZ5Uw5UCwZKFcn3GsBn69m3I3_EG7w8Qxw', '2024-10-26 21:17:05.886717'),
('geu92fyh1hy1h8jp9mxyzvf9ng3w5tri', 'e30:1szjKj:odHCTGMATsqcYEoJAzcf99FM8cpU5Ok20TE6dYz9cvI', '2024-10-26 21:07:29.825803'),
('gm4yyfmz42io1se05dye6uk2e6h8mirb', 'e30:1szjR1:y1STBV8FzI9LTH0wB1XMlWpuMgv5KJhsuct_OVeucJk', '2024-10-26 21:13:59.823844'),
('h08zt83h1wo2fxafitlnlcpczczi6bzt', '.eJxVjMsOwiAQRf-FtSEwRR4u3fcbyAxDpWogKe3K-O_apAvd3nPOfYmI21ri1vMSZxYXocXpdyNMj1x3wHestyZTq-syk9wVedAux8b5eT3cv4OCvXxrUEkPEHAAVMpbG-wQ3OS0BkWogwFGzi7QmT1MbDU548A7SwYwKGPF-wOrxDZ9:1t6Bal:GiEVsxzSd88BxrJQy-OiQLKBYXJZtaOpj8ol4dkkZ1E', '2024-11-13 16:30:43.708100'),
('nw07a5qd2esrlronqu4af6ny60yqvo37', '.eJxVjMsOwiAQRf-FtSEwRR4u3fcbyAxDpWogKe3K-O_apAvd3nPOfYmI21ri1vMSZxYXocXpdyNMj1x3wHestyZTq-syk9wVedAux8b5eT3cv4OCvXxrUEkPEHAAVMpbG-wQ3OS0BkWogwFGzi7QmT1MbDU548A7SwYwKGPF-wOrxDZ9:1t6BG9:HMlmgU_pxSrKA8rLl0jGIZET4zkhX_CNf59IJI_A59E', '2024-11-13 16:09:25.032345'),
('tsaog4erb9mdlw8i7y1dktf1313qeedr', 'e30:1szjSF:YIx6gC3nK7t5OnEeZKD4bfM7TGH1ign_yUFKefDJxJY', '2024-10-26 21:15:15.442204');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_ganado_genero`
--

CREATE TABLE `gestion_ganado_genero` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` longtext NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `gestion_ganado_genero`
--

INSERT INTO `gestion_ganado_genero` (`id`, `nombre`, `descripcion`, `activo`) VALUES
(1, 'Vaca', 'La vaca es un animal de la especie Bos taurus, comúnmente criado para producir leche, carne, y otros productos derivados.', 1),
(2, 'Toros', 'El toro es el macho adulto de la especie Bos taurus, conocido por su fortaleza, corpulencia y, en muchas razas, por sus cuernos.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_ganado_reses`
--

CREATE TABLE `gestion_ganado_reses` (
  `id` bigint(20) NOT NULL,
  `raza` varchar(50) NOT NULL,
  `numero_registro` double NOT NULL,
  `edad` varchar(50) NOT NULL,
  `peso` varchar(50) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `modificacion_date` datetime(6) NOT NULL,
  `genero_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `gestion_ganado_reses`
--

INSERT INTO `gestion_ganado_reses` (`id`, `raza`, `numero_registro`, `edad`, `peso`, `timestamp`, `descripcion`, `fecha_creacion`, `modificacion_date`, `genero_id`) VALUES
(1, 'miel', 12121243, '13', '56', '2024-10-24 20:24:28.916043', 'sdsdsdsd', '2024-10-24 20:24:28.918045', '2024-10-24 20:24:28.918045', 1),
(2, 'miel', 12121243, '13', '56', '2024-10-24 20:27:28.057742', 'sdsdsdsd', '2024-10-24 20:27:28.059745', '2024-10-24 20:27:28.059745', 1),
(3, 'luka', 15433, '4', '434', '2024-10-24 20:41:51.138635', 'feefefrgrgg', '2024-10-24 20:41:51.139636', '2024-10-24 20:41:51.139636', 1),
(4, 'safir', 222312243434, '4', '56', '2024-10-30 16:36:02.256766', '', '2024-10-30 16:36:02.259769', '2024-10-30 16:36:02.259769', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_cuentas`
--

CREATE TABLE `usuarios_cuentas` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `nombreusuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `numero_telefono` varchar(50) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superadmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios_cuentas`
--

INSERT INTO `usuarios_cuentas` (`id`, `password`, `nombres`, `apellidos`, `nombreusuario`, `email`, `numero_telefono`, `date_joined`, `last_login`, `is_admin`, `is_staff`, `is_active`, `is_superadmin`) VALUES
(1, 'pbkdf2_sha256$870000$apipQtOOAyQbzPtYGLl8By$FWEQoAMrQnqAyhmxzYBTnR1VBArEieO2SODpkL2B8s0=', 'juan', 'ceron', 'juance', 'juanceronquinayas@gmail.com', '', '2024-10-30 16:07:51.616797', '2024-10-30 16:30:43.705097', 1, 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_usuarios_cuentas_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `gestion_ganado_genero`
--
ALTER TABLE `gestion_ganado_genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gestion_ganado_reses`
--
ALTER TABLE `gestion_ganado_reses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gestion_ganado_reses_genero_id_50011daf_fk_gestion_g` (`genero_id`);

--
-- Indices de la tabla `usuarios_cuentas`
--
ALTER TABLE `usuarios_cuentas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombreusuario` (`nombreusuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `gestion_ganado_genero`
--
ALTER TABLE `gestion_ganado_genero`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gestion_ganado_reses`
--
ALTER TABLE `gestion_ganado_reses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios_cuentas`
--
ALTER TABLE `usuarios_cuentas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_usuarios_cuentas_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios_cuentas` (`id`);

--
-- Filtros para la tabla `gestion_ganado_reses`
--
ALTER TABLE `gestion_ganado_reses`
  ADD CONSTRAINT `gestion_ganado_reses_genero_id_50011daf_fk_gestion_g` FOREIGN KEY (`genero_id`) REFERENCES `gestion_ganado_genero` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
