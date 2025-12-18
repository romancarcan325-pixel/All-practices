--Задание 1 Ошибка 3НФ заключается в том, что неключевые атрибуты 'publisher_name' и 'publisher_city'
--зависят не напрямую от первичного ключа 'book_id', а транзитивно, через другой неключевой атрибут 'publisher_id'.
-- Это приводит к нарушению третей нормальной формы.

CREATE TABLE PUBLISHERS(
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    publisher_city VARCHAR(255) NOT NULL,
);
CREATE TABLE BOOKS(
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

--Задание 2 Ошибка 3НФ в этой таблице заключается в том, что атрибут 'car_manufacturer' зависит не напрямую 
--от первичного ключа 'race_id' и 'driver_id', а транзитивно — через атрибут 'car_model'
--Это нарушает третью нормальную форму.

CREATE TABLE CARS(
    car_model VARCHAR(100) PRIMARY KEY,
    car_manufacturer VARCHAR(100)
);
CREATE TABLE RaceResults (
    race_id INT,
    driver_id INT,
    car_model VARCHAR(100),
    finish_time TIME,
    PRIMARY KEY (race_id, driver_id),
    FOREIGN KEY (car_model) REFERENCES CARS(car_model)
);