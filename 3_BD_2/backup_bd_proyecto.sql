--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: tbl_carrera; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_carrera (
    id_carrera character varying(8) NOT NULL,
    nombre character varying(100),
    puntos_paa integer,
    fecha_creacion date,
    grado_academico character varying(20)
);


ALTER TABLE tbl_carrera OWNER TO usuario_proyecto;

--
-- Name: tbl_clases; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_clases (
    id_clase character varying(8) NOT NULL,
    id_carrera character varying(8),
    unidades_valorativas integer,
    requisitos character varying(50),
    laboratorio boolean
);


ALTER TABLE tbl_clases OWNER TO usuario_proyecto;

--
-- Name: tbl_estudiantes; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_estudiantes (
    identidad character varying(13),
    nombres character varying(50),
    apellidos character varying(50),
    id_estudiante character varying(11) NOT NULL,
    id_centro_universitario character varying(8),
    id_carrera character varying(8),
    fecha_ingreso date,
    lugar_nacimiento character varying(100),
    fecha_nacimiento date,
    secundaria character varying(100),
    titulo character varying(100),
    direccion character varying(100),
    telefono character varying(10),
    etnia character varying(50),
    password character varying(32)
);


ALTER TABLE tbl_estudiantes OWNER TO usuario_proyecto;

--
-- Name: tbl_notas; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_notas (
    id_estudiante character varying(11),
    id_clase character varying(8),
    docente character varying(50),
    seccion character varying(6),
    nota_final integer,
    id_periodo integer
);


ALTER TABLE tbl_notas OWNER TO usuario_proyecto;

--
-- Name: tbl_periodo; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_periodo (
    id_periodo integer NOT NULL,
    fecha_inicio date,
    fecha_fin date
);


ALTER TABLE tbl_periodo OWNER TO usuario_proyecto;

--
-- Data for Name: tbl_carrera; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_carrera (id_carrera, nombre, puntos_paa, fecha_creacion, grado_academico) FROM stdin;
\.


--
-- Data for Name: tbl_clases; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_clases (id_clase, id_carrera, unidades_valorativas, requisitos, laboratorio) FROM stdin;
MM110	MAT	5	Ninguno	t
FS321	FIS	5	FS200, MM314	t
IS101	IS	4	MM110	t
IS200	IS	5	IS101	f
LE114	LENGUAS	3	Ninguno	f
PS123	PSCLG	4	PS102	t
FS200	FISICA	5	FS100	t
\.


--
-- Data for Name: tbl_estudiantes; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_estudiantes (identidad, nombres, apellidos, id_estudiante, id_centro_universitario, id_carrera, fecha_ingreso, lugar_nacimiento, fecha_nacimiento, secundaria, titulo, direccion, telefono, etnia, password) FROM stdin;
0801199567892	Johanna Maria	Salgado Gutierrez	20131234564	CU	IQ	2013-07-12	Tegucigalpa	1995-07-12	ENMPN	Bachiller en salud	Residencial la Joya	87652134	ninguna	12Salgado
0802199725341	Carlos Mario	Gonzales Urrutia	20161004324	CU	IE	2016-07-11	Tegucigalpa	1997-02-09	Virginia Sapp	Bachiller CC LL	Residencial tres caminos	82134534	ninguna	9Urrutia
0802199523541	Karla Alejandra	Matamoros Costa	20141114114	CURLA	Lenguas	2014-01-15	San Pedro Sula	1995-11-21	Instituto Mixto Julio Garcia	Bachiller CC LL	Colonia los profesores	99874214	ninguna	15Costa
0801199616039	Josue Luis	Funez Antunez	20151001839	CU	IS	2015-01-15	Tegucigalpa	1996-09-19	Instituto Evangelico Penzotti	Tecnico en computacion	Residencial Honduras	89419967	ninguna	19Funez
\.


--
-- Data for Name: tbl_notas; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_notas (id_estudiante, id_clase, docente, seccion, nota_final, id_periodo) FROM stdin;
20151001839	MM110	Arturo Alonso Figueroa	0800	67	1
20151001839	IS101	Jenny Martinez	1200	87	1
20151001839	FS200	Marcos Perez	1200	64	2
20151001839	LE114	Juan Palma	1100	99	4
20151001839	IS101	Manuel Irias	0800	90	4
\.


--
-- Data for Name: tbl_periodo; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_periodo (id_periodo, fecha_inicio, fecha_fin) FROM stdin;
1	2015-01-16	2015-04-16
2	2015-04-28	2015-07-28
3	2015-08-07	2015-11-07
4	2016-01-08	2016-04-08
5	2016-04-21	2016-07-21
6	2016-08-12	2016-11-12
7	2017-01-16	2017-04-19
8	2017-05-02	2017-09-01
9	2017-09-13	2017-12-18
10	2018-01-10	2018-04-15
11	2018-05-03	2018-09-15
\.


--
-- Name: tbl_carrera tbl_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_carrera
    ADD CONSTRAINT tbl_carrera_pkey PRIMARY KEY (id_carrera);


--
-- Name: tbl_clases tbl_clases_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_clases
    ADD CONSTRAINT tbl_clases_pkey PRIMARY KEY (id_clase);


--
-- Name: tbl_estudiantes tbl_estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_estudiantes
    ADD CONSTRAINT tbl_estudiantes_pkey PRIMARY KEY (id_estudiante);


--
-- Name: tbl_periodo tbl_periodo_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_periodo
    ADD CONSTRAINT tbl_periodo_pkey PRIMARY KEY (id_periodo);


--
-- PostgreSQL database dump complete
--

