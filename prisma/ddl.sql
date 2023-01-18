-- DROP SCHEMA app;

CREATE SCHEMA app AUTHORIZATION postgres;

CREATE TABLE app.permisions (
                permisionId INTEGER NOT NULL,
                code VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                createAt DATE NOT NULL,
                createUser VARCHAR NOT NULL,
                modifiedUser VARCHAR,
                modifiedAt DATE,
                CONSTRAINT permisions_pk PRIMARY KEY (permisionId)
);


CREATE TABLE app.roles (
                rolId INTEGER NOT NULL,
                code VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                createdAt DATE NOT NULL,
                createUser VARCHAR NOT NULL,
                modifiedUser VARCHAR,
                modifiedAt VARCHAR,
                CONSTRAINT roles_pk PRIMARY KEY (rolId)
);


CREATE TABLE app.roles_permisions (
                rolId INTEGER NOT NULL,
                permisionId INTEGER NOT NULL,
                CONSTRAINT roles_permisions_pk PRIMARY KEY (rolId, permisionId)
);


CREATE TABLE app.users (
                userId INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                lastName VARCHAR NOT NULL,
                username VARCHAR NOT NULL,
                createAt DATE NOT NULL,
                createUser VARCHAR NOT NULL,
                modifiedAt DATE,
                modifiedUser VARCHAR,
                CONSTRAINT users_pk PRIMARY KEY (userId)
);


CREATE TABLE app.password_trace (
                passwordTraceId INTEGER NOT NULL,
                userId INTEGER NOT NULL,
                password VARCHAR NOT NULL,
                createdAt DATE NOT NULL,
                modifiedAt DATE NOT NULL,
                CONSTRAINT password_trace_pk PRIMARY KEY (passwordTraceId)
);


CREATE TABLE app.user_roles (
                rolId INTEGER NOT NULL,
                userId INTEGER NOT NULL,
                CONSTRAINT user_roles_pk PRIMARY KEY (rolId, userId)
);


CREATE SEQUENCE app.domains_id_seq;

CREATE TABLE app.domains (
                id INTEGER NOT NULL DEFAULT nextval('app.domains_id_seq'),
                domainCode VARCHAR NOT NULL,
                domainDescription VARCHAR NOT NULL,
                domainValue VARCHAR NOT NULL,
                domainValueType VARCHAR NOT NULL,
                module VARCHAR NOT NULL,
                createAt DATE NOT NULL,
                modifiedAt DATE,
                createUser VARCHAR NOT NULL,
                modifiedUser VARCHAR,
                CONSTRAINT domains_pk PRIMARY KEY (id)
);


ALTER SEQUENCE app.domains_id_seq OWNED BY app.domains.id;

ALTER TABLE app.roles_permisions ADD CONSTRAINT permisions_roles_permisions_fk
FOREIGN KEY (permisionId)
REFERENCES app.permisions (permisionId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE app.roles_permisions ADD CONSTRAINT roles_roles_permisions_fk
FOREIGN KEY (rolId)
REFERENCES app.roles (rolId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE app.user_roles ADD CONSTRAINT roles_user_roles_fk
FOREIGN KEY (rolId)
REFERENCES app.roles (rolId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE app.user_roles ADD CONSTRAINT users_user_roles_fk
FOREIGN KEY (userId)
REFERENCES app.users (userId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE app.password_trace ADD CONSTRAINT users_password_trace_fk
FOREIGN KEY (userId)
REFERENCES app.users (userId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;