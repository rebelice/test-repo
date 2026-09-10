ALTER TABLE public.todos ADD COLUMN priority smallint NOT NULL DEFAULT 0;

CREATE INDEX idx_todos_is_done ON public.todos (is_done);

COMMENT ON COLUMN public.todos.priority IS '0 = normal, higher is more urgent';
