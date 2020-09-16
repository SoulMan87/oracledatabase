create or replace package AUDIENCIA_tapi
is

type AUDIENCIA_tapi_rec is record (
HORA  AUDIENCIA.HORA%type
,FECHA  AUDIENCIA.FECHA%type
,IDAUDIENCIA  AUDIENCIA.IDAUDIENCIA%type
,LUGAR  AUDIENCIA.LUGAR%type
);
type AUDIENCIA_tapi_tab is table of AUDIENCIA_tapi_rec;

-- insert
procedure ins (
p_HORA in AUDIENCIA.HORA%type
,p_FECHA in AUDIENCIA.FECHA%type
,p_IDAUDIENCIA in AUDIENCIA.IDAUDIENCIA%type
,p_LUGAR in AUDIENCIA.LUGAR%type
);
-- update
procedure upd (
p_HORA in AUDIENCIA.HORA%type
,p_FECHA in AUDIENCIA.FECHA%type
,p_IDAUDIENCIA in AUDIENCIA.IDAUDIENCIA%type
,p_LUGAR in AUDIENCIA.LUGAR%type
);
-- delete
procedure del (
p_IDAUDIENCIA in AUDIENCIA.IDAUDIENCIA%type
);
end AUDIENCIA_tapi;

/
create or replace package body AUDIENCIA_tapi
is
-- insert
procedure ins (
p_HORA in AUDIENCIA.HORA%type
,p_FECHA in AUDIENCIA.FECHA%type
,p_IDAUDIENCIA in AUDIENCIA.IDAUDIENCIA%type
,p_LUGAR in AUDIENCIA.LUGAR%type
) is
begin
insert into AUDIENCIA(
HORA
,FECHA
,IDAUDIENCIA
,LUGAR
) values (
p_HORA
,p_FECHA
,p_IDAUDIENCIA
,p_LUGAR
);end;
-- update
procedure upd (
p_HORA in AUDIENCIA.HORA%type
,p_FECHA in AUDIENCIA.FECHA%type
,p_IDAUDIENCIA in AUDIENCIA.IDAUDIENCIA%type
,p_LUGAR in AUDIENCIA.LUGAR%type
) is
begin
update AUDIENCIA set
HORA = p_HORA
,FECHA = p_FECHA
,LUGAR = p_LUGAR
where IDAUDIENCIA = p_IDAUDIENCIA;
end;
-- del
procedure del (
p_IDAUDIENCIA in AUDIENCIA.IDAUDIENCIA%type
) is
begin
delete from AUDIENCIA
where IDAUDIENCIA = p_IDAUDIENCIA;
end;
end AUDIENCIA_tapi;
