-- CreateTable
CREATE TABLE "domains" (
    "id" SERIAL NOT NULL,
    "domain_code" VARCHAR NOT NULL,
    "domain_description" VARCHAR NOT NULL,
    "domain_value" VARCHAR NOT NULL,
    "domain_value_type" VARCHAR NOT NULL,
    "module" VARCHAR NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(6),
    "created_by" VARCHAR NOT NULL,
    "modified_by" VARCHAR,

    CONSTRAINT "domains_pk" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "password_trace" (
    "passwordtraceid" INTEGER NOT NULL,
    "userid" INTEGER NOT NULL,
    "password" VARCHAR NOT NULL,
    "created_by" VARCHAR NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(6),
    "modified_by" VARCHAR,

    CONSTRAINT "password_trace_pk" PRIMARY KEY ("passwordtraceid")
);

-- CreateTable
CREATE TABLE "permisions" (
    "permisionid" INTEGER NOT NULL,
    "code" VARCHAR NOT NULL,
    "created_by" VARCHAR NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(6),
    "modified_by" VARCHAR,
    "description" VARCHAR NOT NULL,

    CONSTRAINT "permisions_pk" PRIMARY KEY ("permisionid")
);

-- CreateTable
CREATE TABLE "roles" (
    "rolid" INTEGER NOT NULL,
    "code" VARCHAR NOT NULL,
    "created_by" VARCHAR NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(6),
    "modified_by" VARCHAR,
    "description" VARCHAR NOT NULL,

    CONSTRAINT "roles_pk" PRIMARY KEY ("rolid")
);

-- CreateTable
CREATE TABLE "roles_permisions" (
    "rolid" INTEGER NOT NULL,
    "permisionid" INTEGER NOT NULL,

    CONSTRAINT "roles_permisions_pk" PRIMARY KEY ("rolid","permisionid")
);

-- CreateTable
CREATE TABLE "user_roles" (
    "rolid" INTEGER NOT NULL,
    "userid" INTEGER NOT NULL,

    CONSTRAINT "user_roles_pk" PRIMARY KEY ("rolid","userid")
);

-- CreateTable
CREATE TABLE "users" (
    "userid" INTEGER NOT NULL,
    "name" VARCHAR NOT NULL,
    "created_by" VARCHAR NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(6),
    "modified_by" VARCHAR,
    "lastname" VARCHAR NOT NULL,

    CONSTRAINT "users_pk" PRIMARY KEY ("userid")
);

-- AddForeignKey
ALTER TABLE "password_trace" ADD CONSTRAINT "users_password_trace_fk" FOREIGN KEY ("userid") REFERENCES "users"("userid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "roles_permisions" ADD CONSTRAINT "permisions_roles_permisions_fk" FOREIGN KEY ("permisionid") REFERENCES "permisions"("permisionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "roles_permisions" ADD CONSTRAINT "roles_roles_permisions_fk" FOREIGN KEY ("rolid") REFERENCES "roles"("rolid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_roles" ADD CONSTRAINT "roles_user_roles_fk" FOREIGN KEY ("rolid") REFERENCES "roles"("rolid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_roles" ADD CONSTRAINT "users_user_roles_fk" FOREIGN KEY ("userid") REFERENCES "users"("userid") ON DELETE NO ACTION ON UPDATE NO ACTION;
