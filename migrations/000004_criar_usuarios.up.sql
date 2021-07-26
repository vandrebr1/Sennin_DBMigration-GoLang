CREATE TABLE IF NOT EXISTS public.usuarios
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    login character varying(20) COLLATE pg_catalog."default" NOT NULL,
    email character varying(180) COLLATE pg_catalog."default" NOT NULL,
    nome character varying(90) COLLATE pg_catalog."default" NOT NULL,
    senha character varying(72) COLLATE pg_catalog."default" NOT NULL,
    dtcadastro timestamp without time zone NOT NULL DEFAULT now(),
    dtmodificado timestamp without time zone NOT NULL DEFAULT now(),
    cadastradopor_id integer NOT NULL,
    modificadopor_id integer NOT NULL,
    bloqueado boolean NOT NULL,
    resetarsenha boolean NOT NULL,
    CONSTRAINT usuarios_pkey PRIMARY KEY (id),
    CONSTRAINT usuario_criadopor FOREIGN KEY (cadastradopor_id)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT usuario_modificadopor FOREIGN KEY (modificadopor_id)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.usuarios
    OWNER to postgres;