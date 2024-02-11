CREATE DATABASE pratice_2
-- No1
-- Table: Customer
CREATE TABLE Customer (
    ID_customer char(6) NOT NULL,
    Nama_customer varchar(100) NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (ID_customer)
);

-- Table: Menu_minuman
CREATE TABLE Menu_minuman (
    ID_minuman char(6) NOT NULL,
    Nama_minuman varchar(50) NULL,
    Harga_minuman float(2, 0) NULL,
    CONSTRAINT Menu_minuman_pk PRIMARY KEY (ID_minuman)
);

-- Table: Pegawai
CREATE TABLE Pegawai (
    NIK char(16) NOT NULL,
    Nama_pegawai varchar(100) NULL,
    Jenis_kelamin char(1) NOT NULL,
    Email varchar(50) NOT NULL,
    Umur int NULL,
    CONSTRAINT Pegawai_pk PRIMARY KEY (NIK)
);

-- Table: Telepon
CREATE TABLE Telepon (
    No_telp_pegawai varchar(15) NOT NULL,
    Pegawai_NIK char(16) NOT NULL,
    CONSTRAINT Telepon_pk PRIMARY KEY (No_telp_pegawai),
    CONSTRAINT Telepon_Pegawai FOREIGN KEY (Pegawai_NIK) REFERENCES Pegawai (NIK)
);

-- Table: Transaksi
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

-- Table: Transaksi_minuman
CREATE TABLE Transaksi_minuman (
    Jumlah_cup int NULL,
    Transaksi_ID_transaksi char(10) NOT NULL,
    Menu_minuman_ID_minuman char(6) NOT NULL,
    CONSTRAINT Transaksi_minuman_pk PRIMARY KEY (Transaksi_ID_transaksi, Menu_minuman_ID_minuman),
    CONSTRAINT Transaksi_minuman_Transaksi FOREIGN KEY (Transaksi_ID_transaksi) REFERENCES Transaksi (ID_transaksi),
    CONSTRAINT Transaksi_minuman_Menu_minuman FOREIGN KEY (Menu_minuman_ID_minuman) REFERENCES Menu_minuman (ID_minuman)
);

-- NO 2
-- Jadikan id_membership sebagai PRIMARY KEY:

-- Table: Membership
CREATE TABLE Membership (
    ID_membership char(6) NOT NULL,
    No_telp_membership varchar(15) NOT NULL,
    Alamat_membership varchar(150) NOT NULL, -- Changed the maximum size to 150
    Tanggal_pembuatan_kartu_membership date NOT NULL,
    Tanggal_kadaluarsa_kartu_membership date NULL, -- Added Tanggal_kadaluarsa_kartu_membership
    Total_poin int NOT NULL,
    Customer_ID_customer char(6) NOT NULL
);

ALTER TABLE
    Membership
ADD
    CONSTRAINT Membership_pk PRIMARY KEY (ID_membership); -- Corrected the case of ID_membership

-- Atur customer_id_customer sebagai FOREIGN KEY yang berasal
-- dari relasi dengan tabel customer. Dengan pengaturan apabila
-- id_customer di tabel customer diubah, maka data id di tabel
-- membership ikut berubah. Selain itu, data customer tidak boleh
-- dihapus apabila telah menjadi member.
ALTER TABLE
    Membership
ADD
    CONSTRAINT Membership_Customer FOREIGN KEY (Customer_ID_customer) REFERENCES Customer (ID_customer) ON UPDATE CASCADE ON DELETE RESTRICT; -- Corrected the case of Customer_ID_customer and ID_customer

--  Atur customer_id_customer pada tabel transaksi sebagai
-- FOREIGN KEY dengan kondisi ON DELETE CASCADE dan ON UPDATE
-- CASCADE
ALTER TABLE
    Transaksi
ADD
    CONSTRAINT Transaksi_Customer FOREIGN KEY (Customer_ID_customer) REFERENCES Customer (ID_customer) ON DELETE CASCADE ON UPDATE CASCADE; -- Corrected the case of Customer_ID_customer and ID_customer

-- Atur nilai default tanggal_pembuatan_kartu_membership
-- sebagai tanggal sekarang (terdapat fungsi build-in)
ALTER TABLE
    Membership
MODIFY
    COLUMN Tanggal_pembuatan_kartu_membership DATE DEFAULT CURRENT_TIMESTAMP;

-- Berikan constraint untuk melakukan pengecekan bahwa total_poin harus lebih dari atau sama dengan 0:
DELIMITER //
CREATE TRIGGER membership_total_poin_check
BEFORE INSERT ON Membership
FOR EACH ROW
BEGIN
    IF NEW.Total_poin < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'total_poin must be greater than or equal to 0';
    END IF;
END;
//
DELIMITER ;

-- Tambahkan Tanggal_kadaluwarsa_kartu_membership ke membership dengan datatype yang sesuai:
ALTER TABLE
    Membership
ADD
    COLUMN Tanggal_kadaluarsa_kartu_membership DATE NULL; -- Added the column with the correct data type


-- No3
DROP TABLE Telepon;

ALTER TABLE
    Pegawai
ADD
    nomor_telepon VARCHAR(15) NULL;

-- Sesuaikan dengan tipe data yang sesuai dengan nomor telepon
-- no4
-- Tabel Customer
INSERT INTO
    Customer (ID_customer, Nama_customer)
