
SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE FUNCTION outParamFunction(A IN money.id%TYPE, B OUT money.id%TYPE)
RETURN NUMBER
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE('printing A: '|| A);
	B:=10;
	return A+20; 
END outParamFunction;
/



DECLARE
	NUM NUMBER;
	NUM2 NUMBER;
BEGIN
	NUM:=outParamFunction(5,NUM2);
	DBMS_OUTPUT.PUT_LINE('printing num: '|| NUM);
	DBMS_OUTPUT.PUT_LINE('printing num2: '|| NUM2);
END;
/



DECLARE 
   a number; 
   PROCEDURE squareNum(x IN OUT number) IS 
BEGIN 
  x := x * x; 
END;  
BEGIN 
   a:= 23; 
   squareNum(a); 
   dbms_output.put_line(' Square of (23): ' || a); 
END; 
/


clear screen;

drop table money;
	
create table money(id number, name varchar2(20), taka number);

insert into money values(1,'A',100);
insert into money values(2,'B',110);
insert into money values(3,'C',120);


commit;
select * from money;


/*
Declare three variables ( Say, A, B, C ) with the data type of
‘taka’ attribute of ‘money’ table.
› Take input the values of A & B from user.
› In the BEGIN section, Sum A & B ( C := A+B )
› If C is less than 170, then insert a new row in ‘money’ table with
id = 7, name = ‘A’ and taka = C+10
› If C is in between 170 and 210, then insert a new row in ‘money’
table with id = 7, name = ‘B’ and taka = C+30
› Otherwise, insert a new row in ‘money’ table with id = 7, name
= ‘C’ and taka = C

*/

DECLARE
	A MONEY.taka%type;
	B MONEY.taka%type;
	C MONEY.taka%type;
	D MONEY.taka%type;
	E MONEY.taka%type;
	
BEGIN
	A := &x;
	B :=&y;
	
	C := A+B;
	D := C+10;
	E := C+30
	
	if (C<170) Then
		insert into money values (7,'A',D);
    ELSIF (c>= 170 and c<=210) Then
		insert into money values (7,'A',E);
	else 
	    INSERT into money values(7,'A',c);
    
    end if;
 
 
END
/
	

/*	
ACCEPT X NUMBER PROMPT "enter a random number = "

DECLARE
	NUM number;
BEGIN
	NUM := &X;
	inOutUserInput(NUM);
	--DBMS_OUTPUT.PUT_LINE(NUM);
END;
/	
*/

CREATE OR REPLACE TRIGGER HELLO6 
BEFORE UPDATE 
OF TAKA
ON MONEY
FOR EACH ROW


DECLARE
	A money.id%TYPE;
	B money.name%TYPE;
	C money.taka%TYPE;
BEGIN
	A := :OLD.ID;
	B := :OLD.NAME;
	C := :OLD.TAKA;
	INSERT INTO MONEY VALUES(9, 'S', 1900);
	DBMS_OUTPUT.PUT_LINE('Row successfully inserted');
END;
/
UPDATE MONEY SET TAKA=2000 WHERE ID=1
