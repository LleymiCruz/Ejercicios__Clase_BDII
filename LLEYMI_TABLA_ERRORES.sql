CREATE TABLE ERROR
(
    codigo number
        constraint errors_code_nn not null,
    mensaje varchar2(256)

);
SET SERVEROUTPUT ON
DECLARE 
empl employees%rowtype;
CODE NUMBER;
MESSAGE VARCHAR2(256);
begin
select*into empl from employees;
DBMS_OUTPUT.PUT_LINE(empl.first_name);

exception
when others then
DBMS_OUTPUT.PUT_LINE(sqlcode);
DBMS_OUTPUT.PUT_LINE(sqlerrm);
CODE:=SQLCODE;
MESSAGE:=SQLERRM;
INSERT INTO ERROR VALUES (CODE, MESSAGE);
end;
/
--FALTA UNO