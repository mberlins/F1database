CREATE OR REPLACE PROCEDURE GENERUJ_DRUZYNA IS 
TYPE TABSTR IS TABLE OF VARCHAR2(250);
TYPE TABSTR2 IS TABLE OF VARCHAR2(250);
	id_druzyny NUMBER(2);
    nazwa TABSTR;
    kraj TABSTR2;
    qname NUMBER(2);
BEGIN
nazwa := TABSTR('Alfa Romeo Racing', 'Renault F1 Team', ' McLaren F1 Team', 'Scuderia Ferrari', 'Haas F1 Team',
'Red Bull Toro Rosso Honda', 'Aston Martin Red Bull Racing', 'SportPesa Racing Point F1 Team', 'Mercedes-AMG Petronas Motorsport', 'ROKiT Williams Racing');
qname := nazwa.count;
kraj := TABSTR2('Wlochy', 'Francja', 'Anglia', 'Wlochy', 'USA', 'Wlochy', 'Austria', 'Hiszpania', 'Niemcy', 'Anglia');

	FOR i IN 1..qname LOOP
		id_druzyny := i;
		INSERT INTO druzyna VALUES (id_druzyny, nazwa(i), kraj(i), 0, 0);
	END LOOP;
	DBMS_OUTPUT.put_line('Dodano wszystkie druzyny.');
    
END GENERUJ_DRUZYNA;


CREATE OR REPLACE PROCEDURE GENERUJ_GRAND_PRIX IS 
TYPE TABSTR IS TABLE OF VARCHAR2(250);
TYPE TABSTR2 IS TABLE OF VARCHAR2(250);
TYPE TABSTR3 IS TABLE OF VARCHAR2(250);
    id_grand_prix NUMBER(2);
    termin TABSTR3;
    lokalizacja TABSTR;
    tor TABSTR2;
    qname NUMBER(2);
BEGIN   
lokalizacja := TABSTR('Australia', 'Chiny', 'Azerbejdzan', 'Hiszpania', 'Monako', 'Kanada', 'Francja', 'Austra', 'Anglia', 'Niemcy', 'Wegry', 'Belgia', 'Wlochy', 'Singapur', 'Rosja', 'Japonia',
'Meksyk', 'USA', 'Brazylia');
qname := lokalizacja.count;
tor := TABSTR2('Albert Park Circuit','Shanghai International Circuit', 'Baku City Circuit', ' Circuit de Catalunya', 'Circuit de Monaco', 'Circuit Gilles Villeneuve', 'Circuit Paul Ricard', 
'Red Bull Ring', 'Silverstone Circuit', 'Hockenheimring', 'Hungaroring', 'Circuit de Spa-Francorchamps', 'Autodromo Nazionale di Monza', 'Marina Bay Street Circuit', 'Sochi Autodrom', 
'Suzuka', 'Autódromo Hermanos Rodríguez', 'Circuit of the Americas', 'Autódromo José Carlos Pace');
termin := TABSTR3('17.03.19', '14.04.19', '28.04.19', '12.05.19', '26.05.19', '09.06.19', '23.06.19', '30.06.19', '14.07.19', '28.07.19', '04.08.19', '01.09.19', '08.09.19', '22.09.19', 
'29.09.19', '13.10.19', '27.10.19', '03.11.19', '17.11.19');

    FOR i IN 1..qname LOOP
        id_grand_prix := i;
        INSERT INTO grand_prix VALUES (id_grand_prix, termin(i), lokalizacja(i), tor(i) );
    END LOOP;
    DBMS_OUTPUT.put_line('Dodano wszystkie Grand Prix.');
    
END GENERUJ_GRAND_PRIX;


CREATE OR REPLACE PROCEDURE GENERUJ_SAMOCHOD IS 
TYPE TABSTR IS TABLE OF VARCHAR2(250);
TYPE TABSTR2 IS TABLE OF VARCHAR2(250);
    nr_druzyny NUMBER(2);
    nr_samochodu NUMBER(2);
    silnik TABSTR2;
    typ TABSTR;
    qname NUMBER(2);
BEGIN
typ := TABSTR('C38', 'R.S.19', 'MCL34', 'SF90', 'VF19', 'STR14', 'RB15', 'RP19', 'F1W10EQ', 'FW42');
qname := typ.count;
silnik := TABSTR2('970', '930', '880', '990', '890', '860', '930', '850', '960', '900');

    FOR i IN 1..qname LOOP
        nr_samochodu := i;
        nr_druzyny := i;
        INSERT INTO samochod VALUES(nr_samochodu, nr_druzyny, typ(i), silnik(i));
    END LOOP;
    DBMS_OUTPUT.put_line('Dodano wszystkie samochody.');
    
END GENERUJ_SAMOCHOD;


CREATE OR REPLACE PROCEDURE GENERUJ_SPONSORA IS 
TYPE TABSTR IS TABLE OF VARCHAR2(250);
--TYPE TABSTR2 IS TABLE OF INTEGER;
    nr_druzyny NUMBER(2);
    nr_sponsora NUMBER(2);
    nazwa_sponsora TABSTR;
    dotacja NUMBER(6);
    qname NUMBER(2);
