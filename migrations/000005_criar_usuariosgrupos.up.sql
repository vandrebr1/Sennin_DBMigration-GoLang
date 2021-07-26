CREATE TABLE IF NOT EXISTS public.usuariosgrupos
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    grupopai_id integer NOT NULL,
    lft integer NOT NULL,
    rgt integer NOT NULL,
    grupo character varying(25) COLLATE pg_catalog."default" NOT NULL,
    empresa_id integer NOT NULL,
    dtcadastro time without time zone NOT NULL DEFAULT now(),
    dtmodificado time without time zone NOT NULL DEFAULT now(),
    cadastradopor_id integer NOT NULL,
    modificadopor_id integer,
    CONSTRAINT usuariosgrupos_pkey PRIMARY KEY (id),
    CONSTRAINT cadastradopor FOREIGN KEY (cadastradopor_id)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT empresa FOREIGN KEY (empresa_id)
        REFERENCES public.empresas (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT modificadopor FOREIGN KEY (modificadopor_id)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.usuariosgrupos
    OWNER to postgres;