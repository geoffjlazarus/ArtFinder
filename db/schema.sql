-- Create the artfinder database
CREATE DATABASE artfinder;

-- Connect to the artfinder database
\c artfinder

-- Create the artists table
CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(255),
  lastname VARCHAR(255),
  birth_year INTEGER,
  death_year INTEGER,
  gender VARCHAR(10),
  biography TEXT,
  nationality VARCHAR(255),
  artist_image_url TEXT,
  movements INTEGER[]
);

-- Create the artworks table
CREATE TABLE artworks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  artist INTEGER REFERENCES artists (id),
  year INTEGER,
  dimension_width FLOAT, --cm 
  dimension_height FLOAT,
  medium VARCHAR(255),
  genre VARCHAR(255),
  description TEXT,
  style VARCHAR(255),
  artwork_image_url TEXT
);

-- Create the movements table
CREATE TABLE movements (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  years VARCHAR(255),
  artists INTEGER[],
  nationalities VARCHAR(255)[]
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_digest TEXT
);


-- Sample entries for the artists table
INSERT INTO artists (firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements)
VALUES
  ('Pablo', 'Picasso', 1881, 1973, 'Male', 'Pablo Picasso was a renowned Spanish painter...', 'Spanish', 'https://example.com/picasso.jpg', ARRAY[1, 3]),
  ('Michelangelo', NULL, 1475, 1564, 'Male', 'Michelangelo di Lodovico...', 'Italian', 'https://example.com/michelangelo.jpg', ARRAY[4]),
  ('Rembrandt', 'van Rijn', 1606, 1669, 'Male', 'Rembrandt Harmenszoon van Rijn...', 'Dutch', 'https://example.com/rembrandt.jpg', ARRAY[2, 3]),
  ('Claude', 'Monet', 1840, 1926, 'Male', 'Claude Monet was a French painter...', 'French', 'https://example.com/monet.jpg', ARRAY[5]),
  ('Johannes', 'Vermeer', 1632, 1675, 'Male', 'Johannes Vermeer was a Dutch painter...', 'Dutch', 'https://example.com/vermeer.jpg', ARRAY[2]),
  ('Diego', 'Velazquez', 1599, 1660, 'Male', 'Diego Rodriguez de Silva...', 'Spanish', 'https://example.com/velazquez.jpg', ARRAY[2]),
  ('Vincent', 'van Gogh', 1853, 1890, 'Male', 'Vincent Willem van Gogh was a Dutch...', 'Dutch', 'https://example.com/vangogh.jpg', ARRAY[5]),
  ('Frida', 'Kahlo', 1907, 1954, 'Female', 'Frida Kahlo was a Mexican painter...', 'Mexican', 'https://example.com/frida.jpg', ARRAY[6]),
  ('Georgia', 'O''Keeffe', 1887, 1986, 'Female', 'Georgia Totto O''Keeffe was an American...', 'American', 'https://example.com/okeeffe.jpg', ARRAY[7]),
  ('Salvador', 'Dali', 1904, 1989, 'Male', 'Salvador Domingo Felipe Jacinto...', 'Spanish', 'https://example.com/dali.jpg', ARRAY[8]),
  ('Paul', 'Cezanne', 1839, 1906, 'Male', 'Paul Cezanne was a French artist...', 'French', 'https://example.com/cezanne.jpg', ARRAY[9]),
  ('Artemisia', 'Gentileschi', 1593, 1656, 'Female', 'Artemisia Gentileschi was an Italian...', 'Italian', 'https://example.com/gentileschi.jpg', ARRAY[10]),
  ('Elisabeth', 'Le Brun', 1755, 1842, 'Female', 'Élisabeth Louise Vigée...', 'French', 'https://example.com/lebrun.jpg', ARRAY[11]),
  ('Marlene', 'Dumas', 1953, NULL, 'Female', 'Marlene Dumas is a South African-born...', 'South African', 'https://example.com/dumas.jpg', ARRAY[12]),
  ('Jackson', 'Pollock', 1912, 1956, 'Male', 'Jackson Pollock was an American...', 'American', 'https://example.com/pollock.jpg', ARRAY[13]);

