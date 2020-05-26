use ACME;
DROP TABLE IF EXISTS `projets`;
CREATE TABLE `projets` (
  `id`     int(11) NOT NULL,
  `nom`    varchar(255) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `projets`
(`id`, `nom`,       `budget`) VALUES
(1,    'Alpha',     320000),
(2,    'Bravo',     250000),
(3,    'Charlie',   280000);
