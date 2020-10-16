-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 25 mars 2020 à 09:19
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `express food`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `id_profil` int(11) NOT NULL,
  `number` varchar(4) NOT NULL,
  `street` varchar(50) NOT NULL,
  `postal_code` varchar(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `information` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `id_profil`, `number`, `street`, `postal_code`, `city`, `information`, `created_at`, `updated_at`) VALUES
(2, 7, '3', 'rue du loup', '92260', 'fontenay-aux-roses', NULL, '2020-02-25 14:16:23', '2020-02-25 14:16:23'),
(3, 8, '12', 'rue de la fontaine', '94440', 'villecresnes', NULL, '2020-02-25 14:16:23', '2020-02-25 14:16:23'),
(4, 9, '15', 'avenue du pont', '94000', 'creteil', NULL, '2020-02-25 14:16:23', '2020-02-25 14:16:23'),
(5, 10, '45', 'avenue du bac', '75000', 'Paris', NULL, '2020-02-25 14:16:23', '2020-02-25 14:16:23'),
(6, 11, '250', 'rue du bac', '94300', 'vincennes', NULL, '2020-02-25 14:16:23', '2020-02-25 14:16:23'),
(7, 12, '16', 'rue de montreuil', '93100', 'montreuil', NULL, '2020-02-25 14:16:23', '2020-02-25 14:16:23'),
(8, 13, '01', 'rue de la grange', '92400', 'montrouge', '2éme étages, derniére porte à droite', '2020-02-26 10:45:45', '2020-02-26 10:45:45');

-- --------------------------------------------------------

--
-- Structure de la table `dessert`
--

CREATE TABLE `dessert` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `descriptive` varchar(1000) NOT NULL,
  `pvttc` float NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `dessert`
--

INSERT INTO `dessert` (`id`, `date`, `name`, `descriptive`, `pvttc`, `id_user`, `created_at`, `updated_at`) VALUES
(1, '2020-02-23 15:44:02', 'flan', 'informations:\r\ningredient:\r\nvaleur nutritionelle:\r\n', 5, 9, '2020-02-25 14:47:45', '2020-02-25 14:55:50'),
(2, '2020-02-23 15:48:12', 'tarte aux chocolat', 'informations:\r\ningredient:\r\nvaleur nutrionelle:', 5, 10, '2020-02-25 14:49:43', '2020-02-26 10:46:38');

-- --------------------------------------------------------

--
-- Structure de la table `flat`
--

CREATE TABLE `flat` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `descriptive` varchar(1000) NOT NULL,
  `pvttc` float NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `flat`
--

INSERT INTO `flat` (`id`, `date`, `name`, `descriptive`, `pvttc`, `id_user`, `created_at`, `updated_at`) VALUES
(1, '2020-02-23 15:49:53', 'salade nicoise', 'informations:\r\ningredient:\r\nvaleur nutritionelle:', 10, 9, '2020-02-25 14:55:10', '2020-02-25 14:55:10'),
(2, '2020-02-23 15:49:53', 'spaghetti', 'informations:\r\ningredient:\r\nvaleur nutritionelle:', 10, 10, '2020-02-25 14:55:10', '2020-02-26 10:47:12');

-- --------------------------------------------------------

--
-- Structure de la table `ordered`
--

CREATE TABLE `ordered` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_delivery` int(11) DEFAULT NULL,
  `number_ordered` int(11) NOT NULL,
  `pvttc` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ordered`
--

INSERT INTO `ordered` (`id`, `id_customer`, `id_delivery`, `number_ordered`, `pvttc`, `created_at`, `updated_at`) VALUES
(3, 7, 8, 1, 15, '2020-02-25 16:12:42', '2020-02-25 16:12:42'),
(4, 9, NULL, 2, 15, '2020-02-25 16:12:42', '2020-02-25 16:12:42'),
(5, 9, NULL, 3, 15, '2020-02-25 16:14:54', '2020-02-25 16:14:54'),
(6, 10, NULL, 4, 15, '2020-02-25 16:14:54', '2020-02-25 16:14:54');

-- --------------------------------------------------------

--
-- Structure de la table `ordered_dessert`
--

