CREATE DATABASE artfinder;

CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    firstname TEXT,
    lastname TEXT,
    birth_year INTEGER,
    death_year INTEGER,
    gender TEXT,
    biography TEXT,
    movements TEXT,
    nationality TEXT,
    artist_image_url TEXT
);

CREATE TABLE artworks (
    id SERIAL PRIMARY KEY,
    name TEXT,
    artist TEXT,
    year TEXT,
    dimension_width INTEGER,
    dimension_height INTEGER,
    medium TEXT,
    genre TEXT,
    description TEXT,
    style TEXT
);

CREATE TABLE movements (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
    years TEXT,
    artists ??,
    nationalities TEXT
);

INSERT INTO artists (firstname, lastname, birth_year, death_year, gender, nationality)
VALUES ('Pablo', 'Picasso', 1881, 1973, 'Male', 'Spain');