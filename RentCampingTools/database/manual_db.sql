create tablespace sewa_alatcamping DATAFILE 'D:\My Kuliah ITATS\04. Semester 4 ITATS\00.Oracle\sewa_alatcamping.dbf' SIZE 20m;
create user sewa_alatcamping identified by sewa_alatcamping default tablespace sewa_alatcamping quota 20m on coba ;
GRANT ALL PRIVILEGES TO sewa_alatcamping;

SELECT SYS_CONTEXT('USERENV','instance_name') FROM dual;

CREATE TABLE daftar_alat 
(
  id INTEGER NOT NULL,
  no_alat VARCHAR2(30),
  nama VARCHAR2(30),
  jenis VARCHAR2(30),
  status VARCHAR2(30)
);

CREATE TABLE login
(
  login_id INTEGER NOT NULL,
  username VARCHAR(30),
  password VARCHAR(30)
);

CREATE TABLE pelanggan 
(
  id INTEGER NOT NULL ,
  id_pelanggan VARCHAR(30) ,
  nama VARCHAR(30) ,
  alamat VARCHAR(30) ,
  no_tlp NUMBER(15) 
);

CREATE TABLE pengembalian
(
  id int NOT NULL,
  idalat VARCHAR(30),
  idpelanggan VARCHAR(30),
  tgl_kembali DATE,
  lama NUMBER(15),
  denda NUMBER(15) 
);

CREATE TABLE sewa_alat
(
  id int NOT NULL,
  id_alat VARCHAR(30),
  id_pelanggan VARCHAR(30),
  harga_sewa NUMBER(15) ,
  tgl_sewa DATE ,
  tgl_kembali DATE
);

alter table daftar_alat ADD CONSTRAINT PK_daftar_alat_id1 PRIMARY KEY (no_alat);
alter table login ADD CONSTRAINT PK_loginid1 PRIMARY KEY (login_id);
alter table pelanggan ADD CONSTRAINT PK_pelanggan_id1 PRIMARY KEY (id_pelanggan);
alter table pengembalian ADD CONSTRAINT PK_pengembalian_id1 PRIMARY KEY (id);
alter table sewa_alat ADD CONSTRAINT PK_sewa_alat_id1 PRIMARY KEY (id);

alter table sewa_alat ADD CONSTRAINT FK_id_alat FOREIGN KEY (id_alat) REFERENCES daftar_alat (no_alat);
alter table sewa_alat ADD CONSTRAINT FK_id_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan);

alter table login ADD CONSTRAINT login_unique UNIQUE (username);

CREATE SEQUENCE login_seq START WITH 1;
CREATE OR REPLACE TRIGGER login_trigger
BEFORE INSERT ON login
FOR EACH ROW
BEGIN
SELECT login_seq.NEXTVAL
INTO :new.login_id
FROM dual;
END;

CREATE SEQUENCE daftar_alat_seq START WITH 1;
CREATE OR REPLACE TRIGGER daftar_alat_trigger
BEFORE INSERT ON daftar_alat
FOR EACH ROW
BEGIN
SELECT daftar_alat_seq.NEXTVAL
INTO :new.id
FROM dual;
END;

CREATE SEQUENCE pelanggan_seq START WITH 1;
CREATE OR REPLACE TRIGGER pelanggan_trigger
BEFORE INSERT ON pelanggan
FOR EACH ROW
BEGIN
SELECT pelanggan_seq.NEXTVAL
INTO :new.id
FROM dual;
END;

CREATE SEQUENCE pengembalian_seq START WITH 1;
CREATE OR REPLACE TRIGGER pengembalian_trigger
BEFORE INSERT ON pengembalian
FOR EACH ROW
BEGIN
SELECT pengembalian_seq.NEXTVAL
INTO :new.id
FROM dual;
END;

CREATE SEQUENCE sewa_alat_seq START WITH 1;
CREATE OR REPLACE TRIGGER sewa_alat_trigger
BEFORE INSERT ON sewa_alat
FOR EACH ROW
BEGIN
SELECT sewa_alat_seq.NEXTVAL
INTO :new.id
FROM dual;
END;