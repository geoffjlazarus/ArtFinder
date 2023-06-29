--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: geofflazarus
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    birth_year integer,
    death_year integer,
    gender character varying(10),
    biography text,
    nationality character varying(255),
    artist_image_url text,
    movements integer[]
);


ALTER TABLE public.artists OWNER TO geofflazarus;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: geofflazarus
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO geofflazarus;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geofflazarus
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: artworks; Type: TABLE; Schema: public; Owner: geofflazarus
--

CREATE TABLE public.artworks (
    id integer NOT NULL,
    title character varying(255),
    artist integer,
    year integer,
    dimension_width double precision,
    dimension_height double precision,
    medium character varying(255),
    genre character varying(255),
    description text,
    style character varying(255),
    artwork_image_url text
);


ALTER TABLE public.artworks OWNER TO geofflazarus;

--
-- Name: artworks_id_seq; Type: SEQUENCE; Schema: public; Owner: geofflazarus
--

CREATE SEQUENCE public.artworks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artworks_id_seq OWNER TO geofflazarus;

--
-- Name: artworks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geofflazarus
--

ALTER SEQUENCE public.artworks_id_seq OWNED BY public.artworks.id;


--
-- Name: movements; Type: TABLE; Schema: public; Owner: geofflazarus
--

CREATE TABLE public.movements (
    id integer NOT NULL,
    name character varying(255),
    description text,
    years character varying(255),
    artists integer[],
    nationalities character varying(255)[]
);


ALTER TABLE public.movements OWNER TO geofflazarus;

--
-- Name: movements_id_seq; Type: SEQUENCE; Schema: public; Owner: geofflazarus
--

CREATE SEQUENCE public.movements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movements_id_seq OWNER TO geofflazarus;

--
-- Name: movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geofflazarus
--

ALTER SEQUENCE public.movements_id_seq OWNED BY public.movements.id;


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: geofflazarus
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: artworks id; Type: DEFAULT; Schema: public; Owner: geofflazarus
--

ALTER TABLE ONLY public.artworks ALTER COLUMN id SET DEFAULT nextval('public.artworks_id_seq'::regclass);


--
-- Name: movements id; Type: DEFAULT; Schema: public; Owner: geofflazarus
--

ALTER TABLE ONLY public.movements ALTER COLUMN id SET DEFAULT nextval('public.movements_id_seq'::regclass);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: geofflazarus
--

COPY public.artists (id, firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements) FROM stdin;
9	Georgia	O'Keeffe	1887	1986	\N	\N	\N	https://www.okeeffemuseum.org/wp-content/uploads/2022/04/2003-1-1-600x753-1.jpg	{7}
8	Frida	Kahlo	1907	1954	\N	\N	\N	https://upload.wikimedia.org/wikipedia/commons/0/06/Frida_Kahlo%2C_by_Guillermo_Kahlo.jpg	{6}
5	Johannes	Vermeer	1632	1675	\N	\N	\N	https://upload.wikimedia.org/wikipedia/commons/4/46/Cropped_version_of_Jan_Vermeer_van_Delft_002.jpg	{2}
6	Diego	Velazquez	1599	1660	Male	Diego Rodriguez de Silva...	Spanish	https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQmprWz2FMnu5SphjCEqALl0uxjDhczbWjptIgCpwIrj-fWAhGhNlutFOcU1CLzQrvnbsHOH7yuhQgf9Vc	{2}
1	Pablo	Picasso	1881	1973	Male		Spanish	https://idsb.tmgrup.com.tr/ly/uploads/images/2022/06/13/211875.jpg	{1,3}
7	Vincent	van Gogh	1853	1890	Male	Dutch painter	Dutch	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Vincent_van_Gogh_-_Self-Portrait_-_Google_Art_Project.jpg/1200px-Vincent_van_Gogh_-_Self-Portrait_-_Google_Art_Project.jpg	{5}
3	Rembrandt	van Rijn	1606	1669	\N	\N	\N	https://cdn.britannica.com/82/190482-050-33D2C4C5/Self-Portrait-canvas-Rembrandt-van-Rijn-Washington-DC.jpg	{2,3}
4	Claude	Monet	1840	1926	Male	Claude Monet was a French painter...	French	https://upload.wikimedia.org/wikipedia/commons/a/a4/Claude_Monet_1899_Nadar_crop.jpg	{5}
11	Paul	Cezanne	1839	1906	\N	\N	\N	https://www.paulcezanne.org/images/paintings/self-portrait.jpg	{9}
15	Jackson	Pollock	1912	1956	\N	\N	\N	https://www.moma.org/d/assets/W1siZiIsIjIwMTkvMTIvMDYvOGFqZjMwbjNvcF80Njc1XzY3ODQ5Nl9wb2xsb2NrLmpwZyJdLFsicCIsImNvbnZlcnQiLCItcXVhbGl0eSA5MCAtcmVzaXplIDIwMDB4MjAwMFx1MDAzZSJdXQ/4675_678496_pollock.jpg?sha=b317cbcc69cdacf0	{13}
14	Marlene	Dumas	1953	-2	\N	\N	\N	https://upload.wikimedia.org/wikipedia/commons/5/57/Marlene_Dumas.jpg	{12}
13	Elisabeth	Le Brun	1755	1842	\N	\N	\N	https://upload.wikimedia.org/wikipedia/commons/3/35/Self-portrait_in_a_Straw_Hat_by_Elisabeth-Louise_Vig%C3%A9e-Lebrun.jpg	{11}
12	Artemisia	Gentileschi	1593	1656	\N	\N	\N	https://www.rct.uk/sites/default/files/593683-1458214692.jpg	{10}
10	Salvador	Dali	1904	1989	\N	\N	\N	https://www.universolorca.com/wp-content/uploads/2018/12/Salvador-dali.jpg	{8}
2	Michelangelo		1475	1564	\N	\N	\N	https://cdn.britannica.com/46/75046-050-0973B0E8/Michelangelo.jpg	{4}
\.


