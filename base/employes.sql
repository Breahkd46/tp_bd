use ACME;
DROP TABLE IF EXISTS `employes`;
CREATE TABLE `employes` (
  `id`             int(11) NOT NULL,
  `nom`            varchar(255) DEFAULT NULL,
  `prenom`         varchar(255) DEFAULT NULL,
  `poste`          varchar(255) DEFAULT NULL,
  `salaire`        int(11) DEFAULT NULL,
  `projet_id`      int(11) DEFAULT NULL,
  `departement_id` int(11) NOT NULL,
  `deleted_at`     date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projet_id`      (`projet_id`),
  KEY `departement_id` (`departement_id`),
  CONSTRAINT `employes_ibfk_1` FOREIGN KEY (`projet_id`)      REFERENCES `projets`      (`id`),
  CONSTRAINT `employes_ibfk_2` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`)
);

INSERT INTO `employes`
(`id`, `nom`,       `prenom`,     `login`,                    `poste`,          `salaire`, `projet_id`, `departement_id`, `deleted_at`) VALUES

(10,   'Leroy',     'Marie',      `'leroy'@'172.25.0.2'`,     'President',      29000,      NULL,        10,               NULL),

(8,    'Lesage',    'Franck',     `'lesage'@'172.25.0.2'`,    'Directeur',      19600,      NULL,        10,               NULL),
(13,   'Fremont',   'Caroline',   `'fremont'@'172.25.0.2'`,   'Gestionnaire',   7600,       NULL,        10,               NULL),
(2,    'Leclerc',   'Celine',     `'leclerc'@'172.25.0.2'`,   'Chef de projet', 6400,       1,           10,               NULL),
(9,    'Dubois',    'Pierre',     `'dubois'@'172.25.0.2'`,    'Ingénieur',      24000,      1,           10,               NULL),
(3,    'Biraut',    'Henri',      `'biraut'@'172.25.0.2'`,    'Chef de projet', 12800,      2,           10,               NULL),
(6,    'Martin',    'Gabrielle',  `'martin'@'172.25.0.2'`,    'Ingénieur',      11000,      2,           10,               NULL),
(14,   'Chatel',    'Marie',      `'chatel'@'172.25.0.2'`,    'Ingénieur',      24000,      2,           10,               NULL),
(4,    'Berger',    'Simone',     `'berger'@'172.25.0.2'`,    'Ingénieur',      11000,      3,           10,               NULL),

(5,    'Mercier',   'Marc',       `'mercier'@'172.25.0.2'`,   'Directeur',      23800,      NULL,        20,               NULL),
(15,   'Villard',   'Michel',     `'villard'@'172.25.0.2'`,   'Gestionnaire',   10400,      NULL,        20,               NULL),
(11,   'Benain',    'Luc',        `'benain'@'172.25.0.2'`,    'Chef de projet', 12000,      3,           20,               NULL),
(1,    'Chaulvy',   'Jean',       `'chaulvy'@'172.25.0.2'`,   'Ingénieur',      19500,      3,           20,               NULL),
(7,    'Noiret',    'Alain',      `'noiret'@'172.25.0.2'`,    'Ingénieur',      22800,      1,           20,               NULL);
