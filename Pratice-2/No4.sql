INSERT INTO
    Customer (ID_customer, Nama_customer)
VALUES
    ('CTR001', 'Budi Santoso'),
    ('CTR002', 'Sisil Triana'),
    ('CTR003', 'Davi Liam'),
    ('CTR004', 'Sutris Ten An'),
    ('CTR005', 'Hendra Asto');

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

INSERT INTO
    Pegawai (
        NIK,
        Nama_pegawai,
        Jenis_kelamin,
        Email,
        Umur,
        nomor_telepon
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
