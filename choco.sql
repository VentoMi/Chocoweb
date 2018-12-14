-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 30 nov. 2018 à 14:55
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `choco`
--

-- --------------------------------------------------------

--
-- Structure de la table `chefs`
--

DROP TABLE IF EXISTS `chefs`;
CREATE TABLE IF NOT EXISTS `chefs` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chefs`
--

INSERT INTO `chefs` (`id`, `img`, `name`, `created_at`, `update_at`) VALUES
(1, '#', 'Didier', '2018-10-19 19:16:39', NULL),
(2, '#', 'Norbert', '2018-10-19 19:16:39', NULL),
(3, '#', 'Rachel', '2018-10-19 19:17:44', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `chefs_socials`
--

DROP TABLE IF EXISTS `chefs_socials`;
CREATE TABLE IF NOT EXISTS `chefs_socials` (
  `chef_id` int(11) UNSIGNED NOT NULL,
  `network` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`chef_id`,`network`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chefs_socials`
--

INSERT INTO `chefs_socials` (`chef_id`, `network`, `url`) VALUES
(1, 'facebook', '#'),
(1, 'gmail', '#'),
(1, 'twitter', '#'),
(2, 'facebook', '#'),
(2, 'gmail', '#'),
(2, 'twitter', '#'),
(3, 'facebook', '#'),
(3, 'gmail', '#'),
(3, 'twitter', '#');

-- --------------------------------------------------------

--
-- Structure de la table `chefs_translations`
--

