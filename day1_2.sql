-- Day 1, Part 2

-- Drop table 
DROP TABLE IF EXISTS DAY_1_2 CASCADE;

-- Create tbl 
CREATE TABLE IF NOT EXISTS DAY_1_2(
	VAL TEXT
);

-- seed tbl
COPY DAY_1_2(VAL)
FROM '/Users/joshbryden/Desktop/github/advent_of_code_2023/data/day1.csv'
DELIMITER ','
CSV
;

-- alter table to add all required cols

ALTER TABLE DAY_1_2
ADD COLUMN NUMBERS TEXT
;

ALTER TABLE DAY_1_2
ADD COLUMN FIRST TEXT
;

ALTER TABLE DAY_1_2
ADD COLUMN SECOND TEXT
;

ALTER TABLE DAY_1_2
ADD COLUMN TOTAL TEXT
;

-- set numbers to val, update numbered words to digits accordingly

UPDATE DAY_1_2
SET NUMBERS = val::text;

-- #1 
UPDATE DAY_1_2
SET NUMBERS = REPLACE(lower(NUMBERS::text),'one','1')
;

-- #2
UPDATE DAY_1_2
SET NUMBERS = REPLACE(lower(NUMBERS::text),'two','2')
;

-- #3
UPDATE DAY_1_2
SET NUMBERS = REPLACE(lower(NUMBERS::text),'three','3')
;

-- #4
UPDATE DAY_1_2
SET NUMBERS = REPLACE(lower(NUMBERS::text),'four','4')
;

-- #5
UPDATE DAY_1_2
SET NUMBERS = REPLACE(lower(NUMBERS::text),'five','5')
;

-- #6
UPDATE DAY_1_2
SET NUMBERS = REPLACE(lower(NUMBERS::text),'six','6')
;

-- #7
UPDATE DAY_1_2
SET NUMBERS = REPLACE(lower(NUMBERS::text),'seven','7')
;

-- #8
UPDATE DAY_1_2
SET NUMBERS = REPLACE(lower(NUMBERS::text),'eight','8')
;

-- #9
UPDATE DAY_1_2
SET NUMBERS = REPLACE(lower(NUMBERS::text),'nine','9')
;

-- #0
UPDATE DAY_1_2
SET NUMBERS = REPLACE(lower(NUMBERS::text),'zero','0')
;

-- extract all digits from NUMBERS
UPDATE DAY_1_2
SET NUMBERS = REGEXP_REPLACE(NUMBERS,'\D','','g') -- 'g' ensures all chars are removed, not just the first instance
;

-- extract first digit from NUMBERS & assign to FIRST
UPDATE DAY_1_2
SET FIRST = LEFT(NUMBERS,1)
;

-- extract 2nd digit and assign to SECOND
-- if LENGTH(NUMBERS) = 1 then no 2nd digit 
UPDATE DAY_1_2
SET SECOND = 
	CASE 
		WHEN LENGTH(NUMBERS) = 1
			THEN FIRST
		WHEN LENGTH(NUMBERS) > 1
			THEN RIGHT(NUMBERS,1)
	END
;

-- concat first and second digits
UPDATE DAY_1_2
SET TOTAL = CONCAT(FIRST::INT,  SECOND::INT)
;

-- get total 
SELECT SUM(TOTAL::INT) FROM DAY_1_2

-- ANSWER: 54,697