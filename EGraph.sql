USE MASTER
GO
DROP DATABASE IF EXISTS EGraph
GO
CREATE DATABASE EGraph
GO
USE EGraph
GO

-- Создание таблицы Продавец
CREATE TABLE Sellers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
) AS NODE;

-- Создание таблицы Товар
CREATE TABLE Products (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
) AS NODE;

-- Создание таблицы Покупатель
CREATE TABLE Buyers (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    shipping_address TEXT,
) AS NODE;

-- Заполнение таблицы Продавец
INSERT INTO Sellers (id, name, description) VALUES
(1, 'ООО "Магазин Электроники"', 'Продажа электроники и бытовой техники'),
(2, 'ИП Иванов', 'Продажа одежды и аксессуаров'),
(3, 'ООО "Мебельный Дом"', 'Продажа мебели и товаров для дома'),
(4, 'ИП Петров', 'Продажа спортивных товаров'),
(5, 'ООО "Книжный Мир"', 'Продажа книг и учебников'),
(6, 'ИП Сидорова', 'Продажа косметики и парфюмерии'),
(7, 'ООО "Автомир"', 'Продажа автозапчастей и автомобильных аксессуаров'),
(8, 'ИП Смирнов', 'Продажа продуктов питания и напитков'),
(9, 'ООО "Спецтехника"', 'Продажа строительной и сельскохозяйственной техники'),
(10, 'ИП Васильева', 'Продажа товаров для детей и игрушек');

-- Заполнение таблицы Товар
INSERT INTO Products (id, name, description, price) VALUES
(1, 'Смартфон Samsung Galaxy S20', 'Смартфон с камерой 64 МП и экраном 6.2 дюйма', 799.99),
(2, 'Футболка Adidas', 'Футболка из 100% хлопка', 29.99),
(3, 'Диван "Мягкий уголок"', 'Диван с тканевой обивкой и удобными подушками', 899.00),
(4, 'Беговая дорожка NordicTrack', 'Электрическая беговая дорожка для домашнего использования', 1299.99),
(5, 'Книга "Война и мир"', 'Роман Льва Толстого', 19.99),
(6, 'Тушь Maybelline New York', 'Тушь для ресниц с удлиняющим эффектом', 9.99),
(7, 'Фаркоп на Toyota RAV4', 'Съемный фаркоп с установкой', 199.00),
(8, 'Молоко "Простоквашино"', 'Пастеризованное молоко 3.2%', 1.99),
(9, 'Экскаватор JCB', 'Спецтехника для строительных работ', 59999.00),
(10, 'Конструктор LEGO', 'Набор для сборки различных моделей', 49.99);

-- Заполнение таблицы Покупатель
INSERT INTO Buyers (id, name, last_name, shipping_address) VALUES
(1, 'Иван', 'Петров', 'ул. Ленина, д. 10, кв. 5'),
(2, 'Мария', 'Сидорова', 'ул. Пушкина, д. 20, кв. 15'),
(3, 'Алексей', 'Иванов', 'пр. Гагарина, д. 5, кв. 3'),
(4, 'Елена', 'Смирнова', 'ул. Московская, д. 15, кв. 8'),
(5, 'Дмитрий', 'Кузнецов', 'пр. Ленинградский, д. 3, кв. 12'),
(6, 'Ольга', 'Николаева', 'ул. Парковая, д. 25, кв. 6'),
(7, 'Андрей', 'Васильев', 'пр. Октябрьский, д. 8, кв. 21'),
(8, 'Анастасия', 'Егорова', 'ул. Советская, д. 12, кв. 7'),
(9, 'Сергей', 'Павлов', 'ул. Фрунзе, д. 30, кв. 9'),
(10, 'Евгения', 'Михайлова', 'пр. Кирова, д. 40, кв. 18');


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
	AND S1.name = 'ООО "Магазин Электроники"';

SELECT S.name, P.name
FROM Sellers AS S
	, Selling Ss
	, Products AS P
WHERE MATCH(S-(Ss)->P)
	AND S.name = 'ООО "Магазин Электроники"';

	SELECT S.name, P.name
FROM Sellers AS S
	, Selling Ss
	, Products AS P
WHERE MATCH(S-(Ss)->P)
	AND P.name = 'Футболка Adidas';

SELECT B.name, P.name
FROM Buyers AS B
	, Buying Bg
	, Products AS P
WHERE MATCH(B-(Bg)->P)
	AND B.name = 'Иван';

	SELECT B.name, P.name
FROM Buyers AS B
	, Buying Bg
	, Products AS P
WHERE MATCH(B-(Bg)->P)
	AND P.name = 'Футболка Adidas';

	SELECT S1.name
 , STRING_AGG(S2.name, '->') WITHIN GROUP (GRAPH PATH)
AS Coopers
FROM Sellers AS S1
 , Working FOR PATH AS w
 , Sellers FOR PATH AS S2
WHERE MATCH(SHORTEST_PATH(S1(-(w)->S2)+))
 AND S1.name = 'ООО "Магазин Электроники"';

 	SELECT S1.name
 , STRING_AGG(S2.name, '->') WITHIN GROUP (GRAPH PATH)
AS Coopers
FROM Sellers AS S1
 , Working FOR PATH AS w
 , Sellers FOR PATH AS S2
WHERE MATCH(SHORTEST_PATH(S1(-(w)->S2){1,3}))
 AND S1.name = 'ООО "Магазин Электроники"';

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