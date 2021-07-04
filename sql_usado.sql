CREATE TABLE catalog (
	id VARCHAR ( 32 ) PRIMARY KEY,
	name VARCHAR ( 32 )  NOT NULL,
	type VARCHAR ( 20 ) NOT NULL,
);

CREATE TABLE projects (
	projects_id VARCHAR ( 32 ) PRIMARY KEY,
	name VARCHAR ( 50 ) NOT NULL,
	goal_date DATE NOT NULL,
	user_id VARCHAR ( 32 ) NOT NULL,
	projects_category_id VARCHAR ( 32 ) NOT NULL,
	total money NOT NULL,

  	FOREIGN KEY (projects_category_id)
      REFERENCES catalog (id));

CREATE TABLE rules (
	rule_id VARCHAR ( 32 ) PRIMARY KEY,
	projects_id VARCHAR ( 32 ) NOT NULL,
	rule_type_id VARCHAR ( 32 ) NOT NULL,
	amount money  NOT NULL,
	frecuency INT NOT NULL,
	categories VARCHAR ( 36 ),FOREIGN KEY (projects_id)
      REFERENCES projects (projects_id),
    FOREIGN KEY (rule_type_id)
      REFERENCES catalog (id),
);

CREATE TABLE transactions (
	user_id VARCHAR ( 32 ),
	description VARCHAR ( 50 ) NOT NULL,
	transaction_date DATE NOT NULL,
	amount FLOAT  NOT NULL,
);

ALTER TABLE projects 
ADD constraint constraint_user FOREIGN KEY (user_id) REFERENCES transactions (user_id);