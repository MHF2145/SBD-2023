-- Database Shop Begin Operation in November
-- Employee table
INSERT INTO Employee (e_ID, e_name, e_address, e_phoneNumber, e_position, e_email, e_age) VALUES
('E0001', 'Xiao Yuu', 'Jl. Jenderal Sudirman No. 123', '555-1111', 'Owner', 'xiaoyuu@gmail.com', 29),
('E0002', 'Hakken Ryou', 'Jl. Thamrin No. 456', '555-2222', 'Cashier', 'hakken@yahoo.com', 25),
('E0003', 'Ronan Loch', 'Jl. Hayam Wuruk No. 789', '555-3333', 'Game Room Assistant', 'ronan@outlook.com', 24),
('E0004', 'Adam Stewart', 'Jl. Kebon Sirih No. 101', '555-4444', 'Janitor', 'adam@yahoo.com', 26),
('E0005', 'David Wicaksono', 'Jl. MH. Thamrin No. 202', '555-5555', 'Janitor', 'davidw@gmail.com', 25);

-- ProductCatalog table
INSERT INTO ProductCatalog (pc_ID, pc_name, pc_type, pc_price, pc_stock) VALUES
('PC001', 'Vivid Voltage Booster Pack', 'Pokemon Booster Pack', 55000, 20),
('PC002', 'Scarlet & Violet Booster Pack', 'Pokemon Booster Pack', 65000, 10),
('PC003', 'Sword & Shield Booster Pack', 'Pokemon Booster Pack', 45000, 15),
('PC004', 'Brave Destroyer Booster Pack', 'Yu GI Oh Booster Pack', 50000, 15),
('PC005', 'Legendary Duel: Soul-Burning Volcano Booster Pack', 'Yu GI Oh Booster Pack', 70000, 5),
('PC006', 'Draft Booster', 'Magic: The Gathering Booster Pack', 60000, 10),
('PC007', 'Jumpstart Booster', 'Magic: The Gathering Booster Pack', 55000, 20);

-- GameRoom table
INSERT INTO GameRoom (gr_ID, gr_type, gr_price) VALUES
('GR001', 'Reguler', 20000.00),
('GR002', 'Deluxe', 40000.00),
('GR003', 'VIP', 50000.00);

-- Membership table
INSERT INTO Membership (m_ID, m_name, m_email, m_dateRegistered, m_totalPoin) VALUES
('OWNER', 'Master Rusdi', 'rusdi@gmail.com', '2023-07-01', 1000),
('M0001', 'Oda', 'oda@gmail.com', '2023-11-03', 100),
('M0002', 'Arsene', 'arsene@hotmail.com', '2023-11-15', 150),
('M0003', 'Rozen', 'rozen@yahoo.com', '2023-11-16', 200),
('M0004', 'Flan', 'flan@gmail.com', '2023-11-16', 120),
('M0005', 'Fyodor', 'fyodor@rocketmail.com', '2023-11-22', 180),
('M0006', 'Salvanse', 'salvanse@hotmail.com', '2023-11-23', 220),
('M0007', 'Cyanstar', 'lordk@gmail.com', '2023-11-28', 90);

-- Player table
INSERT INTO Player (p_ID, p_m_ID, p_name, p_address, p_phoneNumber) VALUES
('OWNER', 'OWNER', 'Rusdi', 'Jl. semangka', '111-111'),
('P0001', 'M0001', 'Teja Hoshizora', 'Jl. Merdeka No. 123', '555-1234'),
('P0002', 'M0002', 'Leo Leon', 'Jl. Kebon Sirih No. 456', '555-5678'),
('P0003', 'M0003', 'Alif Satria', 'Jl. Sudirman No. 789', '555-9012'),
('P0004', 'M0004', 'Rafli Rai', 'Jl. Pangeran Antasari No. 101', '555-3456'),
('P0005', 'M0005', 'Moris Idris', 'Jl. Gatot Subroto No. 202', '555-7890'),
('P0006', 'M0006', 'Hanif Kan', 'Jl. Thamrin No. 303', '555-1234'),
('P0007', 'M0007', 'Lord Kaisar', 'Jl. Hayam Wuruk No. 404', '555-5678'),
('P0008', NULL, 'Kang Ryu', 'Jl. Wahid Hasyim No. 505', '555-9012');

