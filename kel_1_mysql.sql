CREATE TABLE Customer(
	C_ID CHAR(5) PRIMARY KEY NOT NULL,
	C_Nama VARCHAR(30) NOT NULL,
	C_Email VARCHAR(30) NOT NULL,
	C_NoTelp VARCHAR(15) NOT NULL,
	C_Alamat VARCHAR(30) NOT NULL
);

CREATE TABLE Pegawai(
	P_ID CHAR(5) PRIMARY KEY NOT NULL,
	P_Nama VARCHAR(30) NOT NULL,
	P_Jabatan VARCHAR(20) NOT NULL,
	P_Email VARCHAR(30) NOT NULL,
	P_NoTelp VARCHAR(15) NOT NULL,
	P_Alamat VARCHAR(30) NOT NULL,
	P_Gaji DECIMAL(12,2) NOT NULL
);

CREATE TABLE Menu(
	M_ID CHAR(5) PRIMARY KEY NOT NULL,
	M_Nama VARCHAR(20) NOT NULL,
	M_Harga DECIMAL(8,2) NOT NULL,
	M_Deskripsi VARCHAR(200) NOT NULL
);

CREATE TABLE Driver(
	D_ID CHAR(5) PRIMARY KEY NOT NULL,
	D_Nama VARCHAR(30) NOT NULL,
	D_NoTelp VARCHAR(15) NOT NULL,
	D_Nopol VARCHAR(10) NOT NULL,
	D_Rating DECIMAL(2,1) NOT NULL
);

CREATE TABLE Transaksi(
    T_ID CHAR(5) PRIMARY KEY NOT NULL,
    T_MetodePembayaran VARCHAR(20) NOT NULL,
    T_WaktuPesanan DATE NOT NULL,
    Driver_D_ID CHAR(5) NOT NULL,
    Customer_C_ID CHAR(5) NOT NULL,
    Pegawai_P_ID CHAR(5) NOT NULL,
    FOREIGN KEY (Driver_D_ID) REFERENCES Driver(D_ID),
    FOREIGN KEY (Customer_C_ID) REFERENCES Customer(C_ID),
    FOREIGN KEY (Pegawai_P_ID) REFERENCES Pegawai(P_ID)
);

CREATE TABLE Menu_Transaksi(
    Menu_M_ID CHAR(5) NOT NULL,
    Transaksi_T_ID CHAR(5) NOT NULL,
    FOREIGN KEY (Menu_M_ID) REFERENCES Menu(M_ID),
    FOREIGN KEY (Transaksi_T_ID) REFERENCES Transaksi(T_ID)
);

INSERT INTO Customer VALUES
('C0001', 'John Doe', 'johndoe@gmail.com', '0834567890', '123 Main St, City A'),
('C0002', 'Jane Smith', 'janesmith@gmail.com', '0876543210', '456 Elm St, City B'),
('C0003', 'David Johnson', 'davidjohnson@gmail.com', '0858901234', '789 Oak St, City C'),
('C0004', 'Sarah Brown', 'sarahbrown@gmail.com', '0851098765', '321 Maple St, City D'),
('C0005', 'Michael Lee', 'michaellee@gmail.com', '0878012345', '654 Pine St, City E'),
('C0006', 'Lisa Davis', 'lisadavis@gmail.com', '0829876543', '987 Cedar St, City F'),
('C0007', 'Robert Wilson', 'robertwilson@gmail.com', '0852109876', '876 Birch St, City G'),
('C0008', 'Emily Taylor', 'emilytaylor@gmail.com', '0892345678', '789 Walnut St, City H'),
('C0009', 'Daniel Clark', 'danielclark@gmail.com', '0856789012', '234 Spruce St, City I'),
('C0010', 'Olivia Moore', 'oliviamoore@gmail.com', '0889012345', '567 Elm St, City J'),
('C0011', 'Christopher Hill', 'christopherhill@gmail.com', '0834567890', '890 Oak St, City K'),
('C0012', 'Ava Turner', 'avaturner@gmail.com', '0816543210', '321 Maple St, City L'),
('C0013', 'Ethan Scott', 'ethanscott@gmail.com', '0878901234', '654 Pine St, City M'),
('C0014', 'Mia Cooper', 'miacooper@gmail.com', '0821098765', '987 Cedar St, City N'),
('C0015', 'Alexander Stewart', 'alexanderstewart@gmail.com', '0829012345', '876 Birch St, City O'),
('C0016', 'Sophia Ward', 'sophiaward@gmail.com', '08929876543', '789 Walnut St, City P'),
('C0017', 'James Miller', 'jamesmiller@gmail.com', '0812345678', '234 Spruce St, City Q'),
('C0018', 'Isabella Taylor', 'isabellataylor@gmail.com', '0856789012', '567 Elm St, City R'),
('C0019', 'Benjamin Collins', 'benjamincollins@gmail.com', '0889012345', '890 Oak St, City S'),
('C0020', 'Charlotte Young', 'charlotteyoung@gmail.com', '0834567890', '321 Maple St, City T');

