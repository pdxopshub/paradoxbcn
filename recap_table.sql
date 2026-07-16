-- PDX Ops Hub — tabla RECAP (cierre diario)
-- Ejecuta en Supabase SQL Editor

CREATE TABLE IF NOT EXISTS recap (
  id                bigint generated always as identity primary key,
  fecha             date not null unique,
  visitantes        int,
  e_box_office      int,
  e_fever           int,
  e_api             int,
  e_grupos          int,
  boutique          jsonb default '{}',
  horas_planday     numeric(6,2),
  ta_reviews        int,
  rutinas           jsonb default '[]',   -- array de IDs de rutinas marcadas como Sí
  tasks_done        jsonb default '[]',   -- array de IDs de tasks marcados como hechos
  lluvia            boolean default false,
  observaciones     text default '',
  cerrado_por       text default '',
  created_at        timestamptz default now(),
  updated_at        timestamptz default now()
);

-- Seguridad: solo usuarios autenticados
alter table recap enable row level security;
create policy "allow all for authenticated" on recap
  for all using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');