CREATE TABLE `ordered_dessert` (
  `id` int(11) NOT NULL,
  `id_ordered` int(11) NOT NULL,
  `id_dessert` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ordered_dessert`
--

INSERT INTO `ordered_dessert` (`id`, `id_ordered`, `id_dessert`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2020-02-25 16:16:46', '2020-02-25 16:16:46'),
(2, 4, 2, '2020-02-25 16:16:46', '2020-02-25 16:16:46'),
(3, 5, 2, '2020-02-25 16:18:23', '2020-02-25 16:18:23'),
(4, 6, 1, '2020-02-25 16:18:23', '2020-02-25 16:18:23');

-- --------------------------------------------------------

--
-- Structure de la table `ordered_flat`
--

CREATE TABLE `ordered_flat` (
  `id` int(11) NOT NULL,
  `id_ordered` int(11) NOT NULL,
  `id_flat` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ordered_flat`
--

INSERT INTO `ordered_flat` (`id`, `id_ordered`, `id_flat`, `created_at`, `updated_at`) VALUES
(1, 3, 2, '2020-02-25 16:20:23', '2020-02-25 16:20:23'),
(2, 4, 1, '2020-02-25 16:20:23', '2020-02-25 16:20:23'),
(3, 5, 1, '2020-02-25 16:20:23', '2020-02-25 16:20:23'),
(4, 6, 2, '2020-02-25 16:20:23', '2020-02-25 16:20:23');

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `civility` varchar(8) NOT NULL DEFAULT 'monsieur',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_bird` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `profile`
--

INSERT INTO `profile` (`id`, `id_user`, `civility`, `first_name`, `last_name`, `date_of_bird`, `created_at`, `updated_at`) VALUES
(7, 4, 'monsieur', 'Dupont', 'Alain', '2000-03-01', '2020-02-25 13:53:21', '2020-02-25 13:53:21'),
(8, 5, 'madame', 'brique', 'sofia', '1989-02-24', '2020-02-25 13:53:21', '2020-02-25 13:53:21'),
(9, 6, 'monsieur', 'antoine', 'philippe', '1987-02-24', '2020-02-25 13:57:57', '2020-02-25 13:57:57'),
(10, 7, 'madame', 'arbre', 'magalie', '1997-02-24', '2020-02-25 13:57:57', '2020-02-25 13:57:57'),
(11, 8, 'monsieur', 'lacroix', 'hector', '2000-02-24', '2020-02-25 14:02:11', '2020-02-25 14:02:11'),
(12, 9, 'madame', 'vert', 'fabienne', '2000-10-10', '2020-02-25 14:02:11', '2020-02-25 14:02:11'),
(13, 10, 'madame', 'rivallant', 'stéphanie', '1990-02-26', '2020-02-26 10:42:34', '2020-02-26 10:42:34');

-- --------------------------------------------------------

--
-- Structure de la table `status_delivery`
--

CREATE TABLE `status_delivery` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  `longitude` decimal(8,6) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Libre',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `status_delivery`
--

INSERT INTO `status_delivery` (`id`, `id_user`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, '48.790980', '2.284427', 'En cours de livraison', '2020-03-02 14:53:32', '2020-03-02 15:53:32');

-- --------------------------------------------------------

--
-- Structure de la table `status_ordered`
--

CREATE TABLE `status_ordered` (
  `id` int(11) NOT NULL,
  `id_ordered` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `status_ordered`
--

INSERT INTO `status_ordered` (`id`, `id_ordered`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'En livraison', '2020-02-25 16:29:17', '2020-02-25 16:29:17'),
(2, 4, 'En cours de préparation', '2020-02-25 16:29:17', '2020-02-25 16:29:17'),
(3, 5, 'En attente', '2020-02-25 16:29:17', '2020-02-25 16:29:17'),
(4, 6, 'Annulée', '2020-02-25 16:29:17', '2020-02-25 16:29:17');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `roles` longtext NOT NULL DEFAULT '\'customer\'',
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `roles`, `password`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(4, '\'customer\'', '1234', 'alain@gmail.com', '0610203045', '2020-02-25 13:39:42', '2020-02-25 13:39:42'),
(5, '\'customer\'', '1234', 'sofia@gmail.com', '0610203023', '2020-02-25 13:42:26', '2020-02-25 13:42:26'),
(6, '\'customer\'', '1250', 'philippe@gmail.com', '061020000', '2020-02-25 13:42:26', '2020-02-25 13:42:26'),
(7, '\'customer\'', '1258', 'magalie@gmail.com', '0620203045', '2020-02-25 13:43:55', '2020-02-25 13:43:55'),
(8, '\'delivery\'', '5555', 'hector@gmail.com', '0610203089', '2020-02-25 13:46:03', '2020-02-25 13:46:03'),
(9, '\'collaborator\'', '8522', 'fabienne@gmail.com', '0656102030', '2020-02-25 13:46:03', '2020-02-25 13:46:03'),
(10, '\'collaborator\'', 'ariel', 'stéphanie@yahoo.com', '0610101010', '2020-02-26 10:39:32', '2020-02-26 10:39:32');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_address_profile` (`id_profil`);

--
-- Index pour la table `dessert`
--
ALTER TABLE `dessert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dessert_user` (`id_user`);

--
-- Index pour la table `flat`
--
ALTER TABLE `flat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flat_user` (`id_user`);

--
-- Index pour la table `ordered`
--
ALTER TABLE `ordered`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_delivery_profile` (`id_delivery`),
  ADD KEY `fk_customer_profile` (`id_customer`);

--
-- Index pour la table `ordered_dessert`
--
ALTER TABLE `ordered_dessert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ordered_dessert_dessert` (`id_dessert`),
  ADD KEY `fk_ordered_dessert_ordered` (`id_ordered`);

--
-- Index pour la table `ordered_flat`
--
ALTER TABLE `ordered_flat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ordered_flat_flat` (`id_flat`),
  ADD KEY `fk_ordered_flat_ordered` (`id_ordered`);

--
-- Index pour la table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`) USING BTREE;

