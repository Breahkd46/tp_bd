use ACME;
DROP TABLE IF EXISTS `departements`;
CREATE TABLE `departements` (
  `id`   int(11) NOT NULL,
  `nom`  varchar(255) DEFAULT NULL,
  `lieu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `departements`
(`id`, `nom`,  `lieu`) VALUES
(10,    'Dev', 'Bordeaux'),
(20,    'R&D', 'Toulouse');
