--Задание 1 ошибка заключается в том ,что
--Атрибут `Team_members` не является атомарным.
-- Чтобы привести таблицу к 1НФ, мы должны "развернуть" эти данные.

CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(255)
);

CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    member_name VARCHAR(255)
);

CREATE TABLE Projects_members (
    project_id INT,
    member_id INT,
    PRIMARY KEY (project_id,member_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Задание 2 Ошибок здесь несколько и заключаются они в том, что
--у атрибута 'client_name' частичная зависимость,
--а именно он зависит только от 'client_id', а не от всего ключа.
--Также атрибут 'client_email' зависит только от 'client_id' это получается 
--тоже частичная зависимость. Также атрибут 'equipment_name' зависит только от
--'equipment_id',а значит это частичная зависимость.

CREATE TABLE Clients (
    client_id SERIAL PRIMARY KEY,
    client_name VARCHAR(255),
    client_email VARCHAR(255)
);
CREATE TABLE Equipments (
    equipment_id SERIAL PRIMARY KEY,
    equipment_name VARCHAR(255)
);
CREATE TABLE EquipmentRentals (
    client_id INT,
    equipment_id INT,
    rental_date DATE,            
    PRIMARY KEY (client_id, equipment_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipments(equipment_id)
);

--Задание 3 Эта таблица нарушает и 1НФ, и 2НФ поэтому ошибок здесь несколько
--Ошибка первой НФ
--Первая ошибка заключается в том, что атрибут 'assignments_and_grades'  не является атомарным.
-- Чтобы привести таблицу к 1НФ, мы должны "развернуть" эти данные.
--Две ошибки второй НФ
--Вторая ошибка заключается в том, что атрибут 'student_name' зависит только от 'student_id' то есть
--это частичная зависимость.Третья ошибка заключается в том, что атрибут 'course_professor' зависит 
--только от 'course_id' значит это частичная зависимость.


CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(255)
);
CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255),
    course_professor VARCHAR(255)
);
CREATE TABLE StudentGrades (
    student_id INT,
    course_id INT,
    grade INT,
    assignment_name VARCHAR(255),
    PRIMARY KEY (student_id, course_id, assignment_name),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);