--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
ALTER TABLE ONLY public."TransaccionTarjeta" DROP CONSTRAINT "TransaccionTarjeta_pkey";
ALTER TABLE ONLY public."TipoTransaccion" DROP CONSTRAINT "TipoTransaccion_pkey";
ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_pkey";
ALTER TABLE ONLY public."TarjetaEvento" DROP CONSTRAINT "TarjetaEvento_pkey";
ALTER TABLE ONLY public."Premio" DROP CONSTRAINT "Premio_pkey";
ALTER TABLE ONLY public."PremioTarjeta" DROP CONSTRAINT "PremioTarjeta_pkey";
ALTER TABLE ONLY public."Organizador" DROP CONSTRAINT "Organizador_pkey";
ALTER TABLE ONLY public."Imagen" DROP CONSTRAINT "Imagen_pkey";
ALTER TABLE ONLY public."GrupoUsuario" DROP CONSTRAINT "GrupoUsuario_pkey";
ALTER TABLE ONLY public."Evento" DROP CONSTRAINT "Evento_pkey";
DROP TABLE public."Usuario";
DROP TABLE public."TransaccionTarjeta";
DROP TABLE public."TipoTransaccion";
DROP TABLE public."TarjetaEvento";
DROP TABLE public."Tarjeta";
DROP TABLE public."PremioTarjeta";
DROP TABLE public."Premio";
DROP TABLE public."Organizador";
DROP TABLE public."Imagen";
DROP TABLE public."GrupoUsuario";
DROP TABLE public."Evento";
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Evento" (
    "IdEvento" integer NOT NULL,
    "NombreEvento" "char" NOT NULL,
    "DescripcionEvento" "char",
    "FechaInicio" date NOT NULL,
    "FechaFin" date NOT NULL,
    "HoraInicio" date NOT NULL,
    "HoraFin" date,
    "IdGrupoImagenes" integer,
    "IdOrganizador" integer NOT NULL,
    "LatLong" "char",
    "Direccion" "char" NOT NULL
);


ALTER TABLE public."Evento" OWNER TO postgres;

--
-- Name: GrupoUsuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GrupoUsuario" (
    "IdGrupo" integer NOT NULL,
    "NombreGrupo" "char" NOT NULL,
    "DescripcionGrupo" "char"
);


ALTER TABLE public."GrupoUsuario" OWNER TO postgres;

--
-- Name: Imagen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Imagen" (
    "IdImagen" integer NOT NULL,
    "IdGrupoImagenes" integer NOT NULL,
    "Nombre" "char" NOT NULL,
    "Descripcion" "char",
    "RutaArchivo" "char" NOT NULL,
    "NombreArchivo" "char" NOT NULL
);


ALTER TABLE public."Imagen" OWNER TO postgres;

--
-- Name: Organizador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Organizador" (
    "IdOrganizador" integer NOT NULL,
    "Nombre" "char" NOT NULL,
    "Responsable" "char",
    "Email" "char",
    "TelefonoContacto" integer
);


ALTER TABLE public."Organizador" OWNER TO postgres;

--
-- Name: Premio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Premio" (
    "IdPremio" integer NOT NULL,
    "NombrePremio" "char" NOT NULL,
    "Descripcion" "char",
    "Tipo" "char" NOT NULL,
    "PuntosPremio" integer NOT NULL,
    "Estado" integer NOT NULL
);


ALTER TABLE public."Premio" OWNER TO postgres;

--
-- Name: PremioTarjeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PremioTarjeta" (
    "IdPremio" integer NOT NULL,
    "IdTarjeta" integer NOT NULL,
    "FechaEntrega" date NOT NULL,
    "IdUsuario" integer NOT NULL
);


ALTER TABLE public."PremioTarjeta" OWNER TO postgres;

--
-- Name: Tarjeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tarjeta" (
    "IdTarjeta" integer NOT NULL,
    "NumeroTarjeta" "char" NOT NULL,
    "FechaExpedicion" date NOT NULL,
    "FechaActivacion" date NOT NULL,
    "EstadoTarjeta" integer NOT NULL,
    "PuntosTarjeta" integer NOT NULL,
    "IdUsuario" integer
);


