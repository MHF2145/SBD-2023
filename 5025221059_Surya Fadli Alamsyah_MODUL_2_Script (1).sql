-- No 1
-- Table: Customer
CREATE TABLE Customer (
    ID_customer char(6)  NOT NULL,
    Nama_customer varchar(100)  NOT NULL,
    CONSTRAINT Customer_PK PRIMARY KEY (ID_customer)
) ;

-- Table: Menu_minuman
CREATE TABLE Menu_minuman (
    ID_minuman char(6)  NOT NULL,
    Nama_minuman varchar(50)  NOT NULL,
    Harga_minuman float(2)  NOT NULL,
    CONSTRAINT Menu_minuman_PK PRIMARY KEY (ID_minuman)
) ;

-- Table: Pegawai
CREATE TABLE Pegawai (
    NIK char(16)  NOT NULL,
    Nama_pegawai varchar(100)  NOT NULL,
    Jenis_kelamin char(1)  NULL,
    Email varchar(50)  NULL,
    Umur integer  NOT NULL,
    CONSTRAINT Pegawai_PK PRIMARY KEY (NIK)
) ;

-- Table: Telepon
CREATE TABLE Telepon (
    No_telp_pegawai varchar(15)  NOT NULL,
    Pegawai_NIK char(16)  NOT NULL,
    CONSTRAINT Telepon_PK PRIMARY KEY (No_telp_pegawai)
) ;

-- Table: Transaksi
CREATE TABLE Transaksi (
    ID_transaksi char(10)  NOT NULL,
    Tanggal_transaksi date  NOT NULL,
    Metode_pembayaran varchar(15)  NOT NULL,
    Customer_ID_customer char(6)  NOT NULL,
    Pegawai_NIK char(16)  NOT NULL,
    CONSTRAINT Transaksi_PK PRIMARY KEY (ID_transaksi)
) ;

-- Table: Transaksi_minuman
CREATE TABLE Transaksi_minuman (
    TM_Menu_minuman_ID char(6)  NOT NULL,
    TM_Transaksi_ID char(10)  NOT NULL,
    Jumlah_cup integer  NOT NULL,
    CONSTRAINT Transaksi_minuman_PK PRIMARY KEY (TM_Transaksi_ID,TM_Menu_minuman_ID)
) ;

-- foreign keys
-- Reference: Telepon_Pegawai (table: Telepon)
ALTER TABLE Telepon ADD CONSTRAINT Telepon_Pegawai_FK
    FOREIGN KEY (Pegawai_NIK)
    REFERENCES Pegawai (NIK);

-- Reference: Transaksi_Customer (table: Transaksi)
ALTER TABLE Transaksi ADD CONSTRAINT Transaksi_Customer_FK
    FOREIGN KEY (Customer_ID_customer)
    REFERENCES Customer (ID_customer);

-- Reference: Transaksi_Pegawai (table: Transaksi)
ALTER TABLE Transaksi ADD CONSTRAINT Transaksi_Pegawai_FK
    FOREIGN KEY (Pegawai_NIK)
    REFERENCES Pegawai (NIK);

-- Reference: Transaksi_minuman_Menu_minuman (table: Transaksi_minuman)
ALTER TABLE Transaksi_minuman ADD CONSTRAINT TM_ID_Menu_minuman_FK
    FOREIGN KEY (TM_Menu_minuman_ID)
    REFERENCES Menu_minuman (ID_minuman);

-- Reference: Transaksi_minuman_Transaksi (table: Transaksi_minuman)
ALTER TABLE Transaksi_minuman ADD CONSTRAINT TM_ID_Transaksi_FK
    FOREIGN KEY (TM_Transaksi_ID)
    REFERENCES Transaksi (ID_transaksi);

-- No 2

-- Table: Membership
CREATE TABLE Membership (
    id_membership CHAR(6) NOT NULL,
    no_telepon_customer VARCHAR(15) NOT NULL,
    alamat_customer VARCHAR(100) NOT NULL,
    tanggal_pembuatan_kartu_membership DATE NOT NULL,
    tanggal_kedaluwarsa_kartu_membership DATE NULL,
    total_poin INT NOT NULL,
    customer_id_customer CHAR(6) NOT NULL
);

-- A
ALTER TABLE Membership
ADD CONSTRAINT Membership_PK PRIMARY KEY (ID_membership);

-- B
ALTER TABLE Membership
ADD CONSTRAINT Membership_Customer_FK FOREIGN KEY (Customer_ID_customer)
REFERENCES Customer (ID_customer)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- C
ALTER TABLE Transaksi
DROP FOREIGN KEY Transaksi_Customer_FK;

ALTER TABLE Transaksi
ADD CONSTRAINT Transaksi_Customer_FK FOREIGN KEY (Customer_ID_customer)
REFERENCES Customer (ID_customer)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- D
ALTER TABLE Membership
ALTER COLUMN tanggal_pembuatan_kartu_membership SET DEFAULT CURRENT_DATE;

-- E
ALTER TABLE Membership
ADD CONSTRAINT Check_Total_Poin CHECK (total_poin >= 0);

-- F
ALTER TABLE Membership
MODIFY COLUMN alamat_customer VARCHAR(150);

