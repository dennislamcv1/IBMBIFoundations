SELECT C.NAME_OF_SCHOOL, C.COMMUNITY_AREA_NAME, C.AVERAGE_STUDENT_ATTENDANCE
FROM SCHOOLS AS C
LEFT JOIN CENSUS_DATA AS COM ON C.COMMUNITY_AREA_NUMBER = COM.COMMUNITY_AREA_NUMBER
WHERE HARDSHIP_INDEX = 98;

SELECT CH.CASE_NUMBER, CH.PRIMARY_TYPE, COM.COMMUNITY_AREA_NAME
FROM CHICAGO_CRIME_DATA AS CH LEFT JOIN CENSUS_DATA AS COM ON 
CH.COMMUNITY_AREA_NUMBER = COM.COMMUNITY_AREA_NUMBER
WHERE CH.LOCATION_DESCRIPTION LIKE '%SCHOOL%';

CREATE VIEW CHICAGO_SCHOOLS(School_Name, Safety_Rating, Family_Rating, 
Environment_Rating, Instruction_Rating, Leaders_Rating, Teachers_Rating)
as select "NAME_OF_SCHOOL", "Safety_Icon", "Family_Involvement_Icon", "Environment_Icon",
"Instruction_Icon", "Leaders_Icon", "Teachers_Icon"
from SCHOOLS;

SELECT * FROM CHICAGO_SCHOOLS;

SELECT School_Name, Leaders_Rating FROM CHICAGO_SCHOOLS;

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE ( 
    IN in_School_ID INTEGER, IN in_Leader_Score INTEGER    )
LANGUAGE SQL                                               
BEGIN

END 
@

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE ( 
    IN in_School_ID INTEGER, IN in_Leader_Score INTEGER    )
LANGUAGE SQL                                               
BEGIN
UPDATE SCHOOLS
SET "Leaders_Score" = in_Leader_Score
WHERE "School_ID" = in_School_ID;

END 
@

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE ( 
    IN in_School_ID INTEGER, IN in_Leader_Score INTEGER    )
LANGUAGE SQL                                               
BEGIN
UPDATE SCHOOLS
SET "Leaders_Score" = in_Leader_Score
WHERE "School_ID" = in_School_ID;

IF  in_Leader_Score > 0 AND  in_Leader_Score < 20 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Very Weak';
ELSEIF in_Leader_Score < 40 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Weak';
ELSEIF in_Leader_Score < 60 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Average';
ELSEIF in_Leader_Score < 80 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Strong';
ELSEIF in_Leader_Score < 100 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Very Strong';
END IF;

END 
@

call UPDATE_LEADERS_SCORE(609705, 95);
 
 SELECT "School_ID", "Leaders_Icon" from SCHOOLS 
 WHERE "School_ID" = 609705;
 
  --#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE ( 
    IN in_School_ID INTEGER, IN in_Leader_Score INTEGER    )
LANGUAGE SQL                                               
BEGIN
UPDATE SCHOOLS
SET "Leaders_Score" = in_Leader_Score
WHERE "School_ID" = in_School_ID;

IF  in_Leader_Score > 0 AND  in_Leader_Score < 20 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Very Weak';
ELSEIF in_Leader_Score < 40 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Weak';
ELSEIF in_Leader_Score < 60 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Average';
ELSEIF in_Leader_Score < 80 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Strong';
ELSEIF in_Leader_Score < 100 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Very Strong';
ELSE
ROLLBACK WORK;
END IF;

END 
@

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE ( 
    IN in_School_ID INTEGER, IN in_Leader_Score INTEGER    )
LANGUAGE SQL                                               
BEGIN
UPDATE SCHOOLS
SET "Leaders_Score" = in_Leader_Score
WHERE "School_ID" = in_School_ID;

IF  in_Leader_Score > 0 AND  in_Leader_Score < 20 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Very Weak';
ELSEIF in_Leader_Score < 40 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Weak';
ELSEIF in_Leader_Score < 60 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Average';
ELSEIF in_Leader_Score < 80 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Strong';
ELSEIF in_Leader_Score < 100 THEN
UPDATE SCHOOLS
SET "Leaders_Icon" = 'Very Strong';
ELSE
ROLLBACK WORK;
END IF;
COMMIT WORK;

END 
@

call UPDATE_LEADERS_SCORE(609705, 38);
 
 SELECT "School_ID", "Leaders_Icon" from SCHOOLS 
 WHERE "School_ID" = 609705;

call UPDATE_LEADERS_SCORE(609705, 101);
 
 SELECT "School_ID", "Leaders_Icon" from SCHOOLS 
 WHERE "School_ID" = 609705;