BEGIN
nazwa_sponsora := TABSTR('UGI', 'AES', 'Telephone & Data Systems', 'Paccar', 'Philip Morris International', 'Avon Products', 'Parker Hannifin', 'Freeport-McMoRan Copper & Gold', 
'Great Atlantic & Pacific Tea', 'General Motors', 'Staples', 'UnitedHealth Group', 'MetLife', 'National Oilwell Varco', 'NCR', 'Safeway', 'KBR', 'TravelCenters of America', 'Tesoro', 
'Goodyear Tire & Rubber', 'Bemis', 'Time Warner Cable', 'HCA Holdings', 'J.M. Smucker', 'Owens & Minor', 'Owens-Illinois', 'Qwest Communications', 
'Automatic Data Processing', 'Calpine', 'PNC Financial Services Group', 'J.P. Morgan Chase & Co.', 'NextEra Energy', 'Delta Air Lines', 'Avnet', 'First Data', 'Western Union', 
'Chesapeake Energy', 'Best Buy', 'PG&E Corp.', 'Sonic Automotive', 'Qualcomm', 'International Business Machines', 'Universal Health Services', 'Ameren', 'General Electric', 'Texas Instruments', 
'NII Holdings', 'Merck', 'Travelers Cos.', 'Community Health Systems', 'Entergy', 'WellPoint', 'Phillips-Van Heusen', 'Whole Foods Market', 'Autoliv', 'Thermo Fisher Scientific', 'Avery Dennison', 
'Dr Pepper Snapple Group', 'Plains All American Pipeline', 'Aramark', 'Universal American', 'Virgin Media', 'Loews', 'Union Pacific', 'McGraw-Hill', 'Dover', 'Amazon.com', 
'Reinsurance Group of America', 'Mattel', 'ITT', 'Comcast', 'Nike', 'General Cable', 'Enterprise Products Partners', 'Office Depot', 'Dollar General', 'Apple');
qname := nazwa_sponsora.count;

    FOR i IN 1..qname LOOP
        nr_sponsora := i;
        nr_druzyny := mod(i,10)+1;
        dotacja := dbms_random.value(100000,900000);
        INSERT INTO sponsor VALUES (nr_sponsora, nr_druzyny, nazwa_sponsora(i), dotacja);
    END LOOP;
    DBMS_OUTPUT.put_line('Dodano wszystkich sponsorów.');
        
END GENERUJ_SPONSORA;


CREATE OR REPLACE PROCEDURE GENERUJ_KIEROWCE IS 
TYPE TABSTR IS TABLE OF VARCHAR2(250);
    nr_kierowcy NUMBER(2);
    nr_druzyny NUMBER(2);
    imie TABSTR;
    nazwisko TABSTR;
    wiek NUMBER(2);
    bolid NUMBER(2);
    kraj TABSTR;
    qname NUMBER(2);
BEGIN
imie := TABSTR('Kimi', 'Antonio', 'Daniel', 'Nico', 'Lando', 'Carlos', 'Sebastian', 'Charles', 'Romain', 'Kevin', 'Pierre', 'Danil',
'Alexander', 'Max', 'Sergio', 'Lance', 'Lewis', 'Valteri', 'George', 'Robert');
nazwisko := TABSTR('Raikkonen', 'Giovinazzi', 'Ricciardo', 'Hulkenberg', 'Norris', 'Sainz', 'Vettel', 'Leclerc', 'Grosjean', 'Magnussen',
'Gasly', 'Kvyat', 'Albon', 'Verstappen', 'Perez', 'Stroll', 'Hamilton', 'Bottas', 'Russell', 'Kubica');
kraj := TABSTR('Finlandia', 'Wlochy', 'Australia', 'Niemcy', 'Anglia', 'Hiszpania', 'Niemcy', 'Monako', 'Francja', 'Dania', 'Francja',
'Rosja', 'Tajlandia', 'Austria', 'Meksyk', 'Kanada', 'Anglia', 'Finlandia', 'Anglia', 'Polska');
qname := imie.count;

    FOR i IN 1..qname LOOP
        nr_kierowcy := i;
        nr_druzyny := i/2;
        wiek := dbms_random.value(18,40);
        bolid := dbms_random.value(1,99);
        INSERT INTO kierowca VALUES (nr_kierowcy, imie(i), nazwisko(i), nr_druzyny, bolid, wiek, kraj(i), 0);
    END LOOP;
    
END GENERUJ_KIEROWCE;
    
    
CREATE OR REPLACE PROCEDURE GENERUJ_ZDARZENIE IS       
    nr_kierowcy NUMBER(2);
    nr_grand_prix NUMBER(2);
    punkty NUMBER(2);
BEGIN

    FOR i IN 1..20 LOOP
        FOR j IN 1..19 LOOP
            nr_kierowcy := i;
            nr_grand_prix := j;
            punkty := dbms_random.value(1,20);
            INSERT INTO zdarzenie VALUES (nr_grand_prix, nr_kierowcy, punkty);
        END LOOP;
    END LOOP;

END GENERUJ_ZDARZENIE;
        