-- Sample entries for the artworks table
INSERT INTO artworks (title, artist, year, dimension_width, dimension_height, medium, genre, description, style)
VALUES
  ('Les Demoiselles d''Avignon', 1, 1907, 97, 92, 'Oil on canvas', 'Cubism', 'Les Demoiselles d''Avignon is a...', 'Modern'),
  ('David', 2, 1504, 417, 292, 'Marble', 'Renaissance', 'David is a masterpiece of Renaissance sculpture...', 'Realism'),
  ('The Night Watch', 3, 1642, 363, 437, 'Oil on canvas', 'Baroque', 'The Night Watch is a...', 'Group Portraiture'),
  ('Water Lilies', 4, 1914, 200, 180, 'Oil on canvas', 'Impressionism', 'Water Lilies is a series...', 'Landscape'),
  ('Girl with a Pearl Earring', 5, 1665, 44, 39, 'Oil on canvas', 'Baroque', 'Girl with a Pearl Earring is a...', 'Portrait'),
  ('Las Meninas', 6, 1656, 318, 276, 'Oil on canvas', 'Baroque', 'Las Meninas is a masterpiece...', 'Group Portraiture'),
  ('Starry Night', 7, 1889, 73.7, 92.1, 'Oil on canvas', 'Post-Impressionism', 'Starry Night is an iconic...', 'Expressionism'),
  ('The Two Fridas', 8, 1939, 173, 173, 'Oil on canvas', 'Surrealism', 'The Two Fridas is a...', 'Symbolism'),
  ('Black Iris', 9, 1926, 76.2, 55.9, 'Oil on canvas', 'Precisionism', 'Black Iris is a...', 'Still Life'),
  ('The Persistence of Memory', 10, 1931, 24.1, 33, 'Oil on canvas', 'Surrealism', 'The Persistence of Memory is...', 'Surrealism'),
  ('Mont Sainte-Victoire', 11, 1902, 65.1, 81.3, 'Oil on canvas', 'Post-Impressionism', 'Mont Sainte-Victoire is...', 'Landscape'),
  ('Judith Slaying Holofernes', 12, 1614, 199, 162, 'Oil on canvas', 'Baroque', 'Judith Slaying Holofernes is...', 'Caravaggism'),
  ('Self-Portrait with Daughter', 13, 1789, 109.2, 88.9, 'Oil on canvas', 'Neoclassicism', 'Self-Portrait with Daughter is...', 'Portraiture'),
  ('The Painter', 14, 1994, 150, 200, 'Oil on canvas', 'Contemporary', 'The Painter is a...', 'Figurative Expressionism'),
  ('No. 5, 1948', 15, 1948, 240, 120, 'Oil and enamel paint on canvas', 'Abstract Expressionism', 'No. 5, 1948 is a...', 'Action Painting');

-- Sample entries for the movements table
INSERT INTO movements (name, description, years, artists, nationalities)
VALUES
  ('Cubism', 'Cubism was an innovative art movement...', '1907-1922', ARRAY[1], ARRAY['Spanish']),
  ('Renaissance', 'The Renaissance was a period of...', '14th-17th centuries', ARRAY[2], ARRAY['Italian']),
  ('Baroque', 'Baroque art emerged in the 17th century...', '17th-18th centuries', ARRAY[3, 5, 6, 12], ARRAY['Dutch', 'Spanish']),
  ('Impressionism', 'Impressionism was a revolutionary art...', '1860s-1880s', ARRAY[4], ARRAY['French']),
  ('Post-Impressionism', 'Post-Impressionism built upon...', '1880s-1890s', ARRAY[7, 11], ARRAY['Dutch', 'French']),
  ('Surrealism', 'Surrealism was an artistic and...', '1920s-1950s', ARRAY[8, 10], ARRAY['Mexican', 'Spanish']),
  ('Precisionism', 'Precisionism was an art movement...', '1910s-1940s', ARRAY[9], ARRAY['American']),
  ('Symbolism', 'Symbolism was an art movement...', 'Late 19th-early 20th centuries', ARRAY[8], ARRAY['Mexican']),
  ('Neoclassicism', 'Neoclassicism was a Western cultural...', 'Mid-18th-late 19th centuries', ARRAY[13], ARRAY['French']),
  ('Contemporary', 'Contemporary art refers to...', NULL, ARRAY[14], ARRAY['South African']),
  ('Abstract Expressionism', 'Abstract Expressionism was a post-World...', '1940s-1950s', ARRAY[15], ARRAY['American']);
