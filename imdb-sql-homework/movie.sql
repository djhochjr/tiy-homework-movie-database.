--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: award; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE award (
    awardid integer NOT NULL,
    title character varying(20) NOT NULL
);


ALTER TABLE award OWNER TO davehochstrasser;

--
-- Name: cast; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE "cast" (
    rolename character varying(30) NOT NULL,
    castid integer NOT NULL,
    peopleid integer NOT NULL
);


ALTER TABLE "cast" OWNER TO davehochstrasser;

--
-- Name: cast_castid_seq; Type: SEQUENCE; Schema: public; Owner: davehochstrasser
--

CREATE SEQUENCE cast_castid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cast_castid_seq OWNER TO davehochstrasser;

--
-- Name: cast_castid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: davehochstrasser
--

ALTER SEQUENCE cast_castid_seq OWNED BY "cast".castid;


--
-- Name: genre; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE genre (
    genreid integer NOT NULL,
    type character varying(20) NOT NULL
);


ALTER TABLE genre OWNER TO davehochstrasser;

--
-- Name: genre_genreid_seq; Type: SEQUENCE; Schema: public; Owner: davehochstrasser
--

CREATE SEQUENCE genre_genreid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_genreid_seq OWNER TO davehochstrasser;

--
-- Name: genre_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: davehochstrasser
--

ALTER SEQUENCE genre_genreid_seq OWNED BY genre.genreid;


--
-- Name: genres_genreid_seq; Type: SEQUENCE; Schema: public; Owner: davehochstrasser
--

CREATE SEQUENCE genres_genreid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_genreid_seq OWNER TO davehochstrasser;

--
-- Name: genres_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: davehochstrasser
--

ALTER SEQUENCE genres_genreid_seq OWNED BY genre.genreid;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE movie (
    movieid integer NOT NULL,
    moviereleasedate integer NOT NULL,
    counrty character varying(20),
    runtime integer,
    language character varying(20) NOT NULL,
    rating character varying(20),
    title character varying(50) NOT NULL,
    color character varying(10),
    genreid integer,
    moviegenreid integer
);


ALTER TABLE movie OWNER TO davehochstrasser;

--
-- Name: movie_people; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE movie_people (
    moviepeopleid integer NOT NULL,
    movieid integer,
    peopleid integer
);


ALTER TABLE movie_people OWNER TO davehochstrasser;

--
-- Name: movie_people_moviepeopleid_seq; Type: SEQUENCE; Schema: public; Owner: davehochstrasser
--

CREATE SEQUENCE movie_people_moviepeopleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movie_people_moviepeopleid_seq OWNER TO davehochstrasser;

--
-- Name: movie_people_moviepeopleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: davehochstrasser
--

ALTER SEQUENCE movie_people_moviepeopleid_seq OWNED BY movie_people.moviepeopleid;


--
-- Name: movie_prodcuction; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE movie_prodcuction (
    studioid integer NOT NULL,
    movieid integer NOT NULL,
    movie_studioid integer NOT NULL
);


ALTER TABLE movie_prodcuction OWNER TO davehochstrasser;

--
-- Name: moviegenre; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE moviegenre (
    moviegenreid integer NOT NULL,
    movieid integer NOT NULL,
    genreid integer NOT NULL
);


ALTER TABLE moviegenre OWNER TO davehochstrasser;

--
-- Name: moviegenre_moviegenreid_seq; Type: SEQUENCE; Schema: public; Owner: davehochstrasser
--

CREATE SEQUENCE moviegenre_moviegenreid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moviegenre_moviegenreid_seq OWNER TO davehochstrasser;

--
-- Name: moviegenre_moviegenreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: davehochstrasser
--

ALTER SEQUENCE moviegenre_moviegenreid_seq OWNED BY moviegenre.moviegenreid;


--
-- Name: moviereview; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE moviereview (
    moviereviewid integer NOT NULL,
    movieid integer,
    reviewid integer
);


ALTER TABLE moviereview OWNER TO davehochstrasser;

--
-- Name: movies_movieid_seq; Type: SEQUENCE; Schema: public; Owner: davehochstrasser
--

CREATE SEQUENCE movies_movieid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movies_movieid_seq OWNER TO davehochstrasser;

--
-- Name: movies_movieid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: davehochstrasser
--

ALTER SEQUENCE movies_movieid_seq OWNED BY movie.movieid;


--
-- Name: nominee; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE nominee (
    awardid integer NOT NULL,
    peopleid integer NOT NULL,
    movieid integer NOT NULL,
    nomineeid integer NOT NULL
);


ALTER TABLE nominee OWNER TO davehochstrasser;

