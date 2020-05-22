CREATE OR REPLACE TRIGGER POZYCJA
AFTER INSERT ON ZDARZENIE
FOR EACH ROW
BEGIN
    UPDATE kierowca z set z.punkty = z.punkty + dbms_random.value(0,25) WHERE id_kierowcy = :new.id_kierowcy;
END;

CREATE OR REPLACE TRIGGER WPLYW
AFTER INSERT ON SPONSOR
FOR EACH ROW
BEGIN
    UPDATE druzyna z set z.budzet = z.budzet + dbms_random.value(100000,900000) WHERE id_druzyny = :new.id_druzyny;
END;


DROP TRIGGER PRZYCHOD;
CREATE OR REPLACE TRIGGER PRZYCHOD 
AFTER INSERT ON sponsor
FOR EACH ROW 
DECLARE
temp_wklad NUMBER(6);
BEGIN
    SELECT wklad INTO temp_wklad FROM sponsor WHERE id_druzyny = :new.id_druzyny;
    UPDATE druzyna SET budzet = temp_wklad + budzet WHERE id_druzyny = :new.id_druzyny;
END;

CREATE OR REPLACE TRIGGER POZYCJABIS
AFTER INSERT ON KIEROWCA
FOR EACH ROW
BEGIN
    UPDATE druzyna z set z.punkty = z.punkty + dbms_random.value(100,600) WHERE id_druzyny = :new.id_druzyny;
END;

-- zapytania

select avg(wklad) as sredni_wklad 
from sponsor;

select avg(wiek) as sredni_wiek
from kierowca;

select id_sponsora,id_druzyny, wklad
from sponsor z
where wklad > 
	(select avg(wklad) from sponsor);


SELECT id_sponsora, nazwa, wklad
from sponsor 
order by wklad desc;

SELECT * FROM sponsor
WHERE wklad < 150000
ORDER BY wklad desc;

SELECT * FROM sponsor
WHERE ROWNUM <= 5
ORDER BY wklad desc;
    
SELECT * FROM kierowca
ORDER BY punkty desc;
