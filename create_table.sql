drop table kierowca cascade constraints;
drop table zdarzenie cascade constraints;
drop table druzyna cascade constraints;
drop table grand_prix cascade constraints;
drop table sponsor cascade constraints;
drop table samochod cascade constraints;


create table druzyna
(
id_druzyny int primary key NOT NULL CHECK (id_druzyny > 0 AND id_druzyny < 19),
nazwa varchar(50) NOT NULL UNIQUE,   
kraj varchar(50) NOT NULL,
budzet int default 0 NOT NULL, 
punkty int default 0 NOT NULL
);

create table samochod
(
id_samochodu int primary key NOT NULL,
id_druzyny int NOT NULL,
nazwa varchar(50) NOT NULL,
moc varchar(50) NOT NULL,
constraint fk_druzyna_1
FOREIGN KEY (id_druzyny)
REFERENCES druzyna(id_druzyny)
);

create table kierowca
(
id_kierowcy int primary key NOT NULL,
imie varchar(50) NOT NULL,
nazwisko varchar(50) NOT NULL,
id_druzyny int,
numer_bolidu int CHECK (numer_bolidu > 0 AND numer_bolidu < 100),
wiek int CHECK (wiek > 15),
narodowosc varchar(50) NOT NULL,
punkty int default 0,
constraint fk_druzyna_2
FOREIGN KEY (id_druzyny)
REFERENCES druzyna(id_druzyny)
);

create table grand_prix
(
nr_grand_prix int primary key NOT NULL CHECK (nr_grand_prix > 0 AND nr_grand_prix < 20),
data_grand_prix date NOT NULL,
kraj varchar(50) NOT NULL,
tor varchar(50) NOT NULL
);

create table zdarzenie
(
nr_grand_prix int NOT NULL,
id_kierowcy int NOT NULL,
punkty int NOT NULL,
constraint pk_zdarzenie 
primary key (id_kierowcy, nr_grand_prix),
constraint fk_grand_prix_1
FOREIGN KEY (nr_grand_prix)
REFERENCES grand_prix(nr_grand_prix),
constraint fk_kierowca_1
FOREIGN KEY (id_kierowcy)
REFERENCES kierowca(id_kierowcy)
);



create table sponsor
(
id_sponsora int primary key NOT NULL,
id_druzyny int NOT NULL,
nazwa varchar(50),
wklad int NOT NULL,
constraint fk_druzyna_3
FOREIGN KEY (id_druzyny)
REFERENCES druzyna(id_druzyny)
);
