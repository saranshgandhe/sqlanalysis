SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
DROP TABLE IF EXISTS ASSIGNMENT;
DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS PHOTO;
DROP TABLE IF EXISTS AWARDS;
DROP TABLE IF EXISTS MOVIE;
DROP TABLE IF EXISTS ACTOR;
DROP TABLE IF EXISTS DIRECTOR;
DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS TV_SHOWS;

CREATE TABLE MOVIE (
Movie_Id INT NOT NULL,
Movie_Title varchar(150) NOT NULL,
Movie_Genre varchar(22),
Movie_Age_Restriction varchar(22),
Movie_Star_Rating varchar(22),
Movie_Release_Date YEAR,
Movie_Duration INT,
Movie_Plot_Description varchar(600),
Movie_Earnings INT,
Movie_Votes INT);


CREATE TABLE TV_SHOWS (
Show_Id INT NOT NULL,
Show_Title varchar(150) NOT NULL,
Show_Genre varchar(22),
Show_Star_Rating varchar(22),
Show_Avg_Episode_Duration INT,
Show_Plot_Description varchar(600),
Show_Votes INT,
Show_Age_Restriction varchar(22),
Show_Start_Year YEAR,
Show_End_Year YEAR) ;


CREATE TABLE DIRECTOR (
Director_Id INT NOT NULL,
Director_Name varchar(50) NOT NULL,
Director_DOB DATE) ;


CREATE TABLE ACTOR (
Actor_Id INT NOT NULL,
Actor_Name varchar(50) NOT NULL,
Actor_Birth_Location varchar(50),
Actor_DOB DATE,
Actor_Gender varchar(22),
Actor_Height varchar(22)
);

CREATE TABLE PHOTO (
Photo_Id INT NOT NULL,
Actor_Id INT NOT NULL,
Photo_Name varchar(22),
Photo_Language varchar(22),
Photo_Upload_Date DATE
);

CREATE TABLE ASSIGNMENT(
Movie_Id INT ,
Show_Id INT ,
Actor_Id INT NOT NULL,
Director_Id INT NOT NULL
);

CREATE TABLE AWARDS(
Award_No INT NOT NULL,
Award_Id INT NOT NULL,
Actor_Id INT NOT NULL,
Award_Name varchar(22),
Award_Year varchar(22),
Award_Result varchar(22)
);

CREATE TABLE USER (
Username varchar(50) NOT NULL,
User_Gender varchar(22),
User_Location varchar(22)
);

CREATE TABLE REVIEW (
Review_ID INT NOT NULL,
Movie_ID INT ,
Show_ID INT ,
Username varchar(50) NOT NULL,
Review_Stars decimal(4,2),
Review_Text varchar(600),
Review_Date varchar(22)
);

ALTER TABLE MOVIE
ADD PRIMARY KEY (Movie_Id);

ALTER TABLE TV_SHOWS
ADD PRIMARY KEY (Show_Id);

ALTER TABLE DIRECTOR
ADD PRIMARY KEY (Director_Id);

ALTER TABLE AWARDS
ADD PRIMARY KEY (Award_No);

ALTER TABLE ACTOR
ADD PRIMARY KEY (Actor_Id);

ALTER TABLE USER
ADD PRIMARY KEY (Username);

ALTER TABLE PHOTO
ADD PRIMARY KEY (Photo_Id);

ALTER TABLE REVIEW
ADD PRIMARY KEY (Review_Id);

ALTER TABLE ASSIGNMENT
ADD FOREIGN KEY (Movie_Id)
REFERENCES MOVIE (Movie_Id);

ALTER TABLE ASSIGNMENT
ADD FOREIGN KEY (Show_Id)
REFERENCES TV_SHOWS (Show_Id);

ALTER TABLE ASSIGNMENT
ADD FOREIGN KEY (Director_Id)
REFERENCES DIRECTOR (Director_Id);

ALTER TABLE ASSIGNMENT
ADD FOREIGN KEY (Actor_Id)
REFERENCES ACTOR (Actor_Id);


ALTER TABLE PHOTO
ADD FOREIGN KEY (Actor_ID)
REFERENCES ACTOR (Actor_ID);

ALTER TABLE AWARDS
ADD FOREIGN KEY (Actor_ID)
REFERENCES ACTOR (Actor_ID);


ALTER TABLE REVIEW
ADD FOREIGN KEY (Movie_ID)
REFERENCES MOVIE (Movie_ID);


ALTER TABLE REVIEW
ADD FOREIGN KEY (Show_ID)
REFERENCES TV_SHOWS (Show_ID);

ALTER TABLE REVIEW
ADD FOREIGN KEY (Username)
REFERENCES USER (Username); 

INSERT INTO Movie VALUES (1,'The Shawshank Redemption','Drama','R',9.3,1994,142,'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',28.34,2481358),

(2,'The Godfather','Crime','R',9.2,1972,175,'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.',134.97,1713747),

(3,'The Dark Knight','Action','PG-13',9,2008,152,'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',534.86,2435734),

(4,'The Godfather: Part II','Crime','R',9,1974,202,'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.',57.3,1190386),

(5,'12 Angry Men','Crime','Approved',9,1957,96,'The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.',4.36,734389),

(6,'The Lord of the Rings: The Return of the King','Action','PG-13',8.9,2003,201,"Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",377.85,1719289),

(7,'Pulp Fiction','Crime','R',8.9,1994,154,"The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",107.93,1920475),

(8,"Schindler's' List",'Biography','R',8.9,1993,195,"In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",96.9,1273757),

(9,'Inception','Action','PG-13',8.8,2010,148,"A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.",292.58,2185760),

(10,'Fight Club','Drama','R',8.8,1999,139,'An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.',37.03,1955326),

(11,'The Lord of the Rings: The Fellowship of the Ring','Action','PG-13',8.8,2001,178,'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.',315.54,1740553),

(12,'Forrest Gump','Drama','PG-13',8.8,1994,142,"The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.",330.25,1918596),

(13,"The Good, the Bad and the Ugly",'Western','R',8.8,1966,178,'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.',6.1,721634),

(14,'The Lord of the Rings: The Two Towers','Action','PG-13',8.7,2002,179,"While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron's new ally, Saruman, and his hordes of Isengard.",342.55,1554317),

(15,'The Matrix','Action','R',8.7,1999,136,'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.',171.48,1773035),

(16,'Goodfellas','Biography','R',8.7,1990,146,"The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.",46.84,1077070),

(17,'Star Wars: Episode V - The Empire Strikes Back','Action','PG',8.7,1980,124,"After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda, while his friends are pursued across the galaxy by Darth Vader and bounty hunter Boba Fett.",290.48,1211627),

(18,"One Flew Over the Cuckoo's Nest",'Drama','R',8.7,1975,133,"A criminal pleads insanity and is admitted to a mental institution, where he rebels against the oppressive nurse and rallies up the scared patients.",112,958546),

(19,'Parasite','Comedy','R',8.6,2019,132,'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.',53.37,676763),

(20,'Interstellar','Adventure','PG-13',8.6,2014,169,"A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",188.02,1632602),

(21,'City of God','Crime','R',8.6,2002,130,"In the slums of Rio, two kids' paths diverge as one struggles to become a photographer and the other a kingpin.",7.56,724972);



INSERT INTO TV_SHOWS VALUES (1, "Breaking Bad", "Crime", 9.4, 49, "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.", 1604082, "TV-MA", 2008, 2013);


INSERT INTO TV_SHOWS VALUES (2, "Game of Thrones", "Action", 9.2, 57, "Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.", 1896658, "TV-MA", 2011, 2019);


INSERT INTO TV_SHOWS VALUES(3, "The Mandalorian", "Action", 8.8, 40, "The travels of a lone bounty hunter in the outer reaches of the galaxy, far from the authority of the New Republic.", 365470, "TV-14", 2019, NULL);


INSERT INTO TV_SHOWS VALUES(4, "Friends", "Comedy", 8.8, 22, "Follows the personal and professional lives of six twenty to thirty-something-year-old friends living in Manhattan.", 909476, "TV-PG", 1994, 2004);


INSERT INTO TV_SHOWS VALUES(5, "The Sopranos", "Crime", 9.2, 55, "New Jersey mob boss Tony Soprano deals with personal and professional issues in his home and business life that affect his mental state, leading him to seek professional psychiatric counseling.", 345207, "TV-MA", 1999, 2007);


INSERT INTO TV_SHOWS VALUES(6, "The Wonder Years", "Comedy", 8.3, 22, "Kevin Arnold recalls growing up during the late 60s and early 70s; the turbulent social times make the transition from child to adult unusually interesting.", 36248, "TV-PG", 1988, 1993);


INSERT INTO TV_SHOWS VALUES(7, "Seinfeld", "Comedy", 8.8, 22, "The continuing misadventures of neurotic New York City stand-up comedian Jerry Seinfeld and his equally neurotic New York City friends.", 277706, "TV-PG", 1989, 1998);


INSERT INTO TV_SHOWS VALUES(8, "House of Cards", "Drama", 8.7, 51, "A Congressman works with his equally conniving wife to exact revenge on the people who betrayed him.", 483144, "TV-MA", 2013, 2018);


INSERT INTO TV_SHOWS VALUES(9, "Lost", "Adventure", 8.3, 44, "The survivors of a plane crash are forced to work together in order to survive on a seemingly deserted tropical island.", 522471, "TV-14", 2004, 2010);


