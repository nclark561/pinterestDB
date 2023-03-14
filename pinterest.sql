CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL UNIQUE,
    email VARCHAR NOT NULL UNIQUE,
    password VARCHAR NOT NULL
);

CREATE TABLE recipes (
    rec_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    instructions TEXT NOT NULL
);

CREATE TABLE ingredients (
    ing_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE groc_list (
    groc_id SERIAL PRIMARY KEY,
	user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE occasions (
    occ_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    address VARCHAR(100),
    date_time VARCHAR,
	user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE groc_ing (
    id SERIAL PRIMARY KEY,
	groc_id INT NOT NULL REFERENCES groc_list(groc_id),
    ing_id INT NOT NULL REFERENCES ingredients(ing_id)
);

CREATE TABLE rec_ing (
    id SERIAL PRIMARY KEY,
    quantity FLOAT NOT NULL,
	rec_id INT NOT NULL REFERENCES recipes(rec_id),
    ing_id INT NOT NULL REFERENCES ingredients(ing_id)
);

CREATE TABLE user_rec (
    id SERIAL PRIMARY KEY,
	rec_id INT NOT NULL REFERENCES recipes(rec_id),
    user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE occ_rec (
    id SERIAL PRIMARY KEY,
    rec_id INT NOT NULL REFERENCES recipes(rec_id),
    occ_id INT NOT NULL REFERENCES occasions(occ_id)
);

INSERT INTO users (username, email, password)
VALUES ('noah', 'noah@gmail.com', 'supersecurepassword');

INSERT INTO recipes (name, instructions, is_public)
VALUES ('caramel apple', 'dip apple in melted caramel', true);

INSERT INTO ingredients (name)
VALUES ('apple'),
('caramel');

INSERT INTO groc_list (user_id)
VALUES (1);

INSERT INTO occasions (name, address, user_id, date_time)
VALUES ('caramel apple party', 'caramel apple ln new york, NY', 1, 'march 14 2023 5:30pm');

INSERT INTO user_rec (user_id, rec_id)
VALUES (1, 1);

INSERT INTO rec_ing (ing_id, rec_id, quantity)
VALUES (1, 1, 1),
(2, 1, 1);

INSERT INTO groc_ing (groc_id, ing_id)
VALUES (1, 1),
(1, 2);

INSERT INTO occ_rec (occ_id, rec_id)
VALUES (1, 1);