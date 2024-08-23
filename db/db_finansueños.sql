--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

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
-- Name: rol; Type: TABLE; Schema: public; Owner: facer
--

CREATE TABLE public.rol (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.rol OWNER TO facer;

--
-- Name: rol_id_seq; Type: SEQUENCE; Schema: public; Owner: facer
--

CREATE SEQUENCE public.rol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rol_id_seq OWNER TO facer;

--
-- Name: rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: facer
--

ALTER SEQUENCE public.rol_id_seq OWNED BY public.rol.id;


--
-- Name: user_rol; Type: TABLE; Schema: public; Owner: facer
--

CREATE TABLE public.user_rol (
    user_id integer NOT NULL,
    rol_id integer NOT NULL
);


ALTER TABLE public.user_rol OWNER TO facer;

--
-- Name: users; Type: TABLE; Schema: public; Owner: facer
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50),
    lastname character varying(50),
    email character varying(100)
);


ALTER TABLE public.users OWNER TO facer;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: facer
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO facer;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: facer
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: rol id; Type: DEFAULT; Schema: public; Owner: facer
--

ALTER TABLE ONLY public.rol ALTER COLUMN id SET DEFAULT nextval('public.rol_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: facer
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: facer
--

COPY public.rol (id, name) FROM stdin;
\.


--
-- Data for Name: user_rol; Type: TABLE DATA; Schema: public; Owner: facer
--

COPY public.user_rol (user_id, rol_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: facer
--

COPY public.users (id, name, lastname, email) FROM stdin;
\.


--
-- Name: rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: facer
--

SELECT pg_catalog.setval('public.rol_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: facer
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: facer
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);


--
-- Name: user_rol user_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: facer
--

ALTER TABLE ONLY public.user_rol
    ADD CONSTRAINT user_rol_pkey PRIMARY KEY (user_id, rol_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: facer
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

