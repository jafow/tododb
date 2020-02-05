--- set to one of DEBUG1,DEBUG2...DEBUG4,NOTICE for debugging
SET client_min_messages = warning;

---############################################################-
--- schema
---############################################################

DROP SCHEMA IF EXISTS td CASCADE;

CREATE SCHEMA td;

---############################################################-
--- access privileges
---############################################################

ALTER DEFAULT PRIVILEGES IN SCHEMA td GRANT
SELECT
    ON TABLES TO PUBLIC;

ALTER DEFAULT PRIVILEGES IN SCHEMA td GRANT INSERT, UPDATE ON TABLES TO todouser;

--- create account table
DROP TABLE IF EXISTS td.accounts;

CREATE TABLE td.accounts (
    id serial PRIMARY KEY,
    email varchar(255) NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);

--- create template_list table
DROP TABLE IF EXISTS td.template_lists;

CREATE TABLE td.template_lists (
    id serial PRIMARY KEY,
    title varchar(255) NOT NULL,
    description varchar(255),
    items json,
    owner_id integer REFERENCES td.accounts (id),
    expires_at timestamp DEFAULT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);

--- active lists
CREATE TABLE td.active_lists (
    id serial PRIMARY KEY,
    title varchar(255) NOT NULL,
    description varchar(255),
    items json,
    owner_id integer REFERENCES td.accounts (id),
    expires_at timestamp DEFAULT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE td.list_items (
    id serial PRIMARY KEY,
    description varchar(255),
    complete boolean DEFAULT FALSE,
    parent_id integer REFERENCES td.active_lists (id),
    expires_at timestamp DEFAULT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);

