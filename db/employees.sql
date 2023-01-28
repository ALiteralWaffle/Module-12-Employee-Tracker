DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;
USE employees;

CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);

CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);

use employees;
INSERT INTO department
    (name)
VALUES
    ('Operations'),
    ('Marketing'),
    ('Executive');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('General Manager', 11000000, 1),
    ('Team Project Lead', 15000000, 2),
    ('Team Project Member', 8000000, 3),
    ('Media Manager', 7000000, 4),
    ('Media Specialist', 3000000, 5),
    ('CEO', 45000000, 6),
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('Mike', 'Moore', 1, NULL),
    ('Jane', 'Doe', 2, NULL),
    ('Steve', 'Bowers', 3, NULL),
    ('Steve', 'Merkel', 3, NULL),
    ('Jacob', 'Hooper', 4, NULL),
    ('Gary', 'Alexander', 5, NULL),
    ('Daniel', 'Johnston', 5, NULL),
    ('Dean', 'Jean', 6, NULL);