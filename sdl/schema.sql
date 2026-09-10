CREATE TABLE public.todos (
    id bigint GENERATED ALWAYS AS IDENTITY,
    user_id uuid NOT NULL,
    title text NOT NULL,
    is_done boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    due_date date,
    CONSTRAINT pk_todos PRIMARY KEY (id)
);

CREATE INDEX idx_todos_user_id ON public.todos (user_id);
