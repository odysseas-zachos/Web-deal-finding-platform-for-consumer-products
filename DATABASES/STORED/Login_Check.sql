USE WEB_DB;

DELIMITER $
DROP PROCEDURE IF EXISTS Logincheck$
CREATE PROCEDURE Logincheck (IN v_username VARCHAR(25), IN v_password VARCHAR(25), OUT check_bit TINYINT)
BEGIN

SET check_bit=0; -- 1 for Success, 0 else

-- SELECT COUNT(*) FROM `USER` WHERE username = v_username AND password = v_password; -- Returns Count Of Users With Username and Password Same as the Parameters Must Be 1 for Success
IF ( (SELECT COUNT(*) FROM `USER` WHERE username = v_username AND password = v_password) = 1 ) THEN
	-- SELECT 'WELCOME' AS RESULT;
	SET check_bit = 1;
-- ELSE
	-- SELECT 'Invalid data given, please try again' AS RESULT;
END IF;
-- SELECT CHECK_BIT;    
END$

DELIMITER ;


CALL Logincheck ('KonParas' , '123456@TR', @VAR); -- Test
-- SELECT * FROM USER;
SELECT @VAR;