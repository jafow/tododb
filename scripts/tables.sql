---############################################################-
--- schema
---############################################################ 
drop schema if exists td cascade;
create schema td;


---############################################################-
--- access privileges
---############################################################ 
ALTER DEFAULT PRIVILEGES IN SCHEMA td GRANT SELECT ON TABLES to PUBLIC;
ALTER DEFAULT PRIVILEGES IN SCHEMA td GRANT INSERT,UPDATE ON TABLES to todouser;

--- create account table
drop table if exists accounts;

create table accounts(
    id bigserial serial primary key,
    email varchar(255) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp,
);
