--Задание 1 ошибка заключается в том ,что
--Атрибут `Team_members` не является атомарным.
-- Чтобы привести таблицу к 1НФ, мы должны "развернуть" эти данные.
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255),
    team_members VARCHAR(1000) -- Пример: 'Алексеев, Борисов, Васильева'
);

CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(255)
);

CREATE TABLE Team_members (
    team_member_id SERIAL PRIMARY KEY,
    team_memberName VARCHAR(255)
);

CREATE TABLE ProjectsTeam_members (
    project_id INT,
    team_member_id INT,
    PRIMARY KEY (project_id,team_member_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (team_member_id) REFERENCES Team_members(team_member_id)
);

-- Задание 2 Ошибок здесь несколько и заключаются они в том, что
--у атрибута 'client_name' частичная зависимость,
--а именно он зависит только от 'client_id', а не от всего ключа.
--Также атрибут 'client_email' зависит только от 'client_id' это получается 
--тоже частичная зависимость. Также атрибут 'equipment_name' зависит только от
--'equipment_id',а значит это частичная зависимость.
CREATE TABLE EquipmentRentals (
    client_id INT,
    equipment_id INT,
    client_name VARCHAR(255),    -- Имя клиента
    client_email VARCHAR(255),   -- Email клиента
    equipment_name VARCHAR(255), -- Название оборудования
    rental_date DATE,            -- Дата аренды
    PRIMARY KEY (client_id, equipment_id)
);


--Задание 3 Эта таблица нарушает и 1НФ, и 2НФ поэтому ошибок здесь несколько
--Ошибка первой НФ
--Первая ошибка заключается в том, что атрибут 'assignments_and_grades'  не является атомарным.
-- Чтобы привести таблицу к 1НФ, мы должны "развернуть" эти данные.
--Две ошибки второй НФ
--Вторая ошибка заключается в том, что атрибут 'student_name' зависит только от 'student_id' то есть
--это частичная зависимость.Третья ошибка заключается в том, что атрибут 'course_professor' зависит 
--только от 'course_id' значит это частичная зависимость.

CREATE TABLE StudentGrades (
    student_id INT,
    course_id INT,
    student_name VARCHAR(255),
    course_professor VARCHAR(255),
    assignments_and_grades TEXT, -- Пример содержимого: '{"Quiz 1": 85, "Midterm": 92, "Essay": 88}'
    PRIMARY KEY (student_id, course_id)
);