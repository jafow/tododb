# db connection 
DB_HOST?=localhost
DB_PORT?=5436
DB_USER?=todoadmin
DB_NAME?=tododb
# pro tip: override this with DB_PASSWORD="mysecurepassword" make
DB_PASSWORD?=pizza

# dirs
HOME?=$(HOME)
PGPASS?=$(HOME)/.pgpass
BUILDER=${CURDIR}/builder.sql
SCRIPTS=${CURDIR}/scripts

# targets
all: migrate
	psql -U $(DB_USER) -d $(DB_NAME) -h $(DB_HOST) -f $(BUILDER)

migrate: init tables
	# add additional targets as needed...
	@cat $(SCRIPTS)/migrate.sql >> $(BUILDER)

init: $(PGPASS)
	@psql -U postgres -h $(DB_HOST) -d postgres -p $(DB_PORT) --set=dbpass=$(DB_PASSWORD) -f $(SCRIPTS)/init.sql

$(PGPASS):
	@echo "$(DB_HOST):$(DB_PORT):$(DB_NAME):$(DB_USER):$(DB_PASSWORD)" >> "$(HOME)/.pgpass"

tables:
	@cat ${SCRIPTS}/tables.sql >> $(BUILDER)
