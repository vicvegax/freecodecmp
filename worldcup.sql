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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (33, 2018, 'Final', 52, 53, 4, 2);
INSERT INTO public.games VALUES (34, 2018, 'Third Place', 54, 55, 2, 0);
INSERT INTO public.games VALUES (35, 2018, 'Semi-Final', 53, 55, 2, 1);
INSERT INTO public.games VALUES (36, 2018, 'Semi-Final', 52, 54, 1, 0);
INSERT INTO public.games VALUES (37, 2018, 'Quarter-Final', 53, 56, 3, 2);
INSERT INTO public.games VALUES (38, 2018, 'Quarter-Final', 55, 57, 2, 0);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 54, 58, 2, 1);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 52, 59, 2, 0);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 55, 60, 2, 1);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 57, 61, 1, 0);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 54, 62, 3, 2);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 58, 63, 2, 0);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 53, 64, 2, 1);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 56, 65, 2, 1);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 59, 66, 2, 1);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 52, 67, 4, 3);
INSERT INTO public.games VALUES (49, 2014, 'Final', 68, 67, 1, 0);
INSERT INTO public.games VALUES (50, 2014, 'Third Place', 69, 58, 3, 0);
INSERT INTO public.games VALUES (51, 2014, 'Semi-Final', 67, 69, 1, 0);
INSERT INTO public.games VALUES (52, 2014, 'Semi-Final', 68, 58, 7, 1);
INSERT INTO public.games VALUES (53, 2014, 'Quarter-Final', 69, 70, 1, 0);
INSERT INTO public.games VALUES (54, 2014, 'Quarter-Final', 67, 54, 1, 0);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 58, 60, 2, 1);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 68, 52, 1, 0);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 58, 71, 2, 1);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 60, 59, 2, 0);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 52, 72, 2, 0);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 68, 73, 2, 1);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 69, 63, 2, 1);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 70, 74, 2, 1);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 67, 61, 1, 0);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 54, 75, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (52, 'France');
INSERT INTO public.teams VALUES (53, 'Croatia');
INSERT INTO public.teams VALUES (54, 'Belgium');
INSERT INTO public.teams VALUES (55, 'England');
INSERT INTO public.teams VALUES (56, 'Russia');
INSERT INTO public.teams VALUES (57, 'Sweden');
INSERT INTO public.teams VALUES (58, 'Brazil');
INSERT INTO public.teams VALUES (59, 'Uruguay');
INSERT INTO public.teams VALUES (60, 'Colombia');
INSERT INTO public.teams VALUES (61, 'Switzerland');
INSERT INTO public.teams VALUES (62, 'Japan');
INSERT INTO public.teams VALUES (63, 'Mexico');
INSERT INTO public.teams VALUES (64, 'Denmark');
INSERT INTO public.teams VALUES (65, 'Spain');
INSERT INTO public.teams VALUES (66, 'Portugal');
INSERT INTO public.teams VALUES (67, 'Argentina');
INSERT INTO public.teams VALUES (68, 'Germany');
INSERT INTO public.teams VALUES (69, 'Netherlands');
INSERT INTO public.teams VALUES (70, 'Costa Rica');
INSERT INTO public.teams VALUES (71, 'Chile');
INSERT INTO public.teams VALUES (72, 'Nigeria');
INSERT INTO public.teams VALUES (73, 'Algeria');
INSERT INTO public.teams VALUES (74, 'Greece');
INSERT INTO public.teams VALUES (75, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 75, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams team_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT team_name UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games opponent_team; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT opponent_team FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games winner_team; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT winner_team FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

