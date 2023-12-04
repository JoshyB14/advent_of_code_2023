-- Day 1, Part 1

-- Drop table 
DROP TABLE IF EXISTS DAY_1_1 CASCADE;

-- Create tbl 
CREATE TABLE IF NOT EXISTS DAY_1_1(
	VAL TEXT
);

-- seed tbl
COPY DAY_1_1(VAL)
FROM '/Users/joshbryden/Desktop/github/advent_of_code_2023/data/day1.csv'
DELIMITER ','
CSV
;

-- alter table to add all required cols

ALTER TABLE DAY_1_1
ADD COLUMN NUMBERS TEXT
;

ALTER TABLE DAY_1_1
ADD COLUMN FIRST TEXT
;

ALTER TABLE DAY_1_1
ADD COLUMN SECOND TEXT
;

ALTER TABLE DAY_1_1
ADD COLUMN TOTAL TEXT
;

-- extract all digits from val and assign to NUMBERS
UPDATE DAY_1_1
SET NUMBERS = REGEXP_REPLACE(val,'\D','','g') -- 'g' ensures all chars are removed, not just the first instance
;

-- extract first digit from NUMBERS & assign to FIRST
UPDATE DAY_1_1
SET FIRST = LEFT(NUMBERS,1)
;

-- extract 2nd digit and assign to SECOND
-- if LENGTH(NUMBERS) = 1 then no 2nd digit 
UPDATE DAY_1_1
SET SECOND = 
	CASE 
		WHEN LENGTH(NUMBERS) = 1
			THEN FIRST
		WHEN LENGTH(NUMBERS) > 1
			THEN RIGHT(NUMBERS,1)
	END
;

-- concat first and second digits
UPDATE DAY_1_1
SET TOTAL = CONCAT(FIRST::INT,  SECOND::INT)
;

-- get total 
SELECT SUM(TOTAL::INT) FROM DAY_1_1 

-- ANSWER: 54,697