--
-- Name: nominee_nomineeid_seq; Type: SEQUENCE; Schema: public; Owner: davehochstrasser
--

CREATE SEQUENCE nominee_nomineeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nominee_nomineeid_seq OWNER TO davehochstrasser;

--
-- Name: nominee_nomineeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: davehochstrasser
--

ALTER SEQUENCE nominee_nomineeid_seq OWNED BY nominee.nomineeid;


--
-- Name: people; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE people (
    peopleid integer NOT NULL,
    firstname character varying(20),
    lastname character varying(25),
    title character varying(10),
    datemodified integer,
    gender character varying(10),
    website character varying(30),
    email character varying(50),
    dateofbirth integer,
    cityofbirth character varying(25),
    counrtyofbirth character varying(25)
);


ALTER TABLE people OWNER TO davehochstrasser;

--
-- Name: person_personid_seq; Type: SEQUENCE; Schema: public; Owner: davehochstrasser
--

CREATE SEQUENCE person_personid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_personid_seq OWNER TO davehochstrasser;

--
-- Name: person_personid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: davehochstrasser
--

ALTER SEQUENCE person_personid_seq OWNED BY people.peopleid;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE reviews (
    reviewid integer NOT NULL,
    movie_id integer,
    title character varying(20)
);


ALTER TABLE reviews OWNER TO davehochstrasser;

--
-- Name: reviews_reviewid_seq; Type: SEQUENCE; Schema: public; Owner: davehochstrasser
--

CREATE SEQUENCE reviews_reviewid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_reviewid_seq OWNER TO davehochstrasser;

--
-- Name: reviews_reviewid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: davehochstrasser
--

ALTER SEQUENCE reviews_reviewid_seq OWNED BY reviews.reviewid;


--
-- Name: studio; Type: TABLE; Schema: public; Owner: davehochstrasser
--

CREATE TABLE studio (
    studioid integer NOT NULL,
    studioname character varying(50) NOT NULL,
    country character varying(20) NOT NULL,
    enceptionyear integer NOT NULL
);


ALTER TABLE studio OWNER TO davehochstrasser;

--
-- Name: castid; Type: DEFAULT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY "cast" ALTER COLUMN castid SET DEFAULT nextval('cast_castid_seq'::regclass);


--
-- Name: genreid; Type: DEFAULT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY genre ALTER COLUMN genreid SET DEFAULT nextval('genre_genreid_seq'::regclass);


--
-- Name: movieid; Type: DEFAULT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY movie ALTER COLUMN movieid SET DEFAULT nextval('movies_movieid_seq'::regclass);


--
-- Name: moviepeopleid; Type: DEFAULT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY movie_people ALTER COLUMN moviepeopleid SET DEFAULT nextval('movie_people_moviepeopleid_seq'::regclass);


--
-- Name: moviegenreid; Type: DEFAULT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY moviegenre ALTER COLUMN moviegenreid SET DEFAULT nextval('moviegenre_moviegenreid_seq'::regclass);


--
-- Name: nomineeid; Type: DEFAULT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY nominee ALTER COLUMN nomineeid SET DEFAULT nextval('nominee_nomineeid_seq'::regclass);


--
-- Name: peopleid; Type: DEFAULT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY people ALTER COLUMN peopleid SET DEFAULT nextval('person_personid_seq'::regclass);


--
-- Name: reviewid; Type: DEFAULT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY reviews ALTER COLUMN reviewid SET DEFAULT nextval('reviews_reviewid_seq'::regclass);


--
-- Data for Name: award; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY award (awardid, title) FROM stdin;
1	Oscar
2	SAG
3	Golden Globes
4	Cannes
5	Sundance
6	Montreal
7	AFI
8	BAFTA
9	BET
\.


