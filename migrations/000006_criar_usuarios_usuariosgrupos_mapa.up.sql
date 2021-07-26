CREATE TABLE IF NOT EXISTS public.usuarios_usuariosgrupos_mapa
(
    usuario_id integer NOT NULL,
    usuariogrupo_id integer NOT NULL,
    CONSTRAINT usuariogrupomapa_usuario FOREIGN KEY (usuario_id)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT usuariogrupomapa_usuariogrupo FOREIGN KEY (usuario_id)
        REFERENCES public.usuariosgrupos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.usuarios_usuariosgrupos_mapa
    OWNER to postgres;