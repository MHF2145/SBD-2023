-- November
-- Basic Query
-- 1 Tampilkan nama player dan memebrship point sort descending (sort)
SELECT
    Player.p_name AS PlayerName,
    Membership.m_name AS MemberName,
    Membership.m_totalPoin AS MembershipPoints
FROM
    Player
JOIN
    Membership ON Player.p_m_ID = Membership.m_ID
ORDER BY
    Membership.m_totalPoin DESC;

-- 2 Tampilkan informasi transaksi koleksi kartu yang berkaitan dengan owner (filter)
SELECT ct.*, cc.*,p.p_name
FROM collectiontransaction ct
JOIN collectioncard cc ON ct.p1_cc_ID = cc.cc_ID
JOIN player p ON ct.p1_p_ID = p_id
WHERE ct.p1_p_ID = 'OWNER';

-- 3 Find most expensive product
SELECT
    pc_name AS MostExpensiveProduct,
    pc_price AS MaxPrice
FROM
    ProductCatalog
ORDER BY
    pc_price DESC
LIMIT 1;

-- 4 Show collection card, group by rarity
SELECT
    cc_rarity AS Rarity,
    GROUP_CONCAT(cc_name SEPARATOR '; ') AS CollectionCardNames
FROM
    CollectionCard
GROUP BY
    cc_rarity;

-- 5 To display employees whose email addresses do not use Gmai
SELECT *
FROM employee
WHERE NOT e_email LIKE '%@gmail.com%';

-- Aggregate Query
-- 1 Get number of transactions made by each player
SELECT p.p_ID AS player_id, p.p_name AS player_name, COUNT(*) AS transaction_count
FROM player p
JOIN transaction t ON p.p_ID = t.t_p_ID
GROUP BY p.p_ID, p.p_name;

-- 2 Get  the total revenue generated from each game room type
SELECT
    gr.gr_ID,
    gr.gr_type,
    SUM(tr.t_totalPrice) AS total_revenue,
    COUNT(tr.t_ID) AS total_transactions
FROM
    gameroom gr
LEFT JOIN
    roomshoppingcart rsc ON gr.gr_ID = rsc.rsc_gr_ID
LEFT JOIN
    transaction tr ON rsc.rsc_pt_ID = tr.t_ID
GROUP BY
    gr.gr_ID, gr.gr_type
ORDER BY
    total_revenue DESC;

-- 3 List total number of transactions, the average transaction amount, and the player with the highest total
SELECT
    player.p_ID,
    player.p_name,
    COUNT(transaction.t_ID) AS total_transactions,
    AVG(transaction.t_totalPrice) AS average_transaction_amount,
    MAX(transaction.t_totalPrice) AS highest_transaction_amount
FROM
    player
LEFT JOIN
    transaction ON player.p_ID = transaction.t_p_ID
WHERE
    player.p_ID <> 'OWNER'
GROUP BY
    player.p_ID, player.p_name
ORDER BY
    highest_transaction_amount DESC;


-- 4 Total pendapatan bulan november
SELECT SUM(t_totalPrice) AS totalPendapatan FROM Transaction;

-- Nested Query
-- 1 Display products that have been sold more than the average quantity sold
SELECT
    pc.pc_ID,
    pc.pc_name,
    pc.pc_type,
    pc.pc_price,
    SUM(psc.psc_quantity) AS total_sold
FROM
    productcatalog pc
JOIN
    productshoppingcart psc ON pc.pc_ID = psc.psc_pc_ID
JOIN
    transaction t ON psc.psc_pt_ID = t.t_ID
GROUP BY
    pc.pc_ID
HAVING
    total_sold > (SELECT AVG(psc_quantity) FROM productshoppingcart);

-- 2 Display the employee name and the total transaction for each employee
SELECT
    e.e_name,
    (
        SELECT COUNT(t_ID)
        FROM Transaction
        WHERE t_e_ID = e.e_ID
    ) AS total_transactions
FROM
    Employee e;

-- 3 Search for the player that bought the most expensive product
SELECT
    t.t_ID,
    p.p_name AS player_name,
    (
        SELECT pc_name
        FROM ProductCatalog pc
        WHERE pc.pc_ID = (
            SELECT psc_pc_ID
            FROM ProductShoppingCart
            WHERE psc_pt_ID = t.t_ID
            ORDER BY (SELECT pc_price FROM ProductCatalog WHERE pc_ID = psc_pc_ID) DESC
            LIMIT 1
        )
    ) AS most_expensive_product,
    (
        SELECT MAX((SELECT pc_price FROM ProductCatalog WHERE pc_ID = psc_pc_ID) * psc_quantity)
        FROM ProductShoppingCart
        WHERE psc_pt_ID = t.t_ID
    ) AS total_spent
FROM
    Transaction t
    JOIN Player p ON t.t_p_ID = p.p_ID
