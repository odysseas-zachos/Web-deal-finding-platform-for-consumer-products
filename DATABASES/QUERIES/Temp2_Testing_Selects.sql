SELECT * FROM STORE;
SELECT * FROM USER;
select * from product;
SELECT * FROM price_in_store WHERE PRODUCT_NAME='Μεβγάλ Στραγγιστό Γιαούρτι 1κιλ';

select * from discount;-- GROUP BY DISCOUNT_PRODUCT_NAME;

select count(*), DISCOUNT_STORE_ID from discount group by DISCOUNT_STORE_ID;

SELECT * FROM price_history GROUP BY PRODUCT_NAME;