INSERT INTO TV_SHOWS VALUES(10, "Westworld", "Drama", 8.6, 62, "Set at the intersection of the near future and the reimagined past, explore a world in which every human appetite can be indulged without consequence.", 455513, "TV-MA", 2016, NULL);
INSERT INTO TV_SHOWS VALUES(11, "Stranger Things", "Drama", 8.7, 51, "When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back.", 927982, "TV-14", 2016, NULL);
INSERT INTO TV_SHOWS VALUES(12, "The X-Files", "Crime", 8.6, 45, "Two F.B.I. Agents, Fox Mulder the believer and Dana Scully the skeptic, investigate the strange and unexplained, while hidden forces work to impede their efforts.", 210736, "TV-14", 1993, 2018);
INSERT INTO TV_SHOWS VALUES(13, "Chernobyl", "Drama", 9.4, 330, "In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the world's worst man-made catastrophes.", 623570, "TV-MA", 2019, NULL);
INSERT INTO TV_SHOWS VALUES(14, "Better Call Saul", "Crime", 8.8, 46, "The trials and tribulations of criminal lawyer Jimmy McGill in the time before he established his strip-mall law office in Albuquerque, New Mexico.", 362914, "TV-MA", 2015, 2022);
INSERT INTO TV_SHOWS VALUES(15, "Narcos", "Biography", 8.8, 49, "A chronicled look at the criminal exploits of Colombian drug lord Pablo Escobar, as well as the many other drug kingpins who plagued the country through the years.", 386135, "TV-MA", 2015, 2017);
INSERT INTO TV_SHOWS VALUES(16, "Family Guy", "Animation", 8.1, 22, "In a wacky Rhode Island town, a dysfunctional family strive to cope with everyday life as they are thrown from one crazy scenario to another.", 317881, "TV-14", 1999, NULL);
INSERT INTO TV_SHOWS VALUES(17, "Parks and Recreation", "Comedy", 8.6, 22, "The absurd antics of an Indiana town's public officials as they pursue sundry projects to make their city a better place.", 235034, "TV-14", 2009, 2015);
INSERT INTO TV_SHOWS VALUES(18, "The Simpsons", "Animation", 8.6, 22, "The satiric adventures of a working-class family in the misfit city of Springfield.", 383406, "TV-PG", 1989, NULL);
INSERT INTO TV_SHOWS VALUES(19, "The Wire", "Crime", 9.3, 59, "The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement.", 308514, "TV-MA", 2002, 2008);
INSERT INTO TV_SHOWS VALUES(20, "Rome", "Action", 8.7, 52, "A down-to-earth account of the lives of both illustrious and ordinary Romans set in the last days of the Roman Republic.", 162279, "TV-MA", 2005, 2007);
INSERT INTO TV_SHOWS VALUES(21, "Rick and Morty", "Animation", 9.2, 23, "An animated series that follows the exploits of a super scientist and his not-so-bright grandson.", 440959, "TV-MA", 2013, NULL);



INSERT INTO Director VALUES (1,'Frank Darabont', '1959-01-28'),
(2,'Francis Ford Coppola', '1939-04-07'),
(3,'Christopher Nolan', '1970-07-30'),
(4,'Sidney Lumet', '1924-06-25'),
(5,'Peter Jackson', '1961-08-31'),
(6,'Quentin Tarantino', '1963-03-27'),
(7,'Steven Spielberg', '1946-12-18'),
(8,'David Fincher', '1962-08-28'),
(9,'Robert Zemeckis', '1952-05-14'),
(10,'Sergio Leone', '1929-01-03'),
(11,'Lana Wachowski', '1965-06-21'),
(12,'Martin Scorsese', '1942-11-17'),
(13,'Irvin Kershner', '1923-04-29'),
(14,'Milos Forman', '1932-02-18'),
(15,'Bong Joon Ho', '1969-09-14'),
(16,'Fernando Meirelles', '1955-11-09'),
(17,'Aaron Paul', '1979-08-27'),
(18,'Peter Dinklage', '1969-05-11'),
(19,'Carl Weathers', '1948-01-14'),
(20,'Courteney Cox', '1964-05-15'),
(21,'Lorraine Bracco', '1950-03-20'),
(22,'Dan Lauria', '1967-08-30'),
(23,'Julia Louis-Dreyfus', '1939-10-19'),
(24,'Michel Gill', '1958-12-14'),
(25,'Josh Holloway', '1942-09-03'),
(26,'Jeffrey Wright', '1948-04-09'),
(27,'Finn Wolfhard', '1960-07-19'),
(28,'Gillian Anderson', '1970-11-26'),
(29,'Jared Harris', '1966-09-29'),
(30,'Rhea Seehorn', '1959-02-27'),
(31,'Lizbeth Eden', '1972-03-28'),
(32,'Alex Borstein', '1939-05-26'),
(33,'Jim OHeir', '1959-07-14'),
(34,'Nancy Cartwright', '1947-11-23'),
(35,'Lance Reddick', '1949-10-20'),
(36,'Ray Stevenson', '1938-12-03'),
(37,'Chris Parnell', '1952-03-18');

INSERT INTO Actor VALUES(1,'Tim Robbins','California','1958-10-16','Male','6′ 5″');

INSERT INTO Actor VALUES(2,'Marlon Brando','Nebraska','1924-04-03','Male','5′ 9″');

INSERT INTO Actor VALUES(3,'Christian Bale','United Kingdom','1974-01-30','Male','6′ 0″');

INSERT INTO Actor VALUES(4,'Al Pacino','New York','1940-04-25','Male','6′ 0″');

INSERT INTO Actor VALUES(5,'Henry Fonda','Nebraska','1905-05-16','Male','6′ 2″');

INSERT INTO Actor VALUES(6,'Elijah Wood','Iowa','1981-01-28','Male','5′ 6″');

INSERT INTO Actor VALUES(7,'John Travolta','New Jersey','1954-02-18','Male','6′ 2″');

INSERT INTO Actor VALUES(8,'Liam Neeson','United Kingdom','1952-06-07','Male','6′ 4″');

INSERT INTO Actor VALUES(9,'Leonardo DiCaprio','California','1974-11-11','Male','6′ 0″');

INSERT INTO Actor VALUES(10,'Brad Pitt','Oklahoma','1963-12-18','Male','5′ 11″');

INSERT INTO Actor VALUES(11,'Tom Hanks','California','1956-07-09','Male','6′ 0″');

INSERT INTO Actor VALUES(12,'Clint Eastwood','California','1930-05-31','Male','6′ 4″');

INSERT INTO Actor VALUES(13,'Keanu Reeves','Lebanon','1964-09-02','Male','6′ 1″');

INSERT INTO Actor VALUES(14,'Robert De Niro','New York','1943-08-17','Male','5′ 10″');

INSERT INTO Actor VALUES(15,'Mark Hamill','California','1951-09-21','Male','5′ 9″');

INSERT INTO Actor VALUES(16,'Jack Nicholson','New Jersey','1937-04-22','Male','5′ 10″');

INSERT INTO Actor VALUES(17,'Kang-ho Song','South Korea','1967-02-25','Male','5′ 11″');

INSERT INTO Actor VALUES(18,'Matthew McConaughey','Texas','1969-11-04','Male','6′ 0″');

INSERT INTO Actor VALUES(19,'Alexandre Rodrigues','Brazil','1983-05-21','Male','6′ 3″');

INSERT INTO Actor VALUES(20,'Bryan Cranston','California','1956-03-07','Male','5′ 11″');

INSERT INTO Actor VALUES(21,'Emilia Clarke','United Kingdom','1986-10-23','Female','5′ 2″');

INSERT INTO Actor VALUES(22,'Pedro Pascal','Chile','1975-04-02','Male','5′ 11″');

INSERT INTO Actor VALUES(23,'Jennifer Aniston','California','1969-02-11','Female','5′ 5″');

INSERT INTO Actor VALUES(24,'James Gandolfini','New Jersey','1961-09-18','Male','6′ 1″');

INSERT INTO Actor VALUES(25,'Fred Savage','Illinois','1976-07-09','Male','5′ 10″');

INSERT INTO Actor VALUES(26,'Jerry Seinfeld','New York','1954-04-29','Male','5′ 11″');

INSERT INTO Actor VALUES(27,'Kevin Spacey','New Jersey','1959-07-26','Male','5′ 10″');

INSERT INTO Actor VALUES(28,'Jorge Garcia','Nebraska','1973-04-28','Male','6′ 0″');

INSERT INTO Actor VALUES(29,'Evan Rachel Wood','North Carolina','1987-09-07','Female','5′ 7″');

INSERT INTO Actor VALUES(30,'Millie Bobby Brown','Spain','2004-02-19','Female','5′ 3″');

INSERT INTO Actor VALUES(31,'David Duchovny','New York','1960-08-07','Male','6′ 0″');

INSERT INTO Actor VALUES(32,'Jessie Buckley','Ireland','1989-12-28','Female','5′ 7″');

INSERT INTO Actor VALUES(33,'Bob Odenkirk','Illinois','1962-10-22','Male','5′ 9″');

INSERT INTO Actor VALUES(34,'Seth MacFarlane','Connecticut','1973-10-26','Male','5′ 10″');

