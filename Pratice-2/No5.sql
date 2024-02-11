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
        'CTR004',
        '2345678901234561'
    );

INSERT INTO
    Transaksi_minuman (
        Transaksi_ID_transaksi,
        Menu_minuman_ID_minuman,
        Jumlah_cup
    )
VALUES
    ('TRX0000007', 'MNM005', 1);
