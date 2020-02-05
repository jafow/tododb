--- set to one of DEBUG1,DEBUG2...DEBUG4,NOTICE for debugging
set client_min_messages = warning;

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
drop table if exists td.accounts;

create table td.accounts(
    id serial primary key,
    email varchar(255) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);

--- create template_list table

drop table if exists td.template_lists;

create table td.template_lists(
    id serial primary key,
    title varchar(255) not null,
    description varchar(255),
    items json,
    owner_id integer REFERENCES td.accounts(id),

    expires_at timestamp default NULL,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


--- active lists
create table td.active_lists (
    id serial primary key,
    title varchar(255) not null,
    description varchar(255),
    items json,
    owner_id integer REFERENCES td.accounts(id),

    expires_at timestamp default NULL,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


create table td.list_items (
    id serial primary key,
    description varchar(255),
    complete boolean default FALSE,

    parent_id integer REFERENCES td.active_lists(id),
    expires_at timestamp default NULL,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);
