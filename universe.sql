--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_visible_to_naked_eye boolean NOT NULL,
    apparent_magnitude numeric(4,2),
    distance_in_millions_of_light_years numeric(8,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mean_radius_in_km numeric(5,1),
    orbital_semimajor_axis_in_km integer,
    orbital_period_in_days numeric(10,6),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    has_ring_system boolean NOT NULL,
    mean_radius_vs_earth numeric(5,3),
    orbital_semimajor_axis_in_km bigint,
    orbital_period_in_days numeric(9,4),
    number_of_moons integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    apparent_magnitude numeric(5,2),
    distance_in_light_years numeric(6,2),
    constellation_id integer,
    galaxy_id integer DEFAULT 26 NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Princess of Ethiopia');
INSERT INTO public.constellation VALUES (2, 'Antlia', 'Air pump');
INSERT INTO public.constellation VALUES (3, 'Apus', 'Bird of Paradise');
INSERT INTO public.constellation VALUES (4, 'Aquarius', 'Water bearer');
INSERT INTO public.constellation VALUES (5, 'Aquila', 'Eagle');
INSERT INTO public.constellation VALUES (6, 'Ara', 'Altar');
INSERT INTO public.constellation VALUES (7, 'Aries', 'Ram');
INSERT INTO public.constellation VALUES (8, 'Auriga', 'Charioteer');
INSERT INTO public.constellation VALUES (9, 'Bootes', 'Herdsman');
INSERT INTO public.constellation VALUES (10, 'Caelum', 'Graving tool');
INSERT INTO public.constellation VALUES (11, 'Camelopardalis', 'Giraffe');
INSERT INTO public.constellation VALUES (12, 'Cancer', 'Crab');
INSERT INTO public.constellation VALUES (13, 'Canes Venatici', 'Hunting dogs');
INSERT INTO public.constellation VALUES (14, 'Canis Major', 'Big dog');
INSERT INTO public.constellation VALUES (15, 'Canis Minor', 'Little dog');
INSERT INTO public.constellation VALUES (16, 'Capricornus', 'Sea goat');
INSERT INTO public.constellation VALUES (17, 'Carina', 'Keel of Argonauts'' ship');
INSERT INTO public.constellation VALUES (18, 'Cassiopeia', 'Queen of Ethiopia');
INSERT INTO public.constellation VALUES (19, 'Centaurus', 'Centaur');
INSERT INTO public.constellation VALUES (20, 'Cepheus', 'King of Ethiopia');
INSERT INTO public.constellation VALUES (21, 'Cetus', 'Sea monster (whale)');
INSERT INTO public.constellation VALUES (22, 'Chamaeleon', 'Chameleon');
INSERT INTO public.constellation VALUES (23, 'Circinus', 'Compasses');
INSERT INTO public.constellation VALUES (24, 'Columba', 'Dove');
INSERT INTO public.constellation VALUES (25, 'Coma Berenices', 'Berenice''s hair');
INSERT INTO public.constellation VALUES (26, 'Corona Australis', 'Southern crown');
INSERT INTO public.constellation VALUES (27, 'Corona Borealis', 'Northern crown');
INSERT INTO public.constellation VALUES (28, 'Corvus', 'Crow');
INSERT INTO public.constellation VALUES (29, 'Crater', 'Cup');
INSERT INTO public.constellation VALUES (30, 'Crux', 'Cross (southern)');
INSERT INTO public.constellation VALUES (31, 'Cygnus', 'Swan');
INSERT INTO public.constellation VALUES (32, 'Delphinus', 'Porpoise');
INSERT INTO public.constellation VALUES (33, 'Dorado', 'Swordfish');
INSERT INTO public.constellation VALUES (34, 'Draco', 'Dragon');
INSERT INTO public.constellation VALUES (35, 'Equuleus', 'Little horse');
INSERT INTO public.constellation VALUES (36, 'Eridanus', 'River');
INSERT INTO public.constellation VALUES (37, 'Fornax', 'Furnace');
INSERT INTO public.constellation VALUES (38, 'Gemini', 'Twins');
INSERT INTO public.constellation VALUES (39, 'Grus', 'Crane');
INSERT INTO public.constellation VALUES (40, 'Hercules', 'Hercules, son of Zeus');
INSERT INTO public.constellation VALUES (41, 'Horologium', 'Clock');
INSERT INTO public.constellation VALUES (42, 'Hydra', 'Sea serpent');
INSERT INTO public.constellation VALUES (43, 'Hydrus', 'Water snake');
INSERT INTO public.constellation VALUES (44, 'Indus', 'Indian');
INSERT INTO public.constellation VALUES (45, 'Lacerta', 'Lizard');
INSERT INTO public.constellation VALUES (46, 'Leo', 'Lion');
INSERT INTO public.constellation VALUES (47, 'Leo Minor', 'Little lion');
INSERT INTO public.constellation VALUES (48, 'Lepus', 'Hare');
INSERT INTO public.constellation VALUES (49, 'Libra', 'Balance');
INSERT INTO public.constellation VALUES (50, 'Lupus', 'Wolf');
INSERT INTO public.constellation VALUES (51, 'Lynx', 'Lynx');
INSERT INTO public.constellation VALUES (52, 'Lyra', 'Lyre or harp');
INSERT INTO public.constellation VALUES (53, 'Mensa', 'Table mountain');
INSERT INTO public.constellation VALUES (54, 'Microscopium', 'Microscope');
INSERT INTO public.constellation VALUES (55, 'Monoceros', 'Unicorn');
INSERT INTO public.constellation VALUES (56, 'Musca', 'Fly');
INSERT INTO public.constellation VALUES (57, 'Norma', 'Carpenter''s Level');
INSERT INTO public.constellation VALUES (58, 'Octans', 'Octant');
INSERT INTO public.constellation VALUES (59, 'Ophiuchus', 'Holder of serpent');
INSERT INTO public.constellation VALUES (60, 'Orion', 'Orion, the hunter');
INSERT INTO public.constellation VALUES (61, 'Pavo', 'Peacock');
INSERT INTO public.constellation VALUES (62, 'Pegasus', 'Pegasus, the winged horse');
INSERT INTO public.constellation VALUES (63, 'Perseus', 'Perseus, hero who saved Andromeda');
INSERT INTO public.constellation VALUES (64, 'Phoenix', 'Phoenix');
INSERT INTO public.constellation VALUES (65, 'Pictor', 'Easel');
INSERT INTO public.constellation VALUES (66, 'Pisces', 'Fishes');
INSERT INTO public.constellation VALUES (67, 'Piscis Austrinus', 'Southern fish');
INSERT INTO public.constellation VALUES (68, 'Puppis', 'Stern of the Argonauts'' ship');
INSERT INTO public.constellation VALUES (69, 'Pyxis', 'Compass on the Argonauts'' ship');
INSERT INTO public.constellation VALUES (70, 'Reticulum', 'Net');
INSERT INTO public.constellation VALUES (71, 'Sagitta', 'Arrow');
INSERT INTO public.constellation VALUES (72, 'Sagittarius', 'Archer');
INSERT INTO public.constellation VALUES (73, 'Scorpius', 'Scorpion');
INSERT INTO public.constellation VALUES (74, 'Sculptor', 'Sculptor''s tools');
INSERT INTO public.constellation VALUES (75, 'Scutum', 'Shield');
INSERT INTO public.constellation VALUES (76, 'Serpens', 'Serpent');
INSERT INTO public.constellation VALUES (77, 'Sextans', 'Sextant');
INSERT INTO public.constellation VALUES (78, 'Taurus', 'Bull');
INSERT INTO public.constellation VALUES (79, 'Telescopium', 'Telescope');
INSERT INTO public.constellation VALUES (80, 'Triangulum', 'Triangle');
INSERT INTO public.constellation VALUES (81, 'Triangulum Australe', 'Southern triangle');
INSERT INTO public.constellation VALUES (82, 'Tucana', 'Toucan');
INSERT INTO public.constellation VALUES (83, 'Ursa Major', 'Big bear');
INSERT INTO public.constellation VALUES (84, 'Ursa Minor', 'Little bear');
INSERT INTO public.constellation VALUES (85, 'Vela', 'Sail of the Argonauts'' ship');
INSERT INTO public.constellation VALUES (86, 'Virgo', 'Virgin');
INSERT INTO public.constellation VALUES (87, 'Volans', 'Flying fish');
INSERT INTO public.constellation VALUES (88, 'Vulpecula', 'Fox');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', true, 3.44, 2.50);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', false, 11.20, 45.00);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', false, 12.60, 200.00);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', false, 8.52, 17.30);
INSERT INTO public.galaxy VALUES (5, 'Bode''s Galaxy', true, 6.94, 11.80);
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxies', false, 10.90, 59.40);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel Galaxy', false, 15.20, 500.00);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', true, 6.84, 13.70);
INSERT INTO public.galaxy VALUES (9, 'Cigar Galaxy', false, 8.41, 11.90);
INSERT INTO public.galaxy VALUES (10, 'Circinus Galaxy', false, 12.10, 13.00);
INSERT INTO public.galaxy VALUES (11, 'Coma Pinwheel Galaxy', false, 9.90, 45.20);
INSERT INTO public.galaxy VALUES (12, 'Comet Galaxy', false, 18.70, 3200.00);
INSERT INTO public.galaxy VALUES (13, 'Condor Galaxy', false, 10.69, 212.00);
INSERT INTO public.galaxy VALUES (14, 'Cosmos Redshift 7', false, NULL, 12900.00);
INSERT INTO public.galaxy VALUES (15, 'Eye of Sauron', false, 11.50, 51.50);
INSERT INTO public.galaxy VALUES (16, 'Fireworks Galaxy', false, 9.60, 25.20);
INSERT INTO public.galaxy VALUES (17, 'Hockey Stick Galaxies', false, 11.00, NULL);
INSERT INTO public.galaxy VALUES (18, 'Hoag''s Object', false, 16.20, 612.80);
INSERT INTO public.galaxy VALUES (19, 'Large Magellanic Cloud', true, 0.13, 0.16);
INSERT INTO public.galaxy VALUES (20, 'Lindsay-Shapley Ring', false, 13.96, 300.00);
INSERT INTO public.galaxy VALUES (21, 'Little Sombrero Galaxy', false, 11.60, 40.00);
INSERT INTO public.galaxy VALUES (22, 'Malin 1', false, 15.81, 1190.00);
INSERT INTO public.galaxy VALUES (23, 'Mayall''s Object', false, NULL, 450.00);
INSERT INTO public.galaxy VALUES (24, 'Medusa Merger', false, 16.30, 128.80);
INSERT INTO public.galaxy VALUES (25, 'Mice Galaxies', false, 14.70, 290.00);
INSERT INTO public.galaxy VALUES (26, 'Milky Way', true, -6.50, 0.00);
INSERT INTO public.galaxy VALUES (27, 'Needle Galaxy', false, 10.42, 42.70);
INSERT INTO public.galaxy VALUES (28, 'Pinwheel Galaxy', false, 7.90, 20.90);
INSERT INTO public.galaxy VALUES (29, 'Sagittarius Dwarf Spheroidal Galaxy', false, 4.50, 0.65);
INSERT INTO public.galaxy VALUES (30, 'Sculptor Dwarf Galaxy', false, 10.10, 0.29);
INSERT INTO public.galaxy VALUES (31, 'Sculptor Galaxy', true, 8.00, 11.40);
INSERT INTO public.galaxy VALUES (32, 'Small Magellanic Cloud', true, 2.70, 0.20);
INSERT INTO public.galaxy VALUES (33, 'Sombrero Galaxy', false, 8.00, 31.10);
INSERT INTO public.galaxy VALUES (34, 'Southern Pinwheel Galaxy', false, 7.60, 14.70);
INSERT INTO public.galaxy VALUES (35, 'Sunflower Galaxy', false, 9.30, 29.30);
INSERT INTO public.galaxy VALUES (36, 'Tadpole Galaxy', false, 14.40, 400.00);
INSERT INTO public.galaxy VALUES (37, 'Triangulum Galaxy', true, 5.72, 2.90);
INSERT INTO public.galaxy VALUES (38, 'Whirlpool Galaxy', false, 8.40, 31.00);
INSERT INTO public.galaxy VALUES (39, 'Wolf-Lundmark-Melotte', false, 11.00, 3.04);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.4, 384400, 27.321582, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.3, 9378, 0.318910, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, 23459, 1.262440, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1821.5, 421800, 1.769138, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.8, 671100, 3.551181, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2631.2, 1070400, 7.154553, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.3, 1882700, 16.689017, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 198.2, 185520, 0.942422, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252.1, 238020, 1.370218, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 533.1, 294660, 1.887802, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 561.4, 377400, 2.736915, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 763.8, 527040, 4.517500, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 2574.7, 1221830, 15.945421, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 135.0, 1481100, 21.276609, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 735.6, 3561300, 79.330183, 6);
INSERT INTO public.moon VALUES (16, 'Ariel', 578.9, 190900, 2.520379, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 584.7, 266000, 4.144176, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 788.9, 436300, 8.705867, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 761.4, 583500, 13.463234, 7);
INSERT INTO public.moon VALUES (20, 'Miranda', 235.8, 129900, 1.413479, 7);
INSERT INTO public.moon VALUES (21, 'Triton', 1353.4, 354760, 5.876854, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 0.383, 57909050, 87.9691, 0, 86);
INSERT INTO public.planet VALUES (2, 'Venus', false, 0.950, 108210000, 224.7010, 0, 86);
INSERT INTO public.planet VALUES (3, 'Earth', false, 1.000, 149598023, 365.2564, 1, 86);
INSERT INTO public.planet VALUES (4, 'Mars', false, 0.532, 227956000, 686.9800, 2, 86);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 10.973, 778479000, 4332.5890, 79, 86);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 9.140, 1432041000, 10759.2200, 82, 86);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 3.981, 2867043000, 30685.4000, 27, 86);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 3.865, 4514953000, 60189.0000, 14, 86);
INSERT INTO public.planet VALUES (9, 'Janssen', false, 1.875, 2309800, 0.7365, NULL, 34);
INSERT INTO public.planet VALUES (10, 'Galileo', false, NULL, 17203760, 14.6516, NULL, 34);
INSERT INTO public.planet VALUES (11, 'Brahe', false, NULL, 35903500, 44.3989, NULL, 34);
INSERT INTO public.planet VALUES (12, 'Harriot', false, NULL, 116800000, 259.8800, NULL, 34);
INSERT INTO public.planet VALUES (13, 'Lipperhey', false, NULL, 863000000, 5574.2000, NULL, 34);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Achernar', 0.46, 139.00, 36, 26);
INSERT INTO public.star VALUES (2, 'Acrab', 2.50, 404.00, 73, 26);
INSERT INTO public.star VALUES (3, 'Acrux', 0.76, 320.00, 30, 26);
INSERT INTO public.star VALUES (4, 'Adhara', 1.50, 430.00, 14, 26);
INSERT INTO public.star VALUES (5, 'Aldebaran', 0.86, 65.00, 78, 26);
INSERT INTO public.star VALUES (6, 'Algieba', 2.08, 130.00, 46, 26);
INSERT INTO public.star VALUES (7, 'Algol', 2.12, 93.00, 63, 26);
INSERT INTO public.star VALUES (8, 'Alhena', 1.92, 100.00, 38, 26);
INSERT INTO public.star VALUES (9, 'Alioth', 1.77, 83.00, 83, 26);
INSERT INTO public.star VALUES (10, 'Aljanah', 2.48, 72.00, 31, 26);
INSERT INTO public.star VALUES (11, 'Alkaid', 1.86, 100.00, 83, 26);
INSERT INTO public.star VALUES (12, 'Almach', 2.26, 350.00, 1, 26);
INSERT INTO public.star VALUES (13, 'Alnair', 1.74, 100.00, 39, 26);
INSERT INTO public.star VALUES (14, 'Alnilam', 1.69, 2000.00, 60, 26);
INSERT INTO public.star VALUES (15, 'Alnitak', 1.77, 1300.00, 60, 26);
INSERT INTO public.star VALUES (16, 'Alphard', 2.00, 180.00, 42, 26);
INSERT INTO public.star VALUES (17, 'Alphecca', 2.23, 75.00, 27, 26);
INSERT INTO public.star VALUES (18, 'Alpheratz', 2.06, 97.00, 1, 26);
INSERT INTO public.star VALUES (19, 'Alsephina', 1.96, 80.00, 85, 26);
INSERT INTO public.star VALUES (20, 'Altair', 0.76, 17.00, 5, 26);
INSERT INTO public.star VALUES (21, 'Aludra', 2.45, 2000.00, 14, 26);
INSERT INTO public.star VALUES (22, 'Ankaa', 2.38, 77.00, 64, 26);
INSERT INTO public.star VALUES (23, 'Antares', 0.96, 550.00, 73, 26);
INSERT INTO public.star VALUES (24, 'Arcturus', -0.05, 37.00, 9, 26);
INSERT INTO public.star VALUES (25, 'Aspidiske', 2.21, 690.00, 17, 26);
INSERT INTO public.star VALUES (26, 'Atria', 1.91, 390.00, 81, 26);
INSERT INTO public.star VALUES (27, 'Avior', 1.86, 600.00, 17, 26);
INSERT INTO public.star VALUES (28, 'Bellatrix', 1.64, 250.00, 60, 26);
INSERT INTO public.star VALUES (29, 'Betelgeuse', 0.50, 550.00, 60, 26);
INSERT INTO public.star VALUES (30, 'Canopus', -0.74, 310.00, 17, 26);
INSERT INTO public.star VALUES (31, 'Capella', 0.08, 43.00, 8, 26);
INSERT INTO public.star VALUES (32, 'Caph', 2.28, 54.00, 18, 26);
INSERT INTO public.star VALUES (33, 'Castor', 1.62, 51.00, 38, 26);
INSERT INTO public.star VALUES (34, 'Copernicus', 5.95, 40.95, 12, 26);
INSERT INTO public.star VALUES (35, 'Deneb', 1.25, 2600.00, 31, 26);
INSERT INTO public.star VALUES (36, 'Denebola', 2.11, 36.00, 46, 26);
INSERT INTO public.star VALUES (37, 'Diphda', 2.02, 96.00, 21, 26);
INSERT INTO public.star VALUES (38, 'Dschubba', 2.31, 400.00, 73, 26);
INSERT INTO public.star VALUES (39, 'Dubhe', 1.79, 20.00, 83, 26);
INSERT INTO public.star VALUES (40, 'Elnath', 1.65, 130.00, 78, 26);
INSERT INTO public.star VALUES (41, 'Eltanin', 2.23, 150.00, 34, 26);
INSERT INTO public.star VALUES (42, 'Enif', 2.40, 670.00, 62, 26);
INSERT INTO public.star VALUES (43, 'Fomalhaut', 1.16, 25.00, 67, 26);
INSERT INTO public.star VALUES (44, 'Gacrux', 1.64, 89.00, 30, 26);
INSERT INTO public.star VALUES (45, 'Gamma Velorum', 1.72, 840.00, 85, 26);
INSERT INTO public.star VALUES (46, 'Hadar', 0.61, 390.00, 19, 26);
INSERT INTO public.star VALUES (47, 'Hamal', 2.00, 66.00, 7, 26);
INSERT INTO public.star VALUES (48, 'Izar', 2.29, 202.00, 9, 26);
INSERT INTO public.star VALUES (49, 'Kaus Australis', 1.85, 140.00, 72, 26);
INSERT INTO public.star VALUES (50, 'Kochab', 2.08, 130.00, 84, 26);
INSERT INTO public.star VALUES (51, 'Larawag', 2.31, 65.00, 73, 26);
INSERT INTO public.star VALUES (52, 'Markab', 2.48, 140.00, 62, 26);
INSERT INTO public.star VALUES (53, 'Markeb', 2.46, 540.00, 85, 26);
INSERT INTO public.star VALUES (54, 'Menkalinan', 1.90, 80.00, 8, 26);
INSERT INTO public.star VALUES (55, 'Menkent', 2.06, 59.00, 19, 26);
INSERT INTO public.star VALUES (56, 'Merak', 2.37, 79.00, 83, 26);
INSERT INTO public.star VALUES (57, 'Miaplacidus', 1.69, 110.00, 17, 26);
INSERT INTO public.star VALUES (58, 'Mimosa', 1.25, 280.00, 30, 26);
INSERT INTO public.star VALUES (59, 'Mintaka', 2.23, 900.00, 60, 26);
INSERT INTO public.star VALUES (60, 'Mirach', 2.05, 200.00, 1, 26);
INSERT INTO public.star VALUES (61, 'Mirfak', 1.80, 510.00, 63, 26);
INSERT INTO public.star VALUES (62, 'Mirzam', 1.98, 500.00, 14, 26);
INSERT INTO public.star VALUES (63, 'Mizar', 2.04, 83.00, 83, 26);
INSERT INTO public.star VALUES (64, 'Muhlifain', 2.17, 130.00, 19, 26);
INSERT INTO public.star VALUES (65, 'Naos', 2.25, 1080.00, 68, 26);
INSERT INTO public.star VALUES (66, 'Nunki', 2.05, 230.00, 72, 26);
INSERT INTO public.star VALUES (67, 'Peacock', 1.94, 180.00, 61, 26);
INSERT INTO public.star VALUES (68, 'Phecda', 2.44, 84.00, 83, 26);
INSERT INTO public.star VALUES (69, 'Polaris', 1.98, 430.00, 84, 26);
INSERT INTO public.star VALUES (70, 'Pollux', 1.14, 34.00, 38, 26);
INSERT INTO public.star VALUES (71, 'Procyon', 0.34, 11.00, 15, 26);
INSERT INTO public.star VALUES (72, 'Rasalhague', 2.07, 47.00, 59, 26);
INSERT INTO public.star VALUES (73, 'Regulus', 1.39, 79.00, 46, 26);
INSERT INTO public.star VALUES (74, 'Rigel', 0.13, 860.00, 60, 26);
INSERT INTO public.star VALUES (75, 'Rigil Kentaurus & Toliman', -0.27, 4.40, 19, 26);
INSERT INTO public.star VALUES (76, 'Sabik', 2.43, 88.00, 59, 26);
INSERT INTO public.star VALUES (77, 'Sadr', 2.23, 1500.00, 31, 26);
INSERT INTO public.star VALUES (78, 'Saiph', 2.09, 720.00, 60, 26);
INSERT INTO public.star VALUES (79, 'Sargas', 1.84, 330.00, 73, 26);
INSERT INTO public.star VALUES (80, 'Scheat', 2.42, 200.00, 62, 26);
INSERT INTO public.star VALUES (81, 'Schedar', 2.24, 230.00, 18, 26);
INSERT INTO public.star VALUES (82, 'Shaula', 1.62, 570.00, 73, 26);
INSERT INTO public.star VALUES (83, 'Sirius', -1.46, 8.60, 14, 26);
INSERT INTO public.star VALUES (84, 'Spica', 0.97, 250.00, 86, 26);
INSERT INTO public.star VALUES (85, 'Suhail', 2.21, 570.00, 85, 26);
INSERT INTO public.star VALUES (86, 'Sun', -26.74, 0.00, NULL, 26);
INSERT INTO public.star VALUES (87, 'Tiaki', 2.15, 170.00, 39, 26);
INSERT INTO public.star VALUES (88, 'Vega', 0.03, 25.00, 52, 26);
INSERT INTO public.star VALUES (89, 'Wezen', 1.82, 1800.00, 14, 26);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 88, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 39, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 89, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

