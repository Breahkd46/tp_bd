
DROP DATABASE IF EXISTS tp;
CREATE DATABASE IF NOT EXISTS tp;
USE tp;

CREATE TABLE projets (
    id                  INT NOT NULL PRIMARY KEY,
    nom                 VARCHAR(255) NOT NULL,
    budget              INT NOT NULL
);

CREATE TABLE departements (
    id                  INT NOT NULL PRIMARY KEY,
    nom                 VARCHAR(255) NOT NULL,
    lieu                VARCHAR(255) NOT NULL
);

CREATE TABLE employes (
    id                  INT NOT NULL PRIMARY KEY,
    nom                 VARCHAR(255) NOT NULL,
    prenom              VARCHAR(255) NOT NULL,
    poste               VARCHAR(255) NOT NULL,
    salaire             INT NOT NULL,
    projects_id         INT,
    departements_id     INT,
    deleted_at          DATE,

    CONSTRAINT FK_Projets_id FOREIGN KEY(projects_id) REFERENCES projets(id),
    CONSTRAINT FK_departements_id FOREIGN KEY(departements_id) REFERENCES departements(id)
);

INSERT INTO tp.projets VALUES
  (1, "Gamma",   320000),
  (2, "Papyrus", 250000),
  (3, "Rodin",   280000),
  (4, "alpha",   200000);

INSERT INTO tp.departements VALUES
  (10, "Finances",     "Paris"    ),
  (20, "Recherche",    "Grenoble" ),
  (30, "Ventes",       "Lyon"     ),
  (40, "Fabrication",  "Lille"    );

INSERT INTO tp.employes VALUES
  (1,  "Chaulvy", "Jean",      "Directeur",  19500, 4, 40, null),
  (2,  "Leclerc", "Celine",    "Commercial", 6400,  2, 20, null),
  (3,  "Biraud",  "Henry",     "Commercial", 12800, 3, 30, null),
  (4,  "Berger",  "Simone",    "Commercial", 11000, 4, 30, null),
  (5,  "Mercier", "Marc",      "Directeur",  23800, 2, 20, null),
  (6,  "Martin",  "Gabrielle", "Commercial", 11000, 3, 30, null),
  (7,  "Noiret",  "Alain",     "Directeur",  22800, 4, 30, null),
  (8,  "Lesage",  "Franck",    "Directeur",  19600, 1, 10, null),
  (9,  "Dubois",  "Pierre",    "Ingenieur",  24000, 2, 20, null),
  (10, "Leroy",   "Marie",     "President",  29000, 1, 10, null),
  (11, "Benain",  "Luc",       "Commercial", 12000, 3, 30, null),
  (12, "Clement", "Simon",     "Secretaire", 8800,  2, 20, null),
  (13, "Fremont", "Caroline",  "Secretaire", 7600,  3, 30, null),
  (14, "Chatel",  "Marie",     "Ingenieur",  24000, 2, 20, null),
  (15, "Villard", "Michel",    "Secretaire", 10400, 3, 30, null);



UPDATE employes
SET 
    prenom = "Henri"
WHERE prenom = "Henry" 
AND nom = "Biraud";

DELETE FROM employes
WHERE prenom = "Simon" AND nom = "Clement";

SELECT e.* 
FROM employes as e
JOIN departements as d ON e.departements_id = d.id 
WHERE d.nom = "Recherche";

SELECT AVG(salaire) 
FROM employes;

SELECT d.nom, AVG(e.salaire)
FROM employes AS e
JOIN departements as d ON e.departements_id = d.id 
GROUP BY e.departements_id;