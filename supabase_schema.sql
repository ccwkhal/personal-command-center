-- Run this in Supabase SQL Editor after creating your project.
-- Financial records are scoped to the authenticated Supabase user.
create table if not exists public.transactions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  entry_type text not null check (entry_type in ('income','expense')),
  amount numeric(12,2) not null check (amount > 0),
  category text not null,
  work_type text,
  client_or_project text,
  description text,
  entry_date date not null default current_date,
  created_at timestamptz not null default now()
);

create table if not exists public.work_records (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  work_type text not null,
  project_name text not null,
  earned numeric(12,2) not null default 0 check (earned >= 0),
  cost numeric(12,2) not null default 0 check (cost >= 0),
  status text not null default 'In progress'
    check (status in ('In progress','Completed','On hold')),
  entry_date date not null default current_date,
  created_at timestamptz not null default now()
);

alter table public.transactions enable row level security;
alter table public.work_records enable row level security;

create policy "Users manage their own transactions"
on public.transactions for all
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "Users manage their own work records"
on public.work_records for all
using (auth.uid() = user_id)
with check (auth.uid() = user_id);