ALTER TABLE public."Tarjeta" OWNER TO postgres;

--
-- Name: TarjetaEvento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TarjetaEvento" (
    "IdTarjetaEvento" integer NOT NULL,
    "IdEvento" integer NOT NULL,
    "HoraTarjetaEvento" date
);


ALTER TABLE public."TarjetaEvento" OWNER TO postgres;

--
-- Name: TipoTransaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoTransaccion" (
    "IdTipoTransaccion" integer NOT NULL,
    "NombreTransaccion" "char" NOT NULL,
    "DescripcionTransaccion" "char",
    "EfectoTransaccion" "char" NOT NULL,
    "EstadoTransaccion" boolean NOT NULL
);


ALTER TABLE public."TipoTransaccion" OWNER TO postgres;

--
-- Name: TransaccionTarjeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransaccionTarjeta" (
    "IdTransaccion" integer NOT NULL,
    "IdTarjeta" integer NOT NULL,
    "IdEvento" integer,
    "IdTipoTransaccion" integer NOT NULL,
    "ValorTransaccion" integer NOT NULL,
    "SaldoTransaccion" integer NOT NULL
);


ALTER TABLE public."TransaccionTarjeta" OWNER TO postgres;

--
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "ContrasenaUsuario" "char" NOT NULL,
    "CorreoUsuario" "char",
    "EstadoUsuario" integer NOT NULL,
    "IdGrupo" integer NOT NULL,
    "IdUsuario" integer NOT NULL,
    "NombrePersona" "char" NOT NULL,
    "NombreUsuario" "char" NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- Data for Name: Evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Evento" ("IdEvento", "NombreEvento", "DescripcionEvento", "FechaInicio", "FechaFin", "HoraInicio", "HoraFin", "IdGrupoImagenes", "IdOrganizador", "LatLong", "Direccion") FROM stdin;
\.
COPY public."Evento" ("IdEvento", "NombreEvento", "DescripcionEvento", "FechaInicio", "FechaFin", "HoraInicio", "HoraFin", "IdGrupoImagenes", "IdOrganizador", "LatLong", "Direccion") FROM '$$PATH$$/2211.dat';

--
-- Data for Name: GrupoUsuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GrupoUsuario" ("IdGrupo", "NombreGrupo", "DescripcionGrupo") FROM stdin;
\.
COPY public."GrupoUsuario" ("IdGrupo", "NombreGrupo", "DescripcionGrupo") FROM '$$PATH$$/2206.dat';

--
-- Data for Name: Imagen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Imagen" ("IdImagen", "IdGrupoImagenes", "Nombre", "Descripcion", "RutaArchivo", "NombreArchivo") FROM stdin;
\.
COPY public."Imagen" ("IdImagen", "IdGrupoImagenes", "Nombre", "Descripcion", "RutaArchivo", "NombreArchivo") FROM '$$PATH$$/2212.dat';

--
-- Data for Name: Organizador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Organizador" ("IdOrganizador", "Nombre", "Responsable", "Email", "TelefonoContacto") FROM stdin;
\.
COPY public."Organizador" ("IdOrganizador", "Nombre", "Responsable", "Email", "TelefonoContacto") FROM '$$PATH$$/2213.dat';

--
-- Data for Name: Premio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Premio" ("IdPremio", "NombrePremio", "Descripcion", "Tipo", "PuntosPremio", "Estado") FROM stdin;
\.
COPY public."Premio" ("IdPremio", "NombrePremio", "Descripcion", "Tipo", "PuntosPremio", "Estado") FROM '$$PATH$$/2215.dat';

--
-- Data for Name: PremioTarjeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PremioTarjeta" ("IdPremio", "IdTarjeta", "FechaEntrega", "IdUsuario") FROM stdin;
\.
COPY public."PremioTarjeta" ("IdPremio", "IdTarjeta", "FechaEntrega", "IdUsuario") FROM '$$PATH$$/2214.dat';