--
-- Data for Name: cast; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY "cast" (rolename, castid, peopleid) FROM stdin;
Carl	123	59
Two-Bit Matthews	6	1
Tim Shepard	8	11
Steve Randle	7	5
Sodapop Curtis	5	7
Ponyboy Curtis	2	3
Johnny Cade	3	8
Jerry	12	23
Darrel ["Darry"] Curtis	4	4
Dallas ["Dally"] Winston	1	2
Cherry Valance	9	6
Bob Sheldon	10	9
Buck Merrill	13	13
Randy Anderson	14	12
Nurse	19	15
Little Girl	21	14
Store Clerk	22	10
Greaser	23	20
Woman at Fire	24	21
Nurse	25	18
Surburb Guy	26	17
Paul	27	16
Motorcycle Cop	28	22
Orderly	29	19
Sailor	31	95
Lula	32	87
Bobby Peru	33	96
Santos	34	97
Dell	35	98
Marietta Fortune	36	99
Reggie	37	100
Perdita	38	85
Johnny Farragut	39	101
Juana	40	102
Girl in accident	41	103
John Bender	124	60
Claire Standish	125	61
Allison Reynolds	126	62
Jim McAllister	127	52
Uncle Pooch	42	104
Mr Reindeer	44	105
Dropshadow	45	106
George Kovich	46	107
Tracy Flick	128	53
OO Spool	43	109
Sparky	47	108
Buddy	48	110
Bobby Ray Lemon	49	111
Pace	50	112
Madam	51	113
Hotel cust	52	114
Aunt Rootie	53	115
Hotel manager	54	116
Reindeer dancer	55	117
Old bum	56	118
Timmy Thompson	57	119
Rex	58	120
Idiot punk	59	121
Man at Shell	60	122
Good Witch	61	123
Mr Reindeer's valet #2	62	124
Man in Wheelchair	63	125
Young Cowboy	64	126
Mr Reindeer's valet #1	65	127
Imma	66	128
Billy Swan	67	129
Zanzibar singer	68	130
Desk clerk	69	131
Singer's manager	70	132
Juror #8, Davis	71	36
Juror # 3	72	37
Juror # 10	73	38
Juror # 4	74	39
Juror # 7	75	40
Juror # 1, the foreman	76	41
Juror # 2	77	42
Juror # 5	78	43
Juror # 6	79	44
Juror # 9, McArdle	80	45
Juror # 11	81	46
Juror # 12	82	47
Judge	83	48
Guard	84	49
Court clerk	85	50
Defendant	86	51
Roderido	87	24
Iago	88	25
Othello	89	26
Desdemona	90	27
Brabantio	91	28
Lodovico	92	29
Cassio	93	30
Emilia	94	31
Bianca	95	32
Montano	96	33
Venetian senator	97	34
Page boy	98	35
Holly Martins	99	34
Anna	100	133
Harry Lime	101	89
Major Callaway	102	134
Sergeant Paine	103	135
Harry's porter	104	136
"Baron" Kurtz	105	137
Popescu	106	138
Dr Winkel	107	139
Crabbin	108	140
Anna's old woman	109	141
Porter's wife	110	142
Brodsky	112	144
Sachers	113	145
Little Hansl	111	143
Hansl's Father	114	146
Winkel's maid	115	147
Kurtz's mother	116	148
Casanova	119	149
Andrew Clark	120	1
Richard Vernon	121	57
Brian Johnson	122	58
Paul Metzler	129	54
Tammy Metzler	130	55
Dave Novotny	131	56
Anthony Adams	132	90
Dignan	133	89
Dr Nichols	134	91
Grace	135	92
Bernice	136	93
Bob Maplethorpe	137	94
Jeffrey Beaumont	138	84
Dorthy Vallens	139	85
Frank Booth	140	86
Sandy Williams	141	87
Mrs Williams	142	88
Henry Spencer	143	63
Mary X	144	64
Mr X	145	65
Mrs X	146	66
Girl across hall	147	67
Lady in radiator	148	68
Landlady	149	69
Man in the planet	150	70
Grandmother	151	71
The boy	152	72
Bum	153	73
Paul	154	74
The boss	155	75
Pencil machine operator	156	76
Little girl	157	77
Little boy	158	78
Person digging in alley #1	159	79
Person digging in alley #2	160	80
Man with cigar	161	81
Man fighting	162	82
Mr Roundheels	163	83
\.


--
-- Name: cast_castid_seq; Type: SEQUENCE SET; Schema: public; Owner: davehochstrasser
--

SELECT pg_catalog.setval('cast_castid_seq', 163, true);


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY genre (genreid, type) FROM stdin;
1	Drama
2	Comedy
3	Action
4	SciFi
5	Horror
6	Fantasy
7	Romance
8	Adventure
9	Epic
10	Crime
11	Mucical
\.


--
-- Name: genre_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: davehochstrasser
--

SELECT pg_catalog.setval('genre_genreid_seq', 11, true);


--
-- Name: genres_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: davehochstrasser
--

