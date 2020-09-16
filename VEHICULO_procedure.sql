create or replace package ZONA_tapi
is

type ZONA_tapi_rec is record (
IDZONA  ZONA.IDZONA%type
,UBICACION  ZONA.UBICACION%type
);
type ZONA_tapi_tab is table of ZONA_tapi_rec;

-- insert
procedure ins (
p_IDZONA in ZONA.IDZONA%type
,p_UBICACION in ZONA.UBICACION%type
);
-- update
procedure upd (
p_IDZONA in ZONA.IDZONA%type
,p_UBICACION in ZONA.UBICACION%type
);
-- delete
procedure del (
p_IDZONA in ZONA.IDZONA%type
);
end ZONA_tapi;

/
create or replace package body ZONA_tapi
is
-- insert
procedure ins (
p_IDZONA in ZONA.IDZONA%type
,p_UBICACION in ZONA.UBICACION%type
) is
begin
insert into ZONA(
IDZONA
,UBICACION
) values (
p_IDZONA
,p_UBICACION
);end;
-- update
procedure upd (
p_IDZONA in ZONA.IDZONA%type
,p_UBICACION in ZONA.UBICACION%type
) is
begin
update ZONA set
UBICACION = p_UBICACION
where IDZONA = p_IDZONA;
end;
-- del
procedure del (
p_IDZONA in ZONA.IDZONA%type
) is
begin
delete from ZONA
where IDZONA = p_IDZONA;
end;
end ZONA_tapi;
