CREATE TABLE IF NOT EXISTS public.produtosgrupos
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    grupo character varying(25) COLLATE pg_catalog."default" NOT NULL,
    dtcadastro timestamp without time zone NOT NULL DEFAULT now(),
    dtmodificado timestamp without time zone NOT NULL DEFAULT now(),
    empresa_id integer NOT NULL,
    cadastrado_por integer NOT NULL,
    modificado_por integer NOT NULL,
    CONSTRAINT produtosgrupos_pkey PRIMARY KEY (id),
    CONSTRAINT produtogrupo_cadastradopor FOREIGN KEY (cadastrado_por)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT produtogrupo_empresa FOREIGN KEY (empresa_id)
        REFERENCES public.empresas (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT produtogrupo_modificadopor FOREIGN KEY (modificado_por)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.produtosgrupos
    OWNER to postgres;