ORDER BY total_spent DESC
LIMIT 1;

-- December
-- Basic Query
-- 1 Show approved collection transactions
SELECT ct.ct_ID, ct.ct_date, p1.p_name AS player1, p2.p_name AS player2
FROM collectiontransaction ct
JOIN player p1 ON ct.p1_p_ID = p1.p_ID
JOIN player p2 ON ct.p2_p_ID = p2.p_ID
WHERE ct.ct_isApproved = 1;

-- 2 Show the least used game room
SELECT gr.gr_ID, gr.gr_type, COUNT(rsc.rsc_gr_ID) AS usage_count
FROM gameroom gr
JOIN roomshoppingcart rsc ON gr.gr_ID = rsc.rsc_gr_ID
GROUP BY gr.gr_ID, gr.gr_type
ORDER BY usage_count ASC
LIMIT 1;

-- 3 Show all transactions in December
SELECT *
FROM transaction
WHERE MONTH(t_date) = 12;

-- 4 Member created in december
SELECT *
FROM membership
WHERE MONTH(m_dateRegistered) = 12;

-- 5 Retrieve employee names and contact information
SELECT
    e_name,
    e_phoneNumber,
    e_email
FROM
    `employee`
WHERE
    e_age > 24;

-- Aggregate Query
-- 1 Find the top 3 players who spent the most money on transactions in December
SELECT p.p_name, SUM(t.t_totalPrice) AS total_spent
FROM player p
JOIN transaction t ON p.p_ID = t.t_p_ID
WHERE MONTH(t.t_date) = 12
GROUP BY p.p_name
ORDER BY total_spent DESC
LIMIT 3;

-- 2 Show the most used game room by time
SELECT gr.gr_ID, gr.gr_type, SUM(TIMESTAMPDIFF(SECOND, rsc.rsc_time_in, rsc.rsc_time_out)) AS second_spent
FROM GameRoom gr
JOIN RoomShoppingCart rsc ON gr.gr_ID = rsc.rsc_gr_ID
GROUP BY gr.gr_ID, gr.gr_type
ORDER BY second_spent DESC
LIMIT 1;

-- 3 show the total revenue for each product type
SELECT
    productcatalog.pc_type,
    SUM(transaction.t_totalPrice) AS total_revenue
FROM
    productcatalog
LEFT JOIN
    productshoppingcart ON productcatalog.pc_ID = productshoppingcart.psc_pc_ID
LEFT JOIN
    transaction ON productshoppingcart.psc_pt_ID = transaction.t_ID
GROUP BY
    productcatalog.pc_type;


-- 4 Show employee with the highest number of transaction services
SELECT Employee.e_ID, Employee.e_name, COUNT(Transaction.t_ID) AS total_transaction
FROM Employee
JOIN Transaction ON Employee.e_ID = Transaction.t_e_ID
GROUP BY Employee.e_ID, Employee.e_name
ORDER BY total_transaction DESC
LIMIT 1;

-- Nested Query
-- 1 Retrieve members with a total point above the average
SELECT *
FROM membership
WHERE m_totalPoin > (SELECT AVG(m_totalPoin) FROM membership);

-- 2 Ryu Liam's friend, Ian Harris, wants to pay his transaction here. In December, there is a 10% discount, so his transactions are subject to the discount. Display the total price he needs to pay for all his transactions.
SELECT SUM(t_totalPrice * 0.9) AS totalTagihan FROM Transaction
WHERE t_p_ID = (
    SELECT p_ID FROM Player
    WHERE p_name = 'Ian Harris'
);

-- 3 Show the difference in income for November and October
SELECT
    NovemberIncome,
    DecemberIncome,
    DecemberIncome - NovemberIncome AS IncomeDifference
FROM (
    SELECT
        SUM(t_totalPrice) AS NovemberIncome
    FROM
        `transaction`
    WHERE
        MONTH(t_date) = 11
) AS NovemberData,
(
    SELECT
        SUM(t_totalPrice) AS DecemberIncome
    FROM
        `transaction`
    WHERE
        MONTH(t_date) = 12
) AS DecemberData;

-- The Final Query question
-- No 1

-- No 2

SELECT *
FROM CollectionCard
LEFT JOIN CollectionTransaction ON CollectionCard.cc_ID = CollectionTransaction.p1_cc_ID
WHERE CollectionTransaction.ct_isApproved IS NULL OR CollectionTransaction.ct_isApproved = 0;

SELECT cc_name, cc_ID, cc_name, cc_rarity, cc_series
FROM CollectionCard
LEFT JOIN CollectionTransaction ON CollectionCard.cc_ID = CollectionTransaction.p1_cc_ID
WHERE CollectionTransaction.ct_isApproved IS NULL OR CollectionTransaction.ct_isApproved = 0;