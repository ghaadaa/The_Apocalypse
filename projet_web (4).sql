-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 18 juin 2020 à 23:58
-- Version du serveur :  10.1.37-MariaDB
-- Version de PHP :  7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet_web`
--

-- --------------------------------------------------------

--
-- Structure de la table `calcul`
--

CREATE TABLE `calcul` (
  `poids_chien` varchar(30) NOT NULL,
  `desc_chien` varchar(200) NOT NULL,
  `rer` float NOT NULL,
  `mer` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `calcul`
--

INSERT INTO `calcul` (`poids_chien`, `desc_chien`, `rer`, `mer`) VALUES
('12', 'adulte neutralisÃ©', 560, 1008);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idC` int(30) NOT NULL,
  `nomC` varchar(30) NOT NULL,
  `famille` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idC`, `nomC`, `famille`) VALUES
(12, 'Fibre', ' '),
(123, 'Humide', 'Protein'),
(33216, 'Semi humide', 'Protein');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_r`
--

CREATE TABLE `categorie_r` (
  `objet` varchar(30) NOT NULL,
  `modetraitement` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie_r`
--

INSERT INTO `categorie_r` (`objet`, `modetraitement`) VALUES
('livraison', 'coupon de 15%'),
('produit', 'coupon de 15%');

-- --------------------------------------------------------

--
-- Structure de la table `chien`
--

CREATE TABLE `chien` (
  `ref_chien` varchar(30) NOT NULL,
  `nom_chien` varchar(30) NOT NULL,
  `poids_chien` float NOT NULL,
  `race_chien` varchar(30) NOT NULL,
  `age_chien` varchar(30) NOT NULL,
  `sexe_chien` varchar(30) NOT NULL,
  `desc_chien` varchar(200) NOT NULL,
  `cin` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chien`
--

INSERT INTO `chien` (`ref_chien`, `nom_chien`, `poids_chien`, `race_chien`, `age_chien`, `sexe_chien`, `desc_chien`, `cin`) VALUES
('123456', 'Lov', 4, 'Husky', '0 Ã  4 mois', 'Femelle', 'chiot de 4 mois Ã  adulte', 15011721);

-- --------------------------------------------------------

--
-- Structure de la table `clientfidele`
--

CREATE TABLE `clientfidele` (
  `cin_client` int(8) NOT NULL,
  `codePromo` varchar(30) NOT NULL,
  `somme` float NOT NULL,
  `nb_commande` int(11) NOT NULL,
  `validite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `numCommande` int(11) NOT NULL,
  `id_client` int(8) NOT NULL,
  `dateAchat` date NOT NULL,
  `montantC` float NOT NULL,
  `etatCommande` varchar(50) NOT NULL,
  `refProduit` varchar(30) NOT NULL,
  `codePromo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`numCommande`, `id_client`, `dateAchat`, `montantC`, `etatCommande`, `refProduit`, `codePromo`) VALUES
(2, 1, '2020-04-02', 456, '', 'aze', '1234567'),
(12345, 15011721, '2020-04-08', 456, '', 'aze', '123456'),
(99999999, 15011721, '2020-04-08', 0, '', 'aze', '1234567'),
(100000000, 15011721, '2020-06-16', 320, 'en_cours', '', ''),
(100000001, 15011721, '2020-06-16', 296, 'valide', '', ''),
(100000002, 15011721, '2020-06-16', 568, 'valide', '', ''),
(100000003, 15011721, '2020-06-17', 549, 'en_cours', '', ''),
(100000004, 15011721, '2020-06-18', 36, 'valide', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `idI` varchar(30) NOT NULL,
  `nomI` varchar(30) NOT NULL,
  `quantiteI` int(30) NOT NULL,
  `description` varchar(30) NOT NULL,
  `prix` int(30) NOT NULL,
  `image` varchar(80) NOT NULL,
  `idC` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`idI`, `nomI`, `quantiteI`, `description`, `prix`, `image`, `idC`) VALUES
('123456', 'Poulet', 99, 'frais', 12, 'poulet.jpg', 123),
('1236', 'Viande', 6, 'fraiche', 12, 'viande.jpg', 123),
('25', 'Legumes', 221, 'frais', 5, 'legumes.jpg', 12),
('5', 'Saumon', 4, 'fume', 272, 'Saumon.jpg', 33216);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `id_produit` varchar(30) NOT NULL,
  `qte` int(11) NOT NULL,
  `numCommande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id_produit`, `qte`, `numCommande`) VALUES
