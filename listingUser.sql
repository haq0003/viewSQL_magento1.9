SELECT `c`.`entity_id`, `email`, 

(SELECT subscriber_status FROM newsletter_subscriber WHERE customer_id = `e`.`entity_id`) as subscriber_status,

(SELECT customer_group_code FROM customer_group WHERE `c`.`group_id` = customer_group.customer_group_id ) AS customer_group_code,

(SELECT value FROM customer_entity_int AS `cevpr` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute AS `ea` WHERE attribute_code = 'gender' AND `entity_type_id` = 1) AND `cevpr`.entity_id = `c`.entity_id ) AS gender,

(SELECT value FROM customer_entity_varchar AS `cevpr` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute AS `ea` WHERE attribute_code = 'prefix' AND `entity_type_id` = 1) AND `cevpr`.entity_id = `c`.entity_id ) AS prefix,

(SELECT value FROM customer_entity_varchar AS `cevfr` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute AS `ea` WHERE attribute_code = 'firstname'  AND `entity_type_id` = 1) AND `cevfr`.entity_id = `c`.entity_id ) AS fisrtname,

(SELECT value FROM customer_entity_varchar AS `cevfa` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute AS `ea` WHERE attribute_code = 'lastname'  AND `entity_type_id` = 1) AND `cevfa`.entity_id = `c`.entity_id ) AS lastname,

(SELECT value FROM customer_entity_datetime AS `ceddo` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute AS `ea` WHERE attribute_code = 'dob'  AND `entity_type_id` = 1) AND `ceddo`.entity_id = `c`.entity_id ) AS dateofbird,

(SELECT value FROM customer_entity_varchar AS `cevta` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute AS `ea` WHERE attribute_code = 'taxvat'  AND `entity_type_id` = 1) AND `cevta`.entity_id = `c`.entity_id ) AS taxvat,

(SELECT value FROM customer_entity_varchar AS `cevsi` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute AS `ea` WHERE attribute_code = 'siret'  AND `entity_type_id` = 1) AND `cevsi`.entity_id = `c`.entity_id ) AS siret,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'company'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceib`.`value` ) AS billing_company,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'telephone'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceib`.`value` ) AS billing_phone,

(SELECT value FROM customer_address_entity_text AS `caet` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'street'  AND `entity_type_id` = 2) AND `caet`.entity_id = `ceib`.`value` ) AS billing_street,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'city'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceib`.`value` ) AS billing_city,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'country_id'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceib`.`value` ) AS billing_country,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'postcode'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceib`.`value` ) AS billing_postcode,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'fax'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceib`.`value` ) AS billing_fax,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'company'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceis`.`value` ) AS shipping_company,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'telephone'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceis`.`value` ) AS shipping_phone,

(SELECT value FROM customer_address_entity_text AS `caet` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'street'  AND `entity_type_id` = 2) AND `caet`.entity_id = `ceis`.`value` ) AS shipping_street,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'city'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceis`.`value` ) AS shipping_city,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'country_id'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceis`.`value` ) AS shipping_country,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'postcode'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceis`.`value` ) AS shipping_postcode,

(SELECT value FROM customer_address_entity_varchar AS `caev` WHERE attribute_id IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'fax'  AND `entity_type_id` = 2) AND `caev`.entity_id = `ceis`.`value` ) AS shipping_fax,

`created_at`, `updated_at` 

FROM `customer_entity` as `c` 

 LEFT JOIN  `customer_entity_int` AS `ceib` ON (`ceib`.`entity_id` = `c`.`entity_id` AND `ceib`.attribute_id  IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'default_billing') )

 LEFT JOIN  `customer_entity_int` AS `ceis` ON (`ceis`.`entity_id` = `c`.`entity_id` AND `ceis`.attribute_id  IN (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'default_shipping') )
