create table if not exists public.quotes (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  design_name text not null,
  grams numeric not null default 0,
  hours numeric not null default 0,
  filament_kg_cost numeric not null default 20000,
  electricity_kwh_cost numeric not null default 274,
  consumption_kwh_hour numeric not null default 0.15,
  labor_cost numeric not null default 1500,
  wear_hour_cost numeric not null default 150,
  margin numeric not null default 2.5,
  iva_rate numeric not null default 0.19,
  commission_rate numeric not null default 0.03,
  filament_cost numeric not null default 0,
  electricity_cost numeric not null default 0,
  wear_cost numeric not null default 0,
  base_cost numeric not null default 0,
  price_before_tax numeric not null default 0,
  iva_amount numeric not null default 0,
  commission_amount numeric not null default 0,
  final_price numeric not null default 0
);

alter table public.quotes enable row level security;

drop policy if exists "Allow public read quotes" on public.quotes;
drop policy if exists "Allow public insert quotes" on public.quotes;
drop policy if exists "Allow public update quotes" on public.quotes;
drop policy if exists "Allow public delete quotes" on public.quotes;

create policy "Allow public read quotes" on public.quotes for select to anon using (true);
create policy "Allow public insert quotes" on public.quotes for insert to anon with check (true);
create policy "Allow public update quotes" on public.quotes for update to anon using (true) with check (true);
create policy "Allow public delete quotes" on public.quotes for delete to anon using (true);