('1', 1, 8),
('1', 1, 9),
('1', 3, 70),
('1', 3, 71),
('1', 3, 72),
('1', 3, 73),
('1', 2, 74),
('1', 2, 75),
('1', 2, 76),
('1', 2, 77),
('1', 2, 78),
('123456', 1, 0),
('123456', 1, 15011721),
('123456', 2, 100000000),
('123456', 1, 100000001),
('123456', 1, 100000002),
('123456', 2, 100000004),
('1236', 1, 15011721),
('1236', 2, 100000000),
('1236', 1, 100000001),
('1236', 1, 100000002),
('1236', 1, 100000004),
('2', 1, 8),
('2', 1, 9),
('2', 3, 70),
('2', 3, 71),
('2', 3, 72),
('2', 2, 73),
('2', 1, 74),
('2', 1, 75),
('2', 1, 77),
('2', 1, 79),
('25', 1, 100000003),
('3', 1, 9),
('3', 1, 74),
('3', 1, 75),
('3', 1, 76),
('3', 1, 77),
('3', 1, 78),
('3', 1, 79),
('5', 1, 100000000),
('5', 1, 100000001),
('5', 2, 100000002),
('5', 2, 100000003),
('99', 1, 8),
('99', 2, 9),
('99', 1, 74),
('99', 2, 75),
('99', 3, 76),
('99', 3, 77),
('99', 3, 78);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `id_livraison` varchar(30) NOT NULL,
  `date_liv` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`id_livraison`, `date_liv`) VALUES
('12345', '2020-06-03'),
('87956', '2020-06-10');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `nom_livreur` varchar(30) NOT NULL,
  `id_livreur` varchar(30) NOT NULL,
  `zone_liv` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`nom_livreur`, `id_livreur`, `zone_liv`) VALUES
('yassine', '1234', 'tunis'),
('youssef', '9874', 'ariana');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `refProduit` varchar(30) NOT NULL,
  `nb_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `privilege`
--

CREATE TABLE `privilege` (
  `cin_client` int(11) NOT NULL,
  `codePromo` int(11) NOT NULL,
  `somme` int(11) NOT NULL,
  `validite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `privilege`
--

INSERT INTO `privilege` (`cin_client`, `codePromo`, `somme`, `validite`) VALUES
(15011721, 12345, 256, 20);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `Ref` varchar(30) NOT NULL,
  `Typ` varchar(30) NOT NULL,
  `Id_ingredient` varchar(30) NOT NULL,
  `ref_chien` varchar(30) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `Cin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`Ref`, `Typ`, `Id_ingredient`, `ref_chien`, `Quantite`, `Cin`) VALUES
('45628m', 'tttmmlk,', '123456', '123456', 2, 15011001);

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

CREATE TABLE `promotion` (
  `nom_promo` varchar(30) NOT NULL,
  `date_promo` date NOT NULL,
  `desc_promo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`nom_promo`, `date_promo`, `desc_promo`) VALUES
('Business', '2020-06-30', 'Economisez jusqu\'Ã  15%'),
('Personal', '2020-06-30', ' Economisez jusqu\'Ã  10Ã¹'),
('Ultimate', '2020-06-30', 'Economisez jusqu\'Ã  20%');

-- --------------------------------------------------------

--
-- Structure de la table `reclamation`
--