VALUES
    ('CTR001', 'Budi Santoso'),
    ('CTR002', 'Sisil Triana'),
    ('CTR003', 'Davi Liam'),
    ('CTR004', 'Sutris Ten An'),
    ('CTR005', 'Hendra Asto');

-- Tabel Membership
INSERT INTO
    Membership (
        ID_membership,
        Customer_ID_customer,
        No_telp_membership,
        Alamat_membership,
        Tanggal_pembuatan_kartu_membership,
        Tanggal_kadaluarsa_kartu_membership,
        Total_poin
    )
VALUES
    (
        'MBR001',
        'CTR001',
        '08123456789',
        'Jl. Imam Bonjol',
        '2023-10-24',
        '2023-11-30',
        0
    ),
    (
        'MBR002',
        'CTR002',
        '0812345678',
        'Jl. Kelinci',
        '2023-10-24',
        '2023-11-30',
        3
    ),
    (
        'MBR003',
        'CTR003',
        '081234567890',
        'Jl. Abah Ojak',
        '2023-10-25',
        '2023-12-01',
        2
    ),
    (
        'MBR004',
        'CTR005',
        '08987654321',
        'Jl. Kenangan',
        '2023-10-26',
        '2023-12-02',
        6
    );

-- Tabel Pegawai
INSERT INTO
    Pegawai (
        NIK,
        Nama_pegawai,
        Jenis_kelamin,
        Email,
        Umur,
        No_telp_pegawai
    )
VALUES
    (
        '1234567890123456',
        'Naufal Raf',
        'Laki-Laki',
        'naufal@gmail.com',
        19,
        '62123456789'
    ),
    (
        '2345678901234561',
        'Surinala',
        'Perempuan',
        'surinala@gmail.com',
        24,
        '621234567890'
    ),
    (
        '3456789012345612',
        'Ben John',
        'Laki-Laki',
        'benjohn@gmail.com',
        22,
        '6212345678'
    );

-- Tabel Transaksi
INSERT INTO
    Transaksi (
        ID_transaksi,
        Customer_ID_customer,
        Tanggal_transaksi,
        Metode_pembayaran,
        Pegawai_NIK
    )
VALUES
    (
        'TRX0000001',
        'CTR002',
        '2023-10-01',
        'Kartu kredit',
        '2345678901234561'
    ),
    (
        'TRX0000002',
        'CTR004',
        '2023-10-03',
        'Transfer bank',
        '3456789012345612'
    ),
    (
        'TRX0000003',
        'CTR001',
        '2023-10-05',
        'Tunai',
        '3456789012345612'
    ),
    (
        'TRX0000004',
        'CTR003',
        '2023-10-15',
        'Kartu debit',
        '1234567890123456'
    ),
    (
        'TRX0000005',
        'CTR004',
        '2023-10-15',
        'E-wallet',
        '1234567890123456'
    ),
    (
        'TRX0000006',
        'CTR001',
        '2023-10-21',
        'Tunai',
        '2345678901234561'
    );

-- Tabel Transaksi_minuman
INSERT INTO
    Transaksi_minuman (
        Transaksi_ID_transaksi,
        Menu_minuman_ID_minuman,
        Jumlah_cup
    )
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
    ('TRX0000005', 'MNM001', 1);

-- Tabel Menu_minuman
INSERT INTO
    Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES
    ('MNM001', 'Espresso', 18000),
    ('MNM002', 'Cappuccino', 20000),
    ('MNM003', 'Latte', 21000),
    ('MNM004', 'Americano', 19000),
    ('MNM005', 'Mocha', 22000),
    ('MNM006', 'Macchiato', 23000),
    ('MNM007', 'Cold Brew', 21000),
    ('MNM008', 'Iced Coffee', 18000),
    ('MNM009', 'Affogato', 23000),
    ('MNM010', 'Coffee Frappe', 22000);

-- DML
-- 5
-- First, make sure the 'CTRo04' customer and '2345678901235612' employee exist
-- Then insert data into Transaksi
INSERT INTO
    Transaksi (
        ID_transaksi,
        Tanggal_transaksi,
        Metode_pembayaran,
        Customer_ID_customer,
        Pegawai_NIK
    )
VALUES
    (
        'TRX0000007',
        '2023-10-03',
        'Transfer bank',
        'CTR004', -- Use a valid Customer_ID_customer
        '2345678901234561' -- Use a valid Pegawai_NIK
    );

-- Now, insert data into Transaksi_minuman
INSERT INTO
    Transaksi_minuman (
        Transaksi_ID_transaksi,
        Menu_minuman_ID_minuman,
        Jumlah_cup
    )
VALUES
    ('TRX0000007', 'MNM005', 1);


-- 6
INSERT INTO
    Pegawai (NIK, Nama_pegawai, Umur)
VALUES
    ('1111222233334444', 'Maimunah', 25);

-- 7
UPDATE
    Customer
SET
    ID_customer = 'CTR004'
WHERE
    ID_customer = 'CTRo04';

-- 8
UPDATE
    Pegawai
SET
    Jenis_kelamin = 'P',
    nomor_telepon = '621234567',
    Email = 'maimunah@gmail.com'
WHERE
    Nama_pegawai = 'Maimunah';

-- 9
UPDATE
    Membership
SET
    Total_poin = 0
WHERE
    Tanggal_kadaluarsa_kartu_membership < '2023-12-01';

-- 10
-- Hapus semua data dari tabel Membership
DELETE FROM
    Membership;

-- 11
DELETE FROM
    Pegawai
WHERE
    Nama_pegawai = 'Maimunah';