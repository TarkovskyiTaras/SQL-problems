-- Left outer join test:

CREATE TABLE girls
(
    girl_id INTEGER,
    girl VARCHAR,
    toy_id INTEGER
);

CREATE TABLE toys
(
    toy_id INTEGER,
    toy VARCHAR
);

INSERT INTO girls VALUES (1, 'Jane', 3), (2, 'Sally', 4), (3, 'Cindy', 1), (4, 'Emma', 5), (5, 'Scarlet', 1);

INSERT INTO toys VALUES (1, 'hula hoop'), (2, 'balsa glider'), (3, 'toy soldier'), (4, 'harmonica'), (5, 'baseball cards'), (6, 'tinker toys'), (7, 'etch-a-sketch'), (8, 'slinky');

SELECT girls.girl, toys.toy
FROM girls
LEFT OUTER JOIN toys
ON girls.toy_id = toys.toy_id;

SELECT toys.toy, girls.girl
FROM toys
INNER JOIN girls
ON girls.toy_id = toys.toy_id;

INSERT INTO girls VALUES (6, 'Jane', 5), (7, 'Jane', 4);

-- Self join example:

CREATE TABLE clown_info (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    boss_id INTEGER REFERENCES clown_info (id)
);
INSERT INTO clown_info VALUES (1, 'Elsie', 3), (2, 'Pickles', 5), (3, 'Snuggles', 10), (4, 'Mr. Hobo', 3), (5, 'Clarabelle', 10),
(6, 'Scooter', 3), (7, 'Zippo', 3), (8, 'Babe', 5), (9, 'Bonzo', 5), (10, 'Mister Sniffles', 10);

SELECT clown_info1.id, clown_info1.name AS clown, clown_info2.name AS boss
FROM clown_info AS clown_info1
INNER JOIN clown_info AS clown_info2
ON clown_info1.boss_id = clown_info2.id;             --order here matters. test why later.

SELECT c1.id, c1.name AS clown, c2.name AS boss
FROM clown_info AS c2
INNER JOIN clown_info AS c1
ON c1.boss_id = c2.id;

SELECT c1.id, c1.name AS clown, c2.name AS boss
FROM clown_info AS c1
RIGHT OUTER JOIN clown_info AS c2
ON c1.id = c2.boss_id;                               --order here matters. test why later.

SELECT c1.id, c1.name AS clown, c2.name AS boss
FROM clown_info AS c1, clown_info AS c2
WHERE c1.boss_id = c2.id;

-- inner join example:

DROP TABLE boys;
CREATE TABLE boys (boy_id INTEGER DEFAULT NULL, boy VARCHAR(20) DEFAULT NULL, toy_id INTEGER DEFAULT NULL);
INSERT INTO boys VALUES (1 ,'Davey', 3), (2, 'Bobby', 5), (3, 'Beaver', 2), (4, 'Richie', 1), (5, 'Billy', 2), (6, 'Johnny', 4);

DROP TABLE toys;
CREATE TABLE toys (toy_id INTEGER, toy VARCHAR);
INSERT INTO toys VALUES (1, 'hula hoop'), (2, 'balsa glider'), (3, 'toy soldier'), (4, 'harmonica'), (5, 'baseball cards'), (6, 'tinker toys'), (7, 'etch-a-sketch'), (8, 'slinky');

SELECT boys.boy, toys.toy FROM boys
INNER JOIN toys
ON toys.toy_id = boys.toy_id;                        -- order here doesn't matter

-- union example:
SELECT c.name, d.department_name, cn.country_name
FROM clown_info AS c, departments AS d, countries AS cn; -- works as some kind of a join, not just 3 separate columns

-- indexes:
CREATE INDEX last_name_idx ON employees (last_name);
DROP INDEX last_name_idx;