-- No 3
ALTER TABLE Pegawai
ADD No_telp_pegawai VARCHAR(15);

DROP TABLE Telepon;

-- No 4

-- tabel Customer
INSERT INTO Customer (ID_customer, Nama_customer)
VALUES
    ('CTR001', 'Budi Santoso'),
    ('CTR002', 'Sisil Triana'),
    ('CTR003', 'Davi Liam'),
    ('CTR004', 'Sutris Ten An'),
    ('CTR005', 'Hendra Asto');

-- tabel Membership
INSERT INTO Membership (id_membership, no_telepon_customer, alamat_customer, tanggal_pembuatan_kartu_membership, tanggal_kedaluwarsa_kartu_membership, total_poin, customer_id_customer)
VALUES
    ('MBR001', '08123456789', 'Jl. Imam Bonjol', '2023-10-24', '2023-11-30', 0, 'CTR001'),
    ('MBR002', '0812345678', 'Jl. Kelinci', '2023-10-24', '2023-11-30', 3, 'CTR002'),
    ('MBR003', '081234567890', 'Jl. Abah Ojak', '2023-10-25', '2023-12-01', 2, 'CTR003'),
    ('MBR004', '08987654321', 'Jl. Kenangan', '2023-10-26', '2023-12-02', 6, 'CTR005');

-- tabel Pegawai
INSERT INTO Pegawai (NIK, Nama_pegawai, Jenis_kelamin, Email, Umur, No_telp_pegawai)
VALUES
    ('1234567890123456', 'Naufal Raf', 'Laki-Laki', 'naufal@gmail.com', 19, '62123456789'),
    ('2345678901234561', 'Surinala', 'Perempuan', 'surinala@gmail.com', 24, '621234567890'),
    ('3456789012345612', 'Ben John', 'Laki-Laki', 'benjohn@gmail.com', 22, '6212345678');

-- tabel Transaksi
INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_pembayaran, Pegawai_NIK, Customer_ID_customer)
VALUES
    ('TRX0000001', '2023-10-01', 'Kartu kredit', '2345678901234561', 'CTR002'),
    ('TRX0000002', '2023-10-03', 'Transfer bank', '3456789012345612', 'CTR004'),
    ('TRX0000003', '2023-10-05', 'Tunai', '3456789012345612', 'CTR001'),
    ('TRX0000004', '2023-10-15', 'Kartu debit', '1234567890123456', 'CTR003'),
    ('TRX0000005', '2023-10-15', 'E-wallet', '1234567890123456', 'CTR004'),
    ('TRX0000006', '2023-10-21', 'Tunai', '2345678901234561', 'CTR001');

-- tabel Transaksi_Menu
INSERT INTO Transaksi_minuman (TM_Transaksi_ID, TM_Menu_minuman_ID, Jumlah_cup)
VALUES
    ('TRX0000005', 'MNM006', 2),
    ('TRX0000001', 'MNM010', 1),
    ('TRX0000002', 'MNM005', 1),
    ('TRX0000005', 'MNM009', 1),
    ('TRX0000003', 'MNM001', 3),
    ('TRX0000006', 'MNM003', 2),
    ('TRX0000004', 'MNM004', 2),
    ('TRX0000004', 'MNM010', 1),
    ('TRX0000002', 'MNM003', 2),
    ('TRX0000001', 'MNM007', 1),
    ('TRX0000005', 'MNM001', 1),
    ('TRX0000003', 'MNM003', 1);

-- tabel Menu_minuman
INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES
    ('MNM001', 'Expresso', 18000),
    ('MNM002', 'Cappuccino', 20000),
    ('MNM003', 'Latte', 21000),
    ('MNM004', 'Americano', 19000),
    ('MNM005', 'Mocha', 22000),
    ('MNM006', 'Macchiato', 23000),
    ('MNM007', 'Cold Brew', 21000),
    ('MNM008', 'Iced Coffee', 18000),
    ('MNM009', 'Affogato', 23000),
    ('MNM010', 'Coffee Frappe', 22000);

-- No 5
INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_pembayaran, Customer_ID_customer, Pegawai_NIK)
VALUES ('TRX0000007', '2023-10-03', 'Transfer bank', 'CTRo04', '2345678901234561');

INSERT INTO Transaksi_minuman (TM_Transaksi_ID, TM_Menu_minuman_ID, Jumlah_cup)
VALUES ('TRX0000007', 'MNM005', 1);

-- No 6
INSERT INTO Pegawai (NIK, Nama_pegawai, Umur)
VALUES ('1111222233334444', 'Maimunah', 25);

-- No 7
UPDATE Customer
SET ID_customer = 'CTR004'
WHERE ID_customer = 'CTRo04';

-- No 8
UPDATE Pegawai
SET Jenis_kelamin = 'P',
    Email = 'maimunah@gmail.com',
    No_telp_pegawai = '621234567'
WHERE NIK = '1111222233334444';

-- No 9
UPDATE Membership
SET total_poin = 0
WHERE tanggal_kedaluwarsa_kartu_membership IS NOT NULL
    AND tanggal_kedaluwarsa_kartu_membership < '2023-12-01';

-- No 10
DELETE FROM Membership;

-- No 11
DELETE FROM Pegawai
WHERE Nama_pegawai = 'Maimunah';