INSERT INTO Actor VALUES(35,'Amy Poehler','Massachussets','1971-09-16','Female','5′ 2″');

INSERT INTO Actor VALUES(36,'Dan Castellaneta','Illinois','1957-10-29','Male','5′ 10″');

INSERT INTO Actor VALUES(37,'Dominic West','United Kingdom','1969-10-15','Male','6′ 0″');

INSERT INTO Actor VALUES(38,'Kevin McKidd','United Kingdom','1973-08-09','Male','6′ 0″');

INSERT INTO Actor VALUES(39,'Justin Roiland','California','1980-02-21','Male','5′ 10″');



INSERT INTO Assignment VALUES (1,null ,1,1);

INSERT INTO Assignment VALUES (2,null ,2,2);

INSERT INTO Assignment VALUES (3, null,3,3);

INSERT INTO Assignment VALUES (4,null ,4,2);

INSERT INTO Assignment VALUES (5,null ,5,4);

INSERT INTO Assignment VALUES (6,null ,6,5);

INSERT INTO Assignment VALUES (7,null ,7,6);

INSERT INTO Assignment VALUES (8,null ,8,7);

INSERT INTO Assignment VALUES (9,null ,9,3);

INSERT INTO Assignment VALUES (10,null ,10,8);

INSERT INTO Assignment VALUES (11,null ,6,5);

INSERT INTO Assignment VALUES (12,null ,11,9);

INSERT INTO Assignment VALUES (13,null ,12,10);

INSERT INTO Assignment VALUES (14,null ,6,5);

INSERT INTO Assignment VALUES (15,null ,13,11);

INSERT INTO Assignment VALUES (16,null ,14,12);

INSERT INTO Assignment VALUES (17,null ,15,13);

INSERT INTO Assignment VALUES (18,null ,16,14);

INSERT INTO Assignment VALUES (19,null ,17,15);

INSERT INTO Assignment VALUES (20,null ,18,3);

INSERT INTO Assignment VALUES (21,null ,19,16);

INSERT INTO Assignment VALUES (null,1 ,20,17);

INSERT INTO Assignment VALUES (null,2 ,21,18);

INSERT INTO Assignment VALUES (null,3 ,22,19);

INSERT INTO Assignment VALUES (null,4 ,23,20);

INSERT INTO Assignment VALUES (null,5 ,25,21);

INSERT INTO Assignment VALUES (null,6 ,25,22);

INSERT INTO Assignment VALUES (null,7 ,26,23);

INSERT INTO Assignment VALUES (null,8 ,27,24);

INSERT INTO Assignment VALUES (null,9 ,28,25);

INSERT INTO Assignment VALUES (null,10 ,29,26);

INSERT INTO Assignment VALUES (null,11 ,30,27);

INSERT INTO Assignment VALUES (null,12 ,31,28);

INSERT INTO Assignment VALUES (null,13 ,32,29);

INSERT INTO Assignment VALUES (null,14,33,30);

INSERT INTO Assignment VALUES (null,15 ,22,31);

INSERT INTO Assignment VALUES (null,16 ,34,32);

INSERT INTO Assignment VALUES (null,17 ,35,33);

INSERT INTO Assignment VALUES (null,18 ,36,34);

INSERT INTO Assignment VALUES (null,19 ,37,35);

INSERT INTO Assignment VALUES (null,20 ,38,36);

INSERT INTO Assignment VALUES (null,21 ,39,37);



INSERT INTO Photo VALUES(1,1,"IMG1","English","2021-05-10");

INSERT INTO Photo VALUES(2,2,"IMG2","English","2021-02-11");

INSERT INTO Photo VALUES(3,3,"IMG3","Hindi","2021-04-10");

INSERT INTO Photo VALUES(4,4,"IMG4","Spanish","2021-06-15");

INSERT INTO Photo VALUES(5,5,"IMG5","Itailian","2021-07-20");

INSERT INTO Photo VALUES(6,6,"IMG6","English","2021-08-20");

INSERT INTO Photo VALUES(7,7,"IMG7","Hindi","2021-09-21");

INSERT INTO Photo VALUES(8,8,"IM81","Spanish","2021-06-15");

INSERT INTO Photo VALUES(9,9,"IMG9","Deutsch","2021-10-09");

INSERT INTO Photo VALUES(10,10,"IMG10","Deutsch","2021-02-01");

INSERT INTO Photo VALUES(11,6,"IMG11","German","2021-01-29");

INSERT INTO Photo VALUES(12,11,"IMG12","English","2021-06-15");

INSERT INTO Photo VALUES(13,12,"IMG13","Spanish","2021-11-11");

INSERT INTO Photo VALUES(14,6,"IMG14","Hindi","2021-08-19");

INSERT INTO Photo VALUES(15,13,"IMG15","English","2021-10-11");

INSERT INTO Photo VALUES(16,14,"IMG16","Tamil","2021-04-28");

INSERT INTO Photo VALUES(17,15,"IMG17","Spanish","2021-06-15");

INSERT INTO Photo VALUES(18,16,"IMG18","Italian","2021-07-07");

INSERT INTO Photo VALUES(19,17,"IMG19","Tamil","2021-12-12");

INSERT INTO Photo VALUES(20,18,"IMG20","Spanish","2021-03-03");

INSERT INTO Photo VALUES(21,19,"IMG21","English","2021-02-02");

INSERT INTO Photo VALUES(22,20,"IMG22","English","2021-05-21");

INSERT INTO Photo VALUES(23,21,"IMG23","German","2021-07-01");

INSERT INTO Photo VALUES(24,22,"IMG24","Spanish","2021-11-15");

INSERT INTO Photo VALUES(25,23,"IMG25","Telgu","2021-01-10");

INSERT INTO Photo VALUES(26,24,"IMG26","Telgu","2021-06-15");

INSERT INTO Photo VALUES(27,25,"IMG27","Hindi","2021-09-12");

INSERT INTO Photo VALUES(28,26,"IMG28","Spanish","2021-12-30");

INSERT INTO Photo VALUES(29,27,"IMG29","English","2021-11-15");

INSERT INTO Photo VALUES(30,28,"IMG30","Spanish","2021-11-30");

INSERT INTO Photo VALUES(31,27,"IMG31","English","2021-08-23");

INSERT INTO Photo VALUES(32,29,"IMG32","Spanish","2021-03-15");

INSERT INTO Photo VALUES(33,30,"IMG33","Hindi","2021-02-21");

INSERT INTO Photo VALUES(34,31,"IMG34","Spanish","2021-07-07");

INSERT INTO Photo VALUES(35,31,"IMG35","English","2021-03-21");

INSERT INTO Photo VALUES(36,32,"IMG36","Spanish","2021-06-09");

INSERT INTO Photo VALUES(37,33,"IMG37","Hindi","2021-06-21");

INSERT INTO Photo VALUES(38,34,"IMG38","English","2021-09-15");

INSERT INTO Photo VALUES(39,35,"IMG39","Tamil","2021-11-04");

INSERT INTO Photo VALUES(40,36,"IMG40","English","2021-08-19");

INSERT INTO Photo VALUES(41,37,"IMG41","Hindi","2021-09-21");

INSERT INTO Photo VALUES(42,38,"IMG42","English","2021-08-11");

INSERT INTO Photo VALUES(43,39,"IMG43","Spanish","2021-06-19");

INSERT INTO Photo VALUES(44,39,"IMG44","German","2021-10-18");

INSERT INTO Photo VALUES(45,31,"IMG45","German","2021-10-16");

INSERT INTO Photo VALUES(46,17,"IMG46","English","2021-09-12");

INSERT INTO Photo VALUES(47,39,"IMG47","French","2021-05-07");

INSERT INTO Photo VALUES(48,21,"IMG48","English","2021-04-12");

INSERT INTO Photo VALUES(49,35,"IMG49","Spanish","2021-08-29");

INSERT INTO Photo VALUES(50,35,"IMG49","French","2021-08-13");

INSERT INTO Photo VALUES(51,35,"IMG50","Telgu","2021-07-23");


INSERT INTO User VALUES ('Sleepin_Dragon', 'Male', 'California'),
('Kirpianuscus', 'Female', 'California'),
('Hitchcoc', 'Male', 'Los Angeles'),
('MartinHafer', 'Female', 'Chicago'),
('bkoganbing', 'Male', 'New Orleans'),
('SnoopyStyle', 'Female', 'Chicago'),
('Leofwine_draca', 'Male', 'California'),
('TheLittleSongbird', 'Female', 'Los Angeles'),
('Horst_In_Translation', 'Male', 'Chicago'),
('rmax304823', 'Male', 'California'),
('bob the moo', 'Female', 'New Orleans'),
('kosmasp', 'Male', 'Chicago'),
('claudio_carvalho', 'Male', 'California'),
('dhruvi_kumar', 'Male', 'Los Angeles'),
('lee_eisenberg', 'Female', 'Newyork'),
('jackboy', 'Male', 'Newyork'),
('FeastMode', 'Male', 'California'),
('TxMike', 'Male', 'Chicago'),
('Gordon-11', 'Female', 'Newyork'),
('AaronCapenBanner', 'Male', 'Newyork'),
('evanston_dad', 'Female', 'Chicago'),
('ma-cortes', 'Female', 'California'),
('bevo-13678', 'Male', 'Los Angeles'),
('view_and_review', 'Female', 'Chicago'),
('Calicodreamin', 'Male', 'New Orleans'),
('jackDee-56565', 'Female', 'Chicago'),
('Crowbot-2', 'Male', 'California'),
('pennyelenabooks', 'Female', 'Los Angeles'),
('jack_o_hasanov_imdb', 'Male', 'Chicago'),
('briancham1994', 'Male', 'California'),
('yoggwork', 'Female', 'New Orleans'),
('gwnightscream', 'Male', 'Chicago'),
('cinemamoviecars', 'Male', 'California'),
('grantss', 'Male', 'Los Angeles'),
('nairtejas', 'Female', 'Newyork'),
('TheBigSick', 'Male', 'Newyork'),
('Quinoa1984', 'Male', 'California'),
('deloudelouvain', 'Male', 'Chicago'),
('redryan64', 'Female', 'Newyork'),
('John6Daniels', 'Male', 'Newyork'),
('auuwws', 'Female', 'Chicago'),
('digitalbeachbum', 'Female', 'Chicago');


