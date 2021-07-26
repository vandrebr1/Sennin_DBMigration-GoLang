CREATE TABLE IF NOT EXISTS public.produtos
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    produto character varying(50) COLLATE pg_catalog."default" NOT NULL,
    referencia character varying(10) COLLATE pg_catalog."default" NOT NULL,
    codigodebarras character varying(14) COLLATE pg_catalog."default" NOT NULL,
    dtcadastro timestamp without time zone NOT NULL DEFAULT now(),
    dtmodificado timestamp without time zone NOT NULL DEFAULT now(),
    empresa_id integer NOT NULL,
    grupo_id integer NOT NULL,
    cadastradopor_id integer NOT NULL,
    modificadopor_id integer NOT NULL,
    CONSTRAINT produtos_pkey PRIMARY KEY (id),
    CONSTRAINT produto_cadastradopor FOREIGN KEY (cadastradopor_id)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT produto_empresa FOREIGN KEY (empresa_id)
        REFERENCES public.empresas (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT produto_grupo FOREIGN KEY (grupo_id)
        REFERENCES public.produtosgrupos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT produto_modificadopor FOREIGN KEY (id)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.produtos
    OWNER to postgres;