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
-- Name: tbl_centros_universitario; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_centros_universitario (
    id_centro character varying(4) NOT NULL,
    departamento character varying(20)
);


ALTER TABLE tbl_centros_universitario OWNER TO usuario_proyecto;

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
-- Name: tbl_docentes; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_docentes (
    id_docente integer NOT NULL,
    id_centro_universitario character varying(8),
    identidad integer,
    nombres character varying(50),
    apellidos character varying(50),
    direccion character varying(100),
    fecha_ingreso date,
    lugar_nacimiento character varying(100),
    fecha_nacimiento date,
    alma_mater character varying(100),
    titulo character varying(100),
    telefono integer,
    etnia character varying(50)
);


ALTER TABLE tbl_docentes OWNER TO usuario_proyecto;

--
-- Name: tbl_estudiantes; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_estudiantes (
    identidad integer,
    nombres character varying(50),
    apellidos character varying(50),
    id_estudiante integer NOT NULL,
    id_centro_universitario character varying(8),
    id_carrera character varying(8),
    fecha_ingreso date,
    lugar_nacimiento character varying(100),
    fecha_nacimiento date,
    secundaria character varying(100),
    titulo character varying(100),
    direccion character varying(100),
    telefono integer,
    etnia character varying(50),
    password character varying(32)
);


ALTER TABLE tbl_estudiantes OWNER TO usuario_proyecto;

--
-- Name: tbl_laboratorios; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_laboratorios (
    id_laboratorio character varying(8) NOT NULL,
    id_clase character varying(8),
    seccion character varying(6),
    cupos integer
);


ALTER TABLE tbl_laboratorios OWNER TO usuario_proyecto;

--
-- Name: tbl_matricula; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_matricula (
    id_matricula integer NOT NULL,
    id_estudiante integer,
    id_clase character varying(8),
    id_docente integer,
    seccion character varying(6),
    id_carrera character varying(8),
    id_periodo integer
);


ALTER TABLE tbl_matricula OWNER TO usuario_proyecto;

--
-- Name: tbl_notas; Type: TABLE; Schema: public; Owner: usuario_proyecto
--

CREATE TABLE tbl_notas (
    id_usuario integer,
    id_clase character varying(8),
    id_docente integer,
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
-- Data for Name: tbl_centros_universitario; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_centros_universitario (id_centro, departamento) FROM stdin;
\.


--
-- Data for Name: tbl_clases; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_clases (id_clase, id_carrera, unidades_valorativas, requisitos, laboratorio) FROM stdin;
\.


--
-- Data for Name: tbl_docentes; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_docentes (id_docente, id_centro_universitario, identidad, nombres, apellidos, direccion, fecha_ingreso, lugar_nacimiento, fecha_nacimiento, alma_mater, titulo, telefono, etnia) FROM stdin;
\.


--
-- Data for Name: tbl_estudiantes; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_estudiantes (identidad, nombres, apellidos, id_estudiante, id_centro_universitario, id_carrera, fecha_ingreso, lugar_nacimiento, fecha_nacimiento, secundaria, titulo, direccion, telefono, etnia, password) FROM stdin;
\.


--
-- Data for Name: tbl_laboratorios; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_laboratorios (id_laboratorio, id_clase, seccion, cupos) FROM stdin;
\.


--
-- Data for Name: tbl_matricula; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_matricula (id_matricula, id_estudiante, id_clase, id_docente, seccion, id_carrera, id_periodo) FROM stdin;
\.


--
-- Data for Name: tbl_notas; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_notas (id_usuario, id_clase, id_docente, seccion, nota_final, id_periodo) FROM stdin;
\.


--
-- Data for Name: tbl_periodo; Type: TABLE DATA; Schema: public; Owner: usuario_proyecto
--

COPY tbl_periodo (id_periodo, fecha_inicio, fecha_fin) FROM stdin;
\.


--
-- Name: tbl_carrera tbl_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_carrera
    ADD CONSTRAINT tbl_carrera_pkey PRIMARY KEY (id_carrera);


--
-- Name: tbl_centros_universitario tbl_centros_universitario_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_centros_universitario
    ADD CONSTRAINT tbl_centros_universitario_pkey PRIMARY KEY (id_centro);


--
-- Name: tbl_clases tbl_clases_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_clases
    ADD CONSTRAINT tbl_clases_pkey PRIMARY KEY (id_clase);


--
-- Name: tbl_docentes tbl_docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_docentes
    ADD CONSTRAINT tbl_docentes_pkey PRIMARY KEY (id_docente);


--
-- Name: tbl_estudiantes tbl_estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_estudiantes
    ADD CONSTRAINT tbl_estudiantes_pkey PRIMARY KEY (id_estudiante);


--
-- Name: tbl_laboratorios tbl_laboratorios_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_laboratorios
    ADD CONSTRAINT tbl_laboratorios_pkey PRIMARY KEY (id_laboratorio);


--
-- Name: tbl_matricula tbl_matricula_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_matricula
    ADD CONSTRAINT tbl_matricula_pkey PRIMARY KEY (id_matricula);


--
-- Name: tbl_periodo tbl_periodo_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario_proyecto
--

ALTER TABLE ONLY tbl_periodo
    ADD CONSTRAINT tbl_periodo_pkey PRIMARY KEY (id_periodo);


--
-- PostgreSQL database dump complete
--

