USE MASTER
GO
DROP DATABASE IF EXISTS EGraph
GO
CREATE DATABASE EGraph
GO
USE EGraph
GO

-- �������� ������� ��������
CREATE TABLE Sellers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
) AS NODE;

-- �������� ������� �����
CREATE TABLE Products (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
) AS NODE;

-- �������� ������� ����������
CREATE TABLE Buyers (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    shipping_address TEXT,
) AS NODE;

-- ���������� ������� ��������
INSERT INTO Sellers (id, name, description) VALUES
(1, '��� "������� �����������"', '������� ����������� � ������� �������'),
(2, '�� ������', '������� ������ � �����������'),
(3, '��� "��������� ���"', '������� ������ � ������� ��� ����'),
(4, '�� ������', '������� ���������� �������'),
(5, '��� "������� ���"', '������� ���� � ���������'),
(6, '�� ��������', '������� ��������� � ����������'),
(7, '��� "�������"', '������� ������������� � ������������� �����������'),
(8, '�� �������', '������� ��������� ������� � ��������'),
(9, '��� "�����������"', '������� ������������ � �������������������� �������'),
(10, '�� ���������', '������� ������� ��� ����� � �������');

-- ���������� ������� �����
INSERT INTO Products (id, name, description, price) VALUES
(1, '�������� Samsung Galaxy S20', '�������� � ������� 64 �� � ������� 6.2 �����', 799.99),
(2, '�������� Adidas', '�������� �� 100% ������', 29.99),
(3, '����� "������ ������"', '����� � �������� ������� � �������� ���������', 899.00),
(4, '������� ������� NordicTrack', '������������� ������� ������� ��� ��������� �������������', 1299.99),
(5, '����� "����� � ���"', '����� ���� ��������', 19.99),
(6, '���� Maybelline New York', '���� ��� ������ � ���������� ��������', 9.99),
(7, '������ �� Toyota RAV4', '������� ������ � ����������', 199.00),
(8, '������ "�������������"', '��������������� ������ 3.2%', 1.99),
(9, '���������� JCB', '����������� ��� ������������ �����', 59999.00),
(10, '����������� LEGO', '����� ��� ������ ��������� �������', 49.99);

-- ���������� ������� ����������
INSERT INTO Buyers (id, name, last_name, shipping_address) VALUES
(1, '����', '������', '��. ������, �. 10, ��. 5'),
(2, '�����', '��������', '��. �������, �. 20, ��. 15'),
(3, '�������', '������', '��. ��������, �. 5, ��. 3'),
(4, '�����', '��������', '��. ����������, �. 15, ��. 8'),
(5, '�������', '��������', '��. �������������, �. 3, ��. 12'),
(6, '�����', '���������', '��. ��������, �. 25, ��. 6'),
(7, '������', '��������', '��. �����������, �. 8, ��. 21'),
(8, '���������', '�������', '��. ���������, �. 12, ��. 7'),
(9, '������', '������', '��. ������, �. 30, ��. 9'),
(10, '�������', '���������', '��. ������, �. 40, ��. 18');


CREATE TABLE Buying ([time] DATETIME) AS EDGE;

CREATE TABLE Selling AS EDGE;

CREATE TABLE Working AS EDGE;

	INSERT INTO Buying ($from_id, $to_id, [time])