CREATE TABLE `reclamation` (
  `numCommande` int(11) NOT NULL,
  `objet` varchar(30) NOT NULL,
  `description_` text NOT NULL,
  `cin` int(8) NOT NULL,
  `dateReception` date NOT NULL,
  `email` text NOT NULL,
  `telephone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reclamation`
--

INSERT INTO `reclamation` (`numCommande`, `objet`, `description_`, `cin`, `dateReception`, `email`, `telephone`) VALUES
(2, 'produit', 'produit endommagé', 15011001, '0000-00-00', 'ghada.benhadjslimene@esprit.tn', 23568645),
(12345, 'livraison', 'produit endommagÃ©', 15011721, '2020-06-04', 'ghadaslimene656@gmail.com', 23232323);

-- --------------------------------------------------------

--
-- Structure de la table `reduction`
--

CREATE TABLE `reduction` (
  `code` varchar(30) CHARACTER SET latin1 NOT NULL,
  `pourcentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reduction`
--

INSERT INTO `reduction` (`code`, `pourcentage`) VALUES
('123456', 20),
('1234567', 20),
('12345987', 10),
('1236589', 10),
('159786', 10),
('555555', 10),
('65987463', 15),
('88888888', 10);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `login` varchar(20) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `cin` int(8) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `sexe` varchar(20) NOT NULL,
  `tel` int(8) NOT NULL,
  `email` varchar(50) NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`login`, `pwd`, `cin`, `nom`, `prenom`, `sexe`, `tel`, `email`, `adresse`, `role`) VALUES
('ghada126', '159', 1282397, 'ghada', 'slimene', 'Femme', 29502963, 'tiba.2010@hotmail.fr', 'tunis', 'admin'),
('Amina', '789', 1282398, 'm', 'slm', 'Femme', 29502963, 'tiba.2010@hotmail.fr', 'tunis', 'client'),
('ghada12', '123456', 15011001, 'ghada', 'slimene', 'femme', 23232323, '', 'ghjkl', 'admin'),
('ghada1', '123', 15011721, 'ghada', 'slimene', 'femme', 23232323, 'ghadaslimene656@gmail.com', 'kram', 'client');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `calcul`
--
ALTER TABLE `calcul`
  ADD PRIMARY KEY (`desc_chien`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idC`);

--
-- Index pour la table `categorie_r`
--
ALTER TABLE `categorie_r`
  ADD PRIMARY KEY (`objet`);

--
-- Index pour la table `chien`
--
ALTER TABLE `chien`
  ADD PRIMARY KEY (`ref_chien`),
  ADD KEY `cin` (`cin`);

--
-- Index pour la table `clientfidele`
--
ALTER TABLE `clientfidele`
  ADD PRIMARY KEY (`cin_client`),
  ADD KEY `fok_codep` (`codePromo`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`numCommande`),
  ADD KEY `fok_produit` (`refProduit`),
  ADD KEY `fok_codered` (`codePromo`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`idI`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id_produit`,`numCommande`),
  ADD KEY `ligne_commande_ibfk_2` (`numCommande`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id_livraison`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id_livreur`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`refProduit`);

--
-- Index pour la table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`cin_client`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`Ref`),
  ADD KEY `fk_id` (`Id_ingredient`),
  ADD KEY `fok_client` (`Cin`),
  ADD KEY `fk_chien` (`ref_chien`);

--
-- Index pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`nom_promo`);

--
-- Index pour la table `reclamation`
--
ALTER TABLE `reclamation`
  ADD PRIMARY KEY (`numCommande`),
  ADD KEY `fk_client` (`cin`),
  ADD KEY `fk_objet` (`objet`);

--
-- Index pour la table `reduction`
--
ALTER TABLE `reduction`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`cin`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `numCommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000005;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clientfidele`
--
ALTER TABLE `clientfidele`
  ADD CONSTRAINT `fok_codep` FOREIGN KEY (`codePromo`) REFERENCES `reduction` (`code`),
  ADD CONSTRAINT `fork_client` FOREIGN KEY (`cin_client`) REFERENCES `user` (`cin`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `fork_produit` FOREIGN KEY (`refProduit`) REFERENCES `produit` (`Ref`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_chien` FOREIGN KEY (`ref_chien`) REFERENCES `chien` (`ref_chien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`Id_ingredient`) REFERENCES `ingredient` (`idI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fok_client` FOREIGN KEY (`Cin`) REFERENCES `user` (`cin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reclamation`
--
ALTER TABLE `reclamation`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`cin`) REFERENCES `user` (`cin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_objet` FOREIGN KEY (`objet`) REFERENCES `categorie_r` (`objet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fok_commande` FOREIGN KEY (`numCommande`) REFERENCES `commande` (`numCommande`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
