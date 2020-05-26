USE ACME;

-- Creation user 
CREATE USER 'fremont'@'172.25.0.2' IDENTIFIED BY 'mdp';

CREATE USER 'leroy'@'172.25.0.2' IDENTIFIED BY 'mdp';

-- DROP USER 'leroy'@'%';
-- DROP USER 'fremont'@'%';

-- P3 
GRANT SELECT (nom) ON projets TO 'fremont'@'172.25.0.2';

-- D6
CREATE OR REPLACE VIEW employes_dpt_10 as SELECT * FROM employes WHERE departement_id=10;
GRANT SELECT ON employes_dpt_10 TO 'fremont'@'172.25.0.2';

-- C6 
GRANT INSERT, DELETE ON employes_dpt_10 TO 'fremont'@'172.25.0.2';

delimiter //
CREATE TRIGGER t_employe_insert_same_dept
    BEFORE INSERT ON employes_dpt_10
    FOR EACH ROW
    BEGIN
        SELECT departement_id into @dpt FROM employes
        WHERE login=user();
        IF (new.departement_id <> @dpt) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid departement id';
        END IF//
    END//

delimiter ;