--
-- Index pour la table `status_delivery`
--
ALTER TABLE `status_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_status_delivery_user` (`id_user`);

--
-- Index pour la table `status_ordered`
--
ALTER TABLE `status_ordered`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_status_ordered_ordered` (`id_ordered`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `dessert`
--
ALTER TABLE `dessert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `flat`
--
ALTER TABLE `flat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `ordered`
--
ALTER TABLE `ordered`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `ordered_dessert`
--
ALTER TABLE `ordered_dessert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `ordered_flat`
--
ALTER TABLE `ordered_flat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `status_delivery`
--
ALTER TABLE `status_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `status_ordered`
--
ALTER TABLE `status_ordered`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_address_profile` FOREIGN KEY (`id_profil`) REFERENCES `profile` (`id`);

--
-- Contraintes pour la table `dessert`
--
ALTER TABLE `dessert`
  ADD CONSTRAINT `dessert_ibfk_1` FOREIGN KEY (`id`) REFERENCES `ordered_dessert` (`id_dessert`),
  ADD CONSTRAINT `fk_dessert_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `flat`
--
ALTER TABLE `flat`
  ADD CONSTRAINT `fk_flat_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `ordered`
--
ALTER TABLE `ordered`
  ADD CONSTRAINT `fk_customer_profile` FOREIGN KEY (`id_customer`) REFERENCES `profile` (`id`),
  ADD CONSTRAINT `fk_delivery_profile` FOREIGN KEY (`id_delivery`) REFERENCES `profile` (`id`);

--
-- Contraintes pour la table `ordered_dessert`
--
ALTER TABLE `ordered_dessert`
  ADD CONSTRAINT `fk_ordered_dessert_dessert` FOREIGN KEY (`id_dessert`) REFERENCES `dessert` (`id`),
  ADD CONSTRAINT `fk_ordered_dessert_ordered` FOREIGN KEY (`id_ordered`) REFERENCES `ordered` (`id`);

--
-- Contraintes pour la table `ordered_flat`
--
ALTER TABLE `ordered_flat`
  ADD CONSTRAINT `fk_ordered_flat_flat` FOREIGN KEY (`id_flat`) REFERENCES `flat` (`id`),
  ADD CONSTRAINT `fk_ordered_flat_ordered` FOREIGN KEY (`id_ordered`) REFERENCES `ordered` (`id`);

--
-- Contraintes pour la table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `status_delivery`
--
ALTER TABLE `status_delivery`
  ADD CONSTRAINT `fk_status_delivery_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `status_ordered`
--
ALTER TABLE `status_ordered`
  ADD CONSTRAINT `fk_status_ordered_ordered` FOREIGN KEY (`id_ordered`) REFERENCES `ordered` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
