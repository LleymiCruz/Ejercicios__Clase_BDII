--EXCEPCIONES O ERRORES
SET SERVEROUTPUT ON
DECLARE 
MI_EXCEP EXCEPTION;
PRAGMA EXCEPTION_INIT(MI_EXCEP, -937);

v1 NUMBER;
v2 NUMBER;
begin
SELECT EMPLOYEE_ID,SUM(SALARY) INTO v1,v2 FROM EMPLOYEES;

EXCEPTION 
WHEN MI_EXCEP THEN
DBMS_OUTPUT.PUT_LINE('FUNCION INCORRECTA');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR INESPERADO');
END;
/
SET SERVEROUTPUT ON
DECLARE 
empl employees%rowtype;
begin
select * into empl from employees where employee_id>1;
DBMS_OUTPUT.PUT_LINE(EMPL.FIRST_NAME);
EXCEPTION
WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE(EMPL.FIRST_NAME);
WHEN too_many_rows THEN
    DBMS_OUTPUT.PUT_LINE('mas de una fila');
end;
/
DECLARE
   reg_max EXCEPTION;
   regn NUMBER;
   regt varchar2(200);
BEGIN
   regn:=101;
   regt:='ASIA';
   IF regn > 100 THEN
         RAISE reg_max;  
    ELSE
       insert into regions values (regn,regt);
       commit;
      END IF;
EXCEPTION
  WHEN reg_max THEN  
    DBMS_OUTPUT.PUT_LINE('La region no puede ser mayor de 100.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error indefinido');
END;
/

DECLARE   
   regn NUMBER;
   regt varchar2(200);
BEGIN
   regn:=101;
   regt:='ASIA';
   iF regn > 100 THEN
       -- EL CODIGO DEBE ESTAR ENTRE -20000 Y -20999
       RAISE_APPLICATION_ERROR(-20001,'LA ID NO PUEDE SER MAYOR DE 100');  
    ELSE
       insert into regions values (regn,regt);
       commit;
    END IF;
END;
