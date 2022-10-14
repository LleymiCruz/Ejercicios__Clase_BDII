--PROCEDIMIENTOS PARA INSERTS UPDATE 
CREATE OR REPLACE PROCEDURE PR1
IS 
    X NUMBER:=10;
BEGIN
    DBMS_OUTPUT.PUT_LINE(X);
END;
/
SET SERVEROUTPUT ON
BEGIN
 PR1;
END;
/
--LISTAR LOS PROCEDIMIENTOS
SELECT *FROM USER_OBJECTS WHERE OBJECT_TYPE='PROCEDURE';
--VER EL CODIGO DEL PROCEDIMIENTO
SELECT *FROM USER_SOURCE WHERE NAME='PR1';
-----------------------------------
/
--PARAMETROS DE ENTRADA Y SALIDA
CREATE OR REPLACE PROCEDURE CAL_TAX
(EMPL IN EMPLOYEES.EMPLOYEE_ID%TYPE, T1 IN NUMBER, R1 OUT NUMBER)
IS 
    TAX NUMBER:=0;
    SAL EMPLOYEES.SALARY%TYPE:=0;
BEGIN 
    SELECT SALARY INTO SAL FROM EMPLOYEES WHERE EMPLOYEE_ID=EMPL;
    R1:=SAL*T1/100;
    DBMS_OUTPUT.PUT_LINE('SALARY' || SAL);
    DBMS_OUTPUT.PUT_LINE('IMPUESTO R1' || R1);
EXCEPTION
WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('DATOS NO ENCONTRADOS');
END;
/

SET SERVEROUTPUT ON
DECLARE 
A NUMBER:=120;
B NUMBER:=5;
R NUMBER:=0;--CUANDO ES DE SALIDA VA EN 0 
BEGIN
    DBMS_OUTPUT.PUT_LINE('R' || R);
    CAL_TAX(A,B,R);
    DBMS_OUTPUT.PUT_LINE('R' || R);
END;
/

--PARAMETROS DE ENTRADA Y SALIDA
CREATE OR REPLACE PROCEDURE CAL_TAX
(EMPL IN EMPLOYEES.EMPLOYEE_ID%TYPE, T1 IN OUT NUMBER)
IS 
    TAX NUMBER:=0;
    SAL EMPLOYEES.SALARY%TYPE:=0;
BEGIN 
    SELECT SALARY INTO SAL FROM EMPLOYEES WHERE EMPLOYEE_ID=EMPL;
    T1:=SAL*T1/100;
    DBMS_OUTPUT.PUT_LINE('SALARY: ' || SAL);
    DBMS_OUTPUT.PUT_LINE('IMPUESTO T1: ' || T1);
EXCEPTION
WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('DATOS NO ENCONTRADOS');
END;
/

SET SERVEROUTPUT ON
DECLARE 
A NUMBER:=120;
B NUMBER:=5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('B: ' || B);
    CAL_TAX(A,B);
    DBMS_OUTPUT.PUT_LINE('B: ' || B);
END;
/
--PROCEDIMIENTO CON CURSOR
CREATE OR REPLACE PROCEDURE VISUALIZAR
IS 
    CURSOR C1 IS SELECT FIRST_NAME, SALARY FROM EMPLOYEES;
BEGIN
    FOR i IN C1 LOOP
    DBMS_OUTPUT.PUT_LINE(i.FIRST_NAME ||' ' ||  i.SALARY);
    END LOOP;
END;
/
-- VISTA RAPIDA
EXECUTE VISUALIZAR;

