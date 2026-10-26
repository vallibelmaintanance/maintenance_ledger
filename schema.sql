-- Maintenance Ledger: database schema for Supabase (Postgres).
-- Run this once in Supabase: SQL Editor > New query > paste > Run.

-- One table per record type. Each row holds one record as JSON in "data".
create table if not exists public.settings   (id text primary key default gen_random_uuid()::text, data jsonb not null, created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table if not exists public.schedule   (id text primary key default gen_random_uuid()::text, data jsonb not null, created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table if not exists public.amc        (id text primary key default gen_random_uuid()::text, data jsonb not null, created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table if not exists public.breakdowns (id text primary key default gen_random_uuid()::text, data jsonb not null, created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table if not exists public.jobs       (id text primary key default gen_random_uuid()::text, data jsonb not null, created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table if not exists public.expenses   (id text primary key default gen_random_uuid()::text, data jsonb not null, created_at timestamptz not null default now(), updated_at timestamptz not null default now());

-- Security: only signed-in users can read or write. Nobody else can touch the data.
do $$
declare t text;
begin
  foreach t in array array['settings','schedule','amc','breakdowns','jobs','expenses'] loop
    execute format('alter table public.%I enable row level security', t);
    execute format('drop policy if exists "signed in users only" on public.%I', t);
    execute format('create policy "signed in users only" on public.%I for all to authenticated using (true) with check (true)', t);
  end loop;
end $$;

-- Live updates between devices (safe to ignore if it reports "already member").
do $$
declare t text;
begin
  foreach t in array array['settings','schedule','amc','breakdowns','jobs','expenses'] loop
    begin
      execute format('alter publication supabase_realtime add table public.%I', t);
    exception when others then null;
    end;
  end loop;
end $$;
