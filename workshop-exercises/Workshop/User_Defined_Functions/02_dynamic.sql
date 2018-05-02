create or replace function row_count(p_schemaname text) returns text  as
$$
declare
v_tables record;
v_name text;
v_count integer;
v_test text;
begin
  v_name='';
  for v_tables in SELECT * from pg_stat_user_tables where schemaname = p_schemaname LOOP
     execute 'select count(*) from '|| v_tables.relname into v_count;
     v_name = v_name || ' ' ||v_tables.relname || ' ' || v_count||E'\n';
  END LOOP;
  RETURN v_name;
end;
$$
language plpgsql stable ;

drop schema if exists demo;
create schema demo;
create table demo.airlines as select * from faa.d_airlines;
create table demo.airports as select * from faa.d_airports;
set search_path=demo,faa;
select row_count('demo');
drop table demo.airlines;
drop table demo.airports;
drop schema demo;