--
-- Data for Name: Tarjeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tarjeta" ("IdTarjeta", "NumeroTarjeta", "FechaExpedicion", "FechaActivacion", "EstadoTarjeta", "PuntosTarjeta", "IdUsuario") FROM stdin;
\.
COPY public."Tarjeta" ("IdTarjeta", "NumeroTarjeta", "FechaExpedicion", "FechaActivacion", "EstadoTarjeta", "PuntosTarjeta", "IdUsuario") FROM '$$PATH$$/2207.dat';

--
-- Data for Name: TarjetaEvento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TarjetaEvento" ("IdTarjetaEvento", "IdEvento", "HoraTarjetaEvento") FROM stdin;
\.
COPY public."TarjetaEvento" ("IdTarjetaEvento", "IdEvento", "HoraTarjetaEvento") FROM '$$PATH$$/2210.dat';

--
-- Data for Name: TipoTransaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoTransaccion" ("IdTipoTransaccion", "NombreTransaccion", "DescripcionTransaccion", "EfectoTransaccion", "EstadoTransaccion") FROM stdin;
\.
COPY public."TipoTransaccion" ("IdTipoTransaccion", "NombreTransaccion", "DescripcionTransaccion", "EfectoTransaccion", "EstadoTransaccion") FROM '$$PATH$$/2209.dat';

--
-- Data for Name: TransaccionTarjeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransaccionTarjeta" ("IdTransaccion", "IdTarjeta", "IdEvento", "IdTipoTransaccion", "ValorTransaccion", "SaldoTransaccion") FROM stdin;
\.
COPY public."TransaccionTarjeta" ("IdTransaccion", "IdTarjeta", "IdEvento", "IdTipoTransaccion", "ValorTransaccion", "SaldoTransaccion") FROM '$$PATH$$/2208.dat';

--
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" ("ContrasenaUsuario", "CorreoUsuario", "EstadoUsuario", "IdGrupo", "IdUsuario", "NombrePersona", "NombreUsuario") FROM stdin;
\.
COPY public."Usuario" ("ContrasenaUsuario", "CorreoUsuario", "EstadoUsuario", "IdGrupo", "IdUsuario", "NombrePersona", "NombreUsuario") FROM '$$PATH$$/2205.dat';

--
-- Name: Evento Evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Evento"
    ADD CONSTRAINT "Evento_pkey" PRIMARY KEY ("IdEvento");


--
-- Name: GrupoUsuario GrupoUsuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GrupoUsuario"
    ADD CONSTRAINT "GrupoUsuario_pkey" PRIMARY KEY ("IdGrupo");


--
-- Name: Imagen Imagen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Imagen"
    ADD CONSTRAINT "Imagen_pkey" PRIMARY KEY ("IdImagen");


--
-- Name: Organizador Organizador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizador"
    ADD CONSTRAINT "Organizador_pkey" PRIMARY KEY ("IdOrganizador");


--
-- Name: PremioTarjeta PremioTarjeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PremioTarjeta"
    ADD CONSTRAINT "PremioTarjeta_pkey" PRIMARY KEY ("IdPremio");


--
-- Name: Premio Premio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Premio"
    ADD CONSTRAINT "Premio_pkey" PRIMARY KEY ("IdPremio");


--
-- Name: TarjetaEvento TarjetaEvento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TarjetaEvento"
    ADD CONSTRAINT "TarjetaEvento_pkey" PRIMARY KEY ("IdTarjetaEvento");


--
-- Name: Tarjeta Tarjeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("IdTarjeta");


--
-- Name: TipoTransaccion TipoTransaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoTransaccion"
    ADD CONSTRAINT "TipoTransaccion_pkey" PRIMARY KEY ("IdTipoTransaccion");


--
-- Name: TransaccionTarjeta TransaccionTarjeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransaccionTarjeta"
    ADD CONSTRAINT "TransaccionTarjeta_pkey" PRIMARY KEY ("IdTransaccion");


--
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("IdUsuario");


--
-- PostgreSQL database dump complete
--

