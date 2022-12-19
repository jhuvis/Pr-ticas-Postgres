CREATE TABLE "public.usuarios" (
	id serial PRIMARY KEY,
	"nome" varchar(50) NOT NULL,
	"email" TEXT NOT NULL,
	"senha" TEXT NOT NULL
);



CREATE TABLE "public.produtos" (
	"id" serial PRIMARY KEY,
	"nome" varchar(50) NOT NULL,
	"preco" integer NOT NULL,
	"foto" TEXT,
	"quantidade" integer NOT NULL
);



CREATE TABLE "public.roupas" (
	"id" serial PRIMARY KEY,
	"categoria" varchar(50) NOT NULL,
	"tamanho" char NOT NULL,
	"idProdutos" integer NOT NULL REFERENCES "public.produtos"("id")
);



CREATE TABLE "public.compras" (
	"id" serial PRIMARY KEY,
	"idUsuario" integer REFERENCES "public.usuarios"("id"),
	"quantidade" integer NOT NULL,
	"idProduto" integer NOT NULL REFERENCES "public.produtos"("id"),
	"status" TEXT NOT NULL,
	"dataCompra" DATE NOT NULL,
	"endereco" TEXT NOT NULL
);






