CREATE TABLE Artist (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	image VARCHAR(255)
);

CREATE TABLE Users (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY (start with 1 increment by 1) PRIMARY KEY,
	username VARCHAR(12) NOT NULL,
	password VARCHAR(15) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	email VARCHAR(20) NOT NULL,
	phone VARCHAR(11) NOT NULL
);

CREATE TABLE Playlist (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	image VARCHAR(255),
	user_id int NOT NULL,
	FOREIGN KEY (user_id) REFERENCES Users (id)
);

CREATE TABLE Genres (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE Tracks (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	uuid int NOT NULL,
	duration varchar(10),
	artist_id int NOT NULL,
	genres_id int NOT NULL,
	count_of_plays int not null,
	FOREIGN KEY (artist_id) REFERENCES Artist (id),
	FOREIGN KEY (genres_id) REFERENCES Genres (id)
);

CREATE TABLE Album (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	image varchar(255),
	artist_id int NOT NULL,
	FOREIGN KEY (artist_id) REFERENCES Artist (id)
);

CREATE TABLE Album_Tracks (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	image varchar(255),
	album_id int NOT NULL,
	tracks_id int NOT NULL,
	FOREIGN KEY (album_id) REFERENCES Album (id),
	FOREIGN KEY (tracks_id) REFERENCES Tracks (id)
);

CREATE TABLE Playlist_tracks (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	playlist_id int NOT NULL,
	tracks_id int NOT NULL,
	FOREIGN KEY (playlist_id) REFERENCES Playlist (id),
	FOREIGN KEY (tracks_id) REFERENCES Tracks (id)
);

insert into Artist (name)
values
('Три дня дождя'),
('Shadowraze'),
('Lil Peep'),
('Тринадцать карат');

insert into Users (username, password, gender, email, phone)
values
('sl1degod', 'sl1degod', 'Male', 'sl1degod86@gmail.com', '89534123848');


insert into Playlist (name, image, user_id)
values
('Сборник всего', 'https://images.genius.com/24afe321dcba210a2b1adbeab043b10a.1000x1000x1.jpg',  1),
('only lil peep', 'https://yt3.googleusercontent.com/ytc/AGIKgqMan78Rm2zLE91NGUdIgZCO_jDe1KU1LokghXW04w=s900-c-k-c0x00ffffff-no-rj', 1),
('Только русские', 'https://images.genius.com/81c726b5802c2b6d4f0159abe3956eda.1000x1000x1.png',  1),
('Популярные треки', 'https://images.genius.com/81c726b5802c2b6d4f0159abe3956eda.1000x1000x1.png',  1);

insert into Genres (name)
values
('Рок'),
('Поп'),
('Рэп');

insert into tracks (name, uuid, duration, artist_id, genres_id, count_of_plays)
values
('Слезы на ветер', 1, '2:41', 1, 1, 1210),
('Подозрительно', 2, '3:02', 1, 1, 2344),
('Не виноваты планеты', 3, '3:01', 1, 1, 3423),
('Отпускай', 4, '3:27', 1, 1, 4553),
('Неважно', 5, '3:15', 1, 1, 211),
('Выдыхай', 6, '4:01', 1, 1, 1233),
('Я и одиночество', 7, '3:49', 1, 1, 3434),
('Смыслы', 8, '2:38', 1, 1, 543),
('Skyline Ryodan', 9, '2:01', 2, 2, 6543),
('Right Here', 10, '2:57', 3, 3, 2343),
('Benz Truck', 11, '2:40', 3, 3, 123),
('Save that girl', 12, '3:52', 3, 3, 432),
('U Said', 13, '3:44', 3, 3, 1232),
('Big City Blues', 14, '2:35', 3, 3, 24321),
('во снах', 15, '2:00', 4, 1, 32132),
('проваливай', 16, '2:27', 4, 1, 4543),
('утонуть', 17, '2:10', 4, 1, 4535),
('ты', 18, '1:48', 4, 1, 1233),
('пока он тебя не бросит', 19, '2:33', 4, 1, 4534),
('давай расскажем', 20, '2:18', 4, 1, 4353),
('больше не буду', 21, '2:19', 4, 1, 3453),
('подружка', 22, '2:55', 4, 1, 21321),
('жить после', 23, '2:08', 4, 1, 1332),
('научился летать', 24, '1:53', 4, 1, 12321),
('одна', 25, '3:06', 4, 1, 4323);

insert into Album (name, image, artist_id)
values
('Байполар', 'https://images.genius.com/24afe321dcba210a2b1adbeab043b10a.1000x1000x1.jpg', 1),
('Skyline Ryodan', 'https://images.genius.com/81c726b5802c2b6d4f0159abe3956eda.1000x1000x1.png', 2),
('All Lil Peep', 'https://yt3.googleusercontent.com/ytc/AGIKgqMan78Rm2zLE91NGUdIgZCO_jDe1KU1LokghXW04w=s900-c-k-c0x00ffffff-no-rj', 3),
('13 причин почему', 'https://images.genius.com/e78f05f9417faa5fc339c374810fa35e.1000x1000x1.jpg', 4);

insert into Album_tracks (album_id, tracks_id)
values
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(4, 21),
(4, 22),
(4, 23),
(4, 24),
(4, 25);

insert into Playlist_tracks (playlist_id, tracks_id)
values
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25);