INSERT INTO Review VALUES (1, 1, null , 'Sleepin_Dragon', 9.4, "It is no wonder that the film has such a high rating, it is quite literally breathtaking. What can I say that hasn't said before? Not much, it's the story, the acting, the premise, but most of all, this movie is about how it makes you feel. Sometimes you watch a film, and can't remember it days later, this film loves with you, once you've seen it, you don't forget.", "2021-02-17"),
(2, 2, null, 'Kirpianuscus', 9.2, "I saw it very late. the fame was one of basic motives. the theme - the second cause. for many friends, to see it was an experience. and it is an experience. without can say why. because , in a film about Mafia , for a special public, at first sigh, all is perfect. so perfect than, scene by scene, it becomes more than a masterpiece. great actors. special performances. memorable scenes. dialogues and situations and a cold feeling. a film about values. and near every day reality. and choices, errors and mistakes. who, after decades, remains fresh in memory. as an unique meet.", "2018-01-16"),
(3, 3, null , 'Hitchcoc', 9.0, "This movie has everything. The cameras, the sounds, the really cool characters. For me, it's one of few adventure movies worth watching more than once. And, of course, Heath Ledger is as awesome as everyone says. The characterization is so much deeper than the other films. We get to see multidimensional people with purpose, even if the purpose to to kill and maim.", "2009-01-19"),
(4, 4, null , 'MartinHafer', 9.0, "The film IS great--and deserved the Best Picture Award and its placement at #3 on IMDb's Top 100 list! And, since there are over 500 reviews for it on the site, I can't think of why I am even bothering to review it. After all, what's one more review that sings its praises?!", "2013-03-13"),
(5, 5, null, 'bkoganbing', 9.0, "This movie came out of an era that I really loved, when ensemble acting was so strong. We had a whole group of character actors who really took seriously the smaller roles that they had. The direction by Sidney Lumet on this film is outstanding.", "2006-02-17"),
(6, 6, null, 'SnoopyStyle', 8.9, "The conclusion of the best movie of fantasy and adventure ever made is in the same level of the other two parts of this splendid story. The journey of Frodo Baggins and his friends in this movie is again outstanding, stunning, a masterpiece.", "2004-05-04"),
(7, 7, null, 'TheLittleSongbird', 8.9, "What can I say? This film is amazing, and I would go further and say it is my favourite Quentin Tarantino film, and one of my favourites of the 90s. The cinematography and scenery are spellbinding, and the soundtrack is brilliant, one of the best soundtracks in a Tarantino film actually.", "2010-12-09"),
(8, 8, null, 'Leofwine_draca', 8.9, "I can't possibly describe with words how great Schindler's List is. You can't realize it unless you watch it. Spielberg not only makes you feel like you're in the middle of it, but you continue feeling that way for hours after watching the movie.", "2005-08-05"),
(9, 9, null, 'Horst_In_Translation', 8.8, "So far, Christopher Nolan has not disappointed me as a director, and Inception is another good one. Leonardo DiCaprio plays Dom Cobb, who has the technology to enter people's dreams to obtain secret information. The climax comes when Cobb and his cohorts enter the dream of an executive, going deeper and deeper into his subconscious.", "2010-07-10"),
(10, 10, null, 'rmax304823', 8.8, "Perhaps a little too long, but Fight Club is just a very well-made, brilliantly written and superlatively performed film. Essentially a satirical fable, it tells of an insomniac loser teaming up with a seditious soap salesman to form a no-holds-barred-fight club as an outlet for their direction-less aggression.", "2010-05-10"),
(11, 11, null, 'bob the moo', 8.8, "In my opinion this is the best movie of fantasy and adventure ever made. The journey of Frodo Baggins and the Fellowship of the Ring is outstanding, stunning, a masterpiece. I believe there is nothing else to be said about this fantastic movie. My vote is ten.", "2003-09-01"),
(12, 12, null, 'kosmasp', 8.8, "Please understand that despite my summary, I did enjoy this clever film. There was a lot to like. However, little of the film seemed Oscar-worthy and it probably should not be in the IMDb top 250. I think this is a great case of a very good film that has been prematurely elevated to greatness.", "2008-09-15"),
(13, 13, null, 'claudio_carvalho', 8.8, "The action is bigger than before. The scale of the movie is bigger. The number of people is bigger. The sets are bigger. The battle scene is gigantic. But it's Eli Wallach that steals the show. He is able to bring humor into this movie. He and Clint really have great chemistry together.", "2013-09-23"),
(14, 14, null, 'dhruvi_kumar', 8.7, "This sequel of the best movie of fantasy and adventure ever made can not be seen as another movie, but the second part of a splendid film. The journey of Frodo Baggins and his friends in this movie is also outstanding, stunning, a masterpiece. I believe there is nothing else to be said about this fantastic movie. My vote is ten.", "2003-09-01"),
(15, 15, null, 'lee_eisenberg', 8.7, "When The Matrix first came out, it looked like another cheap action flick, but turned out to be quite good. The premise suggests that everything that we see in life is false, and that we're all prisoners of something called the Matrix. ", "2005-09-21"),
(16, 16, null, 'Calicodreamin', 8.7, "Love Ray Liotta in this movie, he is the perfect wiseguy. Cool, handsome, and just a bit deranged. Well developed storyline, especially since it's based on a true story, and great acting. Exactly what I to expect in a gangster movie.", "2021-01-10"),
(17, 17, null, 'FeastMode', 8.7, "Hey!!! breath of fresh air after the garbage that was episode VI. it still wasn't good overall, but significantly more watchable. a few cool action scenes, the light saber fights were decent. better characters, better story. acting still bad, except han, he's pretty awesome. still lots of stupid parts and old movie qualities.", "2019-12-26"),
(18, 18, null, 'TxMike', 8.7, "Based on Ken Kesey's novel, 'One Flew Over the Cuckoo's Nest' is still the ultimate story of rebelling against authority. Jack Nicholson gives the performance of a lifetime as mental patient Randle Patrick McMurphy, resisting the dictatorial Nurse Ratched ", "2005-08-15"),
(19, 19, null, 'Gordon-11', 8.6, "This is a really good story that keeps me at the edge of my seat, even though there is nothing adrenaline inducing. The suspense is quite chilling, and I jus cannot wait to find out what will happen in the end. It is a sad and thought provoking story, which begs for much deep analysis and soul searching.", "2019-11-25"),
(20, 20, null, 'AaronCapenBanner', 8.6, "Big ideas at work here, and Nolan's direction is superb, as are the performances, though this story doesn't seem to know when to quit, becoming a bit far-fetched at the climax, but still remains an impressive endeavor nonetheless.", "2015-04-03"),
(21, 21, null, 'evanston_dad', 8.6, "'City of God' is an adrenaline jolt of a film that for once manages to find a balance between stylistics and substance.", "2005-04-29"),
(22, null, 1, 'ma-cortes', 9.4, "This is the best of television which can be found on cable. Walter White is a complex character that actually grows over the life of the show. He is a good character that we root for at the beginning even thought he's become a criminal. The journey he makes is one worthy of great literature. It is absolutely must see TV.", "2013-09-30"),
(23, null, 2, 'bevo-13678', 9.2, "Great show with dragons, sex, fighting, dwarfs and cooking tips", "2020-05-16"),
(24, null, 3, 'view_and_review', 8.8, "I'm amazed at how going off track from the main Star Wars storyline has produced, arguably, better movies and shows. Sure, Baby Yoda aka Grogu, is adorable enough to make any warm-blooded person fall in love.", "2020-12-19"),
(25, null, 4, 'Calicodreamin', 8.8, "Friends has some undoubtedly funny moments and was well cast. The guest appearances were fun and the storylines mostly worked. I found Ross to be an unbearably annoying character, not very funny and whiny. Monica and Phoebe were hilarious and loved their characters.", "2020-04-27"),
(26, null, 5, 'jackDee-56565', 9.2, "I have watched three seasons and am currently on season four, many peoplehypethis saying its its the greatest show ever, I am entertained with it but it has its problems the family drama side characters suck but its totally funny and all the main actors are great, I just wish it'd follow and focus on the mafia more and tone down silly subplots.", "2020-09-20"),
(27, null, 6, 'Crowbot-2', 8.3, "I love this show. I remember when I was five sitting down in front of the tube and watching it, with my eyes wide, and my face stretched to the max with a smile. I can still remember coming home from school and watching it, and clinging on to every word like a good book. This show helped me grow up.", "2000-03-28"),
(28, null, 7, 'pennyelenabooks', 8.8, "Seinfeld was enjoyable. The main reason of entertainment is the characters, funny and unique. The representation of New York life back in the 90s was pretty nostalgic and exciting as well.", "2020-02-13"),
(29, null, 8, 'jack_o_hasanov_imdb', 8.7, "I've seen a few frames from this drama and probably subconsciously seen it in my sleep. Shame on Spacey, the last season was bad but apart from the last season it was great.", "2021-08-09"),
(30, null, 9, 'briancham1994', 8.3, "This is my favourite TV show. It is odd and experimental at times as it combines a vast ensemble cast with complex narrative tricks, alternate timelines, incredible mysteries and big questions.", "2020-08-06"),
(31, null, 10, 'yoggwork', 8.6, "Layers and layers of mist, who is the man and who is the robot. It didn't seem very clear until the end, when the plot reached its climax, it was cut off.", "2019-02-18"),
(32, null, 11, 'gwnightscream', 8.7, "This is a very solid series with a promising premise. It really gets the style down well with a lot of 80s homages.", "2020-06-20"),
(33, null, 12, 'cinemamoviecars', 8.6, "Thanks to this tv series, i discovered that i like this kind of stuff is the best for me. David duchovny and gillian anderson are the best on-screen couple of fbi detectives searching mistery every week.", "2021-09-10"),
(34, null, 13, 'grantss', 9.4, "Great show. I've heard it happened exactly like that in real life", "2017-06-26"),
(35, null, 14, 'nairtejas', 8.8, "Of course I should have started this series after the BB , I'm glad I did, it's an excellent TV show.", "2015-04-06"),
(36, null, 15, 'TheBigSick', 8.8, "Loved this series and the story of Pablo Escobar. Not known to his life or name but then the series lets you know the whole story.", "2020-05-24"),
(37, null, 16, 'Quinoa1984', 8.1, "Family Guy is the next best thing to come around pon comic animation. I laugh in every episode at the antics of Peter and his family. Baby Stewey is the funniest animated character since Homer Simpson. Family Guy is the next best thing to come around pon comic animation. I laugh in every episode at the antics of Peter and his family. Baby Stewey is the funniest animated character since Homer Simpson. ", "2000-08-12"),
(38, null, 17, 'deloudelouvain', 8.6, "I reckon that manager bloke looks angry all the time", "2020-12-16"),
(39, null, 18, 'redryan64', 8.6, "This cartoon series has everything you'd want - memorable characters, funny gags and insightful stories. ", "2020-08-20"),
(40, null, 19, 'John6Daniels', 9.3, "Great show, great production. Great quality. The Wire was a show about growth and positivity for the urban citizens.", "2003-04-30"),
(41, null, 20, 'auuwws', 8.7, "A very excellent series and a very good acting performance by most of the actors, especially those who played the role of August Cesar in the second part", "2020-10-20"),
(42, null, 21, 'digitalbeachbum', 9.2, "I didn't want to watch this show. I am happy that I have given up on this decision.", "2021-08-09");