SELECT pg_catalog.setval('genres_genreid_seq', 1, true);


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY movie (movieid, moviereleasedate, counrty, runtime, language, rating, title, color, genreid, moviegenreid) FROM stdin;
1	1955	US	92	ENG	NR	Othello	BW	\N	\N
2	1977	US	89	ENG	NR	EraserHead	BW	\N	\N
3	1986	US	120	ENG	R	Blue Velvet	CO	\N	\N
4	1999	US	103	ENG	R	Election	CO	\N	\N
17	1985	US	97	ENG	R	The Breakfast Club	CO	\N	\N
18	1949	US	93	ENG	NR	The Third Man	BW	\N	\N
19	1996	US	91	ENG	R	Bottle Rocket	CO	\N	\N
20	1983	US	91	ENG	PG-13	The Outsiders	CO	\N	\N
21	1990	US	125	ENG	R	Wild at Heart	CO	\N	\N
22	1957	US	96	ENG	AP	12 Angry Man	BW	\N	\N
\.


--
-- Data for Name: movie_people; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY movie_people (moviepeopleid, movieid, peopleid) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
\.


--
-- Name: movie_people_moviepeopleid_seq; Type: SEQUENCE SET; Schema: public; Owner: davehochstrasser
--

SELECT pg_catalog.setval('movie_people_moviepeopleid_seq', 1, false);


--
-- Data for Name: movie_prodcuction; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY movie_prodcuction (studioid, movieid, movie_studioid) FROM stdin;
\.


--
-- Data for Name: moviegenre; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY moviegenre (moviegenreid, movieid, genreid) FROM stdin;
1	1	1
8	2	4
9	2	5
10	3	1
11	3	10
12	4	2
14	17	1
15	17	2
16	18	9
17	19	2
18	20	1
19	21	1
20	21	10
21	22	10
\.


--
-- Name: moviegenre_moviegenreid_seq; Type: SEQUENCE SET; Schema: public; Owner: davehochstrasser
--

SELECT pg_catalog.setval('moviegenre_moviegenreid_seq', 21, true);


--
-- Data for Name: moviereview; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY moviereview (moviereviewid, movieid, reviewid) FROM stdin;
1	17	5
2	18	2
3	22	1
4	22	2
5	22	3
6	3	7
7	3	8
8	1	1
9	1	6
10	4	5
11	4	9
12	18	1
13	18	2
14	18	3
15	18	4
\.


--
-- Name: movies_movieid_seq; Type: SEQUENCE SET; Schema: public; Owner: davehochstrasser
--

SELECT pg_catalog.setval('movies_movieid_seq', 22, true);


--
-- Data for Name: nominee; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY nominee (awardid, peopleid, movieid, nomineeid) FROM stdin;
1	125	2	1
2	1	1	2
1	23	22	4
4	45	19	5
7	67	4	9
9	4	18	7
4	84	3	10
3	99	21	11
9	133	1	12
2	149	2	13
\.


--
-- Name: nominee_nomineeid_seq; Type: SEQUENCE SET; Schema: public; Owner: davehochstrasser
--

