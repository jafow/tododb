--- ############################################################ 
--- create a database and roles
--- ############################################################ 

--- start from clean slate
drop database if exists tododb;
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
create database tododb owner todoadmin;