INSERT INTO AWARDS VALUES (1, 1, 1, "Academy Award", 2004, "Winner");

INSERT INTO AWARDS VALUES (2, 1, 1, "Academy Award", 1996, "Nominee");

INSERT INTO AWARDS VALUES (3, 2, 1, "BAFTA Film Award", 2004, "Nominee");

INSERT INTO AWARDS VALUES (4, 2, 1, "BAFTA Film Award", 1993, "Nominee");

INSERT INTO AWARDS VALUES (5, 3, 1, "Cannes Film Festival", 1999, "Nominee");

INSERT INTO AWARDS VALUES (6, 3, 1, "Cannes Film Festival", 1992, "Winner");

INSERT INTO AWARDS VALUES (7, 1, 2, "Academy Awards", 1990, "Nominee");

INSERT INTO AWARDS VALUES (8, 1, 2, "Academy Awards", 1974, "Nominee");

INSERT INTO AWARDS VALUES (9, 1, 2, "Academy Awards", 1973, "Winner");

INSERT INTO AWARDS VALUES (10, 1, 2, "Academy Awards", 1958, "Nominee");

INSERT INTO AWARDS VALUES (11, 1, 2, "Academy Awards", 1955, "Winner");

INSERT INTO AWARDS VALUES (12, 1, 2, "Academy Awards", 1954, "Nominee");

INSERT INTO AWARDS VALUES (13, 1, 2, "Academy Awards", 1953, "Nominee");

INSERT INTO AWARDS VALUES (14, 1, 2, "Academy Awards", 1952, "Nominee");

INSERT INTO AWARDS VALUES (15, 2, 2, "BAFTA Film Award", 1990, "Nominee");

INSERT INTO AWARDS VALUES (16, 2, 2, "BAFTA Film Award", 1974, "Nominee");

INSERT INTO AWARDS VALUES (17, 2, 2, "BAFTA Film Award", 1973, "Nominee");

INSERT INTO AWARDS VALUES (18, 2, 2, "BAFTA Film Award", 1959, "Nominee");

INSERT INTO AWARDS VALUES (19, 2, 2, "BAFTA Film Award", 1955, "Winner");

INSERT INTO AWARDS VALUES (20, 2, 2, "BAFTA Film Award", 1954, "Winner");

INSERT INTO AWARDS VALUES (21, 2, 2, "BAFTA Film Award", 1953, "Winner");

INSERT INTO AWARDS VALUES (22, 3, 2, "Cannes Film Festival", 1952, "Winner");

INSERT INTO AWARDS VALUES (23, 1, 3, "Academy Awards", 2019, "Nominee");

INSERT INTO AWARDS VALUES (24, 1, 3, "Academy Awards", 2016, "Nominee");

INSERT INTO AWARDS VALUES (25, 1, 3, "Academy Awards", 2014, "Nominee");

INSERT INTO AWARDS VALUES (26, 1, 3, "Academy Awards", 2011, "Winner");

INSERT INTO AWARDS VALUES (27, 2, 3, "BAFTA Film Award", 2019, "Nominee");

INSERT INTO AWARDS VALUES (28, 2, 3, "BAFTA Film Award", 2016, "Nominee");

INSERT INTO AWARDS VALUES (29, 2, 3, "BAFTA Film Award", 2014, "Nominee");

INSERT INTO AWARDS VALUES (30, 2, 3, "BAFTA Film Award", 2011, "Nominee");

INSERT INTO AWARDS VALUES (31, 1, 4, "Academy Awards", 2020, "Nominee");

INSERT INTO AWARDS VALUES (32, 1, 4, "Academy Awards", 1993, "Winner");

INSERT INTO AWARDS VALUES (33, 1, 4, "Academy Awards", 1993, "Nominee");

INSERT INTO AWARDS VALUES (34, 1, 4, "Academy Awards", 1991, "Nominee");

INSERT INTO AWARDS VALUES (35, 1, 4, "Academy Awards", 1980, "Nominee");

INSERT INTO AWARDS VALUES (36, 1, 4, "Academy Awards", 1976, "Nominee");

INSERT INTO AWARDS VALUES (37, 1, 4, "Academy Awards", 1975, "Nominee");

INSERT INTO AWARDS VALUES (38, 1, 4, "Academy Awards", 1974, "Nominee");

INSERT INTO AWARDS VALUES (39, 1, 4, "Academy Awards", 1973, "Nominee");

INSERT INTO AWARDS VALUES (40, 2, 4, "BAFTA Film Award", 2020, "Nominee");

INSERT INTO AWARDS VALUES (41, 2, 4, "BAFTA Film Award", 1991, "Nominee");

INSERT INTO AWARDS VALUES (42, 2, 4, "BAFTA Film Award", 1976, "Winner");

INSERT INTO AWARDS VALUES (43, 2, 4, "BAFTA Film Award", 1975, "Nominee");

INSERT INTO AWARDS VALUES (44, 2, 4, "BAFTA Film Award", 1973, "Nominee");

INSERT INTO AWARDS VALUES (45, 3, 4, "Cannes Film Festival", 1996, "Nominee");

INSERT INTO AWARDS VALUES (46, 1, 5, "Academy Awards", 1982, "Winner");

INSERT INTO AWARDS VALUES (47, 1, 5, "Academy Awards", 1981, "Winner");

INSERT INTO AWARDS VALUES (48, 1, 5, "Academy Awards", 1958, "Nominee");

INSERT INTO AWARDS VALUES (49, 1, 5, "Academy Awards", 1941, "Nominee");

INSERT INTO AWARDS VALUES (50, 2, 5, "BAFTA Film Award", 1983, "Nominee");

INSERT INTO AWARDS VALUES (51, 2, 5, "BAFTA Film Award", 1958, "Winner");

INSERT INTO AWARDS VALUES (52, 1, 7, "Academy Awards", 1995, "Nominee");

INSERT INTO AWARDS VALUES (53, 1, 7, "Academy Awards", 1978, "Nominee");

INSERT INTO AWARDS VALUES (54, 2, 7, "BAFTA Film Award", 1995, "Nominee");

INSERT INTO AWARDS VALUES (55, 1, 8, "Academy Awards", 1994, "Nominee");

