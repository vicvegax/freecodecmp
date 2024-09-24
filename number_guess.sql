--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    date_inc date DEFAULT now()
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: wins; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.wins (
    win_id integer NOT NULL,
    game_id integer NOT NULL,
    tries integer NOT NULL,
    date_inc date DEFAULT now()
);


ALTER TABLE public.wins OWNER TO freecodecamp;

--
-- Name: wins_win_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.wins_win_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wins_win_id_seq OWNER TO freecodecamp;

--
-- Name: wins_win_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.wins_win_id_seq OWNED BY public.wins.win_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: wins win_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wins ALTER COLUMN win_id SET DEFAULT nextval('public.wins_win_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (55, 16, '2024-09-24');
INSERT INTO public.games VALUES (56, 16, '2024-09-24');
INSERT INTO public.games VALUES (57, 17, '2024-09-24');
INSERT INTO public.games VALUES (58, 17, '2024-09-24');
INSERT INTO public.games VALUES (59, 16, '2024-09-24');
INSERT INTO public.games VALUES (60, 16, '2024-09-24');
INSERT INTO public.games VALUES (61, 16, '2024-09-24');
INSERT INTO public.games VALUES (62, 18, '2024-09-24');
INSERT INTO public.games VALUES (63, 18, '2024-09-24');
INSERT INTO public.games VALUES (64, 19, '2024-09-24');
INSERT INTO public.games VALUES (65, 19, '2024-09-24');
INSERT INTO public.games VALUES (66, 18, '2024-09-24');
INSERT INTO public.games VALUES (67, 18, '2024-09-24');
INSERT INTO public.games VALUES (68, 18, '2024-09-24');
INSERT INTO public.games VALUES (69, 20, '2024-09-24');
INSERT INTO public.games VALUES (70, 20, '2024-09-24');
INSERT INTO public.games VALUES (71, 21, '2024-09-24');
INSERT INTO public.games VALUES (72, 21, '2024-09-24');
INSERT INTO public.games VALUES (73, 20, '2024-09-24');
INSERT INTO public.games VALUES (74, 20, '2024-09-24');
INSERT INTO public.games VALUES (75, 20, '2024-09-24');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (16, 'user_1727211450831');
INSERT INTO public.users VALUES (17, 'user_1727211450830');
INSERT INTO public.users VALUES (18, 'user_1727211548522');
INSERT INTO public.users VALUES (19, 'user_1727211548521');
INSERT INTO public.users VALUES (20, 'user_1727211572523');
INSERT INTO public.users VALUES (21, 'user_1727211572522');


--
-- Data for Name: wins; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.wins VALUES (46, 55, 596, '2024-09-24');
INSERT INTO public.wins VALUES (47, 56, 626, '2024-09-24');
INSERT INTO public.wins VALUES (48, 57, 55, '2024-09-24');
INSERT INTO public.wins VALUES (49, 58, 97, '2024-09-24');
INSERT INTO public.wins VALUES (50, 59, 91, '2024-09-24');
INSERT INTO public.wins VALUES (51, 60, 850, '2024-09-24');
INSERT INTO public.wins VALUES (52, 61, 755, '2024-09-24');
INSERT INTO public.wins VALUES (53, 62, 974, '2024-09-24');
INSERT INTO public.wins VALUES (54, 63, 771, '2024-09-24');
INSERT INTO public.wins VALUES (55, 64, 2, '2024-09-24');
INSERT INTO public.wins VALUES (56, 65, 312, '2024-09-24');
INSERT INTO public.wins VALUES (57, 66, 305, '2024-09-24');
INSERT INTO public.wins VALUES (58, 67, 720, '2024-09-24');
INSERT INTO public.wins VALUES (59, 68, 777, '2024-09-24');
INSERT INTO public.wins VALUES (60, 69, 698, '2024-09-24');
INSERT INTO public.wins VALUES (61, 70, 453, '2024-09-24');
INSERT INTO public.wins VALUES (62, 71, 849, '2024-09-24');
INSERT INTO public.wins VALUES (63, 72, 573, '2024-09-24');
INSERT INTO public.wins VALUES (64, 73, 540, '2024-09-24');
INSERT INTO public.wins VALUES (65, 74, 820, '2024-09-24');
INSERT INTO public.wins VALUES (66, 75, 694, '2024-09-24');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 75, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: wins_win_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.wins_win_id_seq', 66, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: wins wins_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wins
    ADD CONSTRAINT wins_pkey PRIMARY KEY (win_id);


--
-- Name: games user_game; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT user_game FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: wins win_game; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wins
    ADD CONSTRAINT win_game FOREIGN KEY (game_id) REFERENCES public.games(game_id);


--
-- PostgreSQL database dump complete
--