SELECT pg_catalog.setval('nominee_nomineeid_seq', 13, true);


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY people (peopleid, firstname, lastname, title, datemodified, gender, website, email, dateofbirth, cityofbirth, counrtyofbirth) FROM stdin;
1	Emilio	Estevez	Mr	9012106	M	\N	\N	\N	\N	\N
2	Matt	Dillon	Mr	9012016	M	\N	\N	\N	\N	\N
3	Thomas	Howell	Mr	9012016	M	\N	\N	\N	\N	\N
4	Patrick	Swayze	Mr	9012016	M	\N	\N	\N	\N	\N
5	Tom	Cruise	Mr	9012016	M	\N	\N	\N	\N	\N
7	Rob	Lowe	Mr	9012016	M	\N	\N	\N	\N	\N
8	Ralph	Macchio	Mr	9012016	M	\N	\N	\N	\N	\N
9	Leif	Garrett	Mr	9012016	M	\N	\N	\N	\N	\N
10	William	Smith	Mr	9012016	M	\N	\N	\N	\N	\N
11	Glenn	Withrow	Mr	9012016	M	\N	\N	\N	\N	\N
12	Darren	Dalton	Mr	9012016	M	\N	\N	\N	\N	\N
6	Diane	Lane	Ms	9012106	F	\N	\N	\N	\N	\N
13	Tom	Waits	Mr	9012016	M	\N	\N	\N	\N	\N
14	Domino	\N	Ms	9012016	F	\N	\N	\N	\N	\N
15	S.E.	Hinton	Ms	9012016	F	\N	\N	\N	\N	\N
16	John	Meier	Mr	9012016	M	\N	\N	\N	\N	\N
17	Brent	Beesley	Mr	9012016	M	\N	\N	\N	\N	\N
18	Linda	Neystedt	Ms	9012016	F	\N	\N	\N	\N	\N
19	Dan	Suhart	Mr	9012016	M	\N	\N	\N	\N	\N
20	Tom	Hillman	Mr	9012016	M	\N	\N	\N	\N	\N
21	Teresa	Hunt	Ms	9012016	F	\N	\N	\N	\N	\N
22	Ed	Jackson	Mr	9012016	M	\N	\N	\N	\N	\N
23	Gailard	Sartain	Mr	9012016	M	\N	\N	\N	\N	\N
24	Robert	Coote	Mr	9012016	M	\N	\N	\N	\N	\N
25	Michael	MacLiammoir	Mr	9012016	M	\N	\N	\N	\N	\N
26	Orson	Welles	Mr	9012016	M	\N	\N	\N	\N	\N
27	Suzanne	Cloutier	Ms	9012016	F	\N	\N	\N	\N	\N
28	Hilton	Edwards	Mr	9012016	M	\N	\N	\N	\N	\N
29	Nicholas	Bruce	Mr	9012016	M	\N	\N	\N	\N	\N
30	Michael	Laurence	Mr	9012016	M	\N	\N	\N	\N	\N
31	Fay	Compton	Ms	9012016	F	\N	\N	\N	\N	\N
32	Doris	Dowling	Ms	9012016	F	\N	\N	\N	\N	\N
33	Jean	Davis	Mr	9012016	M	\N	\N	\N	\N	\N
34	Joseph	Cotten	Mr	9012016	M	\N	\N	\N	\N	\N
35	Joan	Fontaine	Ms	9012016	F	\N	\N	\N	\N	\N
36	Henry	Fonda	Mr	9012016	M	\N	\N	\N	\N	\N
37	Lee	Cobb	Mr	9012016	M	\N	\N	\N	\N	\N
38	Ed	Begley	Mr	9012016	M	\N	\N	\N	\N	\N
39	E.G.	Marshall	Mr	9012016	M	\N	\N	\N	\N	\N
40	Jack	Warden	Mr	9012016	M	\N	\N	\N	\N	\N
41	Martin	Balsam	Mr	9012016	M	\N	\N	\N	\N	\N
42	John	Fielder	Mr	9012016	M	\N	\N	\N	\N	\N
43	Jack	Klugman	Mr	9012016	M	\N	\N	\N	\N	\N
44	Edward	Binns	Mr	9012016	M	\N	\N	\N	\N	\N
45	Joseph	sweeney	mr	9012016	M	\N	\N	\N	\N	\N
46	George	Voskovec	Mr	9012016	M	\N	\N	\N	\N	\N
47	Robert	Weber	Mr	9012016	M	\N	\N	\N	\N	\N
48	Rudy	Bond	Mr	9012016	M	\N	\N	\N	\N	\N
49	James	Kelly	Mr	9012016	M	\N	\N	\N	\N	\N
50	Bill	Nelson	Mr	9012016	M	\N	\N	\N	\N	\N
51	John	Savoca	Mr	9012016	M	\N	\N	\N	\N	\N
52	Matthew	Broderick	Mr	9012016	M	\N	\N	\N	\N	\N
53	Reese	Witherspoon	Ms	9012016	F	\N	\N	\N	\N	\N
54	Chris	Klein	Mr	9012016	M	\N	\N	\N	\N	\N
55	Jessica	Campbell	Ms	9012016	F	\N	\N	\N	\N	\N
56	Mark	Harelik	Mr	9012016	M	\N	\N	\N	\N	\N
57	Paul	Gleeson	Mr	9012016	M	\N	\N	\N	\N	\N
58	Anthony Michael	Hall	Mr	9012016	M	\N	\N	\N	\N	\N
59	John	Kapelos	Mr	9012016	M	\N	\N	\N	\N	\N
61	Molly	Ringwald	Ms	9012016	F	\N	\N	\N	\N	\N
60	Judd	Nelson	Mr	9012016	M	\N	\N	\N	\N	\N
62	Ally	Sheedy	Ms	9012016	F	\N	\N	\N	\N	\N
64	Charlotte	Stuart	Ms	9012016	F	\N	\N	\N	\N	\N
63	John	Nance	Mr	9012016	M	\N	\N	\N	\N	\N
65	Allen	Joseph	Mr	9012016	M	\N	\N	\N	\N	\N
66	Jeanne	Bates	Ms	9012016	F	\N	\N	\N	\N	\N
67	Judith	Roberts	Ms	9012016	F	\N	\N	\N	\N	\N
68	Laurel	Near	Ms	9012016	F	\N	\N	\N	\N	\N
69	V	Phipps-Wilson	Ms	9012016	F	\N	\N	\N	\N	\N
70	Jack	Fisk	Mr	9012016	M	\N	\N	\N	\N	\N
71	Jean	Lange	Ms	9012016	F	\N	\N	\N	\N	\N
72	Thomas	Coulson	Mr	9012016	M	\N	\N	\N	\N	\N
73	John	Monez	Mr	9012016	M	\N	\N	\N	\N	\N
74	Darwin	Johnson	Mr	9012016	M	\N	\N	\N	\N	\N
75	Neil	Moran	Mr	9012016	M	\N	\N	\N	\N	\N
76	Hal	Landon	Mr	9012016	M	\N	\N	\N	\N	\N
77	Jennifer	Lynch	Ms	9012016	F	\N	\N	\N	\N	\N
78	Brad	Keeler	Mr	9012016	M	\N	\N	\N	\N	\N
79	Peggy	Lynch	Ms	9012016	F	\N	\N	\N	\N	\N
80	Doddie	Keeler	Ms	9012016	M	\N	\N	\N	\N	\N
81	Gil	Dennis	Mr	9012016	M	\N	\N	\N	\N	\N
82	Toby	Keeler	Mr	9012016	M	\N	\N	\N	\N	\N
83	Raymond	Walsh	Mr	9012016	M	\N	\N	\N	\N	\N
84	Kyle	MacLachlan	Mr	9012016	M	\N	\N	\N	\N	\N
85	Isabella	Rossellini	Ms	9012016	F	\N	\N	\N	\N	\N
86	Dennis	Hopper	Mr	9012016	M	\N	\N	\N	\N	\N
87	Laura	Dern	Ms	9012016	F	\N	\N	\N	\N	\N
88	Hope	Lange	Ms	9012016	F	\N	\N	\N	\N	\N
89	Luke	Wilson	Mr	9012106	M	\N	\N	\N	\N	\N
91	Ned	Dowd	Mr	9012016	M	\N	\N	\N	\N	\N
92	Shea	Fowler	Ms	9012016	F	\N	\N	\N	\N	\N
93	Haley	Miller	Ms	9012016	F	\N	\N	\N	\N	\N
94	Robert	Musgrave	Mr	9012016	M	\N	\N	\N	\N	\N
95	Nicolas	Cage	Mr	9012016	M	\N	\N	\N	\N	\N
96	Willem	Dafoe	Mr	9012016	M	\N	\N	\N	\N	\N
97	J.E.	Freeman	Mr	9012016	M	\N	\N	\N	\N	\N
90	Owen	Wilson	Mr	9012016	M	\N	\N	\N	\N	\N
98	Crispin	Glover	Mr	9012016	M	\N	\N	\N	\N	\N
99	Dianne	Ladd	Ms	9012016	F	\N	\N	\N	\N	\N
100	Calvin	Lockhart	Mr	9012016	M	\N	\N	\N	\N	\N
101	Harry Dean	Stanton	Mr	9012016	M	\N	\N	\N	\N	\N
102	Grace	Zabriski	Ms	9012016	F	\N	\N	\N	\N	\N
103	Sherilyn	Fenn	Ms	9012016	F	\N	\N	\N	\N	\N
104	Marvin	Kaplan	Mr	9012016	M	\N	\N	\N	\N	\N
105	W. Morgan	Sheppard	Mr	9012016	M	\N	\N	\N	\N	\N
106	David Patrick	Kelly	Mr	9012016	M	\N	\N	\N	\N	\N
107	Freddie 	Jones	Mr	9012016	M	\N	\N	\N	\N	\N
108	John	Lurie	Mr	9012016	M	\N	\N	\N	\N	\N
109	Jack	Nance	Mr	9012016	M	\N	\N	\N	\N	\N
110	Pruitt	Vince	Mr	9012016	M	\N	\N	\N	\N	\N
111	Gregg	Dandridge	Mr	9012016	M	\N	\N	\N	\N	\N
112	Glenn	Harris	Mr	9012016	M	\N	\N	\N	\N	\N
113	Frances	Ray	Ms	9012016	F	\N	\N	\N	\N	\N
114	Blair	Bever	Mr	9012016	M	\N	\N	\N	\N	\N
115	Sally	Boyle	Ms	9012016	F	\N	\N	\N	\N	\N
116	Peter	Bromilow	Mr	9012016	M	\N	\N	\N	\N	\N
117	Lias Ann	Cabasa	Ms	9012016	F	\N	\N	\N	\N	\N
118	Frank A.	Caruso	Mr	9012016	M	\N	\N	\N	\N	\N
119	Frank	Collison	Mr	9012016	M	\N	\N	\N	\N	\N
122	Cage	Johnson	Mr	9012016	M	\N	\N	\N	\N	\N
120	Eddy	Dixon	Mr	9012016	M	\N	\N	\N	\N	\N
124	Valli	Leigh	Ms	9012016	F	\N	\N	\N	\N	\N
125	Nick	Love	Mr	9012016	M	\N	\N	\N	\N	\N
126	Daniel	Quinn	Mr	9012016	M	\N	\N	\N	\N	\N
127	Mia	Ruiz	Ms	9012016	M	\N	\N	\N	\N	\N
128	Charlie	Spradling	Mr	9012016	M	\N	\N	\N	\N	\N
129	Billy	Swan	Mr	9012016	M	\N	\N	\N	\N	\N
130	Koko	Taylor	Ms	9012016	F	\N	\N	\N	\N	\N
131	Ed	Wright	Mr	9012016	M	\N	\N	\N	\N	\N
123	Sheryl	Lee	Ms	9012016	F	\N	\N	\N	\N	\N
121	Brent	Fisher	Mr	9012016	M	\N	\N	\N	\N	\N
132	Darrell	Zwerling	Mr	9012016	M	\N	\N	\N	\N	\N
133	Valli	\N	Ms	9012016	F	\N	\N	\N	\N	\N
134	Trevor 	Howard	Mr	9012016	M	\N	\N	\N	\N	\N
135	Bernard 	Lee	Mr	9012016	M	\N	\N	\N	\N	\N
136	Paul	Hoerbinger	Mr	9012016	M	\N	\N	\N	\N	\N
138	Sigfried	Breuer	Mr	9012016	M	\N	\N	\N	\N	\N
137	Ernst	Deutsch	Mr	9012016	M	\N	\N	\N	\N	\N
139	Erich	Ponto	Mr	9012016	M	\N	\N	\N	\N	\N
140	Wifred	White	Mr	9012016	M	\N	\N	\N	\N	\N
141	Hedwig	Bliebtreu	Mr	9012016	M	\N	\N	\N	\N	\N
142	Annie	Rosar	Ms	9012016	F	\N	\N	\N	\N	\N
143	Herbert	Halbik	Mr	9012016	M	\N	\N	\N	\N	\N
144	Alexis	Chesnakov	Mr	9012016	M	\N	\N	\N	\N	\N
145	Paul	Hardmuth	Mr	9012016	M	\N	\N	\N	\N	\N
146	Fredrick	Schreiker	Mr	9012016	M	\N	\N	\N	\N	\N
147	Jenny	Werner	Ms	9012016	F	\N	\N	\N	\N	\N
148	Nelly	Arno	Ms	9012016	M	\N	\N	\N	\N	\N
149	Leo	Bieber	Mr	9012016	M	\N	\N	\N	\N	\N
\.