INSERT INTO AWARDS VALUES (56, 1, 9, "Academy Awards", 2020, "Nominee");

INSERT INTO AWARDS VALUES (57, 1, 9, "Academy Awards", 2016, "Nominee");

INSERT INTO AWARDS VALUES (58, 1, 9, "Academy Awards", 2020, "Winner");

INSERT INTO AWARDS VALUES (59, 1, 9, "Academy Awards", 2014, "Nominee");

INSERT INTO AWARDS VALUES (60, 1, 9, "Academy Awards", 2007, "Nominee");

INSERT INTO AWARDS VALUES (61, 1, 9, "Academy Awards", 2005, "Nominee");

INSERT INTO AWARDS VALUES (62, 1, 9, "Academy Awards", 1994, "Nominee");

INSERT INTO AWARDS VALUES (63, 2, 9, "BAFTA Film Award", 2020, "Nominee");

INSERT INTO AWARDS VALUES (64, 2, 9, "BAFTA Film Award", 2016, "Winner");

INSERT INTO AWARDS VALUES (65, 2, 9, "BAFTA Film Award", 2014, "Nominee");

INSERT INTO AWARDS VALUES (66, 2, 9, "BAFTA Film Award", 2007, "Nominee");

INSERT INTO AWARDS VALUES (67, 2, 9, "BAFTA Film Award", 2005, "Nominee");

INSERT INTO AWARDS VALUES (68, 2, 9, "BAFTA Film Award", 2020, "Nominee");

INSERT INTO AWARDS VALUES (69, 1, 10, "Academy Awards", 2020, "Winner");

INSERT INTO AWARDS VALUES (70, 1, 10, "Academy Awards", 2016, "Nominee");

INSERT INTO AWARDS VALUES (71, 1, 10, "Academy Awards", 2014, "Winner");

INSERT INTO AWARDS VALUES (72, 1, 10, "Academy Awards", 2012, "Nominee");

INSERT INTO AWARDS VALUES (73, 1, 10, "Academy Awards", 2009, "Nominee");

INSERT INTO AWARDS VALUES (74, 1, 10, "Academy Awards", 1996, "Nominee");

INSERT INTO AWARDS VALUES (75, 2, 10, "BAFTA Film Award", 2012, "Winner");

INSERT INTO AWARDS VALUES (76, 2, 10, "BAFTA Film Award", 2016, "Nominee");

INSERT INTO AWARDS VALUES (77, 2, 10, "BAFTA Film Award", 2014, "Winner");

INSERT INTO AWARDS VALUES (78, 2, 10, "BAFTA Film Award", 2012, "Nominee");

INSERT INTO AWARDS VALUES (79, 2, 10, "BAFTA Film Award", 2009, "Nominee");

INSERT INTO AWARDS VALUES (80, 2, 10, "BAFTA Film Award", 2007, "Nominee");

INSERT INTO AWARDS VALUES (81, 1, 11, "Academy Awards", 2020, "Nominee");

INSERT INTO AWARDS VALUES (82, 1, 11, "Academy Awards", 2001, "Nominee");

INSERT INTO AWARDS VALUES (83, 1, 11, "Academy Awards", 1999, "Nominee");

INSERT INTO AWARDS VALUES (84, 1, 11, "Academy Awards", 1995, "Winner");

INSERT INTO AWARDS VALUES (85, 1, 11, "Academy Awards", 1994, "Winner");

INSERT INTO AWARDS VALUES (86, 1, 11, "Academy Awards", 1989, "Nominee");

INSERT INTO AWARDS VALUES (87, 2, 11, "BAFTA Film Award", 2020, "Nominee");

INSERT INTO AWARDS VALUES (88, 2, 11, "BAFTA Film Award", 2014, "Nominee");

INSERT INTO AWARDS VALUES (89, 2, 11, "BAFTA Film Award", 2001, "Nominee");

INSERT INTO AWARDS VALUES (90, 2, 11, "BAFTA Film Award", 1999, "Nominee");

INSERT INTO AWARDS VALUES (91, 2, 11, "BAFTA Film Award", 1995, "Nominee");

INSERT INTO AWARDS VALUES (92, 1, 12, "Academy Awards", 2015, "Nominee");

INSERT INTO AWARDS VALUES (93, 1, 12, "Academy Awards", 2007, "Nominee");

INSERT INTO AWARDS VALUES (94, 1, 12, "Academy Awards", 2005, "Winner");

INSERT INTO AWARDS VALUES (95, 1, 12, "Academy Awards", 2005, "Nominee");

INSERT INTO AWARDS VALUES (96, 1, 12, "Academy Awards", 2004, "Nominee");

INSERT INTO AWARDS VALUES (97, 1, 12, "Academy Awards", 1995, "Winner");

INSERT INTO AWARDS VALUES (98, 1, 12, "Academy Awards", 1993, "Winner");

INSERT INTO AWARDS VALUES (99, 1, 12, "Academy Awards", 1993, "Nominee");

INSERT INTO AWARDS VALUES (100, 2, 12, "BAFTA Film Award", 2009, "Nominee");

INSERT INTO AWARDS VALUES (101, 2, 12, "BAFTA Film Award", 1993, "Nominee");

INSERT INTO AWARDS VALUES (102, 1, 14, "Academy Awards", 2020, "Nominee");

INSERT INTO AWARDS VALUES (103, 1, 14, "Academy Awards", 2013, "Nominee");

INSERT INTO AWARDS VALUES (104, 1, 14, "Academy Awards", 1992, "Nominee");

INSERT INTO AWARDS VALUES (105, 1, 14, "Academy Awards", 1991, "Nominee");

INSERT INTO AWARDS VALUES (106, 1, 14, "Academy Awards", 1981, "Winner");

INSERT INTO AWARDS VALUES (107, 1, 14, "Academy Awards", 1979, "Nominee");

INSERT INTO AWARDS VALUES (108, 1, 14, "Academy Awards", 1977, "Nominee");

INSERT INTO AWARDS VALUES (109, 1, 14, "Academy Awards", 1975, "Winner");

INSERT INTO AWARDS VALUES (110, 2, 14, "BAFTA Film Award", 2020, "Nominee");

INSERT INTO AWARDS VALUES (111, 2, 14, "BAFTA Film Award", 1991, "Nominee");

INSERT INTO AWARDS VALUES (112, 2, 14, "BAFTA Film Award", 1984, "Nominee");

INSERT INTO AWARDS VALUES (113, 2, 14, "BAFTA Film Award", 1982, "Nominee");

INSERT INTO AWARDS VALUES (114, 2, 14, "BAFTA Film Award", 1980, "Nominee");

INSERT INTO AWARDS VALUES (115, 2, 14, "BAFTA Film Award", 1977, "Nominee");

INSERT INTO AWARDS VALUES (116, 2, 14, "BAFTA Film Award", 1976, "Nominee");

INSERT INTO AWARDS VALUES (117, 2, 15, "BAFTA Film Award", 2016, "Nominee" );

INSERT INTO AWARDS VALUES (118, 2, 15, "BAFTA Film Award", 2012, "Winner" );

INSERT INTO AWARDS VALUES (119, 1, 16, "Academy Awards", 2003, "Nominee");

INSERT INTO AWARDS VALUES (120, 1, 16, "Academy Awards", 1998, "Winner");

INSERT INTO AWARDS VALUES (121, 1, 16, "Academy Awards", 1993, "Nominee");

INSERT INTO AWARDS VALUES (122, 1, 16, "Academy Awards", 1988, "Nominee");

INSERT INTO AWARDS VALUES (123, 1, 16, "Academy Awards", 1986, "Nominee");

INSERT INTO AWARDS VALUES (124, 1, 16, "Academy Awards", 1984, "Winner");

INSERT INTO AWARDS VALUES (125, 1, 16, "Academy Awards", 1982, "Nominee");

INSERT INTO AWARDS VALUES (126, 1, 16, "Academy Awards", 1976, "Winner");

INSERT INTO AWARDS VALUES (127, 1, 16, "Academy Awards", 1975, "Nominee");

INSERT INTO AWARDS VALUES (128, 1, 16, "Academy Awards", 1974, "Nominee");

INSERT INTO AWARDS VALUES (129, 1, 16, "Academy Awards", 1971, "Nominee");

INSERT INTO AWARDS VALUES (130, 1, 16, "Academy Awards", 1970, "Nominee");

INSERT INTO AWARDS VALUES (131, 2, 16, "BAFTA Film Award", 2007, "Nominee");

INSERT INTO AWARDS VALUES (132, 2, 16, "BAFTA Film Award", 2003, "Nominee");

INSERT INTO AWARDS VALUES (133, 2, 16, "BAFTA Film Award", 1990, "Nominee");

INSERT INTO AWARDS VALUES (134, 2, 16, "BAFTA Film Award", 1983, "Winner");

INSERT INTO AWARDS VALUES (135, 2, 16, "BAFTA Film Award", 1977, "Winner");

INSERT INTO AWARDS VALUES (136, 2, 16, "BAFTA Film Award", 1975, "Winner");

INSERT INTO AWARDS VALUES (137, 2, 16, "BAFTA Film Award", 1970, "Nominee");

INSERT INTO AWARDS VALUES (138, 3, 16, "Cannes Film Festival", 1974, "Winner");

