-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-12-19 10:11:44.994

-- tables
-- Table: CollectionCard
CREATE TABLE CollectionCard (
    cc_ID char(5)  NOT NULL,
    cc_name varchar(255)  NOT NULL,
    cc_series varchar(50)  NOT NULL,
    cc_rarity varchar(20)  NOT NULL,
    CONSTRAINT CollectionCard_pk PRIMARY KEY (cc_ID)
);

-- Table: CollectionTransaction
CREATE TABLE CollectionTransaction (
    ct_ID char(5)  NOT NULL,
    ct_date datetime  NOT NULL,
    ct_isChecked boolean  NOT NULL,
    ct_isApproved boolean  NOT NULL,
    p1_p_ID char(5)  NOT NULL,
    p1_cc_ID char(5)  NULL,
    p1_cardQuantity int  NULL,
    p1_price decimal(10,2)  NULL,
    p2_p_ID char(5)  NOT NULL,
    p2_cc_ID char(5)  NULL,
    p2_cardQuantity int  NULL,
    p2_price decimal(10,2)  NULL,
    CONSTRAINT CollectionTransaction_pk PRIMARY KEY (ct_ID)
);

-- Table: Employee
CREATE TABLE Employee (
    e_ID char(5)  NOT NULL,
    e_name varchar(100)  NOT NULL,
    e_address varchar(255)  NOT NULL,
    e_phoneNumber varchar(15)  NOT NULL,
    e_position varchar(50)  NOT NULL,
    e_email varchar(60)  NOT NULL,
    e_age int  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (e_ID)
);

-- Table: GameRoom
CREATE TABLE GameRoom (
    gr_ID char(5)  NOT NULL,
    gr_type varchar(50)  NOT NULL,
    gr_price decimal(10,2)  NOT NULL,
    CONSTRAINT GameRoom_pk PRIMARY KEY (gr_ID)
);

-- Table: Membership
CREATE TABLE Membership (
    m_ID char(5)  NOT NULL,
    m_name varchar(120)  NOT NULL,
    m_email varchar(60)  NOT NULL,
    m_dateRegistered date  NOT NULL,
    m_totalPoin int  NOT NULL,
    CONSTRAINT Membership_pk PRIMARY KEY (m_ID)
);

-- Table: Player
CREATE TABLE Player (
    p_ID char(5)  NOT NULL,
    p_name varchar(100)  NOT NULL,
    p_address varchar(255)  NULL,
    p_phoneNumber varchar(15)  NULL,
    p_m_ID char(5)  NULL,
    CONSTRAINT Player_pk PRIMARY KEY (p_ID)
);

-- Table: ProductCatalog
CREATE TABLE ProductCatalog (
    pc_ID char(5)  NOT NULL,
    pc_name varchar(255)  NOT NULL,
    pc_type varchar(50)  NOT NULL,
    pc_price decimal(10,2)  NOT NULL,
    pc_stock int  NOT NULL,
    CONSTRAINT  ProductCatalog_pk PRIMARY KEY (pc_ID)
);

-- Table: ProductShoppingCart
CREATE TABLE ProductShoppingCart (
    psc_pc_ID char(5)  NOT NULL,
    psc_pt_ID char(5)  NOT NULL,
    psc_quantity int  NOT NULL,
    CONSTRAINT  ProductCatalog_Transaction_pk PRIMARY KEY (psc_pc_ID,psc_pt_ID)
);

-- Table: RoomShoppingCart
CREATE TABLE RoomShoppingCart (
    rsc_pt_ID char(5)  NOT NULL,
    rsc_gr_ID char(5)  NOT NULL,
    rsc_time_in datetime  NOT NULL,
    rsc_time_out datetime  NOT NULL,
    CONSTRAINT Transaction_GameRoom_pk PRIMARY KEY (rsc_pt_ID,rsc_gr_ID)
);

