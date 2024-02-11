CREATE TABLE Membership (
    ID_membership char(6) NOT NULL,
    No_telp_membership varchar(15) NOT NULL,
    Alamat_membership varchar(100) NOT NULL,
    Tanggal_pembuatan_kartu_membership date NOT NULL,
    Tanggal_kadaluarsa_kartu_membership date NULL,
    Total_poin int NOT NULL,
    Customer_ID_customer char(6) NOT NULL
);

ALTER TABLE
    Membership
ADD
    CONSTRAINT Membership_pk PRIMARY KEY (ID_membership);

ALTER TABLE
    Membership
ADD
    CONSTRAINT Membership_Customer FOREIGN KEY (Customer_ID_customer) REFERENCES Customer (ID_customer) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE
    Membership
MODIFY
    COLUMN Tanggal_pembuatan_kartu_membership DATE DEFAULT CURRENT_TIMESTAMP;

DELIMITER //
CREATE TRIGGER membership_total_poin_check
BEFORE INSERT ON Membership
FOR EACH ROW
BEGIN
    IF NEW.Total_poin < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total_poin must be greater than or equal to 0';
    END IF;
END;
//
DELIMITER ;

ALTER TABLE
    Membership
MODIFY
    COLUMN Alamat_membership VARCHAR(150);
