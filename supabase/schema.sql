-- Run this once in your Supabase project: SQL Editor -> New query -> paste -> Run.
-- One row per account holding that person's check marks and calculator picks.

create table if not exists public.progress (
  user_id    uuid primary key references auth.users (id) on delete cascade,
  checked    text[] not null default '{}',
  picked     text[] not null default '{}',
  updated_at timestamptz not null default now()
);

-- Row level security: each signed-in person can only read and write their own row.
alter table public.progress enable row level security;

create policy "Read own progress" on public.progress
  for select to authenticated using (auth.uid() = user_id);

create policy "Insert own progress" on public.progress
  for insert to authenticated with check (auth.uid() = user_id);

create policy "Update own progress" on public.progress
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
