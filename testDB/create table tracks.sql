CREATE TABLE Performer (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

insert into Performer (name)
values 
('Три дня дождя');

CREATE TABLE Tracks (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	uuid int,
	performer_id int,
	FOREIGN KEY (performer_id) REFERENCES Performer (id)
);

insert into tracks (name, uuid, performer_id)
values 
('Слезы на ветер', 1, 1),
('Подозрительно', 2, 1),
('Не виноваты планеты', 3, 1),
('Отпускай', 4, 1),
('Неважно', 5, 1),
('Выдыхай', 6, 1),
('Я и одиночество', 7, 1),
('Смыслы', 8, 1);

drop table tracks