INSERT INTO Pegawai VALUES
('P0001', 'Budi Santoso', 'Kasir', 'budi@gmail.com', '08123456789', 'Jl. Sudirman 1, Jakarta', '5000000.00'),
('P0002', 'Ani Wijayanti', 'Chef', 'ani@gmail.com', '08234567890', 'Jl. Thamrin 2, Jakarta', '8000000.00'),
('P0003', 'Agus Sutanto', 'Kasir', 'agus@gmail.com', '08345678901', 'Jl. Gatot Subroto 3, Jakarta', '4000000.00'),
('P0004', 'Lina Dewi', 'Kasir', 'lina@gmail.com', '08456789012', 'Jl. Diponegoro 4, Jakarta', '4500000.00'),
('P0005', 'Denny Pranoto', 'Manager', 'denny@gmail.com', '08567890123', 'Jl. Ahmad Yani 5, Jakarta', '10000000.00'),
('P0006', 'Siti Rahayu', 'Chef', 'siti@gmail.com', '08678901234', 'Jl. Imam Bonjol 6, Jakarta', '8500000.00'),
('P0007', 'Rudi Setiawan', 'Waiter', 'rudi@gmail.com', '08789012345', 'Jl. Pahlawan 7, Jakarta', '4700000.00'),
('P0008', 'Eka Dewi', 'Kasir', 'eka@gmail.com', '08890123456', 'Jl. Cikini 8, Jakarta', '4200000.00'),
('P0009', 'Anton Kurniawan', 'Waiter', 'anton@gmail.com', '08901234567', 'Jl. Kemang 9, Jakarta', '4900000.00'),
('P0010', 'Rina Wati', 'Chef', 'rina@gmail.com', '09012345678', 'Jl. Tanah Abang 10, Jakarta', '7800000.00');

INSERT INTO Menu VALUES
('M0001', 'Nasi Goreng', 15000, 'Nasi goreng dengan ayam, sayur, dan telur'),
('M0002', 'Mie Ayam', 12000, 'Mie ayam dengan potongan ayam dan pangsit'),
('M0003', 'Sate Ayam', 20000, 'Sate ayam dengan bumbu kacang yang lezat'),
('M0004', 'Bakso', 10000, 'Bakso dengan kuah bening dan bakso urat'),
('M0005', 'Gado-Gado', 18000, 'Gado-gado dengan bumbu kacang dan sayuran'),
('M0006', 'Soto Ayam', 15000, 'Soto ayam dengan daging ayam dan kuah gurih'),
('M0007', 'Ayam Goreng', 18000, 'Ayam goreng dengan nasi dan lalapan'),
('M0008', 'Mie Goreng', 13000, 'Mie goreng dengan sayur dan telur'),
('M0009', 'Martabak', 25000, 'Martabak dengan pilihan rasa manis atau asin'),
('M0010', 'Nasi Uduk', 12000, 'Nasi uduk dengan ayam, telur, dan lauk'),
('M0011', 'Rawon', 18000, 'Rawon dengan daging sapi dan kuah kental'),
('M0012', 'Soto Betawi', 15000, 'Soto Betawi dengan daging dan santan'),
('M0013', 'Sate Padang', 20000, 'Sate Padang dengan bumbu khas Padang'),
('M0014', 'Pecel Lele', 15000, 'Pecel lele dengan nasi dan sambal khas'),
('M0015', 'Capcay', 16000, 'Capcay dengan sayuran segar dan saus'),
('M0016', 'Rendang', 25000, 'Rendang dengan daging sapi dan bumbu rempah'),
('M0017', 'Sop Buntut', 22000, 'Sop buntut dengan kuah bening dan buntut empuk'),
('M0018', 'Kwetiau Goreng', 13000, 'Kwetiau goreng dengan udang dan sayuran'),
('M0019', 'Sate Kambing', 25000, 'Sate kambing dengan bumbu kacang khas'),
('M0020', 'Mie Aceh', 18000, 'Mie Aceh dengan mie kuning dan bumbu pedas'),
('M0021', 'Es Teh Manis', 5000, 'Es teh manis dengan es batu'),
('M0022', 'Es Jeruk', 8000, 'Es jeruk segar dengan perasan jeruk'),
('M0023', 'Es Cendol', 10000, 'Es cendol dengan santan, gula merah, dan tepung beras'),
('M0024', 'Es Doger', 12000, 'Es doger dengan campuran kelapa muda, ubi ungu, cincau, dan sirup'),
('M0025', 'Bandrek', 15000, 'Bandrek dengan jahe, gula merah, dan rempah-rempah'),
('M0026', 'Es Campur', 12000, 'Es campur dengan aneka buah, nata de coco, dan sirup'),
('M0027', 'Es Kelapa Muda', 10000, 'Es kelapa muda segar dengan air kelapa dan es batu'),
('M0028', 'Bajigur', 12000, 'Bajigur dengan jahe, gula merah, kelapa parut, dan santan'),
('M0029', 'Jamu Kunyit Asam', 8000, 'Jamu kunyit asam dengan kunyit, asam jawa, dan madu'),
('M0030', 'Wedang Jahe', 10000, 'Wedang jahe dengan jahe, gula merah, dan rempah-rempah');

