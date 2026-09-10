CREATE TABLE public.todos (
    id bigint GENERATED ALWAYS AS IDENTITY,
    user_id uuid NOT NULL,
    title text NOT NULL,
    is_done boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT pk_todos PRIMARY KEY (id)
);

COMMENT ON TABLE public.todos IS 'Bytebase GitOps happy-path test table on Supabase';