--
-- Name: person_personid_seq; Type: SEQUENCE SET; Schema: public; Owner: davehochstrasser
--

SELECT pg_catalog.setval('person_personid_seq', 133, true);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY reviews (reviewid, movie_id, title) FROM stdin;
1	\N	Rotten Tomatoes
2	\N	IMDB
3	\N	New York Times
4	\N	Chicago Tribune
5	\N	USA Today
6	\N	Vanity Fair
7	\N	Metacritic
8	\N	Fandango
9	\N	Rolling Stone
10	\N	ET
\.


--
-- Name: reviews_reviewid_seq; Type: SEQUENCE SET; Schema: public; Owner: davehochstrasser
--

SELECT pg_catalog.setval('reviews_reviewid_seq', 10, true);


--
-- Data for Name: studio; Type: TABLE DATA; Schema: public; Owner: davehochstrasser
--

COPY studio (studioid, studioname, country, enceptionyear) FROM stdin;
1	David K Lynch Prod	US	1975
2	London Film Prod	UK	1939
4	Marceau Films	US	1949
3	Boanfide Prod	US	1990
5	Gracie Films	US	1991
6	Universal Pictures	US	1932
7	Propaganda Films	US	1987
\.


--
-- Name: award_pkey; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY award
    ADD CONSTRAINT award_pkey PRIMARY KEY (awardid);