DROP TABLE IF EXISTS `chefs_translations`;
CREATE TABLE IF NOT EXISTS `chefs_translations` (
  `chef_id` int(11) UNSIGNED NOT NULL,
  `locale` varchar(50) NOT NULL,
  `job` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`chef_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chefs_translations`
--

INSERT INTO `chefs_translations` (`chef_id`, `locale`, `job`, `description`) VALUES
(1, 'en', 'master confectioner', 'A chocolate master not like the others'),
(1, 'fr', 'chocolatier-confiseur', 'Un chef chocolatier pas comme les autres'),
(2, 'en', 'cook', 'a cook cooking'),
(2, 'fr', 'cuisinier', 'un cuisinier cuisineur'),
(3, 'en', 'baker', 'I bake small cakes'),
(3, 'fr', 'boulanger', 'je fais des petits gâteaux');

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`id`, `created_at`, `updated_at`) VALUES
(1, '2018-10-19 19:10:21', NULL),
(2, '2018-10-19 19:10:21', NULL),
(3, '2018-10-26 08:40:20', NULL),
(4, '2018-10-26 08:40:20', NULL),
(5, '2018-10-26 08:41:59', NULL),
(6, '2018-10-26 08:41:59', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ingredients_translations`
--

DROP TABLE IF EXISTS `ingredients_translations`;
CREATE TABLE IF NOT EXISTS `ingredients_translations` (
  `ingredient_id` int(11) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`ingredient_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ingredients_translations`
--

INSERT INTO `ingredients_translations` (`ingredient_id`, `locale`, `name`) VALUES
(1, 'en', 'flour'),
(1, 'fr', 'farine'),
(2, 'en', 'egg'),
(2, 'fr', 'oeuf'),
(3, 'en', 'milk'),
(3, 'fr', 'lait'),
(4, 'en', 'sugar'),
(4, 'fr', 'sucre'),
(5, 'en', 'chocolate'),
(5, 'fr', 'chocolat'),
(6, 'en', 'nuts'),
(6, 'fr', 'noisettes');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient_chocolat`
--

DROP TABLE IF EXISTS `ingredient_chocolat`;
CREATE TABLE IF NOT EXISTS `ingredient_chocolat` (
  `ingredient_id` varchar(255) NOT NULL,
  `chocolat_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `locale` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nos_chocolats`
--

DROP TABLE IF EXISTS `nos_chocolats`;
CREATE TABLE IF NOT EXISTS `nos_chocolats` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `img_src` varchar(255) NOT NULL,
  `price` int(11) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `nos_chocolats`
--

INSERT INTO `nos_chocolats` (`id`, `img_src`, `price`, `created_at`, `update_at`) VALUES
(1, '#', 1500, '2018-10-19 18:45:20', NULL),
(2, '#', 2000, '2018-10-19 18:46:24', NULL),
(3, '#', 2500, '2018-10-19 18:46:52', NULL),
(4, '#', 1000, '2018-10-19 18:46:52', NULL),
(5, '#', 500, '2018-10-19 18:47:27', NULL),
(6, '#', 4000, '2018-10-19 18:47:27', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `nos_chocolats_translations`
--

DROP TABLE IF EXISTS `nos_chocolats_translations`;
CREATE TABLE IF NOT EXISTS `nos_chocolats_translations` (
  `chocolat_id` int(11) UNSIGNED NOT NULL,
  `locale` varchar(50) NOT NULL,
  `img_alt` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`chocolat_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `nos_chocolats_translations`
--

INSERT INTO `nos_chocolats_translations` (`chocolat_id`, `locale`, `img_alt`, `name`) VALUES
(1, 'en', 'a chocolate cake ', 'brownie'),
(1, 'fr', 'un cake au chocolat', 'brownie'),
(2, 'en', 'a chocolate cake', 'concorde'),
(2, 'fr', 'un gâteau au chocolat', 'concorde'),
(3, 'en', 'a chocolate cake', 'molten chocolate cake'),
(3, 'fr', 'un gâteau au chocolat', 'mi-cuit'),
(4, 'en', 'a chocolate cake', 'black forest cake'),
(4, 'fr', 'gâteau au chocolat', 'foret noire'),
(5, 'en', 'a chocolate cake', 'lamington '),
(5, 'fr', 'un gâteau au chocolat', 'lamington'),
(6, 'en', 'a chocolate cake', 'opera'),
(6, 'fr', 'un gâteau au chocolat', 'opéra');

-- --------------------------------------------------------

--
-- Structure de la table `slides`
--

DROP TABLE IF EXISTS `slides`;
CREATE TABLE IF NOT EXISTS `slides` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `img_src` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `slides`
--

INSERT INTO `slides` (`id`, `img_src`, `created_at`, `updated_at`) VALUES
(1, './content/choco1', '2018-10-12 14:16:07', NULL),
(2, './content/choco2', '2018-10-12 14:16:07', NULL),
(3, './content/choco3', '2018-10-12 14:16:07', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `slide_translations`
--

DROP TABLE IF EXISTS `slide_translations`;
CREATE TABLE IF NOT EXISTS `slide_translations` (
  `slides_id` int(11) UNSIGNED NOT NULL,
  `locale` varchar(50) NOT NULL,
  `img_alt` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `pre` varchar(255) DEFAULT NULL,
  `btn_label` varchar(255) NOT NULL,
  `btn_href` varchar(255) NOT NULL,
  PRIMARY KEY (`slides_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `slide_translations`
--

INSERT INTO `slide_translations` (`slides_id`, `locale`, `img_alt`, `title`, `pre`, `btn_label`, `btn_href`) VALUES
(1, 'en', 'chocolate cake', 'learn to cook good cakes', 'cook lesson', 'interested', 'https://dribbble.com/'),
(1, 'fr', 'une prépa de choco', 'apprenez à cuisiner ', 'cours de cuisine gratuit', 'je suis intéressé', 'https://www.mcdonalds.be/fr/produits'),
(2, 'en', 'good cakes', 'refind recieps', 'recieps', 'rfrgrgr', 'https://dribbble.com/'),
(2, 'fr', 'des bons gâteaux ', 'retrouvez des centaines de recettes de gâteaux', 'recettes & astuces', 'En savoir plus', 'https://fr.wordpress.org/'),
(3, 'en', 'enenenen', 'enenenenne', 'enenenne', 'enenenen', 'https://fr.wordpress.org/'),
(3, 'fr', 'Encore de gâteaux au chocolat ', 'le chocolat ingrédient glamour', 'la robe parfaite', 'Fêter plus grâce au chocolat', 'https://fr.wordpress.org/');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chefs_socials`
--
ALTER TABLE `chefs_socials`
  ADD CONSTRAINT `chefs_socials` FOREIGN KEY (`chef_id`) REFERENCES `chefs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `chefs_translations`
--
ALTER TABLE `chefs_translations`
  ADD CONSTRAINT `chefs_translations` FOREIGN KEY (`chef_id`) REFERENCES `chefs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ingredients_translations`
--
ALTER TABLE `ingredients_translations`
  ADD CONSTRAINT `ingredients_translations_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `nos_chocolats_translations`
--
ALTER TABLE `nos_chocolats_translations`
  ADD CONSTRAINT `nos_chocolats_translations` FOREIGN KEY (`chocolat_id`) REFERENCES `nos_chocolats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `slide_translations`
--
ALTER TABLE `slide_translations`
  ADD CONSTRAINT `slide_translation` FOREIGN KEY (`slides_id`) REFERENCES `slides` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