--
-- Data for Name: artworks; Type: TABLE DATA; Schema: public; Owner: geofflazarus
--

COPY public.artworks (id, title, artist, year, dimension_width, dimension_height, medium, genre, description, style, artwork_image_url) FROM stdin;
2	David	2	1504	417	292	Marble	Renaissance	David is a masterpiece of Renaissance sculpture...	Realism	https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Michelangelo%27s_David_-_right_view_2.jpg/1200px-Michelangelo%27s_David_-_right_view_2.jpg
3	The Night Watch	3	1642	363	437	Oil on canvas	Baroque	The Night Watch is a...	Group Portraiture	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/The_Night_Watch_-_HD.jpg/1200px-The_Night_Watch_-_HD.jpg
4	Water Lilies	4	1914	200	180	Oil on canvas	Impressionism	Water Lilies is a series...	Landscape	https://uploads1.wikiart.org/images/claude-monet/water-lilies-1915.jpg
5	Girl with a Pearl Earring	5	1665	44	39	Oil on canvas	Baroque	Girl with a Pearl Earring is a...	Portrait	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/1665_Girl_with_a_Pearl_Earring.jpg/800px-1665_Girl_with_a_Pearl_Earring.jpg
6	Las Meninas	6	1656	318	276	Oil on canvas	Baroque	Las Meninas is a masterpiece...	Group Portraiture	https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Las_Meninas%2C_by_Diego_Vel%C3%A1zquez%2C_from_Prado_in_Google_Earth.jpg/1200px-Las_Meninas%2C_by_Diego_Vel%C3%A1zquez%2C_from_Prado_in_Google_Earth.jpg
7	Starry Night	7	1889	73.7	92.1	Oil on canvas	Post-Impressionism	Starry Night is an iconic...	Expressionism	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1200px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg
8	The Two Fridas	8	1939	173	173	Oil on canvas	Surrealism	The Two Fridas is a...	Symbolism	https://www.fridakahlo.org/images/paintings/the-two-fridas.jpg
9	Black Iris	9	1926	76.2	55.9	Oil on canvas	Precisionism	Black Iris is a...	Still Life	https://upload.wikimedia.org/wikipedia/en/b/b7/Georgia_O%27Keeffe%2C_Black_Iris%2C_1926%2C_Metropolitan_Museum_of_Art.jpg
10	The Persistence of Memory	10	1931	24.1	33	Oil on canvas	Surrealism	The Persistence of Memory is...	Surrealism	https://uploads6.wikiart.org/images/salvador-dali/the-persistence-of-memory-1931.jpg!Large.jpg
11	Mont Sainte-Victoire	11	1902	65.1	81.3	Oil on canvas	Post-Impressionism	Mont Sainte-Victoire is...	Landscape	https://smarthistory.org/wp-content/uploads/2017/04/cezannethumb.jpg
12	Judith Slaying Holofernes	12	1614	199	162	Oil on canvas	Baroque	Judith Slaying Holofernes is...	Caravaggism	https://upload.wikimedia.org/wikipedia/commons/b/b7/Judit_decapitando_a_Holofernes%2C_por_Artemisia_Gentileschi.jpg
13	Self-Portrait with Daughter	13	1789	109.2	88.9	Oil on canvas	Neoclassicism	Self-Portrait with Daughter is...	Portraiture	https://smarthistory.org/wp-content/uploads/2020/06/Self-portrait_with_Her_Daughter_by_Elisabeth-Louise_Vige%CC%81e_Le_Brun-scaled.jpg
14	The Painter	14	1994	150	200	Oil on canvas	Contemporary	The Painter is a...	Figurative Expressionism	https://uploads0.wikiart.org/00334/images/marlene-dumas/the-painter-1994.jpg
15	No. 5, 1948	15	1948	240	120	Oil and enamel paint on canvas	Abstract Expressionism	No. 5, 1948 is a...	Action Painting	https://arthive.net/res/media/img/oy800/work/3b4/293780@2x.jpg
1	Les Demoiselles d'Avignon	1	1907	97	92	Oil on canvas	Cubism	Les Demoiselles d'Avignon is a...	Modern	https://www.pablopicasso.org/images/paintings/avignon.jpg
\.