--
-- Name: cast_castid_pk; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY "cast"
    ADD CONSTRAINT cast_castid_pk PRIMARY KEY (castid);


--
-- Name: genre_pkey; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genreid);


--
-- Name: movie_people_pkey; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY movie_people
    ADD CONSTRAINT movie_people_pkey PRIMARY KEY (moviepeopleid);


--
-- Name: movie_prodcuction_movie_studioid_pk; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY movie_prodcuction
    ADD CONSTRAINT movie_prodcuction_movie_studioid_pk PRIMARY KEY (movie_studioid);


--
-- Name: moviegenre_pkey; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY moviegenre
    ADD CONSTRAINT moviegenre_pkey PRIMARY KEY (moviegenreid);


--
-- Name: moviereview_pkey; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY moviereview
    ADD CONSTRAINT moviereview_pkey PRIMARY KEY (moviereviewid);


--
-- Name: movies_pkey; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movieid);


--
-- Name: nominee_nomineeid_pk; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY nominee
    ADD CONSTRAINT nominee_nomineeid_pk PRIMARY KEY (nomineeid);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY people
    ADD CONSTRAINT person_pkey PRIMARY KEY (peopleid);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (reviewid);


--
-- Name: studio_pkey; Type: CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY studio
    ADD CONSTRAINT studio_pkey PRIMARY KEY (studioid);


