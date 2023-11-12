# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!


CREATE TABLE skills(
    skills_id int not null,
    skills_name varchar(255) not null ,
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    PRIMARY KEY (skills_id)
);




# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(skills_id, skills_name, skills_description, skills_tag, skills_time_commitment, skills_url) values
    (1, 'crying', 'How good each employee is at letting their feelings out', 'Skill 1', 1, 'https://en.wikipedia.org/wiki/Crying'),
    (2, 'typing speed', 'An employee''s typing speed in WPM', 'Skill 2', 300, 'https://www.typing.com/student/tests'),
    (3, 'creativity', 'An employee''s ability to come up with silly skills', 'Skill 3', 4500, 'randomskills.com'),
    (4, 'documenting', 'How well an employee documents their own code', 'Skill 4',  2147483647, 'https://www.freecodecamp.org/news/how-to-write-a-good-readme-file/'),
    (5, 'athleticism', 'An employee''s score in the bimonthly company basketball tournament', 'Skill 5', 1000, 'www.company.com/basketball'),
    (6, 'date knowledge', 'Whether an employee shows up twice a month or once every two months for the basketball tournament', 'Skill 6', 2000, 'www.company.com/basketball/dates'),
    (7, 'succinctness', 'The ability for an employee of the company to adequately express the point they are trying to get across to another person, in as few words as they possibly could', 'Skill 7', 0, 'https://en.wikipedia.org/wiki/Concision'),
    (8, 'slacking', 'An employee''s ability to come up with excuses for not doing their work.', 'Skill 8', 0, 'TODO: put link here');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int not null,
    people_first_name varchar(255),
    people_last_name varchar(256) NOT NULL,
    people_email varchar (255),
    people_linkedin_url varchar (255),
    people_headshot_url varchar (255),
    people_discord_handle varchar (255),
    people_brief_bio varchar (4096),
    people_date_joined date not null,
    PRIMARY KEY (people_id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, people_first_name, people_last_name, people_brief_bio, people_date_joined, people_email) values 
    (1, 'John', 'Person 1', 'Young man, still full of hope for the future', '2021-10-10', 'jperson1@gmail.com'),
    (2, 'Mason', 'Person 2', 'Son of the owner', '2023-11-12', 'mySon@company.com'),
    (3, 'Sarah', 'Person 3', 'One of our longest lasting employees', '0100-02-24', 'lovelaughlive4evr@hotmail.com'),
    (4, 'Martha', 'Person 4', 'Makes a great lasagna', '2010-10-10', 'rightperson4u@gmail.com'),
    (5, 'Ron', 'Person 5', 'John''s twin, no hope for the future', '2021-10-10', 'rperson5@gmail.com'),
    (6, 'Philip', 'Person 6', 'From the soon to be established time travel division', '2341-6-21', 'phil6@company.com'),
    (7, 'Sam', 'Person 7', 'MVP of the basketball tournament, 12 years in a row', '2011-1-1', 'basketballer7@aol.com'),
    (8, 'Kayla', 'Person 8', 'Won a nobel prize in her spare time', '2019-9-12', 'paykay@gmail.com'),
    (9, 'Nicholas', 'Person 9', 'Organizes the company secret santa every year', '2010-12-25', 'stnick@aol.com'),
    (10, 'Lee', 'Person 10', 'Writes books in his spare time', '2022-8-5', 'person10l@company.com');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int auto_increment not null,
    skills_id int not null,
    people_id int not null,
    date_acquired date not null,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (skills_id) REFERENCES skills(skills_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills(people_id, skills_id, date_acquired) values
    (1, 1, '2023-11-11'),
    (1, 3, '2022-3-11'),
    (1, 6, '2022-9-1'),
    (2, 3, '2023-11-12'),
    (2, 4, '2023-11-12'),
    (2, 5, '2023-11-12'),
    (3, 1, '2020-4-10'),
    (3, 5,  '1892-3-12'),
    (5, 3, '2022-9-19'),
    (5, 6, '2021-10-10'),
    (6, 2, '2342-7-23'),
    (6, 3, '2343-2-14'),
    (6, 4, '2341-11-30'),
    (7, 3, '2015-9-16'),
    (7, 5, '2011-3-1'),
    (7, 6, '2011-9-1'),
    (8, 1, '2020-4-13'),
    (8, 3, '2020-10-4'),
    (8, 5, '2022-9-5'),
    (8, 6, '2023-9-1'),
    (9, 2, '2012-12-25'),
    (9, 5, '2017-9-10'),
    (9, 6, '2011-9-1'),
    (10, 1, '2022-10-26'),
    (10, 4, '2023-11-4'),
    (10, 5, '2023-3-5');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int not null,
    roles_name varchar(255),
    sort_priority int not null,
    PRIMARY KEY (roles_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles(roles_id, roles_name, sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);
    
# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment


CREATE TABLE peopleroles(
    peopleroles_id int not null auto_increment,
    people_id int not null,
    role_id int not null,
    date_assigned date not null,
    PRIMARY KEY (peopleroles_id),
    FOREIGN KEY (role_id) REFERENCES roles(roles_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) values
    (1, 2, '2021-10-10'),
    (2, 5, '2023-11-12'),
    (2, 6, '2023-11-12'),
    (3, 2, '1854-5-13'),
    (3, 4, '0110-9-23'),
    (4, 3, '2011-1-16'),
    (5, 3, '2021-10-10'),
    (6, 2, '2343-8-19'),
    (6, 1, '2341-6-21'),
    (7, 1, '2011-1-1'),
    (8, 1, '2019-9-2'),
    (8, 4, '2021-9-7'),
    (9, 2, '2010-12-25'),
    (10, 2, '2022-8-5'),
    (10, 1, '2023-10-23');
