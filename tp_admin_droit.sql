-- SHOW grants;

Drop USER IF EXISTS 'valentin'@'172.25.0.2';

create user 'valentin'@'172.25.0.2' identified by 'mdp';

GRANT SELECT ON tpvues.departements TO 'valentin'@'172.25.0.2';

GRANT SELECT ON *.* TO 'valentin'@'172.25.0.2';

GRANT INSERT, DELETE ON tpvues.departements TO 'valentin'@'172.25.0.2';

GRANT USAGE ON tpvues.* TO 'valentin'@'172.25.0.2'
    WITH MAX_QUERIES_PER_HOUR 10;