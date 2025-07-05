-- Active: 1751664256512@@127.0.0.1@3306@zoo_database
CREATE DATABASE IF NOT EXISTS zoo_database;
USE zoo_database;
CREATE TABLE IF NOT EXISTS species (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(50),
    popularity INT,
    location VARCHAR(2)
);

CREATE TABLE IF NOT EXISTS availability (
    species_id CHAR(36),
    day VARCHAR(10),
    FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE IF NOT EXISTS residents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    species_id CHAR(36),
    name VARCHAR(50),
    sex ENUM('male', 'female'),
    age INT,
    FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE IF NOT EXISTS employees (
    id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS managers (
    employee_id CHAR(36),
    manager_id CHAR(36),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (manager_id) REFERENCES employees(id)
);

CREATE TABLE IF NOT EXISTS responsibilities (
    employee_id CHAR(36),
    species_id CHAR(36),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE IF NOT EXISTS hours (
    day VARCHAR(10) PRIMARY KEY,
    open_time INT,
    close_time INT
);

CREATE TABLE IF NOT EXISTS prices (
    category VARCHAR(10) PRIMARY KEY,
    price DECIMAL(5,2)
);

-- Insert into species
INSERT INTO species (id, name, popularity, location) VALUES
('1', 'lions', 4, 'NE'),
('2', 'tigers', 5, 'NW'),
('3', 'bears', 5, 'NW'),
('4', 'penguins', 4, 'SE'),
('5', 'otters', 4, 'SE'),
('6', 'frogs', 2, 'SW'),
('7', 'snakes', 3, 'SW'),
('8', 'elephants', 5, 'NW'),
('9', 'giraffes', 4, 'NE');

-- Insert into availability
INSERT INTO availability (species_id, day) VALUES
('1', 'Tuesday'), ('1', 'Thursday'), ('1', 'Saturday'), ('1', 'Sunday'),
('2', 'Wednesday'), ('2', 'Friday'), ('2', 'Saturday'), ('2', 'Tuesday'),
('3', 'Tuesday'), ('3', 'Wednesday'), ('3', 'Sunday'), ('3', 'Saturday'),
('4', 'Tuesday'), ('4', 'Wednesday'), ('4', 'Sunday'), ('4', 'Saturday'),
('5', 'Friday'), ('5', 'Thursday'), ('5', 'Wednesday'), ('5', 'Saturday'),
('6', 'Saturday'), ('6', 'Friday'), ('6', 'Thursday'), ('6', 'Wednesday'),
('7', 'Sunday'), ('7', 'Saturday'), ('7', 'Friday'), ('7', 'Thursday'),
('8', 'Friday'), ('8', 'Saturday'), ('8', 'Sunday'), ('8', 'Tuesday'),
('9', 'Wednesday'), ('9', 'Thursday'), ('9', 'Tuesday'), ('9', 'Friday');

-- Insert into residents
INSERT INTO residents (id, species_id, name, sex, age) VALUES
(1, '1', 'Zena', 'female', 12), (2, '1', 'Maxwell', 'male', 15), (3, '1', 'Faustino', 'male', 7), (4, '1', 'Dee', 'female', 14),
(5, '2', 'Shu', 'female', 19), (6, '2', 'Esther', 'female', 17),
(7, '3', 'Hiram', 'male', 4), (8, '3', 'Edwardo', 'male', 4), (9, '3', 'Milan', 'male', 4),
(10, '4', 'Joe', 'male', 10), (11, '4', 'Tad', 'male', 12), (12, '4', 'Keri', 'female', 2), (13, '4', 'Nicholas', 'male', 2),
(14, '5', 'Neville', 'male', 9), (15, '5', 'Lloyd', 'male', 8), (16, '5', 'Mercedes', 'female', 9), (17, '5', 'Margherita', 'female', 10),
(18, '6', 'Cathey', 'female', 3), (19, '6', 'Annice', 'female', 2),
(20, '7', 'Paulette', 'female', 5), (21, '7', 'Bill', 'male', 6),
(22, '8', 'Ilana', 'female', 11), (23, '8', 'Orval', 'male', 15), (24, '8', 'Bea', 'female', 12), (25, '8', 'Jefferson', 'male', 4),
(26, '9', 'Gracia', 'female', 11), (27, '9', 'Antone', 'male', 9), (28, '9', 'Vicky', 'female', 12), (29, '9', 'Clay', 'male', 4), (30, '9', 'Arron', 'male', 7), (31, '9', 'Bernard', 'male', 6);

-- Insert into employees
INSERT INTO employees (id, first_name, last_name) VALUES
('1', 'Nigel', 'Nelson'),
('2', 'Burl', 'Bethea'),
('3', 'Ola', 'Orloff'),
('4', 'Wilburn', 'Wishart'),
('5', 'Stephanie', 'Strauss'),
('6', 'Sharonda', 'Spry'),
('7', 'Ardith', 'Azevado'),
('8', 'Emery', 'Elser');

-- Insert into managers
INSERT INTO managers (employee_id, manager_id) VALUES
('1', '2'), ('1', '3'),
('2', '5'),
('3', '5'),
('4', '2'), ('4', '3'),
('5', NULL),
('6', '2'), ('6', '3'),
('7', '8'),
('8', '5');

-- Insert into responsibilities
INSERT INTO responsibilities (employee_id, species_id) VALUES
('1', '1'), ('1', '2'),
('2', '1'), ('2', '2'), ('2', '3'), ('2', '4'),
('3', '5'), ('3', '6'), ('3', '7'), ('3', '8'),
('4', '7'), ('4', '8'),
('5', '5'), ('5', '9'),
('6', '5'), ('6', '6'),
('7', '2'), ('7', '3'),
('8', '1'), ('8', '3'), ('8', '8');

-- Insert into hours
INSERT INTO hours (day, open_time, close_time) VALUES
('Tuesday', 8, 6),
('Wednesday', 8, 6),
('Thursday', 10, 8),
('Friday', 10, 8),
('Saturday', 8, 10),
('Sunday', 8, 8),
('Monday', 0, 0);

-- Insert into prices
INSERT INTO prices (category, price) VALUES
('adult', 49.99),
('senior', 24.99),
('child', 20.99);