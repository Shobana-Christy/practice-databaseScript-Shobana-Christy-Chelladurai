START TRANSACTION;

DROP TABLE IF EXISTS organizations, volunteers, assignments;


CREATE TABLE organizations(
org_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
org_name VARCHAR (100) NOT NULL,
org_email VARCHAR (100),
location VARCHAR(150)
);

CREATE TABLE volunteers(
volunteer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR (50) NOT NULL,
email VARCHAR(100),
phone VARCHAR(20)
);

CREATE TABLE assignments(
assignment_id INT PRIMARY KEY AUTO_INCREMENT,
volunteer_id INT NOT NULL REFERENCES volunteers(volunteer_id),
org_id INT NOT NULL REFERENCES organizations(org_id),
roles VARCHAR(150) NOT NULL,
hours_worked DECIMAL(5,2)
);

COMMIT;
