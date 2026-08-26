SELECT * FROM price_history WHERE PRODUCT_NAME='Μεβγάλ Στραγγιστό Γιαούρτι 1κιλ';
-- DELETE FROM PRICE_HISTORY WHERE PRICE_RECORD_ID=1585;
SELECT * FROM price_in_store  WHERE PRODUCT_NAME='Μεβγάλ Στραγγιστό Γιαούρτι 1κιλ';
-- DELETE FROM DISCOUNT;

SELECT COUNT(*) FROM DISCOUNT WHERE discount_STORE_ID=17;
SELECT MAX(PRICE_RECORD_DATE) FROM price_history WHERE PRODUCT_NAME = 'Μεβγάλ Στραγγιστό Γιαούρτι 1κιλ';
SELECT PRICE_RECORD_PRICE INTO @Last_Price FROM price_history where PRICE_RECORD_DATE=(SELECT MAX(PRICE_RECORD_DATE) FROM price_history WHERE PRODUCT_NAME = 'Μεβγάλ Στραγγιστό Γιαούρτι 1κιλ') and PRODUCT_NAME = 'Μεβγάλ Στραγγιστό Γιαούρτι 1κιλ';
SELECT * FROM product;

select @Last_Price;

-- DELETE FROM DISCOUNT WHERE DISCOUNT_ID=89;
SELECT * FROM DISCOUNT WHERE DISCOUNT_PRODUCT_NAME='Μεβγάλ Στραγγιστό Γιαούρτι 1κιλ';