--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
    tries integer NOT NULL
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
-- Name: user_information; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_information (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.user_information OWNER TO freecodecamp;

--
-- Name: user_information_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_information_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_information_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_information_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_information_user_id_seq OWNED BY public.user_information.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: user_information user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_information ALTER COLUMN user_id SET DEFAULT nextval('public.user_information_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 10);
INSERT INTO public.games VALUES (2, 2, 680);
INSERT INTO public.games VALUES (3, 2, 497);
INSERT INTO public.games VALUES (4, 3, 627);
INSERT INTO public.games VALUES (5, 3, 600);
INSERT INTO public.games VALUES (6, 2, 906);
INSERT INTO public.games VALUES (7, 2, 997);
INSERT INTO public.games VALUES (8, 2, 225);
INSERT INTO public.games VALUES (9, 4, 13);
INSERT INTO public.games VALUES (10, 5, 433);
INSERT INTO public.games VALUES (11, 5, 724);
INSERT INTO public.games VALUES (12, 6, 831);
INSERT INTO public.games VALUES (13, 6, 940);
INSERT INTO public.games VALUES (14, 5, 794);
INSERT INTO public.games VALUES (15, 5, 409);
INSERT INTO public.games VALUES (16, 5, 617);
INSERT INTO public.games VALUES (17, 7, 126);
INSERT INTO public.games VALUES (18, 7, 70);
INSERT INTO public.games VALUES (19, 8, 229);
INSERT INTO public.games VALUES (20, 8, 569);
INSERT INTO public.games VALUES (21, 7, 819);
INSERT INTO public.games VALUES (22, 7, 325);
INSERT INTO public.games VALUES (23, 7, 496);


--
-- Data for Name: user_information; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_information VALUES (1, 'Lolo');
INSERT INTO public.user_information VALUES (2, 'user_1668879060095');
INSERT INTO public.user_information VALUES (3, 'user_1668879060094');
INSERT INTO public.user_information VALUES (4, 'Lara');
INSERT INTO public.user_information VALUES (5, 'user_1668879238315');
INSERT INTO public.user_information VALUES (6, 'user_1668879238314');
INSERT INTO public.user_information VALUES (7, 'user_1668879295939');
INSERT INTO public.user_information VALUES (8, 'user_1668879295938');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 23, true);


--
-- Name: user_information_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_information_user_id_seq', 8, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: user_information user_information_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_information
    ADD CONSTRAINT user_information_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_information(user_id);


--
-- PostgreSQL database dump complete
--