-- CollectionCard table
INSERT INTO CollectionCard (cc_ID, cc_name, cc_series, cc_rarity) VALUES
('CC001', 'Pikachu', 'Pokemon', 'Common'),
('CC002', 'Charizard', 'Pokemon', 'Rare'),
('CC003', 'Blastoise', 'Pokemon', 'Rare'),
('CC004', 'Dark Magician', 'Yu GI Oh', 'Ultra Rare'),
('CC005', 'Blue-Eyes White Dragon', 'Yu GI Oh', 'Ultra Rare'),
('CC006', 'Exodia the Forbidden One', 'Yu GI Oh', 'Secret Rare'),
('CC007', 'Jace, the Mind Sculptor', 'Magic: The Gathering', 'Mythic Rare'),
('CC008', 'Black Lotus', 'Magic: The Gathering', 'Mythic Rare'),
('CC009', 'Serra Angel', 'Magic: The Gathering', 'Rare'),
('CC010', 'Mewtwo', 'Pokemon', 'Legendary Rare'),
('CC011', 'Red-Eyes Black Dragon', 'Yu GI Oh', 'Super Rare'),
('CC012', 'Gyarados', 'Pokemon', 'Rare'),
('CC013', 'Force of Will', 'Magic: The Gathering', 'Rare'),
('CC014', 'Zygarde', 'Pokemon', 'Rare'),
('CC015', 'Raigeki', 'Yu GI Oh', 'Super Rare');

-- Transaction table
INSERT INTO Transaction (t_ID, t_date, t_totalPrice, t_isAMember, t_e_ID, t_p_ID) VALUES
('T0001', '2023-11-01 12:30:00', 0.00, 1, 'E0001', 'P0001'),
('T0002', '2023-11-02 14:45:00', 0.00, 1, 'E0002', 'P0002'),
('T0003', '2023-11-03 10:15:00', 0.00, 1, 'E0003', 'P0003'),
('T0004', '2023-11-04 16:00:00', 0.00, 1, 'E0004', 'P0004'),
('T0005', '2023-11-05 11:30:00', 0.00, 1, 'E0005', 'P0005');

-- ProductShoppingCart table
INSERT INTO ProductShoppingCart (psc_pc_ID, psc_pt_ID, psc_quantity) VALUES
('PC002', 'T0001', 2),
('PC004', 'T0001', 1),
('PC005', 'T0002', 3),
('PC007', 'T0002', 1),
('PC003', 'T0003', 2),
('PC006', 'T0003', 1),
('PC002', 'T0004', 3),
('PC005', 'T0004', 2),
('PC004', 'T0005', 1),
('PC006', 'T0005', 2);

-- RoomShoppingCart table
INSERT INTO RoomShoppingCart (rsc_pt_ID, rsc_gr_ID, rsc_time_in, rsc_time_out) VALUES
('T0001', 'GR001', '2023-11-01 12:30:00', '2023-11-01 15:30:00'),
('T0002', 'GR002', '2023-11-02 14:45:00', '2023-11-02 17:45:00'),
('T0003', 'GR003', '2023-11-03 10:15:00', '2023-11-03 12:15:00'),
('T0004', 'GR001', '2023-11-04 16:00:00', '2023-11-04 19:00:00'),
('T0005', 'GR002', '2023-11-05 11:30:00', '2023-11-05 14:30:00');

