CREATE TABLE Users (
    Phone_number BIGINT PRIMARY KEY,
    Surname TEXT NOT NULL,
    Name TEXT NOT NULL,
    Birthday DATE NOT NULL,
    Password TEXT NOT NULL
);

CREATE TABLE Friendship (
    Date_create DATE NOT NULL,
    Id_user1 BIGINT NOT NULL,
    Id_user2 BIGINT NOT NULL,
    Id_type INTEGER NOT NULL, 
    FOREIGN KEY (Id_user1) REFERENCES Users (Phone_number),
    FOREIGN KEY (Id_user2) REFERENCES Users (Phone_number),
    FOREIGN KEY (Id_type) REFERENCES RelationshipType (Id_type),
    PRIMARY KEY (Id_user1, Id_user2)
);

CREATE TABLE Study (
    Id_institution SERIAL PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE Work (
    Id_work SERIAL PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE UsersStudy (
    Id_user BIGINT NOT NULL,
    Id_institution INTEGER NOT NULL,
    Date_admission DATE NOT NULL, 
    Date_graduation DATE NOT NULL,
    FOREIGN KEY (Id_user) REFERENCES Users (Phone_number),
    FOREIGN KEY (Id_institution) REFERENCES Study (Id_institution),
    PRIMARY KEY (Id_user, Id_institution)
);

CREATE TABLE UsersWork (
    Id_user BIGINT NOT NULL,
    Id_work INTEGER NOT NULL,
    Date_start DATE NOT NULL, 
    Date_end DATE NOT NULL,
    FOREIGN KEY (Id_user) REFERENCES Users (Phone_number),
    FOREIGN KEY (Id_work) REFERENCES Work (Id_work),
    PRIMARY KEY (Id_user, Id_work)
);

CREATE TABLE UsersActivity (
    Id_activity SERIAL PRIMARY KEY,
    Phone_number BIGINT NOT NULL,
    Datetime_entry TIMESTAMP NOT NULL, 
    Datetime_exit TIMESTAMP NOT NULL,
    FOREIGN KEY (Phone_number) REFERENCES Users (Phone_number)
);

CREATE TABLE RelationshipType (
    Id_type SERIAL PRIMARY KEY,
    Relationship_type TEXT NOT NULL
);

INSERT INTO Users (Phone_number, Surname, Name, Birthday, Password)
VALUES (89543055674, 'Попов', 'Андрей', '12-05-1996', '1MFDET'),
(89943155784, 'Кузнецов', 'Дмитрий', '22-12-20003', 'tt2QaEdj7ts4'),
(89343257694, 'Иванова', 'Софья', '01-10-1996', 'XvW7j1KV'),
(89043675604, 'Новикова', 'Елизавета', '27-02-1986', 'vOglOV'),
(81041292195, 'Тарасов', 'Максим', '27-02-1998', 'qIqv13j112'),
(89139855692, 'Орлов ', 'Дмитрий', '14-08-1990', 'qY4ZeHRT8arU');

INSERT INTO Friendship (Id_user1, Id_user2, Id_type, Date_create)
VALUES (89543055674, 89139855692, 4, '12-05-2011'),
(89943155784, 89343257694, 4, '22-12-2015'),
(89043675604, 89139855692, 3, '01-10-2015'),
(89543055674, 89343257694, 3, '27-02-2019'),
(81041292195, 89343257694, 1, '14-08-2012');

INSERT INTO RelationshipType (Id_type, Relationship_type)
VALUES (1,	'Друзья по школе'),
(2,	'Друзья по университету'),
(3,	'Коллеги'),
(4,	'Без типа');

INSERT INTO Study (Id_institution, Name)
VALUES (1,	'Московский государственный университет имени М. В. Ломоносова'),
(2,	'Санкт-Петербургский государственный университет'),
(3,	'Национальный исследовательский университет «Высшая школа экономики»'),
(4,	'Президентский физико-математический лицей № 239'),
(5, 'Лицей «Вторая школа»');

INSERT INTO Work (Id_work, Name)
VALUES (1,	'АО «АЛЬФА-БАНК»'),
(2,	'ООО «ЯНДЕКС»'),
(3,	'ПАО «СБЕРБАНК»'),
(4,	'ПАО «ГМК “НОРИЛЬСКИЙ НИКЕЛЬ”»'),
(5, 'ООО «ДНС Ритейл»');

INSERT INTO UsersStudy (Id_institution, Id_user, Date_admission, Date_graduation)
VALUES (1,	89543055674,	'01-09-2015',	'30-06-2019'),
(5,	89343257694,	'01-09-2004',	'15-07-2015'),
(5,	81041292195,	'01-09-2005',	'15-07-2016'),
(3, 	89343257694,    '01-09-2015',       '27-06-2019'),
(1,	81041292195,	'01-09-2015',	'30-06-2019'),
(4,	89943155784,	'01-09-2010',	'11-07-2021'),
(2,	89043675604,	'01-09-2004',	'20-06-2008');

INSERT INTO UsersWork (Id_work, Id_user, Date_start, Date_end)
VALUES (2,	89543055674,	'07-08-2019',	'30-06-2021'),
(2,	89343257694,	'01-08-2019',	'15-07-2022'),
(1,	81041292195,	'02-05-2007',	'08-10-2017'),
(1,  	89343257694,    '13-10-2014',        '27-06-2022'),
(4,	81041292195,	'09-09-2017',	'11-07-2021'),
(5,	89043675604,	'11-11-2017',	'31-07-2019');

INSERT INTO UsersActivity (Id_activity, Phone_number , Datetime_entry , Datetime_exit)
VALUES (1,	89543055674,	'01-01-2018 23:54',	'02-01-2018 01:13'),
(2,	89943155784,	'11-05-2019 12:13',	'11-05-2019 13:10'),
(3,	89343257694,	'19-09-2020 15:01',	'19-09-2020 15:04'),
(4, 	89943155784,     '12-05-2019 00:13', 	'12-05-2019 01:10'),
(5,	81041292195,	'11-12-2020 10:01',	'11-12-2020 11:24');