INSERT INTO AWARDS VALUES (139, 3, 16, "Cannes Film Festival", 1971, "Nominee");

INSERT INTO AWARDS VALUES (140, 1, 18, "Academy Awards", 2014, "Winner");

INSERT INTO AWARDS VALUES (141, 1, 20, "Academy Awards", 2016, "Winner");

INSERT INTO AWARDS VALUES (142, 2, 20, "BAFTA Film Award", 2016, "Winner");

INSERT INTO AWARDS VALUES (143, 4, 20, "Primetime Emmy Awards", 2018, "Nominee");

INSERT INTO AWARDS VALUES (144, 4, 20, "Primetime Emmy Awards", 2016, "Nominee");

INSERT INTO AWARDS VALUES (145, 4, 20, "Primetime Emmy Awards", 2014, "Winner");

INSERT INTO AWARDS VALUES (146, 4, 20, "Primetime Emmy Awards", 2013, "Winner");

INSERT INTO AWARDS VALUES (147, 4, 20, "Primetime Emmy Awards", 2013, "Nominee");

INSERT INTO AWARDS VALUES (148, 4, 20, "Primetime Emmy Awards", 2012, "Nominee");

INSERT INTO AWARDS VALUES (149, 4, 20, "Primetime Emmy Awards", 2010, "Winner");

INSERT INTO AWARDS VALUES (150, 4, 20, "Primetime Emmy Awards", 2009, "Winner");

INSERT INTO AWARDS VALUES (151, 4, 20, "Primetime Emmy Awards", 2008, "Winner");

INSERT INTO AWARDS VALUES (152, 4, 20, "Primetime Emmy Awards", 2006, "Nominee");

INSERT INTO AWARDS VALUES (153, 4, 20, "Primetime Emmy Awards", 2003, "Nominee");

INSERT INTO AWARDS VALUES (154, 4, 20, "Primetime Emmy Awards", 2002, "Nominee");

INSERT INTO AWARDS VALUES (155, 4, 21, "Primetime Emmy Awards", 2019, "Nominee");

INSERT INTO AWARDS VALUES (156, 4, 21, "Primetime Emmy Awards", 2016, "Nominee");

INSERT INTO AWARDS VALUES (157, 4, 21, "Primetime Emmy Awards", 2015, "Nominee");

INSERT INTO AWARDS VALUES (158, 4, 21, "Primetime Emmy Awards", 2013, "Nominee");

INSERT INTO AWARDS VALUES (159, 4, 23, "Primetime Emmy Awards", 2021, "Nominee");

INSERT INTO AWARDS VALUES (160, 4, 23, "Primetime Emmy Awards", 2020, "Nominee");

INSERT INTO AWARDS VALUES (161, 4, 23, "Primetime Emmy Awards", 2009, "Nominee");

INSERT INTO AWARDS VALUES (162, 4, 23, "Primetime Emmy Awards", 2004, "Nominee");

INSERT INTO AWARDS VALUES (163, 4, 23, "Primetime Emmy Awards", 2003, "Nominee");

INSERT INTO AWARDS VALUES (164, 4, 23, "Primetime Emmy Awards", 2002, "Winner");

INSERT INTO AWARDS VALUES (165, 4, 23, "Primetime Emmy Awards", 2001, "Nominee");

INSERT INTO AWARDS VALUES (166, 4, 23, "Primetime Emmy Awards", 2000, "Nominee");

INSERT INTO AWARDS VALUES (167, 4, 24, "Primetime Emmy Awards", 2012, "Nominee");

INSERT INTO AWARDS VALUES (168, 4, 24, "Primetime Emmy Awards", 2008, "Nominee");

INSERT INTO AWARDS VALUES (169, 4, 24, "Primetime Emmy Awards", 2007, "Nominee");

INSERT INTO AWARDS VALUES (170, 4, 24, "Primetime Emmy Awards", 2004, "Nominee");

INSERT INTO AWARDS VALUES (171, 4, 24, "Primetime Emmy Awards", 2003, "Winner");

INSERT INTO AWARDS VALUES (172, 4, 24, "Primetime Emmy Awards", 2001, "Winner");

INSERT INTO AWARDS VALUES (173, 4, 24, "Primetime Emmy Awards", 2000, "Winner");

INSERT INTO AWARDS VALUES (174, 4, 24, "Primetime Emmy Awards", 1999, "Nominee");

INSERT INTO AWARDS VALUES (175, 4, 25, "Primetime Emmy Awards", 1990, "Nominee");

INSERT INTO AWARDS VALUES (176, 4, 25, "Primetime Emmy Awards", 1989, "Nominee");

INSERT INTO AWARDS VALUES (177, 4, 26, "Primetime Emmy Awards", 2020, "Nominee");

INSERT INTO AWARDS VALUES (178, 4, 26, "Primetime Emmy Awards", 2019, "Nominee");

INSERT INTO AWARDS VALUES (179, 4, 26, "Primetime Emmy Awards", 2016, "Nominee");

INSERT INTO AWARDS VALUES (180, 4, 26, "Primetime Emmy Awards", 2014, "Nominee");

INSERT INTO AWARDS VALUES (181, 4, 26, "Primetime Emmy Awards", 2013, "Nominee");

INSERT INTO AWARDS VALUES (182, 4, 26, "Primetime Emmy Awards", 1999, "Nominee");

INSERT INTO AWARDS VALUES (183, 4, 26, "Primetime Emmy Awards", 1998, "Nominee");

INSERT INTO AWARDS VALUES (184, 4, 26, "Primetime Emmy Awards", 1997, "Nominee");

INSERT INTO AWARDS VALUES (185, 4, 26, "Primetime Emmy Awards", 1996, "Nominee");

INSERT INTO AWARDS VALUES (186, 4, 26, "Primetime Emmy Awards", 1995, "Nominee");

INSERT INTO AWARDS VALUES (187, 4, 26, "Primetime Emmy Awards", 1994, "Nominee");

INSERT INTO AWARDS VALUES (188, 4, 26, "Primetime Emmy Awards", 1993, "Winner");

INSERT INTO AWARDS VALUES (189, 4, 26, "Primetime Emmy Awards", 1992, "Nominee");

INSERT INTO AWARDS VALUES (190, 4, 26, "Primetime Emmy Awards", 1991, "Nominee");

INSERT INTO AWARDS VALUES (191, 1, 27, "Academy Awards", 2000, "Winner");

INSERT INTO AWARDS VALUES (192, 1, 27, "Academy Awards", 1996, "Nominee");

INSERT INTO AWARDS VALUES (193, 4, 27, "Primetime Emmy Awards", 2017, "Nominee");

INSERT INTO AWARDS VALUES (194, 4, 27, "Primetime Emmy Awards", 2016, "Nominee");

INSERT INTO AWARDS VALUES (195, 4, 27, "Primetime Emmy Awards", 2015, "Nominee");

INSERT INTO AWARDS VALUES (196, 4, 27, "Primetime Emmy Awards", 2014, "Nominee");

INSERT INTO AWARDS VALUES (197, 4, 27, "Primetime Emmy Awards", 2013, "Nominee");

INSERT INTO AWARDS VALUES (198, 4, 27, "Primetime Emmy Awards", 2008, "Nominee");

INSERT INTO AWARDS VALUES (199, 2, 27, "BAFTA Film Award", 2015, "Nominee");

INSERT INTO AWARDS VALUES (200, 2, 27, "BAFTA Film Award", 2002, "Nominee");

INSERT INTO AWARDS VALUES (201, 2, 27, "BAFTA Film Award", 2000, "Winner");

INSERT INTO AWARDS VALUES (202, 2, 27, "BAFTA Film Award", 1998, "Nominee");

INSERT INTO AWARDS VALUES (203, 4, 29, "Primetime Emmy Awards", 2018, "Nominee");

INSERT INTO AWARDS VALUES (204, 4, 29, "Primetime Emmy Awards", 2017, "Nominee");

INSERT INTO AWARDS VALUES (205, 4, 29, "Primetime Emmy Awards", 2011, "Nominee");

INSERT INTO AWARDS VALUES (206, 4, 30, "Primetime Emmy Awards", 2018, "Nominee");

INSERT INTO AWARDS VALUES (207, 4, 30, "Primetime Emmy Awards", 2017, "Nominee");

INSERT INTO AWARDS VALUES (208, 4, 31, "Primetime Emmy Awards", 2003, "Nominee");

INSERT INTO AWARDS VALUES (209, 4, 31, "Primetime Emmy Awards", 1998, "Nominee");

INSERT INTO AWARDS VALUES (210, 4, 31, "Primetime Emmy Awards", 1997, "Nominee");

INSERT INTO AWARDS VALUES (211, 2, 31, "BAFTA Film Award", 2008, "Nominee");

INSERT INTO AWARDS VALUES (212, 2, 32, "BAFTA Film Award", 2020, "Nominee");

INSERT INTO AWARDS VALUES (213, 2, 32, "BAFTA Film Award", 2019, "Nominee");

INSERT INTO AWARDS VALUES (214, 3, 32, "Cannes Film Festival", 2021, "Winner");

INSERT INTO AWARDS VALUES (215, 4, 33, "Primetime Emmy Awards", 2020, "Nominee");

INSERT INTO AWARDS VALUES (216, 4, 33, "Primetime Emmy Awards", 2019, "Nominee");

