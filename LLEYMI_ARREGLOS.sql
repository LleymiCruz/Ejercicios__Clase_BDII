SET SERVEROUTPUT ON;
--PL-SQL
DECLARE
salario number;
nombre EMPLOYEES.FIRST_NAME%TYPE;
EMPLEADO EMPLOYEES%ROWTYPE;
BEGIN
SELECT * INTO EMPLEADO FROM EMPLOYEES WHERE EMPLOYEE_ID=100;
 dbms_output.put_line(EMPLEADO.SALARY);
 dbms_output.put_line(EMPLEADO.FIRST_NAME);
 
END;
-----------------------------
SET SERVEROUTPUT ON;
--Arreglos Asociativos
DECLARE
    TYPE empleado IS RECORD
    (
        nombre varchar2(100),
        salario number,
        DATOS employees%rowtype
    );
    
    rowemp empleado;
BEGIN
    SELECT * INTO rowemp.DATOS FROM EMPLOYEES WHERE EMPLOYEE_ID=100;
    rowemp.nombre:=rowemp.DATOS.FIRST_NAME || ' ' || rowemp.DATOS.LAST_NAME;
     rowemp.salario:=rowemp.DATOS.SALARY*0.80;
     
     dbms_output.put_line(rowemp.nombre);
      dbms_output.put_line(rowemp.salario);
END;
----------------------------------------------------
SET SERVEROUTPUT ON;
--Arreglos Asociativos
DECLARE
    TYPE DEPARTAMENTOS IS TABLE OF
    DEPARTMENTS.DEPARTMENT_NAME%TYPE
    INDEX BY PLS_INTEGER;
    
    TYPE EMPLEADO IS TABLE OF EMPLOYEES%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    DEPTS DEPARTAMENTOS;
    EMP EMPLEADO;
BEGIN
    DEPTS(1):='IT';
    DEPTS(2):='RRHH';
    
     dbms_output.put_line(DEPTS(1));
      dbms_output.put_line(DEPTS(2));
      dbms_output.put_line(DEPTS.LAST);
      dbms_output.put_line(DEPTS.FIRST);
    IF DEPTS.EXISTS(3) THEN 
    dbms_output.put_line(DEPTS(3));
    ELSE
    dbms_output.put_line('NO EXISTE');
    END IF;
    
    SELECT *INTO EMP(1) FROM EMPLOYEES WHERE EMPLOYEE_ID=100;
    dbms_output.put_line(EMP(1).EMAIL);
END;
--------------------------------------------------

SET SERVEROUTPUT ON;
--Arreglos Asociativos
--Llenando arreglos con las filas de una tabla
DECLARE
    TYPE DEPARTAMENTOS IS TABLE OF
    DEPARTMENTS%ROWTYPE
    INDEX BY PLS_INTEGER;
    DEPTS DEPARTAMENTOS;
BEGIN
    FOR i IN 1..10 LOOP
        SELECT * INTO DEPTS(i) FROM DEPARTMENTS WHERE DEPARTMENT_ID=i*10;
    END LOOP;
    
    FOR i IN DEPTS.FIRST..DEPTS.LAST LOOP
     dbms_output.put_line(DEPTS(i).DEPARTMENT_NAME);
    END LOOP;
        
END;----------------------------------------
----------------------------------------
CREATE TABLE TEST
(
    ID number 
    constraint test_id_nn NOT NULL,
    CONSTRAINT TEST_ID_PK PRIMARY KEY (ID),
    NAME VARCHAR2(50)
    )
    
    DECLARE
    IDENTIFICADOR TEST.ID%TYPE;
    BEGIN 
    IDENTIFICADOR:=1;
    INSERT INTO TEST(ID, NAME) VALUES (IDENTIFICADOR, 'EJEMPLO');
    COMMIT;--ESTA SEGURO QUE QUIERA GUARDAR
    END;
    SELECT * FROM TEST;
    
-----------------------------------------------------
    DECLARE
    IDENTIFICADOR TEST.ID%TYPE;
    BEGIN
     IDENTIFICADOR:=1;
     UPDATE TEST SET NAME='CAMBIO DE TEXTO' WHERE ID=IDENTIFICADOR;
     COMMIT;
END;
-----------------------------------------------
     DECLARE
    IDENTIFICADOR TEST.ID%TYPE;
    BEGIN
     IDENTIFICADOR:=1;
    DELETE FROM TEST WHERE ID=IDENTIFICADOR;
     COMMIT;
END;