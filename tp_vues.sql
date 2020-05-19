
DROP DATABASE IF EXISTS tpvues;
CREATE DATABASE IF NOT EXISTS tpvues;
USE tpvues;

CREATE TABLE departements (
    id   INT,
    nom  VARCHAR(45)
);

CREATE TABLE villes (
    id              INT,
    nom             VARCHAR(45),
    departement_id  INT
);

CREATE TABLE enseignants (
    id              INT,
    nom             VARCHAR(255),
    prenom          VARCHAR(255),
    dateNaissance   DATE,
    mail            VARCHAR(100),
    siecle          INT,
    salaire         INT,
    villeNaiss_id   INT,
    referent_id     INT
);

CREATE TABLE matieres (
    id   INT,
    nom  VARCHAR(45)
);

CREATE TABLE enseignants_matieres (
    enseignant_id     INT,
    matiere_id        INT
);

INSERT INTO departements VALUES
    (31, "HAUTE GARONNE"),
    (33, "GIRONDE"),
    (75, "PARIS");

INSERT INTO villes VALUES
    (1, "TOULOUSE",         31),
    (2, "MURET",            31),
    (3, "PARIS",            75),
    (4, "BORDEAUX",         33),
    (5, "SAINT EMILION",    33),
    (6, "VELIZY",           75);

INSERT INTO enseignants VALUES
    (1, "Turing",     "Alan",    "1912-06-30", "alan.turing@pst.fr",  20, 10000   , 1, 4),
    (2, "Bell",     "Graham",    "1847-03-03", "graham.bell@pst.fr",  20, 15000   , 4, 6),
    (3, "Codd",     "Edgard",    "1923-08-19", "edgard.codd@pst.fr",  20, 9000    , 3, 4),
    (4, "Gates",     "Bill",     "1955-10-28", "bill.gates@pst.fr",   20, 100000  , 6, null),
    (5, "Lovelace", "Ada",       "1815-12-10", "ada.lovelace@pst.fr", 20, 12000   , 2, 6),
    (6, "Jobs",     "Steve",     "1955-02-27", "steve.jobs@pst.fr",   20, 90000   , 1, null);

INSERT INTO matieres VALUES
    (1, "Maths"),
    (2, "Francais"),
    (3, "Histoire");

INSERT INTO enseignants_matieres VALUES
    (1,2),
    (1,1),
    (3,3),
    (4,1),
    (4,3);

CREATE TABLE etudiants (
    id      INT,
    prenom  VARCHAR(255),
    nom     VARCHAR(255)
);

CREATE TABLE notes (
    etudiant_id INT,
    matiere_id  INT,
    `date`      DATE,
    valeur      INT,
    coefficient INT
);

INSERT INTO etudiants VALUES
    (1,"Marcus","Miller"),
    (2,"Victor","Wooten"),
    (3,"Jaco"  ,"Pastorius");

INSERT INTO notes VALUES
    (1,1,"2017-02-04",17,1),
    (2,1,"2017-02-04",11,1),
    (3,1,"2017-02-04",8, 1),
    (1,2,"2016-12-17",10,1),
    (2,2,"2016-12-17",13,1),
    (3,2,"2016-12-17",9, 1),
    (1,1,"2016-10-25",7, 2),
    (3,1,"2016-10-25",13,2),
    (2,2,"2016-09-19",14,3);

-- Exercice 1

CREATE OR REPLACE VIEW v_notes_etu AS
    SELECT n.*, e.nom as etu_nom, e.prenom as etu_prenom, m.nom as mat_nom 
    FROM notes as n
    JOIN etudiants as e ON n.etudiant_id = e.id
    JOIN matieres as m ON n.matiere_id = m.id
;

INSERT INTO notes VALUES
    (1,1,"2017-02-04",5,1);

SELECT * FROM v_notes_etu;

UPDATE v_notes_etu
SET
    mat_nom = "blabla";

SELECT * FROM v_notes_etu;

SELECT * FROM matieres;

-- INSERT INTO v_notes_etu VALUES
--     (1,1,"2017-02-04",5,1, "MILER", "Kevin", "INFO");

SELECT * FROM v_notes_etu;

-- Exercice 2
CREATE OR REPLACE VIEW v_ens_more_20k AS
    SELECT * FROM enseignants WHERE salaire > 20000;

SELECT * FROM v_ens_more_20k;

UPDATE v_ens_more_20k
SET
    salaire = 19000
WHERE
    id = 4;

SELECT * FROM v_ens_more_20k;


SELECT * FROM enseignants;

INSERT INTO v_ens_more_20k VALUES
    (10,"MILLER","KEVIN", "2017-02-04", "mail", 5,26000, 4,4);

SELECT * FROM v_ens_more_20k;


SELECT * FROM enseignants;