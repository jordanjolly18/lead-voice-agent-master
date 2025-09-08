
-- Enable pgcrypto for UUIDs (if not enabled)
create extension if not exists pgcrypto;

create table if not exists leads (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  phone text not null,
  email text not null,
  source text,
  created_at timestamptz default now()
);

create table if not exists call_attempts (
  id uuid primary key default gen_random_uuid(),
  lead_id uuid references leads(id) on delete cascade,
  twilio_call_sid text,
  status text,
  duration integer,
  recording_url text,
  transcript text,
  created_at timestamptz default now()
);

create table if not exists qualifications (
  lead_id uuid primary key references leads(id) on delete cascade,
  has_land boolean,
  timeline_bucket text,
  budget_bucket text,
  council text,
  notes text,
  created_at timestamptz default now()
);
