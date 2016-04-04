CREATE TABLE client (
  client_id  integer NOT NULL IDENTITY,
  company_name VARCHAR(50) NOT NULL,
  web_uri VARCHAR(50) NOT NULL,
  phone_number VARCHAR(50) NOT NULL,
  street_address VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code VARCHAR(5) NOT NULL);


CREATE TABLE person (
  person_id INTEGER IDENTITY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email_address VARCHAR(50) NOT NULL,
  street_address VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(2) NOT NULL,
  zip_code VARCHAR(5) NOT NULL);
 


CREATE TABLE client_person (
  client_person_id INTEGER IDENTITY,
  client_id INTEGER NOT NULL,
  person_id INTEGER NOT NULL,
  CONSTRAINT fk_client_person_client
    FOREIGN KEY (client_id)
    REFERENCES client (client_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_client_person_person
    FOREIGN KEY (person_id)
    REFERENCES person (person_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