-- Table: Transaction
CREATE TABLE Transaction (
    t_ID char(5)  NOT NULL,
    t_date datetime  NOT NULL,
    t_totalPrice decimal(10,2)  NOT NULL,
    t_isAMember boolean  NOT NULL,
    t_e_ID char(5)  NOT NULL,
    t_p_ID char(5)  NOT NULL,
    CONSTRAINT Transaction_pk PRIMARY KEY (t_ID)
);

-- foreign keys
-- Reference: CollectionCard_CollectionTransaction_P1 (table: CollectionTransaction)
ALTER TABLE CollectionTransaction ADD CONSTRAINT CollectionCard_CollectionTransaction_P1 FOREIGN KEY CollectionCard_CollectionTransaction_P1 (p1_cc_ID)
    REFERENCES CollectionCard (cc_ID);

-- Reference: CollectionTransaction_CollectionCard_P2 (table: CollectionTransaction)
ALTER TABLE CollectionTransaction ADD CONSTRAINT CollectionTransaction_CollectionCard_P2 FOREIGN KEY CollectionTransaction_CollectionCard_P2 (p2_cc_ID)
    REFERENCES CollectionCard (cc_ID);

-- Reference: CollectionTransaction_Player_P1 (table: CollectionTransaction)
ALTER TABLE CollectionTransaction ADD CONSTRAINT CollectionTransaction_Player_P1 FOREIGN KEY CollectionTransaction_Player_P1 (p1_p_ID)
    REFERENCES Player (p_ID);

-- Reference: CollectionTransaction_Player_P2 (table: CollectionTransaction)
ALTER TABLE CollectionTransaction ADD CONSTRAINT CollectionTransaction_Player_P2 FOREIGN KEY CollectionTransaction_Player_P2 (p2_p_ID)
    REFERENCES Player (p_ID);

-- Reference: Player_Membership (table: Player)
ALTER TABLE Player ADD CONSTRAINT Player_Membership FOREIGN KEY Player_Membership (p_m_ID)
    REFERENCES Membership (m_ID);

-- Reference: ProductCatalog_Transaction_ProductCatalog (table: ProductShoppingCart)
ALTER TABLE ProductShoppingCart ADD CONSTRAINT ProductCatalog_Transaction_ProductCatalog FOREIGN KEY ProductCatalog_Transaction_ProductCatalog (psc_pc_ID)
    REFERENCES ProductCatalog (pc_ID);

-- Reference: ProductCatalog_Transaction_Transaction (table: ProductShoppingCart)
ALTER TABLE ProductShoppingCart ADD CONSTRAINT ProductCatalog_Transaction_Transaction FOREIGN KEY ProductCatalog_Transaction_Transaction (psc_pt_ID)
    REFERENCES Transaction (t_ID);

-- Reference: ProductTransaction_Employee (table: Transaction)
ALTER TABLE Transaction ADD CONSTRAINT ProductTransaction_Employee FOREIGN KEY ProductTransaction_Employee (t_e_ID)
    REFERENCES Employee (e_ID);

-- Reference: ProductTransaction_Player (table: Transaction)
ALTER TABLE Transaction ADD CONSTRAINT ProductTransaction_Player FOREIGN KEY ProductTransaction_Player (t_p_ID)
    REFERENCES Player (p_ID);

-- Reference: Transaction_GameRoom_GameRoom (table: RoomShoppingCart)
ALTER TABLE RoomShoppingCart ADD CONSTRAINT Transaction_GameRoom_GameRoom FOREIGN KEY Transaction_GameRoom_GameRoom (rsc_gr_ID)
    REFERENCES GameRoom (gr_ID);

-- Reference: Transaction_GameRoom_Transaction (table: RoomShoppingCart)
ALTER TABLE RoomShoppingCart ADD CONSTRAINT Transaction_GameRoom_Transaction FOREIGN KEY Transaction_GameRoom_Transaction (rsc_pt_ID)
    REFERENCES Transaction (t_ID);

-- End of file.

