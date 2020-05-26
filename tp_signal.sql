use tpvues;
DROP TRIGGER IF EXISTS t_enseignants_max;

delimiter #

CREATE TRIGGER t_enseignants_max
    BEFORE INSERT ON enseignants
    FOR EACH ROW
        BEGIN
            SELECT COUNT(*) into @nb FROM enseignants;
            IF @nb >= 10 THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'trop de prof';
            END IF;
        END#

delimiter ;

DROP TRIGGER IF EXISTS t_enseignants_max_augmentation;

delimiter #

CREATE TRIGGER t_enseignants_max_augmentation
    BEFORE UPDATE ON enseignants
    FOR EACH ROW
        BEGIN
            IF (NEW.salaire - OLD.salaire) / OLD.salaire >= 0.1 THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Trop forte augmentation de salaire';
            END IF;
        END#

delimiter ;