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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('J', 3, 1);
INSERT INTO public.users VALUES ('user_1678757580489', 3, 1);
INSERT INTO public.users VALUES ('user_1678757580488', 3, 1);
INSERT INTO public.users VALUES ('j', 3, 1);
INSERT INTO public.users VALUES ('user_1678759861221', 3, 1);
INSERT INTO public.users VALUES ('user_1678759861220', 3, 1);
INSERT INTO public.users VALUES ('user_1678760173391', 3, 1);
INSERT INTO public.users VALUES ('user_1678760173390', 3, 1);
INSERT INTO public.users VALUES ('1000', 3, 1);
INSERT INTO public.users VALUES ('Jason', 2, 1);
INSERT INTO public.users VALUES ('user_1678761701705', 2, 365);
INSERT INTO public.users VALUES ('user_1678761701706', 5, 168);


--
-- PostgreSQL database dump complete
--