VALUES ((SELECT $node_id FROM Buyers WHERE ID = 1),
 (SELECT $node_id FROM Products WHERE ID = 6), '2021-09-10 09:45:00'),
 ((SELECT $node_id FROM Buyers WHERE ID = 5),
 (SELECT $node_id FROM Products WHERE ID = 1), '2021-09-05 09:45:00'),
 ((SELECT $node_id FROM Buyers WHERE ID = 8),
 (SELECT $node_id FROM Products WHERE ID = 7), '2021-09-10 09:45:00'),
 ((SELECT $node_id FROM Buyers WHERE ID = 2),
 (SELECT $node_id FROM Products WHERE ID = 2), '2021-10-05 09:45:00'),
 ((SELECT $node_id FROM Buyers WHERE ID = 3),
 (SELECT $node_id FROM Products WHERE ID = 5), '2021-10-10 09:45:00'),
 ((SELECT $node_id FROM Buyers WHERE ID = 4),
 (SELECT $node_id FROM Products WHERE ID = 3), '2021-10-05 09:45:00'),
 ((SELECT $node_id FROM Buyers WHERE ID = 6),
 (SELECT $node_id FROM Products WHERE ID = 4), '2021-10-10 09:45:00'),
 ((SELECT $node_id FROM Buyers WHERE ID = 7),
 (SELECT $node_id FROM Products WHERE ID = 2), '2021-10-05 09:45:00'),
 ((SELECT $node_id FROM Buyers WHERE ID = 1),
 (SELECT $node_id FROM Products WHERE ID = 9), '2021-10-10 09:45:00'),
 ((SELECT $node_id FROM Buyers WHERE ID = 9),
 (SELECT $node_id FROM Products WHERE ID = 8), '2021-11-05 09:45:00'),
 ((SELECT $node_id FROM Buyers WHERE ID = 10),
 (SELECT $node_id FROM Products WHERE ID = 10), '2021-11-10 09:45:00');

 INSERT INTO Selling ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Sellers WHERE ID = 1),
 (SELECT $node_id FROM Products WHERE ID = 6)),
 ((SELECT $node_id FROM Sellers WHERE ID = 5),
 (SELECT $node_id FROM Products WHERE ID = 1)),
 ((SELECT $node_id FROM Sellers WHERE ID = 8),
 (SELECT $node_id FROM Products WHERE ID = 7)),
 ((SELECT $node_id FROM Sellers WHERE ID = 2),
 (SELECT $node_id FROM Products WHERE ID = 2)),
 ((SELECT $node_id FROM Sellers WHERE ID = 3),
 (SELECT $node_id FROM Products WHERE ID = 5)),
 ((SELECT $node_id FROM Sellers WHERE ID = 4),
 (SELECT $node_id FROM Products WHERE ID = 3)),
 ((SELECT $node_id FROM Sellers WHERE ID = 6),
 (SELECT $node_id FROM Products WHERE ID = 4)),
 ((SELECT $node_id FROM Sellers WHERE ID = 7),
 (SELECT $node_id FROM Products WHERE ID = 2)),
 ((SELECT $node_id FROM Sellers WHERE ID = 1),
 (SELECT $node_id FROM Products WHERE ID = 9)),
 ((SELECT $node_id FROM Sellers WHERE ID = 9),
 (SELECT $node_id FROM Products WHERE ID = 8)),
 ((SELECT $node_id FROM Sellers WHERE ID = 10),
 (SELECT $node_id FROM Products WHERE ID = 10));

 INSERT INTO Working ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Sellers WHERE ID = 1),
 (SELECT $node_id FROM Sellers WHERE ID = 6)),
 ((SELECT $node_id FROM Sellers WHERE ID = 5),
 (SELECT $node_id FROM Sellers WHERE ID = 1)),
 ((SELECT $node_id FROM Sellers WHERE ID = 8),
 (SELECT $node_id FROM Sellers WHERE ID = 7)),
 ((SELECT $node_id FROM Sellers WHERE ID = 2),
 (SELECT $node_id FROM Sellers WHERE ID = 4)),
 ((SELECT $node_id FROM Sellers WHERE ID = 3),
 (SELECT $node_id FROM Sellers WHERE ID = 5)),
 ((SELECT $node_id FROM Sellers WHERE ID = 4),
 (SELECT $node_id FROM Sellers WHERE ID = 3)),
 ((SELECT $node_id FROM Sellers WHERE ID = 6),
 (SELECT $node_id FROM Sellers WHERE ID = 4)),
 ((SELECT $node_id FROM Sellers WHERE ID = 7),
 (SELECT $node_id FROM Sellers WHERE ID = 2)),
 ((SELECT $node_id FROM Sellers WHERE ID = 1),
 (SELECT $node_id FROM Sellers WHERE ID = 9)),
 ((SELECT $node_id FROM Sellers WHERE ID = 9),
 (SELECT $node_id FROM Sellers WHERE ID = 8)),
 ((SELECT $node_id FROM Sellers WHERE ID = 10),
 (SELECT $node_id FROM Sellers WHERE ID = 9));

SELECT S1.name, S2.name
FROM Sellers AS S1
	, Working
	, Sellers AS S2
WHERE MATCH(S1-(Working)->S2)
	AND S1.name = '��� "������� �����������"';

SELECT S.name, P.name
FROM Sellers AS S
	, Selling Ss
	, Products AS P
WHERE MATCH(S-(Ss)->P)
	AND S.name = '��� "������� �����������"';

	SELECT S.name, P.name
FROM Sellers AS S
	, Selling Ss
	, Products AS P
WHERE MATCH(S-(Ss)->P)
	AND P.name = '�������� Adidas';

SELECT B.name, P.name
FROM Buyers AS B
	, Buying Bg
	, Products AS P
WHERE MATCH(B-(Bg)->P)
	AND B.name = '����';

	SELECT B.name, P.name
FROM Buyers AS B
	, Buying Bg
	, Products AS P
WHERE MATCH(B-(Bg)->P)
	AND P.name = '�������� Adidas';

	SELECT S1.name
 , STRING_AGG(S2.name, '->') WITHIN GROUP (GRAPH PATH)
AS Coopers
FROM Sellers AS S1
 , Working FOR PATH AS w
 , Sellers FOR PATH AS S2
WHERE MATCH(SHORTEST_PATH(S1(-(w)->S2)+))
 AND S1.name = '��� "������� �����������"';

 	SELECT S1.name
 , STRING_AGG(S2.name, '->') WITHIN GROUP (GRAPH PATH)
AS Coopers
FROM Sellers AS S1
 , Working FOR PATH AS w
 , Sellers FOR PATH AS S2
WHERE MATCH(SHORTEST_PATH(S1(-(w)->S2){1,3}))
 AND S1.name = '��� "������� �����������"';

  SELECT S1.id AS IdFirst
	, S1.name AS First
	, CONCAT(N'seller (', S1.id, ')') AS [First image name]
	, S2.id AS IdSecond
	, S2.name AS Second
	, CONCAT(N'seller (', S2.id, ')') AS [Second image name]
FROM Sellers AS S1
	, Working
	, Sellers AS S2
WHERE MATCH(S1-(Working)->S2)

 SELECT S.id AS IdFirst
	, S.name AS First
	, CONCAT(N'seller (', S.id, ')') AS [First image name]
	, P.id AS IdSecond
	, P.name AS Second
	, CONCAT(N'product (', P.id, ')') AS [Second image name]
FROM Sellers AS S
	, Selling Ss
	, Products AS P
WHERE MATCH(S-(Ss)->P);

 SELECT B.id AS IdFirst
	, B.name AS First
	, CONCAT(N'buyer (', B.id, ')') AS [First image name]
	, P.id AS IdSecond
	, P.name AS Second
	, CONCAT(N'product (', P.id, ')') AS [Second image name]
FROM Buyers AS B
	, Buying Bg
	, Products AS P
WHERE MATCH(B-(Bg)->P)

select @@servername