INSERT INTO Driver VALUES
('D0001', 'Muhammad Fuad', '0812345678', 'M 1234 AB', 4.5),
('D0002', 'Badrus Salim', '0876543210', 'W 5678 CD', 5.2),
('D0003', 'Nadira Milha', '0890123456', 'M 9012 EF', 4.8),
('D0004', 'William Sholeh', '0823456789', 'L 3456 GH', 3.6),
('D0005', 'Muhammad Ali', '0867890123', 'L 7890 IJ', 4.4),
('D0006', 'Abdul Ghofur', '0857892732', 'S 7829 PO', 5.5),
('D0007', 'Misbahul Maarif', '088726434', 'W 9281 IU', 3.9),
('D0008', 'Nadia Syifa', '0812794024', 'K 2563 RE', 2.8),
('D0009', 'Ahmad Hendra', '087920831', 'B 3682 WD', 3.5),
('D0010', 'Kamal Rusdi', '0822746928', 'B 1109 VB', 4.9);

INSERT INTO Transaksi VALUES
('T0001', 'Cash', '2023-11-09', 'D0001', 'C0001', 'P0001'),
('T0002', 'Cash', '2023-11-09', 'D0002', 'C0002', 'P0003'),
('T0003', 'Debit Card', '2023-11-10', 'D0003', 'C0003', 'P0003'),
('T0004', 'Cash', '2023-11-11', 'D0004', 'C0004', 'P0004'),
('T0005', 'Credit Card', '2023-11-11', 'D0005', 'C0005', 'P0008'),
('T0006', 'Cash', '2023-11-11', 'D0001', 'C0006', 'P0001'),
('T0007', 'Cash', '2023-11-14', 'D0008', 'C0007', 'P0003'),
('T0008', 'Debit Card', '2023-11-15', 'D0005', 'C0008', 'P0008'),
('T0009', 'Cash', '2023-11-15', 'D0009', 'C0009', 'P0004'),
('T0010', 'Credit Card', '2023-11-16', 'D0006', 'C0010', 'P0001'),
('T0011', 'Cash', '2023-11-16', 'D0010', 'C0011', 'P0001'),
('T0012', 'Cash', '2023-11-17', 'D0007', 'C0012', 'P0003'),
('T0013', 'Debit Card', '2023-11-20', 'D0008', 'C0013', 'P0003'),
('T0014', 'Cash', '2023-11-21', 'D0010', 'C0014', 'P0004'),
('T0015', 'Credit Card', '2023-11-22', 'D0009', 'C0015', 'P0008'),
('T0016', 'Cash', '2023-11-22', 'D0001', 'C0011', 'P0001'),
('T0017', 'Cash', '2023-11-2', 'D0004', 'C0012', 'P0003'),
('T0018', 'Debit Card', '2023-11-23', 'D0003', 'C0013', 'P0003'),
('T0019', 'Cash', '2023-11-24', 'D0001', 'C0014', 'P0004'),
('T0020', 'Credit Card', '2023-11-27', 'D0009', 'C0015', 'P0008');

INSERT INTO Menu_Transaksi VALUES
('M0001', 'T0001'),
('M0013', 'T0001'),
('M0023', 'T0002'),
('M0002', 'T0003'),
('M0012', 'T0004'),
('M0003', 'T0005'),
('M0004', 'T0006'),
('M0014', 'T0006'),
('M0005', 'T0006'),
('M0025', 'T0007'),
('M0006', 'T0008'),
('M0007', 'T0008'),
('M0017', 'T0009'),
('M0008', 'T0010'),
('M0018', 'T0010'),
('M0028', 'T0010'),
('M0009', 'T0011'),
('M0019', 'T0012'),
('M0015', 'T0013'),
('M0010', 'T0013'),
('M0011', 'T0014'),
('M0011', 'T0014'),
('M0013', 'T0014'),
('M0012', 'T0015'),
('M0022', 'T0015'),
('M0022', 'T0016'),
('M0001', 'T0016'),
('M0004', 'T0016'),
('M0014', 'T0016'),
('M0020', 'T0017'),
('M0027', 'T0018'),
('M0019', 'T0018'),
('M0001', 'T0019'),
('M0003', 'T0019'),
('M0009', 'T0019'),
('M0001', 'T0020'),
('M0007', 'T0020'),
('M0005', 'T0020'),
('M0010', 'T0020');