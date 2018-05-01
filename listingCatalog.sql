CREATE VIEW catalog AS
SELECT e.entity_id, e.sku,
( SELECT value FROM catalog_product_entity_varchar AS `e_var_titre` WHERE `e_var_titre`.`entity_id` = `e`.`entity_id` AND `e_var_titre`.attribute_id = 60 ) AS titre,
( SELECT CONCAT('http://www.xxxxxxxxxx.com/', value, '.html')  FROM catalog_product_entity_varchar AS `e_var_url` WHERE `e_var_url`.`entity_id` = `e`.`entity_id` AND `e_var_url`.attribute_id IN (SELECT attribute_id FROM eav_attribute AS `ea` WHERE attribute_code = 'url_key' AND `entity_type_id` = 4) AND `e_var_url`.store_id = 0) AS url,
( SELECT e_dec_price.value FROM `catalog_product_entity_decimal` AS `e_dec_price` WHERE `e_dec_price`.`entity_id` = `e`.`entity_id` AND `e_dec_price`.attribute_id = 64 ) as 'price', 
( SELECT `e_dec_spec_price`.value FROM `catalog_product_entity_decimal` AS `e_dec_spec_price` WHERE `e_dec_spec_price`.`entity_id` = `e`.`entity_id` AND `e_dec_spec_price`.attribute_id = 65) as 'special_price' ,
( SELECT CONCAT('http://media.xxxxxxxxxx.com/catalog/product',e_var_image.value) FROM `catalog_product_entity_varchar` AS `e_var_image` WHERE `e_var_image`.`entity_id` = `e`.`entity_id` AND `e_var_image`.`store_id` = 0 AND  `e_var_image`.attribute_id = 74) AS image,
(SELECT GROUP_CONCAT(CONCAT('http://media.xxxxxxxxxx.com/catalog/product',e_mg_gallery.value)) FROM `catalog_product_entity_media_gallery` AS `e_mg_gallery` WHERE `e_mg_gallery`.`entity_id` = `e`.`entity_id` AND `e_mg_gallery`.attribute_id = 77  GROUP BY `e_mg_gallery`.`entity_id`
) AS images_supp,
  e.type_id as 'type', e.created_at, e.updated_at  FROM `catalog_product_entity` AS `e`
 LEFT JOIN  `catalog_product_entity_int` AS `e_int_status` ON (`e_int_status`.`entity_id` = `e`.`entity_id` AND `e_int_status`.attribute_id = 84 AND `e_int_status`.value )
 limit 300