-- CollectionTransaction table
INSERT INTO CollectionTransaction
(ct_ID, ct_date, ct_isChecked, ct_isApproved, p1_p_ID, p1_cc_ID, p1_cardQuantity, p1_price, p2_p_ID, p2_cc_ID, p2_cardQuantity, p2_price) VALUES
('CT001', '2023-12-10 14:00:00', false, false, 'P0002', 'CC001', 1, 10000.00, NULL, NULL, NULL, NULL),
('CT002', '2023-12-15 16:30:00', false, false, 'OWNER', 'CC002', 1, NULL, NULL, NULL, NULL, NULL);

-- Update for the first transaction (P1 Buying P2 card) & (Trading from P1 with P2 card but rejected)
UPDATE CollectionTransaction
SET p2_p_ID = 'P0001'
WHERE ct_ID = 'CT001';
UPDATE CollectionTransaction
SET p2_p_ID = 'P0003', p2_cc_ID = 'CC004', p2_cardQuantity = 1
WHERE ct_ID = 'CT002';

-- Update for the confirmation for each transaction
UPDATE CollectionTransaction
SET ct_isChecked = true,
    ct_isApproved = true
WHERE ct_ID = 'CT001';
UPDATE CollectionTransaction
SET ct_isChecked = true,
    ct_isApproved = false,
    p2_p_ID = NULL,
    p2_cc_ID = NULL,
    p2_cardQuantity = NULL
WHERE ct_ID = 'CT002';

-- update transaction
UPDATE Transaction
SET t_totalPrice = (
    SELECT SUM(pc_price * psc_quantity)
    FROM ProductShoppingCart
    JOIN ProductCatalog ON ProductShoppingCart.psc_pc_ID = ProductCatalog.pc_ID
    WHERE ProductShoppingCart.psc_pt_ID = Transaction.t_ID
) + (
    SELECT SUM(gr_price * TIMESTAMPDIFF(SECOND, rsc_time_in, rsc_time_out) / 3600)
    FROM RoomShoppingCart
    JOIN GameRoom ON RoomShoppingCart.rsc_gr_ID = GameRoom.gr_ID
    WHERE RoomShoppingCart.rsc_pt_ID = Transaction.t_ID
)


-- Database in December
-- Player Ryu Liam came and brought his friends, then registered for membership.
INSERT INTO Membership (m_ID, m_name, m_email, m_dateRegistered, m_totalPoin) VALUES
('M0008', 'Topazr', 'topaz@yahoo.com', '2023-08-28', 130);

INSERT INTO Player (p_ID, p_m_ID, p_name, p_address, p_phoneNumber) VALUES
('P0009', NULL, 'Ian Harris', 'Jl. Diponegoro No. 606', '555-3456'),
('P0010', NULL, 'Julia Clark', 'Jl. HR. Rasuna Said No. 707', '555-7890');

INSERT INTO Membership (m_ID, m_name, m_email, m_dateRegistered, m_totalPoin) VALUES
('M0009', 'Vanila', 'vanila@hotmail.com', '2023-12-09', 170),
('M0010', 'Tiramisu', 'tiramisu@gmail.com', '2023-12-20', 210);

UPDATE Player
SET p_m_ID = 'M0008'
WHERE p_ID = 'P0008';
UPDATE Player
SET p_m_ID = 'M0009'
WHERE p_ID = 'P0009';
UPDATE Player
SET p_m_ID = 'M0010'
WHERE p_ID = 'P0010';

-- New Product
INSERT INTO ProductCatalog (pc_ID, pc_name, pc_type, pc_price, pc_stock) VALUES
('PC008', 'Mew Genesect', 'Pokemon Deck', 110000, 3),
('PC009', 'Inteleon Urshifu', 'Pokemon Deck', 130000, 5);

INSERT INTO ProductCatalog (pc_ID, pc_name, pc_type, pc_price, pc_stock) VALUES
('PC010', 'Salamangreat', 'Yu GI Oh Deck', 120000, 1),
('PC011', 'Mannadium Scareclaw Kashtira', 'Yu GI Oh Deck', 135000, 2);

INSERT INTO ProductCatalog (pc_ID, pc_name, pc_type, pc_price, pc_stock) VALUES
('PC012', 'Vintage', 'Magic: The Gathering Deck', 100000, 5),
('PC013', 'Alchemy', 'Magic: The Gathering Deck', 110000, 2);

