CREATE DATABASE MODUL_2
CREATE TABLE Customer (
    ID_customer char(6)  NOT NULL,
    Nama_customer varchar2(100)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (ID_customer)
) ;

CREATE TABLE Menu_minuman (
    ID_minuman char(6)  NOT NULL,
    Nama_minuman varchar2(50)  NOT NULL,
    Harga_minuman float(2)  NOT NULL,
    CONSTRAINT Menu_minuman_pk PRIMARY KEY (ID_minuman)
) ;

CREATE TABLE Pegawai (
    NIK char(16)  NOT NULL,
    Nama_pegawai varchar2(100)  NOT NULL,
    Jenis_kelamin char(1)  NOT NULL,
    Email varchar2(50)  NOT NULL,
    Umur integer  NOT NULL,
    CONSTRAINT Pegawai_pk PRIMARY KEY (NIK)
) ;

CREATE TABLE Telepon (
    No_telp_pegawai varchar2(15)  NOT NULL,
    Pegawai_NIK char(16)  NOT NULL,
    CONSTRAINT Telepon_pk PRIMARY KEY (No_telp_pegawai)
) ;

CREATE TABLE Transaksi (
    ID_transaksi char(10)  NOT NULL,
    Tanggal_transaksi date  NOT NULL,
    Metode_pembayaran varchar2(15)  NOT NULL,
    Customer_ID_Customer char(6)  NOT NULL,
    Pegawai_NIK char(16)  NOT NULL,
    CONSTRAINT Transaksi_pk PRIMARY KEY (ID_transaksi)
) ;

CREATE TABLE Transaksi_minuman (
    TM_Menu_Minuman char(6)  NOT NULL,
    TM_Transaksi_ID char(6)  NOT NULL,
    Jumlah_Cup integer  NOT NULL,
    CONSTRAINT Transaksi_minuman_pk PRIMARY KEY (TM_Menu_Minuman,TM_Transaksi_ID)
) ;

ALTER TABLE Telepon ADD CONSTRAINT Telepon_Pegawai
    FOREIGN KEY (Pegawai_NIK)
    REFERENCES Pegawai (NIK);

ALTER TABLE Transaksi ADD CONSTRAINT Transaksi_Customer
    FOREIGN KEY (Customer_ID_Customer)
    REFERENCES Customer (ID_customer);

ALTER TABLE Transaksi ADD CONSTRAINT Transaksi_Pegawai
    FOREIGN KEY (Pegawai_NIK)
    REFERENCES Pegawai (NIK);

ALTER TABLE Transaksi_minuman ADD CONSTRAINT Transaksi_minuman_Menu_minuman
    FOREIGN KEY (TM_Menu_Minuman)
    REFERENCES Menu_minuman (ID_minuman);

ALTER TABLE Transaksi_minuman ADD CONSTRAINT Transaksi_minuman_Transaksi
    FOREIGN KEY (TM_Transaksi_ID)
    REFERENCES Transaksi (ID_transaksi);


