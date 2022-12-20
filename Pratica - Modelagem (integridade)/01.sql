CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"stateId" integer NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customerPhones" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"number" integer NOT NULL,
	"type" integer NOT NULL,
	CONSTRAINT "customerPhones_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customerAddresses" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"street" TEXT NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" integer NOT NULL,
	"cityId" integer NOT NULL,
	CONSTRAINT "customerAddresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"fullName" TEXT NOT NULL,
	"cpf" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.bankAccount" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"accountNumber" TEXT NOT NULL,
	"agency" integer NOT NULL,
	"openDate" TIMESTAMP NOT NULL,
	"closeDate" DATE,
	CONSTRAINT "bankAccount_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.transactions" (
	"id" serial NOT NULL,
	"bankAccountId" integer NOT NULL,
	"amount" integer NOT NULL,
	"type" TEXT NOT NULL,
	"time" TIMESTAMP NOT NULL,
	"description" TEXT,
	"cancelled" serial,
	CONSTRAINT "transactions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.creditCards" (
	"id" serial NOT NULL,
	"bankAccountId" integer NOT NULL,
	"name" TEXT NOT NULL,
	"number" integer NOT NULL,
	"securityCode" integer NOT NULL,
	"expirationMonth" int2 NOT NULL,
	"expirationYear" int4 NOT NULL,
	"password" TEXT NOT NULL,
	"limit" integer,
	CONSTRAINT "creditCards_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");


ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");