INSERT INTO AWARDS VALUES (217, 4, 33, "Primetime Emmy Awards", 2017, "Nominee");

INSERT INTO AWARDS VALUES (218, 4, 33, "Primetime Emmy Awards", 2016, "Nominee");

INSERT INTO AWARDS VALUES (219, 4, 33, "Primetime Emmy Awards", 2015, "Nominee");

INSERT INTO AWARDS VALUES (220, 4, 33, "Primetime Emmy Awards", 1999, "Nominee");

INSERT INTO AWARDS VALUES (221, 4, 33, "Primetime Emmy Awards", 1998, "Nominee");

INSERT INTO AWARDS VALUES (222, 4, 33, "Primetime Emmy Awards", 1993, "Nominee");

INSERT INTO AWARDS VALUES (223, 4, 33, "Primetime Emmy Awards", 1991, "Nominee");

INSERT INTO AWARDS VALUES (224, 4, 33, "Primetime Emmy Awards", 1990, "Nominee");

INSERT INTO AWARDS VALUES (225, 4, 33, "Primetime Emmy Awards", 1989, "Winner");

INSERT INTO AWARDS VALUES (226, 1, 34, "Academy Awards", 2013, "Nominee");

INSERT INTO AWARDS VALUES (227, 4, 34, "Primetime Emmy Awards", 2021, "Nominee");

INSERT INTO AWARDS VALUES (228, 4, 34, "Primetime Emmy Awards", 2019, "Winner");

INSERT INTO AWARDS VALUES (229, 4, 34, "Primetime Emmy Awards", 2018, "Nominee");

INSERT INTO AWARDS VALUES (230, 4, 34, "Primetime Emmy Awards", 2017, "Winner");

INSERT INTO AWARDS VALUES (231, 4, 34, "Primetime Emmy Awards", 2016, "Winner");

INSERT INTO AWARDS VALUES (232, 4, 34, "Primetime Emmy Awards", 2015, "Nominee");

INSERT INTO AWARDS VALUES (233, 4, 34, "Primetime Emmy Awards", 2014, "Nominee");

INSERT INTO AWARDS VALUES (234, 4, 34, "Primetime Emmy Awards", 2013, "Nominee");

INSERT INTO AWARDS VALUES (235, 4, 34, "Primetime Emmy Awards", 2012, "Nominee");

INSERT INTO AWARDS VALUES (236, 4, 34, "Primetime Emmy Awards", 2011, "Nominee");

INSERT INTO AWARDS VALUES (237, 4, 34, "Primetime Emmy Awards", 2010, "Nominee");

INSERT INTO AWARDS VALUES (328, 4, 34, "Primetime Emmy Awards", 2009, "Nominee");

INSERT INTO AWARDS VALUES (239, 4, 34, "Primetime Emmy Awards", 2008, "Nominee");

INSERT INTO AWARDS VALUES (240, 4, 34, "Primetime Emmy Awards", 2006, "Nominee");

INSERT INTO AWARDS VALUES (241, 4, 34, "Primetime Emmy Awards", 2005, "Nominee");

INSERT INTO AWARDS VALUES (242, 4, 34, "Primetime Emmy Awards", 2002, "Winner");

INSERT INTO AWARDS VALUES (243, 4, 34, "Primetime Emmy Awards", 2000, "Winner");

INSERT INTO AWARDS VALUES (244, 4, 34, "Primetime Emmy Awards", 2000, "Nominee");

INSERT INTO AWARDS VALUES (245, 2, 34, "BAFTA Film Award", 2010, "Nominee");

INSERT INTO AWARDS VALUES (246, 2, 34, "BAFTA Film Award", 2008, "Nominee");

INSERT INTO AWARDS VALUES (247, 4, 35, "Primetime Emmy Awards", 2020, "Nominee");

INSERT INTO AWARDS VALUES (248, 4, 35, "Primetime Emmy Awards", 2019, "Nominee");

INSERT INTO AWARDS VALUES (249, 4, 35, "Primetime Emmy Awards", 2016, "Winner");

INSERT INTO AWARDS VALUES (250, 4, 35, "Primetime Emmy Awards", 2015, "Nominee");

INSERT INTO AWARDS VALUES (251, 4, 35, "Primetime Emmy Awards", 2014, "Nominee");

INSERT INTO AWARDS VALUES (252, 4, 35, "Primetime Emmy Awards", 2013, "Nominee");

INSERT INTO AWARDS VALUES (253, 4, 35, "Primetime Emmy Awards", 2012, "Nominee");

INSERT INTO AWARDS VALUES (254, 4, 35, "Primetime Emmy Awards", 2011, "Nominee");

INSERT INTO AWARDS VALUES (255, 4, 35, "Primetime Emmy Awards", 2010, "Nominee");

INSERT INTO AWARDS VALUES (256, 4, 35, "Primetime Emmy Awards", 2009, "Nominee");

INSERT INTO AWARDS VALUES (257, 4, 35, "Primetime Emmy Awards", 2008, "Nominee");

INSERT INTO AWARDS VALUES (258, 4, 36, "Primetime Emmy Awards", 2018, "Nominee");

INSERT INTO AWARDS VALUES (259, 4, 36, "Primetime Emmy Awards", 2015, "Nominee");

INSERT INTO AWARDS VALUES (260, 4, 36, "Primetime Emmy Awards", 2011, "Nominee");

INSERT INTO AWARDS VALUES (261, 4, 36, "Primetime Emmy Awards", 2010, "Nominee");

INSERT INTO AWARDS VALUES (262, 4, 36, "Primetime Emmy Awards", 2009, "Winner");

INSERT INTO AWARDS VALUES (263, 4, 36, "Primetime Emmy Awards", 2004, "Winner");

INSERT INTO AWARDS VALUES (264, 4, 36, "Primetime Emmy Awards", 1993, "Winner");

INSERT INTO AWARDS VALUES (265, 4, 36, "Primetime Emmy Awards", 1992, "Winner");

INSERT INTO AWARDS VALUES (266, 2, 37, "BAFTA Film Award", 2014, "Nominee");

INSERT INTO AWARDS VALUES (267, 2, 37, "BAFTA Film Award", 2012, "Winner");

INSERT INTO AWARDS VALUES (268, 4, 39, "Primetime Emmy Awards", 2020, "Winner");

INSERT INTO AWARDS VALUES (269, 4, 39, "Primetime Emmy Awards", 2018, "Winner");
 
 SELECT ac.Actor_Name AS "Actor Name",count(aw.Award_Result) AS "No. of Nominations"
FROM Actor ac JOIN Awards aw ON ac.Actor_ID = aw.Actor_Id
WHERE aw.Award_Result = "Nominee"
GROUP BY ac.Actor_Name;

SELECT Show_Title AS "Show Title", (Show_End_Year - Show_Start_Year) AS "No. of Seasons"
FROM TV_Shows
WHERE Show_End_Year is not null;

SELECT Show_Title AS "Show Title", Show_Start_Year AS "Show Start Year"
FROM TV_Shows
WHERE isnull(Show_End_Year);

SELECT a.Actor_Name AS "Actor Name", count(m.Movie_Title) As "No. of Movies Performed"
FROM ACTOR a JOIN Assignment g ON a.Actor_Id = g.Actor_Id JOIN Movie m ON g.Movie_Id = m.Movie_Id
GROUP BY a.Actor_Name
ORDER BY count(m.Movie_Title) DESC;

select show_title, show_genre, show_votes  
from Tv_shows  
where show_genre= 'crime'  
order by show_votes DESC 
LIMIT 3; 

select movie_title, movie_genre, movie_earnings AS 'Earnings in Milions USD'  
from Movie  
order by movie_earnings DESC  
LIMIT 3; 

select movie_genre, count(movie_genre) AS 'Count'  
from Movie  
group by movie_genre  
order by count(movie_genre) DESC;

SELECT Actor_Name, Actor_DOB, COUNT(Award_Result) AS "Total Awards Won"  
FROM ACTOR ac, AWARDS aw  
WHERE ac.Actor_Id = aw.Actor_Id   
AND Award_Result = "Winner"   
GROUP BY Actor_Name, Actor_DOB  
ORDER BY COUNT(Award_Result) DESC ; 

SELECT Actor_Name, Actor_DOB, COUNT(Award_Result) AS "Total Awards Won"  
FROM ACTOR ac, AWARDS aw  
WHERE ac.Actor_Id = aw.Actor_Id   
AND Award_Result = "Winner"   
GROUP BY Actor_Name, Actor_DOB  
ORDER BY COUNT(Award_Result) DESC ; 

SELECT Director_Name, Movie_Title, Movie_Star_Rating 
FROM Movie m, Assignment a, Director d 
WHERE m.Movie_Id = a.Movie_Id 
AND a.Director_Id = d.Director_Id 
AND Movie_Star_Rating >= 9 
ORDER BY Movie_Star_Rating DESC, Director_Name; 

SELECT s.Show_Id, Show_Title, Show_Star_Rating, Show_Votes, AVG(LENGTH(r.Review_Text)) AS Review_Length 
FROM TV_Shows s, Review r 
WHERE s.Show_Id = r.Show_Id 
AND Show_Star_Rating > 8.5 
GROUP BY Show_Title 
HAVING Review_Length > 250 
ORDER BY Show_Star_Rating DESC, Review_Length DESC; 



 