--
-- Name: Movie_people_moviepeopleid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX "Movie_people_moviepeopleid_uindex" ON movie_people USING btree (moviepeopleid);


--
-- Name: award_awardid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX award_awardid_uindex ON award USING btree (awardid);


--
-- Name: cast_castid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX cast_castid_uindex ON "cast" USING btree (castid);


--
-- Name: genre_genreid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX genre_genreid_uindex ON genre USING btree (genreid);


--
-- Name: movie_prodcuction_movie_studioid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX movie_prodcuction_movie_studioid_uindex ON movie_prodcuction USING btree (movie_studioid);


--
-- Name: movie_title_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX movie_title_uindex ON movie USING btree (title);


--
-- Name: moviegenre_moviegenreid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX moviegenre_moviegenreid_uindex ON moviegenre USING btree (moviegenreid);


--
-- Name: movies_movieid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX movies_movieid_uindex ON movie USING btree (movieid);


--
-- Name: nominee_nomineeid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX nominee_nomineeid_uindex ON nominee USING btree (nomineeid);


--
-- Name: person_personid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX person_personid_uindex ON people USING btree (peopleid);


--
-- Name: reviews_reviewid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX reviews_reviewid_uindex ON reviews USING btree (reviewid);


--
-- Name: studio_studioid_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX studio_studioid_uindex ON studio USING btree (studioid);


--
-- Name: studio_studioname_uindex; Type: INDEX; Schema: public; Owner: davehochstrasser
--

CREATE UNIQUE INDEX studio_studioname_uindex ON studio USING btree (studioname);


--
-- Name: cast_people_peopleid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY "cast"
    ADD CONSTRAINT cast_people_peopleid_fk FOREIGN KEY (peopleid) REFERENCES people(peopleid);


--
-- Name: movie_genre_genreid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_genre_genreid_fk FOREIGN KEY (genreid) REFERENCES genre(genreid);


--
-- Name: movie_people_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY movie_people
    ADD CONSTRAINT movie_people_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: movie_people_people_peopleid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY movie_people
    ADD CONSTRAINT movie_people_people_peopleid_fk FOREIGN KEY (peopleid) REFERENCES people(peopleid);


--
-- Name: movie_prodcuction_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY movie_prodcuction
    ADD CONSTRAINT movie_prodcuction_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: movie_prodcuction_studio_studioid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY movie_prodcuction
    ADD CONSTRAINT movie_prodcuction_studio_studioid_fk FOREIGN KEY (studioid) REFERENCES studio(studioid);


--
-- Name: moviegenre_genre_genreid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY moviegenre
    ADD CONSTRAINT moviegenre_genre_genreid_fk FOREIGN KEY (genreid) REFERENCES genre(genreid);


--
-- Name: moviegenre_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY moviegenre
    ADD CONSTRAINT moviegenre_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: moviereview_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY moviereview
    ADD CONSTRAINT moviereview_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: moviereview_reviews_reviewid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY moviereview
    ADD CONSTRAINT moviereview_reviews_reviewid_fk FOREIGN KEY (reviewid) REFERENCES reviews(reviewid);


--
-- Name: nominee_award_awardid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY nominee
    ADD CONSTRAINT nominee_award_awardid_fk FOREIGN KEY (awardid) REFERENCES award(awardid);


--
-- Name: nominee_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY nominee
    ADD CONSTRAINT nominee_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: nominee_people_peopleid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY nominee
    ADD CONSTRAINT nominee_people_peopleid_fk FOREIGN KEY (peopleid) REFERENCES people(peopleid);


--
-- Name: reviews_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: davehochstrasser
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_movie_movieid_fk FOREIGN KEY (movie_id) REFERENCES movie(movieid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

