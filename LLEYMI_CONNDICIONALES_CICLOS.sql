SET SERVEROUTPUT ON;
DECLARE 
name varchar2(50);
lastname varchar2(50);

A number;
B number;
resultado number;
B1 Boolean;

BEGIN
name:='Lleymi';
lastname:='Cruz';

dbms_output.put_line(name || ' ' || lastname);
A:=20;
B:=30;
RESULTADO:=A*B;
dbms_output.put_line(resultado);

B1:=true;
B1:=false;

END;

----------------------------------------
SET SERVEROUTPUT ON;
DECLARE 
X number;
Z X%TYPE :=20;--mismo tipo de dato  que X
E EMPLOYEES.SALARY%TYPE;

hoy DATE:=SYSDATE;

BEGIN
E:=220;
dbms_output.put_line(Z);
dbms_output.put_line(E);
dbms_output.put_line(hoy);
END;

--------------------------------------
SET SERVEROUTPUT ON;
DECLARE 
x varchar2(100);
mayuscula varchar2(100);
z number :=109.80;
BEGIN
mayuscula:=UPPER('esto es una frase minuscula');
dbms_output.put_line(mayuscula);

x:='Ejemplo';
dbms_output.put_line(SUBSTR(X,1,3));
dbms_output.put_line(FLOOR(z));

END;
---------------------------------------------
SET SERVEROUTPUT ON;
DECLARE 
    x number:=60;
    z number :=40;
BEGIN
    DECLARE
    x number:=30;
    y number :=10;
    BEGIN
    dbms_output.put_line(x);
     dbms_output.put_line(z);
    END;
    dbms_output.put_line(x);
END;
---------------------------------------------

SET SERVEROUTPUT ON;
--conndiciones
DECLARE 
x number :=60;
BEGIN
    IF 
        x=10
    THEN
    dbms_output.put_line(x);
    ELSE
     dbms_output.put_line('no cumple la condición');
     END IF;
END;

-------------------------------------------------------
SET SERVEROUTPUT ON;
--conndiciones
DECLARE 
ventas number :=25000;
bono number :=0;
BEGIN
    IF 
        ventas>5000
    THEN
        bono:=1500;
    ELSIF ventas<=3500 AND ventas>=2000  THEN
         bono:=500;
    ELSE 
     bono:=100;
    END IF;
END;

---------------------------------------------
SET SERVEROUTPUT ON;
--conndiciones
DECLARE 
 v1 char(1);
BEGIN
   v1:='B';
   
   CASE v1
       WHEN 'A' THEN  dbms_output.put_line('Excelente');
       WHEN 'B' THEN  dbms_output.put_line('Muy bueno');
       ELSE dbms_output.put_line('Reprobado');
   END CASE;
END;
----------------------------------------------------
SET SERVEROUTPUT ON;
--ciclos
DECLARE 
X number:=1;
BEGIN
    LOOP
        dbms_output.put_line(X);
        X:=X+1;
        EXIT WHEN X=11;
    END LOOP;
END;

------------------------------------
SET SERVEROUTPUT ON;
--ciclos
DECLARE 
s PLS_INTEGER :=0;
i PLS_INTEGER :=0;
j PLS_INTEGER;
BEGIN
<<Padre>>--etiqueta
    LOOP
         i:=i+1;
         j:=100;
        dbms_output.put_line('PADRE' || i);
       
       <<Hijo>>
       LOOP 
          dbms_output.put_line('HIJO' || j);
          EXIT Padre WHEN (i>3);
            EXIT Hijo WHEN (j>105);
          END LOOP;   
     END LOOP;
     dbms_output.put_line('Finalizó el programa');
END;
------------------------------------------
SET SERVEROUTPUT ON;
--ciclos
DECLARE 
x number:=0;

BEGIN
    LOOP 
      dbms_output.put_line('x:=' || TO_CHAR(x));
      x:=x+1;
      CONTINUE WHEN x<3;
       dbms_output.put_line('DESPUES DE CONTINUE' || TO_CHAR(x));
       
       EXIT WHEN X=5;
       
    END LOOP;
     dbms_output.put_line('FINALIZÓ');
END;
    
    -------------------------------------
SET SERVEROUTPUT ON;
--ciclos
BEGIN
    FOR i IN 5..15 LOOP
    dbms_output.put_line(i);
    END LOOP;
END;
---------------------------------------
SET SERVEROUTPUT ON;
--ciclos
DECLARE
finalizar BOOLEAN:=false;
x number:=1;
BEGIN
    WHILE x<10 LOOP
    dbms_output.put_line(x);
    x:=x+1;
    EXIT WHEN X=5;
    END LOOP;
END;
---------------------------------------------
