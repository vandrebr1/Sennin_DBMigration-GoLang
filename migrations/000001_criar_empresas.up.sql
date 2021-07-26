CREATE TABLE IF NOT EXISTS public.empresas
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    razaosocial character varying(255) COLLATE pg_catalog."default" NOT NULL,
    nomefantasia character varying(255) COLLATE pg_catalog."default" NOT NULL,
    cnpjcpf character varying(14) COLLATE pg_catalog."default" NOT NULL,
    juridicafisica boolean NOT NULL DEFAULT false,
    dtcadastro timestamp without time zone NOT NULL DEFAULT now(),
    dtmodificado timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT empresas_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.empresas
    OWNER to postgres;