--
-- Data for Name: movements; Type: TABLE DATA; Schema: public; Owner: geofflazarus
--

COPY public.movements (id, name, description, years, artists, nationalities) FROM stdin;
1	Cubism	Cubism was an innovative art movement...	1907-1922	{1}	{Spanish}
2	Renaissance	The Renaissance was a period of...	14th-17th centuries	{2}	{Italian}
3	Baroque	Baroque art emerged in the 17th century...	17th-18th centuries	{3,5,6,12}	{Dutch,Spanish}
4	Impressionism	Impressionism was a revolutionary art...	1860s-1880s	{4}	{French}
5	Post-Impressionism	Post-Impressionism built upon...	1880s-1890s	{7,11}	{Dutch,French}
6	Surrealism	Surrealism was an artistic and...	1920s-1950s	{8,10}	{Mexican,Spanish}
7	Precisionism	Precisionism was an art movement...	1910s-1940s	{9}	{American}
8	Symbolism	Symbolism was an art movement...	Late 19th-early 20th centuries	{8}	{Mexican}
9	Neoclassicism	Neoclassicism was a Western cultural...	Mid-18th-late 19th centuries	{13}	{French}
10	Contemporary	Contemporary art refers to...	\N	{14}	{"South African"}
11	Abstract Expressionism	Abstract Expressionism was a post-World...	1940s-1950s	{15}	{American}
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geofflazarus
--

SELECT pg_catalog.setval('public.artists_id_seq', 17, true);


--
-- Name: artworks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geofflazarus
--

SELECT pg_catalog.setval('public.artworks_id_seq', 15, true);


--
-- Name: movements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geofflazarus
--

SELECT pg_catalog.setval('public.movements_id_seq', 11, true);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: geofflazarus
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: artworks artworks_pkey; Type: CONSTRAINT; Schema: public; Owner: geofflazarus
--

ALTER TABLE ONLY public.artworks
    ADD CONSTRAINT artworks_pkey PRIMARY KEY (id);


--
-- Name: movements movements_pkey; Type: CONSTRAINT; Schema: public; Owner: geofflazarus
--

ALTER TABLE ONLY public.movements
    ADD CONSTRAINT movements_pkey PRIMARY KEY (id);


--
-- Name: artworks artworks_artist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: geofflazarus
--

ALTER TABLE ONLY public.artworks
    ADD CONSTRAINT artworks_artist_fkey FOREIGN KEY (artist) REFERENCES public.artists(id);


--
-- PostgreSQL database dump complete
--

