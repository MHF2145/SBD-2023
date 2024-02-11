CREATE TABLE Customer (
    ID_customer char(6) NOT NULL,
    Nama_customer varchar(100) NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (ID_customer)
);

CREATE TABLE Menu_minuman (
    ID_minuman char(6) NOT NULL,
    Nama_minuman varchar(50) NULL,
    Harga_minuman float(2, 0) NULL,
    CONSTRAINT Menu_minuman_pk PRIMARY KEY (ID_minuman)
);

CREATE TABLE Pegawai (
    NIK char(16) NOT NULL,
    Nama_pegawai varchar(100) NULL,
    Jenis_kelamin char(1) NOT NULL,
    Email varchar(50) NOT NULL,
    Umur int NULL,
    CONSTRAINT Pegawai_pk PRIMARY KEY (NIK)
);

CREATE TABLE Telepon (
    No_telp_pegawai varchar(15) NOT NULL,
    Pegawai_NIK char(16) NOT NULL,
    CONSTRAINT Telepon_pk PRIMARY KEY (No_telp_pegawai),
    CONSTRAINT Telepon_Pegawai FOREIGN KEY (Pegawai_NIK) REFERENCES Pegawai (NIK)
);

CREATE TABLE Transaksi (
    ID_transaksi char(10) NOT NULL,
    Tanggal_transaksi date NULL,
    Metode_pembayaran varchar(15) NULL,
    Customer_ID_customer char(6) NOT NULL,
    Pegawai_NIK char(16) NOT NULL,
    CONSTRAINT Transaksi_pk PRIMARY KEY (ID_transaksi),
    CONSTRAINT Transaksi_Customer FOREIGN KEY (Customer_ID_customer) REFERENCES Customer (ID_customer),
    CONSTRAINT Transaksi_Pegawai FOREIGN KEY (Pegawai_NIK) REFERENCES Pegawai (NIK)
);

CREATE TABLE Transaksi_minuman (
    Jumlah_cup int NULL,
    Transaksi_ID_transaksi char(10) NOT NULL,
    Menu_minuman_ID_minuman char(6) NOT NULL,
    CONSTRAINT Transaksi_minuman_pk PRIMARY KEY (Transaksi_ID_transaksi, Menu_minuman_ID_minuman),
    CONSTRAINT Transaksi_minuman_Transaksi FOREIGN KEY (Transaksi_ID_transaksi) REFERENCES Transaksi (ID_transaksi),
    CONSTRAINT Transaksi_minuman_Menu_minuman FOREIGN KEY (Menu_minuman_ID_minuman) REFERENCES Menu_minuman (ID_minuman)
);
