-- CollectionCard table
INSERT INTO CollectionCard (cc_ID, cc_name, cc_series, cc_rarity) VALUES


-- Player table
INSERT INTO Player (p_ID, p_name, p_address, p_phoneNumber, p_m_ID) VALUES
('P001', 'Teja Hoshizora', 'Jl. Merdeka No. 123', '555-1234', 'M001'),
('P002', 'Leo Leon', 'Jl. Kebon Sirih No. 456', '555-5678', 'M002'),
('P003', 'Alif Satria', 'Jl. Sudirman No. 789', '555-9012', 'M003'),
('P004', 'Rafli Rai', 'Jl. Pangeran Antasari No. 101', '555-3456', 'M004'),
('P005', 'Moris Idris', 'Jl. Gatot Subroto No. 202', '555-7890', 'M005'),
('P006', 'Hanif Kan', 'Jl. Thamrin No. 303', '555-1234', 'M006'),
('P007', 'Lord Kaisar', 'Jl. Hayam Wuruk No. 404', '555-5678', 'M007'),
('P008', 'Kang Ryu', 'Jl. Wahid Hasyim No. 505', '555-9012', 'null'),
('P009', 'Ian Harris', 'Jl. Diponegoro No. 606', '555-3456', 'null'),
('P010', 'Julia Clark', 'Jl. HR. Rasuna Said No. 707', '555-7890', 'null');

-- Membership table
INSERT INTO Membership (m_ID, m_name, m_email, m_dateRegistered, m_totalPoin) VALUES
('M001', 'Oda', 'oda@gmail.com', '2023-01-01', 100),
('M002', 'Arsene', 'arsene@hotmail.com', '2023-02-15', 150),
('M003', 'Rozen', 'rozen@yahoo.com', '2023-03-30', 200),
('M004', 'Flan', 'flan@gmail.com', '2023-04-10', 120),
('M005', 'Fyodor', 'fyodor@rocketmail.com', '2023-05-22', 180),
('M006', 'Salvanse', 'salvanse@hotmail.com', '2023-06-05', 220),
('M007', 'Cyanstar', 'lordk@gmail.com', '2023-07-15', 90),

-- Employee table
INSERT INTO Employee (e_ID, e_name, e_address, e_phoneNumber, e_position, e_email, e_age) VALUES
('E001', 'Xiao Yuu', 'Jl. Jenderal Sudirman No. 123', '555-1111', 'Owner', 'xiaoyuu@gmail.com', 29),
('E002', 'Hakken Ryou', 'Jl. Thamrin No. 456', '555-2222', 'Cashier', 'hakken@yahoo.com', 25),
('E003', 'Ronan Loch', 'Jl. Hayam Wuruk No. 789', '555-3333', 'Game Room Assistant', 'ronan@outlook.com', 24),
('E004', 'Adam Stewart', 'Jl. Kebon Sirih No. 101', '555-4444', 'Janitor', 'adam@yahoo.com', 26),
('E005', 'David Wicaksono', 'Jl. MH. Thamrin No. 202', '555-5555', 'Janitor', 'davidw@gmail.com', 25);

-- Transaction table
INSERT INTO Transaction (t_ID, t_date, t_totalPrice, t_isAMember, t_e_ID, t_p_ID) VALUES


-- ProductCatalog table
INSERT INTO ProductCatalog (pc_ID, pc_name, pc_type, pc_price, pc_stock) VALUES


-- ProductShoppingCart table
INSERT INTO ProductShoppingCart (psc_pc_ID, psc_pt_ID, psc_quantity) VALUES


-- GameRoom table
INSERT INTO GameRoom (gr_ID, gr_type, gr_price) VALUES
('GR001', 'Reguler', 20000.00),
('GR002', 'Deluxe', 40000.00),
('GR003', 'VIP', 50000.00);

-- RoomShoppingCart table
INSERT INTO RoomShoppingCart (rsc_pt_ID, rsc_gr_ID) VALUES

-- new player
-- insert new player with membership
INSERT INTO Player (p_ID, p_name, p_address, p_phoneNumber, p_m_ID) VALUES
('P009', 'Ian Harris', 'Jl. Diponegoro No. 606', '555-3456', 'M009'),
('P010', 'Julia Clark', 'Jl. HR. Rasuna Said No. 707', '555-7890', 'M010');

INSERT INTO Membership (m_ID, m_name, m_email, m_dateRegistered, m_totalPoin) VALUES
('M009', 'Vanila', 'vanila@hotmail.com', '2023-09-09', 170),
('M010', 'Tiramisu', 'tiramisu@gmail.com', '2023-10-20', 210);

-- update player kang ryu to have membership
INSERT INTO Membership (m_ID, m_name, m_email, m_dateRegistered, m_totalPoin) VALUES
('M008', 'Topazr', 'topaz@yahoo.com', '2023-08-28', 130);

UPDATE Player
SET p_m_ID = 'M008'
WHERE p_ID = 'P008';

--



