-- 8. Создание бд и таблиц

DROP DATABASE IF EXISTS Друзья_человека;
CREATE DATABASE Друзья_человека;
USE Друзья_человека;

DROP TABLE IF EXISTS животные;
CREATE TABLE животные (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    type_name VARCHAR(50)
) COMMENT 'вид животных';


DROP TABLE IF EXISTS домашние_животные;
CREATE TABLE домашние_животные (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    v_name VARCHAR(50),
	from_animals_id BIGINT UNSIGNED NOT NULL,
 
    FOREIGN KEY (from_animals_id) REFERENCES животные(id)
);

DROP TABLE IF EXISTS вьючные_животные;
CREATE TABLE вьючные_животные (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    v_name VARCHAR(50),
	from_animals_id BIGINT UNSIGNED NOT NULL,
 
    FOREIGN KEY (from_animals_id) REFERENCES животные(id)
);

DROP TABLE IF EXISTS кошки;
CREATE TABLE кошки (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50),
    comand VARCHAR(50),
    birthday DATE,
	from_id BIGINT UNSIGNED NOT NULL,
 
    FOREIGN KEY (from_id) REFERENCES домашние_животные(id)
);

DROP TABLE IF EXISTS собаки;
CREATE TABLE собаки (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50),
    comand VARCHAR(50),
    birthday DATE,
	from_id BIGINT UNSIGNED NOT NULL,
 
    FOREIGN KEY (from_id) REFERENCES домашние_животные(id)
);

DROP TABLE IF EXISTS хомяки;
CREATE TABLE хомяки (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50),
    comand VARCHAR(50),
    birthday DATE,
	from_id BIGINT UNSIGNED NOT NULL,
 
    FOREIGN KEY (from_id) REFERENCES домашние_животные(id)
);

DROP TABLE IF EXISTS лошади;
CREATE TABLE лошади (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50),
    comand VARCHAR(50),
    birthday DATE,
	from_id BIGINT UNSIGNED NOT NULL,
 
    FOREIGN KEY (from_id) REFERENCES вьючные_животные(id)
);

DROP TABLE IF EXISTS верблюды;
CREATE TABLE верблюды (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50),
    comand VARCHAR(50),
    birthday DATE,
	from_id BIGINT UNSIGNED NOT NULL,
 
    FOREIGN KEY (from_id) REFERENCES вьючные_животные(id)
);

DROP TABLE IF EXISTS ослы;
CREATE TABLE ослы (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50),
    comand VARCHAR(50),
    birthday DATE,
	from_id BIGINT UNSIGNED NOT NULL,
 
    FOREIGN KEY (from_id) REFERENCES вьючные_животные(id)
);

-- 9. Заполнение таблиц
INSERT INTO животные VALUES 
	(1,'Домашние животные'),
	(2,'Вьючные животные');
    
-- select * from животные;    

INSERT INTO домашние_животные VALUES 
	(1,'Кошки', 1),
    (2,'Собаки', 1),
	(3,'Хомяки', 1);
    
-- select * from домашние_животные;   

INSERT INTO вьючные_животные VALUES 
	(1,'Лошади', 2),
    (2,'Верблюды', 2),
	(3,'Ослы', 2);

-- select * from вьючные_животные;  
       
INSERT INTO кошки VALUES 
	(1,'Лапка', 'кушать', '2022-04-11', 1),
    (2,'Монька', 'ко мне', '2018-11-08', 1);
    
INSERT INTO собаки VALUES 
	(1, 'Динка', 'голос', '2020-04-11', 2),
    (2, 'Принц', 'дай лапу', '2015-11-20', 2);   
    
INSERT INTO хомяки VALUES 
	(1, 'Хома', 'нет', '2022-04-01', 3),
    (2, 'Бусинка', 'нет', '2019-11-20', 3);   
    
INSERT INTO лошади VALUES 
	(1, 'Черная метка', 'кушать', '2022-04-11', 1),
    (2, 'Невеста', 'галопом', '2021-03-15', 1);
    
INSERT INTO верблюды VALUES 
	(1, 'Колючка', 'стой', '2019-05-11', 2),
    (2, 'Рыжий', 'стой', '2015-10-20', 2);   
    
INSERT INTO ослы VALUES 
	(1, 'Серый', 'нет', '2022-09-01', 3),
    (2, 'Ишак', 'нет', '2019-11-22', 3);     

-- 10. Удалить из таблицы верблюдов. Объединить таблицы лошади и ослы в одну таблицу

-- очистка таблицы
delete from верблюды;
select * from верблюды;

-- объединение таблиц лошади и ослы
select * from лошади
UNION ALL select * from ослы;

/* 11. Создать новую таблицу “молодые животные” в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице*/


CREATE TABLE животные_1_3
select *, TIMESTAMPDIFF(MONTH, birthday, NOW()) as month from кошки where TIMESTAMPDIFF(YEAR, birthday, NOW()) between 1 and 3
union all select *, TIMESTAMPDIFF(MONTH, birthday, NOW()) as month from собаки where TIMESTAMPDIFF(YEAR, birthday, NOW()) between 1 and 3
union all select *, TIMESTAMPDIFF(MONTH, birthday, NOW()) as month from хомяки where TIMESTAMPDIFF(YEAR, birthday, NOW()) between 1 and 3
union all select *, TIMESTAMPDIFF(MONTH, birthday, NOW()) as month from лошади where TIMESTAMPDIFF(YEAR, birthday, NOW()) between 1 and 3
union all select *, TIMESTAMPDIFF(MONTH, birthday, NOW()) as month from ослы where TIMESTAMPDIFF(YEAR, birthday, NOW()) between 1 and 3;
    
select * from животные_1_3;    -- проверка

/*12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
прошлую принадлежность к старым таблицам.*/


create table все_животные
select * from кошки
union all 
select * from собаки
union all 
select * from хомяки
union all 
select * from лошади
union all 
select * from ослы;

select * from все_животные
left join кошки on кошки.nickname = все_животные.nickname
left join собаки on собаки.nickname = все_животные.nickname
left join лошади on лошади.nickname = все_животные.nickname
left join хомяки on хомяки.nickname = все_животные.nickname
left join ослы on ослы.nickname = все_животные.nickname;


    
    
    
  
    
  