INSERT INTO ProductCatalog (pc_ID, pc_name, pc_type, pc_price, pc_stock) VALUES
('PC014', 'Pokemon Hat', 'Type Merchandise', 130000, 3),
('PC015', 'Yu Gi Oh Prism', 'Type Merchandise', 150000, 3),
('PC016', 'Planeswalker Hat', 'Type Merchandise', 110000, 3),
('PC017', 'Pokemon Play Game Sheet', 'Type Merchandise', 35000, 10),
('PC018', 'Yu Gi Oh Play Game Sheet', 'Type Merchandise', 45000, 10),
('PC019', 'Magic: The Gathering Play Game Sheet', 'Type Merchandise', 40000, 10);

UPDATE ProductCatalog
SET pc_stock = 10
WHERE pc_type LIKE '%Booster Pack%' AND pc_name <> 'Salamangreat';

UPDATE ProductCatalog
SET pc_name = 'Infemobile Sinfulness', pc_price = 110000, pc_stock = 5
WHERE pc_ID = 'PC010';

-- transaction in December
-- Transaction table
INSERT INTO Transaction (t_ID, t_date, t_totalPrice, t_isAMember, t_e_ID, t_p_ID) VALUES
('T0006', '2023-12-01 10:00:00', 0.00, 1, 'E0001', 'P0008'),
('T0007', '2023-12-02 13:45:00', 0.00, 1, 'E0002', 'P0009'),
('T0008', '2023-12-03 11:15:00', 0.00, 1, 'E0003', 'P0010'),
('T0009', '2023-12-04 14:00:00', 0.00, 1, 'E0004', 'P0001'),
('T0010', '2023-12-05 12:30:00', 0.00, 1, 'E0005', 'P0002');

    -- ProductShoppingCart table
    INSERT INTO ProductShoppingCart (psc_pc_ID, psc_pt_ID, psc_quantity) VALUES
    ('PC008', 'T0006', 2),
    ('PC014', 'T0006', 1),
    ('PC009', 'T0007', 3),
    ('PC016', 'T0007', 1),
    ('PC011', 'T0008', 2),
    ('PC013', 'T0008', 1),
    ('PC010', 'T0009', 3),
    ('PC015', 'T0009', 2),
    ('PC012', 'T0010', 1),
    ('PC017', 'T0010', 2);

    -- RoomShoppingCart table
    INSERT INTO RoomShoppingCart (rsc_pt_ID, rsc_gr_ID, rsc_time_in, rsc_time_out) VALUES
    ('T0006', 'GR001', '2023-12-01 10:00:00', '2023-12-01 13:00:00'),
    ('T0007', 'GR002', '2023-12-02 13:45:00', '2023-12-02 16:45:00'),
    ('T0008', 'GR003', '2023-12-03 11:15:00', '2023-12-03 13:15:00'),
    ('T0009', 'GR001', '2023-12-04 14:00:00', '2023-12-04 17:00:00'),
    ('T0010', 'GR002', '2023-12-05 12:30:00', '2023-12-05 15:30:00');

    -- Update transaction
    UPDATE Transaction
    SET t_totalPrice = (
    SELECT SUM(pc_price * psc_quantity)
    FROM ProductShoppingCart
    JOIN ProductCatalog ON ProductShoppingCart.psc_pc_ID = ProductCatalog.pc_ID
    WHERE ProductShoppingCart.psc_pt_ID = Transaction.t_ID
    ) + (
    SELECT SUM(gr_price * TIMESTAMPDIFF(SECOND, rsc_time_in, rsc_time_out) / 3600)
    FROM RoomShoppingCart
    JOIN GameRoom ON RoomShoppingCart.rsc_gr_ID = GameRoom.gr_ID
    WHERE RoomShoppingCart.rsc_pt_ID = Transaction.t_ID
    )
    WHERE t_totalPrice = 0;