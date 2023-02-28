CREATE TABLE table1
(id INT, field2 VARCHAR, field3 VARCHAR, field4 VARCHAR);

CREATE TABLE table2
(id INT, field2 VARCHAR, field3 VARCHAR, field4 VARCHAR);

INSERT INTO table1 VALUES (1, 'rec_A1.1', 'rec_A1.2', 'rec_A1.3'), (2, 'rec_A2.1', 'rec_A2.2', 'rec_A2.3'), (3, 'rec_A3.1', 'rec_A3.2', 'rec_A3.3'), (4, 'rec_A4.1', 'rec_A4.2', 'rec_A4.3');
INSERT INTO table2 VALUES (1, 'rec_B1.1', 'rec_B1.2', 'rec_B1.3'), (2, 'rec_B2.1', 'rec_B2.2', 'rec_B2.3'), (3, 'rec_B3.1', 'rec_B3.2', 'rec_B3.3'), (4, 'rec_B4.1', 'rec_B4.2', 'rec_B4.3');

SELECT * FROM table1
INNER JOIN table2
ON table1.id <> table2.id;

