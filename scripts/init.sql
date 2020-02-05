--- ############################################################
--- create a database and roles
--- ############################################################
--- start from clean slate

DROP DATABASE IF EXISTS tododb;

DROP ROLE IF EXISTS todoadmin;

DROP ROLE IF EXISTS todouser;

DROP ROLE IF EXISTS todoservice;

--- a nonsuperuser db role
CREATE ROLE todoadmin createdb createrole replication LOGIN PASSWORD ':dbpass';

--- a regular everyday role
CREATE ROLE todouser;

--- a service role
CREATE ROLE todoservice INHERIT;

GRANT todouser TO todoservice;

---############################################################-
--- database
---############################################################

CREATE DATABASE tododb OWNER todoadmin;

