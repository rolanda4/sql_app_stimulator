CREATE DATABASE day8;
USE day8;


/** creating users table **/
CREATE TABLE diary_users(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
user_name TEXT,
password VARCHAR(255),
location TEXT,
signup_date TEXT,
user_score VARCHAR(255)
);

INSERT INTO diary_users(user_name,password, location, signup_date,user_score)
VALUES
('Ama65', '*************' ,'Accra,Ghana', '01-11-2023', 0.5),
('Jackson Maladin', '*************' , 'New York,USA', '31-12-2023', 0.2),
('Beatrice Da Fan Girl', '*************' , 'London,England', '01-01-2024', 0.4),
('Martinfunnygyy', '*************' , 'Nairobi,Kenya', '15-01-2024', 0.1)
;

/**creating data entry table**/
CREATE TABLE digital_diary(
id INTEGER PRIMARY KEY AUTO_INCREMENT, 
date TEXT,
time TEXT,
location TEXT,
user_id INTEGER,
title TEXT,
entry VARCHARACTER(255),
main_character TEXT)
;
INSERT INTO digital_diary(date,time,location,user_id,title,entry,main_character)
VALUES
('01-02-2024', '11:00' , 'Accra,Ghana', 1, 'Today is a great day', 'I got into blossom fellowship today. Yeeey!','Ama'),
('01-02-2024', '13:00' , 'New York,USA', 2, 'Heartbreak Hurts', 'Lauren and I broke up today','Jackson'),
('02-02-2024', '00:15' , 'London,England', 3, 'I love baked beans', 'I ate my beans diffrently today. Yummmmm','Beatrice'), 
('12-02-2024', '9:00' , 'Accra,Ghana', 1, 'Power BI', 'Power BI is starting out a bit rough but we would see.','Ama'),
('20-02-2024', '18:00' , 'London England', 3, 'High School Sucks', 'I wonder how I can do revenge on my bullies','Beatrice') 
; 


#querying tables
SELECT * FROM digital_diary;
SELECT * FROM diary_users;

/**Ama updated the title of one of her records**/
UPDATE digital_diary 
SET title = 'February will be awesome!'
WHERE id = 1 
AND date = '01-02-2024'; 

/** Martin wants to free up space on his phone so deletes his account on this
	unused app when deleting the app on his phone
**/
DELETE FROM diary_users 
WHERE id = 4; 

/** the app developers decide to add a feelings entry in the app**/
ALTER TABLE digital_diary
ADD feeling VARCHAR(255) default "Unknown";

/** after adding the feelings entry in the app, they give users the option to add feelings when revisiting
	a diary entry
**/
UPDATE digital_diary SET feeling = '😄' WHERE id = 1 AND date = '01-02-2024';
UPDATE digital_diary SET feeling = '🤕🤕' WHERE id = 2 AND date = '01-02-2024';
UPDATE digital_diary SET feeling = '😠😡😒' WHERE id = 5 AND date = '20-02-2024';

/** On 23/02/2024, 2 new people created an acount on the app**/
INSERT INTO diary_users(user_name, password, location, signup_date,user_score)
VALUES
	('ChuckLi', '**********','Jakarta,Indonesia', '23-02-2024', 0.1),
    ('Beyonces biggest stan', '**********','Beijing,China', '23-02-2024', 0.2)
    ;

/**One of the new users chooses to make a new diary entry today**/
INSERT INTO digital_diary(date,time,location,user_id,title,entry,main_character,feeling)
VALUES
('23-02-2024', '13:00' , 'Beijing,China', 6, '碧昂斯演唱会》', '《女王要来北京了，我要尽快拿到票》。','Beyonce','🎉🎉🎉');


#quick drop of tables when an error occurs
DROP TABLE diary_users;
TRUNCATE TABLE digital_diary;
