ALTER TABLE public.todos ADD COLUMN due_date date;

CREATE INDEX idx_todos_user_id ON public.todos (user_id);
