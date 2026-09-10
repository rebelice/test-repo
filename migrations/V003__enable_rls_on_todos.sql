-- Supabase-specific: row level security backed by auth.uid().
ALTER TABLE public.todos ENABLE ROW LEVEL SECURITY;

CREATE POLICY todos_owner_select ON public.todos
    FOR SELECT TO authenticated
    USING (auth.uid() = user_id);

CREATE POLICY todos_owner_insert ON public.todos
    FOR INSERT TO authenticated
    WITH CHECK (auth.uid() = user_id);

GRANT SELECT, INSERT ON public.todos TO authenticated;
