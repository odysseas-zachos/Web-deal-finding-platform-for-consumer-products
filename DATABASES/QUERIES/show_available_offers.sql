use web_db;
select store_geojson.name, discount.discount_id, discount.discount_date, discount.discount_product_name, discount.new_price, discount.discount_likes, discount.discount_dislikes from discount
inner join store on DISCOUNT.DISCOUNT_STORE_ID = STORE.ID
inner join store_geojson on STORE.STORE_GEOJSON_ID = STORE_GEOJSON.ID
where discount.discount_availibility=1;

select * from categories;