-- Name- Natnael Mengistu
-- CMPT 308

-- 1) func1on PreReqsFor(courseNum) - Returns the immediate prerequisites for the
-- passed-in course number.

CREATE OR REPLACE FUNCTION  PreReqsFor(int, REFCURSOR) returns refcursor AS
$$

      DECLARE
courseNum int    := $1;
resultset REFCURSOR    := $2; 

BEGIN
OPEN resultset FOR
           SELECT courses.num ,Prerequisites.PreReqNum
           FROM Prerequisites , Courses
           WHERE courses.num = Prerequisites.courseNum
           AND courses.num = courseNum;

RETURN resultset;

END;
$$
LANGUAGE plpgsql;

 -- 2)  func1on IsPreReqFor(courseNum) - Returns the courses for which the passed-in course
-- number is an immediate pre-requisite.

CREATE OR REPLACE function IsPreReqsFor(int, REFCURSOR) returns refcursor AS
$$
DECLARE
	PreReqNum int       := $1;
	resultset   REFCURSOR := $2;
BEGIN
OPEN resultset FOR
	SELECT courses.num ,Prerequisites.PreReqNum
	FROM Prerequisites , Courses
	WHERE courses.num = Prerequisites.CourseNum
	AND courses.num = PreReqNum;
RETURN resultset;

END;
$$
LANGUAGE plpgsql;
