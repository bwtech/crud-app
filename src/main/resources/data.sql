INSERT INTO client (client_id,company_name,web_uri,phone_number,street_address,city,state,zip_code) VALUES (2,'Acme Widgets','www.acme.com','916-555-1234','2012 X Street','Sacramento','CA','95691');
INSERT INTO client (client_id,company_name,web_uri,phone_number,street_address,city,state,zip_code) VALUES (3,'Bill Sports','ww.sport1.com','555-333-6789 ext 3','23 uphill','San Francisco','CA','12344');
INSERT INTO client (client_id,company_name,web_uri,phone_number,street_address,city,state,zip_code) VALUES (4,'Mobil Pet Groomers','www.pets.com','555-444-3333','123 F Street','Lodi','CA','12345');
INSERT INTO client (client_id,company_name,web_uri,phone_number,street_address,city,state,zip_code) VALUES (6,'Janes Car Wash','www.clean.com','916-123-4567','89 Utah Ave','West Sacramento','CA','96785');
INSERT INTO client (client_id,company_name,web_uri,phone_number,street_address,city,state,zip_code) VALUES (7,'A1 Pool Hall','www.pool.com','916-999-0000','43 Last Street','Sacramento','CA','95814');

INSERT INTO person (person_id,first_name,last_name,email_address,street_address,city,state,zip_code) VALUES (2,'Beth','Smith','fake2@aquent.com','123 Any St.','Asheville','NC','28801');
INSERT INTO person (person_id,first_name,last_name,email_address,street_address,city,state,zip_code) VALUES (4,'Amy L','McGuire','fake2@gmail.com','2012 Muscovy Rd','West Sacramento','CA','95691');
INSERT INTO person (person_id,first_name,last_name,email_address,street_address,city,state,zip_code) VALUES (6,'Steve','Smith','dddd@ddd.com','2015 G Street','Reno','NV','22334');
INSERT INTO person (person_id,first_name,last_name,email_address,street_address,city,state,zip_code) VALUES (7,'Mary','Worthington','mw@yahoo.com','890 Front Street','Sac','CA','95414');
INSERT INTO person (person_id,first_name,last_name,email_address,street_address,city,state,zip_code) VALUES (8,'Jack','Spence','333@ddd','444','5555','66','77777');
INSERT INTO person (person_id,first_name,last_name,email_address,street_address,city,state,zip_code) VALUES (9,'Will','Smith','will@me.com','3 East End','Los Angeles','CA','56789');
INSERT INTO person (person_id,first_name,last_name,email_address,street_address,city,state,zip_code) VALUES (10,'Bart','Jones','jones@me.com','8 East End','Los Angeles','CA','56789');
INSERT INTO person (person_id,first_name,last_name,email_address,street_address,city,state,zip_code) VALUES (11,'Jane','Knox','jane@me.com','20 East End','Los Angeles','CA','56789');
INSERT INTO person (person_id,first_name,last_name,email_address,street_address,city,state,zip_code) VALUES (12,'Mel','Jackson','mel@me.com','90 Easy Street','Wilson','AK','45678');
INSERT INTO person (person_id,first_name,last_name,email_address,street_address,city,state,zip_code) VALUES (13,'Wilson','Jones','will@me.com','333 Down Hill','Sacramento','CA','95814');


INSERT INTO client_person (client_person_id,client_id,person_id) VALUES (42,3,6);
INSERT INTO client_person (client_person_id,client_id,person_id) VALUES (46,2,7);
INSERT INTO client_person (client_person_id,client_id,person_id) VALUES (51,4,2);
INSERT INTO client_person (client_person_id,client_id,person_id) VALUES (52,2,4);
INSERT INTO client_person (client_person_id,client_id,person_id) VALUES (53,3,8);
INSERT INTO client_person (client_person_id,client_id,person_id) VALUES (54,6,10);
INSERT INTO client_person (client_person_id,client_id,person_id) VALUES (55,6,11);