--app_store_apps cols: name(text), size_bytes(text), price(numeric), review_count(text),
--			rating(numeric), content_rating(text), primary_genre(text) **7,197 Rows**
--play_store_apps cols: name(text), category(text), rating(numeric), review_count(integer),
--			size(text), install_count(text), type(text), price(text), content_rating(text),
--			genres(text) **10,840 Rows**

SELECT COUNT(DISTINCT name)
FROM play_store_apps;
--ANDROID PLAY STORE INFO
--9659 count distinct name
--9366 count rating not null
--274 count 5 star
--246 count 5 star and Free
--1643 between 4.51-4.99 star
--1463 between 4.51-4.99 rating and Free
--5451 between 4.0-4.5 star
--5133 between 4.0-4.5 star and Free

--APPLE STORE INFO
--7195 count distinct name
--7197 count rating not null
--492 count 5 star
--255 count 5 star and Free
--2663 between 4.5-4.9 star
--1465 between 4.51-4.99 rating and Free
--1626 between 4.0-4.5 star
--850 between 4.0-4.5 star and Free

--2 STORE INFO
--328 distinct name inner join
--261 distinct name inner join, app.price=0 and pla.type=Free
--6 distinct name inner join, app.price=0 and pla.type=Free, app.rating = 5
--30 distinct name inner join, app.price=0 and pla.type=Free, app.rating > 4.49 and pla.rating > 4.5
SELECT *--DISTINCT app.name
FROM app_store_apps AS app
INNER JOIN play_store_apps AS pla ON app.name = pla.name
WHERE app.price = 0 
AND pla.type = 'Free'
AND app.rating > 4.49
AND pla.rating > 4.5
--ORDER BY app.name;


