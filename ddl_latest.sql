CREATE TABLE CollectionCard (
    cc_ID char(5)  NOT NULL,
    cc_name varchar(255)  NOT NULL,
    cc_series varchar(50)  NOT NULL,
    cc_rarity varchar(20)  NOT NULL,
    CONSTRAINT CollectionCard_pk PRIMARY KEY (cc_ID)
);

CREATE TABLE CollectionTransaction (
    ct_ID char(5)  NOT NULL,
    ct_date datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ct_isChecked boolean  NOT NULL DEFAULT false,
    ct_isApproved boolean  NOT NULL DEFAULT false,
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

CREATE TABLE GameRoom (
    gr_ID char(5)  NOT NULL,
    gr_type varchar(50)  NOT NULL,
    gr_price decimal(10,2)  NOT NULL,
    CONSTRAINT GameRoom_pk PRIMARY KEY (gr_ID)
);

CREATE TABLE Membership (
    m_ID char(5)  NOT NULL,
    m_name varchar(120)  NOT NULL,
    m_email varchar(60)  NOT NULL,
    m_dateRegistered date  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    m_totalPoin int  NOT NULL DEFAULT 0 CHECK (m_totalPoin >= 0),
    CONSTRAINT Membership_pk PRIMARY KEY (m_ID)
);

CREATE TABLE Player (
    p_ID char(5)  NOT NULL,
    p_name varchar(100)  NOT NULL,
    p_address varchar(255)  NULL,
    p_phoneNumber varchar(15)  NULL,
    p_m_ID char(5)  NOT NULL,
    CONSTRAINT Player_pk PRIMARY KEY (p_ID)
);

CREATE TABLE ProductCatalog (
    pc_ID char(5)  NOT NULL,
    pc_name varchar(255)  NOT NULL,
    pc_type varchar(50)  NOT NULL,
    pc_price decimal(10,2)  NOT NULL,
    pc_stock int  NOT NULL DEFAULT 0 CHECK (pc_stock >= 0),
    CONSTRAINT  ProductCatalog_pk PRIMARY KEY (pc_ID)
);

CREATE TABLE ProductShoppingCart (
    psc_pc_ID char(5)  NOT NULL,
    psc_pt_ID char(5)  NOT NULL,
    psc_quantity int  NOT NULL CHECK (psc_quantity >= 0),
    CONSTRAINT  ProductCatalog_Transaction_pk PRIMARY KEY (psc_pc_ID,psc_pt_ID)
);

CREATE TABLE RoomShoppingCart (
    rsc_pt_ID char(5)  NOT NULL,
    rsc_gr_ID char(5)  NOT NULL,
    rsc_time_in datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    rsc_time_out datetime  NOT NULL DEFAULT (CURRENT_TIMESTAMP + INTERVAL 1 HOUR) CHECK (rsc_time_out > rsc_time_in),
    CONSTRAINT Transaction_GameRoom_pk PRIMARY KEY (rsc_pt_ID,rsc_gr_ID)
);

CREATE TABLE Transaction (
    t_ID char(5)  NOT NULL,
    t_date datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    t_totalPrice decimal(10,2)  NOT NULL DEFAULT 0 CHECK (t_totalPrice >= 0),
    t_isAMember boolean  NOT NULL DEFAULT false,
    t_e_ID char(5)  NOT NULL,
    t_p_ID char(5)  NOT NULL,
    CONSTRAINT Transaction_pk PRIMARY KEY (t_ID)
);

ALTER TABLE CollectionTransaction ADD CONSTRAINT CollectionCard_CollectionTransaction_P1 FOREIGN KEY CollectionCard_CollectionTransaction_P1 (p1_cc_ID)
    REFERENCES CollectionCard (cc_ID);

ALTER TABLE CollectionTransaction ADD CONSTRAINT CollectionTransaction_CollectionCard_P2 FOREIGN KEY CollectionTransaction_CollectionCard_P2 (p2_cc_ID)
    REFERENCES CollectionCard (cc_ID);

ALTER TABLE CollectionTransaction ADD CONSTRAINT CollectionTransaction_Player_P1 FOREIGN KEY CollectionTransaction_Player_P1 (p1_p_ID)
    REFERENCES Player (p_ID);

ALTER TABLE CollectionTransaction ADD CONSTRAINT CollectionTransaction_Player_P2 FOREIGN KEY CollectionTransaction_Player_P2 (p2_p_ID)
    REFERENCES Player (p_ID);

ALTER TABLE Player ADD CONSTRAINT Player_Membership FOREIGN KEY Player_Membership (p_m_ID)
    REFERENCES Membership (m_ID);

ALTER TABLE ProductShoppingCart ADD CONSTRAINT ProductCatalog_Transaction_ProductCatalog FOREIGN KEY ProductCatalog_Transaction_ProductCatalog (psc_pc_ID)
    REFERENCES ProductCatalog (pc_ID);

ALTER TABLE ProductShoppingCart ADD CONSTRAINT ProductCatalog_Transaction_Transaction FOREIGN KEY ProductCatalog_Transaction_Transaction (psc_pt_ID)
    REFERENCES Transaction (t_ID);

ALTER TABLE Transaction ADD CONSTRAINT ProductTransaction_Employee FOREIGN KEY ProductTransaction_Employee (t_e_ID)
    REFERENCES Employee (e_ID);

ALTER TABLE Transaction ADD CONSTRAINT ProductTransaction_Player FOREIGN KEY ProductTransaction_Player (t_p_ID)
    REFERENCES Player (p_ID);

ALTER TABLE RoomShoppingCart ADD CONSTRAINT Transaction_GameRoom_GameRoom FOREIGN KEY Transaction_GameRoom_GameRoom (rsc_gr_ID)
    REFERENCES GameRoom (gr_ID);

ALTER TABLE RoomShoppingCart ADD CONSTRAINT Transaction_GameRoom_Transaction FOREIGN KEY Transaction_GameRoom_Transaction (rsc_pt_ID)
    REFERENCES Transaction (t_ID);