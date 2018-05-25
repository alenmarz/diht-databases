--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO alen_marz;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    category_id bigint,
    name character varying NOT NULL,
    description text,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO alen_marz;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: alen_marz
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO alen_marz;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alen_marz
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    name character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying,
    shipping_address text,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.customers OWNER TO alen_marz;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: alen_marz
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO alen_marz;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alen_marz
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: option_values; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.option_values (
    id bigint NOT NULL,
    option_id bigint NOT NULL,
    name character varying NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.option_values OWNER TO alen_marz;

--
-- Name: option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: alen_marz
--

CREATE SEQUENCE public.option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.option_values_id_seq OWNER TO alen_marz;

--
-- Name: option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alen_marz
--

ALTER SEQUENCE public.option_values_id_seq OWNED BY public.option_values.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.options (
    id bigint NOT NULL,
    name character varying NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.options OWNER TO alen_marz;

--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: alen_marz
--

CREATE SEQUENCE public.options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_id_seq OWNER TO alen_marz;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alen_marz
--

ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;


--
-- Name: order_lines; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.order_lines (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    variant_id bigint NOT NULL,
    price numeric NOT NULL,
    amount integer DEFAULT 1 NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.order_lines OWNER TO alen_marz;

--
-- Name: order_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: alen_marz
--

CREATE SEQUENCE public.order_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_lines_id_seq OWNER TO alen_marz;

--
-- Name: order_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alen_marz
--

ALTER SEQUENCE public.order_lines_id_seq OWNED BY public.order_lines.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    customer_id bigint NOT NULL,
    paid boolean DEFAULT false NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO alen_marz;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: alen_marz
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO alen_marz;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alen_marz
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_options; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.product_options (
    id bigint NOT NULL,
    option_id bigint NOT NULL,
    product_id bigint NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.product_options OWNER TO alen_marz;

--
-- Name: product_options_id_seq; Type: SEQUENCE; Schema: public; Owner: alen_marz
--

CREATE SEQUENCE public.product_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_options_id_seq OWNER TO alen_marz;

--
-- Name: product_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alen_marz
--

ALTER SEQUENCE public.product_options_id_seq OWNED BY public.product_options.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    category_id bigint,
    name character varying NOT NULL,
    description text,
    hidden boolean DEFAULT false NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO alen_marz;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: alen_marz
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO alen_marz;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alen_marz
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO alen_marz;

--
-- Name: variant_option_values; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.variant_option_values (
    id bigint NOT NULL,
    variant_id bigint NOT NULL,
    option_value_id bigint NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.variant_option_values OWNER TO alen_marz;

--
-- Name: variant_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: alen_marz
--

CREATE SEQUENCE public.variant_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variant_option_values_id_seq OWNER TO alen_marz;

--
-- Name: variant_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alen_marz
--

ALTER SEQUENCE public.variant_option_values_id_seq OWNED BY public.variant_option_values.id;


--
-- Name: variants; Type: TABLE; Schema: public; Owner: alen_marz
--

CREATE TABLE public.variants (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    sku character varying NOT NULL,
    barcode character varying,
    price numeric NOT NULL,
    amount numeric NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.variants OWNER TO alen_marz;

--
-- Name: variants_id_seq; Type: SEQUENCE; Schema: public; Owner: alen_marz
--

CREATE SEQUENCE public.variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variants_id_seq OWNER TO alen_marz;

--
-- Name: variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alen_marz
--

ALTER SEQUENCE public.variants_id_seq OWNED BY public.variants.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: option_values id; Type: DEFAULT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.option_values ALTER COLUMN id SET DEFAULT nextval('public.option_values_id_seq'::regclass);


--
-- Name: options id; Type: DEFAULT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);


--
-- Name: order_lines id; Type: DEFAULT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.order_lines ALTER COLUMN id SET DEFAULT nextval('public.order_lines_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_options id; Type: DEFAULT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.product_options ALTER COLUMN id SET DEFAULT nextval('public.product_options_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: variant_option_values id; Type: DEFAULT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.variant_option_values ALTER COLUMN id SET DEFAULT nextval('public.variant_option_values_id_seq'::regclass);


--
-- Name: variants id; Type: DEFAULT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.variants ALTER COLUMN id SET DEFAULT nextval('public.variants_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2018-05-25 09:29:20.051391	2018-05-25 09:29:20.051391
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.categories (id, category_id, name, description, deleted_at, created_at, updated_at) FROM stdin;
1	\N	Dogs	\N	\N	2018-05-25 09:29:20.85742	2018-05-25 09:29:20.85742
2	1	American Terrier	\N	\N	2018-05-25 09:29:20.859689	2018-05-25 09:29:20.859689
3	1	Great Dane	\N	\N	2018-05-25 09:29:20.860706	2018-05-25 09:29:20.860706
4	1	Irish Terrier	\N	\N	2018-05-25 09:29:20.861807	2018-05-25 09:29:20.861807
5	1	Airedale	\N	\N	2018-05-25 09:29:20.862717	2018-05-25 09:29:20.862717
6	1	Appenzeller	\N	\N	2018-05-25 09:29:20.864008	2018-05-25 09:29:20.864008
7	1	Flatcoated Retriever	\N	\N	2018-05-25 09:29:20.864964	2018-05-25 09:29:20.864964
8	1	Border Terrier	\N	\N	2018-05-25 09:29:20.869462	2018-05-25 09:29:20.869462
9	1	Giant Schnauzer	\N	\N	2018-05-25 09:29:20.870502	2018-05-25 09:29:20.870502
10	1	Leonberg	\N	\N	2018-05-25 09:29:20.871525	2018-05-25 09:29:20.871525
11	1	Chihuahua	\N	\N	2018-05-25 09:29:20.872688	2018-05-25 09:29:20.872688
12	1	Vizsla	\N	\N	2018-05-25 09:29:20.873701	2018-05-25 09:29:20.873701
13	1	Fox Terrier	\N	\N	2018-05-25 09:29:20.874574	2018-05-25 09:29:20.874574
14	1	Brittany Spaniel	\N	\N	2018-05-25 09:29:20.875736	2018-05-25 09:29:20.875736
15	1	Basset Hound	\N	\N	2018-05-25 09:29:20.876695	2018-05-25 09:29:20.876695
16	1	Borzoi	\N	\N	2018-05-25 09:29:20.877799	2018-05-25 09:29:20.877799
17	1	Irish Wolfhound	\N	\N	2018-05-25 09:29:20.879132	2018-05-25 09:29:20.879132
18	1	Akita	\N	\N	2018-05-25 09:29:20.880108	2018-05-25 09:29:20.880108
19	1	Affenpinscher	\N	\N	2018-05-25 09:29:20.881053	2018-05-25 09:29:20.881053
20	1	Bernese Mountain	\N	\N	2018-05-25 09:29:20.881967	2018-05-25 09:29:20.881967
21	1	Welsh Spaniel	\N	\N	2018-05-25 09:29:20.882886	2018-05-25 09:29:20.882886
22	\N	Cats	\N	\N	2018-05-25 09:29:20.883785	2018-05-25 09:29:20.883785
23	22	American Bobtail	\N	\N	2018-05-25 09:29:20.884848	2018-05-25 09:29:20.884848
24	22	LaPerm	\N	\N	2018-05-25 09:29:20.885799	2018-05-25 09:29:20.885799
25	22	Egyptian Mau	\N	\N	2018-05-25 09:29:20.886785	2018-05-25 09:29:20.886785
26	22	Oregon Rex	\N	\N	2018-05-25 09:29:20.887793	2018-05-25 09:29:20.887793
27	22	Persian (Modern Persian Cat)	\N	\N	2018-05-25 09:29:20.888787	2018-05-25 09:29:20.888787
28	22	Siberian	\N	\N	2018-05-25 09:29:20.889868	2018-05-25 09:29:20.889868
29	22	American Wirehair	\N	\N	2018-05-25 09:29:20.8909	2018-05-25 09:29:20.8909
30	22	Japanese Bobtail	\N	\N	2018-05-25 09:29:20.891873	2018-05-25 09:29:20.891873
31	22	Asian Semi-longhair	\N	\N	2018-05-25 09:29:20.892808	2018-05-25 09:29:20.892808
32	22	Pixie-bob	\N	\N	2018-05-25 09:29:20.893692	2018-05-25 09:29:20.893692
33	22	Foldex Cat	\N	\N	2018-05-25 09:29:20.894553	2018-05-25 09:29:20.894553
34	22	California Spangled	\N	\N	2018-05-25 09:29:20.895488	2018-05-25 09:29:20.895488
35	22	Toyger	\N	\N	2018-05-25 09:29:20.896722	2018-05-25 09:29:20.896722
36	22	Peterbald	\N	\N	2018-05-25 09:29:20.897622	2018-05-25 09:29:20.897622
37	22	German Rex	\N	\N	2018-05-25 09:29:20.898666	2018-05-25 09:29:20.898666
38	22	Dragon Li	\N	\N	2018-05-25 09:29:20.899713	2018-05-25 09:29:20.899713
39	22	Russian White, Black and Tabby	\N	\N	2018-05-25 09:29:20.900707	2018-05-25 09:29:20.900707
40	22	British Shorthair	\N	\N	2018-05-25 09:29:20.901663	2018-05-25 09:29:20.901663
41	22	Abyssinian	\N	\N	2018-05-25 09:29:20.902661	2018-05-25 09:29:20.902661
42	22	Birman	\N	\N	2018-05-25 09:29:20.903641	2018-05-25 09:29:20.903641
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.customers (id, name, phone, email, shipping_address, deleted_at, created_at, updated_at) FROM stdin;
1	Esta Bins	(971) 009-1545	bins_esta@rogahn.net	Langworthport\n10888 Mertie Pass\nApt. 998	\N	2018-05-25 09:29:31.937254	2018-05-25 09:29:31.937254
2	Mr. Lea Bruen	142.224.0860	mr_bruen_lea@schamberger.biz	Lake Feltonburgh\n52237 Verda Canyon\nSuite 504	\N	2018-05-25 09:29:31.942738	2018-05-25 09:29:31.942738
3	Lee Leannon	(534) 753-4160	leannon.lee@goldnerhartmann.com	Cummeratahaven\n216 Abigale Harbor\nSuite 512	\N	2018-05-25 09:29:31.987198	2018-05-25 09:29:31.987198
4	Robin Romaguera	(361) 822-6482	romaguera_robin@larson.net	Legrosstad\n6872 Stanton Point\nSuite 309	\N	2018-05-25 09:29:32.019475	2018-05-25 09:29:32.019475
5	Willard Goyette	1-446-845-3644	willard.goyette@huel.biz	North Jameson\n790 Lionel Prairie\nSuite 641	\N	2018-05-25 09:29:32.038806	2018-05-25 09:29:32.038806
6	Ada Larson	1-655-894-9269	larson.ada@kirlin.name	Lake Effie\n79487 Kenneth Walks\nSuite 840	\N	2018-05-25 09:29:32.041752	2018-05-25 09:29:32.041752
7	Gavin Veum	953-111-0394	veum.gavin@murphy.biz	North Alexandrineview\n2002 Juvenal Way\nApt. 975	\N	2018-05-25 09:29:32.06803	2018-05-25 09:29:32.06803
8	Freddie McClure	431.889.3596	freddie.mcclure@altenwerth.name	Franeckistad\n33217 Wuckert Well\nApt. 900	\N	2018-05-25 09:29:32.081955	2018-05-25 09:29:32.081955
9	Mrs. Eladio Hirthe	377-283-3473	eladio.mrs.hirthe@schuppe.org	Lefflerport\n82672 Clovis Route\nApt. 706	\N	2018-05-25 09:29:32.125686	2018-05-25 09:29:32.125686
10	Berniece Rempel	1-388-458-7758	rempel.berniece@conroyskiles.net	Port Fideltown\n244 Rory Shoal\nApt. 670	\N	2018-05-25 09:29:32.14055	2018-05-25 09:29:32.14055
11	Mayra Corwin	1-224-636-8260	mayra_corwin@marvin.info	New Lenoraborough\n509 Helga Junctions\nApt. 732	\N	2018-05-25 09:29:32.165575	2018-05-25 09:29:32.165575
12	Geraldine Lesch	1-693-702-2089	lesch.geraldine@lednersimonis.io	Nolanville\n42727 Cruickshank Rest\nApt. 937	\N	2018-05-25 09:29:32.191908	2018-05-25 09:29:32.191908
13	Dixie Leffler	389-119-1531	leffler.dixie@roob.name	Stanleychester\n8518 Benton Isle\nApt. 763	\N	2018-05-25 09:29:32.207182	2018-05-25 09:29:32.207182
14	Cristopher Schaden	790.130.1683	schaden_cristopher@will.biz	North Pablo\n625 Keyon Forges\nApt. 676	\N	2018-05-25 09:29:32.232323	2018-05-25 09:29:32.232323
15	Alan Kuvalis	(306) 312-8419	alan.kuvalis@jerdemoriette.com	Schmitthaven\n65456 Johathan Club\nApt. 294	\N	2018-05-25 09:29:32.263191	2018-05-25 09:29:32.263191
16	Loyce Kertzmann	317.388.6055	loyce.kertzmann@pacochajacobs.org	South Dell\n270 Verla Vista\nApt. 483	\N	2018-05-25 09:29:32.265949	2018-05-25 09:29:32.265949
17	Jennings Douglas	(243) 389-9475	douglas.jennings@mcdermott.co	Clairefurt\n275 Natalia Road\nSuite 155	\N	2018-05-25 09:29:32.282334	2018-05-25 09:29:32.282334
18	Vallie Quigley	(492) 056-9160	quigley.vallie@wintheiser.org	East Terrence\n1299 Valentina Inlet\nApt. 698	\N	2018-05-25 09:29:32.320851	2018-05-25 09:29:32.320851
19	Jedediah McKenzie Jr.	986.656.0185	mckenzie.jedediah.jr@watersromaguera.name	Arnofort\n637 Madalyn Spur\nSuite 980	\N	2018-05-25 09:29:32.341554	2018-05-25 09:29:32.341554
20	Cheyenne Gaylord	1-160-176-1454	cheyenne_gaylord@beatty.com	South Arturoview\n2590 Grayson Stream\nApt. 961	\N	2018-05-25 09:29:32.36826	2018-05-25 09:29:32.36826
21	Miss Domenico Schumm	1-532-230-4727	schumm.domenico.miss@mcglynn.name	Sashafort\n14102 Kassulke Radial\nSuite 542	\N	2018-05-25 09:29:32.393283	2018-05-25 09:29:32.393283
22	Mr. Keenan Buckridge	842-756-4540	keenan_buckridge_mr@bednargrant.co	Tremaineport\n69376 Perry Mews\nSuite 452	\N	2018-05-25 09:29:32.417709	2018-05-25 09:29:32.417709
23	Dr. Fay Dooley	(603) 506-2826	dooley_dr_fay@keler.co	D'Amorechester\n3412 Albert Villages\nSuite 140	\N	2018-05-25 09:29:32.43155	2018-05-25 09:29:32.43155
24	Dr. Ernestina Stanton	626-347-5466	ernestina_stanton_dr@auerbernhard.io	Naderchester\n8345 Mertz Corner\nSuite 891	\N	2018-05-25 09:29:32.45903	2018-05-25 09:29:32.45903
25	Destiny Kovacek	229-207-3638	kovacek.destiny@skilesmedhurst.org	Lake Gerson\n8708 Timmothy Drives\nSuite 926	\N	2018-05-25 09:29:32.490273	2018-05-25 09:29:32.490273
26	Lolita Gutmann	1-369-179-3172	gutmann.lolita@kerluketillman.net	Juliafort\n8190 Claudia Flat\nApt. 810	\N	2018-05-25 09:29:32.504029	2018-05-25 09:29:32.504029
27	Morris Anderson I	191.742.9242	anderson.i.morris@jenkins.org	Faheyland\n659 Fahey Crossing\nApt. 482	\N	2018-05-25 09:29:32.520331	2018-05-25 09:29:32.520331
28	Isobel Gottlieb	(770) 258-8679	gottlieb.isobel@ondrickatromp.biz	Lake May\n35774 Satterfield Via\nApt. 961	\N	2018-05-25 09:29:32.545705	2018-05-25 09:29:32.545705
29	Lucienne Turner	517.402.9203	lucienne_turner@volkman.net	Rethabury\n216 Xander Shoal\nApt. 851	\N	2018-05-25 09:29:32.584542	2018-05-25 09:29:32.584542
30	Reid Schoen	409-526-5024	schoen.reid@little.biz	Daxside\n5807 Koelpin Extension\nApt. 612	\N	2018-05-25 09:29:32.609885	2018-05-25 09:29:32.609885
31	Dr. Kaylie Collier	(752) 410-7236	collier_dr_kaylie@feil.co	North Euniceberg\n6834 Rodriguez Lakes\nApt. 695	\N	2018-05-25 09:29:32.637944	2018-05-25 09:29:32.637944
32	Mrs. Kacey Bergnaum	448.624.7324	bergnaum.mrs.kacey@murray.com	Mosefurt\n77438 Chaz Fields\nSuite 728	\N	2018-05-25 09:29:32.640681	2018-05-25 09:29:32.640681
33	Amos Thiel	455-404-7266	amos.thiel@nitzsche.org	West Ryan\n20980 Breitenberg Burg\nApt. 722	\N	2018-05-25 09:29:32.67228	2018-05-25 09:29:32.67228
34	Rodrigo Hettinger DDS	(675) 048-4542	hettinger.dds.rodrigo@collins.net	Schinnerhaven\n71441 Mose Groves\nApt. 836	\N	2018-05-25 09:29:32.692483	2018-05-25 09:29:32.692483
35	Mrs. Freeda Leuschke	1-462-417-3616	leuschke_mrs_freeda@kris.biz	Albachester\n6124 Gladyce Place\nSuite 177	\N	2018-05-25 09:29:32.713767	2018-05-25 09:29:32.713767
36	Elisa Veum	682-031-7054	elisa_veum@gusikowski.name	Lake Tyrese\n7207 Oleta Loaf\nApt. 697	\N	2018-05-25 09:29:32.739153	2018-05-25 09:29:32.739153
37	Declan Bosco	308-179-7606	declan_bosco@leannon.io	East Gustbury\n69330 McClure Turnpike\nApt. 888	\N	2018-05-25 09:29:32.776688	2018-05-25 09:29:32.776688
38	Ken Okuneva	186-558-9591	okuneva_ken@stehrquigley.net	West Gene\n81633 Murphy Dam\nSuite 650	\N	2018-05-25 09:29:32.813076	2018-05-25 09:29:32.813076
39	Zora Ortiz	228.967.6891	zora.ortiz@blick.io	East Carroll\n22063 Arturo Shore\nSuite 362	\N	2018-05-25 09:29:32.832647	2018-05-25 09:29:32.832647
40	Joseph Schowalter PhD	1-868-896-9907	joseph_schowalter_phd@boyer.co	Eleanoreside\n7387 Rohan Fork\nSuite 468	\N	2018-05-25 09:29:32.853445	2018-05-25 09:29:32.853445
41	Shemar Streich PhD	1-711-693-8008	phd_streich_shemar@padberg.info	Ornview\n19330 Koss Parks\nSuite 311	\N	2018-05-25 09:29:32.902663	2018-05-25 09:29:32.902663
42	Ted Hodkiewicz	(779) 628-0368	ted.hodkiewicz@dietrich.name	East Kathleenstad\n532 Pamela Burgs\nApt. 269	\N	2018-05-25 09:29:32.917262	2018-05-25 09:29:32.917262
43	Dana Jacobi	711.884.4835	jacobi.dana@mayer.name	Harbershire\n627 Alisa Canyon\nApt. 959	\N	2018-05-25 09:29:32.932637	2018-05-25 09:29:32.932637
44	Dr. Maegan Howe	416-093-7456	maegan_howe_dr@konopelski.org	Brooksport\n77923 Johnny Lake\nApt. 779	\N	2018-05-25 09:29:32.958604	2018-05-25 09:29:32.958604
45	Magnus Schmitt	(957) 480-7914	magnus_schmitt@bayerkeeling.co	Collinsbury\n5191 Rex Creek\nApt. 454	\N	2018-05-25 09:29:32.979324	2018-05-25 09:29:32.979324
46	Dr. Enola Renner	1-664-790-7367	renner_dr_enola@daretowne.io	West Toney\n24251 Jacobson Ranch\nApt. 675	\N	2018-05-25 09:29:32.996513	2018-05-25 09:29:32.996513
47	Mr. Lonie Schmeler	1-133-057-8658	lonie_mr_schmeler@metz.net	Vellastad\n96075 Rippin Land\nApt. 166	\N	2018-05-25 09:29:33.000485	2018-05-25 09:29:33.000485
48	Bartholome MacGyver	675-907-8750	macgyver_bartholome@kub.name	New Mathew\n364 Effertz Shoal\nSuite 836	\N	2018-05-25 09:29:33.007616	2018-05-25 09:29:33.007616
49	Brandi Sawayn	(677) 648-3019	sawayn_brandi@dooleyharber.org	South Ferneland\n7573 Jacobson Valleys\nSuite 551	\N	2018-05-25 09:29:33.031766	2018-05-25 09:29:33.031766
50	Dr. Alva Heaney	895-145-5184	alva_dr_heaney@erdman.org	West Agnesport\n21944 Trever Extension\nSuite 325	\N	2018-05-25 09:29:33.072912	2018-05-25 09:29:33.072912
51	Anabel Jakubowski	515.229.8170	anabel_jakubowski@wizaabbott.com	Port Jaylinfurt\n46281 Bergstrom Inlet\nSuite 224	\N	2018-05-25 09:29:33.075439	2018-05-25 09:29:33.075439
52	Maxie Pollich	215-089-6321	maxie.pollich@schaefer.com	New Ayana\n9761 Jaden Inlet\nSuite 867	\N	2018-05-25 09:29:33.110402	2018-05-25 09:29:33.110402
53	Braulio Miller	(205) 136-6446	miller.braulio@deckow.name	West Kyleigh\n21342 Bogan Lock\nSuite 871	\N	2018-05-25 09:29:33.127208	2018-05-25 09:29:33.127208
54	Aurelia Hyatt	1-204-831-7768	aurelia.hyatt@gutmann.com	Port Jaime\n972 Larson Lakes\nSuite 659	\N	2018-05-25 09:29:33.139224	2018-05-25 09:29:33.139224
55	Romaine Stoltenberg	(833) 499-2093	stoltenberg_romaine@krajcik.com	Olgafurt\n940 Sophia Branch\nSuite 477	\N	2018-05-25 09:29:33.141026	2018-05-25 09:29:33.141026
56	Edmond Mueller	(312) 111-0788	mueller.edmond@ritchie.com	Sandraton\n52931 Fletcher Meadows\nApt. 430	\N	2018-05-25 09:29:33.167686	2018-05-25 09:29:33.167686
57	Andreanne Greenfelder	875-379-8491	greenfelder_andreanne@jacobson.org	Laurianechester\n1663 Monahan Plain\nApt. 655	\N	2018-05-25 09:29:33.177197	2018-05-25 09:29:33.177197
58	Francisco Leannon	234-157-5976	leannon.francisco@shields.io	North Haileyfort\n27204 Dwight Dale\nApt. 739	\N	2018-05-25 09:29:33.199803	2018-05-25 09:29:33.199803
59	Darrick Mosciski Sr.	860-034-7932	sr.darrick.mosciski@stamm.org	Port Henry\n379 Willy Lodge\nApt. 886	\N	2018-05-25 09:29:33.234205	2018-05-25 09:29:33.234205
60	Emerald Waelchi	801.737.4314	waelchi_emerald@moriette.com	East Krystaltown\n9322 Berge Roads\nApt. 169	\N	2018-05-25 09:29:33.270958	2018-05-25 09:29:33.270958
61	Willow Leffler	880.400.5062	willow_leffler@towne.name	Lake Freddy\n3274 Hilpert Overpass\nApt. 222	\N	2018-05-25 09:29:33.293003	2018-05-25 09:29:33.293003
62	Mr. Rosa Dare	236.631.8598	rosa_mr_dare@connellybins.io	Baumbachport\n9687 Yost Plain\nApt. 574	\N	2018-05-25 09:29:33.330608	2018-05-25 09:29:33.330608
63	Ms. Minnie Baumbach	734-720-4125	baumbach_minnie_ms@leannon.name	New Geneburgh\n306 Heller Flats\nApt. 433	\N	2018-05-25 09:29:33.352284	2018-05-25 09:29:33.352284
64	Cassie Abernathy	821.836.6357	cassie.abernathy@pagac.name	Port Camryn\n5071 Parker Isle\nSuite 423	\N	2018-05-25 09:29:33.379942	2018-05-25 09:29:33.379942
65	Dena Windler	512.833.8995	windler_dena@handrunolfsdottir.co	South Francisfurt\n663 Jaren Canyon\nSuite 866	\N	2018-05-25 09:29:33.389013	2018-05-25 09:29:33.389013
66	Valerie Daniel	586-289-7735	valerie_daniel@rath.biz	West Cielohaven\n4700 August Meadows\nApt. 115	\N	2018-05-25 09:29:33.410501	2018-05-25 09:29:33.410501
67	Sigmund Halvorson	999-932-3983	sigmund_halvorson@krisweinat.com	Hermistonton\n213 Runolfsson Forest\nSuite 201	\N	2018-05-25 09:29:33.429605	2018-05-25 09:29:33.429605
68	Flo Hettinger	1-261-928-7304	flo_hettinger@dickinsonmccullough.biz	Mosciskimouth\n1024 Kiehn Cape\nSuite 196	\N	2018-05-25 09:29:33.463403	2018-05-25 09:29:33.463403
69	Rossie Deckow	907-436-2395	rossie.deckow@crist.info	Sebastianhaven\n75875 Rau Shore\nApt. 177	\N	2018-05-25 09:29:33.467471	2018-05-25 09:29:33.467471
70	Emerson Hagenes MD	(470) 147-1355	md_hagenes_emerson@hackett.biz	Lake Zackery\n96886 Carmelo Circles\nApt. 925	\N	2018-05-25 09:29:33.469719	2018-05-25 09:29:33.469719
71	Dr. Deja Ortiz	884-417-4007	dr_deja_ortiz@schuster.info	West Hortense\n197 Garland Curve\nApt. 211	\N	2018-05-25 09:29:33.480853	2018-05-25 09:29:33.480853
72	Miss Larissa Langworth	493-822-3875	langworth_larissa_miss@predovic.io	Georgettemouth\n4631 Howell Mountain\nApt. 721	\N	2018-05-25 09:29:33.491705	2018-05-25 09:29:33.491705
73	Monserrate Collins	(503) 176-4098	collins_monserrate@bradtke.info	Lake Rae\n15329 Langworth Expressway\nSuite 301	\N	2018-05-25 09:29:33.500058	2018-05-25 09:29:33.500058
74	Berneice Boehm	169.195.9414	berneice.boehm@corwin.name	South Cameronstad\n2867 Luis Mountains\nApt. 124	\N	2018-05-25 09:29:33.538848	2018-05-25 09:29:33.538848
75	Christina Runolfsdottir V	287.593.8866	v.runolfsdottir.christina@johnston.info	East Itzelmouth\n650 Baumbach Gardens\nApt. 926	\N	2018-05-25 09:29:33.550171	2018-05-25 09:29:33.550171
76	Thea Bednar	(458) 956-8888	thea.bednar@gulgowskireichel.net	Annetteville\n42950 Sylvia Walks\nApt. 762	\N	2018-05-25 09:29:33.586792	2018-05-25 09:29:33.586792
77	Mr. Morton Willms	978-595-2065	morton.willms.mr@hodkiewiczhudson.co	West Jaydonmouth\n3686 Olson Ford\nApt. 559	\N	2018-05-25 09:29:33.616701	2018-05-25 09:29:33.616701
78	Julie Beatty III	812-651-0509	beatty.iii.julie@wehner.co	East Brielleberg\n2225 Bartoletti Drive\nSuite 528	\N	2018-05-25 09:29:33.639719	2018-05-25 09:29:33.639719
79	Richmond Runte	1-412-148-1700	richmond_runte@jaskolski.org	New Makayla\n76557 Bradtke Parkways\nApt. 250	\N	2018-05-25 09:29:33.664188	2018-05-25 09:29:33.664188
80	Lucile Treutel	(553) 034-7663	lucile_treutel@ryan.name	North Ansley\n6150 Pollich Road\nSuite 781	\N	2018-05-25 09:29:33.694162	2018-05-25 09:29:33.694162
81	Dr. Alvis Padberg	337.095.8195	padberg_alvis_dr@skiles.info	New Susanamouth\n109 D'Amore Extensions\nSuite 540	\N	2018-05-25 09:29:33.731664	2018-05-25 09:29:33.731664
82	Karley Bashirian	1-813-563-5760	karley.bashirian@schuppe.org	Port Daphney\n9328 Rossie Stravenue\nSuite 845	\N	2018-05-25 09:29:33.73357	2018-05-25 09:29:33.73357
83	Alexandro Moen	534-671-9080	alexandro_moen@heelcasper.net	West Daynestad\n8426 Colin Union\nSuite 674	\N	2018-05-25 09:29:33.764429	2018-05-25 09:29:33.764429
84	Reinhold Lockman	1-445-547-3367	reinhold_lockman@hintz.biz	Port Soledad\n83196 Nannie Track\nSuite 340	\N	2018-05-25 09:29:33.785804	2018-05-25 09:29:33.785804
85	Brannon Rau	(868) 763-9392	rau_brannon@donnellykutch.name	New Vernieville\n13820 Cassin Forks\nSuite 567	\N	2018-05-25 09:29:33.835634	2018-05-25 09:29:33.835634
86	Chaya Nikolaus	253-861-8858	chaya_nikolaus@ritchie.org	Greenholtton\n50130 Jast Route\nApt. 256	\N	2018-05-25 09:29:33.845809	2018-05-25 09:29:33.845809
87	Aliza Volkman	391.279.7965	aliza.volkman@metz.io	Jensenberg\n3711 Triston Mills\nSuite 837	\N	2018-05-25 09:29:33.873839	2018-05-25 09:29:33.873839
88	Barry Lynch	524-834-4161	barry.lynch@roob.co	Danielmouth\n54739 Deonte Junctions\nSuite 810	\N	2018-05-25 09:29:33.895457	2018-05-25 09:29:33.895457
89	Mr. Favian Friesen	1-564-149-3490	mr.friesen.favian@sipes.info	Domenickport\n17160 Waters Square\nApt. 463	\N	2018-05-25 09:29:33.916325	2018-05-25 09:29:33.916325
90	Lafayette Cummings	(856) 145-3878	lafayette.cummings@sanford.net	Veldaburgh\n11743 Vince Forges\nSuite 297	\N	2018-05-25 09:29:33.936893	2018-05-25 09:29:33.936893
91	Emelia Koelpin	(440) 199-7419	emelia.koelpin@bruengreen.com	East Jessikahaven\n9911 Lemke Ridge\nApt. 612	\N	2018-05-25 09:29:33.963224	2018-05-25 09:29:33.963224
92	Etha Schimmel	311.939.9827	etha.schimmel@gerlachroob.io	East Margueritemouth\n172 Ullrich Road\nSuite 517	\N	2018-05-25 09:29:33.983635	2018-05-25 09:29:33.983635
93	Micah Labadie	(494) 541-9076	micah_labadie@donnelly.org	Huelborough\n7760 Wyman Squares\nSuite 138	\N	2018-05-25 09:29:33.985906	2018-05-25 09:29:33.985906
94	Albert Mohr	935.158.2842	albert.mohr@langosh.com	Dalebury\n375 Grady Circle\nSuite 279	\N	2018-05-25 09:29:33.987615	2018-05-25 09:29:33.987615
95	Alfonso Wunsch III	(780) 638-3995	wunsch.iii.alfonso@franecki.net	West Shanelborough\n1872 Webster Road\nApt. 521	\N	2018-05-25 09:29:34.008768	2018-05-25 09:29:34.008768
96	Shayne Deckow	686-612-1196	shayne_deckow@rath.co	North Brycenport\n50872 Hope Lakes\nSuite 769	\N	2018-05-25 09:29:34.033982	2018-05-25 09:29:34.033982
97	Presley Welch	1-254-051-5494	presley_welch@lesch.net	Aylinberg\n65592 Moore Road\nApt. 361	\N	2018-05-25 09:29:34.05016	2018-05-25 09:29:34.05016
98	Keara Hills	1-337-947-5993	keara.hills@gleichnerzulauf.org	Amaritown\n97453 Marvin Mall\nApt. 736	\N	2018-05-25 09:29:34.062449	2018-05-25 09:29:34.062449
99	Cleveland Huels	706-692-5091	huels.cleveland@wisozk.net	Port Genesis\n63521 Okuneva Mill\nSuite 571	\N	2018-05-25 09:29:34.073766	2018-05-25 09:29:34.073766
100	Dale Koelpin	(526) 697-8835	koelpin.dale@schillerfahey.io	Lake Jess\n867 McGlynn Valleys\nSuite 981	\N	2018-05-25 09:29:34.109154	2018-05-25 09:29:34.109154
101	Coby Boyer	1-281-604-7793	coby_boyer@wizagrady.name	Hartmannmouth\n869 Hamill Lodge\nSuite 113	\N	2018-05-25 09:29:34.127393	2018-05-25 09:29:34.127393
102	Ms. Alene Goldner	846-650-2292	goldner.alene.ms@daughertytoy.name	Lake Kameronville\n2443 Ankunding Crossing\nSuite 806	\N	2018-05-25 09:29:34.131473	2018-05-25 09:29:34.131473
103	Ms. Amira Mitchell	1-185-151-7891	ms_amira_mitchell@stehr.co	Port Logan\n7852 Maggio Views\nApt. 504	\N	2018-05-25 09:29:34.155899	2018-05-25 09:29:34.155899
104	Leilani Paucek	205-076-8717	paucek_leilani@gerhold.org	West Maiya\n6778 Barton Ferry\nApt. 844	\N	2018-05-25 09:29:34.192005	2018-05-25 09:29:34.192005
105	Julius Schowalter	816-566-6446	julius_schowalter@sipes.org	North Merrittshire\n8163 Elody Square\nSuite 420	\N	2018-05-25 09:29:34.217768	2018-05-25 09:29:34.217768
106	Amir Krajcik	510.060.6819	krajcik_amir@larkin.net	Stephenport\n7263 Quigley Mission\nApt. 539	\N	2018-05-25 09:29:34.233344	2018-05-25 09:29:34.233344
107	Orion Eichmann	784.760.3326	eichmann_orion@shields.org	East Cyrusmouth\n18698 Kenny Route\nApt. 992	\N	2018-05-25 09:29:34.258131	2018-05-25 09:29:34.258131
108	Samara Rippin	1-477-153-4782	rippin.samara@kovacek.net	Waylonstad\n184 Rowan Mountains\nApt. 803	\N	2018-05-25 09:29:34.286133	2018-05-25 09:29:34.286133
109	Deonte Gerhold	783-960-2168	deonte_gerhold@yost.name	South Ardithport\n51892 Shields Row\nSuite 695	\N	2018-05-25 09:29:34.31965	2018-05-25 09:29:34.31965
110	Miss Lisa Goodwin	611.666.9316	lisa_goodwin_miss@hahnboyer.io	Borerton\n1917 Schulist Islands\nSuite 614	\N	2018-05-25 09:29:34.352063	2018-05-25 09:29:34.352063
111	Mina Haley	891-136-6889	haley_mina@zboncak.com	Dessieshire\n9553 Monahan Bypass\nSuite 635	\N	2018-05-25 09:29:34.397375	2018-05-25 09:29:34.397375
112	Monty Schumm PhD	376.360.4631	phd.schumm.monty@colemedhurst.biz	Blandafort\n5186 Fernando Parkways\nApt. 722	\N	2018-05-25 09:29:34.413273	2018-05-25 09:29:34.413273
113	Wayne Treutel	568.218.9408	treutel.wayne@casperstanton.io	Mitchellburgh\n512 Miles Mountain\nApt. 908	\N	2018-05-25 09:29:34.423507	2018-05-25 09:29:34.423507
114	Odie Schultz	1-661-474-3214	schultz.odie@kaulke.org	Twilafort\n877 Noemy Rue\nSuite 494	\N	2018-05-25 09:29:34.426759	2018-05-25 09:29:34.426759
115	Yasmin Boyer	255-445-1220	yasmin.boyer@willms.biz	North Gustave\n92518 Francesco Crossroad\nApt. 378	\N	2018-05-25 09:29:34.436013	2018-05-25 09:29:34.436013
116	Lou Fisher III	684.545.6859	lou.fisher.iii@cummerata.net	Gradyshire\n196 Nikolas Lakes\nApt. 649	\N	2018-05-25 09:29:34.465281	2018-05-25 09:29:34.465281
117	Jalon Strosin	(729) 991-8335	jalon.strosin@heaney.name	Port Chrisstad\n9935 Nader Crest\nApt. 904	\N	2018-05-25 09:29:34.473316	2018-05-25 09:29:34.473316
118	Mr. Luisa Koepp	(998) 493-2539	luisa_mr_koepp@buckridge.net	New Eldaview\n98350 Jamey Plaza\nSuite 136	\N	2018-05-25 09:29:34.478236	2018-05-25 09:29:34.478236
119	Edna Gutmann V	260.005.3915	edna.v.gutmann@klockorosenbaum.com	Lake Ella\n7055 Padberg Bypass\nSuite 146	\N	2018-05-25 09:29:34.520003	2018-05-25 09:29:34.520003
120	Tommie Stehr	1-829-035-7975	tommie.stehr@bins.com	South Namehaven\n5983 Kertzmann Divide\nApt. 942	\N	2018-05-25 09:29:34.534181	2018-05-25 09:29:34.534181
121	Rita Balistreri	1-272-137-5250	rita_balistreri@kihn.biz	Leonorchester\n7149 Reinger Manor\nApt. 727	\N	2018-05-25 09:29:34.557414	2018-05-25 09:29:34.557414
122	Malika Feil	1-688-676-5473	malika_feil@barrowshayes.io	North Oswaldberg\n261 Gussie Brook\nApt. 546	\N	2018-05-25 09:29:34.578203	2018-05-25 09:29:34.578203
123	Jerel Schultz II	500.793.5987	schultz_jerel_ii@reilly.com	Connbury\n57307 Leanna Lane\nSuite 927	\N	2018-05-25 09:29:34.592466	2018-05-25 09:29:34.592466
124	Lina Pollich	535-465-5448	lina_pollich@toy.name	Madelynntown\n8597 Ceasar Haven\nSuite 859	\N	2018-05-25 09:29:34.626186	2018-05-25 09:29:34.626186
125	Hosea Fay	(605) 300-9173	fay_hosea@schinner.org	Port Velda\n8698 Rosenbaum Street\nSuite 955	\N	2018-05-25 09:29:34.654412	2018-05-25 09:29:34.654412
126	Clementine Altenwerth	(889) 800-1676	clementine.altenwerth@harveykiehn.org	East Moisesmouth\n75374 Joey Landing\nSuite 525	\N	2018-05-25 09:29:34.686844	2018-05-25 09:29:34.686844
127	Annalise Harris	136.623.1562	annalise_harris@aufderharreilly.org	New Jess\n8359 Rebeca Hills\nApt. 866	\N	2018-05-25 09:29:34.710592	2018-05-25 09:29:34.710592
128	Jamil Terry	532-431-1766	terry.jamil@carter.name	Zulaufberg\n4424 Bogan Radial\nSuite 187	\N	2018-05-25 09:29:34.729167	2018-05-25 09:29:34.729167
129	Lon Prosacco	1-925-560-9601	prosacco_lon@stroman.biz	Leannonfurt\n9385 Grimes Forest\nSuite 958	\N	2018-05-25 09:29:34.734193	2018-05-25 09:29:34.734193
130	Harmony Christiansen	(388) 029-9559	harmony.christiansen@leannonjohnson.org	Roobmouth\n72072 Maritza Square\nSuite 817	\N	2018-05-25 09:29:34.743912	2018-05-25 09:29:34.743912
131	Raven Pfeffer	454.729.7482	raven_pfeffer@crona.net	New Estelletown\n20293 Mikel Fall\nSuite 297	\N	2018-05-25 09:29:34.755863	2018-05-25 09:29:34.755863
132	Destinee Kuphal	945.475.7503	kuphal_destinee@wintheiser.net	North Cristianchester\n636 McLaughlin Cape\nApt. 586	\N	2018-05-25 09:29:34.788563	2018-05-25 09:29:34.788563
133	Marielle Schultz	288.948.6505	schultz.marielle@heel.com	New Jarod\n1414 Grady Manors\nApt. 670	\N	2018-05-25 09:29:34.823834	2018-05-25 09:29:34.823834
134	Connie White Sr.	139-552-6592	sr_connie_white@keelingdurgan.io	Kunzemouth\n910 Miller Springs\nSuite 298	\N	2018-05-25 09:29:34.844209	2018-05-25 09:29:34.844209
135	Ms. Jimmie Willms	595.245.5292	ms_jimmie_willms@cole.info	Griffinberg\n29795 Zboncak Rapid\nApt. 726	\N	2018-05-25 09:29:34.882353	2018-05-25 09:29:34.882353
136	Kayla Leffler	786.528.5285	leffler_kayla@reingerlittel.com	New Vita\n24800 Aida Dam\nApt. 833	\N	2018-05-25 09:29:34.929706	2018-05-25 09:29:34.929706
137	Joesph Kilback	(276) 451-9571	kilback.joesph@sawaynschuppe.com	Raoulstad\n1588 Senger Harbors\nSuite 175	\N	2018-05-25 09:29:34.957668	2018-05-25 09:29:34.957668
138	Emery Treutel	496.719.5322	treutel_emery@rosenbaumpacocha.name	Lake Johnnyborough\n19521 Jo Island\nApt. 251	\N	2018-05-25 09:29:34.979879	2018-05-25 09:29:34.979879
139	Fritz Boyer	148.477.0138	fritz.boyer@mantejenkins.biz	East Nicklausfurt\n40070 Angelica Drive\nSuite 738	\N	2018-05-25 09:29:34.982767	2018-05-25 09:29:34.982767
140	Sigmund Howe	571.318.9211	howe_sigmund@douglas.net	Port Yvettefurt\n9921 Modesta Rapid\nApt. 152	\N	2018-05-25 09:29:35.02142	2018-05-25 09:29:35.02142
141	Jacklyn Abernathy Jr.	(770) 361-0068	jacklyn.abernathy.jr@rath.info	South Mortimer\n40056 Vince Alley\nApt. 239	\N	2018-05-25 09:29:35.02494	2018-05-25 09:29:35.02494
142	Aniya Larson	1-865-673-0441	aniya.larson@smithkeeling.org	Waylonview\n291 Green Locks\nSuite 376	\N	2018-05-25 09:29:35.027939	2018-05-25 09:29:35.027939
143	Maeve Bosco	(983) 548-0727	bosco_maeve@ryan.io	Alainaside\n4561 Will Spring\nApt. 943	\N	2018-05-25 09:29:35.037173	2018-05-25 09:29:35.037173
144	Haleigh Gusikowski	1-891-328-5136	haleigh.gusikowski@dare.io	Shanelstad\n55412 Mallie Locks\nApt. 846	\N	2018-05-25 09:29:35.050806	2018-05-25 09:29:35.050806
145	Eleonore Hayes	1-704-418-7385	hayes_eleonore@dibbert.info	Fredrickhaven\n71556 Schiller Stream\nSuite 874	\N	2018-05-25 09:29:35.068076	2018-05-25 09:29:35.068076
146	Troy Torphy	673-671-4870	torphy.troy@beer.name	Ashleeton\n98996 Morissette Lock\nSuite 605	\N	2018-05-25 09:29:35.076593	2018-05-25 09:29:35.076593
147	Cleora Stroman DDS	1-640-331-0871	dds_stroman_cleora@rice.net	Port Alexandrinebury\n5904 Kemmer Island\nSuite 294	\N	2018-05-25 09:29:35.090429	2018-05-25 09:29:35.090429
148	Carole Gorczany	1-795-002-2419	carole.gorczany@jacobson.info	Port Devante\n41240 Stuart Fort\nSuite 948	\N	2018-05-25 09:29:35.099832	2018-05-25 09:29:35.099832
149	Emanuel Gibson I	(883) 803-2963	gibson.i.emanuel@doyle.net	New Rosalia\n407 Creola Crescent\nSuite 168	\N	2018-05-25 09:29:35.120644	2018-05-25 09:29:35.120644
150	Conner Spinka	659-480-5459	spinka.conner@gaylordlangworth.io	Romaton\n51380 Sonny Springs\nApt. 803	\N	2018-05-25 09:29:35.150726	2018-05-25 09:29:35.150726
151	Marilou Hermiston	(795) 399-0579	marilou.hermiston@reichelschultz.name	Port Shawnahaven\n406 Gibson Forge\nSuite 504	\N	2018-05-25 09:29:35.157523	2018-05-25 09:29:35.157523
152	Dallas Kulas	1-861-125-5264	kulas.dallas@gerhold.io	New Filiberto\n5173 Jones Views\nSuite 669	\N	2018-05-25 09:29:35.166579	2018-05-25 09:29:35.166579
153	Glennie Zboncak	1-134-892-1053	glennie.zboncak@hirthe.com	McKenzieville\n651 Schinner Field\nSuite 627	\N	2018-05-25 09:29:35.173019	2018-05-25 09:29:35.173019
154	Trudie Fadel III	566.046.7664	trudie.iii.fadel@ortiz.org	South Gay\n9530 David Road\nSuite 736	\N	2018-05-25 09:29:35.189347	2018-05-25 09:29:35.189347
155	Aniyah Monahan	1-714-929-5058	aniyah.monahan@hirthewaters.net	East Catalinashire\n290 Edd Lock\nApt. 395	\N	2018-05-25 09:29:35.195545	2018-05-25 09:29:35.195545
156	Deion Miller	(743) 477-5851	deion_miller@bartoletti.name	North Russellbury\n7728 Hagenes Motorway\nSuite 855	\N	2018-05-25 09:29:35.201645	2018-05-25 09:29:35.201645
157	Claire Hegmann III	267-761-6568	iii_hegmann_claire@schiller.co	Maurinemouth\n117 Ankunding Ports\nApt. 986	\N	2018-05-25 09:29:35.211427	2018-05-25 09:29:35.211427
158	Rod Erdman	(190) 224-4897	erdman.rod@effertzweimann.com	South Milo\n1665 Meggie Drive\nSuite 550	\N	2018-05-25 09:29:35.213268	2018-05-25 09:29:35.213268
159	Miss Kailee Predovic	131-327-6147	miss_kailee_predovic@leuschkebarrows.com	Lake Constantinmouth\n82618 Jake Squares\nApt. 368	\N	2018-05-25 09:29:35.222917	2018-05-25 09:29:35.222917
160	Keegan Bernier	1-676-790-3092	bernier.keegan@quigley.org	Blickstad\n15108 Gussie Drive\nSuite 100	\N	2018-05-25 09:29:35.241119	2018-05-25 09:29:35.241119
161	Grant Bergnaum	218-428-9889	bergnaum_grant@nikolaus.co	Corwinfurt\n442 Stiedemann Route\nApt. 518	\N	2018-05-25 09:29:35.257089	2018-05-25 09:29:35.257089
162	Frieda Schimmel	(327) 570-0470	schimmel_frieda@keebler.biz	Lake Dedricport\n523 Stan Club\nApt. 377	\N	2018-05-25 09:29:35.268855	2018-05-25 09:29:35.268855
163	Mariah Wolff	357-457-2086	wolff.mariah@buckridge.co	Gertrudeport\n9696 Daugherty Ports\nApt. 855	\N	2018-05-25 09:29:35.285361	2018-05-25 09:29:35.285361
164	Hiram King	804.045.1686	hiram.king@bayer.com	Adellstad\n38340 Feil Fords\nSuite 361	\N	2018-05-25 09:29:35.302512	2018-05-25 09:29:35.302512
165	Trevor Wilkinson	914-273-0049	trevor.wilkinson@macejkovic.info	West Johathanfurt\n17019 Prosacco Garden\nApt. 275	\N	2018-05-25 09:29:35.330639	2018-05-25 09:29:35.330639
166	Rita Schultz IV	148.312.7917	iv.rita.schultz@corwinkeler.name	East Aaronside\n767 McDermott Harbor\nApt. 867	\N	2018-05-25 09:29:35.340268	2018-05-25 09:29:35.340268
167	Clara Mante	(595) 235-0848	clara.mante@ruecker.org	Delilahside\n73991 Alfonso Stream\nApt. 803	\N	2018-05-25 09:29:35.368889	2018-05-25 09:29:35.368889
168	Gerald Medhurst	593.251.8416	gerald.medhurst@ruel.io	Lake Marisol\n12304 Cronin Manors\nSuite 272	\N	2018-05-25 09:29:35.37241	2018-05-25 09:29:35.37241
169	Verlie Price	708-152-9149	verlie_price@ratkerenner.org	West Willardshire\n497 Davin Expressway\nSuite 183	\N	2018-05-25 09:29:35.395932	2018-05-25 09:29:35.395932
170	Cathrine Prosacco	704-590-5007	cathrine_prosacco@sporer.net	Keatonland\n549 Preston Station\nSuite 282	\N	2018-05-25 09:29:35.414658	2018-05-25 09:29:35.414658
171	Laurine Kshlerin	763.276.1772	laurine.kshlerin@streich.net	Amoston\n34634 Krajcik Path\nSuite 662	\N	2018-05-25 09:29:35.452472	2018-05-25 09:29:35.452472
172	Donald Kemmer	891.325.5610	donald.kemmer@eichmann.net	Angelitaland\n294 Mustafa Stream\nSuite 958	\N	2018-05-25 09:29:35.455006	2018-05-25 09:29:35.455006
173	Mr. Raymond Roob	287.935.7142	roob_mr_raymond@balistreri.io	Pansyland\n27594 McKenzie Stream\nApt. 363	\N	2018-05-25 09:29:35.4644	2018-05-25 09:29:35.4644
174	Prince Vandervort	536-575-8552	vandervort.prince@corwinzemlak.name	Aminamouth\n43216 Jordy Valleys\nApt. 948	\N	2018-05-25 09:29:35.487855	2018-05-25 09:29:35.487855
175	Llewellyn Bosco	1-525-732-6949	llewellyn.bosco@streich.info	Weberburgh\n1700 Melany Center\nApt. 769	\N	2018-05-25 09:29:35.502779	2018-05-25 09:29:35.502779
176	Kimberly Wolff	(811) 222-7186	wolff_kimberly@tromp.name	Armstrongville\n967 Johnson Way\nSuite 421	\N	2018-05-25 09:29:35.512533	2018-05-25 09:29:35.512533
177	Mrs. Domenic Littel	683-996-5174	mrs.littel.domenic@haaglowe.name	Lake Weldonview\n143 Demario Inlet\nApt. 153	\N	2018-05-25 09:29:35.522105	2018-05-25 09:29:35.522105
178	Rogelio Kovacek	1-463-816-4078	rogelio.kovacek@rempel.io	North Kathleen\n45920 Dagmar Spurs\nApt. 568	\N	2018-05-25 09:29:35.527497	2018-05-25 09:29:35.527497
179	Mrs. Brock Reynolds	845-536-9341	mrs_reynolds_brock@handfeest.co	Keeblerberg\n493 Shad Meadow\nApt. 834	\N	2018-05-25 09:29:35.53251	2018-05-25 09:29:35.53251
180	Shaun Ferry	(484) 590-9754	shaun.ferry@maggioconn.org	Port Roxane\n8946 Gaylord Corners\nApt. 556	\N	2018-05-25 09:29:35.534014	2018-05-25 09:29:35.534014
181	Jasmin Strosin	1-510-816-7189	jasmin_strosin@ritchie.name	Kayleetown\n2590 Kozey Ridge\nSuite 779	\N	2018-05-25 09:29:35.539845	2018-05-25 09:29:35.539845
182	Mr. Lowell Ullrich	(122) 331-6475	mr.ullrich.lowell@kiehn.com	Santosstad\n9561 Bryon Gardens\nApt. 843	\N	2018-05-25 09:29:35.551317	2018-05-25 09:29:35.551317
183	Boyd Bergstrom	(697) 375-0349	bergstrom.boyd@olson.net	East Kylee\n9344 Noel Points\nSuite 203	\N	2018-05-25 09:29:35.553043	2018-05-25 09:29:35.553043
184	Matilde Hansen	582.114.0155	matilde_hansen@sauer.co	New Elizabethborough\n23215 Schumm Island\nSuite 573	\N	2018-05-25 09:29:35.573566	2018-05-25 09:29:35.573566
185	Marilou Bailey	140.584.8050	bailey_marilou@emardlebsack.org	West Phoebe\n960 Zieme Inlet\nApt. 117	\N	2018-05-25 09:29:35.582936	2018-05-25 09:29:35.582936
186	Mr. Alba Prohaska	304.606.6360	mr.prohaska.alba@bahringerschmitt.com	Aidashire\n8945 Maritza Parkway\nSuite 831	\N	2018-05-25 09:29:35.604405	2018-05-25 09:29:35.604405
187	Adrien Marvin V	925.918.3665	adrien_marvin_v@schmidt.org	Noeville\n272 Clemmie Station\nSuite 876	\N	2018-05-25 09:29:35.610549	2018-05-25 09:29:35.610549
188	Mrs. Celestino Wunsch	(314) 516-6635	mrs.wunsch.celestino@erdman.biz	Ellisland\n62490 Watson Pass\nSuite 160	\N	2018-05-25 09:29:35.612273	2018-05-25 09:29:35.612273
189	Armani Shanahan	(233) 391-8217	shanahan.armani@luettgenzieme.io	Marqueschester\n24712 Koss Avenue\nSuite 341	\N	2018-05-25 09:29:35.614103	2018-05-25 09:29:35.614103
190	Tanya Hodkiewicz	309-622-1151	tanya_hodkiewicz@starkwelch.name	West Julianneport\n917 Faye Islands\nSuite 126	\N	2018-05-25 09:29:35.631226	2018-05-25 09:29:35.631226
191	Destany Walker MD	169-296-7736	walker_destany_md@mckenzie.org	Lake Mariam\n1236 Arvilla Route\nApt. 805	\N	2018-05-25 09:29:35.640383	2018-05-25 09:29:35.640383
192	Shea Armstrong	1-477-664-0173	armstrong.shea@hilllconnelly.io	Pfefferbury\n56294 Wehner Forge\nApt. 458	\N	2018-05-25 09:29:35.642256	2018-05-25 09:29:35.642256
193	Miss Felicia Hackett	524-005-1490	hackett_felicia_miss@parker.info	Theresefort\n13000 Paucek Fork\nSuite 261	\N	2018-05-25 09:29:35.660231	2018-05-25 09:29:35.660231
194	Tara Collins	1-772-256-1030	tara.collins@watsicaernser.co	South Lorenza\n37308 Huel Rapids\nApt. 915	\N	2018-05-25 09:29:35.679888	2018-05-25 09:29:35.679888
195	Russel Rempel	1-411-135-1632	rempel.russel@wisozkbuckridge.name	Mohrburgh\n8355 Deonte Junctions\nApt. 966	\N	2018-05-25 09:29:35.69185	2018-05-25 09:29:35.69185
196	Loma Berge	721-402-6984	loma.berge@champlinjast.io	Gerlachbury\n171 Maybelle Gateway\nSuite 322	\N	2018-05-25 09:29:35.697767	2018-05-25 09:29:35.697767
197	Emely Morissette	497.225.1262	emely.morissette@beatty.org	Larkinton\n742 Lizzie Centers\nApt. 868	\N	2018-05-25 09:29:35.711786	2018-05-25 09:29:35.711786
198	Aditya Metz	902.436.4422	aditya_metz@macgyverking.io	Reganmouth\n48079 Connelly Lock\nSuite 201	\N	2018-05-25 09:29:35.727989	2018-05-25 09:29:35.727989
199	Dr. Jermaine Wunsch	859.162.4024	jermaine_dr_wunsch@dibberthowe.org	Port Karinamouth\n998 Xzavier Prairie\nApt. 115	\N	2018-05-25 09:29:35.73454	2018-05-25 09:29:35.73454
200	Dr. Tyrell Parker	880-423-8022	dr.parker.tyrell@pfannerstilllockman.biz	Luisshire\n518 Strosin Land\nSuite 400	\N	2018-05-25 09:29:35.752163	2018-05-25 09:29:35.752163
\.


--
-- Data for Name: option_values; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.option_values (id, option_id, name, deleted_at, created_at, updated_at) FROM stdin;
1	1	senior	\N	2018-05-25 09:29:20.820257	2018-05-25 09:29:20.820257
2	1	young	\N	2018-05-25 09:29:20.826996	2018-05-25 09:29:20.826996
3	1	puppy	\N	2018-05-25 09:29:20.828396	2018-05-25 09:29:20.828396
4	2	female	\N	2018-05-25 09:29:20.830815	2018-05-25 09:29:20.830815
5	2	male	\N	2018-05-25 09:29:20.832386	2018-05-25 09:29:20.832386
6	3	extra large	\N	2018-05-25 09:29:20.835022	2018-05-25 09:29:20.835022
7	3	large	\N	2018-05-25 09:29:20.836079	2018-05-25 09:29:20.836079
8	3	small	\N	2018-05-25 09:29:20.838038	2018-05-25 09:29:20.838038
9	3	medium	\N	2018-05-25 09:29:20.839825	2018-05-25 09:29:20.839825
10	4	Governing Council of the Cat	\N	2018-05-25 09:29:20.842816	2018-05-25 09:29:20.842816
11	4	American Cat Fanciers Association	\N	2018-05-25 09:29:20.844565	2018-05-25 09:29:20.844565
12	4	Felis Britannica	\N	2018-05-25 09:29:20.845597	2018-05-25 09:29:20.845597
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.options (id, name, deleted_at, created_at, updated_at) FROM stdin;
1	Age	\N	2018-05-25 09:29:20.245967	2018-05-25 09:29:20.245967
2	Gender	\N	2018-05-25 09:29:20.82983	2018-05-25 09:29:20.82983
3	Size	\N	2018-05-25 09:29:20.833297	2018-05-25 09:29:20.833297
4	Registry	\N	2018-05-25 09:29:20.841632	2018-05-25 09:29:20.841632
\.


--
-- Data for Name: order_lines; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.order_lines (id, order_id, variant_id, price, amount, deleted_at, created_at, updated_at) FROM stdin;
1	1	1	31.53	1	\N	2018-05-25 09:29:31.975908	2018-05-25 09:29:31.975908
2	1	2	12.86	1	\N	2018-05-25 09:29:31.980841	2018-05-25 09:29:31.980841
3	2	3	31.12	1	\N	2018-05-25 09:29:31.995065	2018-05-25 09:29:31.995065
4	3	4	50.44	1	\N	2018-05-25 09:29:32.004138	2018-05-25 09:29:32.004138
5	3	5	44.92	1	\N	2018-05-25 09:29:32.007464	2018-05-25 09:29:32.007464
6	3	6	38.07	1	\N	2018-05-25 09:29:32.011315	2018-05-25 09:29:32.011315
7	4	7	0.68	1	\N	2018-05-25 09:29:32.0242	2018-05-25 09:29:32.0242
8	4	8	81.67	1	\N	2018-05-25 09:29:32.030082	2018-05-25 09:29:32.030082
9	5	9	42.49	1	\N	2018-05-25 09:29:32.035266	2018-05-25 09:29:32.035266
10	6	10	52.46	1	\N	2018-05-25 09:29:32.046473	2018-05-25 09:29:32.046473
11	7	11	43.99	1	\N	2018-05-25 09:29:32.058221	2018-05-25 09:29:32.058221
12	7	12	42.23	1	\N	2018-05-25 09:29:32.063603	2018-05-25 09:29:32.063603
13	8	13	32.75	1	\N	2018-05-25 09:29:32.074619	2018-05-25 09:29:32.074619
14	9	14	90.85	1	\N	2018-05-25 09:29:32.084922	2018-05-25 09:29:32.084922
15	10	15	71.0	1	\N	2018-05-25 09:29:32.095266	2018-05-25 09:29:32.095266
16	11	16	53.71	1	\N	2018-05-25 09:29:32.103646	2018-05-25 09:29:32.103646
17	11	17	3.91	1	\N	2018-05-25 09:29:32.109629	2018-05-25 09:29:32.109629
18	11	18	10.0	1	\N	2018-05-25 09:29:32.113886	2018-05-25 09:29:32.113886
19	12	19	73.94	1	\N	2018-05-25 09:29:32.134348	2018-05-25 09:29:32.134348
20	13	20	74.72	1	\N	2018-05-25 09:29:32.146801	2018-05-25 09:29:32.146801
21	14	21	56.59	1	\N	2018-05-25 09:29:32.15399	2018-05-25 09:29:32.15399
22	14	22	41.36	1	\N	2018-05-25 09:29:32.158365	2018-05-25 09:29:32.158365
23	15	23	76.07	1	\N	2018-05-25 09:29:32.170443	2018-05-25 09:29:32.170443
24	16	24	94.37	1	\N	2018-05-25 09:29:32.179058	2018-05-25 09:29:32.179058
25	16	25	29.61	1	\N	2018-05-25 09:29:32.185679	2018-05-25 09:29:32.185679
26	17	26	11.38	1	\N	2018-05-25 09:29:32.196786	2018-05-25 09:29:32.196786
27	17	27	5.27	1	\N	2018-05-25 09:29:32.200266	2018-05-25 09:29:32.200266
28	18	28	4.34	1	\N	2018-05-25 09:29:32.211215	2018-05-25 09:29:32.211215
29	19	29	26.43	1	\N	2018-05-25 09:29:32.216036	2018-05-25 09:29:32.216036
30	19	30	2.44	1	\N	2018-05-25 09:29:32.22383	2018-05-25 09:29:32.22383
31	19	31	23.02	1	\N	2018-05-25 09:29:32.228485	2018-05-25 09:29:32.228485
32	20	32	49.82	1	\N	2018-05-25 09:29:32.238119	2018-05-25 09:29:32.238119
33	20	33	93.19	1	\N	2018-05-25 09:29:32.240983	2018-05-25 09:29:32.240983
34	20	34	42.85	1	\N	2018-05-25 09:29:32.245365	2018-05-25 09:29:32.245365
35	21	35	39.72	1	\N	2018-05-25 09:29:32.252957	2018-05-25 09:29:32.252957
36	21	36	0.64	1	\N	2018-05-25 09:29:32.25775	2018-05-25 09:29:32.25775
37	22	37	89.12	1	\N	2018-05-25 09:29:32.270697	2018-05-25 09:29:32.270697
38	22	38	14.96	1	\N	2018-05-25 09:29:32.275962	2018-05-25 09:29:32.275962
39	22	39	78.48	1	\N	2018-05-25 09:29:32.278514	2018-05-25 09:29:32.278514
40	23	40	62.28	1	\N	2018-05-25 09:29:32.289398	2018-05-25 09:29:32.289398
41	23	41	27.06	1	\N	2018-05-25 09:29:32.29477	2018-05-25 09:29:32.29477
42	24	42	78.73	1	\N	2018-05-25 09:29:32.304354	2018-05-25 09:29:32.304354
43	24	43	39.05	1	\N	2018-05-25 09:29:32.308757	2018-05-25 09:29:32.308757
44	24	44	39.54	1	\N	2018-05-25 09:29:32.313291	2018-05-25 09:29:32.313291
45	25	45	60.57	1	\N	2018-05-25 09:29:32.324475	2018-05-25 09:29:32.324475
46	26	46	21.22	1	\N	2018-05-25 09:29:32.335478	2018-05-25 09:29:32.335478
47	27	47	34.74	1	\N	2018-05-25 09:29:32.344838	2018-05-25 09:29:32.344838
48	28	48	16.69	1	\N	2018-05-25 09:29:32.351432	2018-05-25 09:29:32.351432
49	28	49	67.19	1	\N	2018-05-25 09:29:32.357515	2018-05-25 09:29:32.357515
50	29	50	66.85	1	\N	2018-05-25 09:29:32.36519	2018-05-25 09:29:32.36519
51	30	51	53.09	1	\N	2018-05-25 09:29:32.375434	2018-05-25 09:29:32.375434
52	30	52	14.24	1	\N	2018-05-25 09:29:32.380167	2018-05-25 09:29:32.380167
53	31	53	99.84	1	\N	2018-05-25 09:29:32.384537	2018-05-25 09:29:32.384537
54	31	54	56.67	1	\N	2018-05-25 09:29:32.388827	2018-05-25 09:29:32.388827
55	32	55	13.15	1	\N	2018-05-25 09:29:32.40321	2018-05-25 09:29:32.40321
56	32	56	49.44	1	\N	2018-05-25 09:29:32.40747	2018-05-25 09:29:32.40747
57	32	57	1.56	1	\N	2018-05-25 09:29:32.412362	2018-05-25 09:29:32.412362
58	33	58	85.27	1	\N	2018-05-25 09:29:32.423513	2018-05-25 09:29:32.423513
59	34	59	99.46	1	\N	2018-05-25 09:29:32.436433	2018-05-25 09:29:32.436433
60	34	60	66.67	1	\N	2018-05-25 09:29:32.441287	2018-05-25 09:29:32.441287
61	35	61	98.17	1	\N	2018-05-25 09:29:32.44892	2018-05-25 09:29:32.44892
62	35	62	79.51	1	\N	2018-05-25 09:29:32.452748	2018-05-25 09:29:32.452748
63	36	63	42.29	1	\N	2018-05-25 09:29:32.463916	2018-05-25 09:29:32.463916
64	37	64	27.35	1	\N	2018-05-25 09:29:32.470579	2018-05-25 09:29:32.470579
65	38	65	17.83	1	\N	2018-05-25 09:29:32.4802	2018-05-25 09:29:32.4802
66	38	66	65.0	1	\N	2018-05-25 09:29:32.483176	2018-05-25 09:29:32.483176
67	38	67	17.63	1	\N	2018-05-25 09:29:32.486067	2018-05-25 09:29:32.486067
68	39	68	91.76	1	\N	2018-05-25 09:29:32.4959	2018-05-25 09:29:32.4959
69	39	69	7.69	1	\N	2018-05-25 09:29:32.500041	2018-05-25 09:29:32.500041
70	40	70	99.57	1	\N	2018-05-25 09:29:32.509708	2018-05-25 09:29:32.509708
71	40	71	1.69	1	\N	2018-05-25 09:29:32.515412	2018-05-25 09:29:32.515412
72	41	72	37.72	1	\N	2018-05-25 09:29:32.527103	2018-05-25 09:29:32.527103
73	41	73	42.47	1	\N	2018-05-25 09:29:32.529417	2018-05-25 09:29:32.529417
74	42	74	86.91	1	\N	2018-05-25 09:29:32.53502	2018-05-25 09:29:32.53502
75	42	75	3.86	1	\N	2018-05-25 09:29:32.539707	2018-05-25 09:29:32.539707
76	43	76	71.87	1	\N	2018-05-25 09:29:32.552354	2018-05-25 09:29:32.552354
77	43	77	0.33	1	\N	2018-05-25 09:29:32.557851	2018-05-25 09:29:32.557851
78	43	78	81.36	1	\N	2018-05-25 09:29:32.56308	2018-05-25 09:29:32.56308
79	44	79	17.49	1	\N	2018-05-25 09:29:32.568492	2018-05-25 09:29:32.568492
80	44	80	72.25	1	\N	2018-05-25 09:29:32.571316	2018-05-25 09:29:32.571316
81	44	81	59.99	1	\N	2018-05-25 09:29:32.577241	2018-05-25 09:29:32.577241
82	45	82	93.92	1	\N	2018-05-25 09:29:32.589036	2018-05-25 09:29:32.589036
83	45	83	48.47	1	\N	2018-05-25 09:29:32.591315	2018-05-25 09:29:32.591315
84	46	84	13.65	1	\N	2018-05-25 09:29:32.596587	2018-05-25 09:29:32.596587
85	47	85	5.32	1	\N	2018-05-25 09:29:32.603378	2018-05-25 09:29:32.603378
86	48	86	98.72	1	\N	2018-05-25 09:29:32.613851	2018-05-25 09:29:32.613851
87	49	87	77.31	1	\N	2018-05-25 09:29:32.630685	2018-05-25 09:29:32.630685
88	50	88	84.34	1	\N	2018-05-25 09:29:32.644598	2018-05-25 09:29:32.644598
89	50	89	75.27	1	\N	2018-05-25 09:29:32.647749	2018-05-25 09:29:32.647749
90	51	90	20.66	1	\N	2018-05-25 09:29:32.65655	2018-05-25 09:29:32.65655
91	51	91	52.7	1	\N	2018-05-25 09:29:32.661894	2018-05-25 09:29:32.661894
92	51	92	56.73	1	\N	2018-05-25 09:29:32.667235	2018-05-25 09:29:32.667235
93	52	93	49.68	1	\N	2018-05-25 09:29:32.676637	2018-05-25 09:29:32.676637
94	52	94	14.54	1	\N	2018-05-25 09:29:32.681307	2018-05-25 09:29:32.681307
95	52	95	89.68	1	\N	2018-05-25 09:29:32.685545	2018-05-25 09:29:32.685545
96	53	96	80.98	1	\N	2018-05-25 09:29:32.69811	2018-05-25 09:29:32.69811
97	54	97	61.72	1	\N	2018-05-25 09:29:32.704339	2018-05-25 09:29:32.704339
98	54	98	94.3	1	\N	2018-05-25 09:29:32.707435	2018-05-25 09:29:32.707435
99	55	99	92.5	1	\N	2018-05-25 09:29:32.719001	2018-05-25 09:29:32.719001
100	55	100	77.83	1	\N	2018-05-25 09:29:32.722249	2018-05-25 09:29:32.722249
101	56	101	84.71	1	\N	2018-05-25 09:29:32.729156	2018-05-25 09:29:32.729156
102	56	102	84.19	1	\N	2018-05-25 09:29:32.733404	2018-05-25 09:29:32.733404
103	57	103	1.81	1	\N	2018-05-25 09:29:32.74432	2018-05-25 09:29:32.74432
104	57	104	50.32	1	\N	2018-05-25 09:29:32.747135	2018-05-25 09:29:32.747135
105	57	105	85.32	1	\N	2018-05-25 09:29:32.752531	2018-05-25 09:29:32.752531
106	58	106	18.17	1	\N	2018-05-25 09:29:32.761947	2018-05-25 09:29:32.761947
107	58	107	99.67	1	\N	2018-05-25 09:29:32.766546	2018-05-25 09:29:32.766546
108	58	108	79.21	1	\N	2018-05-25 09:29:32.771171	2018-05-25 09:29:32.771171
109	59	109	34.81	1	\N	2018-05-25 09:29:32.782128	2018-05-25 09:29:32.782128
110	59	110	61.89	1	\N	2018-05-25 09:29:32.785556	2018-05-25 09:29:32.785556
111	60	111	29.7	1	\N	2018-05-25 09:29:32.79276	2018-05-25 09:29:32.79276
112	60	112	32.21	1	\N	2018-05-25 09:29:32.796279	2018-05-25 09:29:32.796279
113	61	113	51.11	1	\N	2018-05-25 09:29:32.802758	2018-05-25 09:29:32.802758
114	61	114	74.99	1	\N	2018-05-25 09:29:32.807117	2018-05-25 09:29:32.807117
115	62	115	77.04	1	\N	2018-05-25 09:29:32.816849	2018-05-25 09:29:32.816849
116	62	116	47.2	1	\N	2018-05-25 09:29:32.822351	2018-05-25 09:29:32.822351
117	62	117	1.49	1	\N	2018-05-25 09:29:32.82497	2018-05-25 09:29:32.82497
118	63	118	79.63	1	\N	2018-05-25 09:29:32.839886	2018-05-25 09:29:32.839886
119	63	119	60.47	1	\N	2018-05-25 09:29:32.844149	2018-05-25 09:29:32.844149
120	63	120	13.39	1	\N	2018-05-25 09:29:32.85009	2018-05-25 09:29:32.85009
121	64	121	3.76	1	\N	2018-05-25 09:29:32.859905	2018-05-25 09:29:32.859905
122	64	122	79.1	1	\N	2018-05-25 09:29:32.86374	2018-05-25 09:29:32.86374
123	65	123	34.4	1	\N	2018-05-25 09:29:32.871291	2018-05-25 09:29:32.871291
124	65	124	45.48	1	\N	2018-05-25 09:29:32.877794	2018-05-25 09:29:32.877794
125	65	125	8.97	1	\N	2018-05-25 09:29:32.881912	2018-05-25 09:29:32.881912
126	66	126	48.19	1	\N	2018-05-25 09:29:32.888206	2018-05-25 09:29:32.888206
127	66	127	56.45	1	\N	2018-05-25 09:29:32.894591	2018-05-25 09:29:32.894591
128	66	128	53.93	1	\N	2018-05-25 09:29:32.897299	2018-05-25 09:29:32.897299
129	67	129	21.16	1	\N	2018-05-25 09:29:32.907241	2018-05-25 09:29:32.907241
130	67	130	94.95	1	\N	2018-05-25 09:29:32.912779	2018-05-25 09:29:32.912779
131	68	131	72.21	1	\N	2018-05-25 09:29:32.922144	2018-05-25 09:29:32.922144
132	68	132	12.72	1	\N	2018-05-25 09:29:32.926819	2018-05-25 09:29:32.926819
133	69	133	69.05	1	\N	2018-05-25 09:29:32.935784	2018-05-25 09:29:32.935784
134	69	134	10.44	1	\N	2018-05-25 09:29:32.938756	2018-05-25 09:29:32.938756
135	69	135	59.32	1	\N	2018-05-25 09:29:32.942923	2018-05-25 09:29:32.942923
136	70	136	45.66	1	\N	2018-05-25 09:29:32.950351	2018-05-25 09:29:32.950351
137	71	137	91.59	1	\N	2018-05-25 09:29:32.964323	2018-05-25 09:29:32.964323
138	71	138	69.21	1	\N	2018-05-25 09:29:32.967482	2018-05-25 09:29:32.967482
139	71	139	44.47	1	\N	2018-05-25 09:29:32.972439	2018-05-25 09:29:32.972439
140	72	140	42.81	1	\N	2018-05-25 09:29:32.983824	2018-05-25 09:29:32.983824
141	72	141	38.31	1	\N	2018-05-25 09:29:32.989725	2018-05-25 09:29:32.989725
142	73	142	61.2	1	\N	2018-05-25 09:29:33.004053	2018-05-25 09:29:33.004053
143	74	143	4.31	1	\N	2018-05-25 09:29:33.013219	2018-05-25 09:29:33.013219
144	74	144	56.88	1	\N	2018-05-25 09:29:33.017787	2018-05-25 09:29:33.017787
145	74	145	43.31	1	\N	2018-05-25 09:29:33.023199	2018-05-25 09:29:33.023199
146	75	146	48.61	1	\N	2018-05-25 09:29:33.028684	2018-05-25 09:29:33.028684
147	76	147	14.38	1	\N	2018-05-25 09:29:33.03957	2018-05-25 09:29:33.03957
148	76	148	96.07	1	\N	2018-05-25 09:29:33.042977	2018-05-25 09:29:33.042977
149	77	149	32.29	1	\N	2018-05-25 09:29:33.052115	2018-05-25 09:29:33.052115
150	78	150	0.08	1	\N	2018-05-25 09:29:33.06273	2018-05-25 09:29:33.06273
151	78	151	70.1	1	\N	2018-05-25 09:29:33.065693	2018-05-25 09:29:33.065693
152	79	152	36.59	1	\N	2018-05-25 09:29:33.081635	2018-05-25 09:29:33.081635
153	79	153	44.05	1	\N	2018-05-25 09:29:33.086027	2018-05-25 09:29:33.086027
154	80	154	55.71	1	\N	2018-05-25 09:29:33.094025	2018-05-25 09:29:33.094025
155	80	155	67.83	1	\N	2018-05-25 09:29:33.09898	2018-05-25 09:29:33.09898
156	80	156	86.49	1	\N	2018-05-25 09:29:33.10449	2018-05-25 09:29:33.10449
157	81	157	63.4	1	\N	2018-05-25 09:29:33.119643	2018-05-25 09:29:33.119643
158	82	158	36.71	1	\N	2018-05-25 09:29:33.133644	2018-05-25 09:29:33.133644
159	83	159	94.12	1	\N	2018-05-25 09:29:33.145559	2018-05-25 09:29:33.145559
160	83	160	60.05	1	\N	2018-05-25 09:29:33.152207	2018-05-25 09:29:33.152207
161	84	161	9.76	1	\N	2018-05-25 09:29:33.161489	2018-05-25 09:29:33.161489
162	85	162	48.05	1	\N	2018-05-25 09:29:33.173136	2018-05-25 09:29:33.173136
163	86	163	42.17	1	\N	2018-05-25 09:29:33.183482	2018-05-25 09:29:33.183482
164	87	164	70.77	1	\N	2018-05-25 09:29:33.193152	2018-05-25 09:29:33.193152
165	87	165	24.49	1	\N	2018-05-25 09:29:33.196223	2018-05-25 09:29:33.196223
166	88	166	92.82	1	\N	2018-05-25 09:29:33.205893	2018-05-25 09:29:33.205893
167	88	167	3.75	1	\N	2018-05-25 09:29:33.210614	2018-05-25 09:29:33.210614
168	88	168	19.45	1	\N	2018-05-25 09:29:33.216697	2018-05-25 09:29:33.216697
169	89	169	15.78	1	\N	2018-05-25 09:29:33.221897	2018-05-25 09:29:33.221897
170	89	170	65.66	1	\N	2018-05-25 09:29:33.227097	2018-05-25 09:29:33.227097
171	90	171	10.45	1	\N	2018-05-25 09:29:33.240127	2018-05-25 09:29:33.240127
172	90	172	50.17	1	\N	2018-05-25 09:29:33.244792	2018-05-25 09:29:33.244792
173	90	173	11.61	1	\N	2018-05-25 09:29:33.248844	2018-05-25 09:29:33.248844
174	91	174	12.12	1	\N	2018-05-25 09:29:33.255957	2018-05-25 09:29:33.255957
175	91	175	97.57	1	\N	2018-05-25 09:29:33.260316	2018-05-25 09:29:33.260316
176	91	176	36.0	1	\N	2018-05-25 09:29:33.265894	2018-05-25 09:29:33.265894
177	92	177	30.97	1	\N	2018-05-25 09:29:33.278621	2018-05-25 09:29:33.278621
178	92	178	38.61	1	\N	2018-05-25 09:29:33.284152	2018-05-25 09:29:33.284152
179	92	179	5.04	1	\N	2018-05-25 09:29:33.287906	2018-05-25 09:29:33.287906
180	93	180	98.28	1	\N	2018-05-25 09:29:33.298931	2018-05-25 09:29:33.298931
181	93	181	79.88	1	\N	2018-05-25 09:29:33.303231	2018-05-25 09:29:33.303231
182	93	182	32.91	1	\N	2018-05-25 09:29:33.308855	2018-05-25 09:29:33.308855
183	94	183	88.34	1	\N	2018-05-25 09:29:33.313677	2018-05-25 09:29:33.313677
184	95	184	53.15	1	\N	2018-05-25 09:29:33.32091	2018-05-25 09:29:33.32091
185	95	185	84.89	1	\N	2018-05-25 09:29:33.327079	2018-05-25 09:29:33.327079
186	96	186	16.92	1	\N	2018-05-25 09:29:33.336983	2018-05-25 09:29:33.336983
187	96	187	46.67	1	\N	2018-05-25 09:29:33.340553	2018-05-25 09:29:33.340553
188	96	188	91.53	1	\N	2018-05-25 09:29:33.345944	2018-05-25 09:29:33.345944
189	97	189	74.46	1	\N	2018-05-25 09:29:33.356549	2018-05-25 09:29:33.356549
190	98	190	87.86	1	\N	2018-05-25 09:29:33.361296	2018-05-25 09:29:33.361296
191	99	191	8.27	1	\N	2018-05-25 09:29:33.370039	2018-05-25 09:29:33.370039
192	99	192	16.61	1	\N	2018-05-25 09:29:33.374076	2018-05-25 09:29:33.374076
193	100	193	38.79	1	\N	2018-05-25 09:29:33.383784	2018-05-25 09:29:33.383784
194	101	194	0.75	1	\N	2018-05-25 09:29:33.395158	2018-05-25 09:29:33.395158
195	101	195	59.78	1	\N	2018-05-25 09:29:33.400561	2018-05-25 09:29:33.400561
196	101	196	90.51	1	\N	2018-05-25 09:29:33.404037	2018-05-25 09:29:33.404037
197	102	197	47.29	1	\N	2018-05-25 09:29:33.415762	2018-05-25 09:29:33.415762
198	102	198	87.27	1	\N	2018-05-25 09:29:33.419474	2018-05-25 09:29:33.419474
199	102	199	44.04	1	\N	2018-05-25 09:29:33.421706	2018-05-25 09:29:33.421706
200	103	200	84.5	1	\N	2018-05-25 09:29:33.433581	2018-05-25 09:29:33.433581
201	104	201	38.35	1	\N	2018-05-25 09:29:33.441204	2018-05-25 09:29:33.441204
202	105	202	95.37	1	\N	2018-05-25 09:29:33.446684	2018-05-25 09:29:33.446684
203	105	203	62.78	1	\N	2018-05-25 09:29:33.451878	2018-05-25 09:29:33.451878
204	105	204	48.99	1	\N	2018-05-25 09:29:33.455835	2018-05-25 09:29:33.455835
205	106	205	65.01	1	\N	2018-05-25 09:29:33.474486	2018-05-25 09:29:33.474486
206	107	206	49.56	1	\N	2018-05-25 09:29:33.483554	2018-05-25 09:29:33.483554
207	108	207	90.02	1	\N	2018-05-25 09:29:33.496306	2018-05-25 09:29:33.496306
208	109	208	33.02	1	\N	2018-05-25 09:29:33.505689	2018-05-25 09:29:33.505689
209	110	209	58.65	1	\N	2018-05-25 09:29:33.516604	2018-05-25 09:29:33.516604
210	110	210	11.9	1	\N	2018-05-25 09:29:33.519114	2018-05-25 09:29:33.519114
211	111	211	45.06	1	\N	2018-05-25 09:29:33.527224	2018-05-25 09:29:33.527224
212	111	212	94.36	1	\N	2018-05-25 09:29:33.533294	2018-05-25 09:29:33.533294
213	112	213	36.99	1	\N	2018-05-25 09:29:33.544193	2018-05-25 09:29:33.544193
214	113	214	75.98	1	\N	2018-05-25 09:29:33.555662	2018-05-25 09:29:33.555662
215	113	215	77.27	1	\N	2018-05-25 09:29:33.560515	2018-05-25 09:29:33.560515
216	113	216	15.83	1	\N	2018-05-25 09:29:33.566467	2018-05-25 09:29:33.566467
217	114	217	66.66	1	\N	2018-05-25 09:29:33.571481	2018-05-25 09:29:33.571481
218	114	218	52.49	1	\N	2018-05-25 09:29:33.575609	2018-05-25 09:29:33.575609
219	114	219	16.31	1	\N	2018-05-25 09:29:33.581647	2018-05-25 09:29:33.581647
220	115	220	61.94	1	\N	2018-05-25 09:29:33.590751	2018-05-25 09:29:33.590751
221	115	221	5.36	1	\N	2018-05-25 09:29:33.597285	2018-05-25 09:29:33.597285
222	116	222	89.04	1	\N	2018-05-25 09:29:33.606405	2018-05-25 09:29:33.606405
223	116	223	27.09	1	\N	2018-05-25 09:29:33.611939	2018-05-25 09:29:33.611939
224	117	224	69.47	1	\N	2018-05-25 09:29:33.621802	2018-05-25 09:29:33.621802
225	117	225	77.73	1	\N	2018-05-25 09:29:33.628976	2018-05-25 09:29:33.628976
226	117	226	51.46	1	\N	2018-05-25 09:29:33.633849	2018-05-25 09:29:33.633849
227	118	227	73.54	1	\N	2018-05-25 09:29:33.645427	2018-05-25 09:29:33.645427
228	118	228	95.15	1	\N	2018-05-25 09:29:33.648897	2018-05-25 09:29:33.648897
229	119	229	16.16	1	\N	2018-05-25 09:29:33.655692	2018-05-25 09:29:33.655692
230	119	230	48.15	1	\N	2018-05-25 09:29:33.659132	2018-05-25 09:29:33.659132
231	120	231	33.34	1	\N	2018-05-25 09:29:33.670088	2018-05-25 09:29:33.670088
232	120	232	55.85	1	\N	2018-05-25 09:29:33.672864	2018-05-25 09:29:33.672864
233	120	233	24.45	1	\N	2018-05-25 09:29:33.676129	2018-05-25 09:29:33.676129
234	121	234	3.74	1	\N	2018-05-25 09:29:33.682608	2018-05-25 09:29:33.682608
235	121	235	48.94	1	\N	2018-05-25 09:29:33.688357	2018-05-25 09:29:33.688357
236	122	236	57.29	1	\N	2018-05-25 09:29:33.700883	2018-05-25 09:29:33.700883
237	122	237	13.28	1	\N	2018-05-25 09:29:33.703566	2018-05-25 09:29:33.703566
238	122	238	86.41	1	\N	2018-05-25 09:29:33.709615	2018-05-25 09:29:33.709615
239	123	239	25.64	1	\N	2018-05-25 09:29:33.717338	2018-05-25 09:29:33.717338
240	123	240	61.29	1	\N	2018-05-25 09:29:33.722448	2018-05-25 09:29:33.722448
241	123	241	53.19	1	\N	2018-05-25 09:29:33.72794	2018-05-25 09:29:33.72794
242	124	242	21.71	1	\N	2018-05-25 09:29:33.739678	2018-05-25 09:29:33.739678
243	124	243	81.55	1	\N	2018-05-25 09:29:33.743809	2018-05-25 09:29:33.743809
244	124	244	94.2	1	\N	2018-05-25 09:29:33.747896	2018-05-25 09:29:33.747896
245	125	245	1.12	1	\N	2018-05-25 09:29:33.755291	2018-05-25 09:29:33.755291
246	125	246	45.06	1	\N	2018-05-25 09:29:33.759376	2018-05-25 09:29:33.759376
247	126	247	17.98	1	\N	2018-05-25 09:29:33.769016	2018-05-25 09:29:33.769016
248	126	248	48.74	1	\N	2018-05-25 09:29:33.773193	2018-05-25 09:29:33.773193
249	127	249	48.28	1	\N	2018-05-25 09:29:33.78039	2018-05-25 09:29:33.78039
250	128	250	87.19	1	\N	2018-05-25 09:29:33.790899	2018-05-25 09:29:33.790899
251	128	251	16.43	1	\N	2018-05-25 09:29:33.798089	2018-05-25 09:29:33.798089
252	128	252	87.48	1	\N	2018-05-25 09:29:33.802292	2018-05-25 09:29:33.802292
253	129	253	96.78	1	\N	2018-05-25 09:29:33.809602	2018-05-25 09:29:33.809602
254	129	254	33.55	1	\N	2018-05-25 09:29:33.814407	2018-05-25 09:29:33.814407
255	129	255	80.87	1	\N	2018-05-25 09:29:33.821116	2018-05-25 09:29:33.821116
256	130	256	94.43	1	\N	2018-05-25 09:29:33.828758	2018-05-25 09:29:33.828758
257	131	257	83.09	1	\N	2018-05-25 09:29:33.841926	2018-05-25 09:29:33.841926
258	132	258	58.22	1	\N	2018-05-25 09:29:33.852083	2018-05-25 09:29:33.852083
259	132	259	87.06	1	\N	2018-05-25 09:29:33.8563	2018-05-25 09:29:33.8563
260	133	260	19.17	1	\N	2018-05-25 09:29:33.864305	2018-05-25 09:29:33.864305
261	133	261	62.45	1	\N	2018-05-25 09:29:33.868375	2018-05-25 09:29:33.868375
262	134	262	30.28	1	\N	2018-05-25 09:29:33.882142	2018-05-25 09:29:33.882142
263	134	263	28.72	1	\N	2018-05-25 09:29:33.885492	2018-05-25 09:29:33.885492
264	134	264	75.13	1	\N	2018-05-25 09:29:33.889745	2018-05-25 09:29:33.889745
265	135	265	76.59	1	\N	2018-05-25 09:29:33.901213	2018-05-25 09:29:33.901213
266	135	266	13.99	1	\N	2018-05-25 09:29:33.908314	2018-05-25 09:29:33.908314
267	135	267	23.41	1	\N	2018-05-25 09:29:33.912725	2018-05-25 09:29:33.912725
268	136	268	45.78	1	\N	2018-05-25 09:29:33.920215	2018-05-25 09:29:33.920215
269	136	269	24.37	1	\N	2018-05-25 09:29:33.924708	2018-05-25 09:29:33.924708
270	136	270	84.59	1	\N	2018-05-25 09:29:33.931292	2018-05-25 09:29:33.931292
271	137	271	7.38	1	\N	2018-05-25 09:29:33.942234	2018-05-25 09:29:33.942234
272	138	272	58.79	1	\N	2018-05-25 09:29:33.950872	2018-05-25 09:29:33.950872
273	138	273	96.91	1	\N	2018-05-25 09:29:33.957915	2018-05-25 09:29:33.957915
274	139	274	57.67	1	\N	2018-05-25 09:29:33.966692	2018-05-25 09:29:33.966692
275	139	275	88.87	1	\N	2018-05-25 09:29:33.97176	2018-05-25 09:29:33.97176
276	139	276	62.16	1	\N	2018-05-25 09:29:33.976424	2018-05-25 09:29:33.976424
277	140	277	73.7	1	\N	2018-05-25 09:29:33.993593	2018-05-25 09:29:33.993593
278	140	278	93.86	1	\N	2018-05-25 09:29:33.997281	2018-05-25 09:29:33.997281
279	140	279	68.26	1	\N	2018-05-25 09:29:34.001851	2018-05-25 09:29:34.001851
280	141	280	19.11	1	\N	2018-05-25 09:29:34.013708	2018-05-25 09:29:34.013708
281	141	281	70.38	1	\N	2018-05-25 09:29:34.016729	2018-05-25 09:29:34.016729
282	141	282	31.48	1	\N	2018-05-25 09:29:34.019995	2018-05-25 09:29:34.019995
283	142	283	48.12	1	\N	2018-05-25 09:29:34.029838	2018-05-25 09:29:34.029838
284	143	284	63.69	1	\N	2018-05-25 09:29:34.040151	2018-05-25 09:29:34.040151
285	143	285	66.35	1	\N	2018-05-25 09:29:34.043306	2018-05-25 09:29:34.043306
286	144	286	15.84	1	\N	2018-05-25 09:29:34.054052	2018-05-25 09:29:34.054052
287	144	287	80.65	1	\N	2018-05-25 09:29:34.05718	2018-05-25 09:29:34.05718
288	145	288	81.65	1	\N	2018-05-25 09:29:34.067162	2018-05-25 09:29:34.067162
289	146	289	64.87	1	\N	2018-05-25 09:29:34.077123	2018-05-25 09:29:34.077123
290	146	290	96.31	1	\N	2018-05-25 09:29:34.079988	2018-05-25 09:29:34.079988
291	146	291	89.94	1	\N	2018-05-25 09:29:34.083569	2018-05-25 09:29:34.083569
292	147	292	89.04	1	\N	2018-05-25 09:29:34.093161	2018-05-25 09:29:34.093161
293	147	293	22.09	1	\N	2018-05-25 09:29:34.097727	2018-05-25 09:29:34.097727
294	148	294	21.78	1	\N	2018-05-25 09:29:34.114683	2018-05-25 09:29:34.114683
295	148	295	93.68	1	\N	2018-05-25 09:29:34.117639	2018-05-25 09:29:34.117639
296	148	296	7.49	1	\N	2018-05-25 09:29:34.124029	2018-05-25 09:29:34.124029
297	149	297	72.97	1	\N	2018-05-25 09:29:34.138943	2018-05-25 09:29:34.138943
298	150	298	54.72	1	\N	2018-05-25 09:29:34.147234	2018-05-25 09:29:34.147234
299	150	299	15.16	1	\N	2018-05-25 09:29:34.151785	2018-05-25 09:29:34.151785
300	151	300	12.53	1	\N	2018-05-25 09:29:34.162054	2018-05-25 09:29:34.162054
301	151	301	97.24	1	\N	2018-05-25 09:29:34.166228	2018-05-25 09:29:34.166228
302	151	302	41.19	1	\N	2018-05-25 09:29:34.170216	2018-05-25 09:29:34.170216
303	152	303	48.12	1	\N	2018-05-25 09:29:34.178246	2018-05-25 09:29:34.178246
304	152	304	28.57	1	\N	2018-05-25 09:29:34.183602	2018-05-25 09:29:34.183602
305	152	305	21.57	1	\N	2018-05-25 09:29:34.18678	2018-05-25 09:29:34.18678
306	153	306	75.7	1	\N	2018-05-25 09:29:34.19813	2018-05-25 09:29:34.19813
307	153	307	13.46	1	\N	2018-05-25 09:29:34.202248	2018-05-25 09:29:34.202248
308	153	308	69.21	1	\N	2018-05-25 09:29:34.204939	2018-05-25 09:29:34.204939
309	154	309	89.81	1	\N	2018-05-25 09:29:34.211753	2018-05-25 09:29:34.211753
310	155	310	24.14	1	\N	2018-05-25 09:29:34.223647	2018-05-25 09:29:34.223647
311	155	311	65.57	1	\N	2018-05-25 09:29:34.227231	2018-05-25 09:29:34.227231
312	156	312	35.38	1	\N	2018-05-25 09:29:34.239233	2018-05-25 09:29:34.239233
313	156	313	3.57	1	\N	2018-05-25 09:29:34.244314	2018-05-25 09:29:34.244314
314	156	314	8.9	1	\N	2018-05-25 09:29:34.247756	2018-05-25 09:29:34.247756
315	157	315	31.55	1	\N	2018-05-25 09:29:34.254136	2018-05-25 09:29:34.254136
316	158	316	47.67	1	\N	2018-05-25 09:29:34.265645	2018-05-25 09:29:34.265645
317	158	317	56.49	1	\N	2018-05-25 09:29:34.270257	2018-05-25 09:29:34.270257
318	159	318	11.56	1	\N	2018-05-25 09:29:34.276886	2018-05-25 09:29:34.276886
319	159	319	52.63	1	\N	2018-05-25 09:29:34.281858	2018-05-25 09:29:34.281858
320	160	320	37.23	1	\N	2018-05-25 09:29:34.29259	2018-05-25 09:29:34.29259
321	160	321	14.43	1	\N	2018-05-25 09:29:34.297623	2018-05-25 09:29:34.297623
322	161	322	6.05	1	\N	2018-05-25 09:29:34.305009	2018-05-25 09:29:34.305009
323	161	323	39.02	1	\N	2018-05-25 09:29:34.309134	2018-05-25 09:29:34.309134
324	161	324	14.95	1	\N	2018-05-25 09:29:34.313721	2018-05-25 09:29:34.313721
325	162	325	34.22	1	\N	2018-05-25 09:29:34.323744	2018-05-25 09:29:34.323744
326	162	326	68.98	1	\N	2018-05-25 09:29:34.329383	2018-05-25 09:29:34.329383
327	162	327	38.09	1	\N	2018-05-25 09:29:34.333876	2018-05-25 09:29:34.333876
328	163	328	98.08	1	\N	2018-05-25 09:29:34.341114	2018-05-25 09:29:34.341114
329	163	329	20.46	1	\N	2018-05-25 09:29:34.343924	2018-05-25 09:29:34.343924
330	164	330	28.34	1	\N	2018-05-25 09:29:34.359515	2018-05-25 09:29:34.359515
331	164	331	10.19	1	\N	2018-05-25 09:29:34.362691	2018-05-25 09:29:34.362691
332	164	332	81.8	1	\N	2018-05-25 09:29:34.365057	2018-05-25 09:29:34.365057
333	165	333	98.03	1	\N	2018-05-25 09:29:34.373025	2018-05-25 09:29:34.373025
334	165	334	74.24	1	\N	2018-05-25 09:29:34.376605	2018-05-25 09:29:34.376605
335	165	335	42.23	1	\N	2018-05-25 09:29:34.383281	2018-05-25 09:29:34.383281
336	166	336	19.27	1	\N	2018-05-25 09:29:34.389647	2018-05-25 09:29:34.389647
337	166	337	57.26	1	\N	2018-05-25 09:29:34.391946	2018-05-25 09:29:34.391946
338	167	338	19.31	1	\N	2018-05-25 09:29:34.404502	2018-05-25 09:29:34.404502
339	167	339	78.07	1	\N	2018-05-25 09:29:34.409222	2018-05-25 09:29:34.409222
340	168	340	58.52	1	\N	2018-05-25 09:29:34.418818	2018-05-25 09:29:34.418818
341	169	341	3.27	1	\N	2018-05-25 09:29:34.431264	2018-05-25 09:29:34.431264
342	170	342	90.8	1	\N	2018-05-25 09:29:34.442413	2018-05-25 09:29:34.442413
343	170	343	53.7	1	\N	2018-05-25 09:29:34.447182	2018-05-25 09:29:34.447182
344	171	344	72.25	1	\N	2018-05-25 09:29:34.452569	2018-05-25 09:29:34.452569
345	171	345	69.48	1	\N	2018-05-25 09:29:34.458874	2018-05-25 09:29:34.458874
346	172	346	70.07	1	\N	2018-05-25 09:29:34.468803	2018-05-25 09:29:34.468803
347	173	347	51.7	1	\N	2018-05-25 09:29:34.485562	2018-05-25 09:29:34.485562
348	174	348	68.89	1	\N	2018-05-25 09:29:34.490854	2018-05-25 09:29:34.490854
349	174	349	38.83	1	\N	2018-05-25 09:29:34.497125	2018-05-25 09:29:34.497125
350	174	350	51.33	1	\N	2018-05-25 09:29:34.502187	2018-05-25 09:29:34.502187
351	175	351	35.71	1	\N	2018-05-25 09:29:34.510511	2018-05-25 09:29:34.510511
352	175	352	92.44	1	\N	2018-05-25 09:29:34.516185	2018-05-25 09:29:34.516185
353	176	353	16.18	1	\N	2018-05-25 09:29:34.522991	2018-05-25 09:29:34.522991
354	176	354	34.55	1	\N	2018-05-25 09:29:34.526245	2018-05-25 09:29:34.526245
355	177	355	81.26	1	\N	2018-05-25 09:29:34.538608	2018-05-25 09:29:34.538608
356	178	356	46.07	1	\N	2018-05-25 09:29:34.54634	2018-05-25 09:29:34.54634
357	178	357	24.2	1	\N	2018-05-25 09:29:34.550856	2018-05-25 09:29:34.550856
358	179	358	25.85	1	\N	2018-05-25 09:29:34.56443	2018-05-25 09:29:34.56443
359	179	359	24.93	1	\N	2018-05-25 09:29:34.570982	2018-05-25 09:29:34.570982
360	179	360	42.8	1	\N	2018-05-25 09:29:34.575016	2018-05-25 09:29:34.575016
361	180	361	76.69	1	\N	2018-05-25 09:29:34.583066	2018-05-25 09:29:34.583066
362	181	362	64.35	1	\N	2018-05-25 09:29:34.598557	2018-05-25 09:29:34.598557
363	181	363	73.02	1	\N	2018-05-25 09:29:34.602285	2018-05-25 09:29:34.602285
364	182	364	46.15	1	\N	2018-05-25 09:29:34.615072	2018-05-25 09:29:34.615072
365	182	365	62.93	1	\N	2018-05-25 09:29:34.620622	2018-05-25 09:29:34.620622
366	183	366	6.04	1	\N	2018-05-25 09:29:34.6297	2018-05-25 09:29:34.6297
367	183	367	42.75	1	\N	2018-05-25 09:29:34.632988	2018-05-25 09:29:34.632988
368	183	368	1.68	1	\N	2018-05-25 09:29:34.63753	2018-05-25 09:29:34.63753
369	184	369	19.83	1	\N	2018-05-25 09:29:34.645232	2018-05-25 09:29:34.645232
370	184	370	67.97	1	\N	2018-05-25 09:29:34.650826	2018-05-25 09:29:34.650826
371	185	371	78.23	1	\N	2018-05-25 09:29:34.659872	2018-05-25 09:29:34.659872
372	185	372	11.6	1	\N	2018-05-25 09:29:34.666768	2018-05-25 09:29:34.666768
373	186	373	75.78	1	\N	2018-05-25 09:29:34.67527	2018-05-25 09:29:34.67527
374	186	374	41.56	1	\N	2018-05-25 09:29:34.680122	2018-05-25 09:29:34.680122
375	187	375	79.29	1	\N	2018-05-25 09:29:34.691967	2018-05-25 09:29:34.691967
376	188	376	38.93	1	\N	2018-05-25 09:29:34.698953	2018-05-25 09:29:34.698953
377	188	377	72.3	1	\N	2018-05-25 09:29:34.702218	2018-05-25 09:29:34.702218
378	189	378	13.67	1	\N	2018-05-25 09:29:34.714596	2018-05-25 09:29:34.714596
379	189	379	2.61	1	\N	2018-05-25 09:29:34.719181	2018-05-25 09:29:34.719181
380	189	380	34.97	1	\N	2018-05-25 09:29:34.723495	2018-05-25 09:29:34.723495
381	190	381	41.98	1	\N	2018-05-25 09:29:34.739123	2018-05-25 09:29:34.739123
382	191	382	71.65	1	\N	2018-05-25 09:29:34.749476	2018-05-25 09:29:34.749476
383	192	383	85.28	1	\N	2018-05-25 09:29:34.762047	2018-05-25 09:29:34.762047
384	192	384	19.65	1	\N	2018-05-25 09:29:34.765383	2018-05-25 09:29:34.765383
385	192	385	61.4	1	\N	2018-05-25 09:29:34.770779	2018-05-25 09:29:34.770779
386	193	386	73.98	1	\N	2018-05-25 09:29:34.777539	2018-05-25 09:29:34.777539
387	193	387	81.7	1	\N	2018-05-25 09:29:34.782959	2018-05-25 09:29:34.782959
388	194	388	38.47	1	\N	2018-05-25 09:29:34.792387	2018-05-25 09:29:34.792387
389	194	389	86.25	1	\N	2018-05-25 09:29:34.796704	2018-05-25 09:29:34.796704
390	194	390	74.45	1	\N	2018-05-25 09:29:34.802137	2018-05-25 09:29:34.802137
391	195	391	36.7	1	\N	2018-05-25 09:29:34.809848	2018-05-25 09:29:34.809848
392	195	392	17.59	1	\N	2018-05-25 09:29:34.815507	2018-05-25 09:29:34.815507
393	196	393	51.63	1	\N	2018-05-25 09:29:34.83226	2018-05-25 09:29:34.83226
394	196	394	36.95	1	\N	2018-05-25 09:29:34.8368	2018-05-25 09:29:34.8368
395	197	395	88.72	1	\N	2018-05-25 09:29:34.851905	2018-05-25 09:29:34.851905
396	197	396	89.14	1	\N	2018-05-25 09:29:34.855282	2018-05-25 09:29:34.855282
397	198	397	54.83	1	\N	2018-05-25 09:29:34.860602	2018-05-25 09:29:34.860602
398	198	398	16.73	1	\N	2018-05-25 09:29:34.865705	2018-05-25 09:29:34.865705
399	198	399	53.99	1	\N	2018-05-25 09:29:34.871144	2018-05-25 09:29:34.871144
400	199	400	61.05	1	\N	2018-05-25 09:29:34.878994	2018-05-25 09:29:34.878994
401	200	401	86.29	1	\N	2018-05-25 09:29:34.886784	2018-05-25 09:29:34.886784
402	200	402	11.65	1	\N	2018-05-25 09:29:34.892238	2018-05-25 09:29:34.892238
403	201	403	32.36	1	\N	2018-05-25 09:29:34.900826	2018-05-25 09:29:34.900826
404	201	404	94.24	1	\N	2018-05-25 09:29:34.906391	2018-05-25 09:29:34.906391
405	201	405	45.9	1	\N	2018-05-25 09:29:34.910503	2018-05-25 09:29:34.910503
406	202	406	56.64	1	\N	2018-05-25 09:29:34.91856	2018-05-25 09:29:34.91856
407	202	407	24.89	1	\N	2018-05-25 09:29:34.926356	2018-05-25 09:29:34.926356
408	203	408	45.82	1	\N	2018-05-25 09:29:34.935757	2018-05-25 09:29:34.935757
409	203	409	77.48	1	\N	2018-05-25 09:29:34.942415	2018-05-25 09:29:34.942415
410	204	410	74.2	1	\N	2018-05-25 09:29:34.951025	2018-05-25 09:29:34.951025
411	204	411	62.63	1	\N	2018-05-25 09:29:34.954285	2018-05-25 09:29:34.954285
412	205	412	84.77	1	\N	2018-05-25 09:29:34.965468	2018-05-25 09:29:34.965468
413	205	413	22.91	1	\N	2018-05-25 09:29:34.968687	2018-05-25 09:29:34.968687
414	205	414	12.37	1	\N	2018-05-25 09:29:34.974381	2018-05-25 09:29:34.974381
415	206	415	71.39	1	\N	2018-05-25 09:29:34.986168	2018-05-25 09:29:34.986168
416	206	416	9.11	1	\N	2018-05-25 09:29:34.989977	2018-05-25 09:29:34.989977
417	206	417	1.11	1	\N	2018-05-25 09:29:34.996192	2018-05-25 09:29:34.996192
418	207	418	50.87	1	\N	2018-05-25 09:29:35.004128	2018-05-25 09:29:35.004128
419	208	419	8.69	1	\N	2018-05-25 09:29:35.011978	2018-05-25 09:29:35.011978
420	208	420	87.31	1	\N	2018-05-25 09:29:35.014309	2018-05-25 09:29:35.014309
421	209	421	95.63	1	\N	2018-05-25 09:29:35.032904	2018-05-25 09:29:35.032904
422	210	422	88.0	1	\N	2018-05-25 09:29:35.04047	2018-05-25 09:29:35.04047
423	210	423	52.69	1	\N	2018-05-25 09:29:35.044305	2018-05-25 09:29:35.044305
424	210	424	62.08	1	\N	2018-05-25 09:29:35.046842	2018-05-25 09:29:35.046842
425	211	425	27.56	1	\N	2018-05-25 09:29:35.054092	2018-05-25 09:29:35.054092
426	211	426	71.37	1	\N	2018-05-25 09:29:35.057111	2018-05-25 09:29:35.057111
427	212	427	45.79	1	\N	2018-05-25 09:29:35.062195	2018-05-25 09:29:35.062195
428	212	428	79.31	1	\N	2018-05-25 09:29:35.064752	2018-05-25 09:29:35.064752
429	213	429	30.47	1	\N	2018-05-25 09:29:35.070965	2018-05-25 09:29:35.070965
430	213	430	59.28	1	\N	2018-05-25 09:29:35.07311	2018-05-25 09:29:35.07311
431	214	431	56.03	1	\N	2018-05-25 09:29:35.079432	2018-05-25 09:29:35.079432
432	215	432	65.17	1	\N	2018-05-25 09:29:35.084637	2018-05-25 09:29:35.084637
433	215	433	6.95	1	\N	2018-05-25 09:29:35.086947	2018-05-25 09:29:35.086947
434	216	434	14.82	1	\N	2018-05-25 09:29:35.093436	2018-05-25 09:29:35.093436
435	216	435	25.88	1	\N	2018-05-25 09:29:35.096515	2018-05-25 09:29:35.096515
436	217	436	0.49	1	\N	2018-05-25 09:29:35.106594	2018-05-25 09:29:35.106594
437	218	437	63.01	1	\N	2018-05-25 09:29:35.113495	2018-05-25 09:29:35.113495
438	218	438	89.46	1	\N	2018-05-25 09:29:35.116167	2018-05-25 09:29:35.116167
439	219	439	7.41	1	\N	2018-05-25 09:29:35.124276	2018-05-25 09:29:35.124276
440	219	440	6.98	1	\N	2018-05-25 09:29:35.129705	2018-05-25 09:29:35.129705
441	220	441	86.76	1	\N	2018-05-25 09:29:35.136784	2018-05-25 09:29:35.136784
442	221	442	74.52	1	\N	2018-05-25 09:29:35.141876	2018-05-25 09:29:35.141876
443	221	443	19.44	1	\N	2018-05-25 09:29:35.144489	2018-05-25 09:29:35.144489
444	221	444	44.85	1	\N	2018-05-25 09:29:35.147373	2018-05-25 09:29:35.147373
445	222	445	31.32	1	\N	2018-05-25 09:29:35.154182	2018-05-25 09:29:35.154182
446	223	446	88.74	1	\N	2018-05-25 09:29:35.16079	2018-05-25 09:29:35.16079
447	223	447	64.26	1	\N	2018-05-25 09:29:35.163422	2018-05-25 09:29:35.163422
448	224	448	52.58	1	\N	2018-05-25 09:29:35.169998	2018-05-25 09:29:35.169998
449	225	449	53.1	1	\N	2018-05-25 09:29:35.176601	2018-05-25 09:29:35.176601
450	226	450	2.28	1	\N	2018-05-25 09:29:35.181168	2018-05-25 09:29:35.181168
451	226	451	67.46	1	\N	2018-05-25 09:29:35.183816	2018-05-25 09:29:35.183816
452	226	452	70.72	1	\N	2018-05-25 09:29:35.185966	2018-05-25 09:29:35.185966
453	227	453	52.74	1	\N	2018-05-25 09:29:35.192348	2018-05-25 09:29:35.192348
454	228	454	50.99	1	\N	2018-05-25 09:29:35.198549	2018-05-25 09:29:35.198549
455	229	455	29.26	1	\N	2018-05-25 09:29:35.205578	2018-05-25 09:29:35.205578
456	229	456	68.64	1	\N	2018-05-25 09:29:35.207927	2018-05-25 09:29:35.207927
457	230	457	64.68	1	\N	2018-05-25 09:29:35.215918	2018-05-25 09:29:35.215918
458	230	458	98.23	1	\N	2018-05-25 09:29:35.219878	2018-05-25 09:29:35.219878
459	231	459	57.13	1	\N	2018-05-25 09:29:35.226372	2018-05-25 09:29:35.226372
460	232	460	45.55	1	\N	2018-05-25 09:29:35.231143	2018-05-25 09:29:35.231143
461	233	461	99.4	1	\N	2018-05-25 09:29:35.235257	2018-05-25 09:29:35.235257
462	233	462	5.24	1	\N	2018-05-25 09:29:35.237974	2018-05-25 09:29:35.237974
463	234	463	35.08	1	\N	2018-05-25 09:29:35.243846	2018-05-25 09:29:35.243846
464	234	464	28.21	1	\N	2018-05-25 09:29:35.246623	2018-05-25 09:29:35.246623
465	234	465	22.16	1	\N	2018-05-25 09:29:35.249308	2018-05-25 09:29:35.249308
466	235	466	0.49	1	\N	2018-05-25 09:29:35.253847	2018-05-25 09:29:35.253847
467	236	467	48.87	1	\N	2018-05-25 09:29:35.260825	2018-05-25 09:29:35.260825
468	236	468	27.11	1	\N	2018-05-25 09:29:35.263139	2018-05-25 09:29:35.263139
469	236	469	11.28	1	\N	2018-05-25 09:29:35.265369	2018-05-25 09:29:35.265369
470	237	470	84.77	1	\N	2018-05-25 09:29:35.272093	2018-05-25 09:29:35.272093
471	237	471	14.95	1	\N	2018-05-25 09:29:35.275639	2018-05-25 09:29:35.275639
472	238	472	76.02	1	\N	2018-05-25 09:29:35.28145	2018-05-25 09:29:35.28145
473	239	473	50.62	1	\N	2018-05-25 09:29:35.29118	2018-05-25 09:29:35.29118
474	239	474	29.4	1	\N	2018-05-25 09:29:35.294562	2018-05-25 09:29:35.294562
475	239	475	94.62	1	\N	2018-05-25 09:29:35.298343	2018-05-25 09:29:35.298343
476	240	476	3.86	1	\N	2018-05-25 09:29:35.30635	2018-05-25 09:29:35.30635
477	240	477	1.22	1	\N	2018-05-25 09:29:35.310359	2018-05-25 09:29:35.310359
478	240	478	50.2	1	\N	2018-05-25 09:29:35.313751	2018-05-25 09:29:35.313751
479	241	479	30.74	1	\N	2018-05-25 09:29:35.320119	2018-05-25 09:29:35.320119
480	241	480	72.93	1	\N	2018-05-25 09:29:35.325274	2018-05-25 09:29:35.325274
481	242	481	7.9	1	\N	2018-05-25 09:29:35.335169	2018-05-25 09:29:35.335169
482	243	482	27.89	1	\N	2018-05-25 09:29:35.344967	2018-05-25 09:29:35.344967
483	243	483	12.36	1	\N	2018-05-25 09:29:35.347899	2018-05-25 09:29:35.347899
484	243	484	65.13	1	\N	2018-05-25 09:29:35.352485	2018-05-25 09:29:35.352485
485	244	485	94.25	1	\N	2018-05-25 09:29:35.359173	2018-05-25 09:29:35.359173
486	244	486	18.05	1	\N	2018-05-25 09:29:35.362836	2018-05-25 09:29:35.362836
487	245	487	61.86	1	\N	2018-05-25 09:29:35.378934	2018-05-25 09:29:35.378934
488	245	488	60.81	1	\N	2018-05-25 09:29:35.384252	2018-05-25 09:29:35.384252
489	245	489	54.08	1	\N	2018-05-25 09:29:35.390474	2018-05-25 09:29:35.390474
490	246	490	75.08	1	\N	2018-05-25 09:29:35.401699	2018-05-25 09:29:35.401699
491	246	491	11.87	1	\N	2018-05-25 09:29:35.406102	2018-05-25 09:29:35.406102
492	246	492	12.56	1	\N	2018-05-25 09:29:35.410794	2018-05-25 09:29:35.410794
493	247	493	51.13	1	\N	2018-05-25 09:29:35.422695	2018-05-25 09:29:35.422695
494	247	494	95.34	1	\N	2018-05-25 09:29:35.426176	2018-05-25 09:29:35.426176
495	247	495	9.33	1	\N	2018-05-25 09:29:35.431832	2018-05-25 09:29:35.431832
496	248	496	26.55	1	\N	2018-05-25 09:29:35.438513	2018-05-25 09:29:35.438513
497	248	497	98.66	1	\N	2018-05-25 09:29:35.441415	2018-05-25 09:29:35.441415
498	249	498	13.98	1	\N	2018-05-25 09:29:35.449117	2018-05-25 09:29:35.449117
499	250	499	16.81	1	\N	2018-05-25 09:29:35.459155	2018-05-25 09:29:35.459155
500	250	500	49.59	1	\N	2018-05-25 09:29:35.461751	2018-05-25 09:29:35.461751
501	251	501	35.59	1	\N	2018-05-25 09:29:35.466875	2018-05-25 09:29:35.466875
502	252	502	90.43	1	\N	2018-05-25 09:29:35.47067	2018-05-25 09:29:35.47067
503	252	503	3.72	1	\N	2018-05-25 09:29:35.473007	2018-05-25 09:29:35.473007
504	253	504	84.23	1	\N	2018-05-25 09:29:35.47933	2018-05-25 09:29:35.47933
505	253	505	52.58	1	\N	2018-05-25 09:29:35.484241	2018-05-25 09:29:35.484241
506	254	506	61.22	1	\N	2018-05-25 09:29:35.49052	2018-05-25 09:29:35.49052
507	254	507	76.91	1	\N	2018-05-25 09:29:35.492603	2018-05-25 09:29:35.492603
508	254	508	10.86	1	\N	2018-05-25 09:29:35.494716	2018-05-25 09:29:35.494716
509	255	509	2.18	1	\N	2018-05-25 09:29:35.498238	2018-05-25 09:29:35.498238
510	255	510	63.23	1	\N	2018-05-25 09:29:35.50025	2018-05-25 09:29:35.50025
511	256	511	7.7	1	\N	2018-05-25 09:29:35.505507	2018-05-25 09:29:35.505507
512	256	512	83.64	1	\N	2018-05-25 09:29:35.507812	2018-05-25 09:29:35.507812
513	256	513	14.61	1	\N	2018-05-25 09:29:35.50995	2018-05-25 09:29:35.50995
514	257	514	88.8	1	\N	2018-05-25 09:29:35.514952	2018-05-25 09:29:35.514952
515	257	515	45.92	1	\N	2018-05-25 09:29:35.517428	2018-05-25 09:29:35.517428
516	257	516	94.47	1	\N	2018-05-25 09:29:35.519517	2018-05-25 09:29:35.519517
517	258	517	98.38	1	\N	2018-05-25 09:29:35.52499	2018-05-25 09:29:35.52499
518	259	518	77.75	1	\N	2018-05-25 09:29:35.530012	2018-05-25 09:29:35.530012
519	260	519	64.68	1	\N	2018-05-25 09:29:35.537019	2018-05-25 09:29:35.537019
520	261	520	5.57	1	\N	2018-05-25 09:29:35.542545	2018-05-25 09:29:35.542545
521	261	521	48.16	1	\N	2018-05-25 09:29:35.544848	2018-05-25 09:29:35.544848
522	262	522	49.12	1	\N	2018-05-25 09:29:35.548366	2018-05-25 09:29:35.548366
523	263	523	63.38	1	\N	2018-05-25 09:29:35.556023	2018-05-25 09:29:35.556023
524	264	524	41.12	1	\N	2018-05-25 09:29:35.560279	2018-05-25 09:29:35.560279
525	265	525	80.8	1	\N	2018-05-25 09:29:35.564644	2018-05-25 09:29:35.564644
526	265	526	96.89	1	\N	2018-05-25 09:29:35.567349	2018-05-25 09:29:35.567349
527	265	527	76.58	1	\N	2018-05-25 09:29:35.569953	2018-05-25 09:29:35.569953
528	266	528	79.12	1	\N	2018-05-25 09:29:35.576958	2018-05-25 09:29:35.576958
529	266	529	79.48	1	\N	2018-05-25 09:29:35.579687	2018-05-25 09:29:35.579687
530	267	530	85.1	1	\N	2018-05-25 09:29:35.586044	2018-05-25 09:29:35.586044
531	267	531	31.39	1	\N	2018-05-25 09:29:35.589193	2018-05-25 09:29:35.589193
532	268	532	42.68	1	\N	2018-05-25 09:29:35.593845	2018-05-25 09:29:35.593845
533	268	533	76.89	1	\N	2018-05-25 09:29:35.596465	2018-05-25 09:29:35.596465
534	268	534	71.54	1	\N	2018-05-25 09:29:35.599148	2018-05-25 09:29:35.599148
535	269	535	42.53	1	\N	2018-05-25 09:29:35.607762	2018-05-25 09:29:35.607762
536	270	536	97.64	1	\N	2018-05-25 09:29:35.616999	2018-05-25 09:29:35.616999
537	270	537	98.14	1	\N	2018-05-25 09:29:35.619366	2018-05-25 09:29:35.619366
538	270	538	2.73	1	\N	2018-05-25 09:29:35.622002	2018-05-25 09:29:35.622002
539	271	539	79.84	1	\N	2018-05-25 09:29:35.627949	2018-05-25 09:29:35.627949
540	272	540	68.4	1	\N	2018-05-25 09:29:35.634393	2018-05-25 09:29:35.634393
541	272	541	6.14	1	\N	2018-05-25 09:29:35.636971	2018-05-25 09:29:35.636971
542	273	542	21.41	1	\N	2018-05-25 09:29:35.645851	2018-05-25 09:29:35.645851
543	273	543	70.29	1	\N	2018-05-25 09:29:35.648627	2018-05-25 09:29:35.648627
544	274	544	68.05	1	\N	2018-05-25 09:29:35.65268	2018-05-25 09:29:35.65268
545	274	545	98.98	1	\N	2018-05-25 09:29:35.654886	2018-05-25 09:29:35.654886
546	274	546	6.21	1	\N	2018-05-25 09:29:35.657211	2018-05-25 09:29:35.657211
547	275	547	1.56	1	\N	2018-05-25 09:29:35.662984	2018-05-25 09:29:35.662984
548	275	548	67.46	1	\N	2018-05-25 09:29:35.665155	2018-05-25 09:29:35.665155
549	275	549	43.51	1	\N	2018-05-25 09:29:35.667285	2018-05-25 09:29:35.667285
550	276	550	29.55	1	\N	2018-05-25 09:29:35.670979	2018-05-25 09:29:35.670979
551	276	551	91.42	1	\N	2018-05-25 09:29:35.673099	2018-05-25 09:29:35.673099
552	277	552	83.55	1	\N	2018-05-25 09:29:35.677042	2018-05-25 09:29:35.677042
553	278	553	14.55	1	\N	2018-05-25 09:29:35.682539	2018-05-25 09:29:35.682539
554	279	554	11.01	1	\N	2018-05-25 09:29:35.687136	2018-05-25 09:29:35.687136
555	279	555	68.5	1	\N	2018-05-25 09:29:35.689232	2018-05-25 09:29:35.689232
556	280	556	85.91	1	\N	2018-05-25 09:29:35.694969	2018-05-25 09:29:35.694969
557	281	557	84.46	1	\N	2018-05-25 09:29:35.700408	2018-05-25 09:29:35.700408
558	281	558	11.87	1	\N	2018-05-25 09:29:35.702562	2018-05-25 09:29:35.702562
559	282	559	65.69	1	\N	2018-05-25 09:29:35.706439	2018-05-25 09:29:35.706439
560	282	560	65.41	1	\N	2018-05-25 09:29:35.708619	2018-05-25 09:29:35.708619
561	283	561	9.29	1	\N	2018-05-25 09:29:35.714881	2018-05-25 09:29:35.714881
562	283	562	78.65	1	\N	2018-05-25 09:29:35.717516	2018-05-25 09:29:35.717516
563	283	563	10.37	1	\N	2018-05-25 09:29:35.720207	2018-05-25 09:29:35.720207
564	284	564	58.44	1	\N	2018-05-25 09:29:35.724619	2018-05-25 09:29:35.724619
565	285	565	41.02	1	\N	2018-05-25 09:29:35.731263	2018-05-25 09:29:35.731263
566	286	566	75.73	1	\N	2018-05-25 09:29:35.737711	2018-05-25 09:29:35.737711
567	286	567	39.07	1	\N	2018-05-25 09:29:35.74047	2018-05-25 09:29:35.74047
568	286	568	66.71	1	\N	2018-05-25 09:29:35.743109	2018-05-25 09:29:35.743109
569	287	569	99.24	1	\N	2018-05-25 09:29:35.747371	2018-05-25 09:29:35.747371
570	287	570	90.83	1	\N	2018-05-25 09:29:35.749554	2018-05-25 09:29:35.749554
571	288	571	23.03	1	\N	2018-05-25 09:29:35.75475	2018-05-25 09:29:35.75475
572	288	572	6.0	1	\N	2018-05-25 09:29:35.756847	2018-05-25 09:29:35.756847
573	288	573	53.58	1	\N	2018-05-25 09:29:35.758988	2018-05-25 09:29:35.758988
574	289	574	14.11	1	\N	2018-05-25 09:29:35.762574	2018-05-25 09:29:35.762574
575	289	575	98.7	1	\N	2018-05-25 09:29:35.764851	2018-05-25 09:29:35.764851
576	289	576	12.1	1	\N	2018-05-25 09:29:35.767038	2018-05-25 09:29:35.767038
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.orders (id, status, customer_id, paid, deleted_at, created_at, updated_at) FROM stdin;
1	2	2	t	\N	2018-05-25 09:29:31.956541	2018-05-25 09:29:31.956541
2	0	3	t	\N	2018-05-25 09:29:31.989824	2018-05-25 09:29:31.989824
3	1	3	f	\N	2018-05-25 09:29:31.999278	2018-05-25 09:29:31.999278
4	0	4	f	\N	2018-05-25 09:29:32.022225	2018-05-25 09:29:32.022225
5	0	4	t	\N	2018-05-25 09:29:32.033875	2018-05-25 09:29:32.033875
6	1	6	f	\N	2018-05-25 09:29:32.044137	2018-05-25 09:29:32.044137
7	2	6	t	\N	2018-05-25 09:29:32.053488	2018-05-25 09:29:32.053488
8	0	7	f	\N	2018-05-25 09:29:32.071742	2018-05-25 09:29:32.071742
9	0	8	t	\N	2018-05-25 09:29:32.08333	2018-05-25 09:29:32.08333
10	1	8	t	\N	2018-05-25 09:29:32.092405	2018-05-25 09:29:32.092405
11	2	8	f	\N	2018-05-25 09:29:32.099454	2018-05-25 09:29:32.099454
12	0	9	f	\N	2018-05-25 09:29:32.127762	2018-05-25 09:29:32.127762
13	2	10	f	\N	2018-05-25 09:29:32.143074	2018-05-25 09:29:32.143074
14	2	10	t	\N	2018-05-25 09:29:32.150984	2018-05-25 09:29:32.150984
15	2	11	t	\N	2018-05-25 09:29:32.168634	2018-05-25 09:29:32.168634
16	2	11	f	\N	2018-05-25 09:29:32.174361	2018-05-25 09:29:32.174361
17	0	12	t	\N	2018-05-25 09:29:32.193322	2018-05-25 09:29:32.193322
18	2	13	f	\N	2018-05-25 09:29:32.209587	2018-05-25 09:29:32.209587
19	0	13	f	\N	2018-05-25 09:29:32.214166	2018-05-25 09:29:32.214166
20	0	14	f	\N	2018-05-25 09:29:32.23516	2018-05-25 09:29:32.23516
21	1	14	f	\N	2018-05-25 09:29:32.249271	2018-05-25 09:29:32.249271
22	0	16	t	\N	2018-05-25 09:29:32.268173	2018-05-25 09:29:32.268173
23	1	17	f	\N	2018-05-25 09:29:32.286273	2018-05-25 09:29:32.286273
24	2	17	f	\N	2018-05-25 09:29:32.301053	2018-05-25 09:29:32.301053
25	0	18	t	\N	2018-05-25 09:29:32.322394	2018-05-25 09:29:32.322394
26	1	18	f	\N	2018-05-25 09:29:32.331228	2018-05-25 09:29:32.331228
27	2	19	t	\N	2018-05-25 09:29:32.343118	2018-05-25 09:29:32.343118
28	2	19	f	\N	2018-05-25 09:29:32.349701	2018-05-25 09:29:32.349701
29	0	19	t	\N	2018-05-25 09:29:32.362263	2018-05-25 09:29:32.362263
30	1	20	t	\N	2018-05-25 09:29:32.371688	2018-05-25 09:29:32.371688
31	1	20	f	\N	2018-05-25 09:29:32.382382	2018-05-25 09:29:32.382382
32	1	21	t	\N	2018-05-25 09:29:32.397165	2018-05-25 09:29:32.397165
33	0	22	t	\N	2018-05-25 09:29:32.419549	2018-05-25 09:29:32.419549
34	0	23	f	\N	2018-05-25 09:29:32.432879	2018-05-25 09:29:32.432879
35	1	23	t	\N	2018-05-25 09:29:32.44599	2018-05-25 09:29:32.44599
36	0	24	t	\N	2018-05-25 09:29:32.461165	2018-05-25 09:29:32.461165
37	1	24	t	\N	2018-05-25 09:29:32.469026	2018-05-25 09:29:32.469026
38	1	24	f	\N	2018-05-25 09:29:32.47585	2018-05-25 09:29:32.47585
39	1	25	f	\N	2018-05-25 09:29:32.492669	2018-05-25 09:29:32.492669
40	0	26	t	\N	2018-05-25 09:29:32.507219	2018-05-25 09:29:32.507219
41	0	27	t	\N	2018-05-25 09:29:32.523677	2018-05-25 09:29:32.523677
42	1	27	f	\N	2018-05-25 09:29:32.53227	2018-05-25 09:29:32.53227
43	1	28	t	\N	2018-05-25 09:29:32.547244	2018-05-25 09:29:32.547244
44	2	28	f	\N	2018-05-25 09:29:32.566695	2018-05-25 09:29:32.566695
45	2	29	f	\N	2018-05-25 09:29:32.587221	2018-05-25 09:29:32.587221
46	2	29	f	\N	2018-05-25 09:29:32.594534	2018-05-25 09:29:32.594534
47	2	29	f	\N	2018-05-25 09:29:32.601817	2018-05-25 09:29:32.601817
48	1	30	f	\N	2018-05-25 09:29:32.611109	2018-05-25 09:29:32.611109
49	2	30	f	\N	2018-05-25 09:29:32.623957	2018-05-25 09:29:32.623957
50	1	32	f	\N	2018-05-25 09:29:32.64286	2018-05-25 09:29:32.64286
51	1	32	f	\N	2018-05-25 09:29:32.653515	2018-05-25 09:29:32.653515
52	0	33	f	\N	2018-05-25 09:29:32.674699	2018-05-25 09:29:32.674699
53	2	34	t	\N	2018-05-25 09:29:32.694293	2018-05-25 09:29:32.694293
54	0	34	f	\N	2018-05-25 09:29:32.701539	2018-05-25 09:29:32.701539
55	0	35	f	\N	2018-05-25 09:29:32.715157	2018-05-25 09:29:32.715157
56	1	35	f	\N	2018-05-25 09:29:32.72539	2018-05-25 09:29:32.72539
57	1	36	f	\N	2018-05-25 09:29:32.742103	2018-05-25 09:29:32.742103
58	2	36	f	\N	2018-05-25 09:29:32.758993	2018-05-25 09:29:32.758993
59	0	37	f	\N	2018-05-25 09:29:32.779162	2018-05-25 09:29:32.779162
60	0	37	f	\N	2018-05-25 09:29:32.788875	2018-05-25 09:29:32.788875
61	2	37	t	\N	2018-05-25 09:29:32.80106	2018-05-25 09:29:32.80106
62	0	38	t	\N	2018-05-25 09:29:32.815355	2018-05-25 09:29:32.815355
63	2	39	f	\N	2018-05-25 09:29:32.835856	2018-05-25 09:29:32.835856
64	2	40	f	\N	2018-05-25 09:29:32.855392	2018-05-25 09:29:32.855392
65	0	40	t	\N	2018-05-25 09:29:32.86851	2018-05-25 09:29:32.86851
66	2	40	t	\N	2018-05-25 09:29:32.884803	2018-05-25 09:29:32.884803
67	2	41	t	\N	2018-05-25 09:29:32.905286	2018-05-25 09:29:32.905286
68	2	42	t	\N	2018-05-25 09:29:32.920028	2018-05-25 09:29:32.920028
69	2	43	t	\N	2018-05-25 09:29:32.934332	2018-05-25 09:29:32.934332
70	0	43	t	\N	2018-05-25 09:29:32.946063	2018-05-25 09:29:32.946063
71	0	44	t	\N	2018-05-25 09:29:32.962208	2018-05-25 09:29:32.962208
72	0	45	f	\N	2018-05-25 09:29:32.98071	2018-05-25 09:29:32.98071
73	2	47	f	\N	2018-05-25 09:29:33.002119	2018-05-25 09:29:33.002119
74	1	48	t	\N	2018-05-25 09:29:33.010219	2018-05-25 09:29:33.010219
75	1	48	t	\N	2018-05-25 09:29:33.026349	2018-05-25 09:29:33.026349
76	2	49	t	\N	2018-05-25 09:29:33.035427	2018-05-25 09:29:33.035427
77	1	49	t	\N	2018-05-25 09:29:33.046895	2018-05-25 09:29:33.046895
78	0	49	t	\N	2018-05-25 09:29:33.058317	2018-05-25 09:29:33.058317
79	2	51	f	\N	2018-05-25 09:29:33.076666	2018-05-25 09:29:33.076666
80	0	51	t	\N	2018-05-25 09:29:33.091673	2018-05-25 09:29:33.091673
81	2	52	t	\N	2018-05-25 09:29:33.114813	2018-05-25 09:29:33.114813
82	1	53	f	\N	2018-05-25 09:29:33.131421	2018-05-25 09:29:33.131421
83	2	55	t	\N	2018-05-25 09:29:33.143216	2018-05-25 09:29:33.143216
84	2	55	f	\N	2018-05-25 09:29:33.158026	2018-05-25 09:29:33.158026
85	0	56	t	\N	2018-05-25 09:29:33.169003	2018-05-25 09:29:33.169003
86	0	57	f	\N	2018-05-25 09:29:33.180657	2018-05-25 09:29:33.180657
87	1	57	t	\N	2018-05-25 09:29:33.188844	2018-05-25 09:29:33.188844
88	1	58	t	\N	2018-05-25 09:29:33.203241	2018-05-25 09:29:33.203241
89	1	58	t	\N	2018-05-25 09:29:33.219607	2018-05-25 09:29:33.219607
90	2	59	f	\N	2018-05-25 09:29:33.235482	2018-05-25 09:29:33.235482
91	2	59	t	\N	2018-05-25 09:29:33.25394	2018-05-25 09:29:33.25394
92	1	60	t	\N	2018-05-25 09:29:33.273212	2018-05-25 09:29:33.273212
93	2	61	f	\N	2018-05-25 09:29:33.29513	2018-05-25 09:29:33.29513
94	0	61	f	\N	2018-05-25 09:29:33.312131	2018-05-25 09:29:33.312131
95	2	61	t	\N	2018-05-25 09:29:33.316418	2018-05-25 09:29:33.316418
96	1	62	f	\N	2018-05-25 09:29:33.333925	2018-05-25 09:29:33.333925
97	1	63	t	\N	2018-05-25 09:29:33.354697	2018-05-25 09:29:33.354697
98	0	63	t	\N	2018-05-25 09:29:33.359377	2018-05-25 09:29:33.359377
99	0	63	f	\N	2018-05-25 09:29:33.367057	2018-05-25 09:29:33.367057
100	0	64	t	\N	2018-05-25 09:29:33.382	2018-05-25 09:29:33.382
101	2	65	t	\N	2018-05-25 09:29:33.392033	2018-05-25 09:29:33.392033
102	1	66	f	\N	2018-05-25 09:29:33.412091	2018-05-25 09:29:33.412091
103	1	67	t	\N	2018-05-25 09:29:33.43148	2018-05-25 09:29:33.43148
104	1	67	f	\N	2018-05-25 09:29:33.439141	2018-05-25 09:29:33.439141
105	1	67	t	\N	2018-05-25 09:29:33.444891	2018-05-25 09:29:33.444891
106	2	70	t	\N	2018-05-25 09:29:33.472698	2018-05-25 09:29:33.472698
107	0	71	f	\N	2018-05-25 09:29:33.482131	2018-05-25 09:29:33.482131
108	0	72	t	\N	2018-05-25 09:29:33.494142	2018-05-25 09:29:33.494142
109	1	73	t	\N	2018-05-25 09:29:33.503299	2018-05-25 09:29:33.503299
110	1	73	f	\N	2018-05-25 09:29:33.512426	2018-05-25 09:29:33.512426
111	2	73	t	\N	2018-05-25 09:29:33.524975	2018-05-25 09:29:33.524975
112	1	74	f	\N	2018-05-25 09:29:33.541446	2018-05-25 09:29:33.541446
113	2	75	f	\N	2018-05-25 09:29:33.552308	2018-05-25 09:29:33.552308
114	2	75	f	\N	2018-05-25 09:29:33.569788	2018-05-25 09:29:33.569788
115	0	76	f	\N	2018-05-25 09:29:33.58868	2018-05-25 09:29:33.58868
116	2	76	t	\N	2018-05-25 09:29:33.603355	2018-05-25 09:29:33.603355
117	0	77	t	\N	2018-05-25 09:29:33.618013	2018-05-25 09:29:33.618013
118	1	78	f	\N	2018-05-25 09:29:33.642653	2018-05-25 09:29:33.642653
119	2	78	t	\N	2018-05-25 09:29:33.653814	2018-05-25 09:29:33.653814
120	2	79	f	\N	2018-05-25 09:29:33.66715	2018-05-25 09:29:33.66715
121	2	79	f	\N	2018-05-25 09:29:33.681095	2018-05-25 09:29:33.681095
122	1	80	t	\N	2018-05-25 09:29:33.697278	2018-05-25 09:29:33.697278
123	0	80	t	\N	2018-05-25 09:29:33.714879	2018-05-25 09:29:33.714879
124	2	82	t	\N	2018-05-25 09:29:33.737145	2018-05-25 09:29:33.737145
125	1	82	f	\N	2018-05-25 09:29:33.750248	2018-05-25 09:29:33.750248
126	1	83	t	\N	2018-05-25 09:29:33.766823	2018-05-25 09:29:33.766823
127	0	83	f	\N	2018-05-25 09:29:33.776482	2018-05-25 09:29:33.776482
128	1	84	t	\N	2018-05-25 09:29:33.788062	2018-05-25 09:29:33.788062
129	1	84	t	\N	2018-05-25 09:29:33.807383	2018-05-25 09:29:33.807383
130	0	84	t	\N	2018-05-25 09:29:33.824084	2018-05-25 09:29:33.824084
131	2	85	f	\N	2018-05-25 09:29:33.838162	2018-05-25 09:29:33.838162
132	1	86	f	\N	2018-05-25 09:29:33.847992	2018-05-25 09:29:33.847992
133	1	86	f	\N	2018-05-25 09:29:33.860048	2018-05-25 09:29:33.860048
134	2	87	t	\N	2018-05-25 09:29:33.877185	2018-05-25 09:29:33.877185
135	1	88	t	\N	2018-05-25 09:29:33.899533	2018-05-25 09:29:33.899533
136	2	89	f	\N	2018-05-25 09:29:33.918033	2018-05-25 09:29:33.918033
137	1	90	f	\N	2018-05-25 09:29:33.938339	2018-05-25 09:29:33.938339
138	1	90	f	\N	2018-05-25 09:29:33.945799	2018-05-25 09:29:33.945799
139	0	91	t	\N	2018-05-25 09:29:33.964582	2018-05-25 09:29:33.964582
140	1	94	f	\N	2018-05-25 09:29:33.990255	2018-05-25 09:29:33.990255
141	1	95	t	\N	2018-05-25 09:29:34.011685	2018-05-25 09:29:34.011685
142	1	95	t	\N	2018-05-25 09:29:34.027091	2018-05-25 09:29:34.027091
143	1	96	f	\N	2018-05-25 09:29:34.03683	2018-05-25 09:29:34.03683
144	2	97	t	\N	2018-05-25 09:29:34.052314	2018-05-25 09:29:34.052314
145	1	98	t	\N	2018-05-25 09:29:34.063913	2018-05-25 09:29:34.063913
146	1	99	f	\N	2018-05-25 09:29:34.075402	2018-05-25 09:29:34.075402
147	2	99	f	\N	2018-05-25 09:29:34.091187	2018-05-25 09:29:34.091187
148	0	100	f	\N	2018-05-25 09:29:34.112311	2018-05-25 09:29:34.112311
149	0	102	t	\N	2018-05-25 09:29:34.133727	2018-05-25 09:29:34.133727
150	1	102	f	\N	2018-05-25 09:29:34.143241	2018-05-25 09:29:34.143241
151	1	103	t	\N	2018-05-25 09:29:34.157617	2018-05-25 09:29:34.157617
152	2	103	t	\N	2018-05-25 09:29:34.175445	2018-05-25 09:29:34.175445
153	1	104	t	\N	2018-05-25 09:29:34.195319	2018-05-25 09:29:34.195319
154	1	104	t	\N	2018-05-25 09:29:34.209788	2018-05-25 09:29:34.209788
155	1	105	t	\N	2018-05-25 09:29:34.219948	2018-05-25 09:29:34.219948
156	1	106	f	\N	2018-05-25 09:29:34.235158	2018-05-25 09:29:34.235158
157	2	106	f	\N	2018-05-25 09:29:34.250498	2018-05-25 09:29:34.250498
158	0	107	f	\N	2018-05-25 09:29:34.261235	2018-05-25 09:29:34.261235
159	0	107	f	\N	2018-05-25 09:29:34.274181	2018-05-25 09:29:34.274181
160	2	108	f	\N	2018-05-25 09:29:34.28978	2018-05-25 09:29:34.28978
161	2	108	t	\N	2018-05-25 09:29:34.300547	2018-05-25 09:29:34.300547
162	1	109	t	\N	2018-05-25 09:29:34.321794	2018-05-25 09:29:34.321794
163	1	109	f	\N	2018-05-25 09:29:34.338359	2018-05-25 09:29:34.338359
164	0	110	t	\N	2018-05-25 09:29:34.354973	2018-05-25 09:29:34.354973
165	0	110	t	\N	2018-05-25 09:29:34.370862	2018-05-25 09:29:34.370862
166	2	110	f	\N	2018-05-25 09:29:34.388198	2018-05-25 09:29:34.388198
167	1	111	f	\N	2018-05-25 09:29:34.400281	2018-05-25 09:29:34.400281
168	1	112	t	\N	2018-05-25 09:29:34.414679	2018-05-25 09:29:34.414679
169	1	114	f	\N	2018-05-25 09:29:34.428398	2018-05-25 09:29:34.428398
170	1	115	f	\N	2018-05-25 09:29:34.438379	2018-05-25 09:29:34.438379
171	1	115	f	\N	2018-05-25 09:29:34.451035	2018-05-25 09:29:34.451035
172	1	116	f	\N	2018-05-25 09:29:34.466637	2018-05-25 09:29:34.466637
173	0	118	t	\N	2018-05-25 09:29:34.481198	2018-05-25 09:29:34.481198
174	2	118	f	\N	2018-05-25 09:29:34.488358	2018-05-25 09:29:34.488358
175	2	118	t	\N	2018-05-25 09:29:34.506495	2018-05-25 09:29:34.506495
176	2	119	t	\N	2018-05-25 09:29:34.521256	2018-05-25 09:29:34.521256
177	0	120	t	\N	2018-05-25 09:29:34.536324	2018-05-25 09:29:34.536324
178	0	120	t	\N	2018-05-25 09:29:34.542911	2018-05-25 09:29:34.542911
179	0	121	t	\N	2018-05-25 09:29:34.560597	2018-05-25 09:29:34.560597
180	0	122	t	\N	2018-05-25 09:29:34.579756	2018-05-25 09:29:34.579756
181	1	123	f	\N	2018-05-25 09:29:34.59423	2018-05-25 09:29:34.59423
182	1	123	t	\N	2018-05-25 09:29:34.608245	2018-05-25 09:29:34.608245
183	1	124	f	\N	2018-05-25 09:29:34.627546	2018-05-25 09:29:34.627546
184	2	124	t	\N	2018-05-25 09:29:34.641584	2018-05-25 09:29:34.641584
185	2	125	f	\N	2018-05-25 09:29:34.657499	2018-05-25 09:29:34.657499
186	1	125	f	\N	2018-05-25 09:29:34.671624	2018-05-25 09:29:34.671624
187	1	126	f	\N	2018-05-25 09:29:34.687972	2018-05-25 09:29:34.687972
188	0	126	f	\N	2018-05-25 09:29:34.695533	2018-05-25 09:29:34.695533
189	1	127	t	\N	2018-05-25 09:29:34.712864	2018-05-25 09:29:34.712864
190	0	129	t	\N	2018-05-25 09:29:34.737194	2018-05-25 09:29:34.737194
191	1	130	f	\N	2018-05-25 09:29:34.7471	2018-05-25 09:29:34.7471
192	1	131	t	\N	2018-05-25 09:29:34.759216	2018-05-25 09:29:34.759216
193	0	131	f	\N	2018-05-25 09:29:34.773785	2018-05-25 09:29:34.773785
194	1	132	t	\N	2018-05-25 09:29:34.790165	2018-05-25 09:29:34.790165
195	0	132	t	\N	2018-05-25 09:29:34.806581	2018-05-25 09:29:34.806581
196	0	133	t	\N	2018-05-25 09:29:34.828511	2018-05-25 09:29:34.828511
197	0	134	f	\N	2018-05-25 09:29:34.847835	2018-05-25 09:29:34.847835
198	2	134	t	\N	2018-05-25 09:29:34.85849	2018-05-25 09:29:34.85849
199	0	134	f	\N	2018-05-25 09:29:34.875429	2018-05-25 09:29:34.875429
200	1	135	f	\N	2018-05-25 09:29:34.883592	2018-05-25 09:29:34.883592
201	1	135	t	\N	2018-05-25 09:29:34.897963	2018-05-25 09:29:34.897963
202	0	135	f	\N	2018-05-25 09:29:34.913153	2018-05-25 09:29:34.913153
203	1	136	t	\N	2018-05-25 09:29:34.93275	2018-05-25 09:29:34.93275
204	0	136	t	\N	2018-05-25 09:29:34.94778	2018-05-25 09:29:34.94778
205	2	137	t	\N	2018-05-25 09:29:34.959616	2018-05-25 09:29:34.959616
206	1	139	f	\N	2018-05-25 09:29:34.984081	2018-05-25 09:29:34.984081
207	1	139	f	\N	2018-05-25 09:29:35.00161	2018-05-25 09:29:35.00161
208	2	139	f	\N	2018-05-25 09:29:35.010069	2018-05-25 09:29:35.010069
209	0	142	t	\N	2018-05-25 09:29:35.029358	2018-05-25 09:29:35.029358
210	0	143	t	\N	2018-05-25 09:29:35.038313	2018-05-25 09:29:35.038313
211	2	144	t	\N	2018-05-25 09:29:35.052233	2018-05-25 09:29:35.052233
212	1	144	t	\N	2018-05-25 09:29:35.059961	2018-05-25 09:29:35.059961
213	0	145	f	\N	2018-05-25 09:29:35.069386	2018-05-25 09:29:35.069386
214	2	146	f	\N	2018-05-25 09:29:35.077936	2018-05-25 09:29:35.077936
215	0	146	t	\N	2018-05-25 09:29:35.082561	2018-05-25 09:29:35.082561
216	0	147	f	\N	2018-05-25 09:29:35.091922	2018-05-25 09:29:35.091922
217	2	148	t	\N	2018-05-25 09:29:35.10293	2018-05-25 09:29:35.10293
218	1	148	f	\N	2018-05-25 09:29:35.110824	2018-05-25 09:29:35.110824
219	2	149	t	\N	2018-05-25 09:29:35.122341	2018-05-25 09:29:35.122341
220	2	149	t	\N	2018-05-25 09:29:35.134839	2018-05-25 09:29:35.134839
221	2	149	f	\N	2018-05-25 09:29:35.139986	2018-05-25 09:29:35.139986
222	1	150	t	\N	2018-05-25 09:29:35.15233	2018-05-25 09:29:35.15233
223	0	151	f	\N	2018-05-25 09:29:35.158901	2018-05-25 09:29:35.158901
224	0	152	t	\N	2018-05-25 09:29:35.167997	2018-05-25 09:29:35.167997
225	1	153	f	\N	2018-05-25 09:29:35.174619	2018-05-25 09:29:35.174619
226	2	153	t	\N	2018-05-25 09:29:35.179135	2018-05-25 09:29:35.179135
227	0	154	t	\N	2018-05-25 09:29:35.190705	2018-05-25 09:29:35.190705
228	1	155	t	\N	2018-05-25 09:29:35.196909	2018-05-25 09:29:35.196909
229	2	156	f	\N	2018-05-25 09:29:35.203546	2018-05-25 09:29:35.203546
230	1	158	t	\N	2018-05-25 09:29:35.214418	2018-05-25 09:29:35.214418
231	1	159	f	\N	2018-05-25 09:29:35.224504	2018-05-25 09:29:35.224504
232	1	159	t	\N	2018-05-25 09:29:35.229126	2018-05-25 09:29:35.229126
233	1	159	t	\N	2018-05-25 09:29:35.233739	2018-05-25 09:29:35.233739
234	0	160	t	\N	2018-05-25 09:29:35.242364	2018-05-25 09:29:35.242364
235	0	160	t	\N	2018-05-25 09:29:35.25193	2018-05-25 09:29:35.25193
236	2	161	f	\N	2018-05-25 09:29:35.258759	2018-05-25 09:29:35.258759
237	2	162	t	\N	2018-05-25 09:29:35.270121	2018-05-25 09:29:35.270121
238	0	162	f	\N	2018-05-25 09:29:35.278287	2018-05-25 09:29:35.278287
239	1	163	f	\N	2018-05-25 09:29:35.287562	2018-05-25 09:29:35.287562
240	1	164	t	\N	2018-05-25 09:29:35.304424	2018-05-25 09:29:35.304424
241	0	164	t	\N	2018-05-25 09:29:35.318362	2018-05-25 09:29:35.318362
242	0	165	t	\N	2018-05-25 09:29:35.33277	2018-05-25 09:29:35.33277
243	2	166	t	\N	2018-05-25 09:29:35.342422	2018-05-25 09:29:35.342422
244	0	166	t	\N	2018-05-25 09:29:35.355204	2018-05-25 09:29:35.355204
245	2	168	t	\N	2018-05-25 09:29:35.376359	2018-05-25 09:29:35.376359
246	0	169	t	\N	2018-05-25 09:29:35.398879	2018-05-25 09:29:35.398879
247	0	170	t	\N	2018-05-25 09:29:35.418929	2018-05-25 09:29:35.418929
248	1	170	f	\N	2018-05-25 09:29:35.435976	2018-05-25 09:29:35.435976
249	0	170	f	\N	2018-05-25 09:29:35.447571	2018-05-25 09:29:35.447571
250	1	172	t	\N	2018-05-25 09:29:35.456911	2018-05-25 09:29:35.456911
251	2	173	t	\N	2018-05-25 09:29:35.465539	2018-05-25 09:29:35.465539
252	2	173	f	\N	2018-05-25 09:29:35.469032	2018-05-25 09:29:35.469032
253	0	173	t	\N	2018-05-25 09:29:35.475727	2018-05-25 09:29:35.475727
254	2	174	f	\N	2018-05-25 09:29:35.488947	2018-05-25 09:29:35.488947
255	2	174	t	\N	2018-05-25 09:29:35.496743	2018-05-25 09:29:35.496743
256	2	175	f	\N	2018-05-25 09:29:35.503936	2018-05-25 09:29:35.503936
257	2	176	t	\N	2018-05-25 09:29:35.513593	2018-05-25 09:29:35.513593
258	0	177	f	\N	2018-05-25 09:29:35.523219	2018-05-25 09:29:35.523219
259	0	178	f	\N	2018-05-25 09:29:35.528583	2018-05-25 09:29:35.528583
260	2	180	f	\N	2018-05-25 09:29:35.535514	2018-05-25 09:29:35.535514
261	0	181	t	\N	2018-05-25 09:29:35.541015	2018-05-25 09:29:35.541015
262	0	181	t	\N	2018-05-25 09:29:35.547005	2018-05-25 09:29:35.547005
263	2	183	f	\N	2018-05-25 09:29:35.554407	2018-05-25 09:29:35.554407
264	0	183	f	\N	2018-05-25 09:29:35.558662	2018-05-25 09:29:35.558662
265	0	183	f	\N	2018-05-25 09:29:35.562838	2018-05-25 09:29:35.562838
266	1	184	t	\N	2018-05-25 09:29:35.575001	2018-05-25 09:29:35.575001
267	1	185	f	\N	2018-05-25 09:29:35.584249	2018-05-25 09:29:35.584249
268	0	185	f	\N	2018-05-25 09:29:35.591855	2018-05-25 09:29:35.591855
269	0	186	t	\N	2018-05-25 09:29:35.605938	2018-05-25 09:29:35.605938
270	1	189	f	\N	2018-05-25 09:29:35.615339	2018-05-25 09:29:35.615339
271	2	189	f	\N	2018-05-25 09:29:35.625085	2018-05-25 09:29:35.625085
272	0	190	f	\N	2018-05-25 09:29:35.632681	2018-05-25 09:29:35.632681
273	2	192	t	\N	2018-05-25 09:29:35.643804	2018-05-25 09:29:35.643804
274	0	192	t	\N	2018-05-25 09:29:35.651148	2018-05-25 09:29:35.651148
275	2	193	t	\N	2018-05-25 09:29:35.661371	2018-05-25 09:29:35.661371
276	2	193	f	\N	2018-05-25 09:29:35.669456	2018-05-25 09:29:35.669456
277	1	193	t	\N	2018-05-25 09:29:35.675362	2018-05-25 09:29:35.675362
278	2	194	f	\N	2018-05-25 09:29:35.68106	2018-05-25 09:29:35.68106
279	1	194	t	\N	2018-05-25 09:29:35.684838	2018-05-25 09:29:35.684838
280	2	195	f	\N	2018-05-25 09:29:35.693255	2018-05-25 09:29:35.693255
281	2	196	t	\N	2018-05-25 09:29:35.698844	2018-05-25 09:29:35.698844
282	2	196	t	\N	2018-05-25 09:29:35.704825	2018-05-25 09:29:35.704825
283	0	197	f	\N	2018-05-25 09:29:35.71319	2018-05-25 09:29:35.71319
284	0	197	f	\N	2018-05-25 09:29:35.722831	2018-05-25 09:29:35.722831
285	2	198	t	\N	2018-05-25 09:29:35.729357	2018-05-25 09:29:35.729357
286	1	199	t	\N	2018-05-25 09:29:35.735824	2018-05-25 09:29:35.735824
287	1	199	t	\N	2018-05-25 09:29:35.745692	2018-05-25 09:29:35.745692
288	0	200	f	\N	2018-05-25 09:29:35.753266	2018-05-25 09:29:35.753266
289	0	200	t	\N	2018-05-25 09:29:35.761187	2018-05-25 09:29:35.761187
\.


--
-- Data for Name: product_options; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.product_options (id, option_id, product_id, deleted_at, created_at, updated_at) FROM stdin;
1	2	1	\N	2018-05-25 09:29:20.934859	2018-05-25 09:29:20.934859
2	3	1	\N	2018-05-25 09:29:20.94494	2018-05-25 09:29:20.94494
3	1	1	\N	2018-05-25 09:29:20.947028	2018-05-25 09:29:20.947028
4	2	2	\N	2018-05-25 09:29:20.951402	2018-05-25 09:29:20.951402
5	3	2	\N	2018-05-25 09:29:20.953312	2018-05-25 09:29:20.953312
6	1	2	\N	2018-05-25 09:29:20.955256	2018-05-25 09:29:20.955256
7	2	3	\N	2018-05-25 09:29:20.95955	2018-05-25 09:29:20.95955
8	3	3	\N	2018-05-25 09:29:20.961549	2018-05-25 09:29:20.961549
9	1	3	\N	2018-05-25 09:29:20.96339	2018-05-25 09:29:20.96339
10	2	4	\N	2018-05-25 09:29:20.967223	2018-05-25 09:29:20.967223
11	3	4	\N	2018-05-25 09:29:20.969132	2018-05-25 09:29:20.969132
12	1	4	\N	2018-05-25 09:29:20.971131	2018-05-25 09:29:20.971131
13	2	5	\N	2018-05-25 09:29:20.975238	2018-05-25 09:29:20.975238
14	3	5	\N	2018-05-25 09:29:20.977238	2018-05-25 09:29:20.977238
15	1	5	\N	2018-05-25 09:29:20.979198	2018-05-25 09:29:20.979198
16	2	6	\N	2018-05-25 09:29:20.982884	2018-05-25 09:29:20.982884
17	3	6	\N	2018-05-25 09:29:20.984896	2018-05-25 09:29:20.984896
18	1	6	\N	2018-05-25 09:29:20.986868	2018-05-25 09:29:20.986868
19	2	7	\N	2018-05-25 09:29:20.990778	2018-05-25 09:29:20.990778
20	3	7	\N	2018-05-25 09:29:20.992613	2018-05-25 09:29:20.992613
21	1	7	\N	2018-05-25 09:29:20.994594	2018-05-25 09:29:20.994594
22	2	8	\N	2018-05-25 09:29:20.998873	2018-05-25 09:29:20.998873
23	3	8	\N	2018-05-25 09:29:21.00081	2018-05-25 09:29:21.00081
24	1	8	\N	2018-05-25 09:29:21.002804	2018-05-25 09:29:21.002804
25	2	9	\N	2018-05-25 09:29:21.007637	2018-05-25 09:29:21.007637
26	3	9	\N	2018-05-25 09:29:21.009464	2018-05-25 09:29:21.009464
27	1	9	\N	2018-05-25 09:29:21.011374	2018-05-25 09:29:21.011374
28	2	10	\N	2018-05-25 09:29:21.015098	2018-05-25 09:29:21.015098
29	3	10	\N	2018-05-25 09:29:21.016804	2018-05-25 09:29:21.016804
30	1	10	\N	2018-05-25 09:29:21.018686	2018-05-25 09:29:21.018686
31	2	11	\N	2018-05-25 09:29:21.022907	2018-05-25 09:29:21.022907
32	3	11	\N	2018-05-25 09:29:21.024781	2018-05-25 09:29:21.024781
33	1	11	\N	2018-05-25 09:29:21.026757	2018-05-25 09:29:21.026757
34	2	12	\N	2018-05-25 09:29:21.030688	2018-05-25 09:29:21.030688
35	3	12	\N	2018-05-25 09:29:21.032543	2018-05-25 09:29:21.032543
36	1	12	\N	2018-05-25 09:29:21.034466	2018-05-25 09:29:21.034466
37	2	13	\N	2018-05-25 09:29:21.038643	2018-05-25 09:29:21.038643
38	3	13	\N	2018-05-25 09:29:21.040685	2018-05-25 09:29:21.040685
39	1	13	\N	2018-05-25 09:29:21.042546	2018-05-25 09:29:21.042546
40	2	14	\N	2018-05-25 09:29:21.046565	2018-05-25 09:29:21.046565
41	3	14	\N	2018-05-25 09:29:21.048435	2018-05-25 09:29:21.048435
42	1	14	\N	2018-05-25 09:29:21.050255	2018-05-25 09:29:21.050255
43	2	15	\N	2018-05-25 09:29:21.054085	2018-05-25 09:29:21.054085
44	3	15	\N	2018-05-25 09:29:21.055832	2018-05-25 09:29:21.055832
45	1	15	\N	2018-05-25 09:29:21.05754	2018-05-25 09:29:21.05754
46	2	16	\N	2018-05-25 09:29:21.061457	2018-05-25 09:29:21.061457
47	3	16	\N	2018-05-25 09:29:21.063432	2018-05-25 09:29:21.063432
48	1	16	\N	2018-05-25 09:29:21.065436	2018-05-25 09:29:21.065436
49	2	17	\N	2018-05-25 09:29:21.07064	2018-05-25 09:29:21.07064
50	3	17	\N	2018-05-25 09:29:21.072816	2018-05-25 09:29:21.072816
51	1	17	\N	2018-05-25 09:29:21.074668	2018-05-25 09:29:21.074668
52	2	18	\N	2018-05-25 09:29:21.078962	2018-05-25 09:29:21.078962
53	3	18	\N	2018-05-25 09:29:21.08083	2018-05-25 09:29:21.08083
54	1	18	\N	2018-05-25 09:29:21.082578	2018-05-25 09:29:21.082578
55	2	19	\N	2018-05-25 09:29:21.086988	2018-05-25 09:29:21.086988
56	3	19	\N	2018-05-25 09:29:21.089298	2018-05-25 09:29:21.089298
57	1	19	\N	2018-05-25 09:29:21.091354	2018-05-25 09:29:21.091354
58	2	20	\N	2018-05-25 09:29:21.095625	2018-05-25 09:29:21.095625
59	3	20	\N	2018-05-25 09:29:21.097914	2018-05-25 09:29:21.097914
60	1	20	\N	2018-05-25 09:29:21.100101	2018-05-25 09:29:21.100101
61	2	21	\N	2018-05-25 09:29:21.106375	2018-05-25 09:29:21.106375
62	3	21	\N	2018-05-25 09:29:21.108432	2018-05-25 09:29:21.108432
63	1	21	\N	2018-05-25 09:29:21.110406	2018-05-25 09:29:21.110406
64	2	22	\N	2018-05-25 09:29:21.114607	2018-05-25 09:29:21.114607
65	3	22	\N	2018-05-25 09:29:21.116492	2018-05-25 09:29:21.116492
66	1	22	\N	2018-05-25 09:29:21.118514	2018-05-25 09:29:21.118514
67	2	23	\N	2018-05-25 09:29:21.122875	2018-05-25 09:29:21.122875
68	3	23	\N	2018-05-25 09:29:21.125182	2018-05-25 09:29:21.125182
69	1	23	\N	2018-05-25 09:29:21.127973	2018-05-25 09:29:21.127973
70	2	24	\N	2018-05-25 09:29:21.132666	2018-05-25 09:29:21.132666
71	3	24	\N	2018-05-25 09:29:21.134641	2018-05-25 09:29:21.134641
72	1	24	\N	2018-05-25 09:29:21.136587	2018-05-25 09:29:21.136587
73	2	25	\N	2018-05-25 09:29:21.142242	2018-05-25 09:29:21.142242
74	3	25	\N	2018-05-25 09:29:21.144352	2018-05-25 09:29:21.144352
75	1	25	\N	2018-05-25 09:29:21.146149	2018-05-25 09:29:21.146149
76	2	26	\N	2018-05-25 09:29:21.150449	2018-05-25 09:29:21.150449
77	3	26	\N	2018-05-25 09:29:21.152223	2018-05-25 09:29:21.152223
78	1	26	\N	2018-05-25 09:29:21.154127	2018-05-25 09:29:21.154127
79	2	27	\N	2018-05-25 09:29:21.158288	2018-05-25 09:29:21.158288
80	3	27	\N	2018-05-25 09:29:21.160206	2018-05-25 09:29:21.160206
81	1	27	\N	2018-05-25 09:29:21.16204	2018-05-25 09:29:21.16204
82	2	28	\N	2018-05-25 09:29:21.166071	2018-05-25 09:29:21.166071
83	3	28	\N	2018-05-25 09:29:21.167804	2018-05-25 09:29:21.167804
84	1	28	\N	2018-05-25 09:29:21.169549	2018-05-25 09:29:21.169549
85	2	29	\N	2018-05-25 09:29:21.173537	2018-05-25 09:29:21.173537
86	3	29	\N	2018-05-25 09:29:21.175668	2018-05-25 09:29:21.175668
87	1	29	\N	2018-05-25 09:29:21.177648	2018-05-25 09:29:21.177648
88	2	30	\N	2018-05-25 09:29:21.181534	2018-05-25 09:29:21.181534
89	3	30	\N	2018-05-25 09:29:21.184163	2018-05-25 09:29:21.184163
90	1	30	\N	2018-05-25 09:29:21.186118	2018-05-25 09:29:21.186118
91	2	31	\N	2018-05-25 09:29:21.19002	2018-05-25 09:29:21.19002
92	3	31	\N	2018-05-25 09:29:21.192136	2018-05-25 09:29:21.192136
93	1	31	\N	2018-05-25 09:29:21.1941	2018-05-25 09:29:21.1941
94	2	32	\N	2018-05-25 09:29:21.198881	2018-05-25 09:29:21.198881
95	3	32	\N	2018-05-25 09:29:21.201279	2018-05-25 09:29:21.201279
96	1	32	\N	2018-05-25 09:29:21.203573	2018-05-25 09:29:21.203573
97	2	33	\N	2018-05-25 09:29:21.209087	2018-05-25 09:29:21.209087
98	3	33	\N	2018-05-25 09:29:21.211141	2018-05-25 09:29:21.211141
99	1	33	\N	2018-05-25 09:29:21.213117	2018-05-25 09:29:21.213117
100	2	34	\N	2018-05-25 09:29:21.217496	2018-05-25 09:29:21.217496
101	3	34	\N	2018-05-25 09:29:21.219295	2018-05-25 09:29:21.219295
102	1	34	\N	2018-05-25 09:29:21.221158	2018-05-25 09:29:21.221158
103	2	35	\N	2018-05-25 09:29:21.225364	2018-05-25 09:29:21.225364
104	3	35	\N	2018-05-25 09:29:21.227368	2018-05-25 09:29:21.227368
105	1	35	\N	2018-05-25 09:29:21.229464	2018-05-25 09:29:21.229464
106	2	36	\N	2018-05-25 09:29:21.233583	2018-05-25 09:29:21.233583
107	3	36	\N	2018-05-25 09:29:21.235463	2018-05-25 09:29:21.235463
108	1	36	\N	2018-05-25 09:29:21.237355	2018-05-25 09:29:21.237355
109	2	37	\N	2018-05-25 09:29:21.240947	2018-05-25 09:29:21.240947
110	3	37	\N	2018-05-25 09:29:21.242831	2018-05-25 09:29:21.242831
111	1	37	\N	2018-05-25 09:29:21.244646	2018-05-25 09:29:21.244646
112	2	38	\N	2018-05-25 09:29:21.248664	2018-05-25 09:29:21.248664
113	3	38	\N	2018-05-25 09:29:21.250415	2018-05-25 09:29:21.250415
114	1	38	\N	2018-05-25 09:29:21.252366	2018-05-25 09:29:21.252366
115	2	39	\N	2018-05-25 09:29:21.256763	2018-05-25 09:29:21.256763
116	3	39	\N	2018-05-25 09:29:21.258685	2018-05-25 09:29:21.258685
117	1	39	\N	2018-05-25 09:29:21.260577	2018-05-25 09:29:21.260577
118	2	40	\N	2018-05-25 09:29:21.264814	2018-05-25 09:29:21.264814
119	3	40	\N	2018-05-25 09:29:21.266659	2018-05-25 09:29:21.266659
120	1	40	\N	2018-05-25 09:29:21.268554	2018-05-25 09:29:21.268554
121	2	41	\N	2018-05-25 09:29:21.273404	2018-05-25 09:29:21.273404
122	3	41	\N	2018-05-25 09:29:21.276319	2018-05-25 09:29:21.276319
123	1	41	\N	2018-05-25 09:29:21.278572	2018-05-25 09:29:21.278572
124	2	42	\N	2018-05-25 09:29:21.284168	2018-05-25 09:29:21.284168
125	3	42	\N	2018-05-25 09:29:21.28632	2018-05-25 09:29:21.28632
126	1	42	\N	2018-05-25 09:29:21.288549	2018-05-25 09:29:21.288549
127	2	43	\N	2018-05-25 09:29:21.293369	2018-05-25 09:29:21.293369
128	3	43	\N	2018-05-25 09:29:21.295777	2018-05-25 09:29:21.295777
129	1	43	\N	2018-05-25 09:29:21.298334	2018-05-25 09:29:21.298334
130	2	44	\N	2018-05-25 09:29:21.303602	2018-05-25 09:29:21.303602
131	3	44	\N	2018-05-25 09:29:21.306012	2018-05-25 09:29:21.306012
132	1	44	\N	2018-05-25 09:29:21.308378	2018-05-25 09:29:21.308378
133	2	45	\N	2018-05-25 09:29:21.313633	2018-05-25 09:29:21.313633
134	3	45	\N	2018-05-25 09:29:21.316117	2018-05-25 09:29:21.316117
135	1	45	\N	2018-05-25 09:29:21.318544	2018-05-25 09:29:21.318544
136	2	46	\N	2018-05-25 09:29:21.323584	2018-05-25 09:29:21.323584
137	3	46	\N	2018-05-25 09:29:21.325948	2018-05-25 09:29:21.325948
138	1	46	\N	2018-05-25 09:29:21.328271	2018-05-25 09:29:21.328271
139	2	47	\N	2018-05-25 09:29:21.333662	2018-05-25 09:29:21.333662
140	3	47	\N	2018-05-25 09:29:21.336116	2018-05-25 09:29:21.336116
141	1	47	\N	2018-05-25 09:29:21.338563	2018-05-25 09:29:21.338563
142	2	48	\N	2018-05-25 09:29:21.343924	2018-05-25 09:29:21.343924
143	3	48	\N	2018-05-25 09:29:21.346331	2018-05-25 09:29:21.346331
144	1	48	\N	2018-05-25 09:29:21.348691	2018-05-25 09:29:21.348691
145	2	49	\N	2018-05-25 09:29:21.355356	2018-05-25 09:29:21.355356
146	3	49	\N	2018-05-25 09:29:21.357803	2018-05-25 09:29:21.357803
147	1	49	\N	2018-05-25 09:29:21.359907	2018-05-25 09:29:21.359907
148	2	50	\N	2018-05-25 09:29:21.363972	2018-05-25 09:29:21.363972
149	3	50	\N	2018-05-25 09:29:21.365748	2018-05-25 09:29:21.365748
150	1	50	\N	2018-05-25 09:29:21.367889	2018-05-25 09:29:21.367889
151	2	51	\N	2018-05-25 09:29:21.372308	2018-05-25 09:29:21.372308
152	3	51	\N	2018-05-25 09:29:21.374349	2018-05-25 09:29:21.374349
153	1	51	\N	2018-05-25 09:29:21.376386	2018-05-25 09:29:21.376386
154	2	52	\N	2018-05-25 09:29:21.38058	2018-05-25 09:29:21.38058
155	3	52	\N	2018-05-25 09:29:21.382449	2018-05-25 09:29:21.382449
156	1	52	\N	2018-05-25 09:29:21.384221	2018-05-25 09:29:21.384221
157	2	53	\N	2018-05-25 09:29:21.387999	2018-05-25 09:29:21.387999
158	3	53	\N	2018-05-25 09:29:21.389773	2018-05-25 09:29:21.389773
159	1	53	\N	2018-05-25 09:29:21.391744	2018-05-25 09:29:21.391744
160	2	54	\N	2018-05-25 09:29:21.395646	2018-05-25 09:29:21.395646
161	3	54	\N	2018-05-25 09:29:21.397507	2018-05-25 09:29:21.397507
162	1	54	\N	2018-05-25 09:29:21.399319	2018-05-25 09:29:21.399319
163	2	55	\N	2018-05-25 09:29:21.403726	2018-05-25 09:29:21.403726
164	3	55	\N	2018-05-25 09:29:21.405581	2018-05-25 09:29:21.405581
165	1	55	\N	2018-05-25 09:29:21.407497	2018-05-25 09:29:21.407497
166	2	56	\N	2018-05-25 09:29:21.41153	2018-05-25 09:29:21.41153
167	3	56	\N	2018-05-25 09:29:21.413405	2018-05-25 09:29:21.413405
168	1	56	\N	2018-05-25 09:29:21.415363	2018-05-25 09:29:21.415363
169	2	57	\N	2018-05-25 09:29:21.420181	2018-05-25 09:29:21.420181
170	3	57	\N	2018-05-25 09:29:21.422473	2018-05-25 09:29:21.422473
171	1	57	\N	2018-05-25 09:29:21.424736	2018-05-25 09:29:21.424736
172	2	58	\N	2018-05-25 09:29:21.429696	2018-05-25 09:29:21.429696
173	3	58	\N	2018-05-25 09:29:21.431704	2018-05-25 09:29:21.431704
174	1	58	\N	2018-05-25 09:29:21.433634	2018-05-25 09:29:21.433634
175	2	59	\N	2018-05-25 09:29:21.4377	2018-05-25 09:29:21.4377
176	3	59	\N	2018-05-25 09:29:21.439702	2018-05-25 09:29:21.439702
177	1	59	\N	2018-05-25 09:29:21.441802	2018-05-25 09:29:21.441802
178	2	60	\N	2018-05-25 09:29:21.445553	2018-05-25 09:29:21.445553
179	3	60	\N	2018-05-25 09:29:21.447385	2018-05-25 09:29:21.447385
180	1	60	\N	2018-05-25 09:29:21.449497	2018-05-25 09:29:21.449497
181	2	61	\N	2018-05-25 09:29:21.453347	2018-05-25 09:29:21.453347
182	3	61	\N	2018-05-25 09:29:21.45519	2018-05-25 09:29:21.45519
183	1	61	\N	2018-05-25 09:29:21.457094	2018-05-25 09:29:21.457094
184	2	62	\N	2018-05-25 09:29:21.461336	2018-05-25 09:29:21.461336
185	3	62	\N	2018-05-25 09:29:21.463305	2018-05-25 09:29:21.463305
186	1	62	\N	2018-05-25 09:29:21.465273	2018-05-25 09:29:21.465273
187	2	63	\N	2018-05-25 09:29:21.46919	2018-05-25 09:29:21.46919
188	3	63	\N	2018-05-25 09:29:21.47085	2018-05-25 09:29:21.47085
189	1	63	\N	2018-05-25 09:29:21.472943	2018-05-25 09:29:21.472943
190	2	64	\N	2018-05-25 09:29:21.476876	2018-05-25 09:29:21.476876
191	3	64	\N	2018-05-25 09:29:21.478892	2018-05-25 09:29:21.478892
192	1	64	\N	2018-05-25 09:29:21.480859	2018-05-25 09:29:21.480859
193	2	65	\N	2018-05-25 09:29:21.486446	2018-05-25 09:29:21.486446
194	3	65	\N	2018-05-25 09:29:21.488767	2018-05-25 09:29:21.488767
195	1	65	\N	2018-05-25 09:29:21.491559	2018-05-25 09:29:21.491559
196	2	66	\N	2018-05-25 09:29:21.496974	2018-05-25 09:29:21.496974
197	3	66	\N	2018-05-25 09:29:21.499164	2018-05-25 09:29:21.499164
198	1	66	\N	2018-05-25 09:29:21.501246	2018-05-25 09:29:21.501246
199	2	67	\N	2018-05-25 09:29:21.50578	2018-05-25 09:29:21.50578
200	3	67	\N	2018-05-25 09:29:21.507853	2018-05-25 09:29:21.507853
201	1	67	\N	2018-05-25 09:29:21.509792	2018-05-25 09:29:21.509792
202	2	68	\N	2018-05-25 09:29:21.513954	2018-05-25 09:29:21.513954
203	3	68	\N	2018-05-25 09:29:21.515869	2018-05-25 09:29:21.515869
204	1	68	\N	2018-05-25 09:29:21.517649	2018-05-25 09:29:21.517649
205	2	69	\N	2018-05-25 09:29:21.521808	2018-05-25 09:29:21.521808
206	3	69	\N	2018-05-25 09:29:21.523719	2018-05-25 09:29:21.523719
207	1	69	\N	2018-05-25 09:29:21.525597	2018-05-25 09:29:21.525597
208	2	70	\N	2018-05-25 09:29:21.530417	2018-05-25 09:29:21.530417
209	3	70	\N	2018-05-25 09:29:21.532343	2018-05-25 09:29:21.532343
210	1	70	\N	2018-05-25 09:29:21.534284	2018-05-25 09:29:21.534284
211	2	71	\N	2018-05-25 09:29:21.538072	2018-05-25 09:29:21.538072
212	3	71	\N	2018-05-25 09:29:21.540019	2018-05-25 09:29:21.540019
213	1	71	\N	2018-05-25 09:29:21.54233	2018-05-25 09:29:21.54233
214	2	72	\N	2018-05-25 09:29:21.546179	2018-05-25 09:29:21.546179
215	3	72	\N	2018-05-25 09:29:21.54821	2018-05-25 09:29:21.54821
216	1	72	\N	2018-05-25 09:29:21.550221	2018-05-25 09:29:21.550221
217	2	73	\N	2018-05-25 09:29:21.554822	2018-05-25 09:29:21.554822
218	3	73	\N	2018-05-25 09:29:21.556922	2018-05-25 09:29:21.556922
219	1	73	\N	2018-05-25 09:29:21.558845	2018-05-25 09:29:21.558845
220	2	74	\N	2018-05-25 09:29:21.563275	2018-05-25 09:29:21.563275
221	3	74	\N	2018-05-25 09:29:21.565314	2018-05-25 09:29:21.565314
222	1	74	\N	2018-05-25 09:29:21.567304	2018-05-25 09:29:21.567304
223	2	75	\N	2018-05-25 09:29:21.571091	2018-05-25 09:29:21.571091
224	3	75	\N	2018-05-25 09:29:21.572889	2018-05-25 09:29:21.572889
225	1	75	\N	2018-05-25 09:29:21.574833	2018-05-25 09:29:21.574833
226	2	76	\N	2018-05-25 09:29:21.579272	2018-05-25 09:29:21.579272
227	3	76	\N	2018-05-25 09:29:21.581152	2018-05-25 09:29:21.581152
228	1	76	\N	2018-05-25 09:29:21.583008	2018-05-25 09:29:21.583008
229	2	77	\N	2018-05-25 09:29:21.586908	2018-05-25 09:29:21.586908
230	3	77	\N	2018-05-25 09:29:21.588734	2018-05-25 09:29:21.588734
231	1	77	\N	2018-05-25 09:29:21.590902	2018-05-25 09:29:21.590902
232	2	78	\N	2018-05-25 09:29:21.59506	2018-05-25 09:29:21.59506
233	3	78	\N	2018-05-25 09:29:21.597075	2018-05-25 09:29:21.597075
234	1	78	\N	2018-05-25 09:29:21.599272	2018-05-25 09:29:21.599272
235	2	79	\N	2018-05-25 09:29:21.604833	2018-05-25 09:29:21.604833
236	3	79	\N	2018-05-25 09:29:21.607022	2018-05-25 09:29:21.607022
237	1	79	\N	2018-05-25 09:29:21.609495	2018-05-25 09:29:21.609495
238	2	80	\N	2018-05-25 09:29:21.613504	2018-05-25 09:29:21.613504
239	3	80	\N	2018-05-25 09:29:21.615314	2018-05-25 09:29:21.615314
240	1	80	\N	2018-05-25 09:29:21.617018	2018-05-25 09:29:21.617018
241	2	81	\N	2018-05-25 09:29:21.621546	2018-05-25 09:29:21.621546
242	3	81	\N	2018-05-25 09:29:21.624266	2018-05-25 09:29:21.624266
243	1	81	\N	2018-05-25 09:29:21.626707	2018-05-25 09:29:21.626707
244	2	82	\N	2018-05-25 09:29:21.631145	2018-05-25 09:29:21.631145
245	3	82	\N	2018-05-25 09:29:21.632973	2018-05-25 09:29:21.632973
246	1	82	\N	2018-05-25 09:29:21.634906	2018-05-25 09:29:21.634906
247	2	83	\N	2018-05-25 09:29:21.639577	2018-05-25 09:29:21.639577
248	3	83	\N	2018-05-25 09:29:21.643019	2018-05-25 09:29:21.643019
249	1	83	\N	2018-05-25 09:29:21.645128	2018-05-25 09:29:21.645128
250	2	84	\N	2018-05-25 09:29:21.649628	2018-05-25 09:29:21.649628
251	3	84	\N	2018-05-25 09:29:21.651497	2018-05-25 09:29:21.651497
252	1	84	\N	2018-05-25 09:29:21.653278	2018-05-25 09:29:21.653278
253	2	85	\N	2018-05-25 09:29:21.659445	2018-05-25 09:29:21.659445
254	3	85	\N	2018-05-25 09:29:21.662016	2018-05-25 09:29:21.662016
255	1	85	\N	2018-05-25 09:29:21.66469	2018-05-25 09:29:21.66469
256	2	86	\N	2018-05-25 09:29:21.669483	2018-05-25 09:29:21.669483
257	3	86	\N	2018-05-25 09:29:21.671755	2018-05-25 09:29:21.671755
258	1	86	\N	2018-05-25 09:29:21.67465	2018-05-25 09:29:21.67465
259	2	87	\N	2018-05-25 09:29:21.682286	2018-05-25 09:29:21.682286
260	3	87	\N	2018-05-25 09:29:21.684951	2018-05-25 09:29:21.684951
261	1	87	\N	2018-05-25 09:29:21.688489	2018-05-25 09:29:21.688489
262	2	88	\N	2018-05-25 09:29:21.695915	2018-05-25 09:29:21.695915
263	3	88	\N	2018-05-25 09:29:21.7016	2018-05-25 09:29:21.7016
264	1	88	\N	2018-05-25 09:29:21.703917	2018-05-25 09:29:21.703917
265	2	89	\N	2018-05-25 09:29:21.709319	2018-05-25 09:29:21.709319
266	3	89	\N	2018-05-25 09:29:21.711888	2018-05-25 09:29:21.711888
267	1	89	\N	2018-05-25 09:29:21.714968	2018-05-25 09:29:21.714968
268	2	90	\N	2018-05-25 09:29:21.720234	2018-05-25 09:29:21.720234
269	3	90	\N	2018-05-25 09:29:21.722245	2018-05-25 09:29:21.722245
270	1	90	\N	2018-05-25 09:29:21.724889	2018-05-25 09:29:21.724889
271	2	91	\N	2018-05-25 09:29:21.730534	2018-05-25 09:29:21.730534
272	3	91	\N	2018-05-25 09:29:21.732485	2018-05-25 09:29:21.732485
273	1	91	\N	2018-05-25 09:29:21.734485	2018-05-25 09:29:21.734485
274	2	92	\N	2018-05-25 09:29:21.738776	2018-05-25 09:29:21.738776
275	3	92	\N	2018-05-25 09:29:21.74119	2018-05-25 09:29:21.74119
276	1	92	\N	2018-05-25 09:29:21.743297	2018-05-25 09:29:21.743297
277	2	93	\N	2018-05-25 09:29:21.747974	2018-05-25 09:29:21.747974
278	3	93	\N	2018-05-25 09:29:21.74983	2018-05-25 09:29:21.74983
279	1	93	\N	2018-05-25 09:29:21.751728	2018-05-25 09:29:21.751728
280	2	94	\N	2018-05-25 09:29:21.755994	2018-05-25 09:29:21.755994
281	3	94	\N	2018-05-25 09:29:21.758218	2018-05-25 09:29:21.758218
282	1	94	\N	2018-05-25 09:29:21.76012	2018-05-25 09:29:21.76012
283	2	95	\N	2018-05-25 09:29:21.764711	2018-05-25 09:29:21.764711
284	3	95	\N	2018-05-25 09:29:21.768469	2018-05-25 09:29:21.768469
285	1	95	\N	2018-05-25 09:29:21.771447	2018-05-25 09:29:21.771447
286	2	96	\N	2018-05-25 09:29:21.778448	2018-05-25 09:29:21.778448
287	3	96	\N	2018-05-25 09:29:21.78112	2018-05-25 09:29:21.78112
288	1	96	\N	2018-05-25 09:29:21.783749	2018-05-25 09:29:21.783749
289	2	97	\N	2018-05-25 09:29:21.790622	2018-05-25 09:29:21.790622
290	3	97	\N	2018-05-25 09:29:21.79323	2018-05-25 09:29:21.79323
291	1	97	\N	2018-05-25 09:29:21.795457	2018-05-25 09:29:21.795457
292	2	98	\N	2018-05-25 09:29:21.800831	2018-05-25 09:29:21.800831
293	3	98	\N	2018-05-25 09:29:21.803624	2018-05-25 09:29:21.803624
294	1	98	\N	2018-05-25 09:29:21.806205	2018-05-25 09:29:21.806205
295	2	99	\N	2018-05-25 09:29:21.811675	2018-05-25 09:29:21.811675
296	3	99	\N	2018-05-25 09:29:21.814182	2018-05-25 09:29:21.814182
297	1	99	\N	2018-05-25 09:29:21.816611	2018-05-25 09:29:21.816611
298	2	100	\N	2018-05-25 09:29:21.821881	2018-05-25 09:29:21.821881
299	3	100	\N	2018-05-25 09:29:21.824387	2018-05-25 09:29:21.824387
300	1	100	\N	2018-05-25 09:29:21.826956	2018-05-25 09:29:21.826956
301	2	101	\N	2018-05-25 09:29:21.831779	2018-05-25 09:29:21.831779
302	3	101	\N	2018-05-25 09:29:21.833695	2018-05-25 09:29:21.833695
303	1	101	\N	2018-05-25 09:29:21.835521	2018-05-25 09:29:21.835521
304	2	102	\N	2018-05-25 09:29:21.839652	2018-05-25 09:29:21.839652
305	3	102	\N	2018-05-25 09:29:21.842143	2018-05-25 09:29:21.842143
306	1	102	\N	2018-05-25 09:29:21.844247	2018-05-25 09:29:21.844247
307	2	103	\N	2018-05-25 09:29:21.848469	2018-05-25 09:29:21.848469
308	3	103	\N	2018-05-25 09:29:21.850429	2018-05-25 09:29:21.850429
309	1	103	\N	2018-05-25 09:29:21.852317	2018-05-25 09:29:21.852317
310	2	104	\N	2018-05-25 09:29:21.856873	2018-05-25 09:29:21.856873
311	3	104	\N	2018-05-25 09:29:21.859258	2018-05-25 09:29:21.859258
312	1	104	\N	2018-05-25 09:29:21.86124	2018-05-25 09:29:21.86124
313	2	105	\N	2018-05-25 09:29:21.866203	2018-05-25 09:29:21.866203
314	3	105	\N	2018-05-25 09:29:21.868176	2018-05-25 09:29:21.868176
315	1	105	\N	2018-05-25 09:29:21.870102	2018-05-25 09:29:21.870102
316	2	106	\N	2018-05-25 09:29:21.874276	2018-05-25 09:29:21.874276
317	3	106	\N	2018-05-25 09:29:21.876737	2018-05-25 09:29:21.876737
318	1	106	\N	2018-05-25 09:29:21.878838	2018-05-25 09:29:21.878838
319	2	107	\N	2018-05-25 09:29:21.883033	2018-05-25 09:29:21.883033
320	3	107	\N	2018-05-25 09:29:21.885005	2018-05-25 09:29:21.885005
321	1	107	\N	2018-05-25 09:29:21.886834	2018-05-25 09:29:21.886834
322	2	108	\N	2018-05-25 09:29:21.891263	2018-05-25 09:29:21.891263
323	3	108	\N	2018-05-25 09:29:21.89347	2018-05-25 09:29:21.89347
324	1	108	\N	2018-05-25 09:29:21.89527	2018-05-25 09:29:21.89527
325	2	109	\N	2018-05-25 09:29:21.899332	2018-05-25 09:29:21.899332
326	3	109	\N	2018-05-25 09:29:21.901146	2018-05-25 09:29:21.901146
327	1	109	\N	2018-05-25 09:29:21.903009	2018-05-25 09:29:21.903009
328	2	110	\N	2018-05-25 09:29:21.906927	2018-05-25 09:29:21.906927
329	3	110	\N	2018-05-25 09:29:21.909271	2018-05-25 09:29:21.909271
330	1	110	\N	2018-05-25 09:29:21.911214	2018-05-25 09:29:21.911214
331	2	111	\N	2018-05-25 09:29:21.915206	2018-05-25 09:29:21.915206
332	3	111	\N	2018-05-25 09:29:21.917085	2018-05-25 09:29:21.917085
333	1	111	\N	2018-05-25 09:29:21.918854	2018-05-25 09:29:21.918854
334	2	112	\N	2018-05-25 09:29:21.922703	2018-05-25 09:29:21.922703
335	3	112	\N	2018-05-25 09:29:21.92515	2018-05-25 09:29:21.92515
336	1	112	\N	2018-05-25 09:29:21.927673	2018-05-25 09:29:21.927673
337	2	113	\N	2018-05-25 09:29:21.932598	2018-05-25 09:29:21.932598
338	3	113	\N	2018-05-25 09:29:21.934662	2018-05-25 09:29:21.934662
339	1	113	\N	2018-05-25 09:29:21.936513	2018-05-25 09:29:21.936513
340	2	114	\N	2018-05-25 09:29:21.940682	2018-05-25 09:29:21.940682
341	3	114	\N	2018-05-25 09:29:21.942919	2018-05-25 09:29:21.942919
342	1	114	\N	2018-05-25 09:29:21.944779	2018-05-25 09:29:21.944779
343	2	115	\N	2018-05-25 09:29:21.948785	2018-05-25 09:29:21.948785
344	3	115	\N	2018-05-25 09:29:21.950682	2018-05-25 09:29:21.950682
345	1	115	\N	2018-05-25 09:29:21.952474	2018-05-25 09:29:21.952474
346	2	116	\N	2018-05-25 09:29:21.956291	2018-05-25 09:29:21.956291
347	3	116	\N	2018-05-25 09:29:21.958409	2018-05-25 09:29:21.958409
348	1	116	\N	2018-05-25 09:29:21.960428	2018-05-25 09:29:21.960428
349	2	117	\N	2018-05-25 09:29:21.964718	2018-05-25 09:29:21.964718
350	3	117	\N	2018-05-25 09:29:21.966564	2018-05-25 09:29:21.966564
351	1	117	\N	2018-05-25 09:29:21.96844	2018-05-25 09:29:21.96844
352	2	118	\N	2018-05-25 09:29:21.972384	2018-05-25 09:29:21.972384
353	3	118	\N	2018-05-25 09:29:21.974361	2018-05-25 09:29:21.974361
354	1	118	\N	2018-05-25 09:29:21.976598	2018-05-25 09:29:21.976598
355	2	119	\N	2018-05-25 09:29:21.980887	2018-05-25 09:29:21.980887
356	3	119	\N	2018-05-25 09:29:21.982842	2018-05-25 09:29:21.982842
357	1	119	\N	2018-05-25 09:29:21.984744	2018-05-25 09:29:21.984744
358	2	120	\N	2018-05-25 09:29:21.988716	2018-05-25 09:29:21.988716
359	3	120	\N	2018-05-25 09:29:21.990794	2018-05-25 09:29:21.990794
360	1	120	\N	2018-05-25 09:29:21.992893	2018-05-25 09:29:21.992893
361	2	121	\N	2018-05-25 09:29:21.997452	2018-05-25 09:29:21.997452
362	3	121	\N	2018-05-25 09:29:21.999907	2018-05-25 09:29:21.999907
363	1	121	\N	2018-05-25 09:29:22.002196	2018-05-25 09:29:22.002196
364	2	122	\N	2018-05-25 09:29:22.006702	2018-05-25 09:29:22.006702
365	3	122	\N	2018-05-25 09:29:22.009426	2018-05-25 09:29:22.009426
366	1	122	\N	2018-05-25 09:29:22.011919	2018-05-25 09:29:22.011919
367	2	123	\N	2018-05-25 09:29:22.016662	2018-05-25 09:29:22.016662
368	3	123	\N	2018-05-25 09:29:22.018931	2018-05-25 09:29:22.018931
369	1	123	\N	2018-05-25 09:29:22.021111	2018-05-25 09:29:22.021111
370	2	124	\N	2018-05-25 09:29:22.026041	2018-05-25 09:29:22.026041
371	3	124	\N	2018-05-25 09:29:22.028074	2018-05-25 09:29:22.028074
372	1	124	\N	2018-05-25 09:29:22.030034	2018-05-25 09:29:22.030034
373	2	125	\N	2018-05-25 09:29:22.034347	2018-05-25 09:29:22.034347
374	3	125	\N	2018-05-25 09:29:22.03626	2018-05-25 09:29:22.03626
375	1	125	\N	2018-05-25 09:29:22.038278	2018-05-25 09:29:22.038278
376	2	126	\N	2018-05-25 09:29:22.043162	2018-05-25 09:29:22.043162
377	3	126	\N	2018-05-25 09:29:22.045072	2018-05-25 09:29:22.045072
378	1	126	\N	2018-05-25 09:29:22.047259	2018-05-25 09:29:22.047259
379	2	127	\N	2018-05-25 09:29:22.051653	2018-05-25 09:29:22.051653
380	3	127	\N	2018-05-25 09:29:22.053891	2018-05-25 09:29:22.053891
381	1	127	\N	2018-05-25 09:29:22.055991	2018-05-25 09:29:22.055991
382	2	128	\N	2018-05-25 09:29:22.06096	2018-05-25 09:29:22.06096
383	3	128	\N	2018-05-25 09:29:22.062825	2018-05-25 09:29:22.062825
384	1	128	\N	2018-05-25 09:29:22.064888	2018-05-25 09:29:22.064888
385	2	129	\N	2018-05-25 09:29:22.069961	2018-05-25 09:29:22.069961
386	3	129	\N	2018-05-25 09:29:22.072029	2018-05-25 09:29:22.072029
387	1	129	\N	2018-05-25 09:29:22.074138	2018-05-25 09:29:22.074138
388	2	130	\N	2018-05-25 09:29:22.078635	2018-05-25 09:29:22.078635
389	3	130	\N	2018-05-25 09:29:22.080673	2018-05-25 09:29:22.080673
390	1	130	\N	2018-05-25 09:29:22.082756	2018-05-25 09:29:22.082756
391	2	131	\N	2018-05-25 09:29:22.08673	2018-05-25 09:29:22.08673
392	3	131	\N	2018-05-25 09:29:22.088816	2018-05-25 09:29:22.088816
393	1	131	\N	2018-05-25 09:29:22.090873	2018-05-25 09:29:22.090873
394	2	132	\N	2018-05-25 09:29:22.095531	2018-05-25 09:29:22.095531
395	3	132	\N	2018-05-25 09:29:22.097749	2018-05-25 09:29:22.097749
396	1	132	\N	2018-05-25 09:29:22.100026	2018-05-25 09:29:22.100026
397	2	133	\N	2018-05-25 09:29:22.10612	2018-05-25 09:29:22.10612
398	3	133	\N	2018-05-25 09:29:22.108819	2018-05-25 09:29:22.108819
399	1	133	\N	2018-05-25 09:29:22.111032	2018-05-25 09:29:22.111032
400	2	134	\N	2018-05-25 09:29:22.115469	2018-05-25 09:29:22.115469
401	3	134	\N	2018-05-25 09:29:22.117527	2018-05-25 09:29:22.117527
402	1	134	\N	2018-05-25 09:29:22.119774	2018-05-25 09:29:22.119774
403	2	135	\N	2018-05-25 09:29:22.125015	2018-05-25 09:29:22.125015
404	3	135	\N	2018-05-25 09:29:22.127842	2018-05-25 09:29:22.127842
405	1	135	\N	2018-05-25 09:29:22.129977	2018-05-25 09:29:22.129977
406	2	136	\N	2018-05-25 09:29:22.134113	2018-05-25 09:29:22.134113
407	3	136	\N	2018-05-25 09:29:22.135968	2018-05-25 09:29:22.135968
408	1	136	\N	2018-05-25 09:29:22.137798	2018-05-25 09:29:22.137798
409	2	137	\N	2018-05-25 09:29:22.143658	2018-05-25 09:29:22.143658
410	3	137	\N	2018-05-25 09:29:22.145798	2018-05-25 09:29:22.145798
411	1	137	\N	2018-05-25 09:29:22.147803	2018-05-25 09:29:22.147803
412	2	138	\N	2018-05-25 09:29:22.151966	2018-05-25 09:29:22.151966
413	3	138	\N	2018-05-25 09:29:22.153903	2018-05-25 09:29:22.153903
414	1	138	\N	2018-05-25 09:29:22.155946	2018-05-25 09:29:22.155946
415	2	139	\N	2018-05-25 09:29:22.160529	2018-05-25 09:29:22.160529
416	3	139	\N	2018-05-25 09:29:22.162678	2018-05-25 09:29:22.162678
417	1	139	\N	2018-05-25 09:29:22.164679	2018-05-25 09:29:22.164679
418	2	140	\N	2018-05-25 09:29:22.169033	2018-05-25 09:29:22.169033
419	3	140	\N	2018-05-25 09:29:22.171152	2018-05-25 09:29:22.171152
420	1	140	\N	2018-05-25 09:29:22.172934	2018-05-25 09:29:22.172934
421	2	141	\N	2018-05-25 09:29:22.177676	2018-05-25 09:29:22.177676
422	3	141	\N	2018-05-25 09:29:22.179711	2018-05-25 09:29:22.179711
423	1	141	\N	2018-05-25 09:29:22.181799	2018-05-25 09:29:22.181799
424	2	142	\N	2018-05-25 09:29:22.185806	2018-05-25 09:29:22.185806
425	3	142	\N	2018-05-25 09:29:22.187663	2018-05-25 09:29:22.187663
426	1	142	\N	2018-05-25 09:29:22.189614	2018-05-25 09:29:22.189614
427	2	143	\N	2018-05-25 09:29:22.193936	2018-05-25 09:29:22.193936
428	3	143	\N	2018-05-25 09:29:22.195794	2018-05-25 09:29:22.195794
429	1	143	\N	2018-05-25 09:29:22.197723	2018-05-25 09:29:22.197723
430	2	144	\N	2018-05-25 09:29:22.201487	2018-05-25 09:29:22.201487
431	3	144	\N	2018-05-25 09:29:22.203305	2018-05-25 09:29:22.203305
432	1	144	\N	2018-05-25 09:29:22.205054	2018-05-25 09:29:22.205054
433	2	145	\N	2018-05-25 09:29:22.210579	2018-05-25 09:29:22.210579
434	3	145	\N	2018-05-25 09:29:22.212618	2018-05-25 09:29:22.212618
435	1	145	\N	2018-05-25 09:29:22.214687	2018-05-25 09:29:22.214687
436	2	146	\N	2018-05-25 09:29:22.219671	2018-05-25 09:29:22.219671
437	3	146	\N	2018-05-25 09:29:22.222081	2018-05-25 09:29:22.222081
438	1	146	\N	2018-05-25 09:29:22.224414	2018-05-25 09:29:22.224414
439	2	147	\N	2018-05-25 09:29:22.229277	2018-05-25 09:29:22.229277
440	3	147	\N	2018-05-25 09:29:22.231887	2018-05-25 09:29:22.231887
441	1	147	\N	2018-05-25 09:29:22.234237	2018-05-25 09:29:22.234237
442	2	148	\N	2018-05-25 09:29:22.239914	2018-05-25 09:29:22.239914
443	3	148	\N	2018-05-25 09:29:22.242633	2018-05-25 09:29:22.242633
444	1	148	\N	2018-05-25 09:29:22.246252	2018-05-25 09:29:22.246252
445	2	149	\N	2018-05-25 09:29:22.25501	2018-05-25 09:29:22.25501
446	3	149	\N	2018-05-25 09:29:22.259755	2018-05-25 09:29:22.259755
447	1	149	\N	2018-05-25 09:29:22.263092	2018-05-25 09:29:22.263092
448	2	150	\N	2018-05-25 09:29:22.267537	2018-05-25 09:29:22.267537
449	3	150	\N	2018-05-25 09:29:22.26954	2018-05-25 09:29:22.26954
450	1	150	\N	2018-05-25 09:29:22.271889	2018-05-25 09:29:22.271889
451	2	151	\N	2018-05-25 09:29:22.279692	2018-05-25 09:29:22.279692
452	3	151	\N	2018-05-25 09:29:22.282581	2018-05-25 09:29:22.282581
453	1	151	\N	2018-05-25 09:29:22.286388	2018-05-25 09:29:22.286388
454	2	152	\N	2018-05-25 09:29:22.294401	2018-05-25 09:29:22.294401
455	3	152	\N	2018-05-25 09:29:22.298354	2018-05-25 09:29:22.298354
456	1	152	\N	2018-05-25 09:29:22.301926	2018-05-25 09:29:22.301926
457	2	153	\N	2018-05-25 09:29:22.312551	2018-05-25 09:29:22.312551
458	3	153	\N	2018-05-25 09:29:22.315833	2018-05-25 09:29:22.315833
459	1	153	\N	2018-05-25 09:29:22.319015	2018-05-25 09:29:22.319015
460	2	154	\N	2018-05-25 09:29:22.324329	2018-05-25 09:29:22.324329
461	3	154	\N	2018-05-25 09:29:22.328	2018-05-25 09:29:22.328
462	1	154	\N	2018-05-25 09:29:22.331172	2018-05-25 09:29:22.331172
463	2	155	\N	2018-05-25 09:29:22.337247	2018-05-25 09:29:22.337247
464	3	155	\N	2018-05-25 09:29:22.340198	2018-05-25 09:29:22.340198
465	1	155	\N	2018-05-25 09:29:22.344835	2018-05-25 09:29:22.344835
466	2	156	\N	2018-05-25 09:29:22.3532	2018-05-25 09:29:22.3532
467	3	156	\N	2018-05-25 09:29:22.357799	2018-05-25 09:29:22.357799
468	1	156	\N	2018-05-25 09:29:22.365996	2018-05-25 09:29:22.365996
469	2	157	\N	2018-05-25 09:29:22.376285	2018-05-25 09:29:22.376285
470	3	157	\N	2018-05-25 09:29:22.380554	2018-05-25 09:29:22.380554
471	1	157	\N	2018-05-25 09:29:22.384879	2018-05-25 09:29:22.384879
472	2	158	\N	2018-05-25 09:29:22.393238	2018-05-25 09:29:22.393238
473	3	158	\N	2018-05-25 09:29:22.395945	2018-05-25 09:29:22.395945
474	1	158	\N	2018-05-25 09:29:22.399606	2018-05-25 09:29:22.399606
475	2	159	\N	2018-05-25 09:29:22.409977	2018-05-25 09:29:22.409977
476	3	159	\N	2018-05-25 09:29:22.412915	2018-05-25 09:29:22.412915
477	1	159	\N	2018-05-25 09:29:22.417584	2018-05-25 09:29:22.417584
478	2	160	\N	2018-05-25 09:29:22.425895	2018-05-25 09:29:22.425895
479	3	160	\N	2018-05-25 09:29:22.429133	2018-05-25 09:29:22.429133
480	1	160	\N	2018-05-25 09:29:22.434241	2018-05-25 09:29:22.434241
481	2	161	\N	2018-05-25 09:29:22.45495	2018-05-25 09:29:22.45495
482	3	161	\N	2018-05-25 09:29:22.459739	2018-05-25 09:29:22.459739
483	1	161	\N	2018-05-25 09:29:22.465722	2018-05-25 09:29:22.465722
484	2	162	\N	2018-05-25 09:29:22.472364	2018-05-25 09:29:22.472364
485	3	162	\N	2018-05-25 09:29:22.475914	2018-05-25 09:29:22.475914
486	1	162	\N	2018-05-25 09:29:22.481864	2018-05-25 09:29:22.481864
487	2	163	\N	2018-05-25 09:29:22.489541	2018-05-25 09:29:22.489541
488	3	163	\N	2018-05-25 09:29:22.493673	2018-05-25 09:29:22.493673
489	1	163	\N	2018-05-25 09:29:22.498248	2018-05-25 09:29:22.498248
490	2	164	\N	2018-05-25 09:29:22.504941	2018-05-25 09:29:22.504941
491	3	164	\N	2018-05-25 09:29:22.507481	2018-05-25 09:29:22.507481
492	1	164	\N	2018-05-25 09:29:22.511811	2018-05-25 09:29:22.511811
493	2	165	\N	2018-05-25 09:29:22.516646	2018-05-25 09:29:22.516646
494	3	165	\N	2018-05-25 09:29:22.518707	2018-05-25 09:29:22.518707
495	1	165	\N	2018-05-25 09:29:22.520852	2018-05-25 09:29:22.520852
496	2	166	\N	2018-05-25 09:29:22.528364	2018-05-25 09:29:22.528364
497	3	166	\N	2018-05-25 09:29:22.530603	2018-05-25 09:29:22.530603
498	1	166	\N	2018-05-25 09:29:22.532831	2018-05-25 09:29:22.532831
499	2	167	\N	2018-05-25 09:29:22.537666	2018-05-25 09:29:22.537666
500	3	167	\N	2018-05-25 09:29:22.539832	2018-05-25 09:29:22.539832
501	1	167	\N	2018-05-25 09:29:22.541831	2018-05-25 09:29:22.541831
502	2	168	\N	2018-05-25 09:29:22.545848	2018-05-25 09:29:22.545848
503	3	168	\N	2018-05-25 09:29:22.547681	2018-05-25 09:29:22.547681
504	1	168	\N	2018-05-25 09:29:22.549661	2018-05-25 09:29:22.549661
505	2	169	\N	2018-05-25 09:29:22.554649	2018-05-25 09:29:22.554649
506	3	169	\N	2018-05-25 09:29:22.556581	2018-05-25 09:29:22.556581
507	1	169	\N	2018-05-25 09:29:22.558367	2018-05-25 09:29:22.558367
508	2	170	\N	2018-05-25 09:29:22.56217	2018-05-25 09:29:22.56217
509	3	170	\N	2018-05-25 09:29:22.563888	2018-05-25 09:29:22.563888
510	1	170	\N	2018-05-25 09:29:22.565579	2018-05-25 09:29:22.565579
511	2	171	\N	2018-05-25 09:29:22.5697	2018-05-25 09:29:22.5697
512	3	171	\N	2018-05-25 09:29:22.571785	2018-05-25 09:29:22.571785
513	1	171	\N	2018-05-25 09:29:22.57371	2018-05-25 09:29:22.57371
514	2	172	\N	2018-05-25 09:29:22.578469	2018-05-25 09:29:22.578469
515	3	172	\N	2018-05-25 09:29:22.58072	2018-05-25 09:29:22.58072
516	1	172	\N	2018-05-25 09:29:22.583809	2018-05-25 09:29:22.583809
517	2	173	\N	2018-05-25 09:29:22.58834	2018-05-25 09:29:22.58834
518	3	173	\N	2018-05-25 09:29:22.590339	2018-05-25 09:29:22.590339
519	1	173	\N	2018-05-25 09:29:22.592346	2018-05-25 09:29:22.592346
520	2	174	\N	2018-05-25 09:29:22.59667	2018-05-25 09:29:22.59667
521	3	174	\N	2018-05-25 09:29:22.598826	2018-05-25 09:29:22.598826
522	1	174	\N	2018-05-25 09:29:22.600838	2018-05-25 09:29:22.600838
523	2	175	\N	2018-05-25 09:29:22.606062	2018-05-25 09:29:22.606062
524	3	175	\N	2018-05-25 09:29:22.607931	2018-05-25 09:29:22.607931
525	1	175	\N	2018-05-25 09:29:22.609849	2018-05-25 09:29:22.609849
526	2	176	\N	2018-05-25 09:29:22.613927	2018-05-25 09:29:22.613927
527	3	176	\N	2018-05-25 09:29:22.615839	2018-05-25 09:29:22.615839
528	1	176	\N	2018-05-25 09:29:22.617423	2018-05-25 09:29:22.617423
529	2	177	\N	2018-05-25 09:29:22.622614	2018-05-25 09:29:22.622614
530	3	177	\N	2018-05-25 09:29:22.624918	2018-05-25 09:29:22.624918
531	1	177	\N	2018-05-25 09:29:22.627092	2018-05-25 09:29:22.627092
532	2	178	\N	2018-05-25 09:29:22.63165	2018-05-25 09:29:22.63165
533	3	178	\N	2018-05-25 09:29:22.633685	2018-05-25 09:29:22.633685
534	1	178	\N	2018-05-25 09:29:22.635663	2018-05-25 09:29:22.635663
535	2	179	\N	2018-05-25 09:29:22.639883	2018-05-25 09:29:22.639883
536	3	179	\N	2018-05-25 09:29:22.641771	2018-05-25 09:29:22.641771
537	1	179	\N	2018-05-25 09:29:22.643938	2018-05-25 09:29:22.643938
538	2	180	\N	2018-05-25 09:29:22.648202	2018-05-25 09:29:22.648202
539	3	180	\N	2018-05-25 09:29:22.650097	2018-05-25 09:29:22.650097
540	1	180	\N	2018-05-25 09:29:22.651927	2018-05-25 09:29:22.651927
541	2	181	\N	2018-05-25 09:29:22.655904	2018-05-25 09:29:22.655904
542	3	181	\N	2018-05-25 09:29:22.657744	2018-05-25 09:29:22.657744
543	1	181	\N	2018-05-25 09:29:22.659608	2018-05-25 09:29:22.659608
544	2	182	\N	2018-05-25 09:29:22.663854	2018-05-25 09:29:22.663854
545	3	182	\N	2018-05-25 09:29:22.665707	2018-05-25 09:29:22.665707
546	1	182	\N	2018-05-25 09:29:22.667921	2018-05-25 09:29:22.667921
547	2	183	\N	2018-05-25 09:29:22.671751	2018-05-25 09:29:22.671751
548	3	183	\N	2018-05-25 09:29:22.673485	2018-05-25 09:29:22.673485
549	1	183	\N	2018-05-25 09:29:22.675338	2018-05-25 09:29:22.675338
550	2	184	\N	2018-05-25 09:29:22.680313	2018-05-25 09:29:22.680313
551	3	184	\N	2018-05-25 09:29:22.682094	2018-05-25 09:29:22.682094
552	1	184	\N	2018-05-25 09:29:22.683909	2018-05-25 09:29:22.683909
553	2	185	\N	2018-05-25 09:29:22.688189	2018-05-25 09:29:22.688189
554	3	185	\N	2018-05-25 09:29:22.690096	2018-05-25 09:29:22.690096
555	1	185	\N	2018-05-25 09:29:22.691948	2018-05-25 09:29:22.691948
556	2	186	\N	2018-05-25 09:29:22.696355	2018-05-25 09:29:22.696355
557	3	186	\N	2018-05-25 09:29:22.69828	2018-05-25 09:29:22.69828
558	1	186	\N	2018-05-25 09:29:22.700153	2018-05-25 09:29:22.700153
559	2	187	\N	2018-05-25 09:29:22.704345	2018-05-25 09:29:22.704345
560	3	187	\N	2018-05-25 09:29:22.706389	2018-05-25 09:29:22.706389
561	1	187	\N	2018-05-25 09:29:22.708412	2018-05-25 09:29:22.708412
562	2	188	\N	2018-05-25 09:29:22.712485	2018-05-25 09:29:22.712485
563	3	188	\N	2018-05-25 09:29:22.714423	2018-05-25 09:29:22.714423
564	1	188	\N	2018-05-25 09:29:22.716307	2018-05-25 09:29:22.716307
565	2	189	\N	2018-05-25 09:29:22.720491	2018-05-25 09:29:22.720491
566	3	189	\N	2018-05-25 09:29:22.722488	2018-05-25 09:29:22.722488
567	1	189	\N	2018-05-25 09:29:22.724471	2018-05-25 09:29:22.724471
568	2	190	\N	2018-05-25 09:29:22.728965	2018-05-25 09:29:22.728965
569	3	190	\N	2018-05-25 09:29:22.731694	2018-05-25 09:29:22.731694
570	1	190	\N	2018-05-25 09:29:22.734007	2018-05-25 09:29:22.734007
571	2	191	\N	2018-05-25 09:29:22.738548	2018-05-25 09:29:22.738548
572	3	191	\N	2018-05-25 09:29:22.741953	2018-05-25 09:29:22.741953
573	1	191	\N	2018-05-25 09:29:22.744636	2018-05-25 09:29:22.744636
574	2	192	\N	2018-05-25 09:29:22.75111	2018-05-25 09:29:22.75111
575	3	192	\N	2018-05-25 09:29:22.754055	2018-05-25 09:29:22.754055
576	1	192	\N	2018-05-25 09:29:22.756615	2018-05-25 09:29:22.756615
577	2	193	\N	2018-05-25 09:29:22.765169	2018-05-25 09:29:22.765169
578	3	193	\N	2018-05-25 09:29:22.767111	2018-05-25 09:29:22.767111
579	1	193	\N	2018-05-25 09:29:22.769793	2018-05-25 09:29:22.769793
580	2	194	\N	2018-05-25 09:29:22.775939	2018-05-25 09:29:22.775939
581	3	194	\N	2018-05-25 09:29:22.779316	2018-05-25 09:29:22.779316
582	1	194	\N	2018-05-25 09:29:22.782688	2018-05-25 09:29:22.782688
583	2	195	\N	2018-05-25 09:29:22.788442	2018-05-25 09:29:22.788442
584	3	195	\N	2018-05-25 09:29:22.793309	2018-05-25 09:29:22.793309
585	1	195	\N	2018-05-25 09:29:22.796737	2018-05-25 09:29:22.796737
586	2	196	\N	2018-05-25 09:29:22.802767	2018-05-25 09:29:22.802767
587	3	196	\N	2018-05-25 09:29:22.805273	2018-05-25 09:29:22.805273
588	1	196	\N	2018-05-25 09:29:22.807428	2018-05-25 09:29:22.807428
589	2	197	\N	2018-05-25 09:29:22.816925	2018-05-25 09:29:22.816925
590	3	197	\N	2018-05-25 09:29:22.820307	2018-05-25 09:29:22.820307
591	1	197	\N	2018-05-25 09:29:22.82271	2018-05-25 09:29:22.82271
592	2	198	\N	2018-05-25 09:29:22.833178	2018-05-25 09:29:22.833178
593	3	198	\N	2018-05-25 09:29:22.837003	2018-05-25 09:29:22.837003
594	1	198	\N	2018-05-25 09:29:22.841519	2018-05-25 09:29:22.841519
595	2	199	\N	2018-05-25 09:29:22.849181	2018-05-25 09:29:22.849181
596	3	199	\N	2018-05-25 09:29:22.853036	2018-05-25 09:29:22.853036
597	1	199	\N	2018-05-25 09:29:22.858216	2018-05-25 09:29:22.858216
598	2	200	\N	2018-05-25 09:29:22.864413	2018-05-25 09:29:22.864413
599	3	200	\N	2018-05-25 09:29:22.868174	2018-05-25 09:29:22.868174
600	1	200	\N	2018-05-25 09:29:22.87405	2018-05-25 09:29:22.87405
601	2	201	\N	2018-05-25 09:29:22.884492	2018-05-25 09:29:22.884492
602	3	201	\N	2018-05-25 09:29:22.888643	2018-05-25 09:29:22.888643
603	1	201	\N	2018-05-25 09:29:22.893378	2018-05-25 09:29:22.893378
604	2	202	\N	2018-05-25 09:29:22.901489	2018-05-25 09:29:22.901489
605	3	202	\N	2018-05-25 09:29:22.904601	2018-05-25 09:29:22.904601
606	1	202	\N	2018-05-25 09:29:22.907416	2018-05-25 09:29:22.907416
607	2	203	\N	2018-05-25 09:29:22.914952	2018-05-25 09:29:22.914952
608	3	203	\N	2018-05-25 09:29:22.918256	2018-05-25 09:29:22.918256
609	1	203	\N	2018-05-25 09:29:22.921138	2018-05-25 09:29:22.921138
610	2	204	\N	2018-05-25 09:29:22.930661	2018-05-25 09:29:22.930661
611	3	204	\N	2018-05-25 09:29:22.933317	2018-05-25 09:29:22.933317
612	1	204	\N	2018-05-25 09:29:22.93682	2018-05-25 09:29:22.93682
613	2	205	\N	2018-05-25 09:29:22.942372	2018-05-25 09:29:22.942372
614	3	205	\N	2018-05-25 09:29:22.944821	2018-05-25 09:29:22.944821
615	1	205	\N	2018-05-25 09:29:22.947573	2018-05-25 09:29:22.947573
616	2	206	\N	2018-05-25 09:29:22.952373	2018-05-25 09:29:22.952373
617	3	206	\N	2018-05-25 09:29:22.955035	2018-05-25 09:29:22.955035
618	1	206	\N	2018-05-25 09:29:22.957361	2018-05-25 09:29:22.957361
619	2	207	\N	2018-05-25 09:29:22.962483	2018-05-25 09:29:22.962483
620	3	207	\N	2018-05-25 09:29:22.965059	2018-05-25 09:29:22.965059
621	1	207	\N	2018-05-25 09:29:22.967065	2018-05-25 09:29:22.967065
622	2	208	\N	2018-05-25 09:29:22.971988	2018-05-25 09:29:22.971988
623	3	208	\N	2018-05-25 09:29:22.974446	2018-05-25 09:29:22.974446
624	1	208	\N	2018-05-25 09:29:22.976779	2018-05-25 09:29:22.976779
625	2	209	\N	2018-05-25 09:29:22.983567	2018-05-25 09:29:22.983567
626	3	209	\N	2018-05-25 09:29:22.985939	2018-05-25 09:29:22.985939
627	1	209	\N	2018-05-25 09:29:22.98784	2018-05-25 09:29:22.98784
628	2	210	\N	2018-05-25 09:29:22.992794	2018-05-25 09:29:22.992794
629	3	210	\N	2018-05-25 09:29:22.994768	2018-05-25 09:29:22.994768
630	1	210	\N	2018-05-25 09:29:22.996848	2018-05-25 09:29:22.996848
631	2	211	\N	2018-05-25 09:29:23.002118	2018-05-25 09:29:23.002118
632	3	211	\N	2018-05-25 09:29:23.004169	2018-05-25 09:29:23.004169
633	1	211	\N	2018-05-25 09:29:23.006639	2018-05-25 09:29:23.006639
634	2	212	\N	2018-05-25 09:29:23.011098	2018-05-25 09:29:23.011098
635	3	212	\N	2018-05-25 09:29:23.013531	2018-05-25 09:29:23.013531
636	1	212	\N	2018-05-25 09:29:23.015549	2018-05-25 09:29:23.015549
637	2	213	\N	2018-05-25 09:29:23.020267	2018-05-25 09:29:23.020267
638	3	213	\N	2018-05-25 09:29:23.022346	2018-05-25 09:29:23.022346
639	1	213	\N	2018-05-25 09:29:23.02429	2018-05-25 09:29:23.02429
640	2	214	\N	2018-05-25 09:29:23.029548	2018-05-25 09:29:23.029548
641	3	214	\N	2018-05-25 09:29:23.031498	2018-05-25 09:29:23.031498
642	1	214	\N	2018-05-25 09:29:23.034027	2018-05-25 09:29:23.034027
643	2	215	\N	2018-05-25 09:29:23.038288	2018-05-25 09:29:23.038288
644	3	215	\N	2018-05-25 09:29:23.040581	2018-05-25 09:29:23.040581
645	1	215	\N	2018-05-25 09:29:23.042965	2018-05-25 09:29:23.042965
646	2	216	\N	2018-05-25 09:29:23.047185	2018-05-25 09:29:23.047185
647	3	216	\N	2018-05-25 09:29:23.049806	2018-05-25 09:29:23.049806
648	1	216	\N	2018-05-25 09:29:23.052086	2018-05-25 09:29:23.052086
649	2	217	\N	2018-05-25 09:29:23.057867	2018-05-25 09:29:23.057867
650	3	217	\N	2018-05-25 09:29:23.059814	2018-05-25 09:29:23.059814
651	1	217	\N	2018-05-25 09:29:23.062234	2018-05-25 09:29:23.062234
652	2	218	\N	2018-05-25 09:29:23.06668	2018-05-25 09:29:23.06668
653	3	218	\N	2018-05-25 09:29:23.069238	2018-05-25 09:29:23.069238
654	1	218	\N	2018-05-25 09:29:23.071298	2018-05-25 09:29:23.071298
655	2	219	\N	2018-05-25 09:29:23.075701	2018-05-25 09:29:23.075701
656	3	219	\N	2018-05-25 09:29:23.077841	2018-05-25 09:29:23.077841
657	1	219	\N	2018-05-25 09:29:23.079732	2018-05-25 09:29:23.079732
658	2	220	\N	2018-05-25 09:29:23.084201	2018-05-25 09:29:23.084201
659	3	220	\N	2018-05-25 09:29:23.08612	2018-05-25 09:29:23.08612
660	1	220	\N	2018-05-25 09:29:23.088199	2018-05-25 09:29:23.088199
661	2	221	\N	2018-05-25 09:29:23.092489	2018-05-25 09:29:23.092489
662	3	221	\N	2018-05-25 09:29:23.094407	2018-05-25 09:29:23.094407
663	1	221	\N	2018-05-25 09:29:23.096615	2018-05-25 09:29:23.096615
664	2	222	\N	2018-05-25 09:29:23.101962	2018-05-25 09:29:23.101962
665	3	222	\N	2018-05-25 09:29:23.105976	2018-05-25 09:29:23.105976
666	1	222	\N	2018-05-25 09:29:23.108743	2018-05-25 09:29:23.108743
667	2	223	\N	2018-05-25 09:29:23.113835	2018-05-25 09:29:23.113835
668	3	223	\N	2018-05-25 09:29:23.116016	2018-05-25 09:29:23.116016
669	1	223	\N	2018-05-25 09:29:23.118345	2018-05-25 09:29:23.118345
670	2	224	\N	2018-05-25 09:29:23.123976	2018-05-25 09:29:23.123976
671	3	224	\N	2018-05-25 09:29:23.12671	2018-05-25 09:29:23.12671
672	1	224	\N	2018-05-25 09:29:23.128569	2018-05-25 09:29:23.128569
673	2	225	\N	2018-05-25 09:29:23.134288	2018-05-25 09:29:23.134288
674	3	225	\N	2018-05-25 09:29:23.13626	2018-05-25 09:29:23.13626
675	1	225	\N	2018-05-25 09:29:23.138517	2018-05-25 09:29:23.138517
676	2	226	\N	2018-05-25 09:29:23.143179	2018-05-25 09:29:23.143179
677	3	226	\N	2018-05-25 09:29:23.145197	2018-05-25 09:29:23.145197
678	1	226	\N	2018-05-25 09:29:23.147818	2018-05-25 09:29:23.147818
679	2	227	\N	2018-05-25 09:29:23.152512	2018-05-25 09:29:23.152512
680	3	227	\N	2018-05-25 09:29:23.155169	2018-05-25 09:29:23.155169
681	1	227	\N	2018-05-25 09:29:23.157693	2018-05-25 09:29:23.157693
682	2	228	\N	2018-05-25 09:29:23.162939	2018-05-25 09:29:23.162939
683	3	228	\N	2018-05-25 09:29:23.16501	2018-05-25 09:29:23.16501
684	1	228	\N	2018-05-25 09:29:23.167579	2018-05-25 09:29:23.167579
685	2	229	\N	2018-05-25 09:29:23.171843	2018-05-25 09:29:23.171843
686	3	229	\N	2018-05-25 09:29:23.174168	2018-05-25 09:29:23.174168
687	1	229	\N	2018-05-25 09:29:23.176708	2018-05-25 09:29:23.176708
688	2	230	\N	2018-05-25 09:29:23.181764	2018-05-25 09:29:23.181764
689	3	230	\N	2018-05-25 09:29:23.183817	2018-05-25 09:29:23.183817
690	1	230	\N	2018-05-25 09:29:23.185845	2018-05-25 09:29:23.185845
691	2	231	\N	2018-05-25 09:29:23.190661	2018-05-25 09:29:23.190661
692	3	231	\N	2018-05-25 09:29:23.192654	2018-05-25 09:29:23.192654
693	1	231	\N	2018-05-25 09:29:23.195543	2018-05-25 09:29:23.195543
694	2	232	\N	2018-05-25 09:29:23.200428	2018-05-25 09:29:23.200428
695	3	232	\N	2018-05-25 09:29:23.203194	2018-05-25 09:29:23.203194
696	1	232	\N	2018-05-25 09:29:23.205631	2018-05-25 09:29:23.205631
697	2	233	\N	2018-05-25 09:29:23.215769	2018-05-25 09:29:23.215769
698	3	233	\N	2018-05-25 09:29:23.218884	2018-05-25 09:29:23.218884
699	1	233	\N	2018-05-25 09:29:23.222182	2018-05-25 09:29:23.222182
700	2	234	\N	2018-05-25 09:29:23.232446	2018-05-25 09:29:23.232446
701	3	234	\N	2018-05-25 09:29:23.235597	2018-05-25 09:29:23.235597
702	1	234	\N	2018-05-25 09:29:23.237783	2018-05-25 09:29:23.237783
703	2	235	\N	2018-05-25 09:29:23.246035	2018-05-25 09:29:23.246035
704	3	235	\N	2018-05-25 09:29:23.248982	2018-05-25 09:29:23.248982
705	1	235	\N	2018-05-25 09:29:23.251063	2018-05-25 09:29:23.251063
706	2	236	\N	2018-05-25 09:29:23.256322	2018-05-25 09:29:23.256322
707	3	236	\N	2018-05-25 09:29:23.258637	2018-05-25 09:29:23.258637
708	1	236	\N	2018-05-25 09:29:23.261293	2018-05-25 09:29:23.261293
709	2	237	\N	2018-05-25 09:29:23.266405	2018-05-25 09:29:23.266405
710	3	237	\N	2018-05-25 09:29:23.268642	2018-05-25 09:29:23.268642
711	1	237	\N	2018-05-25 09:29:23.271179	2018-05-25 09:29:23.271179
712	2	238	\N	2018-05-25 09:29:23.27803	2018-05-25 09:29:23.27803
713	3	238	\N	2018-05-25 09:29:23.280726	2018-05-25 09:29:23.280726
714	1	238	\N	2018-05-25 09:29:23.284065	2018-05-25 09:29:23.284065
715	2	239	\N	2018-05-25 09:29:23.291176	2018-05-25 09:29:23.291176
716	3	239	\N	2018-05-25 09:29:23.294229	2018-05-25 09:29:23.294229
717	1	239	\N	2018-05-25 09:29:23.299986	2018-05-25 09:29:23.299986
718	2	240	\N	2018-05-25 09:29:23.307279	2018-05-25 09:29:23.307279
719	3	240	\N	2018-05-25 09:29:23.309524	2018-05-25 09:29:23.309524
720	1	240	\N	2018-05-25 09:29:23.312896	2018-05-25 09:29:23.312896
721	2	241	\N	2018-05-25 09:29:23.326628	2018-05-25 09:29:23.326628
722	3	241	\N	2018-05-25 09:29:23.331271	2018-05-25 09:29:23.331271
723	1	241	\N	2018-05-25 09:29:23.334942	2018-05-25 09:29:23.334942
724	2	242	\N	2018-05-25 09:29:23.342346	2018-05-25 09:29:23.342346
725	3	242	\N	2018-05-25 09:29:23.347574	2018-05-25 09:29:23.347574
726	1	242	\N	2018-05-25 09:29:23.350673	2018-05-25 09:29:23.350673
727	2	243	\N	2018-05-25 09:29:23.359309	2018-05-25 09:29:23.359309
728	3	243	\N	2018-05-25 09:29:23.363178	2018-05-25 09:29:23.363178
729	1	243	\N	2018-05-25 09:29:23.366557	2018-05-25 09:29:23.366557
730	2	244	\N	2018-05-25 09:29:23.37399	2018-05-25 09:29:23.37399
731	3	244	\N	2018-05-25 09:29:23.377175	2018-05-25 09:29:23.377175
732	1	244	\N	2018-05-25 09:29:23.381593	2018-05-25 09:29:23.381593
733	2	245	\N	2018-05-25 09:29:23.388415	2018-05-25 09:29:23.388415
734	3	245	\N	2018-05-25 09:29:23.393771	2018-05-25 09:29:23.393771
735	1	245	\N	2018-05-25 09:29:23.3963	2018-05-25 09:29:23.3963
736	2	246	\N	2018-05-25 09:29:23.401506	2018-05-25 09:29:23.401506
737	3	246	\N	2018-05-25 09:29:23.406999	2018-05-25 09:29:23.406999
738	1	246	\N	2018-05-25 09:29:23.41109	2018-05-25 09:29:23.41109
739	2	247	\N	2018-05-25 09:29:23.420178	2018-05-25 09:29:23.420178
740	3	247	\N	2018-05-25 09:29:23.426917	2018-05-25 09:29:23.426917
741	1	247	\N	2018-05-25 09:29:23.43094	2018-05-25 09:29:23.43094
742	2	248	\N	2018-05-25 09:29:23.4404	2018-05-25 09:29:23.4404
743	3	248	\N	2018-05-25 09:29:23.444303	2018-05-25 09:29:23.444303
744	1	248	\N	2018-05-25 09:29:23.447315	2018-05-25 09:29:23.447315
745	2	249	\N	2018-05-25 09:29:23.458343	2018-05-25 09:29:23.458343
746	3	249	\N	2018-05-25 09:29:23.462676	2018-05-25 09:29:23.462676
747	1	249	\N	2018-05-25 09:29:23.465959	2018-05-25 09:29:23.465959
748	2	250	\N	2018-05-25 09:29:23.472747	2018-05-25 09:29:23.472747
749	3	250	\N	2018-05-25 09:29:23.475085	2018-05-25 09:29:23.475085
750	1	250	\N	2018-05-25 09:29:23.478506	2018-05-25 09:29:23.478506
751	2	251	\N	2018-05-25 09:29:23.483856	2018-05-25 09:29:23.483856
752	3	251	\N	2018-05-25 09:29:23.486352	2018-05-25 09:29:23.486352
753	1	251	\N	2018-05-25 09:29:23.488738	2018-05-25 09:29:23.488738
754	2	252	\N	2018-05-25 09:29:23.493689	2018-05-25 09:29:23.493689
755	3	252	\N	2018-05-25 09:29:23.496367	2018-05-25 09:29:23.496367
756	1	252	\N	2018-05-25 09:29:23.498632	2018-05-25 09:29:23.498632
757	2	253	\N	2018-05-25 09:29:23.503395	2018-05-25 09:29:23.503395
758	3	253	\N	2018-05-25 09:29:23.505685	2018-05-25 09:29:23.505685
759	1	253	\N	2018-05-25 09:29:23.507907	2018-05-25 09:29:23.507907
760	2	254	\N	2018-05-25 09:29:23.512985	2018-05-25 09:29:23.512985
761	3	254	\N	2018-05-25 09:29:23.515201	2018-05-25 09:29:23.515201
762	1	254	\N	2018-05-25 09:29:23.517872	2018-05-25 09:29:23.517872
763	2	255	\N	2018-05-25 09:29:23.524745	2018-05-25 09:29:23.524745
764	3	255	\N	2018-05-25 09:29:23.527614	2018-05-25 09:29:23.527614
765	1	255	\N	2018-05-25 09:29:23.530904	2018-05-25 09:29:23.530904
766	2	256	\N	2018-05-25 09:29:23.538542	2018-05-25 09:29:23.538542
767	3	256	\N	2018-05-25 09:29:23.542577	2018-05-25 09:29:23.542577
768	1	256	\N	2018-05-25 09:29:23.545546	2018-05-25 09:29:23.545546
769	2	257	\N	2018-05-25 09:29:23.554571	2018-05-25 09:29:23.554571
770	3	257	\N	2018-05-25 09:29:23.557493	2018-05-25 09:29:23.557493
771	1	257	\N	2018-05-25 09:29:23.562384	2018-05-25 09:29:23.562384
772	2	258	\N	2018-05-25 09:29:23.569245	2018-05-25 09:29:23.569245
773	3	258	\N	2018-05-25 09:29:23.572022	2018-05-25 09:29:23.572022
774	1	258	\N	2018-05-25 09:29:23.576907	2018-05-25 09:29:23.576907
775	2	259	\N	2018-05-25 09:29:23.586558	2018-05-25 09:29:23.586558
776	3	259	\N	2018-05-25 09:29:23.588514	2018-05-25 09:29:23.588514
777	1	259	\N	2018-05-25 09:29:23.591205	2018-05-25 09:29:23.591205
778	2	260	\N	2018-05-25 09:29:23.59755	2018-05-25 09:29:23.59755
779	3	260	\N	2018-05-25 09:29:23.600723	2018-05-25 09:29:23.600723
780	1	260	\N	2018-05-25 09:29:23.605394	2018-05-25 09:29:23.605394
781	2	261	\N	2018-05-25 09:29:23.613012	2018-05-25 09:29:23.613012
782	3	261	\N	2018-05-25 09:29:23.618261	2018-05-25 09:29:23.618261
783	1	261	\N	2018-05-25 09:29:23.62125	2018-05-25 09:29:23.62125
784	2	262	\N	2018-05-25 09:29:23.6306	2018-05-25 09:29:23.6306
785	3	262	\N	2018-05-25 09:29:23.634227	2018-05-25 09:29:23.634227
786	1	262	\N	2018-05-25 09:29:23.638328	2018-05-25 09:29:23.638328
787	2	263	\N	2018-05-25 09:29:23.645178	2018-05-25 09:29:23.645178
788	3	263	\N	2018-05-25 09:29:23.649693	2018-05-25 09:29:23.649693
789	1	263	\N	2018-05-25 09:29:23.652984	2018-05-25 09:29:23.652984
790	2	264	\N	2018-05-25 09:29:23.660659	2018-05-25 09:29:23.660659
791	3	264	\N	2018-05-25 09:29:23.664601	2018-05-25 09:29:23.664601
792	1	264	\N	2018-05-25 09:29:23.667187	2018-05-25 09:29:23.667187
793	2	265	\N	2018-05-25 09:29:23.675126	2018-05-25 09:29:23.675126
794	3	265	\N	2018-05-25 09:29:23.679463	2018-05-25 09:29:23.679463
795	1	265	\N	2018-05-25 09:29:23.682635	2018-05-25 09:29:23.682635
796	2	266	\N	2018-05-25 09:29:23.691281	2018-05-25 09:29:23.691281
797	3	266	\N	2018-05-25 09:29:23.694145	2018-05-25 09:29:23.694145
798	1	266	\N	2018-05-25 09:29:23.696442	2018-05-25 09:29:23.696442
799	2	267	\N	2018-05-25 09:29:23.703836	2018-05-25 09:29:23.703836
800	3	267	\N	2018-05-25 09:29:23.708187	2018-05-25 09:29:23.708187
801	1	267	\N	2018-05-25 09:29:23.710307	2018-05-25 09:29:23.710307
802	2	268	\N	2018-05-25 09:29:23.721907	2018-05-25 09:29:23.721907
803	3	268	\N	2018-05-25 09:29:23.726906	2018-05-25 09:29:23.726906
804	1	268	\N	2018-05-25 09:29:23.732118	2018-05-25 09:29:23.732118
805	2	269	\N	2018-05-25 09:29:23.740273	2018-05-25 09:29:23.740273
806	3	269	\N	2018-05-25 09:29:23.744483	2018-05-25 09:29:23.744483
807	1	269	\N	2018-05-25 09:29:23.747895	2018-05-25 09:29:23.747895
808	2	270	\N	2018-05-25 09:29:23.755038	2018-05-25 09:29:23.755038
809	3	270	\N	2018-05-25 09:29:23.757908	2018-05-25 09:29:23.757908
810	1	270	\N	2018-05-25 09:29:23.761081	2018-05-25 09:29:23.761081
811	2	271	\N	2018-05-25 09:29:23.769069	2018-05-25 09:29:23.769069
812	3	271	\N	2018-05-25 09:29:23.77142	2018-05-25 09:29:23.77142
813	1	271	\N	2018-05-25 09:29:23.774837	2018-05-25 09:29:23.774837
814	2	272	\N	2018-05-25 09:29:23.788667	2018-05-25 09:29:23.788667
815	3	272	\N	2018-05-25 09:29:23.794037	2018-05-25 09:29:23.794037
816	1	272	\N	2018-05-25 09:29:23.796661	2018-05-25 09:29:23.796661
817	2	273	\N	2018-05-25 09:29:23.804415	2018-05-25 09:29:23.804415
818	3	273	\N	2018-05-25 09:29:23.808676	2018-05-25 09:29:23.808676
819	1	273	\N	2018-05-25 09:29:23.811354	2018-05-25 09:29:23.811354
820	2	274	\N	2018-05-25 09:29:23.81799	2018-05-25 09:29:23.81799
821	3	274	\N	2018-05-25 09:29:23.820203	2018-05-25 09:29:23.820203
822	1	274	\N	2018-05-25 09:29:23.822	2018-05-25 09:29:23.822
823	2	275	\N	2018-05-25 09:29:23.830142	2018-05-25 09:29:23.830142
824	3	275	\N	2018-05-25 09:29:23.832164	2018-05-25 09:29:23.832164
825	1	275	\N	2018-05-25 09:29:23.83401	2018-05-25 09:29:23.83401
826	2	276	\N	2018-05-25 09:29:23.838322	2018-05-25 09:29:23.838322
827	3	276	\N	2018-05-25 09:29:23.840752	2018-05-25 09:29:23.840752
828	1	276	\N	2018-05-25 09:29:23.843057	2018-05-25 09:29:23.843057
829	2	277	\N	2018-05-25 09:29:23.849324	2018-05-25 09:29:23.849324
830	3	277	\N	2018-05-25 09:29:23.851375	2018-05-25 09:29:23.851375
831	1	277	\N	2018-05-25 09:29:23.853277	2018-05-25 09:29:23.853277
832	2	278	\N	2018-05-25 09:29:23.858525	2018-05-25 09:29:23.858525
833	3	278	\N	2018-05-25 09:29:23.861	2018-05-25 09:29:23.861
834	1	278	\N	2018-05-25 09:29:23.862935	2018-05-25 09:29:23.862935
835	2	279	\N	2018-05-25 09:29:23.867206	2018-05-25 09:29:23.867206
836	3	279	\N	2018-05-25 09:29:23.869043	2018-05-25 09:29:23.869043
837	1	279	\N	2018-05-25 09:29:23.871103	2018-05-25 09:29:23.871103
838	2	280	\N	2018-05-25 09:29:23.87524	2018-05-25 09:29:23.87524
839	3	280	\N	2018-05-25 09:29:23.877173	2018-05-25 09:29:23.877173
840	1	280	\N	2018-05-25 09:29:23.8793	2018-05-25 09:29:23.8793
841	2	281	\N	2018-05-25 09:29:23.887189	2018-05-25 09:29:23.887189
842	3	281	\N	2018-05-25 09:29:23.890141	2018-05-25 09:29:23.890141
843	1	281	\N	2018-05-25 09:29:23.892739	2018-05-25 09:29:23.892739
844	2	282	\N	2018-05-25 09:29:23.896732	2018-05-25 09:29:23.896732
845	3	282	\N	2018-05-25 09:29:23.898534	2018-05-25 09:29:23.898534
846	1	282	\N	2018-05-25 09:29:23.900316	2018-05-25 09:29:23.900316
847	2	283	\N	2018-05-25 09:29:23.904205	2018-05-25 09:29:23.904205
848	3	283	\N	2018-05-25 09:29:23.906265	2018-05-25 09:29:23.906265
849	1	283	\N	2018-05-25 09:29:23.908225	2018-05-25 09:29:23.908225
850	2	284	\N	2018-05-25 09:29:23.912424	2018-05-25 09:29:23.912424
851	3	284	\N	2018-05-25 09:29:23.914317	2018-05-25 09:29:23.914317
852	1	284	\N	2018-05-25 09:29:23.916403	2018-05-25 09:29:23.916403
853	2	285	\N	2018-05-25 09:29:23.920724	2018-05-25 09:29:23.920724
854	3	285	\N	2018-05-25 09:29:23.922649	2018-05-25 09:29:23.922649
855	1	285	\N	2018-05-25 09:29:23.924464	2018-05-25 09:29:23.924464
856	2	286	\N	2018-05-25 09:29:23.928651	2018-05-25 09:29:23.928651
857	3	286	\N	2018-05-25 09:29:23.930602	2018-05-25 09:29:23.930602
858	1	286	\N	2018-05-25 09:29:23.93249	2018-05-25 09:29:23.93249
859	2	287	\N	2018-05-25 09:29:23.936315	2018-05-25 09:29:23.936315
860	3	287	\N	2018-05-25 09:29:23.938108	2018-05-25 09:29:23.938108
861	1	287	\N	2018-05-25 09:29:23.939991	2018-05-25 09:29:23.939991
862	2	288	\N	2018-05-25 09:29:23.943988	2018-05-25 09:29:23.943988
863	3	288	\N	2018-05-25 09:29:23.946135	2018-05-25 09:29:23.946135
864	1	288	\N	2018-05-25 09:29:23.94812	2018-05-25 09:29:23.94812
865	2	289	\N	2018-05-25 09:29:23.95318	2018-05-25 09:29:23.95318
866	3	289	\N	2018-05-25 09:29:23.954994	2018-05-25 09:29:23.954994
867	1	289	\N	2018-05-25 09:29:23.956798	2018-05-25 09:29:23.956798
868	2	290	\N	2018-05-25 09:29:23.960613	2018-05-25 09:29:23.960613
869	3	290	\N	2018-05-25 09:29:23.962454	2018-05-25 09:29:23.962454
870	1	290	\N	2018-05-25 09:29:23.964305	2018-05-25 09:29:23.964305
871	2	291	\N	2018-05-25 09:29:23.968191	2018-05-25 09:29:23.968191
872	3	291	\N	2018-05-25 09:29:23.970232	2018-05-25 09:29:23.970232
873	1	291	\N	2018-05-25 09:29:23.972189	2018-05-25 09:29:23.972189
874	2	292	\N	2018-05-25 09:29:23.976534	2018-05-25 09:29:23.976534
875	3	292	\N	2018-05-25 09:29:23.978623	2018-05-25 09:29:23.978623
876	1	292	\N	2018-05-25 09:29:23.980675	2018-05-25 09:29:23.980675
877	2	293	\N	2018-05-25 09:29:23.984789	2018-05-25 09:29:23.984789
878	3	293	\N	2018-05-25 09:29:23.986683	2018-05-25 09:29:23.986683
879	1	293	\N	2018-05-25 09:29:23.988556	2018-05-25 09:29:23.988556
880	2	294	\N	2018-05-25 09:29:23.992464	2018-05-25 09:29:23.992464
881	3	294	\N	2018-05-25 09:29:23.994612	2018-05-25 09:29:23.994612
882	1	294	\N	2018-05-25 09:29:23.996748	2018-05-25 09:29:23.996748
883	2	295	\N	2018-05-25 09:29:24.003479	2018-05-25 09:29:24.003479
884	3	295	\N	2018-05-25 09:29:24.005922	2018-05-25 09:29:24.005922
885	1	295	\N	2018-05-25 09:29:24.009377	2018-05-25 09:29:24.009377
886	2	296	\N	2018-05-25 09:29:24.014836	2018-05-25 09:29:24.014836
887	3	296	\N	2018-05-25 09:29:24.017319	2018-05-25 09:29:24.017319
888	1	296	\N	2018-05-25 09:29:24.019545	2018-05-25 09:29:24.019545
889	2	297	\N	2018-05-25 09:29:24.028294	2018-05-25 09:29:24.028294
890	3	297	\N	2018-05-25 09:29:24.031978	2018-05-25 09:29:24.031978
891	1	297	\N	2018-05-25 09:29:24.03462	2018-05-25 09:29:24.03462
892	2	298	\N	2018-05-25 09:29:24.041966	2018-05-25 09:29:24.041966
893	3	298	\N	2018-05-25 09:29:24.045882	2018-05-25 09:29:24.045882
894	1	298	\N	2018-05-25 09:29:24.047999	2018-05-25 09:29:24.047999
895	2	299	\N	2018-05-25 09:29:24.053725	2018-05-25 09:29:24.053725
896	3	299	\N	2018-05-25 09:29:24.056327	2018-05-25 09:29:24.056327
897	1	299	\N	2018-05-25 09:29:24.060253	2018-05-25 09:29:24.060253
898	2	300	\N	2018-05-25 09:29:24.066352	2018-05-25 09:29:24.066352
899	3	300	\N	2018-05-25 09:29:24.068945	2018-05-25 09:29:24.068945
900	1	300	\N	2018-05-25 09:29:24.071566	2018-05-25 09:29:24.071566
901	2	301	\N	2018-05-25 09:29:24.080784	2018-05-25 09:29:24.080784
902	3	301	\N	2018-05-25 09:29:24.083591	2018-05-25 09:29:24.083591
903	1	301	\N	2018-05-25 09:29:24.086483	2018-05-25 09:29:24.086483
904	2	302	\N	2018-05-25 09:29:24.091604	2018-05-25 09:29:24.091604
905	3	302	\N	2018-05-25 09:29:24.096464	2018-05-25 09:29:24.096464
906	1	302	\N	2018-05-25 09:29:24.098736	2018-05-25 09:29:24.098736
907	2	303	\N	2018-05-25 09:29:24.107653	2018-05-25 09:29:24.107653
908	3	303	\N	2018-05-25 09:29:24.110055	2018-05-25 09:29:24.110055
909	1	303	\N	2018-05-25 09:29:24.114489	2018-05-25 09:29:24.114489
910	2	304	\N	2018-05-25 09:29:24.12289	2018-05-25 09:29:24.12289
911	3	304	\N	2018-05-25 09:29:24.127274	2018-05-25 09:29:24.127274
912	1	304	\N	2018-05-25 09:29:24.129625	2018-05-25 09:29:24.129625
913	2	305	\N	2018-05-25 09:29:24.135826	2018-05-25 09:29:24.135826
914	3	305	\N	2018-05-25 09:29:24.137823	2018-05-25 09:29:24.137823
915	1	305	\N	2018-05-25 09:29:24.139944	2018-05-25 09:29:24.139944
916	2	306	\N	2018-05-25 09:29:24.146759	2018-05-25 09:29:24.146759
917	3	306	\N	2018-05-25 09:29:24.148959	2018-05-25 09:29:24.148959
918	1	306	\N	2018-05-25 09:29:24.150942	2018-05-25 09:29:24.150942
919	2	307	\N	2018-05-25 09:29:24.15509	2018-05-25 09:29:24.15509
920	3	307	\N	2018-05-25 09:29:24.158425	2018-05-25 09:29:24.158425
921	1	307	\N	2018-05-25 09:29:24.160861	2018-05-25 09:29:24.160861
922	2	308	\N	2018-05-25 09:29:24.165969	2018-05-25 09:29:24.165969
923	3	308	\N	2018-05-25 09:29:24.168145	2018-05-25 09:29:24.168145
924	1	308	\N	2018-05-25 09:29:24.170411	2018-05-25 09:29:24.170411
925	2	309	\N	2018-05-25 09:29:24.176425	2018-05-25 09:29:24.176425
926	3	309	\N	2018-05-25 09:29:24.178719	2018-05-25 09:29:24.178719
927	1	309	\N	2018-05-25 09:29:24.180796	2018-05-25 09:29:24.180796
928	2	310	\N	2018-05-25 09:29:24.185032	2018-05-25 09:29:24.185032
929	3	310	\N	2018-05-25 09:29:24.186908	2018-05-25 09:29:24.186908
930	1	310	\N	2018-05-25 09:29:24.189093	2018-05-25 09:29:24.189093
931	2	311	\N	2018-05-25 09:29:24.193729	2018-05-25 09:29:24.193729
932	3	311	\N	2018-05-25 09:29:24.195946	2018-05-25 09:29:24.195946
933	1	311	\N	2018-05-25 09:29:24.197715	2018-05-25 09:29:24.197715
934	2	312	\N	2018-05-25 09:29:24.201995	2018-05-25 09:29:24.201995
935	3	312	\N	2018-05-25 09:29:24.203863	2018-05-25 09:29:24.203863
936	1	312	\N	2018-05-25 09:29:24.205745	2018-05-25 09:29:24.205745
937	2	313	\N	2018-05-25 09:29:24.210358	2018-05-25 09:29:24.210358
938	3	313	\N	2018-05-25 09:29:24.21234	2018-05-25 09:29:24.21234
939	1	313	\N	2018-05-25 09:29:24.214376	2018-05-25 09:29:24.214376
940	2	314	\N	2018-05-25 09:29:24.218092	2018-05-25 09:29:24.218092
941	3	314	\N	2018-05-25 09:29:24.220119	2018-05-25 09:29:24.220119
942	1	314	\N	2018-05-25 09:29:24.22206	2018-05-25 09:29:24.22206
943	2	315	\N	2018-05-25 09:29:24.22635	2018-05-25 09:29:24.22635
944	3	315	\N	2018-05-25 09:29:24.228203	2018-05-25 09:29:24.228203
945	1	315	\N	2018-05-25 09:29:24.229976	2018-05-25 09:29:24.229976
946	2	316	\N	2018-05-25 09:29:24.233955	2018-05-25 09:29:24.233955
947	3	316	\N	2018-05-25 09:29:24.23585	2018-05-25 09:29:24.23585
948	1	316	\N	2018-05-25 09:29:24.237745	2018-05-25 09:29:24.237745
949	2	317	\N	2018-05-25 09:29:24.24189	2018-05-25 09:29:24.24189
950	3	317	\N	2018-05-25 09:29:24.243925	2018-05-25 09:29:24.243925
951	1	317	\N	2018-05-25 09:29:24.245758	2018-05-25 09:29:24.245758
952	2	318	\N	2018-05-25 09:29:24.249547	2018-05-25 09:29:24.249547
953	3	318	\N	2018-05-25 09:29:24.251356	2018-05-25 09:29:24.251356
954	1	318	\N	2018-05-25 09:29:24.253109	2018-05-25 09:29:24.253109
955	2	319	\N	2018-05-25 09:29:24.257116	2018-05-25 09:29:24.257116
956	3	319	\N	2018-05-25 09:29:24.259129	2018-05-25 09:29:24.259129
957	1	319	\N	2018-05-25 09:29:24.26131	2018-05-25 09:29:24.26131
958	2	320	\N	2018-05-25 09:29:24.265455	2018-05-25 09:29:24.265455
959	3	320	\N	2018-05-25 09:29:24.267366	2018-05-25 09:29:24.267366
960	1	320	\N	2018-05-25 09:29:24.269346	2018-05-25 09:29:24.269346
961	2	321	\N	2018-05-25 09:29:24.274566	2018-05-25 09:29:24.274566
962	3	321	\N	2018-05-25 09:29:24.276961	2018-05-25 09:29:24.276961
963	1	321	\N	2018-05-25 09:29:24.279347	2018-05-25 09:29:24.279347
964	2	322	\N	2018-05-25 09:29:24.283858	2018-05-25 09:29:24.283858
965	3	322	\N	2018-05-25 09:29:24.285833	2018-05-25 09:29:24.285833
966	1	322	\N	2018-05-25 09:29:24.287874	2018-05-25 09:29:24.287874
967	2	323	\N	2018-05-25 09:29:24.293188	2018-05-25 09:29:24.293188
968	3	323	\N	2018-05-25 09:29:24.295506	2018-05-25 09:29:24.295506
969	1	323	\N	2018-05-25 09:29:24.29754	2018-05-25 09:29:24.29754
970	2	324	\N	2018-05-25 09:29:24.301644	2018-05-25 09:29:24.301644
971	3	324	\N	2018-05-25 09:29:24.303578	2018-05-25 09:29:24.303578
972	1	324	\N	2018-05-25 09:29:24.305402	2018-05-25 09:29:24.305402
973	2	325	\N	2018-05-25 09:29:24.310682	2018-05-25 09:29:24.310682
974	3	325	\N	2018-05-25 09:29:24.312715	2018-05-25 09:29:24.312715
975	1	325	\N	2018-05-25 09:29:24.314548	2018-05-25 09:29:24.314548
976	2	326	\N	2018-05-25 09:29:24.318397	2018-05-25 09:29:24.318397
977	3	326	\N	2018-05-25 09:29:24.320145	2018-05-25 09:29:24.320145
978	1	326	\N	2018-05-25 09:29:24.322203	2018-05-25 09:29:24.322203
979	2	327	\N	2018-05-25 09:29:24.326567	2018-05-25 09:29:24.326567
980	3	327	\N	2018-05-25 09:29:24.328921	2018-05-25 09:29:24.328921
981	1	327	\N	2018-05-25 09:29:24.330985	2018-05-25 09:29:24.330985
982	2	328	\N	2018-05-25 09:29:24.335403	2018-05-25 09:29:24.335403
983	3	328	\N	2018-05-25 09:29:24.337687	2018-05-25 09:29:24.337687
984	1	328	\N	2018-05-25 09:29:24.340034	2018-05-25 09:29:24.340034
985	2	329	\N	2018-05-25 09:29:24.345174	2018-05-25 09:29:24.345174
986	3	329	\N	2018-05-25 09:29:24.347716	2018-05-25 09:29:24.347716
987	1	329	\N	2018-05-25 09:29:24.350366	2018-05-25 09:29:24.350366
988	2	330	\N	2018-05-25 09:29:24.355793	2018-05-25 09:29:24.355793
989	3	330	\N	2018-05-25 09:29:24.358339	2018-05-25 09:29:24.358339
990	1	330	\N	2018-05-25 09:29:24.360788	2018-05-25 09:29:24.360788
991	2	331	\N	2018-05-25 09:29:24.366082	2018-05-25 09:29:24.366082
992	3	331	\N	2018-05-25 09:29:24.368587	2018-05-25 09:29:24.368587
993	1	331	\N	2018-05-25 09:29:24.370974	2018-05-25 09:29:24.370974
994	2	332	\N	2018-05-25 09:29:24.376506	2018-05-25 09:29:24.376506
995	3	332	\N	2018-05-25 09:29:24.378756	2018-05-25 09:29:24.378756
996	1	332	\N	2018-05-25 09:29:24.3808	2018-05-25 09:29:24.3808
997	2	333	\N	2018-05-25 09:29:24.385465	2018-05-25 09:29:24.385465
998	3	333	\N	2018-05-25 09:29:24.387533	2018-05-25 09:29:24.387533
999	1	333	\N	2018-05-25 09:29:24.389503	2018-05-25 09:29:24.389503
1000	2	334	\N	2018-05-25 09:29:24.393245	2018-05-25 09:29:24.393245
1001	3	334	\N	2018-05-25 09:29:24.395202	2018-05-25 09:29:24.395202
1002	1	334	\N	2018-05-25 09:29:24.397079	2018-05-25 09:29:24.397079
1003	2	335	\N	2018-05-25 09:29:24.401166	2018-05-25 09:29:24.401166
1004	3	335	\N	2018-05-25 09:29:24.40311	2018-05-25 09:29:24.40311
1005	1	335	\N	2018-05-25 09:29:24.405154	2018-05-25 09:29:24.405154
1006	2	336	\N	2018-05-25 09:29:24.409366	2018-05-25 09:29:24.409366
1007	3	336	\N	2018-05-25 09:29:24.411275	2018-05-25 09:29:24.411275
1008	1	336	\N	2018-05-25 09:29:24.413193	2018-05-25 09:29:24.413193
1009	2	337	\N	2018-05-25 09:29:24.418667	2018-05-25 09:29:24.418667
1010	3	337	\N	2018-05-25 09:29:24.42072	2018-05-25 09:29:24.42072
1011	1	337	\N	2018-05-25 09:29:24.42255	2018-05-25 09:29:24.42255
1012	2	338	\N	2018-05-25 09:29:24.426898	2018-05-25 09:29:24.426898
1013	3	338	\N	2018-05-25 09:29:24.428923	2018-05-25 09:29:24.428923
1014	1	338	\N	2018-05-25 09:29:24.430704	2018-05-25 09:29:24.430704
1015	2	339	\N	2018-05-25 09:29:24.43438	2018-05-25 09:29:24.43438
1016	3	339	\N	2018-05-25 09:29:24.436239	2018-05-25 09:29:24.436239
1017	1	339	\N	2018-05-25 09:29:24.437907	2018-05-25 09:29:24.437907
1018	2	340	\N	2018-05-25 09:29:24.441827	2018-05-25 09:29:24.441827
1019	3	340	\N	2018-05-25 09:29:24.443852	2018-05-25 09:29:24.443852
1020	1	340	\N	2018-05-25 09:29:24.445843	2018-05-25 09:29:24.445843
1021	2	341	\N	2018-05-25 09:29:24.450035	2018-05-25 09:29:24.450035
1022	3	341	\N	2018-05-25 09:29:24.452008	2018-05-25 09:29:24.452008
1023	1	341	\N	2018-05-25 09:29:24.453842	2018-05-25 09:29:24.453842
1024	2	342	\N	2018-05-25 09:29:24.458133	2018-05-25 09:29:24.458133
1025	3	342	\N	2018-05-25 09:29:24.461025	2018-05-25 09:29:24.461025
1026	1	342	\N	2018-05-25 09:29:24.463822	2018-05-25 09:29:24.463822
1027	2	343	\N	2018-05-25 09:29:24.468068	2018-05-25 09:29:24.468068
1028	3	343	\N	2018-05-25 09:29:24.469931	2018-05-25 09:29:24.469931
1029	1	343	\N	2018-05-25 09:29:24.471904	2018-05-25 09:29:24.471904
1030	2	344	\N	2018-05-25 09:29:24.47652	2018-05-25 09:29:24.47652
1031	3	344	\N	2018-05-25 09:29:24.478724	2018-05-25 09:29:24.478724
1032	1	344	\N	2018-05-25 09:29:24.48044	2018-05-25 09:29:24.48044
1033	2	345	\N	2018-05-25 09:29:24.484681	2018-05-25 09:29:24.484681
1034	3	345	\N	2018-05-25 09:29:24.486438	2018-05-25 09:29:24.486438
1035	1	345	\N	2018-05-25 09:29:24.488279	2018-05-25 09:29:24.488279
1036	2	346	\N	2018-05-25 09:29:24.492026	2018-05-25 09:29:24.492026
1037	3	346	\N	2018-05-25 09:29:24.494029	2018-05-25 09:29:24.494029
1038	1	346	\N	2018-05-25 09:29:24.496173	2018-05-25 09:29:24.496173
1039	2	347	\N	2018-05-25 09:29:24.500214	2018-05-25 09:29:24.500214
1040	3	347	\N	2018-05-25 09:29:24.502021	2018-05-25 09:29:24.502021
1041	1	347	\N	2018-05-25 09:29:24.503831	2018-05-25 09:29:24.503831
1042	2	348	\N	2018-05-25 09:29:24.50787	2018-05-25 09:29:24.50787
1043	3	348	\N	2018-05-25 09:29:24.509844	2018-05-25 09:29:24.509844
1044	1	348	\N	2018-05-25 09:29:24.511776	2018-05-25 09:29:24.511776
1045	2	349	\N	2018-05-25 09:29:24.516347	2018-05-25 09:29:24.516347
1046	3	349	\N	2018-05-25 09:29:24.518149	2018-05-25 09:29:24.518149
1047	1	349	\N	2018-05-25 09:29:24.520062	2018-05-25 09:29:24.520062
1048	2	350	\N	2018-05-25 09:29:24.524137	2018-05-25 09:29:24.524137
1049	3	350	\N	2018-05-25 09:29:24.526245	2018-05-25 09:29:24.526245
1050	1	350	\N	2018-05-25 09:29:24.530293	2018-05-25 09:29:24.530293
1051	2	351	\N	2018-05-25 09:29:24.535081	2018-05-25 09:29:24.535081
1052	3	351	\N	2018-05-25 09:29:24.537194	2018-05-25 09:29:24.537194
1053	1	351	\N	2018-05-25 09:29:24.539384	2018-05-25 09:29:24.539384
1054	2	352	\N	2018-05-25 09:29:24.543451	2018-05-25 09:29:24.543451
1055	3	352	\N	2018-05-25 09:29:24.545497	2018-05-25 09:29:24.545497
1056	1	352	\N	2018-05-25 09:29:24.547463	2018-05-25 09:29:24.547463
1057	2	353	\N	2018-05-25 09:29:24.552509	2018-05-25 09:29:24.552509
1058	3	353	\N	2018-05-25 09:29:24.554499	2018-05-25 09:29:24.554499
1059	1	353	\N	2018-05-25 09:29:24.556481	2018-05-25 09:29:24.556481
1060	2	354	\N	2018-05-25 09:29:24.560633	2018-05-25 09:29:24.560633
1061	3	354	\N	2018-05-25 09:29:24.56296	2018-05-25 09:29:24.56296
1062	1	354	\N	2018-05-25 09:29:24.566177	2018-05-25 09:29:24.566177
1063	2	355	\N	2018-05-25 09:29:24.570561	2018-05-25 09:29:24.570561
1064	3	355	\N	2018-05-25 09:29:24.572585	2018-05-25 09:29:24.572585
1065	1	355	\N	2018-05-25 09:29:24.575022	2018-05-25 09:29:24.575022
1066	2	356	\N	2018-05-25 09:29:24.580133	2018-05-25 09:29:24.580133
1067	3	356	\N	2018-05-25 09:29:24.582447	2018-05-25 09:29:24.582447
1068	1	356	\N	2018-05-25 09:29:24.585873	2018-05-25 09:29:24.585873
1069	2	357	\N	2018-05-25 09:29:24.591045	2018-05-25 09:29:24.591045
1070	3	357	\N	2018-05-25 09:29:24.594875	2018-05-25 09:29:24.594875
1071	1	357	\N	2018-05-25 09:29:24.598207	2018-05-25 09:29:24.598207
1072	2	358	\N	2018-05-25 09:29:24.603925	2018-05-25 09:29:24.603925
1073	3	358	\N	2018-05-25 09:29:24.607892	2018-05-25 09:29:24.607892
1074	1	358	\N	2018-05-25 09:29:24.61129	2018-05-25 09:29:24.61129
1075	2	359	\N	2018-05-25 09:29:24.619163	2018-05-25 09:29:24.619163
1076	3	359	\N	2018-05-25 09:29:24.623489	2018-05-25 09:29:24.623489
1077	1	359	\N	2018-05-25 09:29:24.626447	2018-05-25 09:29:24.626447
1078	2	360	\N	2018-05-25 09:29:24.633402	2018-05-25 09:29:24.633402
1079	3	360	\N	2018-05-25 09:29:24.637045	2018-05-25 09:29:24.637045
1080	1	360	\N	2018-05-25 09:29:24.640832	2018-05-25 09:29:24.640832
1081	2	361	\N	2018-05-25 09:29:24.65018	2018-05-25 09:29:24.65018
1082	3	361	\N	2018-05-25 09:29:24.654529	2018-05-25 09:29:24.654529
1083	1	361	\N	2018-05-25 09:29:24.657201	2018-05-25 09:29:24.657201
1084	2	362	\N	2018-05-25 09:29:24.662767	2018-05-25 09:29:24.662767
1085	3	362	\N	2018-05-25 09:29:24.666628	2018-05-25 09:29:24.666628
1086	1	362	\N	2018-05-25 09:29:24.669812	2018-05-25 09:29:24.669812
1087	2	363	\N	2018-05-25 09:29:24.674525	2018-05-25 09:29:24.674525
1088	3	363	\N	2018-05-25 09:29:24.679529	2018-05-25 09:29:24.679529
1089	1	363	\N	2018-05-25 09:29:24.684559	2018-05-25 09:29:24.684559
1090	2	364	\N	2018-05-25 09:29:24.691709	2018-05-25 09:29:24.691709
1091	3	364	\N	2018-05-25 09:29:24.694622	2018-05-25 09:29:24.694622
1092	1	364	\N	2018-05-25 09:29:24.699399	2018-05-25 09:29:24.699399
1093	2	365	\N	2018-05-25 09:29:24.706991	2018-05-25 09:29:24.706991
1094	3	365	\N	2018-05-25 09:29:24.710732	2018-05-25 09:29:24.710732
1095	1	365	\N	2018-05-25 09:29:24.715143	2018-05-25 09:29:24.715143
1096	2	366	\N	2018-05-25 09:29:24.722301	2018-05-25 09:29:24.722301
1097	3	366	\N	2018-05-25 09:29:24.725338	2018-05-25 09:29:24.725338
1098	1	366	\N	2018-05-25 09:29:24.729525	2018-05-25 09:29:24.729525
1099	2	367	\N	2018-05-25 09:29:24.737715	2018-05-25 09:29:24.737715
1100	3	367	\N	2018-05-25 09:29:24.740247	2018-05-25 09:29:24.740247
1101	1	367	\N	2018-05-25 09:29:24.744768	2018-05-25 09:29:24.744768
1102	2	368	\N	2018-05-25 09:29:24.753212	2018-05-25 09:29:24.753212
1103	3	368	\N	2018-05-25 09:29:24.757308	2018-05-25 09:29:24.757308
1104	1	368	\N	2018-05-25 09:29:24.761801	2018-05-25 09:29:24.761801
1105	2	369	\N	2018-05-25 09:29:24.771885	2018-05-25 09:29:24.771885
1106	3	369	\N	2018-05-25 09:29:24.774623	2018-05-25 09:29:24.774623
1107	1	369	\N	2018-05-25 09:29:24.779295	2018-05-25 09:29:24.779295
1108	2	370	\N	2018-05-25 09:29:24.788679	2018-05-25 09:29:24.788679
1109	3	370	\N	2018-05-25 09:29:24.791055	2018-05-25 09:29:24.791055
1110	1	370	\N	2018-05-25 09:29:24.793525	2018-05-25 09:29:24.793525
1111	2	371	\N	2018-05-25 09:29:24.797876	2018-05-25 09:29:24.797876
1112	3	371	\N	2018-05-25 09:29:24.799906	2018-05-25 09:29:24.799906
1113	1	371	\N	2018-05-25 09:29:24.801765	2018-05-25 09:29:24.801765
1114	2	372	\N	2018-05-25 09:29:24.805714	2018-05-25 09:29:24.805714
1115	3	372	\N	2018-05-25 09:29:24.808455	2018-05-25 09:29:24.808455
1116	1	372	\N	2018-05-25 09:29:24.812229	2018-05-25 09:29:24.812229
1117	2	373	\N	2018-05-25 09:29:24.816409	2018-05-25 09:29:24.816409
1118	3	373	\N	2018-05-25 09:29:24.818289	2018-05-25 09:29:24.818289
1119	1	373	\N	2018-05-25 09:29:24.820335	2018-05-25 09:29:24.820335
1120	2	374	\N	2018-05-25 09:29:24.824506	2018-05-25 09:29:24.824506
1121	3	374	\N	2018-05-25 09:29:24.826629	2018-05-25 09:29:24.826629
1122	1	374	\N	2018-05-25 09:29:24.82916	2018-05-25 09:29:24.82916
1123	2	375	\N	2018-05-25 09:29:24.834104	2018-05-25 09:29:24.834104
1124	3	375	\N	2018-05-25 09:29:24.836501	2018-05-25 09:29:24.836501
1125	1	375	\N	2018-05-25 09:29:24.839194	2018-05-25 09:29:24.839194
1126	2	376	\N	2018-05-25 09:29:24.844086	2018-05-25 09:29:24.844086
1127	3	376	\N	2018-05-25 09:29:24.846677	2018-05-25 09:29:24.846677
1128	1	376	\N	2018-05-25 09:29:24.849244	2018-05-25 09:29:24.849244
1129	2	377	\N	2018-05-25 09:29:24.855096	2018-05-25 09:29:24.855096
1130	3	377	\N	2018-05-25 09:29:24.858185	2018-05-25 09:29:24.858185
1131	1	377	\N	2018-05-25 09:29:24.860707	2018-05-25 09:29:24.860707
1132	2	378	\N	2018-05-25 09:29:24.866136	2018-05-25 09:29:24.866136
1133	3	378	\N	2018-05-25 09:29:24.868733	2018-05-25 09:29:24.868733
1134	1	378	\N	2018-05-25 09:29:24.871232	2018-05-25 09:29:24.871232
1135	2	379	\N	2018-05-25 09:29:24.877055	2018-05-25 09:29:24.877055
1136	3	379	\N	2018-05-25 09:29:24.879444	2018-05-25 09:29:24.879444
1137	1	379	\N	2018-05-25 09:29:24.881512	2018-05-25 09:29:24.881512
1138	2	380	\N	2018-05-25 09:29:24.886241	2018-05-25 09:29:24.886241
1139	3	380	\N	2018-05-25 09:29:24.888463	2018-05-25 09:29:24.888463
1140	1	380	\N	2018-05-25 09:29:24.890509	2018-05-25 09:29:24.890509
1141	2	381	\N	2018-05-25 09:29:24.895547	2018-05-25 09:29:24.895547
1142	3	381	\N	2018-05-25 09:29:24.897668	2018-05-25 09:29:24.897668
1143	1	381	\N	2018-05-25 09:29:24.899865	2018-05-25 09:29:24.899865
1144	2	382	\N	2018-05-25 09:29:24.905188	2018-05-25 09:29:24.905188
1145	3	382	\N	2018-05-25 09:29:24.907716	2018-05-25 09:29:24.907716
1146	1	382	\N	2018-05-25 09:29:24.910145	2018-05-25 09:29:24.910145
1147	2	383	\N	2018-05-25 09:29:24.915518	2018-05-25 09:29:24.915518
1148	3	383	\N	2018-05-25 09:29:24.918015	2018-05-25 09:29:24.918015
1149	1	383	\N	2018-05-25 09:29:24.921083	2018-05-25 09:29:24.921083
1150	2	384	\N	2018-05-25 09:29:24.926312	2018-05-25 09:29:24.926312
1151	3	384	\N	2018-05-25 09:29:24.928713	2018-05-25 09:29:24.928713
1152	1	384	\N	2018-05-25 09:29:24.931104	2018-05-25 09:29:24.931104
1153	2	385	\N	2018-05-25 09:29:24.938294	2018-05-25 09:29:24.938294
1154	3	385	\N	2018-05-25 09:29:24.940587	2018-05-25 09:29:24.940587
1155	1	385	\N	2018-05-25 09:29:24.943154	2018-05-25 09:29:24.943154
1156	2	386	\N	2018-05-25 09:29:24.948528	2018-05-25 09:29:24.948528
1157	3	386	\N	2018-05-25 09:29:24.950898	2018-05-25 09:29:24.950898
1158	1	386	\N	2018-05-25 09:29:24.953073	2018-05-25 09:29:24.953073
1159	2	387	\N	2018-05-25 09:29:24.95755	2018-05-25 09:29:24.95755
1160	3	387	\N	2018-05-25 09:29:24.959962	2018-05-25 09:29:24.959962
1161	1	387	\N	2018-05-25 09:29:24.962337	2018-05-25 09:29:24.962337
1162	2	388	\N	2018-05-25 09:29:24.966922	2018-05-25 09:29:24.966922
1163	3	388	\N	2018-05-25 09:29:24.968989	2018-05-25 09:29:24.968989
1164	1	388	\N	2018-05-25 09:29:24.97093	2018-05-25 09:29:24.97093
1165	2	389	\N	2018-05-25 09:29:24.975555	2018-05-25 09:29:24.975555
1166	3	389	\N	2018-05-25 09:29:24.977898	2018-05-25 09:29:24.977898
1167	1	389	\N	2018-05-25 09:29:24.980213	2018-05-25 09:29:24.980213
1168	2	390	\N	2018-05-25 09:29:24.985197	2018-05-25 09:29:24.985197
1169	3	390	\N	2018-05-25 09:29:24.987474	2018-05-25 09:29:24.987474
1170	1	390	\N	2018-05-25 09:29:24.989617	2018-05-25 09:29:24.989617
1171	2	391	\N	2018-05-25 09:29:24.994417	2018-05-25 09:29:24.994417
1172	3	391	\N	2018-05-25 09:29:24.996589	2018-05-25 09:29:24.996589
1173	1	391	\N	2018-05-25 09:29:24.998661	2018-05-25 09:29:24.998661
1174	2	392	\N	2018-05-25 09:29:25.002843	2018-05-25 09:29:25.002843
1175	3	392	\N	2018-05-25 09:29:25.004745	2018-05-25 09:29:25.004745
1176	1	392	\N	2018-05-25 09:29:25.006477	2018-05-25 09:29:25.006477
1177	2	393	\N	2018-05-25 09:29:25.010697	2018-05-25 09:29:25.010697
1178	3	393	\N	2018-05-25 09:29:25.012644	2018-05-25 09:29:25.012644
1179	1	393	\N	2018-05-25 09:29:25.0145	2018-05-25 09:29:25.0145
1180	2	394	\N	2018-05-25 09:29:25.018463	2018-05-25 09:29:25.018463
1181	3	394	\N	2018-05-25 09:29:25.020524	2018-05-25 09:29:25.020524
1182	1	394	\N	2018-05-25 09:29:25.022525	2018-05-25 09:29:25.022525
1183	2	395	\N	2018-05-25 09:29:25.026806	2018-05-25 09:29:25.026806
1184	3	395	\N	2018-05-25 09:29:25.028925	2018-05-25 09:29:25.028925
1185	1	395	\N	2018-05-25 09:29:25.030923	2018-05-25 09:29:25.030923
1186	2	396	\N	2018-05-25 09:29:25.034747	2018-05-25 09:29:25.034747
1187	3	396	\N	2018-05-25 09:29:25.036473	2018-05-25 09:29:25.036473
1188	1	396	\N	2018-05-25 09:29:25.038091	2018-05-25 09:29:25.038091
1189	2	397	\N	2018-05-25 09:29:25.041727	2018-05-25 09:29:25.041727
1190	3	397	\N	2018-05-25 09:29:25.043358	2018-05-25 09:29:25.043358
1191	1	397	\N	2018-05-25 09:29:25.04489	2018-05-25 09:29:25.04489
1192	2	398	\N	2018-05-25 09:29:25.048357	2018-05-25 09:29:25.048357
1193	3	398	\N	2018-05-25 09:29:25.049896	2018-05-25 09:29:25.049896
1194	1	398	\N	2018-05-25 09:29:25.051397	2018-05-25 09:29:25.051397
1195	2	399	\N	2018-05-25 09:29:25.05503	2018-05-25 09:29:25.05503
1196	3	399	\N	2018-05-25 09:29:25.056963	2018-05-25 09:29:25.056963
1197	1	399	\N	2018-05-25 09:29:25.058615	2018-05-25 09:29:25.058615
1198	2	400	\N	2018-05-25 09:29:25.061918	2018-05-25 09:29:25.061918
1199	3	400	\N	2018-05-25 09:29:25.063444	2018-05-25 09:29:25.063444
1200	1	400	\N	2018-05-25 09:29:25.064939	2018-05-25 09:29:25.064939
1201	2	401	\N	2018-05-25 09:29:25.068918	2018-05-25 09:29:25.068918
1202	3	401	\N	2018-05-25 09:29:25.070595	2018-05-25 09:29:25.070595
1203	1	401	\N	2018-05-25 09:29:25.072101	2018-05-25 09:29:25.072101
1204	2	402	\N	2018-05-25 09:29:25.075645	2018-05-25 09:29:25.075645
1205	3	402	\N	2018-05-25 09:29:25.077606	2018-05-25 09:29:25.077606
1206	1	402	\N	2018-05-25 09:29:25.079417	2018-05-25 09:29:25.079417
1207	2	403	\N	2018-05-25 09:29:25.082889	2018-05-25 09:29:25.082889
1208	3	403	\N	2018-05-25 09:29:25.084492	2018-05-25 09:29:25.084492
1209	1	403	\N	2018-05-25 09:29:25.086035	2018-05-25 09:29:25.086035
1210	2	404	\N	2018-05-25 09:29:25.089483	2018-05-25 09:29:25.089483
1211	3	404	\N	2018-05-25 09:29:25.091023	2018-05-25 09:29:25.091023
1212	1	404	\N	2018-05-25 09:29:25.092571	2018-05-25 09:29:25.092571
1213	2	405	\N	2018-05-25 09:29:25.095901	2018-05-25 09:29:25.095901
1214	3	405	\N	2018-05-25 09:29:25.097863	2018-05-25 09:29:25.097863
1215	1	405	\N	2018-05-25 09:29:25.099769	2018-05-25 09:29:25.099769
1216	2	406	\N	2018-05-25 09:29:25.105499	2018-05-25 09:29:25.105499
1217	3	406	\N	2018-05-25 09:29:25.10849	2018-05-25 09:29:25.10849
1218	1	406	\N	2018-05-25 09:29:25.110752	2018-05-25 09:29:25.110752
1219	2	407	\N	2018-05-25 09:29:25.115448	2018-05-25 09:29:25.115448
1220	3	407	\N	2018-05-25 09:29:25.117931	2018-05-25 09:29:25.117931
1221	1	407	\N	2018-05-25 09:29:25.120833	2018-05-25 09:29:25.120833
1222	2	408	\N	2018-05-25 09:29:25.128737	2018-05-25 09:29:25.128737
1223	3	408	\N	2018-05-25 09:29:25.130847	2018-05-25 09:29:25.130847
1224	1	408	\N	2018-05-25 09:29:25.132744	2018-05-25 09:29:25.132744
1225	2	409	\N	2018-05-25 09:29:25.13736	2018-05-25 09:29:25.13736
1226	3	409	\N	2018-05-25 09:29:25.139525	2018-05-25 09:29:25.139525
1227	1	409	\N	2018-05-25 09:29:25.141475	2018-05-25 09:29:25.141475
1228	2	410	\N	2018-05-25 09:29:25.145907	2018-05-25 09:29:25.145907
1229	3	410	\N	2018-05-25 09:29:25.147778	2018-05-25 09:29:25.147778
1230	1	410	\N	2018-05-25 09:29:25.149835	2018-05-25 09:29:25.149835
1231	2	411	\N	2018-05-25 09:29:25.154177	2018-05-25 09:29:25.154177
1232	3	411	\N	2018-05-25 09:29:25.156526	2018-05-25 09:29:25.156526
1233	1	411	\N	2018-05-25 09:29:25.158685	2018-05-25 09:29:25.158685
1234	2	412	\N	2018-05-25 09:29:25.163284	2018-05-25 09:29:25.163284
1235	3	412	\N	2018-05-25 09:29:25.165263	2018-05-25 09:29:25.165263
1236	1	412	\N	2018-05-25 09:29:25.167208	2018-05-25 09:29:25.167208
1237	2	413	\N	2018-05-25 09:29:25.171104	2018-05-25 09:29:25.171104
1238	3	413	\N	2018-05-25 09:29:25.172978	2018-05-25 09:29:25.172978
1239	1	413	\N	2018-05-25 09:29:25.175268	2018-05-25 09:29:25.175268
1240	2	414	\N	2018-05-25 09:29:25.180168	2018-05-25 09:29:25.180168
1241	3	414	\N	2018-05-25 09:29:25.183448	2018-05-25 09:29:25.183448
1242	1	414	\N	2018-05-25 09:29:25.185559	2018-05-25 09:29:25.185559
1243	2	415	\N	2018-05-25 09:29:25.189698	2018-05-25 09:29:25.189698
1244	3	415	\N	2018-05-25 09:29:25.191865	2018-05-25 09:29:25.191865
1245	1	415	\N	2018-05-25 09:29:25.194022	2018-05-25 09:29:25.194022
1246	2	416	\N	2018-05-25 09:29:25.198163	2018-05-25 09:29:25.198163
1247	3	416	\N	2018-05-25 09:29:25.200027	2018-05-25 09:29:25.200027
1248	1	416	\N	2018-05-25 09:29:25.201989	2018-05-25 09:29:25.201989
1249	2	417	\N	2018-05-25 09:29:25.206914	2018-05-25 09:29:25.206914
1250	3	417	\N	2018-05-25 09:29:25.208954	2018-05-25 09:29:25.208954
1251	1	417	\N	2018-05-25 09:29:25.211618	2018-05-25 09:29:25.211618
1252	2	418	\N	2018-05-25 09:29:25.217098	2018-05-25 09:29:25.217098
1253	3	418	\N	2018-05-25 09:29:25.218967	2018-05-25 09:29:25.218967
1254	1	418	\N	2018-05-25 09:29:25.220806	2018-05-25 09:29:25.220806
1255	2	419	\N	2018-05-25 09:29:25.225227	2018-05-25 09:29:25.225227
1256	3	419	\N	2018-05-25 09:29:25.227272	2018-05-25 09:29:25.227272
1257	1	419	\N	2018-05-25 09:29:25.229223	2018-05-25 09:29:25.229223
1258	2	420	\N	2018-05-25 09:29:25.233644	2018-05-25 09:29:25.233644
1259	3	420	\N	2018-05-25 09:29:25.236047	2018-05-25 09:29:25.236047
1260	1	420	\N	2018-05-25 09:29:25.238457	2018-05-25 09:29:25.238457
1261	2	421	\N	2018-05-25 09:29:25.243407	2018-05-25 09:29:25.243407
1262	3	421	\N	2018-05-25 09:29:25.245877	2018-05-25 09:29:25.245877
1263	1	421	\N	2018-05-25 09:29:25.248337	2018-05-25 09:29:25.248337
1264	2	422	\N	2018-05-25 09:29:25.253894	2018-05-25 09:29:25.253894
1265	3	422	\N	2018-05-25 09:29:25.256463	2018-05-25 09:29:25.256463
1266	1	422	\N	2018-05-25 09:29:25.25902	2018-05-25 09:29:25.25902
1267	2	423	\N	2018-05-25 09:29:25.264523	2018-05-25 09:29:25.264523
1268	3	423	\N	2018-05-25 09:29:25.267013	2018-05-25 09:29:25.267013
1269	1	423	\N	2018-05-25 09:29:25.269574	2018-05-25 09:29:25.269574
1270	2	424	\N	2018-05-25 09:29:25.274948	2018-05-25 09:29:25.274948
1271	3	424	\N	2018-05-25 09:29:25.277504	2018-05-25 09:29:25.277504
1272	1	424	\N	2018-05-25 09:29:25.279827	2018-05-25 09:29:25.279827
1273	2	425	\N	2018-05-25 09:29:25.28495	2018-05-25 09:29:25.28495
1274	3	425	\N	2018-05-25 09:29:25.287022	2018-05-25 09:29:25.287022
1275	1	425	\N	2018-05-25 09:29:25.288949	2018-05-25 09:29:25.288949
1276	2	426	\N	2018-05-25 09:29:25.293383	2018-05-25 09:29:25.293383
1277	3	426	\N	2018-05-25 09:29:25.29547	2018-05-25 09:29:25.29547
1278	1	426	\N	2018-05-25 09:29:25.297442	2018-05-25 09:29:25.297442
1279	2	427	\N	2018-05-25 09:29:25.30159	2018-05-25 09:29:25.30159
1280	3	427	\N	2018-05-25 09:29:25.303589	2018-05-25 09:29:25.303589
1281	1	427	\N	2018-05-25 09:29:25.305567	2018-05-25 09:29:25.305567
1282	2	428	\N	2018-05-25 09:29:25.309895	2018-05-25 09:29:25.309895
1283	3	428	\N	2018-05-25 09:29:25.312011	2018-05-25 09:29:25.312011
1284	1	428	\N	2018-05-25 09:29:25.313966	2018-05-25 09:29:25.313966
1285	2	429	\N	2018-05-25 09:29:25.318004	2018-05-25 09:29:25.318004
1286	3	429	\N	2018-05-25 09:29:25.320116	2018-05-25 09:29:25.320116
1287	1	429	\N	2018-05-25 09:29:25.322435	2018-05-25 09:29:25.322435
1288	2	430	\N	2018-05-25 09:29:25.326564	2018-05-25 09:29:25.326564
1289	3	430	\N	2018-05-25 09:29:25.328388	2018-05-25 09:29:25.328388
1290	1	430	\N	2018-05-25 09:29:25.330234	2018-05-25 09:29:25.330234
1291	2	431	\N	2018-05-25 09:29:25.334218	2018-05-25 09:29:25.334218
1292	3	431	\N	2018-05-25 09:29:25.336272	2018-05-25 09:29:25.336272
1293	1	431	\N	2018-05-25 09:29:25.338157	2018-05-25 09:29:25.338157
1294	2	432	\N	2018-05-25 09:29:25.342421	2018-05-25 09:29:25.342421
1295	3	432	\N	2018-05-25 09:29:25.34441	2018-05-25 09:29:25.34441
1296	1	432	\N	2018-05-25 09:29:25.346318	2018-05-25 09:29:25.346318
1297	2	433	\N	2018-05-25 09:29:25.351595	2018-05-25 09:29:25.351595
1298	3	433	\N	2018-05-25 09:29:25.353503	2018-05-25 09:29:25.353503
1299	1	433	\N	2018-05-25 09:29:25.355417	2018-05-25 09:29:25.355417
1300	2	434	\N	2018-05-25 09:29:25.359424	2018-05-25 09:29:25.359424
1301	3	434	\N	2018-05-25 09:29:25.361379	2018-05-25 09:29:25.361379
1302	1	434	\N	2018-05-25 09:29:25.363334	2018-05-25 09:29:25.363334
1303	2	435	\N	2018-05-25 09:29:25.366725	2018-05-25 09:29:25.366725
1304	3	435	\N	2018-05-25 09:29:25.368292	2018-05-25 09:29:25.368292
1305	1	435	\N	2018-05-25 09:29:25.369971	2018-05-25 09:29:25.369971
1306	2	436	\N	2018-05-25 09:29:25.373541	2018-05-25 09:29:25.373541
1307	3	436	\N	2018-05-25 09:29:25.375181	2018-05-25 09:29:25.375181
1308	1	436	\N	2018-05-25 09:29:25.37693	2018-05-25 09:29:25.37693
1309	2	437	\N	2018-05-25 09:29:25.380918	2018-05-25 09:29:25.380918
1310	3	437	\N	2018-05-25 09:29:25.38257	2018-05-25 09:29:25.38257
1311	1	437	\N	2018-05-25 09:29:25.384402	2018-05-25 09:29:25.384402
1312	2	438	\N	2018-05-25 09:29:25.388269	2018-05-25 09:29:25.388269
1313	3	438	\N	2018-05-25 09:29:25.390295	2018-05-25 09:29:25.390295
1314	1	438	\N	2018-05-25 09:29:25.392171	2018-05-25 09:29:25.392171
1315	2	439	\N	2018-05-25 09:29:25.396098	2018-05-25 09:29:25.396098
1316	3	439	\N	2018-05-25 09:29:25.398312	2018-05-25 09:29:25.398312
1317	1	439	\N	2018-05-25 09:29:25.400287	2018-05-25 09:29:25.400287
1318	2	440	\N	2018-05-25 09:29:25.404392	2018-05-25 09:29:25.404392
1319	3	440	\N	2018-05-25 09:29:25.406428	2018-05-25 09:29:25.406428
1320	1	440	\N	2018-05-25 09:29:25.408408	2018-05-25 09:29:25.408408
1321	2	441	\N	2018-05-25 09:29:25.413174	2018-05-25 09:29:25.413174
1322	3	441	\N	2018-05-25 09:29:25.415162	2018-05-25 09:29:25.415162
1323	1	441	\N	2018-05-25 09:29:25.417071	2018-05-25 09:29:25.417071
1324	2	442	\N	2018-05-25 09:29:25.421194	2018-05-25 09:29:25.421194
1325	3	442	\N	2018-05-25 09:29:25.423146	2018-05-25 09:29:25.423146
1326	1	442	\N	2018-05-25 09:29:25.425229	2018-05-25 09:29:25.425229
1327	2	443	\N	2018-05-25 09:29:25.429184	2018-05-25 09:29:25.429184
1328	3	443	\N	2018-05-25 09:29:25.431172	2018-05-25 09:29:25.431172
1329	1	443	\N	2018-05-25 09:29:25.433444	2018-05-25 09:29:25.433444
1330	2	444	\N	2018-05-25 09:29:25.43766	2018-05-25 09:29:25.43766
1331	3	444	\N	2018-05-25 09:29:25.440186	2018-05-25 09:29:25.440186
1332	1	444	\N	2018-05-25 09:29:25.442099	2018-05-25 09:29:25.442099
1333	2	445	\N	2018-05-25 09:29:25.446133	2018-05-25 09:29:25.446133
1334	3	445	\N	2018-05-25 09:29:25.447898	2018-05-25 09:29:25.447898
1335	1	445	\N	2018-05-25 09:29:25.449865	2018-05-25 09:29:25.449865
1336	2	446	\N	2018-05-25 09:29:25.453905	2018-05-25 09:29:25.453905
1337	3	446	\N	2018-05-25 09:29:25.456002	2018-05-25 09:29:25.456002
1338	1	446	\N	2018-05-25 09:29:25.459019	2018-05-25 09:29:25.459019
1339	2	447	\N	2018-05-25 09:29:25.46421	2018-05-25 09:29:25.46421
1340	3	447	\N	2018-05-25 09:29:25.467355	2018-05-25 09:29:25.467355
1341	1	447	\N	2018-05-25 09:29:25.469485	2018-05-25 09:29:25.469485
1342	2	448	\N	2018-05-25 09:29:25.473912	2018-05-25 09:29:25.473912
1343	3	448	\N	2018-05-25 09:29:25.477209	2018-05-25 09:29:25.477209
1344	1	448	\N	2018-05-25 09:29:25.479368	2018-05-25 09:29:25.479368
1345	2	449	\N	2018-05-25 09:29:25.484646	2018-05-25 09:29:25.484646
1346	3	449	\N	2018-05-25 09:29:25.487067	2018-05-25 09:29:25.487067
1347	1	449	\N	2018-05-25 09:29:25.489372	2018-05-25 09:29:25.489372
1348	2	450	\N	2018-05-25 09:29:25.494831	2018-05-25 09:29:25.494831
1349	3	450	\N	2018-05-25 09:29:25.497489	2018-05-25 09:29:25.497489
1350	1	450	\N	2018-05-25 09:29:25.500174	2018-05-25 09:29:25.500174
1351	2	451	\N	2018-05-25 09:29:25.505244	2018-05-25 09:29:25.505244
1352	3	451	\N	2018-05-25 09:29:25.507399	2018-05-25 09:29:25.507399
1353	1	451	\N	2018-05-25 09:29:25.509354	2018-05-25 09:29:25.509354
1354	2	452	\N	2018-05-25 09:29:25.51365	2018-05-25 09:29:25.51365
1355	3	452	\N	2018-05-25 09:29:25.515798	2018-05-25 09:29:25.515798
1356	1	452	\N	2018-05-25 09:29:25.51772	2018-05-25 09:29:25.51772
1357	2	453	\N	2018-05-25 09:29:25.522225	2018-05-25 09:29:25.522225
1358	3	453	\N	2018-05-25 09:29:25.524501	2018-05-25 09:29:25.524501
1359	1	453	\N	2018-05-25 09:29:25.526567	2018-05-25 09:29:25.526567
1360	2	454	\N	2018-05-25 09:29:25.530638	2018-05-25 09:29:25.530638
1361	3	454	\N	2018-05-25 09:29:25.532719	2018-05-25 09:29:25.532719
1362	1	454	\N	2018-05-25 09:29:25.534652	2018-05-25 09:29:25.534652
1363	2	455	\N	2018-05-25 09:29:25.538712	2018-05-25 09:29:25.538712
1364	3	455	\N	2018-05-25 09:29:25.540593	2018-05-25 09:29:25.540593
1365	1	455	\N	2018-05-25 09:29:25.542349	2018-05-25 09:29:25.542349
1366	2	456	\N	2018-05-25 09:29:25.546204	2018-05-25 09:29:25.546204
1367	3	456	\N	2018-05-25 09:29:25.548124	2018-05-25 09:29:25.548124
1368	1	456	\N	2018-05-25 09:29:25.550242	2018-05-25 09:29:25.550242
1369	2	457	\N	2018-05-25 09:29:25.555026	2018-05-25 09:29:25.555026
1370	3	457	\N	2018-05-25 09:29:25.556939	2018-05-25 09:29:25.556939
1371	1	457	\N	2018-05-25 09:29:25.55895	2018-05-25 09:29:25.55895
1372	2	458	\N	2018-05-25 09:29:25.563084	2018-05-25 09:29:25.563084
1373	3	458	\N	2018-05-25 09:29:25.565084	2018-05-25 09:29:25.565084
1374	1	458	\N	2018-05-25 09:29:25.567171	2018-05-25 09:29:25.567171
1375	2	459	\N	2018-05-25 09:29:25.571752	2018-05-25 09:29:25.571752
1376	3	459	\N	2018-05-25 09:29:25.573851	2018-05-25 09:29:25.573851
1377	1	459	\N	2018-05-25 09:29:25.575988	2018-05-25 09:29:25.575988
1378	2	460	\N	2018-05-25 09:29:25.580243	2018-05-25 09:29:25.580243
1379	3	460	\N	2018-05-25 09:29:25.582316	2018-05-25 09:29:25.582316
1380	1	460	\N	2018-05-25 09:29:25.584342	2018-05-25 09:29:25.584342
1381	2	461	\N	2018-05-25 09:29:25.589691	2018-05-25 09:29:25.589691
1382	3	461	\N	2018-05-25 09:29:25.591724	2018-05-25 09:29:25.591724
1383	1	461	\N	2018-05-25 09:29:25.593605	2018-05-25 09:29:25.593605
1384	2	462	\N	2018-05-25 09:29:25.597501	2018-05-25 09:29:25.597501
1385	3	462	\N	2018-05-25 09:29:25.599312	2018-05-25 09:29:25.599312
1386	1	462	\N	2018-05-25 09:29:25.601262	2018-05-25 09:29:25.601262
1387	2	463	\N	2018-05-25 09:29:25.607785	2018-05-25 09:29:25.607785
1388	3	463	\N	2018-05-25 09:29:25.610533	2018-05-25 09:29:25.610533
1389	1	463	\N	2018-05-25 09:29:25.614395	2018-05-25 09:29:25.614395
1390	2	464	\N	2018-05-25 09:29:25.619253	2018-05-25 09:29:25.619253
1391	3	464	\N	2018-05-25 09:29:25.621047	2018-05-25 09:29:25.621047
1392	1	464	\N	2018-05-25 09:29:25.622874	2018-05-25 09:29:25.622874
1393	2	465	\N	2018-05-25 09:29:25.630409	2018-05-25 09:29:25.630409
1394	3	465	\N	2018-05-25 09:29:25.632253	2018-05-25 09:29:25.632253
1395	1	465	\N	2018-05-25 09:29:25.634344	2018-05-25 09:29:25.634344
1396	2	466	\N	2018-05-25 09:29:25.638564	2018-05-25 09:29:25.638564
1397	3	466	\N	2018-05-25 09:29:25.640333	2018-05-25 09:29:25.640333
1398	1	466	\N	2018-05-25 09:29:25.642322	2018-05-25 09:29:25.642322
1399	2	467	\N	2018-05-25 09:29:25.648554	2018-05-25 09:29:25.648554
1400	3	467	\N	2018-05-25 09:29:25.650811	2018-05-25 09:29:25.650811
1401	1	467	\N	2018-05-25 09:29:25.652826	2018-05-25 09:29:25.652826
1402	2	468	\N	2018-05-25 09:29:25.657076	2018-05-25 09:29:25.657076
1403	3	468	\N	2018-05-25 09:29:25.658943	2018-05-25 09:29:25.658943
1404	1	468	\N	2018-05-25 09:29:25.660849	2018-05-25 09:29:25.660849
1405	2	469	\N	2018-05-25 09:29:25.664922	2018-05-25 09:29:25.664922
1406	3	469	\N	2018-05-25 09:29:25.666734	2018-05-25 09:29:25.666734
1407	1	469	\N	2018-05-25 09:29:25.668575	2018-05-25 09:29:25.668575
1408	2	470	\N	2018-05-25 09:29:25.672402	2018-05-25 09:29:25.672402
1409	3	470	\N	2018-05-25 09:29:25.674364	2018-05-25 09:29:25.674364
1410	1	470	\N	2018-05-25 09:29:25.67633	2018-05-25 09:29:25.67633
1411	2	471	\N	2018-05-25 09:29:25.680475	2018-05-25 09:29:25.680475
1412	3	471	\N	2018-05-25 09:29:25.682636	2018-05-25 09:29:25.682636
1413	1	471	\N	2018-05-25 09:29:25.684666	2018-05-25 09:29:25.684666
1414	2	472	\N	2018-05-25 09:29:25.688746	2018-05-25 09:29:25.688746
1415	3	472	\N	2018-05-25 09:29:25.690502	2018-05-25 09:29:25.690502
1416	1	472	\N	2018-05-25 09:29:25.692355	2018-05-25 09:29:25.692355
1417	2	473	\N	2018-05-25 09:29:25.696652	2018-05-25 09:29:25.696652
1418	3	473	\N	2018-05-25 09:29:25.698675	2018-05-25 09:29:25.698675
1419	1	473	\N	2018-05-25 09:29:25.700705	2018-05-25 09:29:25.700705
1420	2	474	\N	2018-05-25 09:29:25.704679	2018-05-25 09:29:25.704679
1421	3	474	\N	2018-05-25 09:29:25.706666	2018-05-25 09:29:25.706666
1422	1	474	\N	2018-05-25 09:29:25.708648	2018-05-25 09:29:25.708648
1423	2	475	\N	2018-05-25 09:29:25.713573	2018-05-25 09:29:25.713573
1424	3	475	\N	2018-05-25 09:29:25.715911	2018-05-25 09:29:25.715911
1425	1	475	\N	2018-05-25 09:29:25.718165	2018-05-25 09:29:25.718165
1426	2	476	\N	2018-05-25 09:29:25.722782	2018-05-25 09:29:25.722782
1427	3	476	\N	2018-05-25 09:29:25.725655	2018-05-25 09:29:25.725655
1428	1	476	\N	2018-05-25 09:29:25.727786	2018-05-25 09:29:25.727786
1429	2	477	\N	2018-05-25 09:29:25.731626	2018-05-25 09:29:25.731626
1430	3	477	\N	2018-05-25 09:29:25.733636	2018-05-25 09:29:25.733636
1431	1	477	\N	2018-05-25 09:29:25.73557	2018-05-25 09:29:25.73557
1432	2	478	\N	2018-05-25 09:29:25.739639	2018-05-25 09:29:25.739639
1433	3	478	\N	2018-05-25 09:29:25.741854	2018-05-25 09:29:25.741854
1434	1	478	\N	2018-05-25 09:29:25.74404	2018-05-25 09:29:25.74404
1435	2	479	\N	2018-05-25 09:29:25.747956	2018-05-25 09:29:25.747956
1436	3	479	\N	2018-05-25 09:29:25.749858	2018-05-25 09:29:25.749858
1437	1	479	\N	2018-05-25 09:29:25.751748	2018-05-25 09:29:25.751748
1438	2	480	\N	2018-05-25 09:29:25.755728	2018-05-25 09:29:25.755728
1439	3	480	\N	2018-05-25 09:29:25.757461	2018-05-25 09:29:25.757461
1440	1	480	\N	2018-05-25 09:29:25.759319	2018-05-25 09:29:25.759319
1441	2	481	\N	2018-05-25 09:29:25.765198	2018-05-25 09:29:25.765198
1442	3	481	\N	2018-05-25 09:29:25.767092	2018-05-25 09:29:25.767092
1443	1	481	\N	2018-05-25 09:29:25.768926	2018-05-25 09:29:25.768926
1444	2	482	\N	2018-05-25 09:29:25.77252	2018-05-25 09:29:25.77252
1445	3	482	\N	2018-05-25 09:29:25.774336	2018-05-25 09:29:25.774336
1446	1	482	\N	2018-05-25 09:29:25.776114	2018-05-25 09:29:25.776114
1447	2	483	\N	2018-05-25 09:29:25.780611	2018-05-25 09:29:25.780611
1448	3	483	\N	2018-05-25 09:29:25.782478	2018-05-25 09:29:25.782478
1449	1	483	\N	2018-05-25 09:29:25.784374	2018-05-25 09:29:25.784374
1450	2	484	\N	2018-05-25 09:29:25.788458	2018-05-25 09:29:25.788458
1451	3	484	\N	2018-05-25 09:29:25.79046	2018-05-25 09:29:25.79046
1452	1	484	\N	2018-05-25 09:29:25.79254	2018-05-25 09:29:25.79254
1453	2	485	\N	2018-05-25 09:29:25.796794	2018-05-25 09:29:25.796794
1454	3	485	\N	2018-05-25 09:29:25.799236	2018-05-25 09:29:25.799236
1455	1	485	\N	2018-05-25 09:29:25.801418	2018-05-25 09:29:25.801418
1456	2	486	\N	2018-05-25 09:29:25.805464	2018-05-25 09:29:25.805464
1457	3	486	\N	2018-05-25 09:29:25.807323	2018-05-25 09:29:25.807323
1458	1	486	\N	2018-05-25 09:29:25.809249	2018-05-25 09:29:25.809249
1459	2	487	\N	2018-05-25 09:29:25.813203	2018-05-25 09:29:25.813203
1460	3	487	\N	2018-05-25 09:29:25.815081	2018-05-25 09:29:25.815081
1461	1	487	\N	2018-05-25 09:29:25.817029	2018-05-25 09:29:25.817029
1462	2	488	\N	2018-05-25 09:29:25.820961	2018-05-25 09:29:25.820961
1463	3	488	\N	2018-05-25 09:29:25.8227	2018-05-25 09:29:25.8227
1464	1	488	\N	2018-05-25 09:29:25.824488	2018-05-25 09:29:25.824488
1465	2	489	\N	2018-05-25 09:29:25.829139	2018-05-25 09:29:25.829139
1466	3	489	\N	2018-05-25 09:29:25.831313	2018-05-25 09:29:25.831313
1467	1	489	\N	2018-05-25 09:29:25.833205	2018-05-25 09:29:25.833205
1468	2	490	\N	2018-05-25 09:29:25.837967	2018-05-25 09:29:25.837967
1469	3	490	\N	2018-05-25 09:29:25.840038	2018-05-25 09:29:25.840038
1470	1	490	\N	2018-05-25 09:29:25.841949	2018-05-25 09:29:25.841949
1471	2	491	\N	2018-05-25 09:29:25.845996	2018-05-25 09:29:25.845996
1472	3	491	\N	2018-05-25 09:29:25.847793	2018-05-25 09:29:25.847793
1473	1	491	\N	2018-05-25 09:29:25.849532	2018-05-25 09:29:25.849532
1474	2	492	\N	2018-05-25 09:29:25.852937	2018-05-25 09:29:25.852937
1475	3	492	\N	2018-05-25 09:29:25.854548	2018-05-25 09:29:25.854548
1476	1	492	\N	2018-05-25 09:29:25.856143	2018-05-25 09:29:25.856143
1477	2	493	\N	2018-05-25 09:29:25.859981	2018-05-25 09:29:25.859981
1478	3	493	\N	2018-05-25 09:29:25.861578	2018-05-25 09:29:25.861578
1479	1	493	\N	2018-05-25 09:29:25.863119	2018-05-25 09:29:25.863119
1480	2	494	\N	2018-05-25 09:29:25.866876	2018-05-25 09:29:25.866876
1481	3	494	\N	2018-05-25 09:29:25.868589	2018-05-25 09:29:25.868589
1482	1	494	\N	2018-05-25 09:29:25.870346	2018-05-25 09:29:25.870346
1483	2	495	\N	2018-05-25 09:29:25.874191	2018-05-25 09:29:25.874191
1484	3	495	\N	2018-05-25 09:29:25.876113	2018-05-25 09:29:25.876113
1485	1	495	\N	2018-05-25 09:29:25.878018	2018-05-25 09:29:25.878018
1486	2	496	\N	2018-05-25 09:29:25.882036	2018-05-25 09:29:25.882036
1487	3	496	\N	2018-05-25 09:29:25.883895	2018-05-25 09:29:25.883895
1488	1	496	\N	2018-05-25 09:29:25.885727	2018-05-25 09:29:25.885727
1489	2	497	\N	2018-05-25 09:29:25.890852	2018-05-25 09:29:25.890852
1490	3	497	\N	2018-05-25 09:29:25.892843	2018-05-25 09:29:25.892843
1491	1	497	\N	2018-05-25 09:29:25.894785	2018-05-25 09:29:25.894785
1492	2	498	\N	2018-05-25 09:29:25.898767	2018-05-25 09:29:25.898767
1493	3	498	\N	2018-05-25 09:29:25.900644	2018-05-25 09:29:25.900644
1494	1	498	\N	2018-05-25 09:29:25.902463	2018-05-25 09:29:25.902463
1495	2	499	\N	2018-05-25 09:29:25.90677	2018-05-25 09:29:25.90677
1496	3	499	\N	2018-05-25 09:29:25.909928	2018-05-25 09:29:25.909928
1497	1	499	\N	2018-05-25 09:29:25.912116	2018-05-25 09:29:25.912116
1498	2	500	\N	2018-05-25 09:29:25.916147	2018-05-25 09:29:25.916147
1499	3	500	\N	2018-05-25 09:29:25.917974	2018-05-25 09:29:25.917974
1500	1	500	\N	2018-05-25 09:29:25.919934	2018-05-25 09:29:25.919934
1501	2	501	\N	2018-05-25 09:29:25.924241	2018-05-25 09:29:25.924241
1502	3	501	\N	2018-05-25 09:29:25.926691	2018-05-25 09:29:25.926691
1503	1	501	\N	2018-05-25 09:29:25.928866	2018-05-25 09:29:25.928866
1504	2	502	\N	2018-05-25 09:29:25.933574	2018-05-25 09:29:25.933574
1505	3	502	\N	2018-05-25 09:29:25.93584	2018-05-25 09:29:25.93584
1506	1	502	\N	2018-05-25 09:29:25.937985	2018-05-25 09:29:25.937985
1507	2	503	\N	2018-05-25 09:29:25.942639	2018-05-25 09:29:25.942639
1508	3	503	\N	2018-05-25 09:29:25.945356	2018-05-25 09:29:25.945356
1509	1	503	\N	2018-05-25 09:29:25.948159	2018-05-25 09:29:25.948159
1510	2	504	\N	2018-05-25 09:29:25.952716	2018-05-25 09:29:25.952716
1511	3	504	\N	2018-05-25 09:29:25.954741	2018-05-25 09:29:25.954741
1512	1	504	\N	2018-05-25 09:29:25.95666	2018-05-25 09:29:25.95666
1513	2	505	\N	2018-05-25 09:29:25.961643	2018-05-25 09:29:25.961643
1514	3	505	\N	2018-05-25 09:29:25.964139	2018-05-25 09:29:25.964139
1515	1	505	\N	2018-05-25 09:29:25.966865	2018-05-25 09:29:25.966865
1516	2	506	\N	2018-05-25 09:29:25.972271	2018-05-25 09:29:25.972271
1517	3	506	\N	2018-05-25 09:29:25.974675	2018-05-25 09:29:25.974675
1518	1	506	\N	2018-05-25 09:29:25.976848	2018-05-25 09:29:25.976848
1519	2	507	\N	2018-05-25 09:29:25.981989	2018-05-25 09:29:25.981989
1520	3	507	\N	2018-05-25 09:29:25.984725	2018-05-25 09:29:25.984725
1521	1	507	\N	2018-05-25 09:29:25.987036	2018-05-25 09:29:25.987036
1522	2	508	\N	2018-05-25 09:29:25.992315	2018-05-25 09:29:25.992315
1523	3	508	\N	2018-05-25 09:29:25.994725	2018-05-25 09:29:25.994725
1524	1	508	\N	2018-05-25 09:29:25.997132	2018-05-25 09:29:25.997132
1525	2	509	\N	2018-05-25 09:29:26.00255	2018-05-25 09:29:26.00255
1526	3	509	\N	2018-05-25 09:29:26.005053	2018-05-25 09:29:26.005053
1527	1	509	\N	2018-05-25 09:29:26.007639	2018-05-25 09:29:26.007639
1528	2	510	\N	2018-05-25 09:29:26.014023	2018-05-25 09:29:26.014023
1529	3	510	\N	2018-05-25 09:29:26.016523	2018-05-25 09:29:26.016523
1530	1	510	\N	2018-05-25 09:29:26.01845	2018-05-25 09:29:26.01845
1531	2	511	\N	2018-05-25 09:29:26.022513	2018-05-25 09:29:26.022513
1532	3	511	\N	2018-05-25 09:29:26.024836	2018-05-25 09:29:26.024836
1533	1	511	\N	2018-05-25 09:29:26.027165	2018-05-25 09:29:26.027165
1534	2	512	\N	2018-05-25 09:29:26.031382	2018-05-25 09:29:26.031382
1535	3	512	\N	2018-05-25 09:29:26.033383	2018-05-25 09:29:26.033383
1536	1	512	\N	2018-05-25 09:29:26.035284	2018-05-25 09:29:26.035284
1537	2	513	\N	2018-05-25 09:29:26.039968	2018-05-25 09:29:26.039968
1538	3	513	\N	2018-05-25 09:29:26.0418	2018-05-25 09:29:26.0418
1539	1	513	\N	2018-05-25 09:29:26.043583	2018-05-25 09:29:26.043583
1540	2	514	\N	2018-05-25 09:29:26.047782	2018-05-25 09:29:26.047782
1541	3	514	\N	2018-05-25 09:29:26.049912	2018-05-25 09:29:26.049912
1542	1	514	\N	2018-05-25 09:29:26.051887	2018-05-25 09:29:26.051887
1543	2	515	\N	2018-05-25 09:29:26.056086	2018-05-25 09:29:26.056086
1544	3	515	\N	2018-05-25 09:29:26.05806	2018-05-25 09:29:26.05806
1545	1	515	\N	2018-05-25 09:29:26.059976	2018-05-25 09:29:26.059976
1546	2	516	\N	2018-05-25 09:29:26.064156	2018-05-25 09:29:26.064156
1547	3	516	\N	2018-05-25 09:29:26.066223	2018-05-25 09:29:26.066223
1548	1	516	\N	2018-05-25 09:29:26.068252	2018-05-25 09:29:26.068252
1549	2	517	\N	2018-05-25 09:29:26.071886	2018-05-25 09:29:26.071886
1550	3	517	\N	2018-05-25 09:29:26.073506	2018-05-25 09:29:26.073506
1551	1	517	\N	2018-05-25 09:29:26.075153	2018-05-25 09:29:26.075153
1552	2	518	\N	2018-05-25 09:29:26.078629	2018-05-25 09:29:26.078629
1553	3	518	\N	2018-05-25 09:29:26.080253	2018-05-25 09:29:26.080253
1554	1	518	\N	2018-05-25 09:29:26.081829	2018-05-25 09:29:26.081829
1555	2	519	\N	2018-05-25 09:29:26.085506	2018-05-25 09:29:26.085506
1556	3	519	\N	2018-05-25 09:29:26.087095	2018-05-25 09:29:26.087095
1557	1	519	\N	2018-05-25 09:29:26.08866	2018-05-25 09:29:26.08866
1558	2	520	\N	2018-05-25 09:29:26.092497	2018-05-25 09:29:26.092497
1559	3	520	\N	2018-05-25 09:29:26.09498	2018-05-25 09:29:26.09498
1560	1	520	\N	2018-05-25 09:29:26.096873	2018-05-25 09:29:26.096873
1561	2	521	\N	2018-05-25 09:29:26.102335	2018-05-25 09:29:26.102335
1562	3	521	\N	2018-05-25 09:29:26.105158	2018-05-25 09:29:26.105158
1563	1	521	\N	2018-05-25 09:29:26.107553	2018-05-25 09:29:26.107553
1564	2	522	\N	2018-05-25 09:29:26.112585	2018-05-25 09:29:26.112585
1565	3	522	\N	2018-05-25 09:29:26.114649	2018-05-25 09:29:26.114649
1566	1	522	\N	2018-05-25 09:29:26.117468	2018-05-25 09:29:26.117468
1567	2	523	\N	2018-05-25 09:29:26.122182	2018-05-25 09:29:26.122182
1568	3	523	\N	2018-05-25 09:29:26.126423	2018-05-25 09:29:26.126423
1569	1	523	\N	2018-05-25 09:29:26.130437	2018-05-25 09:29:26.130437
1570	2	524	\N	2018-05-25 09:29:26.134887	2018-05-25 09:29:26.134887
1571	3	524	\N	2018-05-25 09:29:26.137024	2018-05-25 09:29:26.137024
1572	1	524	\N	2018-05-25 09:29:26.139382	2018-05-25 09:29:26.139382
1573	2	525	\N	2018-05-25 09:29:26.144874	2018-05-25 09:29:26.144874
1574	3	525	\N	2018-05-25 09:29:26.147323	2018-05-25 09:29:26.147323
1575	1	525	\N	2018-05-25 09:29:26.149968	2018-05-25 09:29:26.149968
1576	2	526	\N	2018-05-25 09:29:26.154792	2018-05-25 09:29:26.154792
1577	3	526	\N	2018-05-25 09:29:26.157099	2018-05-25 09:29:26.157099
1578	1	526	\N	2018-05-25 09:29:26.16021	2018-05-25 09:29:26.16021
1579	2	527	\N	2018-05-25 09:29:26.16487	2018-05-25 09:29:26.16487
1580	3	527	\N	2018-05-25 09:29:26.167017	2018-05-25 09:29:26.167017
1581	1	527	\N	2018-05-25 09:29:26.169042	2018-05-25 09:29:26.169042
1582	2	528	\N	2018-05-25 09:29:26.174195	2018-05-25 09:29:26.174195
1583	3	528	\N	2018-05-25 09:29:26.176628	2018-05-25 09:29:26.176628
1584	1	528	\N	2018-05-25 09:29:26.17907	2018-05-25 09:29:26.17907
1585	2	529	\N	2018-05-25 09:29:26.186679	2018-05-25 09:29:26.186679
1586	3	529	\N	2018-05-25 09:29:26.189244	2018-05-25 09:29:26.189244
1587	1	529	\N	2018-05-25 09:29:26.191684	2018-05-25 09:29:26.191684
1588	2	530	\N	2018-05-25 09:29:26.196556	2018-05-25 09:29:26.196556
1589	3	530	\N	2018-05-25 09:29:26.198623	2018-05-25 09:29:26.198623
1590	1	530	\N	2018-05-25 09:29:26.200794	2018-05-25 09:29:26.200794
1591	2	531	\N	2018-05-25 09:29:26.205664	2018-05-25 09:29:26.205664
1592	3	531	\N	2018-05-25 09:29:26.207585	2018-05-25 09:29:26.207585
1593	1	531	\N	2018-05-25 09:29:26.209724	2018-05-25 09:29:26.209724
1594	2	532	\N	2018-05-25 09:29:26.213953	2018-05-25 09:29:26.213953
1595	3	532	\N	2018-05-25 09:29:26.215905	2018-05-25 09:29:26.215905
1596	1	532	\N	2018-05-25 09:29:26.217907	2018-05-25 09:29:26.217907
1597	2	533	\N	2018-05-25 09:29:26.222378	2018-05-25 09:29:26.222378
1598	3	533	\N	2018-05-25 09:29:26.224275	2018-05-25 09:29:26.224275
1599	1	533	\N	2018-05-25 09:29:26.226576	2018-05-25 09:29:26.226576
1600	2	534	\N	2018-05-25 09:29:26.23248	2018-05-25 09:29:26.23248
1601	3	534	\N	2018-05-25 09:29:26.234402	2018-05-25 09:29:26.234402
1602	1	534	\N	2018-05-25 09:29:26.236173	2018-05-25 09:29:26.236173
1603	2	535	\N	2018-05-25 09:29:26.240439	2018-05-25 09:29:26.240439
1604	3	535	\N	2018-05-25 09:29:26.242648	2018-05-25 09:29:26.242648
1605	1	535	\N	2018-05-25 09:29:26.245022	2018-05-25 09:29:26.245022
1606	2	536	\N	2018-05-25 09:29:26.249354	2018-05-25 09:29:26.249354
1607	3	536	\N	2018-05-25 09:29:26.251416	2018-05-25 09:29:26.251416
1608	1	536	\N	2018-05-25 09:29:26.253261	2018-05-25 09:29:26.253261
1609	2	537	\N	2018-05-25 09:29:26.257611	2018-05-25 09:29:26.257611
1610	3	537	\N	2018-05-25 09:29:26.259606	2018-05-25 09:29:26.259606
1611	1	537	\N	2018-05-25 09:29:26.26148	2018-05-25 09:29:26.26148
1612	2	538	\N	2018-05-25 09:29:26.266025	2018-05-25 09:29:26.266025
1613	3	538	\N	2018-05-25 09:29:26.267759	2018-05-25 09:29:26.267759
1614	1	538	\N	2018-05-25 09:29:26.269798	2018-05-25 09:29:26.269798
1615	2	539	\N	2018-05-25 09:29:26.274171	2018-05-25 09:29:26.274171
1616	3	539	\N	2018-05-25 09:29:26.276315	2018-05-25 09:29:26.276315
1617	1	539	\N	2018-05-25 09:29:26.27842	2018-05-25 09:29:26.27842
1618	2	540	\N	2018-05-25 09:29:26.282844	2018-05-25 09:29:26.282844
1619	3	540	\N	2018-05-25 09:29:26.284729	2018-05-25 09:29:26.284729
1620	1	540	\N	2018-05-25 09:29:26.286641	2018-05-25 09:29:26.286641
1621	2	541	\N	2018-05-25 09:29:26.29077	2018-05-25 09:29:26.29077
1622	3	541	\N	2018-05-25 09:29:26.292701	2018-05-25 09:29:26.292701
1623	1	541	\N	2018-05-25 09:29:26.294551	2018-05-25 09:29:26.294551
1624	2	542	\N	2018-05-25 09:29:26.298262	2018-05-25 09:29:26.298262
1625	3	542	\N	2018-05-25 09:29:26.300173	2018-05-25 09:29:26.300173
1626	1	542	\N	2018-05-25 09:29:26.30217	2018-05-25 09:29:26.30217
1627	2	543	\N	2018-05-25 09:29:26.306266	2018-05-25 09:29:26.306266
1628	3	543	\N	2018-05-25 09:29:26.308207	2018-05-25 09:29:26.308207
1629	1	543	\N	2018-05-25 09:29:26.310123	2018-05-25 09:29:26.310123
1630	2	544	\N	2018-05-25 09:29:26.313903	2018-05-25 09:29:26.313903
1631	3	544	\N	2018-05-25 09:29:26.31586	2018-05-25 09:29:26.31586
1632	1	544	\N	2018-05-25 09:29:26.317673	2018-05-25 09:29:26.317673
1633	2	545	\N	2018-05-25 09:29:26.32221	2018-05-25 09:29:26.32221
1634	3	545	\N	2018-05-25 09:29:26.324028	2018-05-25 09:29:26.324028
1635	1	545	\N	2018-05-25 09:29:26.325772	2018-05-25 09:29:26.325772
1636	2	546	\N	2018-05-25 09:29:26.329592	2018-05-25 09:29:26.329592
1637	3	546	\N	2018-05-25 09:29:26.33157	2018-05-25 09:29:26.33157
1638	1	546	\N	2018-05-25 09:29:26.333636	2018-05-25 09:29:26.333636
1639	2	547	\N	2018-05-25 09:29:26.337896	2018-05-25 09:29:26.337896
1640	3	547	\N	2018-05-25 09:29:26.339981	2018-05-25 09:29:26.339981
1641	1	547	\N	2018-05-25 09:29:26.341865	2018-05-25 09:29:26.341865
1642	2	548	\N	2018-05-25 09:29:26.345749	2018-05-25 09:29:26.345749
1643	3	548	\N	2018-05-25 09:29:26.347671	2018-05-25 09:29:26.347671
1644	1	548	\N	2018-05-25 09:29:26.349693	2018-05-25 09:29:26.349693
1645	2	549	\N	2018-05-25 09:29:26.353496	2018-05-25 09:29:26.353496
1646	3	549	\N	2018-05-25 09:29:26.355233	2018-05-25 09:29:26.355233
1647	1	549	\N	2018-05-25 09:29:26.357219	2018-05-25 09:29:26.357219
1648	2	550	\N	2018-05-25 09:29:26.361889	2018-05-25 09:29:26.361889
1649	3	550	\N	2018-05-25 09:29:26.364178	2018-05-25 09:29:26.364178
1650	1	550	\N	2018-05-25 09:29:26.366099	2018-05-25 09:29:26.366099
1651	2	551	\N	2018-05-25 09:29:26.37015	2018-05-25 09:29:26.37015
1652	3	551	\N	2018-05-25 09:29:26.372065	2018-05-25 09:29:26.372065
1653	1	551	\N	2018-05-25 09:29:26.373998	2018-05-25 09:29:26.373998
1654	2	552	\N	2018-05-25 09:29:26.377785	2018-05-25 09:29:26.377785
1655	3	552	\N	2018-05-25 09:29:26.379727	2018-05-25 09:29:26.379727
1656	1	552	\N	2018-05-25 09:29:26.381595	2018-05-25 09:29:26.381595
1657	2	553	\N	2018-05-25 09:29:26.385992	2018-05-25 09:29:26.385992
1658	3	553	\N	2018-05-25 09:29:26.387876	2018-05-25 09:29:26.387876
1659	1	553	\N	2018-05-25 09:29:26.389632	2018-05-25 09:29:26.389632
1660	2	554	\N	2018-05-25 09:29:26.393412	2018-05-25 09:29:26.393412
1661	3	554	\N	2018-05-25 09:29:26.395202	2018-05-25 09:29:26.395202
1662	1	554	\N	2018-05-25 09:29:26.396922	2018-05-25 09:29:26.396922
1663	2	555	\N	2018-05-25 09:29:26.400963	2018-05-25 09:29:26.400963
1664	3	555	\N	2018-05-25 09:29:26.402912	2018-05-25 09:29:26.402912
1665	1	555	\N	2018-05-25 09:29:26.40478	2018-05-25 09:29:26.40478
1666	2	556	\N	2018-05-25 09:29:26.40897	2018-05-25 09:29:26.40897
1667	3	556	\N	2018-05-25 09:29:26.410956	2018-05-25 09:29:26.410956
1668	1	556	\N	2018-05-25 09:29:26.412848	2018-05-25 09:29:26.412848
1669	2	557	\N	2018-05-25 09:29:26.416975	2018-05-25 09:29:26.416975
1670	3	557	\N	2018-05-25 09:29:26.419213	2018-05-25 09:29:26.419213
1671	1	557	\N	2018-05-25 09:29:26.421818	2018-05-25 09:29:26.421818
1672	2	558	\N	2018-05-25 09:29:26.426692	2018-05-25 09:29:26.426692
1673	3	558	\N	2018-05-25 09:29:26.428798	2018-05-25 09:29:26.428798
1674	1	558	\N	2018-05-25 09:29:26.430796	2018-05-25 09:29:26.430796
1675	2	559	\N	2018-05-25 09:29:26.434891	2018-05-25 09:29:26.434891
1676	3	559	\N	2018-05-25 09:29:26.436922	2018-05-25 09:29:26.436922
1677	1	559	\N	2018-05-25 09:29:26.439099	2018-05-25 09:29:26.439099
1678	2	560	\N	2018-05-25 09:29:26.443004	2018-05-25 09:29:26.443004
1679	3	560	\N	2018-05-25 09:29:26.444974	2018-05-25 09:29:26.444974
1680	1	560	\N	2018-05-25 09:29:26.44683	2018-05-25 09:29:26.44683
1681	2	561	\N	2018-05-25 09:29:26.453671	2018-05-25 09:29:26.453671
1682	3	561	\N	2018-05-25 09:29:26.457859	2018-05-25 09:29:26.457859
1683	1	561	\N	2018-05-25 09:29:26.459706	2018-05-25 09:29:26.459706
1684	2	562	\N	2018-05-25 09:29:26.463722	2018-05-25 09:29:26.463722
1685	3	562	\N	2018-05-25 09:29:26.465726	2018-05-25 09:29:26.465726
1686	1	562	\N	2018-05-25 09:29:26.46749	2018-05-25 09:29:26.46749
1687	2	563	\N	2018-05-25 09:29:26.471542	2018-05-25 09:29:26.471542
1688	3	563	\N	2018-05-25 09:29:26.473614	2018-05-25 09:29:26.473614
1689	1	563	\N	2018-05-25 09:29:26.47595	2018-05-25 09:29:26.47595
1690	2	564	\N	2018-05-25 09:29:26.480263	2018-05-25 09:29:26.480263
1691	3	564	\N	2018-05-25 09:29:26.482094	2018-05-25 09:29:26.482094
1692	1	564	\N	2018-05-25 09:29:26.483921	2018-05-25 09:29:26.483921
1693	2	565	\N	2018-05-25 09:29:26.487723	2018-05-25 09:29:26.487723
1694	3	565	\N	2018-05-25 09:29:26.489601	2018-05-25 09:29:26.489601
1695	1	565	\N	2018-05-25 09:29:26.49153	2018-05-25 09:29:26.49153
1696	2	566	\N	2018-05-25 09:29:26.495747	2018-05-25 09:29:26.495747
1697	3	566	\N	2018-05-25 09:29:26.497571	2018-05-25 09:29:26.497571
1698	1	566	\N	2018-05-25 09:29:26.499343	2018-05-25 09:29:26.499343
1699	2	567	\N	2018-05-25 09:29:26.503403	2018-05-25 09:29:26.503403
1700	3	567	\N	2018-05-25 09:29:26.505295	2018-05-25 09:29:26.505295
1701	1	567	\N	2018-05-25 09:29:26.507017	2018-05-25 09:29:26.507017
1702	2	568	\N	2018-05-25 09:29:26.511673	2018-05-25 09:29:26.511673
1703	3	568	\N	2018-05-25 09:29:26.513737	2018-05-25 09:29:26.513737
1704	1	568	\N	2018-05-25 09:29:26.515739	2018-05-25 09:29:26.515739
1705	2	569	\N	2018-05-25 09:29:26.520702	2018-05-25 09:29:26.520702
1706	3	569	\N	2018-05-25 09:29:26.522671	2018-05-25 09:29:26.522671
1707	1	569	\N	2018-05-25 09:29:26.524714	2018-05-25 09:29:26.524714
1708	2	570	\N	2018-05-25 09:29:26.530263	2018-05-25 09:29:26.530263
1709	3	570	\N	2018-05-25 09:29:26.532325	2018-05-25 09:29:26.532325
1710	1	570	\N	2018-05-25 09:29:26.534255	2018-05-25 09:29:26.534255
1711	2	571	\N	2018-05-25 09:29:26.538435	2018-05-25 09:29:26.538435
1712	3	571	\N	2018-05-25 09:29:26.540318	2018-05-25 09:29:26.540318
1713	1	571	\N	2018-05-25 09:29:26.542251	2018-05-25 09:29:26.542251
1714	2	572	\N	2018-05-25 09:29:26.546897	2018-05-25 09:29:26.546897
1715	3	572	\N	2018-05-25 09:29:26.54907	2018-05-25 09:29:26.54907
1716	1	572	\N	2018-05-25 09:29:26.551103	2018-05-25 09:29:26.551103
1717	2	573	\N	2018-05-25 09:29:26.555394	2018-05-25 09:29:26.555394
1718	3	573	\N	2018-05-25 09:29:26.558124	2018-05-25 09:29:26.558124
1719	1	573	\N	2018-05-25 09:29:26.560069	2018-05-25 09:29:26.560069
1720	2	574	\N	2018-05-25 09:29:26.564686	2018-05-25 09:29:26.564686
1721	3	574	\N	2018-05-25 09:29:26.566711	2018-05-25 09:29:26.566711
1722	1	574	\N	2018-05-25 09:29:26.568609	2018-05-25 09:29:26.568609
1723	2	575	\N	2018-05-25 09:29:26.572575	2018-05-25 09:29:26.572575
1724	3	575	\N	2018-05-25 09:29:26.574376	2018-05-25 09:29:26.574376
1725	1	575	\N	2018-05-25 09:29:26.576057	2018-05-25 09:29:26.576057
1726	2	576	\N	2018-05-25 09:29:26.579482	2018-05-25 09:29:26.579482
1727	3	576	\N	2018-05-25 09:29:26.581186	2018-05-25 09:29:26.581186
1728	1	576	\N	2018-05-25 09:29:26.582826	2018-05-25 09:29:26.582826
1729	2	577	\N	2018-05-25 09:29:26.587231	2018-05-25 09:29:26.587231
1730	3	577	\N	2018-05-25 09:29:26.589162	2018-05-25 09:29:26.589162
1731	1	577	\N	2018-05-25 09:29:26.591012	2018-05-25 09:29:26.591012
1732	2	578	\N	2018-05-25 09:29:26.594957	2018-05-25 09:29:26.594957
1733	3	578	\N	2018-05-25 09:29:26.597	2018-05-25 09:29:26.597
1734	1	578	\N	2018-05-25 09:29:26.59878	2018-05-25 09:29:26.59878
1735	2	579	\N	2018-05-25 09:29:26.603897	2018-05-25 09:29:26.603897
1736	3	579	\N	2018-05-25 09:29:26.606463	2018-05-25 09:29:26.606463
1737	1	579	\N	2018-05-25 09:29:26.608635	2018-05-25 09:29:26.608635
1738	2	580	\N	2018-05-25 09:29:26.61287	2018-05-25 09:29:26.61287
1739	3	580	\N	2018-05-25 09:29:26.614632	2018-05-25 09:29:26.614632
1740	1	580	\N	2018-05-25 09:29:26.616628	2018-05-25 09:29:26.616628
1741	2	581	\N	2018-05-25 09:29:26.620696	2018-05-25 09:29:26.620696
1742	3	581	\N	2018-05-25 09:29:26.622644	2018-05-25 09:29:26.622644
1743	1	581	\N	2018-05-25 09:29:26.625244	2018-05-25 09:29:26.625244
1744	2	582	\N	2018-05-25 09:29:26.629872	2018-05-25 09:29:26.629872
1745	3	582	\N	2018-05-25 09:29:26.631727	2018-05-25 09:29:26.631727
1746	1	582	\N	2018-05-25 09:29:26.633508	2018-05-25 09:29:26.633508
1747	2	583	\N	2018-05-25 09:29:26.637768	2018-05-25 09:29:26.637768
1748	3	583	\N	2018-05-25 09:29:26.639705	2018-05-25 09:29:26.639705
1749	1	583	\N	2018-05-25 09:29:26.641926	2018-05-25 09:29:26.641926
1750	2	584	\N	2018-05-25 09:29:26.646286	2018-05-25 09:29:26.646286
1751	3	584	\N	2018-05-25 09:29:26.648121	2018-05-25 09:29:26.648121
1752	1	584	\N	2018-05-25 09:29:26.649915	2018-05-25 09:29:26.649915
1753	2	585	\N	2018-05-25 09:29:26.653978	2018-05-25 09:29:26.653978
1754	3	585	\N	2018-05-25 09:29:26.655877	2018-05-25 09:29:26.655877
1755	1	585	\N	2018-05-25 09:29:26.657826	2018-05-25 09:29:26.657826
1756	2	586	\N	2018-05-25 09:29:26.66192	2018-05-25 09:29:26.66192
1757	3	586	\N	2018-05-25 09:29:26.663966	2018-05-25 09:29:26.663966
1758	1	586	\N	2018-05-25 09:29:26.665975	2018-05-25 09:29:26.665975
1759	2	587	\N	2018-05-25 09:29:26.670226	2018-05-25 09:29:26.670226
1760	3	587	\N	2018-05-25 09:29:26.672088	2018-05-25 09:29:26.672088
1761	1	587	\N	2018-05-25 09:29:26.674267	2018-05-25 09:29:26.674267
1762	2	588	\N	2018-05-25 09:29:26.678597	2018-05-25 09:29:26.678597
1763	3	588	\N	2018-05-25 09:29:26.68059	2018-05-25 09:29:26.68059
1764	1	588	\N	2018-05-25 09:29:26.682562	2018-05-25 09:29:26.682562
1765	2	589	\N	2018-05-25 09:29:26.686762	2018-05-25 09:29:26.686762
1766	3	589	\N	2018-05-25 09:29:26.688716	2018-05-25 09:29:26.688716
1767	1	589	\N	2018-05-25 09:29:26.690659	2018-05-25 09:29:26.690659
1768	2	590	\N	2018-05-25 09:29:26.694691	2018-05-25 09:29:26.694691
1769	3	590	\N	2018-05-25 09:29:26.696743	2018-05-25 09:29:26.696743
1770	1	590	\N	2018-05-25 09:29:26.698737	2018-05-25 09:29:26.698737
1771	2	591	\N	2018-05-25 09:29:26.702772	2018-05-25 09:29:26.702772
1772	3	591	\N	2018-05-25 09:29:26.704724	2018-05-25 09:29:26.704724
1773	1	591	\N	2018-05-25 09:29:26.706963	2018-05-25 09:29:26.706963
1774	2	592	\N	2018-05-25 09:29:26.712115	2018-05-25 09:29:26.712115
1775	3	592	\N	2018-05-25 09:29:26.714015	2018-05-25 09:29:26.714015
1776	1	592	\N	2018-05-25 09:29:26.716586	2018-05-25 09:29:26.716586
1777	2	593	\N	2018-05-25 09:29:26.723004	2018-05-25 09:29:26.723004
1778	3	593	\N	2018-05-25 09:29:26.726575	2018-05-25 09:29:26.726575
1779	1	593	\N	2018-05-25 09:29:26.729713	2018-05-25 09:29:26.729713
1780	2	594	\N	2018-05-25 09:29:26.734728	2018-05-25 09:29:26.734728
1781	3	594	\N	2018-05-25 09:29:26.736975	2018-05-25 09:29:26.736975
1782	1	594	\N	2018-05-25 09:29:26.739297	2018-05-25 09:29:26.739297
1783	2	595	\N	2018-05-25 09:29:26.746314	2018-05-25 09:29:26.746314
1784	3	595	\N	2018-05-25 09:29:26.749018	2018-05-25 09:29:26.749018
1785	1	595	\N	2018-05-25 09:29:26.751189	2018-05-25 09:29:26.751189
1786	2	596	\N	2018-05-25 09:29:26.756986	2018-05-25 09:29:26.756986
1787	3	596	\N	2018-05-25 09:29:26.760193	2018-05-25 09:29:26.760193
1788	1	596	\N	2018-05-25 09:29:26.762486	2018-05-25 09:29:26.762486
1789	2	597	\N	2018-05-25 09:29:26.768019	2018-05-25 09:29:26.768019
1790	3	597	\N	2018-05-25 09:29:26.770507	2018-05-25 09:29:26.770507
1791	1	597	\N	2018-05-25 09:29:26.772842	2018-05-25 09:29:26.772842
1792	2	598	\N	2018-05-25 09:29:26.780814	2018-05-25 09:29:26.780814
1793	3	598	\N	2018-05-25 09:29:26.783349	2018-05-25 09:29:26.783349
1794	1	598	\N	2018-05-25 09:29:26.785496	2018-05-25 09:29:26.785496
1795	2	599	\N	2018-05-25 09:29:26.791265	2018-05-25 09:29:26.791265
1796	3	599	\N	2018-05-25 09:29:26.795583	2018-05-25 09:29:26.795583
1797	1	599	\N	2018-05-25 09:29:26.798041	2018-05-25 09:29:26.798041
1798	2	600	\N	2018-05-25 09:29:26.803557	2018-05-25 09:29:26.803557
1799	3	600	\N	2018-05-25 09:29:26.805768	2018-05-25 09:29:26.805768
1800	1	600	\N	2018-05-25 09:29:26.808946	2018-05-25 09:29:26.808946
1801	2	601	\N	2018-05-25 09:29:26.816036	2018-05-25 09:29:26.816036
1802	3	601	\N	2018-05-25 09:29:26.818437	2018-05-25 09:29:26.818437
1803	1	601	\N	2018-05-25 09:29:26.821351	2018-05-25 09:29:26.821351
1804	2	602	\N	2018-05-25 09:29:26.829361	2018-05-25 09:29:26.829361
1805	3	602	\N	2018-05-25 09:29:26.833804	2018-05-25 09:29:26.833804
1806	1	602	\N	2018-05-25 09:29:26.836906	2018-05-25 09:29:26.836906
1807	2	603	\N	2018-05-25 09:29:26.846226	2018-05-25 09:29:26.846226
1808	3	603	\N	2018-05-25 09:29:26.850399	2018-05-25 09:29:26.850399
1809	1	603	\N	2018-05-25 09:29:26.853616	2018-05-25 09:29:26.853616
1810	2	604	\N	2018-05-25 09:29:26.863223	2018-05-25 09:29:26.863223
1811	3	604	\N	2018-05-25 09:29:26.869426	2018-05-25 09:29:26.869426
1812	1	604	\N	2018-05-25 09:29:26.873886	2018-05-25 09:29:26.873886
1813	2	605	\N	2018-05-25 09:29:26.881522	2018-05-25 09:29:26.881522
1814	3	605	\N	2018-05-25 09:29:26.884569	2018-05-25 09:29:26.884569
1815	1	605	\N	2018-05-25 09:29:26.890591	2018-05-25 09:29:26.890591
1816	2	606	\N	2018-05-25 09:29:26.898657	2018-05-25 09:29:26.898657
1817	3	606	\N	2018-05-25 09:29:26.901953	2018-05-25 09:29:26.901953
1818	1	606	\N	2018-05-25 09:29:26.905223	2018-05-25 09:29:26.905223
1819	2	607	\N	2018-05-25 09:29:26.913311	2018-05-25 09:29:26.913311
1820	3	607	\N	2018-05-25 09:29:26.916521	2018-05-25 09:29:26.916521
1821	1	607	\N	2018-05-25 09:29:26.91999	2018-05-25 09:29:26.91999
1822	2	608	\N	2018-05-25 09:29:26.926849	2018-05-25 09:29:26.926849
1823	3	608	\N	2018-05-25 09:29:26.928919	2018-05-25 09:29:26.928919
1824	1	608	\N	2018-05-25 09:29:26.933904	2018-05-25 09:29:26.933904
1825	2	609	\N	2018-05-25 09:29:26.941783	2018-05-25 09:29:26.941783
1826	3	609	\N	2018-05-25 09:29:26.946364	2018-05-25 09:29:26.946364
1827	1	609	\N	2018-05-25 09:29:26.953319	2018-05-25 09:29:26.953319
1828	2	610	\N	2018-05-25 09:29:26.960054	2018-05-25 09:29:26.960054
1829	3	610	\N	2018-05-25 09:29:26.96437	2018-05-25 09:29:26.96437
1830	1	610	\N	2018-05-25 09:29:26.968677	2018-05-25 09:29:26.968677
1831	2	611	\N	2018-05-25 09:29:26.974879	2018-05-25 09:29:26.974879
1832	3	611	\N	2018-05-25 09:29:26.977964	2018-05-25 09:29:26.977964
1833	1	611	\N	2018-05-25 09:29:26.980269	2018-05-25 09:29:26.980269
1834	2	612	\N	2018-05-25 09:29:26.985786	2018-05-25 09:29:26.985786
1835	3	612	\N	2018-05-25 09:29:26.988484	2018-05-25 09:29:26.988484
1836	1	612	\N	2018-05-25 09:29:26.991676	2018-05-25 09:29:26.991676
1837	2	613	\N	2018-05-25 09:29:27.000161	2018-05-25 09:29:27.000161
1838	3	613	\N	2018-05-25 09:29:27.003406	2018-05-25 09:29:27.003406
1839	1	613	\N	2018-05-25 09:29:27.005689	2018-05-25 09:29:27.005689
1840	2	614	\N	2018-05-25 09:29:27.009665	2018-05-25 09:29:27.009665
1841	3	614	\N	2018-05-25 09:29:27.011925	2018-05-25 09:29:27.011925
1842	1	614	\N	2018-05-25 09:29:27.014464	2018-05-25 09:29:27.014464
1843	2	615	\N	2018-05-25 09:29:27.019801	2018-05-25 09:29:27.019801
1844	3	615	\N	2018-05-25 09:29:27.02207	2018-05-25 09:29:27.02207
1845	1	615	\N	2018-05-25 09:29:27.024658	2018-05-25 09:29:27.024658
1846	2	616	\N	2018-05-25 09:29:27.030655	2018-05-25 09:29:27.030655
1847	3	616	\N	2018-05-25 09:29:27.034515	2018-05-25 09:29:27.034515
1848	1	616	\N	2018-05-25 09:29:27.03653	2018-05-25 09:29:27.03653
1849	2	617	\N	2018-05-25 09:29:27.04173	2018-05-25 09:29:27.04173
1850	3	617	\N	2018-05-25 09:29:27.04391	2018-05-25 09:29:27.04391
1851	1	617	\N	2018-05-25 09:29:27.046018	2018-05-25 09:29:27.046018
1852	2	618	\N	2018-05-25 09:29:27.050361	2018-05-25 09:29:27.050361
1853	3	618	\N	2018-05-25 09:29:27.05222	2018-05-25 09:29:27.05222
1854	1	618	\N	2018-05-25 09:29:27.054025	2018-05-25 09:29:27.054025
1855	2	619	\N	2018-05-25 09:29:27.058671	2018-05-25 09:29:27.058671
1856	3	619	\N	2018-05-25 09:29:27.060617	2018-05-25 09:29:27.060617
1857	1	619	\N	2018-05-25 09:29:27.062607	2018-05-25 09:29:27.062607
1858	2	620	\N	2018-05-25 09:29:27.066793	2018-05-25 09:29:27.066793
1859	3	620	\N	2018-05-25 09:29:27.068953	2018-05-25 09:29:27.068953
1860	1	620	\N	2018-05-25 09:29:27.07075	2018-05-25 09:29:27.07075
1861	2	621	\N	2018-05-25 09:29:27.074545	2018-05-25 09:29:27.074545
1862	3	621	\N	2018-05-25 09:29:27.076789	2018-05-25 09:29:27.076789
1863	1	621	\N	2018-05-25 09:29:27.078789	2018-05-25 09:29:27.078789
1864	2	622	\N	2018-05-25 09:29:27.082883	2018-05-25 09:29:27.082883
1865	3	622	\N	2018-05-25 09:29:27.084837	2018-05-25 09:29:27.084837
1866	1	622	\N	2018-05-25 09:29:27.086884	2018-05-25 09:29:27.086884
1867	2	623	\N	2018-05-25 09:29:27.091058	2018-05-25 09:29:27.091058
1868	3	623	\N	2018-05-25 09:29:27.093114	2018-05-25 09:29:27.093114
1869	1	623	\N	2018-05-25 09:29:27.095414	2018-05-25 09:29:27.095414
1870	2	624	\N	2018-05-25 09:29:27.099701	2018-05-25 09:29:27.099701
1871	3	624	\N	2018-05-25 09:29:27.10427	2018-05-25 09:29:27.10427
1872	1	624	\N	2018-05-25 09:29:27.107454	2018-05-25 09:29:27.107454
1873	2	625	\N	2018-05-25 09:29:27.115046	2018-05-25 09:29:27.115046
1874	3	625	\N	2018-05-25 09:29:27.11753	2018-05-25 09:29:27.11753
1875	1	625	\N	2018-05-25 09:29:27.119766	2018-05-25 09:29:27.119766
1876	2	626	\N	2018-05-25 09:29:27.13075	2018-05-25 09:29:27.13075
1877	3	626	\N	2018-05-25 09:29:27.132853	2018-05-25 09:29:27.132853
1878	1	626	\N	2018-05-25 09:29:27.134985	2018-05-25 09:29:27.134985
1879	2	627	\N	2018-05-25 09:29:27.139747	2018-05-25 09:29:27.139747
1880	3	627	\N	2018-05-25 09:29:27.142435	2018-05-25 09:29:27.142435
1881	1	627	\N	2018-05-25 09:29:27.144555	2018-05-25 09:29:27.144555
1882	2	628	\N	2018-05-25 09:29:27.148864	2018-05-25 09:29:27.148864
1883	3	628	\N	2018-05-25 09:29:27.150695	2018-05-25 09:29:27.150695
1884	1	628	\N	2018-05-25 09:29:27.152958	2018-05-25 09:29:27.152958
1885	2	629	\N	2018-05-25 09:29:27.158234	2018-05-25 09:29:27.158234
1886	3	629	\N	2018-05-25 09:29:27.16133	2018-05-25 09:29:27.16133
1887	1	629	\N	2018-05-25 09:29:27.163322	2018-05-25 09:29:27.163322
1888	2	630	\N	2018-05-25 09:29:27.167338	2018-05-25 09:29:27.167338
1889	3	630	\N	2018-05-25 09:29:27.169446	2018-05-25 09:29:27.169446
1890	1	630	\N	2018-05-25 09:29:27.171719	2018-05-25 09:29:27.171719
1891	2	631	\N	2018-05-25 09:29:27.177474	2018-05-25 09:29:27.177474
1892	3	631	\N	2018-05-25 09:29:27.179545	2018-05-25 09:29:27.179545
1893	1	631	\N	2018-05-25 09:29:27.181656	2018-05-25 09:29:27.181656
1894	2	632	\N	2018-05-25 09:29:27.185686	2018-05-25 09:29:27.185686
1895	3	632	\N	2018-05-25 09:29:27.18756	2018-05-25 09:29:27.18756
1896	1	632	\N	2018-05-25 09:29:27.189803	2018-05-25 09:29:27.189803
1897	2	633	\N	2018-05-25 09:29:27.195576	2018-05-25 09:29:27.195576
1898	3	633	\N	2018-05-25 09:29:27.197627	2018-05-25 09:29:27.197627
1899	1	633	\N	2018-05-25 09:29:27.19949	2018-05-25 09:29:27.19949
1900	2	634	\N	2018-05-25 09:29:27.203561	2018-05-25 09:29:27.203561
1901	3	634	\N	2018-05-25 09:29:27.205661	2018-05-25 09:29:27.205661
1902	1	634	\N	2018-05-25 09:29:27.208151	2018-05-25 09:29:27.208151
1903	2	635	\N	2018-05-25 09:29:27.213001	2018-05-25 09:29:27.213001
1904	3	635	\N	2018-05-25 09:29:27.215087	2018-05-25 09:29:27.215087
1905	1	635	\N	2018-05-25 09:29:27.216986	2018-05-25 09:29:27.216986
1906	2	636	\N	2018-05-25 09:29:27.22112	2018-05-25 09:29:27.22112
1907	3	636	\N	2018-05-25 09:29:27.223213	2018-05-25 09:29:27.223213
1908	1	636	\N	2018-05-25 09:29:27.225569	2018-05-25 09:29:27.225569
1909	2	637	\N	2018-05-25 09:29:27.230145	2018-05-25 09:29:27.230145
1910	3	637	\N	2018-05-25 09:29:27.232015	2018-05-25 09:29:27.232015
1911	1	637	\N	2018-05-25 09:29:27.233931	2018-05-25 09:29:27.233931
1912	2	638	\N	2018-05-25 09:29:27.237992	2018-05-25 09:29:27.237992
1913	3	638	\N	2018-05-25 09:29:27.239972	2018-05-25 09:29:27.239972
1914	1	638	\N	2018-05-25 09:29:27.242293	2018-05-25 09:29:27.242293
1915	2	639	\N	2018-05-25 09:29:27.246885	2018-05-25 09:29:27.246885
1916	3	639	\N	2018-05-25 09:29:27.248954	2018-05-25 09:29:27.248954
1917	1	639	\N	2018-05-25 09:29:27.250859	2018-05-25 09:29:27.250859
1918	2	640	\N	2018-05-25 09:29:27.254948	2018-05-25 09:29:27.254948
1919	3	640	\N	2018-05-25 09:29:27.256921	2018-05-25 09:29:27.256921
1920	1	640	\N	2018-05-25 09:29:27.259911	2018-05-25 09:29:27.259911
1921	2	641	\N	2018-05-25 09:29:27.266158	2018-05-25 09:29:27.266158
1922	3	641	\N	2018-05-25 09:29:27.268265	2018-05-25 09:29:27.268265
1923	1	641	\N	2018-05-25 09:29:27.270216	2018-05-25 09:29:27.270216
1924	2	642	\N	2018-05-25 09:29:27.27663	2018-05-25 09:29:27.27663
1925	3	642	\N	2018-05-25 09:29:27.278998	2018-05-25 09:29:27.278998
1926	1	642	\N	2018-05-25 09:29:27.281044	2018-05-25 09:29:27.281044
1927	2	643	\N	2018-05-25 09:29:27.285286	2018-05-25 09:29:27.285286
1928	3	643	\N	2018-05-25 09:29:27.287191	2018-05-25 09:29:27.287191
1929	1	643	\N	2018-05-25 09:29:27.289095	2018-05-25 09:29:27.289095
1930	2	644	\N	2018-05-25 09:29:27.294395	2018-05-25 09:29:27.294395
1931	3	644	\N	2018-05-25 09:29:27.29664	2018-05-25 09:29:27.29664
1932	1	644	\N	2018-05-25 09:29:27.298568	2018-05-25 09:29:27.298568
1933	2	645	\N	2018-05-25 09:29:27.302707	2018-05-25 09:29:27.302707
1934	3	645	\N	2018-05-25 09:29:27.305484	2018-05-25 09:29:27.305484
1935	1	645	\N	2018-05-25 09:29:27.307477	2018-05-25 09:29:27.307477
1936	2	646	\N	2018-05-25 09:29:27.312156	2018-05-25 09:29:27.312156
1937	3	646	\N	2018-05-25 09:29:27.314254	2018-05-25 09:29:27.314254
1938	1	646	\N	2018-05-25 09:29:27.316239	2018-05-25 09:29:27.316239
1939	2	647	\N	2018-05-25 09:29:27.320308	2018-05-25 09:29:27.320308
1940	3	647	\N	2018-05-25 09:29:27.322294	2018-05-25 09:29:27.322294
1941	1	647	\N	2018-05-25 09:29:27.324464	2018-05-25 09:29:27.324464
1942	2	648	\N	2018-05-25 09:29:27.329433	2018-05-25 09:29:27.329433
1943	3	648	\N	2018-05-25 09:29:27.331468	2018-05-25 09:29:27.331468
1944	1	648	\N	2018-05-25 09:29:27.333215	2018-05-25 09:29:27.333215
1945	2	649	\N	2018-05-25 09:29:27.337982	2018-05-25 09:29:27.337982
1946	3	649	\N	2018-05-25 09:29:27.339947	2018-05-25 09:29:27.339947
1947	1	649	\N	2018-05-25 09:29:27.342485	2018-05-25 09:29:27.342485
1948	2	650	\N	2018-05-25 09:29:27.346896	2018-05-25 09:29:27.346896
1949	3	650	\N	2018-05-25 09:29:27.348791	2018-05-25 09:29:27.348791
1950	1	650	\N	2018-05-25 09:29:27.350695	2018-05-25 09:29:27.350695
1951	2	651	\N	2018-05-25 09:29:27.355035	2018-05-25 09:29:27.355035
1952	3	651	\N	2018-05-25 09:29:27.357129	2018-05-25 09:29:27.357129
1953	1	651	\N	2018-05-25 09:29:27.359678	2018-05-25 09:29:27.359678
1954	2	652	\N	2018-05-25 09:29:27.364163	2018-05-25 09:29:27.364163
1955	3	652	\N	2018-05-25 09:29:27.36626	2018-05-25 09:29:27.36626
1956	1	652	\N	2018-05-25 09:29:27.368263	2018-05-25 09:29:27.368263
1957	2	653	\N	2018-05-25 09:29:27.372582	2018-05-25 09:29:27.372582
1958	3	653	\N	2018-05-25 09:29:27.37525	2018-05-25 09:29:27.37525
1959	1	653	\N	2018-05-25 09:29:27.37753	2018-05-25 09:29:27.37753
1960	2	654	\N	2018-05-25 09:29:27.381604	2018-05-25 09:29:27.381604
1961	3	654	\N	2018-05-25 09:29:27.383565	2018-05-25 09:29:27.383565
1962	1	654	\N	2018-05-25 09:29:27.385489	2018-05-25 09:29:27.385489
1963	2	655	\N	2018-05-25 09:29:27.389342	2018-05-25 09:29:27.389342
1964	3	655	\N	2018-05-25 09:29:27.39163	2018-05-25 09:29:27.39163
1965	1	655	\N	2018-05-25 09:29:27.393803	2018-05-25 09:29:27.393803
1966	2	656	\N	2018-05-25 09:29:27.398018	2018-05-25 09:29:27.398018
1967	3	656	\N	2018-05-25 09:29:27.399989	2018-05-25 09:29:27.399989
1968	1	656	\N	2018-05-25 09:29:27.40188	2018-05-25 09:29:27.40188
1969	2	657	\N	2018-05-25 09:29:27.406814	2018-05-25 09:29:27.406814
1970	3	657	\N	2018-05-25 09:29:27.408968	2018-05-25 09:29:27.408968
1971	1	657	\N	2018-05-25 09:29:27.411134	2018-05-25 09:29:27.411134
1972	2	658	\N	2018-05-25 09:29:27.415218	2018-05-25 09:29:27.415218
1973	3	658	\N	2018-05-25 09:29:27.417173	2018-05-25 09:29:27.417173
1974	1	658	\N	2018-05-25 09:29:27.419046	2018-05-25 09:29:27.419046
1975	2	659	\N	2018-05-25 09:29:27.422871	2018-05-25 09:29:27.422871
1976	3	659	\N	2018-05-25 09:29:27.425073	2018-05-25 09:29:27.425073
1977	1	659	\N	2018-05-25 09:29:27.42726	2018-05-25 09:29:27.42726
1978	2	660	\N	2018-05-25 09:29:27.431146	2018-05-25 09:29:27.431146
1979	3	660	\N	2018-05-25 09:29:27.432894	2018-05-25 09:29:27.432894
1980	1	660	\N	2018-05-25 09:29:27.434569	2018-05-25 09:29:27.434569
1981	2	661	\N	2018-05-25 09:29:27.437888	2018-05-25 09:29:27.437888
1982	3	661	\N	2018-05-25 09:29:27.439878	2018-05-25 09:29:27.439878
1983	1	661	\N	2018-05-25 09:29:27.441825	2018-05-25 09:29:27.441825
1984	2	662	\N	2018-05-25 09:29:27.446334	2018-05-25 09:29:27.446334
1985	3	662	\N	2018-05-25 09:29:27.448348	2018-05-25 09:29:27.448348
1986	1	662	\N	2018-05-25 09:29:27.450163	2018-05-25 09:29:27.450163
1987	2	663	\N	2018-05-25 09:29:27.454369	2018-05-25 09:29:27.454369
1988	3	663	\N	2018-05-25 09:29:27.456521	2018-05-25 09:29:27.456521
1989	1	663	\N	2018-05-25 09:29:27.458958	2018-05-25 09:29:27.458958
1990	2	664	\N	2018-05-25 09:29:27.463435	2018-05-25 09:29:27.463435
1991	3	664	\N	2018-05-25 09:29:27.465241	2018-05-25 09:29:27.465241
1992	1	664	\N	2018-05-25 09:29:27.46722	2018-05-25 09:29:27.46722
1993	2	665	\N	2018-05-25 09:29:27.471564	2018-05-25 09:29:27.471564
1994	3	665	\N	2018-05-25 09:29:27.473707	2018-05-25 09:29:27.473707
1995	1	665	\N	2018-05-25 09:29:27.475963	2018-05-25 09:29:27.475963
1996	2	666	\N	2018-05-25 09:29:27.480059	2018-05-25 09:29:27.480059
1997	3	666	\N	2018-05-25 09:29:27.482029	2018-05-25 09:29:27.482029
1998	1	666	\N	2018-05-25 09:29:27.484001	2018-05-25 09:29:27.484001
1999	2	667	\N	2018-05-25 09:29:27.488373	2018-05-25 09:29:27.488373
2000	3	667	\N	2018-05-25 09:29:27.490284	2018-05-25 09:29:27.490284
2001	1	667	\N	2018-05-25 09:29:27.49271	2018-05-25 09:29:27.49271
2002	2	668	\N	2018-05-25 09:29:27.496995	2018-05-25 09:29:27.496995
2003	3	668	\N	2018-05-25 09:29:27.499045	2018-05-25 09:29:27.499045
2004	1	668	\N	2018-05-25 09:29:27.500889	2018-05-25 09:29:27.500889
2005	2	669	\N	2018-05-25 09:29:27.50462	2018-05-25 09:29:27.50462
2006	3	669	\N	2018-05-25 09:29:27.507575	2018-05-25 09:29:27.507575
2007	1	669	\N	2018-05-25 09:29:27.50956	2018-05-25 09:29:27.50956
2008	2	670	\N	2018-05-25 09:29:27.513743	2018-05-25 09:29:27.513743
2009	3	670	\N	2018-05-25 09:29:27.515484	2018-05-25 09:29:27.515484
2010	1	670	\N	2018-05-25 09:29:27.517331	2018-05-25 09:29:27.517331
2011	2	671	\N	2018-05-25 09:29:27.522161	2018-05-25 09:29:27.522161
2012	3	671	\N	2018-05-25 09:29:27.52448	2018-05-25 09:29:27.52448
2013	1	671	\N	2018-05-25 09:29:27.526623	2018-05-25 09:29:27.526623
2014	2	672	\N	2018-05-25 09:29:27.53072	2018-05-25 09:29:27.53072
2015	3	672	\N	2018-05-25 09:29:27.532701	2018-05-25 09:29:27.532701
2016	1	672	\N	2018-05-25 09:29:27.534494	2018-05-25 09:29:27.534494
2017	2	673	\N	2018-05-25 09:29:27.539766	2018-05-25 09:29:27.539766
2018	3	673	\N	2018-05-25 09:29:27.542028	2018-05-25 09:29:27.542028
2019	1	673	\N	2018-05-25 09:29:27.544056	2018-05-25 09:29:27.544056
2020	2	674	\N	2018-05-25 09:29:27.54797	2018-05-25 09:29:27.54797
2021	3	674	\N	2018-05-25 09:29:27.549965	2018-05-25 09:29:27.549965
2022	1	674	\N	2018-05-25 09:29:27.551817	2018-05-25 09:29:27.551817
2023	2	675	\N	2018-05-25 09:29:27.555762	2018-05-25 09:29:27.555762
2024	3	675	\N	2018-05-25 09:29:27.558035	2018-05-25 09:29:27.558035
2025	1	675	\N	2018-05-25 09:29:27.560126	2018-05-25 09:29:27.560126
2026	2	676	\N	2018-05-25 09:29:27.564385	2018-05-25 09:29:27.564385
2027	3	676	\N	2018-05-25 09:29:27.566382	2018-05-25 09:29:27.566382
2028	1	676	\N	2018-05-25 09:29:27.56838	2018-05-25 09:29:27.56838
2029	2	677	\N	2018-05-25 09:29:27.572469	2018-05-25 09:29:27.572469
2030	3	677	\N	2018-05-25 09:29:27.57464	2018-05-25 09:29:27.57464
2031	1	677	\N	2018-05-25 09:29:27.576747	2018-05-25 09:29:27.576747
2032	2	678	\N	2018-05-25 09:29:27.581086	2018-05-25 09:29:27.581086
2033	3	678	\N	2018-05-25 09:29:27.583306	2018-05-25 09:29:27.583306
2034	1	678	\N	2018-05-25 09:29:27.58544	2018-05-25 09:29:27.58544
2035	2	679	\N	2018-05-25 09:29:27.590692	2018-05-25 09:29:27.590692
2036	3	679	\N	2018-05-25 09:29:27.592792	2018-05-25 09:29:27.592792
2037	1	679	\N	2018-05-25 09:29:27.594805	2018-05-25 09:29:27.594805
2038	2	680	\N	2018-05-25 09:29:27.598963	2018-05-25 09:29:27.598963
2039	3	680	\N	2018-05-25 09:29:27.601194	2018-05-25 09:29:27.601194
2040	1	680	\N	2018-05-25 09:29:27.603722	2018-05-25 09:29:27.603722
2041	2	681	\N	2018-05-25 09:29:27.608992	2018-05-25 09:29:27.608992
2042	3	681	\N	2018-05-25 09:29:27.611154	2018-05-25 09:29:27.611154
2043	1	681	\N	2018-05-25 09:29:27.613022	2018-05-25 09:29:27.613022
2044	2	682	\N	2018-05-25 09:29:27.617	2018-05-25 09:29:27.617
2045	3	682	\N	2018-05-25 09:29:27.61887	2018-05-25 09:29:27.61887
2046	1	682	\N	2018-05-25 09:29:27.620693	2018-05-25 09:29:27.620693
2047	2	683	\N	2018-05-25 09:29:27.625442	2018-05-25 09:29:27.625442
2048	3	683	\N	2018-05-25 09:29:27.62757	2018-05-25 09:29:27.62757
2049	1	683	\N	2018-05-25 09:29:27.629456	2018-05-25 09:29:27.629456
2050	2	684	\N	2018-05-25 09:29:27.633453	2018-05-25 09:29:27.633453
2051	3	684	\N	2018-05-25 09:29:27.635241	2018-05-25 09:29:27.635241
2052	1	684	\N	2018-05-25 09:29:27.63731	2018-05-25 09:29:27.63731
2053	2	685	\N	2018-05-25 09:29:27.641849	2018-05-25 09:29:27.641849
2054	3	685	\N	2018-05-25 09:29:27.643955	2018-05-25 09:29:27.643955
2055	1	685	\N	2018-05-25 09:29:27.645747	2018-05-25 09:29:27.645747
2056	2	686	\N	2018-05-25 09:29:27.64947	2018-05-25 09:29:27.64947
2057	3	686	\N	2018-05-25 09:29:27.6513	2018-05-25 09:29:27.6513
2058	1	686	\N	2018-05-25 09:29:27.653183	2018-05-25 09:29:27.653183
2059	2	687	\N	2018-05-25 09:29:27.657875	2018-05-25 09:29:27.657875
2060	3	687	\N	2018-05-25 09:29:27.660107	2018-05-25 09:29:27.660107
2061	1	687	\N	2018-05-25 09:29:27.662217	2018-05-25 09:29:27.662217
2062	2	688	\N	2018-05-25 09:29:27.666178	2018-05-25 09:29:27.666178
2063	3	688	\N	2018-05-25 09:29:27.667955	2018-05-25 09:29:27.667955
2064	1	688	\N	2018-05-25 09:29:27.669714	2018-05-25 09:29:27.669714
2065	2	689	\N	2018-05-25 09:29:27.674933	2018-05-25 09:29:27.674933
2066	3	689	\N	2018-05-25 09:29:27.677072	2018-05-25 09:29:27.677072
2067	1	689	\N	2018-05-25 09:29:27.679067	2018-05-25 09:29:27.679067
2068	2	690	\N	2018-05-25 09:29:27.683416	2018-05-25 09:29:27.683416
2069	3	690	\N	2018-05-25 09:29:27.685447	2018-05-25 09:29:27.685447
2070	1	690	\N	2018-05-25 09:29:27.687478	2018-05-25 09:29:27.687478
2071	2	691	\N	2018-05-25 09:29:27.691749	2018-05-25 09:29:27.691749
2072	3	691	\N	2018-05-25 09:29:27.693785	2018-05-25 09:29:27.693785
2073	1	691	\N	2018-05-25 09:29:27.696194	2018-05-25 09:29:27.696194
2074	2	692	\N	2018-05-25 09:29:27.703687	2018-05-25 09:29:27.703687
2075	3	692	\N	2018-05-25 09:29:27.706278	2018-05-25 09:29:27.706278
2076	1	692	\N	2018-05-25 09:29:27.709449	2018-05-25 09:29:27.709449
2077	2	693	\N	2018-05-25 09:29:27.71418	2018-05-25 09:29:27.71418
2078	3	693	\N	2018-05-25 09:29:27.716202	2018-05-25 09:29:27.716202
2079	1	693	\N	2018-05-25 09:29:27.71819	2018-05-25 09:29:27.71819
2080	2	694	\N	2018-05-25 09:29:27.722422	2018-05-25 09:29:27.722422
2081	3	694	\N	2018-05-25 09:29:27.724987	2018-05-25 09:29:27.724987
2082	1	694	\N	2018-05-25 09:29:27.726931	2018-05-25 09:29:27.726931
2083	2	695	\N	2018-05-25 09:29:27.731161	2018-05-25 09:29:27.731161
2084	3	695	\N	2018-05-25 09:29:27.7332	2018-05-25 09:29:27.7332
2085	1	695	\N	2018-05-25 09:29:27.734983	2018-05-25 09:29:27.734983
2086	2	696	\N	2018-05-25 09:29:27.739668	2018-05-25 09:29:27.739668
2087	3	696	\N	2018-05-25 09:29:27.74175	2018-05-25 09:29:27.74175
2088	1	696	\N	2018-05-25 09:29:27.744023	2018-05-25 09:29:27.744023
2089	2	697	\N	2018-05-25 09:29:27.749225	2018-05-25 09:29:27.749225
2090	3	697	\N	2018-05-25 09:29:27.751184	2018-05-25 09:29:27.751184
2091	1	697	\N	2018-05-25 09:29:27.753151	2018-05-25 09:29:27.753151
2092	2	698	\N	2018-05-25 09:29:27.758123	2018-05-25 09:29:27.758123
2093	3	698	\N	2018-05-25 09:29:27.762701	2018-05-25 09:29:27.762701
2094	1	698	\N	2018-05-25 09:29:27.764738	2018-05-25 09:29:27.764738
2095	2	699	\N	2018-05-25 09:29:27.769228	2018-05-25 09:29:27.769228
2096	3	699	\N	2018-05-25 09:29:27.771238	2018-05-25 09:29:27.771238
2097	1	699	\N	2018-05-25 09:29:27.773464	2018-05-25 09:29:27.773464
2098	2	700	\N	2018-05-25 09:29:27.779991	2018-05-25 09:29:27.779991
2099	3	700	\N	2018-05-25 09:29:27.782132	2018-05-25 09:29:27.782132
2100	1	700	\N	2018-05-25 09:29:27.784053	2018-05-25 09:29:27.784053
2101	2	701	\N	2018-05-25 09:29:27.788181	2018-05-25 09:29:27.788181
2102	3	701	\N	2018-05-25 09:29:27.791174	2018-05-25 09:29:27.791174
2103	1	701	\N	2018-05-25 09:29:27.793613	2018-05-25 09:29:27.793613
2104	2	702	\N	2018-05-25 09:29:27.800511	2018-05-25 09:29:27.800511
2105	3	702	\N	2018-05-25 09:29:27.803668	2018-05-25 09:29:27.803668
2106	1	702	\N	2018-05-25 09:29:27.806598	2018-05-25 09:29:27.806598
2107	2	703	\N	2018-05-25 09:29:27.813713	2018-05-25 09:29:27.813713
2108	3	703	\N	2018-05-25 09:29:27.816821	2018-05-25 09:29:27.816821
2109	1	703	\N	2018-05-25 09:29:27.819013	2018-05-25 09:29:27.819013
2110	2	704	\N	2018-05-25 09:29:27.825123	2018-05-25 09:29:27.825123
2111	3	704	\N	2018-05-25 09:29:27.829236	2018-05-25 09:29:27.829236
2112	1	704	\N	2018-05-25 09:29:27.832876	2018-05-25 09:29:27.832876
2113	2	705	\N	2018-05-25 09:29:27.840689	2018-05-25 09:29:27.840689
2114	3	705	\N	2018-05-25 09:29:27.844446	2018-05-25 09:29:27.844446
2115	1	705	\N	2018-05-25 09:29:27.847016	2018-05-25 09:29:27.847016
2116	2	706	\N	2018-05-25 09:29:27.851862	2018-05-25 09:29:27.851862
2117	3	706	\N	2018-05-25 09:29:27.854241	2018-05-25 09:29:27.854241
2118	1	706	\N	2018-05-25 09:29:27.856548	2018-05-25 09:29:27.856548
2119	2	707	\N	2018-05-25 09:29:27.861411	2018-05-25 09:29:27.861411
2120	3	707	\N	2018-05-25 09:29:27.863913	2018-05-25 09:29:27.863913
2121	1	707	\N	2018-05-25 09:29:27.866229	2018-05-25 09:29:27.866229
2122	2	708	\N	2018-05-25 09:29:27.871133	2018-05-25 09:29:27.871133
2123	3	708	\N	2018-05-25 09:29:27.8736	2018-05-25 09:29:27.8736
2124	1	708	\N	2018-05-25 09:29:27.875733	2018-05-25 09:29:27.875733
2125	2	709	\N	2018-05-25 09:29:27.881007	2018-05-25 09:29:27.881007
2126	3	709	\N	2018-05-25 09:29:27.883397	2018-05-25 09:29:27.883397
2127	1	709	\N	2018-05-25 09:29:27.88561	2018-05-25 09:29:27.88561
2128	2	710	\N	2018-05-25 09:29:27.890577	2018-05-25 09:29:27.890577
2129	3	710	\N	2018-05-25 09:29:27.892887	2018-05-25 09:29:27.892887
2130	1	710	\N	2018-05-25 09:29:27.895104	2018-05-25 09:29:27.895104
2131	2	711	\N	2018-05-25 09:29:27.900731	2018-05-25 09:29:27.900731
2132	3	711	\N	2018-05-25 09:29:27.903227	2018-05-25 09:29:27.903227
2133	1	711	\N	2018-05-25 09:29:27.905758	2018-05-25 09:29:27.905758
2134	2	712	\N	2018-05-25 09:29:27.910984	2018-05-25 09:29:27.910984
2135	3	712	\N	2018-05-25 09:29:27.913426	2018-05-25 09:29:27.913426
2136	1	712	\N	2018-05-25 09:29:27.915615	2018-05-25 09:29:27.915615
2137	2	713	\N	2018-05-25 09:29:27.920955	2018-05-25 09:29:27.920955
2138	3	713	\N	2018-05-25 09:29:27.923236	2018-05-25 09:29:27.923236
2139	1	713	\N	2018-05-25 09:29:27.925546	2018-05-25 09:29:27.925546
2140	2	714	\N	2018-05-25 09:29:27.930645	2018-05-25 09:29:27.930645
2141	3	714	\N	2018-05-25 09:29:27.93306	2018-05-25 09:29:27.93306
2142	1	714	\N	2018-05-25 09:29:27.935479	2018-05-25 09:29:27.935479
2143	2	715	\N	2018-05-25 09:29:27.940401	2018-05-25 09:29:27.940401
2144	3	715	\N	2018-05-25 09:29:27.943705	2018-05-25 09:29:27.943705
2145	1	715	\N	2018-05-25 09:29:27.94629	2018-05-25 09:29:27.94629
2146	2	716	\N	2018-05-25 09:29:27.951094	2018-05-25 09:29:27.951094
2147	3	716	\N	2018-05-25 09:29:27.95309	2018-05-25 09:29:27.95309
2148	1	716	\N	2018-05-25 09:29:27.956093	2018-05-25 09:29:27.956093
2149	2	717	\N	2018-05-25 09:29:27.960503	2018-05-25 09:29:27.960503
2150	3	717	\N	2018-05-25 09:29:27.962544	2018-05-25 09:29:27.962544
2151	1	717	\N	2018-05-25 09:29:27.964421	2018-05-25 09:29:27.964421
2152	2	718	\N	2018-05-25 09:29:27.968265	2018-05-25 09:29:27.968265
2153	3	718	\N	2018-05-25 09:29:27.970094	2018-05-25 09:29:27.970094
2154	1	718	\N	2018-05-25 09:29:27.971863	2018-05-25 09:29:27.971863
2155	2	719	\N	2018-05-25 09:29:27.97635	2018-05-25 09:29:27.97635
2156	3	719	\N	2018-05-25 09:29:27.978316	2018-05-25 09:29:27.978316
2157	1	719	\N	2018-05-25 09:29:27.980347	2018-05-25 09:29:27.980347
2158	2	720	\N	2018-05-25 09:29:27.984561	2018-05-25 09:29:27.984561
2159	3	720	\N	2018-05-25 09:29:27.986673	2018-05-25 09:29:27.986673
2160	1	720	\N	2018-05-25 09:29:27.988813	2018-05-25 09:29:27.988813
2161	2	721	\N	2018-05-25 09:29:27.995328	2018-05-25 09:29:27.995328
2162	3	721	\N	2018-05-25 09:29:27.998167	2018-05-25 09:29:27.998167
2163	1	721	\N	2018-05-25 09:29:28.000511	2018-05-25 09:29:28.000511
2164	2	722	\N	2018-05-25 09:29:28.005764	2018-05-25 09:29:28.005764
2165	3	722	\N	2018-05-25 09:29:28.008392	2018-05-25 09:29:28.008392
2166	1	722	\N	2018-05-25 09:29:28.010868	2018-05-25 09:29:28.010868
2167	2	723	\N	2018-05-25 09:29:28.015616	2018-05-25 09:29:28.015616
2168	3	723	\N	2018-05-25 09:29:28.018034	2018-05-25 09:29:28.018034
2169	1	723	\N	2018-05-25 09:29:28.020203	2018-05-25 09:29:28.020203
2170	2	724	\N	2018-05-25 09:29:28.025047	2018-05-25 09:29:28.025047
2171	3	724	\N	2018-05-25 09:29:28.027022	2018-05-25 09:29:28.027022
2172	1	724	\N	2018-05-25 09:29:28.02886	2018-05-25 09:29:28.02886
2173	2	725	\N	2018-05-25 09:29:28.032784	2018-05-25 09:29:28.032784
2174	3	725	\N	2018-05-25 09:29:28.035114	2018-05-25 09:29:28.035114
2175	1	725	\N	2018-05-25 09:29:28.036929	2018-05-25 09:29:28.036929
2176	2	726	\N	2018-05-25 09:29:28.041095	2018-05-25 09:29:28.041095
2177	3	726	\N	2018-05-25 09:29:28.043194	2018-05-25 09:29:28.043194
2178	1	726	\N	2018-05-25 09:29:28.045012	2018-05-25 09:29:28.045012
2179	2	727	\N	2018-05-25 09:29:28.049282	2018-05-25 09:29:28.049282
2180	3	727	\N	2018-05-25 09:29:28.051292	2018-05-25 09:29:28.051292
2181	1	727	\N	2018-05-25 09:29:28.053464	2018-05-25 09:29:28.053464
2182	2	728	\N	2018-05-25 09:29:28.057698	2018-05-25 09:29:28.057698
2183	3	728	\N	2018-05-25 09:29:28.059765	2018-05-25 09:29:28.059765
2184	1	728	\N	2018-05-25 09:29:28.061767	2018-05-25 09:29:28.061767
2185	2	729	\N	2018-05-25 09:29:28.066171	2018-05-25 09:29:28.066171
2186	3	729	\N	2018-05-25 09:29:28.068029	2018-05-25 09:29:28.068029
2187	1	729	\N	2018-05-25 09:29:28.070033	2018-05-25 09:29:28.070033
2188	2	730	\N	2018-05-25 09:29:28.074096	2018-05-25 09:29:28.074096
2189	3	730	\N	2018-05-25 09:29:28.076206	2018-05-25 09:29:28.076206
2190	1	730	\N	2018-05-25 09:29:28.078223	2018-05-25 09:29:28.078223
2191	2	731	\N	2018-05-25 09:29:28.082336	2018-05-25 09:29:28.082336
2192	3	731	\N	2018-05-25 09:29:28.084483	2018-05-25 09:29:28.084483
2193	1	731	\N	2018-05-25 09:29:28.086465	2018-05-25 09:29:28.086465
2194	2	732	\N	2018-05-25 09:29:28.091432	2018-05-25 09:29:28.091432
2195	3	732	\N	2018-05-25 09:29:28.093293	2018-05-25 09:29:28.093293
2196	1	732	\N	2018-05-25 09:29:28.095224	2018-05-25 09:29:28.095224
2197	2	733	\N	2018-05-25 09:29:28.099989	2018-05-25 09:29:28.099989
2198	3	733	\N	2018-05-25 09:29:28.103225	2018-05-25 09:29:28.103225
2199	1	733	\N	2018-05-25 09:29:28.105343	2018-05-25 09:29:28.105343
2200	2	734	\N	2018-05-25 09:29:28.109469	2018-05-25 09:29:28.109469
2201	3	734	\N	2018-05-25 09:29:28.111372	2018-05-25 09:29:28.111372
2202	1	734	\N	2018-05-25 09:29:28.113388	2018-05-25 09:29:28.113388
2203	2	735	\N	2018-05-25 09:29:28.117705	2018-05-25 09:29:28.117705
2204	3	735	\N	2018-05-25 09:29:28.120439	2018-05-25 09:29:28.120439
2205	1	735	\N	2018-05-25 09:29:28.1229	2018-05-25 09:29:28.1229
2206	2	736	\N	2018-05-25 09:29:28.127311	2018-05-25 09:29:28.127311
2207	3	736	\N	2018-05-25 09:29:28.129312	2018-05-25 09:29:28.129312
2208	1	736	\N	2018-05-25 09:29:28.131249	2018-05-25 09:29:28.131249
2209	2	737	\N	2018-05-25 09:29:28.136487	2018-05-25 09:29:28.136487
2210	3	737	\N	2018-05-25 09:29:28.139131	2018-05-25 09:29:28.139131
2211	1	737	\N	2018-05-25 09:29:28.141453	2018-05-25 09:29:28.141453
2212	2	738	\N	2018-05-25 09:29:28.145571	2018-05-25 09:29:28.145571
2213	3	738	\N	2018-05-25 09:29:28.147386	2018-05-25 09:29:28.147386
2214	1	738	\N	2018-05-25 09:29:28.149226	2018-05-25 09:29:28.149226
2215	2	739	\N	2018-05-25 09:29:28.153088	2018-05-25 09:29:28.153088
2216	3	739	\N	2018-05-25 09:29:28.155225	2018-05-25 09:29:28.155225
2217	1	739	\N	2018-05-25 09:29:28.157331	2018-05-25 09:29:28.157331
2218	2	740	\N	2018-05-25 09:29:28.161543	2018-05-25 09:29:28.161543
2219	3	740	\N	2018-05-25 09:29:28.163445	2018-05-25 09:29:28.163445
2220	1	740	\N	2018-05-25 09:29:28.165372	2018-05-25 09:29:28.165372
2221	2	741	\N	2018-05-25 09:29:28.169656	2018-05-25 09:29:28.169656
2222	3	741	\N	2018-05-25 09:29:28.171488	2018-05-25 09:29:28.171488
2223	1	741	\N	2018-05-25 09:29:28.173297	2018-05-25 09:29:28.173297
2224	2	742	\N	2018-05-25 09:29:28.177834	2018-05-25 09:29:28.177834
2225	3	742	\N	2018-05-25 09:29:28.179795	2018-05-25 09:29:28.179795
2226	1	742	\N	2018-05-25 09:29:28.181787	2018-05-25 09:29:28.181787
2227	2	743	\N	2018-05-25 09:29:28.186066	2018-05-25 09:29:28.186066
2228	3	743	\N	2018-05-25 09:29:28.188017	2018-05-25 09:29:28.188017
2229	1	743	\N	2018-05-25 09:29:28.18983	2018-05-25 09:29:28.18983
2230	2	744	\N	2018-05-25 09:29:28.193802	2018-05-25 09:29:28.193802
2231	3	744	\N	2018-05-25 09:29:28.195761	2018-05-25 09:29:28.195761
2232	1	744	\N	2018-05-25 09:29:28.197708	2018-05-25 09:29:28.197708
2233	2	745	\N	2018-05-25 09:29:28.203054	2018-05-25 09:29:28.203054
2234	3	745	\N	2018-05-25 09:29:28.204915	2018-05-25 09:29:28.204915
2235	1	745	\N	2018-05-25 09:29:28.207077	2018-05-25 09:29:28.207077
2236	2	746	\N	2018-05-25 09:29:28.211638	2018-05-25 09:29:28.211638
2237	3	746	\N	2018-05-25 09:29:28.213824	2018-05-25 09:29:28.213824
2238	1	746	\N	2018-05-25 09:29:28.215783	2018-05-25 09:29:28.215783
2239	2	747	\N	2018-05-25 09:29:28.220531	2018-05-25 09:29:28.220531
2240	3	747	\N	2018-05-25 09:29:28.222669	2018-05-25 09:29:28.222669
2241	1	747	\N	2018-05-25 09:29:28.224767	2018-05-25 09:29:28.224767
2242	2	748	\N	2018-05-25 09:29:28.229037	2018-05-25 09:29:28.229037
2243	3	748	\N	2018-05-25 09:29:28.230944	2018-05-25 09:29:28.230944
2244	1	748	\N	2018-05-25 09:29:28.232969	2018-05-25 09:29:28.232969
2245	2	749	\N	2018-05-25 09:29:28.237174	2018-05-25 09:29:28.237174
2246	3	749	\N	2018-05-25 09:29:28.239085	2018-05-25 09:29:28.239085
2247	1	749	\N	2018-05-25 09:29:28.241234	2018-05-25 09:29:28.241234
2248	2	750	\N	2018-05-25 09:29:28.245249	2018-05-25 09:29:28.245249
2249	3	750	\N	2018-05-25 09:29:28.247254	2018-05-25 09:29:28.247254
2250	1	750	\N	2018-05-25 09:29:28.249341	2018-05-25 09:29:28.249341
2251	2	751	\N	2018-05-25 09:29:28.253131	2018-05-25 09:29:28.253131
2252	3	751	\N	2018-05-25 09:29:28.254965	2018-05-25 09:29:28.254965
2253	1	751	\N	2018-05-25 09:29:28.256868	2018-05-25 09:29:28.256868
2254	2	752	\N	2018-05-25 09:29:28.260697	2018-05-25 09:29:28.260697
2255	3	752	\N	2018-05-25 09:29:28.262547	2018-05-25 09:29:28.262547
2256	1	752	\N	2018-05-25 09:29:28.264326	2018-05-25 09:29:28.264326
2257	2	753	\N	2018-05-25 09:29:28.269001	2018-05-25 09:29:28.269001
2258	3	753	\N	2018-05-25 09:29:28.270721	2018-05-25 09:29:28.270721
2259	1	753	\N	2018-05-25 09:29:28.272595	2018-05-25 09:29:28.272595
2260	2	754	\N	2018-05-25 09:29:28.276717	2018-05-25 09:29:28.276717
2261	3	754	\N	2018-05-25 09:29:28.278707	2018-05-25 09:29:28.278707
2262	1	754	\N	2018-05-25 09:29:28.280441	2018-05-25 09:29:28.280441
2263	2	755	\N	2018-05-25 09:29:28.284406	2018-05-25 09:29:28.284406
2264	3	755	\N	2018-05-25 09:29:28.286365	2018-05-25 09:29:28.286365
2265	1	755	\N	2018-05-25 09:29:28.288312	2018-05-25 09:29:28.288312
2266	2	756	\N	2018-05-25 09:29:28.292594	2018-05-25 09:29:28.292594
2267	3	756	\N	2018-05-25 09:29:28.29441	2018-05-25 09:29:28.29441
2268	1	756	\N	2018-05-25 09:29:28.296313	2018-05-25 09:29:28.296313
2269	2	757	\N	2018-05-25 09:29:28.300288	2018-05-25 09:29:28.300288
2270	3	757	\N	2018-05-25 09:29:28.302156	2018-05-25 09:29:28.302156
2271	1	757	\N	2018-05-25 09:29:28.303999	2018-05-25 09:29:28.303999
2272	2	758	\N	2018-05-25 09:29:28.307581	2018-05-25 09:29:28.307581
2273	3	758	\N	2018-05-25 09:29:28.309113	2018-05-25 09:29:28.309113
2274	1	758	\N	2018-05-25 09:29:28.310679	2018-05-25 09:29:28.310679
2275	2	759	\N	2018-05-25 09:29:28.314269	2018-05-25 09:29:28.314269
2276	3	759	\N	2018-05-25 09:29:28.316105	2018-05-25 09:29:28.316105
2277	1	759	\N	2018-05-25 09:29:28.318075	2018-05-25 09:29:28.318075
2278	2	760	\N	2018-05-25 09:29:28.322125	2018-05-25 09:29:28.322125
2279	3	760	\N	2018-05-25 09:29:28.324311	2018-05-25 09:29:28.324311
2280	1	760	\N	2018-05-25 09:29:28.326341	2018-05-25 09:29:28.326341
2281	2	761	\N	2018-05-25 09:29:28.331384	2018-05-25 09:29:28.331384
2282	3	761	\N	2018-05-25 09:29:28.333954	2018-05-25 09:29:28.333954
2283	1	761	\N	2018-05-25 09:29:28.336358	2018-05-25 09:29:28.336358
2284	2	762	\N	2018-05-25 09:29:28.341472	2018-05-25 09:29:28.341472
2285	3	762	\N	2018-05-25 09:29:28.343417	2018-05-25 09:29:28.343417
2286	1	762	\N	2018-05-25 09:29:28.345356	2018-05-25 09:29:28.345356
2287	2	763	\N	2018-05-25 09:29:28.349327	2018-05-25 09:29:28.349327
2288	3	763	\N	2018-05-25 09:29:28.351214	2018-05-25 09:29:28.351214
2289	1	763	\N	2018-05-25 09:29:28.352994	2018-05-25 09:29:28.352994
2290	2	764	\N	2018-05-25 09:29:28.357531	2018-05-25 09:29:28.357531
2291	3	764	\N	2018-05-25 09:29:28.35964	2018-05-25 09:29:28.35964
2292	1	764	\N	2018-05-25 09:29:28.361618	2018-05-25 09:29:28.361618
2293	2	765	\N	2018-05-25 09:29:28.365615	2018-05-25 09:29:28.365615
2294	3	765	\N	2018-05-25 09:29:28.367541	2018-05-25 09:29:28.367541
2295	1	765	\N	2018-05-25 09:29:28.369461	2018-05-25 09:29:28.369461
2296	2	766	\N	2018-05-25 09:29:28.373434	2018-05-25 09:29:28.373434
2297	3	766	\N	2018-05-25 09:29:28.375427	2018-05-25 09:29:28.375427
2298	1	766	\N	2018-05-25 09:29:28.377311	2018-05-25 09:29:28.377311
2299	2	767	\N	2018-05-25 09:29:28.381131	2018-05-25 09:29:28.381131
2300	3	767	\N	2018-05-25 09:29:28.383041	2018-05-25 09:29:28.383041
2301	1	767	\N	2018-05-25 09:29:28.385013	2018-05-25 09:29:28.385013
2302	2	768	\N	2018-05-25 09:29:28.389942	2018-05-25 09:29:28.389942
2303	3	768	\N	2018-05-25 09:29:28.391965	2018-05-25 09:29:28.391965
2304	1	768	\N	2018-05-25 09:29:28.393713	2018-05-25 09:29:28.393713
2305	2	769	\N	2018-05-25 09:29:28.398707	2018-05-25 09:29:28.398707
2306	3	769	\N	2018-05-25 09:29:28.400527	2018-05-25 09:29:28.400527
2307	1	769	\N	2018-05-25 09:29:28.402326	2018-05-25 09:29:28.402326
2308	2	770	\N	2018-05-25 09:29:28.406296	2018-05-25 09:29:28.406296
2309	3	770	\N	2018-05-25 09:29:28.408338	2018-05-25 09:29:28.408338
2310	1	770	\N	2018-05-25 09:29:28.410166	2018-05-25 09:29:28.410166
2311	2	771	\N	2018-05-25 09:29:28.413901	2018-05-25 09:29:28.413901
2312	3	771	\N	2018-05-25 09:29:28.415629	2018-05-25 09:29:28.415629
2313	1	771	\N	2018-05-25 09:29:28.417373	2018-05-25 09:29:28.417373
2314	2	772	\N	2018-05-25 09:29:28.420781	2018-05-25 09:29:28.420781
2315	3	772	\N	2018-05-25 09:29:28.422396	2018-05-25 09:29:28.422396
2316	1	772	\N	2018-05-25 09:29:28.424358	2018-05-25 09:29:28.424358
2317	2	773	\N	2018-05-25 09:29:28.42786	2018-05-25 09:29:28.42786
2318	3	773	\N	2018-05-25 09:29:28.429473	2018-05-25 09:29:28.429473
2319	1	773	\N	2018-05-25 09:29:28.431063	2018-05-25 09:29:28.431063
2320	2	774	\N	2018-05-25 09:29:28.435033	2018-05-25 09:29:28.435033
2321	3	774	\N	2018-05-25 09:29:28.436923	2018-05-25 09:29:28.436923
2322	1	774	\N	2018-05-25 09:29:28.438631	2018-05-25 09:29:28.438631
2323	2	775	\N	2018-05-25 09:29:28.44287	2018-05-25 09:29:28.44287
2324	3	775	\N	2018-05-25 09:29:28.444969	2018-05-25 09:29:28.444969
2325	1	775	\N	2018-05-25 09:29:28.44686	2018-05-25 09:29:28.44686
2326	2	776	\N	2018-05-25 09:29:28.451135	2018-05-25 09:29:28.451135
2327	3	776	\N	2018-05-25 09:29:28.453037	2018-05-25 09:29:28.453037
2328	1	776	\N	2018-05-25 09:29:28.455047	2018-05-25 09:29:28.455047
2329	2	777	\N	2018-05-25 09:29:28.459778	2018-05-25 09:29:28.459778
2330	3	777	\N	2018-05-25 09:29:28.461732	2018-05-25 09:29:28.461732
2331	1	777	\N	2018-05-25 09:29:28.463698	2018-05-25 09:29:28.463698
2332	2	778	\N	2018-05-25 09:29:28.468171	2018-05-25 09:29:28.468171
2333	3	778	\N	2018-05-25 09:29:28.47023	2018-05-25 09:29:28.47023
2334	1	778	\N	2018-05-25 09:29:28.472119	2018-05-25 09:29:28.472119
2335	2	779	\N	2018-05-25 09:29:28.476515	2018-05-25 09:29:28.476515
2336	3	779	\N	2018-05-25 09:29:28.478586	2018-05-25 09:29:28.478586
2337	1	779	\N	2018-05-25 09:29:28.480348	2018-05-25 09:29:28.480348
2338	2	780	\N	2018-05-25 09:29:28.484125	2018-05-25 09:29:28.484125
2339	3	780	\N	2018-05-25 09:29:28.486125	2018-05-25 09:29:28.486125
2340	1	780	\N	2018-05-25 09:29:28.488025	2018-05-25 09:29:28.488025
2341	2	781	\N	2018-05-25 09:29:28.491845	2018-05-25 09:29:28.491845
2342	3	781	\N	2018-05-25 09:29:28.493664	2018-05-25 09:29:28.493664
2343	1	781	\N	2018-05-25 09:29:28.495563	2018-05-25 09:29:28.495563
2344	2	782	\N	2018-05-25 09:29:28.499442	2018-05-25 09:29:28.499442
2345	3	782	\N	2018-05-25 09:29:28.501283	2018-05-25 09:29:28.501283
2346	1	782	\N	2018-05-25 09:29:28.503244	2018-05-25 09:29:28.503244
2347	2	783	\N	2018-05-25 09:29:28.507361	2018-05-25 09:29:28.507361
2348	3	783	\N	2018-05-25 09:29:28.509352	2018-05-25 09:29:28.509352
2349	1	783	\N	2018-05-25 09:29:28.511319	2018-05-25 09:29:28.511319
2350	2	784	\N	2018-05-25 09:29:28.515584	2018-05-25 09:29:28.515584
2351	3	784	\N	2018-05-25 09:29:28.517626	2018-05-25 09:29:28.517626
2352	1	784	\N	2018-05-25 09:29:28.520359	2018-05-25 09:29:28.520359
2353	2	785	\N	2018-05-25 09:29:28.525404	2018-05-25 09:29:28.525404
2354	3	785	\N	2018-05-25 09:29:28.528126	2018-05-25 09:29:28.528126
2355	1	785	\N	2018-05-25 09:29:28.530067	2018-05-25 09:29:28.530067
2356	2	786	\N	2018-05-25 09:29:28.534276	2018-05-25 09:29:28.534276
2357	3	786	\N	2018-05-25 09:29:28.536254	2018-05-25 09:29:28.536254
2358	1	786	\N	2018-05-25 09:29:28.53819	2018-05-25 09:29:28.53819
2359	2	787	\N	2018-05-25 09:29:28.542543	2018-05-25 09:29:28.542543
2360	3	787	\N	2018-05-25 09:29:28.544507	2018-05-25 09:29:28.544507
2361	1	787	\N	2018-05-25 09:29:28.546401	2018-05-25 09:29:28.546401
2362	2	788	\N	2018-05-25 09:29:28.550428	2018-05-25 09:29:28.550428
2363	3	788	\N	2018-05-25 09:29:28.552235	2018-05-25 09:29:28.552235
2364	1	788	\N	2018-05-25 09:29:28.553929	2018-05-25 09:29:28.553929
2365	2	789	\N	2018-05-25 09:29:28.558463	2018-05-25 09:29:28.558463
2366	3	789	\N	2018-05-25 09:29:28.560491	2018-05-25 09:29:28.560491
2367	1	789	\N	2018-05-25 09:29:28.562315	2018-05-25 09:29:28.562315
2368	2	790	\N	2018-05-25 09:29:28.566257	2018-05-25 09:29:28.566257
2369	3	790	\N	2018-05-25 09:29:28.568228	2018-05-25 09:29:28.568228
2370	1	790	\N	2018-05-25 09:29:28.570196	2018-05-25 09:29:28.570196
2371	2	791	\N	2018-05-25 09:29:28.574485	2018-05-25 09:29:28.574485
2372	3	791	\N	2018-05-25 09:29:28.576601	2018-05-25 09:29:28.576601
2373	1	791	\N	2018-05-25 09:29:28.57862	2018-05-25 09:29:28.57862
2374	2	792	\N	2018-05-25 09:29:28.582715	2018-05-25 09:29:28.582715
2375	3	792	\N	2018-05-25 09:29:28.584746	2018-05-25 09:29:28.584746
2376	1	792	\N	2018-05-25 09:29:28.586732	2018-05-25 09:29:28.586732
2377	2	793	\N	2018-05-25 09:29:28.591665	2018-05-25 09:29:28.591665
2378	3	793	\N	2018-05-25 09:29:28.593784	2018-05-25 09:29:28.593784
2379	1	793	\N	2018-05-25 09:29:28.595647	2018-05-25 09:29:28.595647
2380	2	794	\N	2018-05-25 09:29:28.599678	2018-05-25 09:29:28.599678
2381	3	794	\N	2018-05-25 09:29:28.602139	2018-05-25 09:29:28.602139
2382	1	794	\N	2018-05-25 09:29:28.604347	2018-05-25 09:29:28.604347
2383	2	795	\N	2018-05-25 09:29:28.608308	2018-05-25 09:29:28.608308
2384	3	795	\N	2018-05-25 09:29:28.610113	2018-05-25 09:29:28.610113
2385	1	795	\N	2018-05-25 09:29:28.611894	2018-05-25 09:29:28.611894
2386	2	796	\N	2018-05-25 09:29:28.615807	2018-05-25 09:29:28.615807
2387	3	796	\N	2018-05-25 09:29:28.617997	2018-05-25 09:29:28.617997
2388	1	796	\N	2018-05-25 09:29:28.620384	2018-05-25 09:29:28.620384
2389	2	797	\N	2018-05-25 09:29:28.624567	2018-05-25 09:29:28.624567
2390	3	797	\N	2018-05-25 09:29:28.626415	2018-05-25 09:29:28.626415
2391	1	797	\N	2018-05-25 09:29:28.62817	2018-05-25 09:29:28.62817
2392	2	798	\N	2018-05-25 09:29:28.631848	2018-05-25 09:29:28.631848
2393	3	798	\N	2018-05-25 09:29:28.633868	2018-05-25 09:29:28.633868
2394	1	798	\N	2018-05-25 09:29:28.635815	2018-05-25 09:29:28.635815
2395	2	799	\N	2018-05-25 09:29:28.640343	2018-05-25 09:29:28.640343
2396	3	799	\N	2018-05-25 09:29:28.642668	2018-05-25 09:29:28.642668
2397	1	799	\N	2018-05-25 09:29:28.64504	2018-05-25 09:29:28.64504
2398	2	800	\N	2018-05-25 09:29:28.649776	2018-05-25 09:29:28.649776
2399	3	800	\N	2018-05-25 09:29:28.651861	2018-05-25 09:29:28.651861
2400	1	800	\N	2018-05-25 09:29:28.654147	2018-05-25 09:29:28.654147
2401	2	801	\N	2018-05-25 09:29:28.660547	2018-05-25 09:29:28.660547
2402	3	801	\N	2018-05-25 09:29:28.662876	2018-05-25 09:29:28.662876
2403	1	801	\N	2018-05-25 09:29:28.665392	2018-05-25 09:29:28.665392
2404	2	802	\N	2018-05-25 09:29:28.67064	2018-05-25 09:29:28.67064
2405	3	802	\N	2018-05-25 09:29:28.673425	2018-05-25 09:29:28.673425
2406	1	802	\N	2018-05-25 09:29:28.676076	2018-05-25 09:29:28.676076
2407	2	803	\N	2018-05-25 09:29:28.681028	2018-05-25 09:29:28.681028
2408	3	803	\N	2018-05-25 09:29:28.683083	2018-05-25 09:29:28.683083
2409	1	803	\N	2018-05-25 09:29:28.685142	2018-05-25 09:29:28.685142
2410	2	804	\N	2018-05-25 09:29:28.688892	2018-05-25 09:29:28.688892
2411	3	804	\N	2018-05-25 09:29:28.691178	2018-05-25 09:29:28.691178
2412	1	804	\N	2018-05-25 09:29:28.693236	2018-05-25 09:29:28.693236
2413	2	805	\N	2018-05-25 09:29:28.697701	2018-05-25 09:29:28.697701
2414	3	805	\N	2018-05-25 09:29:28.699952	2018-05-25 09:29:28.699952
2415	1	805	\N	2018-05-25 09:29:28.701979	2018-05-25 09:29:28.701979
2416	2	806	\N	2018-05-25 09:29:28.706468	2018-05-25 09:29:28.706468
2417	3	806	\N	2018-05-25 09:29:28.708463	2018-05-25 09:29:28.708463
2418	1	806	\N	2018-05-25 09:29:28.710401	2018-05-25 09:29:28.710401
2419	2	807	\N	2018-05-25 09:29:28.7146	2018-05-25 09:29:28.7146
2420	3	807	\N	2018-05-25 09:29:28.716508	2018-05-25 09:29:28.716508
2421	1	807	\N	2018-05-25 09:29:28.718362	2018-05-25 09:29:28.718362
2422	2	808	\N	2018-05-25 09:29:28.722429	2018-05-25 09:29:28.722429
2423	3	808	\N	2018-05-25 09:29:28.724381	2018-05-25 09:29:28.724381
2424	1	808	\N	2018-05-25 09:29:28.726347	2018-05-25 09:29:28.726347
2425	2	809	\N	2018-05-25 09:29:28.730839	2018-05-25 09:29:28.730839
2426	3	809	\N	2018-05-25 09:29:28.732822	2018-05-25 09:29:28.732822
2427	1	809	\N	2018-05-25 09:29:28.734917	2018-05-25 09:29:28.734917
2428	2	810	\N	2018-05-25 09:29:28.73913	2018-05-25 09:29:28.73913
2429	3	810	\N	2018-05-25 09:29:28.741275	2018-05-25 09:29:28.741275
2430	1	810	\N	2018-05-25 09:29:28.743216	2018-05-25 09:29:28.743216
2431	2	811	\N	2018-05-25 09:29:28.747373	2018-05-25 09:29:28.747373
2432	3	811	\N	2018-05-25 09:29:28.749252	2018-05-25 09:29:28.749252
2433	1	811	\N	2018-05-25 09:29:28.751023	2018-05-25 09:29:28.751023
2434	2	812	\N	2018-05-25 09:29:28.754902	2018-05-25 09:29:28.754902
2435	3	812	\N	2018-05-25 09:29:28.756851	2018-05-25 09:29:28.756851
2436	1	812	\N	2018-05-25 09:29:28.759018	2018-05-25 09:29:28.759018
2437	2	813	\N	2018-05-25 09:29:28.763591	2018-05-25 09:29:28.763591
2438	3	813	\N	2018-05-25 09:29:28.765944	2018-05-25 09:29:28.765944
2439	1	813	\N	2018-05-25 09:29:28.768075	2018-05-25 09:29:28.768075
2440	2	814	\N	2018-05-25 09:29:28.772851	2018-05-25 09:29:28.772851
2441	3	814	\N	2018-05-25 09:29:28.775181	2018-05-25 09:29:28.775181
2442	1	814	\N	2018-05-25 09:29:28.777619	2018-05-25 09:29:28.777619
2443	2	815	\N	2018-05-25 09:29:28.783214	2018-05-25 09:29:28.783214
2444	3	815	\N	2018-05-25 09:29:28.785685	2018-05-25 09:29:28.785685
2445	1	815	\N	2018-05-25 09:29:28.788166	2018-05-25 09:29:28.788166
2446	2	816	\N	2018-05-25 09:29:28.793201	2018-05-25 09:29:28.793201
2447	3	816	\N	2018-05-25 09:29:28.795528	2018-05-25 09:29:28.795528
2448	1	816	\N	2018-05-25 09:29:28.79762	2018-05-25 09:29:28.79762
2449	2	817	\N	2018-05-25 09:29:28.803181	2018-05-25 09:29:28.803181
2450	3	817	\N	2018-05-25 09:29:28.805115	2018-05-25 09:29:28.805115
2451	1	817	\N	2018-05-25 09:29:28.807055	2018-05-25 09:29:28.807055
2452	2	818	\N	2018-05-25 09:29:28.811359	2018-05-25 09:29:28.811359
2453	3	818	\N	2018-05-25 09:29:28.813316	2018-05-25 09:29:28.813316
2454	1	818	\N	2018-05-25 09:29:28.815199	2018-05-25 09:29:28.815199
2455	2	819	\N	2018-05-25 09:29:28.819255	2018-05-25 09:29:28.819255
2456	3	819	\N	2018-05-25 09:29:28.821148	2018-05-25 09:29:28.821148
2457	1	819	\N	2018-05-25 09:29:28.822909	2018-05-25 09:29:28.822909
2458	2	820	\N	2018-05-25 09:29:28.826851	2018-05-25 09:29:28.826851
2459	3	820	\N	2018-05-25 09:29:28.8287	2018-05-25 09:29:28.8287
2460	1	820	\N	2018-05-25 09:29:28.830492	2018-05-25 09:29:28.830492
2461	2	821	\N	2018-05-25 09:29:28.834403	2018-05-25 09:29:28.834403
2462	3	821	\N	2018-05-25 09:29:28.836334	2018-05-25 09:29:28.836334
2463	1	821	\N	2018-05-25 09:29:28.838244	2018-05-25 09:29:28.838244
2464	2	822	\N	2018-05-25 09:29:28.842157	2018-05-25 09:29:28.842157
2465	3	822	\N	2018-05-25 09:29:28.84422	2018-05-25 09:29:28.84422
2466	1	822	\N	2018-05-25 09:29:28.84608	2018-05-25 09:29:28.84608
2467	2	823	\N	2018-05-25 09:29:28.850262	2018-05-25 09:29:28.850262
2468	3	823	\N	2018-05-25 09:29:28.852263	2018-05-25 09:29:28.852263
2469	1	823	\N	2018-05-25 09:29:28.854141	2018-05-25 09:29:28.854141
2470	2	824	\N	2018-05-25 09:29:28.85835	2018-05-25 09:29:28.85835
2471	3	824	\N	2018-05-25 09:29:28.860327	2018-05-25 09:29:28.860327
2472	1	824	\N	2018-05-25 09:29:28.862253	2018-05-25 09:29:28.862253
2473	2	825	\N	2018-05-25 09:29:28.866774	2018-05-25 09:29:28.866774
2474	3	825	\N	2018-05-25 09:29:28.868786	2018-05-25 09:29:28.868786
2475	1	825	\N	2018-05-25 09:29:28.870837	2018-05-25 09:29:28.870837
2476	2	826	\N	2018-05-25 09:29:28.875437	2018-05-25 09:29:28.875437
2477	3	826	\N	2018-05-25 09:29:28.87743	2018-05-25 09:29:28.87743
2478	1	826	\N	2018-05-25 09:29:28.879261	2018-05-25 09:29:28.879261
2479	2	827	\N	2018-05-25 09:29:28.883259	2018-05-25 09:29:28.883259
2480	3	827	\N	2018-05-25 09:29:28.885187	2018-05-25 09:29:28.885187
2481	1	827	\N	2018-05-25 09:29:28.887228	2018-05-25 09:29:28.887228
2482	2	828	\N	2018-05-25 09:29:28.891618	2018-05-25 09:29:28.891618
2483	3	828	\N	2018-05-25 09:29:28.893659	2018-05-25 09:29:28.893659
2484	1	828	\N	2018-05-25 09:29:28.895559	2018-05-25 09:29:28.895559
2485	2	829	\N	2018-05-25 09:29:28.89956	2018-05-25 09:29:28.89956
2486	3	829	\N	2018-05-25 09:29:28.901397	2018-05-25 09:29:28.901397
2487	1	829	\N	2018-05-25 09:29:28.903277	2018-05-25 09:29:28.903277
2488	2	830	\N	2018-05-25 09:29:28.907478	2018-05-25 09:29:28.907478
2489	3	830	\N	2018-05-25 09:29:28.909494	2018-05-25 09:29:28.909494
2490	1	830	\N	2018-05-25 09:29:28.911537	2018-05-25 09:29:28.911537
2491	2	831	\N	2018-05-25 09:29:28.915838	2018-05-25 09:29:28.915838
2492	3	831	\N	2018-05-25 09:29:28.917869	2018-05-25 09:29:28.917869
2493	1	831	\N	2018-05-25 09:29:28.919895	2018-05-25 09:29:28.919895
2494	2	832	\N	2018-05-25 09:29:28.924076	2018-05-25 09:29:28.924076
2495	3	832	\N	2018-05-25 09:29:28.926032	2018-05-25 09:29:28.926032
2496	1	832	\N	2018-05-25 09:29:28.928016	2018-05-25 09:29:28.928016
2497	2	833	\N	2018-05-25 09:29:28.933106	2018-05-25 09:29:28.933106
2498	3	833	\N	2018-05-25 09:29:28.935265	2018-05-25 09:29:28.935265
2499	1	833	\N	2018-05-25 09:29:28.937262	2018-05-25 09:29:28.937262
2500	2	834	\N	2018-05-25 09:29:28.941343	2018-05-25 09:29:28.941343
2501	3	834	\N	2018-05-25 09:29:28.943273	2018-05-25 09:29:28.943273
2502	1	834	\N	2018-05-25 09:29:28.945161	2018-05-25 09:29:28.945161
2503	2	835	\N	2018-05-25 09:29:28.949307	2018-05-25 09:29:28.949307
2504	3	835	\N	2018-05-25 09:29:28.951302	2018-05-25 09:29:28.951302
2505	1	835	\N	2018-05-25 09:29:28.953227	2018-05-25 09:29:28.953227
2506	2	836	\N	2018-05-25 09:29:28.957691	2018-05-25 09:29:28.957691
2507	3	836	\N	2018-05-25 09:29:28.959836	2018-05-25 09:29:28.959836
2508	1	836	\N	2018-05-25 09:29:28.961878	2018-05-25 09:29:28.961878
2509	2	837	\N	2018-05-25 09:29:28.96595	2018-05-25 09:29:28.96595
2510	3	837	\N	2018-05-25 09:29:28.968556	2018-05-25 09:29:28.968556
2511	1	837	\N	2018-05-25 09:29:28.97044	2018-05-25 09:29:28.97044
2512	2	838	\N	2018-05-25 09:29:28.974182	2018-05-25 09:29:28.974182
2513	3	838	\N	2018-05-25 09:29:28.976186	2018-05-25 09:29:28.976186
2514	1	838	\N	2018-05-25 09:29:28.978316	2018-05-25 09:29:28.978316
2515	2	839	\N	2018-05-25 09:29:28.982426	2018-05-25 09:29:28.982426
2516	3	839	\N	2018-05-25 09:29:28.984419	2018-05-25 09:29:28.984419
2517	1	839	\N	2018-05-25 09:29:28.986166	2018-05-25 09:29:28.986166
2518	2	840	\N	2018-05-25 09:29:28.989965	2018-05-25 09:29:28.989965
2519	3	840	\N	2018-05-25 09:29:28.992058	2018-05-25 09:29:28.992058
2520	1	840	\N	2018-05-25 09:29:28.994009	2018-05-25 09:29:28.994009
2521	2	841	\N	2018-05-25 09:29:28.998815	2018-05-25 09:29:28.998815
2522	3	841	\N	2018-05-25 09:29:29.001435	2018-05-25 09:29:29.001435
2523	1	841	\N	2018-05-25 09:29:29.003874	2018-05-25 09:29:29.003874
2524	2	842	\N	2018-05-25 09:29:29.008955	2018-05-25 09:29:29.008955
2525	3	842	\N	2018-05-25 09:29:29.011151	2018-05-25 09:29:29.011151
2526	1	842	\N	2018-05-25 09:29:29.013177	2018-05-25 09:29:29.013177
2527	2	843	\N	2018-05-25 09:29:29.017828	2018-05-25 09:29:29.017828
2528	3	843	\N	2018-05-25 09:29:29.020491	2018-05-25 09:29:29.020491
2529	1	843	\N	2018-05-25 09:29:29.022449	2018-05-25 09:29:29.022449
2530	2	844	\N	2018-05-25 09:29:29.026799	2018-05-25 09:29:29.026799
2531	3	844	\N	2018-05-25 09:29:29.028578	2018-05-25 09:29:29.028578
2532	1	844	\N	2018-05-25 09:29:29.030316	2018-05-25 09:29:29.030316
2533	2	845	\N	2018-05-25 09:29:29.034241	2018-05-25 09:29:29.034241
2534	3	845	\N	2018-05-25 09:29:29.036103	2018-05-25 09:29:29.036103
2535	1	845	\N	2018-05-25 09:29:29.037851	2018-05-25 09:29:29.037851
2536	2	846	\N	2018-05-25 09:29:29.041598	2018-05-25 09:29:29.041598
2537	3	846	\N	2018-05-25 09:29:29.043407	2018-05-25 09:29:29.043407
2538	1	846	\N	2018-05-25 09:29:29.045207	2018-05-25 09:29:29.045207
2539	2	847	\N	2018-05-25 09:29:29.048947	2018-05-25 09:29:29.048947
2540	3	847	\N	2018-05-25 09:29:29.050945	2018-05-25 09:29:29.050945
2541	1	847	\N	2018-05-25 09:29:29.052858	2018-05-25 09:29:29.052858
2542	2	848	\N	2018-05-25 09:29:29.056831	2018-05-25 09:29:29.056831
2543	3	848	\N	2018-05-25 09:29:29.058755	2018-05-25 09:29:29.058755
2544	1	848	\N	2018-05-25 09:29:29.060706	2018-05-25 09:29:29.060706
2545	2	849	\N	2018-05-25 09:29:29.065703	2018-05-25 09:29:29.065703
2546	3	849	\N	2018-05-25 09:29:29.067844	2018-05-25 09:29:29.067844
2547	1	849	\N	2018-05-25 09:29:29.069855	2018-05-25 09:29:29.069855
2548	2	850	\N	2018-05-25 09:29:29.074266	2018-05-25 09:29:29.074266
2549	3	850	\N	2018-05-25 09:29:29.076316	2018-05-25 09:29:29.076316
2550	1	850	\N	2018-05-25 09:29:29.078325	2018-05-25 09:29:29.078325
2551	2	851	\N	2018-05-25 09:29:29.082331	2018-05-25 09:29:29.082331
2552	3	851	\N	2018-05-25 09:29:29.084063	2018-05-25 09:29:29.084063
2553	1	851	\N	2018-05-25 09:29:29.085886	2018-05-25 09:29:29.085886
2554	2	852	\N	2018-05-25 09:29:29.090017	2018-05-25 09:29:29.090017
2555	3	852	\N	2018-05-25 09:29:29.092003	2018-05-25 09:29:29.092003
2556	1	852	\N	2018-05-25 09:29:29.093881	2018-05-25 09:29:29.093881
2557	2	853	\N	2018-05-25 09:29:29.098114	2018-05-25 09:29:29.098114
2558	3	853	\N	2018-05-25 09:29:29.100141	2018-05-25 09:29:29.100141
2559	1	853	\N	2018-05-25 09:29:29.103586	2018-05-25 09:29:29.103586
2560	2	854	\N	2018-05-25 09:29:29.108074	2018-05-25 09:29:29.108074
2561	3	854	\N	2018-05-25 09:29:29.109981	2018-05-25 09:29:29.109981
2562	1	854	\N	2018-05-25 09:29:29.111927	2018-05-25 09:29:29.111927
2563	2	855	\N	2018-05-25 09:29:29.115924	2018-05-25 09:29:29.115924
2564	3	855	\N	2018-05-25 09:29:29.117885	2018-05-25 09:29:29.117885
2565	1	855	\N	2018-05-25 09:29:29.119984	2018-05-25 09:29:29.119984
2566	2	856	\N	2018-05-25 09:29:29.124217	2018-05-25 09:29:29.124217
2567	3	856	\N	2018-05-25 09:29:29.126379	2018-05-25 09:29:29.126379
2568	1	856	\N	2018-05-25 09:29:29.128538	2018-05-25 09:29:29.128538
2569	2	857	\N	2018-05-25 09:29:29.13309	2018-05-25 09:29:29.13309
2570	3	857	\N	2018-05-25 09:29:29.135002	2018-05-25 09:29:29.135002
2571	1	857	\N	2018-05-25 09:29:29.137066	2018-05-25 09:29:29.137066
2572	2	858	\N	2018-05-25 09:29:29.141697	2018-05-25 09:29:29.141697
2573	3	858	\N	2018-05-25 09:29:29.143615	2018-05-25 09:29:29.143615
2574	1	858	\N	2018-05-25 09:29:29.145975	2018-05-25 09:29:29.145975
2575	2	859	\N	2018-05-25 09:29:29.150469	2018-05-25 09:29:29.150469
2576	3	859	\N	2018-05-25 09:29:29.152488	2018-05-25 09:29:29.152488
2577	1	859	\N	2018-05-25 09:29:29.154518	2018-05-25 09:29:29.154518
2578	2	860	\N	2018-05-25 09:29:29.159011	2018-05-25 09:29:29.159011
2579	3	860	\N	2018-05-25 09:29:29.161087	2018-05-25 09:29:29.161087
2580	1	860	\N	2018-05-25 09:29:29.163096	2018-05-25 09:29:29.163096
2581	2	861	\N	2018-05-25 09:29:29.167133	2018-05-25 09:29:29.167133
2582	3	861	\N	2018-05-25 09:29:29.169125	2018-05-25 09:29:29.169125
2583	1	861	\N	2018-05-25 09:29:29.1711	2018-05-25 09:29:29.1711
2584	2	862	\N	2018-05-25 09:29:29.175701	2018-05-25 09:29:29.175701
2585	3	862	\N	2018-05-25 09:29:29.177532	2018-05-25 09:29:29.177532
2586	1	862	\N	2018-05-25 09:29:29.179367	2018-05-25 09:29:29.179367
2587	2	863	\N	2018-05-25 09:29:29.183175	2018-05-25 09:29:29.183175
2588	3	863	\N	2018-05-25 09:29:29.185	2018-05-25 09:29:29.185
2589	1	863	\N	2018-05-25 09:29:29.18699	2018-05-25 09:29:29.18699
2590	2	864	\N	2018-05-25 09:29:29.191721	2018-05-25 09:29:29.191721
2591	3	864	\N	2018-05-25 09:29:29.193622	2018-05-25 09:29:29.193622
2592	1	864	\N	2018-05-25 09:29:29.195556	2018-05-25 09:29:29.195556
2593	2	865	\N	2018-05-25 09:29:29.200563	2018-05-25 09:29:29.200563
2594	3	865	\N	2018-05-25 09:29:29.202494	2018-05-25 09:29:29.202494
2595	1	865	\N	2018-05-25 09:29:29.204244	2018-05-25 09:29:29.204244
2596	2	866	\N	2018-05-25 09:29:29.208328	2018-05-25 09:29:29.208328
2597	3	866	\N	2018-05-25 09:29:29.210222	2018-05-25 09:29:29.210222
2598	1	866	\N	2018-05-25 09:29:29.212084	2018-05-25 09:29:29.212084
2599	2	867	\N	2018-05-25 09:29:29.216225	2018-05-25 09:29:29.216225
2600	3	867	\N	2018-05-25 09:29:29.218188	2018-05-25 09:29:29.218188
2601	1	867	\N	2018-05-25 09:29:29.220115	2018-05-25 09:29:29.220115
2602	2	868	\N	2018-05-25 09:29:29.224543	2018-05-25 09:29:29.224543
2603	3	868	\N	2018-05-25 09:29:29.22644	2018-05-25 09:29:29.22644
2604	1	868	\N	2018-05-25 09:29:29.228251	2018-05-25 09:29:29.228251
2605	2	869	\N	2018-05-25 09:29:29.232367	2018-05-25 09:29:29.232367
2606	3	869	\N	2018-05-25 09:29:29.234113	2018-05-25 09:29:29.234113
2607	1	869	\N	2018-05-25 09:29:29.235967	2018-05-25 09:29:29.235967
2608	2	870	\N	2018-05-25 09:29:29.240494	2018-05-25 09:29:29.240494
2609	3	870	\N	2018-05-25 09:29:29.242446	2018-05-25 09:29:29.242446
2610	1	870	\N	2018-05-25 09:29:29.244356	2018-05-25 09:29:29.244356
2611	2	871	\N	2018-05-25 09:29:29.248469	2018-05-25 09:29:29.248469
2612	3	871	\N	2018-05-25 09:29:29.250238	2018-05-25 09:29:29.250238
2613	1	871	\N	2018-05-25 09:29:29.251997	2018-05-25 09:29:29.251997
2614	2	872	\N	2018-05-25 09:29:29.255955	2018-05-25 09:29:29.255955
2615	3	872	\N	2018-05-25 09:29:29.257893	2018-05-25 09:29:29.257893
2616	1	872	\N	2018-05-25 09:29:29.259816	2018-05-25 09:29:29.259816
2617	2	873	\N	2018-05-25 09:29:29.264569	2018-05-25 09:29:29.264569
2618	3	873	\N	2018-05-25 09:29:29.266606	2018-05-25 09:29:29.266606
2619	1	873	\N	2018-05-25 09:29:29.268445	2018-05-25 09:29:29.268445
2620	2	874	\N	2018-05-25 09:29:29.272465	2018-05-25 09:29:29.272465
2621	3	874	\N	2018-05-25 09:29:29.274241	2018-05-25 09:29:29.274241
2622	1	874	\N	2018-05-25 09:29:29.276069	2018-05-25 09:29:29.276069
2623	2	875	\N	2018-05-25 09:29:29.280356	2018-05-25 09:29:29.280356
2624	3	875	\N	2018-05-25 09:29:29.282342	2018-05-25 09:29:29.282342
2625	1	875	\N	2018-05-25 09:29:29.284282	2018-05-25 09:29:29.284282
2626	2	876	\N	2018-05-25 09:29:29.288186	2018-05-25 09:29:29.288186
2627	3	876	\N	2018-05-25 09:29:29.290072	2018-05-25 09:29:29.290072
2628	1	876	\N	2018-05-25 09:29:29.292211	2018-05-25 09:29:29.292211
2629	2	877	\N	2018-05-25 09:29:29.296209	2018-05-25 09:29:29.296209
2630	3	877	\N	2018-05-25 09:29:29.298409	2018-05-25 09:29:29.298409
2631	1	877	\N	2018-05-25 09:29:29.300453	2018-05-25 09:29:29.300453
2632	2	878	\N	2018-05-25 09:29:29.304396	2018-05-25 09:29:29.304396
2633	3	878	\N	2018-05-25 09:29:29.306309	2018-05-25 09:29:29.306309
2634	1	878	\N	2018-05-25 09:29:29.308264	2018-05-25 09:29:29.308264
2635	2	879	\N	2018-05-25 09:29:29.3123	2018-05-25 09:29:29.3123
2636	3	879	\N	2018-05-25 09:29:29.314706	2018-05-25 09:29:29.314706
2637	1	879	\N	2018-05-25 09:29:29.316786	2018-05-25 09:29:29.316786
2638	2	880	\N	2018-05-25 09:29:29.321834	2018-05-25 09:29:29.321834
2639	3	880	\N	2018-05-25 09:29:29.32394	2018-05-25 09:29:29.32394
2640	1	880	\N	2018-05-25 09:29:29.326097	2018-05-25 09:29:29.326097
2641	2	881	\N	2018-05-25 09:29:29.330738	2018-05-25 09:29:29.330738
2642	3	881	\N	2018-05-25 09:29:29.33265	2018-05-25 09:29:29.33265
2643	1	881	\N	2018-05-25 09:29:29.334479	2018-05-25 09:29:29.334479
2644	2	882	\N	2018-05-25 09:29:29.33888	2018-05-25 09:29:29.33888
2645	3	882	\N	2018-05-25 09:29:29.340956	2018-05-25 09:29:29.340956
2646	1	882	\N	2018-05-25 09:29:29.343002	2018-05-25 09:29:29.343002
2647	2	883	\N	2018-05-25 09:29:29.347791	2018-05-25 09:29:29.347791
2648	3	883	\N	2018-05-25 09:29:29.350057	2018-05-25 09:29:29.350057
2649	1	883	\N	2018-05-25 09:29:29.352212	2018-05-25 09:29:29.352212
2650	2	884	\N	2018-05-25 09:29:29.356736	2018-05-25 09:29:29.356736
2651	3	884	\N	2018-05-25 09:29:29.359485	2018-05-25 09:29:29.359485
2652	1	884	\N	2018-05-25 09:29:29.361963	2018-05-25 09:29:29.361963
2653	2	885	\N	2018-05-25 09:29:29.367495	2018-05-25 09:29:29.367495
2654	3	885	\N	2018-05-25 09:29:29.369886	2018-05-25 09:29:29.369886
2655	1	885	\N	2018-05-25 09:29:29.372048	2018-05-25 09:29:29.372048
2656	2	886	\N	2018-05-25 09:29:29.376819	2018-05-25 09:29:29.376819
2657	3	886	\N	2018-05-25 09:29:29.378931	2018-05-25 09:29:29.378931
2658	1	886	\N	2018-05-25 09:29:29.38086	2018-05-25 09:29:29.38086
2659	2	887	\N	2018-05-25 09:29:29.384848	2018-05-25 09:29:29.384848
2660	3	887	\N	2018-05-25 09:29:29.386938	2018-05-25 09:29:29.386938
2661	1	887	\N	2018-05-25 09:29:29.388972	2018-05-25 09:29:29.388972
2662	2	888	\N	2018-05-25 09:29:29.393756	2018-05-25 09:29:29.393756
2663	3	888	\N	2018-05-25 09:29:29.395966	2018-05-25 09:29:29.395966
2664	1	888	\N	2018-05-25 09:29:29.398164	2018-05-25 09:29:29.398164
2665	2	889	\N	2018-05-25 09:29:29.403014	2018-05-25 09:29:29.403014
2666	3	889	\N	2018-05-25 09:29:29.405019	2018-05-25 09:29:29.405019
2667	1	889	\N	2018-05-25 09:29:29.407124	2018-05-25 09:29:29.407124
2668	2	890	\N	2018-05-25 09:29:29.412388	2018-05-25 09:29:29.412388
2669	3	890	\N	2018-05-25 09:29:29.414357	2018-05-25 09:29:29.414357
2670	1	890	\N	2018-05-25 09:29:29.416433	2018-05-25 09:29:29.416433
2671	2	891	\N	2018-05-25 09:29:29.420773	2018-05-25 09:29:29.420773
2672	3	891	\N	2018-05-25 09:29:29.422818	2018-05-25 09:29:29.422818
2673	1	891	\N	2018-05-25 09:29:29.424652	2018-05-25 09:29:29.424652
2674	2	892	\N	2018-05-25 09:29:29.428883	2018-05-25 09:29:29.428883
2675	3	892	\N	2018-05-25 09:29:29.430777	2018-05-25 09:29:29.430777
2676	1	892	\N	2018-05-25 09:29:29.432737	2018-05-25 09:29:29.432737
2677	2	893	\N	2018-05-25 09:29:29.436829	2018-05-25 09:29:29.436829
2678	3	893	\N	2018-05-25 09:29:29.438728	2018-05-25 09:29:29.438728
2679	1	893	\N	2018-05-25 09:29:29.440711	2018-05-25 09:29:29.440711
2680	2	894	\N	2018-05-25 09:29:29.4448	2018-05-25 09:29:29.4448
2681	3	894	\N	2018-05-25 09:29:29.446798	2018-05-25 09:29:29.446798
2682	1	894	\N	2018-05-25 09:29:29.448628	2018-05-25 09:29:29.448628
2683	2	895	\N	2018-05-25 09:29:29.452556	2018-05-25 09:29:29.452556
2684	3	895	\N	2018-05-25 09:29:29.454566	2018-05-25 09:29:29.454566
2685	1	895	\N	2018-05-25 09:29:29.456743	2018-05-25 09:29:29.456743
2686	2	896	\N	2018-05-25 09:29:29.461351	2018-05-25 09:29:29.461351
2687	3	896	\N	2018-05-25 09:29:29.463381	2018-05-25 09:29:29.463381
2688	1	896	\N	2018-05-25 09:29:29.46547	2018-05-25 09:29:29.46547
2689	2	897	\N	2018-05-25 09:29:29.470599	2018-05-25 09:29:29.470599
2690	3	897	\N	2018-05-25 09:29:29.472728	2018-05-25 09:29:29.472728
2691	1	897	\N	2018-05-25 09:29:29.474757	2018-05-25 09:29:29.474757
2692	2	898	\N	2018-05-25 09:29:29.479781	2018-05-25 09:29:29.479781
2693	3	898	\N	2018-05-25 09:29:29.481849	2018-05-25 09:29:29.481849
2694	1	898	\N	2018-05-25 09:29:29.483939	2018-05-25 09:29:29.483939
2695	2	899	\N	2018-05-25 09:29:29.488298	2018-05-25 09:29:29.488298
2696	3	899	\N	2018-05-25 09:29:29.490312	2018-05-25 09:29:29.490312
2697	1	899	\N	2018-05-25 09:29:29.492385	2018-05-25 09:29:29.492385
2698	2	900	\N	2018-05-25 09:29:29.496705	2018-05-25 09:29:29.496705
2699	3	900	\N	2018-05-25 09:29:29.498531	2018-05-25 09:29:29.498531
2700	1	900	\N	2018-05-25 09:29:29.500508	2018-05-25 09:29:29.500508
2701	2	901	\N	2018-05-25 09:29:29.504235	2018-05-25 09:29:29.504235
2702	3	901	\N	2018-05-25 09:29:29.506119	2018-05-25 09:29:29.506119
2703	1	901	\N	2018-05-25 09:29:29.508172	2018-05-25 09:29:29.508172
2704	2	902	\N	2018-05-25 09:29:29.512357	2018-05-25 09:29:29.512357
2705	3	902	\N	2018-05-25 09:29:29.514361	2018-05-25 09:29:29.514361
2706	1	902	\N	2018-05-25 09:29:29.516447	2018-05-25 09:29:29.516447
2707	2	903	\N	2018-05-25 09:29:29.520308	2018-05-25 09:29:29.520308
2708	3	903	\N	2018-05-25 09:29:29.522225	2018-05-25 09:29:29.522225
2709	1	903	\N	2018-05-25 09:29:29.524346	2018-05-25 09:29:29.524346
2710	2	904	\N	2018-05-25 09:29:29.530518	2018-05-25 09:29:29.530518
2711	3	904	\N	2018-05-25 09:29:29.532884	2018-05-25 09:29:29.532884
2712	1	904	\N	2018-05-25 09:29:29.535035	2018-05-25 09:29:29.535035
2713	2	905	\N	2018-05-25 09:29:29.540716	2018-05-25 09:29:29.540716
2714	3	905	\N	2018-05-25 09:29:29.543379	2018-05-25 09:29:29.543379
2715	1	905	\N	2018-05-25 09:29:29.546021	2018-05-25 09:29:29.546021
2716	2	906	\N	2018-05-25 09:29:29.551175	2018-05-25 09:29:29.551175
2717	3	906	\N	2018-05-25 09:29:29.553788	2018-05-25 09:29:29.553788
2718	1	906	\N	2018-05-25 09:29:29.556282	2018-05-25 09:29:29.556282
2719	2	907	\N	2018-05-25 09:29:29.561868	2018-05-25 09:29:29.561868
2720	3	907	\N	2018-05-25 09:29:29.564415	2018-05-25 09:29:29.564415
2721	1	907	\N	2018-05-25 09:29:29.566896	2018-05-25 09:29:29.566896
2722	2	908	\N	2018-05-25 09:29:29.571823	2018-05-25 09:29:29.571823
2723	3	908	\N	2018-05-25 09:29:29.573931	2018-05-25 09:29:29.573931
2724	1	908	\N	2018-05-25 09:29:29.576484	2018-05-25 09:29:29.576484
2725	2	909	\N	2018-05-25 09:29:29.581542	2018-05-25 09:29:29.581542
2726	3	909	\N	2018-05-25 09:29:29.583958	2018-05-25 09:29:29.583958
2727	1	909	\N	2018-05-25 09:29:29.586251	2018-05-25 09:29:29.586251
2728	2	910	\N	2018-05-25 09:29:29.591506	2018-05-25 09:29:29.591506
2729	3	910	\N	2018-05-25 09:29:29.593743	2018-05-25 09:29:29.593743
2730	1	910	\N	2018-05-25 09:29:29.595837	2018-05-25 09:29:29.595837
2731	2	911	\N	2018-05-25 09:29:29.600055	2018-05-25 09:29:29.600055
2732	3	911	\N	2018-05-25 09:29:29.602458	2018-05-25 09:29:29.602458
2733	1	911	\N	2018-05-25 09:29:29.604492	2018-05-25 09:29:29.604492
2734	2	912	\N	2018-05-25 09:29:29.608583	2018-05-25 09:29:29.608583
2735	3	912	\N	2018-05-25 09:29:29.610571	2018-05-25 09:29:29.610571
2736	1	912	\N	2018-05-25 09:29:29.612319	2018-05-25 09:29:29.612319
2737	2	913	\N	2018-05-25 09:29:29.61801	2018-05-25 09:29:29.61801
2738	3	913	\N	2018-05-25 09:29:29.620068	2018-05-25 09:29:29.620068
2739	1	913	\N	2018-05-25 09:29:29.623288	2018-05-25 09:29:29.623288
2740	2	914	\N	2018-05-25 09:29:29.628781	2018-05-25 09:29:29.628781
2741	3	914	\N	2018-05-25 09:29:29.630691	2018-05-25 09:29:29.630691
2742	1	914	\N	2018-05-25 09:29:29.632702	2018-05-25 09:29:29.632702
2743	2	915	\N	2018-05-25 09:29:29.636967	2018-05-25 09:29:29.636967
2744	3	915	\N	2018-05-25 09:29:29.639077	2018-05-25 09:29:29.639077
2745	1	915	\N	2018-05-25 09:29:29.641072	2018-05-25 09:29:29.641072
2746	2	916	\N	2018-05-25 09:29:29.64514	2018-05-25 09:29:29.64514
2747	3	916	\N	2018-05-25 09:29:29.647286	2018-05-25 09:29:29.647286
2748	1	916	\N	2018-05-25 09:29:29.649708	2018-05-25 09:29:29.649708
2749	2	917	\N	2018-05-25 09:29:29.654548	2018-05-25 09:29:29.654548
2750	3	917	\N	2018-05-25 09:29:29.657239	2018-05-25 09:29:29.657239
2751	1	917	\N	2018-05-25 09:29:29.659343	2018-05-25 09:29:29.659343
2752	2	918	\N	2018-05-25 09:29:29.663769	2018-05-25 09:29:29.663769
2753	3	918	\N	2018-05-25 09:29:29.665599	2018-05-25 09:29:29.665599
2754	1	918	\N	2018-05-25 09:29:29.66756	2018-05-25 09:29:29.66756
2755	2	919	\N	2018-05-25 09:29:29.671727	2018-05-25 09:29:29.671727
2756	3	919	\N	2018-05-25 09:29:29.67399	2018-05-25 09:29:29.67399
2757	1	919	\N	2018-05-25 09:29:29.675929	2018-05-25 09:29:29.675929
2758	2	920	\N	2018-05-25 09:29:29.680169	2018-05-25 09:29:29.680169
2759	3	920	\N	2018-05-25 09:29:29.682169	2018-05-25 09:29:29.682169
2760	1	920	\N	2018-05-25 09:29:29.684125	2018-05-25 09:29:29.684125
2761	2	921	\N	2018-05-25 09:29:29.688538	2018-05-25 09:29:29.688538
2762	3	921	\N	2018-05-25 09:29:29.690705	2018-05-25 09:29:29.690705
2763	1	921	\N	2018-05-25 09:29:29.692773	2018-05-25 09:29:29.692773
2764	2	922	\N	2018-05-25 09:29:29.696683	2018-05-25 09:29:29.696683
2765	3	922	\N	2018-05-25 09:29:29.69884	2018-05-25 09:29:29.69884
2766	1	922	\N	2018-05-25 09:29:29.700815	2018-05-25 09:29:29.700815
2767	2	923	\N	2018-05-25 09:29:29.704923	2018-05-25 09:29:29.704923
2768	3	923	\N	2018-05-25 09:29:29.706807	2018-05-25 09:29:29.706807
2769	1	923	\N	2018-05-25 09:29:29.709133	2018-05-25 09:29:29.709133
2770	2	924	\N	2018-05-25 09:29:29.713839	2018-05-25 09:29:29.713839
2771	3	924	\N	2018-05-25 09:29:29.715816	2018-05-25 09:29:29.715816
2772	1	924	\N	2018-05-25 09:29:29.717736	2018-05-25 09:29:29.717736
2773	2	925	\N	2018-05-25 09:29:29.721707	2018-05-25 09:29:29.721707
2774	3	925	\N	2018-05-25 09:29:29.723542	2018-05-25 09:29:29.723542
2775	1	925	\N	2018-05-25 09:29:29.725336	2018-05-25 09:29:29.725336
2776	2	926	\N	2018-05-25 09:29:29.729822	2018-05-25 09:29:29.729822
2777	3	926	\N	2018-05-25 09:29:29.731809	2018-05-25 09:29:29.731809
2778	1	926	\N	2018-05-25 09:29:29.733947	2018-05-25 09:29:29.733947
2779	2	927	\N	2018-05-25 09:29:29.738774	2018-05-25 09:29:29.738774
2780	3	927	\N	2018-05-25 09:29:29.74104	2018-05-25 09:29:29.74104
2781	1	927	\N	2018-05-25 09:29:29.74303	2018-05-25 09:29:29.74303
2782	2	928	\N	2018-05-25 09:29:29.747618	2018-05-25 09:29:29.747618
2783	3	928	\N	2018-05-25 09:29:29.7499	2018-05-25 09:29:29.7499
2784	1	928	\N	2018-05-25 09:29:29.752077	2018-05-25 09:29:29.752077
2785	2	929	\N	2018-05-25 09:29:29.757213	2018-05-25 09:29:29.757213
2786	3	929	\N	2018-05-25 09:29:29.75923	2018-05-25 09:29:29.75923
2787	1	929	\N	2018-05-25 09:29:29.761241	2018-05-25 09:29:29.761241
2788	2	930	\N	2018-05-25 09:29:29.765112	2018-05-25 09:29:29.765112
2789	3	930	\N	2018-05-25 09:29:29.766899	2018-05-25 09:29:29.766899
2790	1	930	\N	2018-05-25 09:29:29.768949	2018-05-25 09:29:29.768949
2791	2	931	\N	2018-05-25 09:29:29.772972	2018-05-25 09:29:29.772972
2792	3	931	\N	2018-05-25 09:29:29.775122	2018-05-25 09:29:29.775122
2793	1	931	\N	2018-05-25 09:29:29.777086	2018-05-25 09:29:29.777086
2794	2	932	\N	2018-05-25 09:29:29.781008	2018-05-25 09:29:29.781008
2795	3	932	\N	2018-05-25 09:29:29.782852	2018-05-25 09:29:29.782852
2796	1	932	\N	2018-05-25 09:29:29.784589	2018-05-25 09:29:29.784589
2797	2	933	\N	2018-05-25 09:29:29.788686	2018-05-25 09:29:29.788686
2798	3	933	\N	2018-05-25 09:29:29.790811	2018-05-25 09:29:29.790811
2799	1	933	\N	2018-05-25 09:29:29.792763	2018-05-25 09:29:29.792763
2800	2	934	\N	2018-05-25 09:29:29.797055	2018-05-25 09:29:29.797055
2801	3	934	\N	2018-05-25 09:29:29.798829	2018-05-25 09:29:29.798829
2802	1	934	\N	2018-05-25 09:29:29.800703	2018-05-25 09:29:29.800703
2803	2	935	\N	2018-05-25 09:29:29.80464	2018-05-25 09:29:29.80464
2804	3	935	\N	2018-05-25 09:29:29.806586	2018-05-25 09:29:29.806586
2805	1	935	\N	2018-05-25 09:29:29.808521	2018-05-25 09:29:29.808521
2806	2	936	\N	2018-05-25 09:29:29.812661	2018-05-25 09:29:29.812661
2807	3	936	\N	2018-05-25 09:29:29.814598	2018-05-25 09:29:29.814598
2808	1	936	\N	2018-05-25 09:29:29.816778	2018-05-25 09:29:29.816778
2809	2	937	\N	2018-05-25 09:29:29.821518	2018-05-25 09:29:29.821518
2810	3	937	\N	2018-05-25 09:29:29.823405	2018-05-25 09:29:29.823405
2811	1	937	\N	2018-05-25 09:29:29.825499	2018-05-25 09:29:29.825499
2812	2	938	\N	2018-05-25 09:29:29.829522	2018-05-25 09:29:29.829522
2813	3	938	\N	2018-05-25 09:29:29.8314	2018-05-25 09:29:29.8314
2814	1	938	\N	2018-05-25 09:29:29.83323	2018-05-25 09:29:29.83323
2815	2	939	\N	2018-05-25 09:29:29.837079	2018-05-25 09:29:29.837079
2816	3	939	\N	2018-05-25 09:29:29.839186	2018-05-25 09:29:29.839186
2817	1	939	\N	2018-05-25 09:29:29.841041	2018-05-25 09:29:29.841041
2818	2	940	\N	2018-05-25 09:29:29.845209	2018-05-25 09:29:29.845209
2819	3	940	\N	2018-05-25 09:29:29.847128	2018-05-25 09:29:29.847128
2820	1	940	\N	2018-05-25 09:29:29.848992	2018-05-25 09:29:29.848992
2821	2	941	\N	2018-05-25 09:29:29.852892	2018-05-25 09:29:29.852892
2822	3	941	\N	2018-05-25 09:29:29.854674	2018-05-25 09:29:29.854674
2823	1	941	\N	2018-05-25 09:29:29.856449	2018-05-25 09:29:29.856449
2824	2	942	\N	2018-05-25 09:29:29.860944	2018-05-25 09:29:29.860944
2825	3	942	\N	2018-05-25 09:29:29.862856	2018-05-25 09:29:29.862856
2826	1	942	\N	2018-05-25 09:29:29.86505	2018-05-25 09:29:29.86505
2827	2	943	\N	2018-05-25 09:29:29.86976	2018-05-25 09:29:29.86976
2828	3	943	\N	2018-05-25 09:29:29.872029	2018-05-25 09:29:29.872029
2829	1	943	\N	2018-05-25 09:29:29.874124	2018-05-25 09:29:29.874124
2830	2	944	\N	2018-05-25 09:29:29.878387	2018-05-25 09:29:29.878387
2831	3	944	\N	2018-05-25 09:29:29.880467	2018-05-25 09:29:29.880467
2832	1	944	\N	2018-05-25 09:29:29.882635	2018-05-25 09:29:29.882635
2833	2	945	\N	2018-05-25 09:29:29.887683	2018-05-25 09:29:29.887683
2834	3	945	\N	2018-05-25 09:29:29.889604	2018-05-25 09:29:29.889604
2835	1	945	\N	2018-05-25 09:29:29.891462	2018-05-25 09:29:29.891462
2836	2	946	\N	2018-05-25 09:29:29.895488	2018-05-25 09:29:29.895488
2837	3	946	\N	2018-05-25 09:29:29.897349	2018-05-25 09:29:29.897349
2838	1	946	\N	2018-05-25 09:29:29.899194	2018-05-25 09:29:29.899194
2839	2	947	\N	2018-05-25 09:29:29.903372	2018-05-25 09:29:29.903372
2840	3	947	\N	2018-05-25 09:29:29.905421	2018-05-25 09:29:29.905421
2841	1	947	\N	2018-05-25 09:29:29.90736	2018-05-25 09:29:29.90736
2842	2	948	\N	2018-05-25 09:29:29.911444	2018-05-25 09:29:29.911444
2843	3	948	\N	2018-05-25 09:29:29.91336	2018-05-25 09:29:29.91336
2844	1	948	\N	2018-05-25 09:29:29.915178	2018-05-25 09:29:29.915178
2845	2	949	\N	2018-05-25 09:29:29.919158	2018-05-25 09:29:29.919158
2846	3	949	\N	2018-05-25 09:29:29.92191	2018-05-25 09:29:29.92191
2847	1	949	\N	2018-05-25 09:29:29.924132	2018-05-25 09:29:29.924132
2848	2	950	\N	2018-05-25 09:29:29.928672	2018-05-25 09:29:29.928672
2849	3	950	\N	2018-05-25 09:29:29.930896	2018-05-25 09:29:29.930896
2850	1	950	\N	2018-05-25 09:29:29.932678	2018-05-25 09:29:29.932678
2851	2	951	\N	2018-05-25 09:29:29.936671	2018-05-25 09:29:29.936671
2852	3	951	\N	2018-05-25 09:29:29.939025	2018-05-25 09:29:29.939025
2853	1	951	\N	2018-05-25 09:29:29.941575	2018-05-25 09:29:29.941575
2854	2	952	\N	2018-05-25 09:29:29.948928	2018-05-25 09:29:29.948928
2855	3	952	\N	2018-05-25 09:29:29.951035	2018-05-25 09:29:29.951035
2856	1	952	\N	2018-05-25 09:29:29.952943	2018-05-25 09:29:29.952943
2857	2	953	\N	2018-05-25 09:29:29.957558	2018-05-25 09:29:29.957558
2858	3	953	\N	2018-05-25 09:29:29.959306	2018-05-25 09:29:29.959306
2859	1	953	\N	2018-05-25 09:29:29.961088	2018-05-25 09:29:29.961088
2860	2	954	\N	2018-05-25 09:29:29.96505	2018-05-25 09:29:29.96505
2861	3	954	\N	2018-05-25 09:29:29.967371	2018-05-25 09:29:29.967371
2862	1	954	\N	2018-05-25 09:29:29.969368	2018-05-25 09:29:29.969368
2863	2	955	\N	2018-05-25 09:29:29.974268	2018-05-25 09:29:29.974268
2864	3	955	\N	2018-05-25 09:29:29.976163	2018-05-25 09:29:29.976163
2865	1	955	\N	2018-05-25 09:29:29.97834	2018-05-25 09:29:29.97834
2866	2	956	\N	2018-05-25 09:29:29.982946	2018-05-25 09:29:29.982946
2867	3	956	\N	2018-05-25 09:29:29.985423	2018-05-25 09:29:29.985423
2868	1	956	\N	2018-05-25 09:29:29.987858	2018-05-25 09:29:29.987858
2869	2	957	\N	2018-05-25 09:29:29.9946	2018-05-25 09:29:29.9946
2870	3	957	\N	2018-05-25 09:29:29.996739	2018-05-25 09:29:29.996739
2871	1	957	\N	2018-05-25 09:29:29.998914	2018-05-25 09:29:29.998914
2872	2	958	\N	2018-05-25 09:29:30.003395	2018-05-25 09:29:30.003395
2873	3	958	\N	2018-05-25 09:29:30.005341	2018-05-25 09:29:30.005341
2874	1	958	\N	2018-05-25 09:29:30.007199	2018-05-25 09:29:30.007199
2875	2	959	\N	2018-05-25 09:29:30.011298	2018-05-25 09:29:30.011298
2876	3	959	\N	2018-05-25 09:29:30.013219	2018-05-25 09:29:30.013219
2877	1	959	\N	2018-05-25 09:29:30.015195	2018-05-25 09:29:30.015195
2878	2	960	\N	2018-05-25 09:29:30.019698	2018-05-25 09:29:30.019698
2879	3	960	\N	2018-05-25 09:29:30.021686	2018-05-25 09:29:30.021686
2880	1	960	\N	2018-05-25 09:29:30.023755	2018-05-25 09:29:30.023755
2881	2	961	\N	2018-05-25 09:29:30.02976	2018-05-25 09:29:30.02976
2882	4	961	\N	2018-05-25 09:29:30.031919	2018-05-25 09:29:30.031919
2883	2	962	\N	2018-05-25 09:29:30.03671	2018-05-25 09:29:30.03671
2884	4	962	\N	2018-05-25 09:29:30.039111	2018-05-25 09:29:30.039111
2885	2	963	\N	2018-05-25 09:29:30.044963	2018-05-25 09:29:30.044963
2886	4	963	\N	2018-05-25 09:29:30.047464	2018-05-25 09:29:30.047464
2887	2	964	\N	2018-05-25 09:29:30.051492	2018-05-25 09:29:30.051492
2888	4	964	\N	2018-05-25 09:29:30.053474	2018-05-25 09:29:30.053474
2889	2	965	\N	2018-05-25 09:29:30.05804	2018-05-25 09:29:30.05804
2890	4	965	\N	2018-05-25 09:29:30.060582	2018-05-25 09:29:30.060582
2891	2	966	\N	2018-05-25 09:29:30.065411	2018-05-25 09:29:30.065411
2892	4	966	\N	2018-05-25 09:29:30.067795	2018-05-25 09:29:30.067795
2893	2	967	\N	2018-05-25 09:29:30.072509	2018-05-25 09:29:30.072509
2894	4	967	\N	2018-05-25 09:29:30.07471	2018-05-25 09:29:30.07471
2895	2	968	\N	2018-05-25 09:29:30.079501	2018-05-25 09:29:30.079501
2896	4	968	\N	2018-05-25 09:29:30.081513	2018-05-25 09:29:30.081513
2897	2	969	\N	2018-05-25 09:29:30.086188	2018-05-25 09:29:30.086188
2898	4	969	\N	2018-05-25 09:29:30.088285	2018-05-25 09:29:30.088285
2899	2	970	\N	2018-05-25 09:29:30.092889	2018-05-25 09:29:30.092889
2900	4	970	\N	2018-05-25 09:29:30.094774	2018-05-25 09:29:30.094774
2901	2	971	\N	2018-05-25 09:29:30.099163	2018-05-25 09:29:30.099163
2902	4	971	\N	2018-05-25 09:29:30.101104	2018-05-25 09:29:30.101104
2903	2	972	\N	2018-05-25 09:29:30.108303	2018-05-25 09:29:30.108303
2904	4	972	\N	2018-05-25 09:29:30.110571	2018-05-25 09:29:30.110571
2905	2	973	\N	2018-05-25 09:29:30.115677	2018-05-25 09:29:30.115677
2906	4	973	\N	2018-05-25 09:29:30.117628	2018-05-25 09:29:30.117628
2907	2	974	\N	2018-05-25 09:29:30.121889	2018-05-25 09:29:30.121889
2908	4	974	\N	2018-05-25 09:29:30.124005	2018-05-25 09:29:30.124005
2909	2	975	\N	2018-05-25 09:29:30.128477	2018-05-25 09:29:30.128477
2910	4	975	\N	2018-05-25 09:29:30.130387	2018-05-25 09:29:30.130387
2911	2	976	\N	2018-05-25 09:29:30.134623	2018-05-25 09:29:30.134623
2912	4	976	\N	2018-05-25 09:29:30.136579	2018-05-25 09:29:30.136579
2913	2	977	\N	2018-05-25 09:29:30.141117	2018-05-25 09:29:30.141117
2914	4	977	\N	2018-05-25 09:29:30.142912	2018-05-25 09:29:30.142912
2915	2	978	\N	2018-05-25 09:29:30.14748	2018-05-25 09:29:30.14748
2916	4	978	\N	2018-05-25 09:29:30.149818	2018-05-25 09:29:30.149818
2917	2	979	\N	2018-05-25 09:29:30.155986	2018-05-25 09:29:30.155986
2918	4	979	\N	2018-05-25 09:29:30.159074	2018-05-25 09:29:30.159074
2919	2	980	\N	2018-05-25 09:29:30.164657	2018-05-25 09:29:30.164657
2920	4	980	\N	2018-05-25 09:29:30.167253	2018-05-25 09:29:30.167253
2921	2	981	\N	2018-05-25 09:29:30.172736	2018-05-25 09:29:30.172736
2922	4	981	\N	2018-05-25 09:29:30.175329	2018-05-25 09:29:30.175329
2923	2	982	\N	2018-05-25 09:29:30.181317	2018-05-25 09:29:30.181317
2924	4	982	\N	2018-05-25 09:29:30.183834	2018-05-25 09:29:30.183834
2925	2	983	\N	2018-05-25 09:29:30.189522	2018-05-25 09:29:30.189522
2926	4	983	\N	2018-05-25 09:29:30.19224	2018-05-25 09:29:30.19224
2927	2	984	\N	2018-05-25 09:29:30.197641	2018-05-25 09:29:30.197641
2928	4	984	\N	2018-05-25 09:29:30.200238	2018-05-25 09:29:30.200238
2929	2	985	\N	2018-05-25 09:29:30.206735	2018-05-25 09:29:30.206735
2930	4	985	\N	2018-05-25 09:29:30.209319	2018-05-25 09:29:30.209319
2931	2	986	\N	2018-05-25 09:29:30.214346	2018-05-25 09:29:30.214346
2932	4	986	\N	2018-05-25 09:29:30.21693	2018-05-25 09:29:30.21693
2933	2	987	\N	2018-05-25 09:29:30.222163	2018-05-25 09:29:30.222163
2934	4	987	\N	2018-05-25 09:29:30.224597	2018-05-25 09:29:30.224597
2935	2	988	\N	2018-05-25 09:29:30.229515	2018-05-25 09:29:30.229515
2936	4	988	\N	2018-05-25 09:29:30.231898	2018-05-25 09:29:30.231898
2937	2	989	\N	2018-05-25 09:29:30.237568	2018-05-25 09:29:30.237568
2938	4	989	\N	2018-05-25 09:29:30.240032	2018-05-25 09:29:30.240032
2939	2	990	\N	2018-05-25 09:29:30.246014	2018-05-25 09:29:30.246014
2940	4	990	\N	2018-05-25 09:29:30.248559	2018-05-25 09:29:30.248559
2941	2	991	\N	2018-05-25 09:29:30.254661	2018-05-25 09:29:30.254661
2942	4	991	\N	2018-05-25 09:29:30.257215	2018-05-25 09:29:30.257215
2943	2	992	\N	2018-05-25 09:29:30.262569	2018-05-25 09:29:30.262569
2944	4	992	\N	2018-05-25 09:29:30.265058	2018-05-25 09:29:30.265058
2945	2	993	\N	2018-05-25 09:29:30.270332	2018-05-25 09:29:30.270332
2946	4	993	\N	2018-05-25 09:29:30.272428	2018-05-25 09:29:30.272428
2947	2	994	\N	2018-05-25 09:29:30.277105	2018-05-25 09:29:30.277105
2948	4	994	\N	2018-05-25 09:29:30.27943	2018-05-25 09:29:30.27943
2949	2	995	\N	2018-05-25 09:29:30.28375	2018-05-25 09:29:30.28375
2950	4	995	\N	2018-05-25 09:29:30.285821	2018-05-25 09:29:30.285821
2951	2	996	\N	2018-05-25 09:29:30.290176	2018-05-25 09:29:30.290176
2952	4	996	\N	2018-05-25 09:29:30.292131	2018-05-25 09:29:30.292131
2953	2	997	\N	2018-05-25 09:29:30.297523	2018-05-25 09:29:30.297523
2954	4	997	\N	2018-05-25 09:29:30.29952	2018-05-25 09:29:30.29952
2955	2	998	\N	2018-05-25 09:29:30.304069	2018-05-25 09:29:30.304069
2956	4	998	\N	2018-05-25 09:29:30.306157	2018-05-25 09:29:30.306157
2957	2	999	\N	2018-05-25 09:29:30.310903	2018-05-25 09:29:30.310903
2958	4	999	\N	2018-05-25 09:29:30.312874	2018-05-25 09:29:30.312874
2959	2	1000	\N	2018-05-25 09:29:30.316958	2018-05-25 09:29:30.316958
2960	4	1000	\N	2018-05-25 09:29:30.319062	2018-05-25 09:29:30.319062
2961	2	1001	\N	2018-05-25 09:29:30.324255	2018-05-25 09:29:30.324255
2962	4	1001	\N	2018-05-25 09:29:30.326276	2018-05-25 09:29:30.326276
2963	2	1002	\N	2018-05-25 09:29:30.330717	2018-05-25 09:29:30.330717
2964	4	1002	\N	2018-05-25 09:29:30.33274	2018-05-25 09:29:30.33274
2965	2	1003	\N	2018-05-25 09:29:30.337213	2018-05-25 09:29:30.337213
2966	4	1003	\N	2018-05-25 09:29:30.339117	2018-05-25 09:29:30.339117
2967	2	1004	\N	2018-05-25 09:29:30.343265	2018-05-25 09:29:30.343265
2968	4	1004	\N	2018-05-25 09:29:30.345384	2018-05-25 09:29:30.345384
2969	2	1005	\N	2018-05-25 09:29:30.349639	2018-05-25 09:29:30.349639
2970	4	1005	\N	2018-05-25 09:29:30.351694	2018-05-25 09:29:30.351694
2971	2	1006	\N	2018-05-25 09:29:30.356929	2018-05-25 09:29:30.356929
2972	4	1006	\N	2018-05-25 09:29:30.359098	2018-05-25 09:29:30.359098
2973	2	1007	\N	2018-05-25 09:29:30.363507	2018-05-25 09:29:30.363507
2974	4	1007	\N	2018-05-25 09:29:30.365528	2018-05-25 09:29:30.365528
2975	2	1008	\N	2018-05-25 09:29:30.369888	2018-05-25 09:29:30.369888
2976	4	1008	\N	2018-05-25 09:29:30.37175	2018-05-25 09:29:30.37175
2977	2	1009	\N	2018-05-25 09:29:30.376782	2018-05-25 09:29:30.376782
2978	4	1009	\N	2018-05-25 09:29:30.378884	2018-05-25 09:29:30.378884
2979	2	1010	\N	2018-05-25 09:29:30.38331	2018-05-25 09:29:30.38331
2980	4	1010	\N	2018-05-25 09:29:30.385441	2018-05-25 09:29:30.385441
2981	2	1011	\N	2018-05-25 09:29:30.391051	2018-05-25 09:29:30.391051
2982	4	1011	\N	2018-05-25 09:29:30.393243	2018-05-25 09:29:30.393243
2983	2	1012	\N	2018-05-25 09:29:30.398225	2018-05-25 09:29:30.398225
2984	4	1012	\N	2018-05-25 09:29:30.400222	2018-05-25 09:29:30.400222
2985	2	1013	\N	2018-05-25 09:29:30.404455	2018-05-25 09:29:30.404455
2986	4	1013	\N	2018-05-25 09:29:30.40679	2018-05-25 09:29:30.40679
2987	2	1014	\N	2018-05-25 09:29:30.411162	2018-05-25 09:29:30.411162
2988	4	1014	\N	2018-05-25 09:29:30.413064	2018-05-25 09:29:30.413064
2989	2	1015	\N	2018-05-25 09:29:30.417889	2018-05-25 09:29:30.417889
2990	4	1015	\N	2018-05-25 09:29:30.419765	2018-05-25 09:29:30.419765
2991	2	1016	\N	2018-05-25 09:29:30.424078	2018-05-25 09:29:30.424078
2992	4	1016	\N	2018-05-25 09:29:30.426069	2018-05-25 09:29:30.426069
2993	2	1017	\N	2018-05-25 09:29:30.430151	2018-05-25 09:29:30.430151
2994	4	1017	\N	2018-05-25 09:29:30.431892	2018-05-25 09:29:30.431892
2995	2	1018	\N	2018-05-25 09:29:30.436116	2018-05-25 09:29:30.436116
2996	4	1018	\N	2018-05-25 09:29:30.438088	2018-05-25 09:29:30.438088
2997	2	1019	\N	2018-05-25 09:29:30.442403	2018-05-25 09:29:30.442403
2998	4	1019	\N	2018-05-25 09:29:30.444557	2018-05-25 09:29:30.444557
2999	2	1020	\N	2018-05-25 09:29:30.449211	2018-05-25 09:29:30.449211
3000	4	1020	\N	2018-05-25 09:29:30.451001	2018-05-25 09:29:30.451001
3001	2	1021	\N	2018-05-25 09:29:30.455624	2018-05-25 09:29:30.455624
3002	4	1021	\N	2018-05-25 09:29:30.457612	2018-05-25 09:29:30.457612
3003	2	1022	\N	2018-05-25 09:29:30.462215	2018-05-25 09:29:30.462215
3004	4	1022	\N	2018-05-25 09:29:30.464349	2018-05-25 09:29:30.464349
3005	2	1023	\N	2018-05-25 09:29:30.468619	2018-05-25 09:29:30.468619
3006	4	1023	\N	2018-05-25 09:29:30.470519	2018-05-25 09:29:30.470519
3007	2	1024	\N	2018-05-25 09:29:30.474685	2018-05-25 09:29:30.474685
3008	4	1024	\N	2018-05-25 09:29:30.476789	2018-05-25 09:29:30.476789
3009	2	1025	\N	2018-05-25 09:29:30.481151	2018-05-25 09:29:30.481151
3010	4	1025	\N	2018-05-25 09:29:30.483146	2018-05-25 09:29:30.483146
3011	2	1026	\N	2018-05-25 09:29:30.487281	2018-05-25 09:29:30.487281
3012	4	1026	\N	2018-05-25 09:29:30.489111	2018-05-25 09:29:30.489111
3013	2	1027	\N	2018-05-25 09:29:30.493863	2018-05-25 09:29:30.493863
3014	4	1027	\N	2018-05-25 09:29:30.496064	2018-05-25 09:29:30.496064
3015	2	1028	\N	2018-05-25 09:29:30.500594	2018-05-25 09:29:30.500594
3016	4	1028	\N	2018-05-25 09:29:30.502656	2018-05-25 09:29:30.502656
3017	2	1029	\N	2018-05-25 09:29:30.506915	2018-05-25 09:29:30.506915
3018	4	1029	\N	2018-05-25 09:29:30.508743	2018-05-25 09:29:30.508743
3019	2	1030	\N	2018-05-25 09:29:30.513126	2018-05-25 09:29:30.513126
3020	4	1030	\N	2018-05-25 09:29:30.51497	2018-05-25 09:29:30.51497
3021	2	1031	\N	2018-05-25 09:29:30.518986	2018-05-25 09:29:30.518986
3022	4	1031	\N	2018-05-25 09:29:30.520891	2018-05-25 09:29:30.520891
3023	2	1032	\N	2018-05-25 09:29:30.525533	2018-05-25 09:29:30.525533
3024	4	1032	\N	2018-05-25 09:29:30.527281	2018-05-25 09:29:30.527281
3025	2	1033	\N	2018-05-25 09:29:30.53241	2018-05-25 09:29:30.53241
3026	4	1033	\N	2018-05-25 09:29:30.534376	2018-05-25 09:29:30.534376
3027	2	1034	\N	2018-05-25 09:29:30.538557	2018-05-25 09:29:30.538557
3028	4	1034	\N	2018-05-25 09:29:30.540329	2018-05-25 09:29:30.540329
3029	2	1035	\N	2018-05-25 09:29:30.544256	2018-05-25 09:29:30.544256
3030	4	1035	\N	2018-05-25 09:29:30.546119	2018-05-25 09:29:30.546119
3031	2	1036	\N	2018-05-25 09:29:30.550172	2018-05-25 09:29:30.550172
3032	4	1036	\N	2018-05-25 09:29:30.552247	2018-05-25 09:29:30.552247
3033	2	1037	\N	2018-05-25 09:29:30.556625	2018-05-25 09:29:30.556625
3034	4	1037	\N	2018-05-25 09:29:30.558513	2018-05-25 09:29:30.558513
3035	2	1038	\N	2018-05-25 09:29:30.562741	2018-05-25 09:29:30.562741
3036	4	1038	\N	2018-05-25 09:29:30.564794	2018-05-25 09:29:30.564794
3037	2	1039	\N	2018-05-25 09:29:30.569588	2018-05-25 09:29:30.569588
3038	4	1039	\N	2018-05-25 09:29:30.571469	2018-05-25 09:29:30.571469
3039	2	1040	\N	2018-05-25 09:29:30.576476	2018-05-25 09:29:30.576476
3040	4	1040	\N	2018-05-25 09:29:30.578669	2018-05-25 09:29:30.578669
3041	2	1041	\N	2018-05-25 09:29:30.583247	2018-05-25 09:29:30.583247
3042	4	1041	\N	2018-05-25 09:29:30.585758	2018-05-25 09:29:30.585758
3043	2	1042	\N	2018-05-25 09:29:30.591402	2018-05-25 09:29:30.591402
3044	4	1042	\N	2018-05-25 09:29:30.593954	2018-05-25 09:29:30.593954
3045	2	1043	\N	2018-05-25 09:29:30.599134	2018-05-25 09:29:30.599134
3046	4	1043	\N	2018-05-25 09:29:30.601562	2018-05-25 09:29:30.601562
3047	2	1044	\N	2018-05-25 09:29:30.606173	2018-05-25 09:29:30.606173
3048	4	1044	\N	2018-05-25 09:29:30.608372	2018-05-25 09:29:30.608372
3049	2	1045	\N	2018-05-25 09:29:30.613614	2018-05-25 09:29:30.613614
3050	4	1045	\N	2018-05-25 09:29:30.615646	2018-05-25 09:29:30.615646
3051	2	1046	\N	2018-05-25 09:29:30.620034	2018-05-25 09:29:30.620034
3052	4	1046	\N	2018-05-25 09:29:30.622308	2018-05-25 09:29:30.622308
3053	2	1047	\N	2018-05-25 09:29:30.626827	2018-05-25 09:29:30.626827
3054	4	1047	\N	2018-05-25 09:29:30.62894	2018-05-25 09:29:30.62894
3055	2	1048	\N	2018-05-25 09:29:30.633148	2018-05-25 09:29:30.633148
3056	4	1048	\N	2018-05-25 09:29:30.634997	2018-05-25 09:29:30.634997
3057	2	1049	\N	2018-05-25 09:29:30.63964	2018-05-25 09:29:30.63964
3058	4	1049	\N	2018-05-25 09:29:30.64178	2018-05-25 09:29:30.64178
3059	2	1050	\N	2018-05-25 09:29:30.646257	2018-05-25 09:29:30.646257
3060	4	1050	\N	2018-05-25 09:29:30.648141	2018-05-25 09:29:30.648141
3061	2	1051	\N	2018-05-25 09:29:30.653002	2018-05-25 09:29:30.653002
3062	4	1051	\N	2018-05-25 09:29:30.654966	2018-05-25 09:29:30.654966
3063	2	1052	\N	2018-05-25 09:29:30.660168	2018-05-25 09:29:30.660168
3064	4	1052	\N	2018-05-25 09:29:30.662064	2018-05-25 09:29:30.662064
3065	2	1053	\N	2018-05-25 09:29:30.666162	2018-05-25 09:29:30.666162
3066	4	1053	\N	2018-05-25 09:29:30.668236	2018-05-25 09:29:30.668236
3067	2	1054	\N	2018-05-25 09:29:30.672731	2018-05-25 09:29:30.672731
3068	4	1054	\N	2018-05-25 09:29:30.674967	2018-05-25 09:29:30.674967
3069	2	1055	\N	2018-05-25 09:29:30.679559	2018-05-25 09:29:30.679559
3070	4	1055	\N	2018-05-25 09:29:30.681477	2018-05-25 09:29:30.681477
3071	2	1056	\N	2018-05-25 09:29:30.685639	2018-05-25 09:29:30.685639
3072	4	1056	\N	2018-05-25 09:29:30.687612	2018-05-25 09:29:30.687612
3073	2	1057	\N	2018-05-25 09:29:30.693055	2018-05-25 09:29:30.693055
3074	4	1057	\N	2018-05-25 09:29:30.69522	2018-05-25 09:29:30.69522
3075	2	1058	\N	2018-05-25 09:29:30.699374	2018-05-25 09:29:30.699374
3076	4	1058	\N	2018-05-25 09:29:30.701251	2018-05-25 09:29:30.701251
3077	2	1059	\N	2018-05-25 09:29:30.70561	2018-05-25 09:29:30.70561
3078	4	1059	\N	2018-05-25 09:29:30.707694	2018-05-25 09:29:30.707694
3079	2	1060	\N	2018-05-25 09:29:30.712127	2018-05-25 09:29:30.712127
3080	4	1060	\N	2018-05-25 09:29:30.714138	2018-05-25 09:29:30.714138
3081	2	1061	\N	2018-05-25 09:29:30.71839	2018-05-25 09:29:30.71839
3082	4	1061	\N	2018-05-25 09:29:30.720253	2018-05-25 09:29:30.720253
3083	2	1062	\N	2018-05-25 09:29:30.725764	2018-05-25 09:29:30.725764
3084	4	1062	\N	2018-05-25 09:29:30.727939	2018-05-25 09:29:30.727939
3085	2	1063	\N	2018-05-25 09:29:30.733433	2018-05-25 09:29:30.733433
3086	4	1063	\N	2018-05-25 09:29:30.735976	2018-05-25 09:29:30.735976
3087	2	1064	\N	2018-05-25 09:29:30.741655	2018-05-25 09:29:30.741655
3088	4	1064	\N	2018-05-25 09:29:30.744312	2018-05-25 09:29:30.744312
3089	2	1065	\N	2018-05-25 09:29:30.7498	2018-05-25 09:29:30.7498
3090	4	1065	\N	2018-05-25 09:29:30.751924	2018-05-25 09:29:30.751924
3091	2	1066	\N	2018-05-25 09:29:30.756489	2018-05-25 09:29:30.756489
3092	4	1066	\N	2018-05-25 09:29:30.759011	2018-05-25 09:29:30.759011
3093	2	1067	\N	2018-05-25 09:29:30.764193	2018-05-25 09:29:30.764193
3094	4	1067	\N	2018-05-25 09:29:30.766479	2018-05-25 09:29:30.766479
3095	2	1068	\N	2018-05-25 09:29:30.771175	2018-05-25 09:29:30.771175
3096	4	1068	\N	2018-05-25 09:29:30.773331	2018-05-25 09:29:30.773331
3097	2	1069	\N	2018-05-25 09:29:30.779118	2018-05-25 09:29:30.779118
3098	4	1069	\N	2018-05-25 09:29:30.781129	2018-05-25 09:29:30.781129
3099	2	1070	\N	2018-05-25 09:29:30.786545	2018-05-25 09:29:30.786545
3100	4	1070	\N	2018-05-25 09:29:30.788803	2018-05-25 09:29:30.788803
3101	2	1071	\N	2018-05-25 09:29:30.793616	2018-05-25 09:29:30.793616
3102	4	1071	\N	2018-05-25 09:29:30.795731	2018-05-25 09:29:30.795731
3103	2	1072	\N	2018-05-25 09:29:30.80001	2018-05-25 09:29:30.80001
3104	4	1072	\N	2018-05-25 09:29:30.802029	2018-05-25 09:29:30.802029
3105	2	1073	\N	2018-05-25 09:29:30.806231	2018-05-25 09:29:30.806231
3106	4	1073	\N	2018-05-25 09:29:30.808199	2018-05-25 09:29:30.808199
3107	2	1074	\N	2018-05-25 09:29:30.812583	2018-05-25 09:29:30.812583
3108	4	1074	\N	2018-05-25 09:29:30.814546	2018-05-25 09:29:30.814546
3109	2	1075	\N	2018-05-25 09:29:30.818943	2018-05-25 09:29:30.818943
3110	4	1075	\N	2018-05-25 09:29:30.820741	2018-05-25 09:29:30.820741
3111	2	1076	\N	2018-05-25 09:29:30.82516	2018-05-25 09:29:30.82516
3112	4	1076	\N	2018-05-25 09:29:30.826957	2018-05-25 09:29:30.826957
3113	2	1077	\N	2018-05-25 09:29:30.831062	2018-05-25 09:29:30.831062
3114	4	1077	\N	2018-05-25 09:29:30.833016	2018-05-25 09:29:30.833016
3115	2	1078	\N	2018-05-25 09:29:30.83726	2018-05-25 09:29:30.83726
3116	4	1078	\N	2018-05-25 09:29:30.839145	2018-05-25 09:29:30.839145
3117	2	1079	\N	2018-05-25 09:29:30.843757	2018-05-25 09:29:30.843757
3118	4	1079	\N	2018-05-25 09:29:30.845794	2018-05-25 09:29:30.845794
3119	2	1080	\N	2018-05-25 09:29:30.850002	2018-05-25 09:29:30.850002
3120	4	1080	\N	2018-05-25 09:29:30.852037	2018-05-25 09:29:30.852037
3121	2	1081	\N	2018-05-25 09:29:30.857883	2018-05-25 09:29:30.857883
3122	4	1081	\N	2018-05-25 09:29:30.860179	2018-05-25 09:29:30.860179
3123	2	1082	\N	2018-05-25 09:29:30.864498	2018-05-25 09:29:30.864498
3124	4	1082	\N	2018-05-25 09:29:30.866552	2018-05-25 09:29:30.866552
3125	2	1083	\N	2018-05-25 09:29:30.870879	2018-05-25 09:29:30.870879
3126	4	1083	\N	2018-05-25 09:29:30.872762	2018-05-25 09:29:30.872762
3127	2	1084	\N	2018-05-25 09:29:30.876923	2018-05-25 09:29:30.876923
3128	4	1084	\N	2018-05-25 09:29:30.878897	2018-05-25 09:29:30.878897
3129	2	1085	\N	2018-05-25 09:29:30.88297	2018-05-25 09:29:30.88297
3130	4	1085	\N	2018-05-25 09:29:30.884907	2018-05-25 09:29:30.884907
3131	2	1086	\N	2018-05-25 09:29:30.889182	2018-05-25 09:29:30.889182
3132	4	1086	\N	2018-05-25 09:29:30.891525	2018-05-25 09:29:30.891525
3133	2	1087	\N	2018-05-25 09:29:30.897315	2018-05-25 09:29:30.897315
3134	4	1087	\N	2018-05-25 09:29:30.899403	2018-05-25 09:29:30.899403
3135	2	1088	\N	2018-05-25 09:29:30.904111	2018-05-25 09:29:30.904111
3136	4	1088	\N	2018-05-25 09:29:30.906367	2018-05-25 09:29:30.906367
3137	2	1089	\N	2018-05-25 09:29:30.911757	2018-05-25 09:29:30.911757
3138	4	1089	\N	2018-05-25 09:29:30.914121	2018-05-25 09:29:30.914121
3139	2	1090	\N	2018-05-25 09:29:30.9197	2018-05-25 09:29:30.9197
3140	4	1090	\N	2018-05-25 09:29:30.922222	2018-05-25 09:29:30.922222
3141	2	1091	\N	2018-05-25 09:29:30.927245	2018-05-25 09:29:30.927245
3142	4	1091	\N	2018-05-25 09:29:30.929421	2018-05-25 09:29:30.929421
3143	2	1092	\N	2018-05-25 09:29:30.933997	2018-05-25 09:29:30.933997
3144	4	1092	\N	2018-05-25 09:29:30.935863	2018-05-25 09:29:30.935863
3145	2	1093	\N	2018-05-25 09:29:30.94158	2018-05-25 09:29:30.94158
3146	4	1093	\N	2018-05-25 09:29:30.943692	2018-05-25 09:29:30.943692
3147	2	1094	\N	2018-05-25 09:29:30.948196	2018-05-25 09:29:30.948196
3148	4	1094	\N	2018-05-25 09:29:30.950077	2018-05-25 09:29:30.950077
3149	2	1095	\N	2018-05-25 09:29:30.954285	2018-05-25 09:29:30.954285
3150	4	1095	\N	2018-05-25 09:29:30.956465	2018-05-25 09:29:30.956465
3151	2	1096	\N	2018-05-25 09:29:30.96122	2018-05-25 09:29:30.96122
3152	4	1096	\N	2018-05-25 09:29:30.963586	2018-05-25 09:29:30.963586
3153	2	1097	\N	2018-05-25 09:29:30.969103	2018-05-25 09:29:30.969103
3154	4	1097	\N	2018-05-25 09:29:30.971609	2018-05-25 09:29:30.971609
3155	2	1098	\N	2018-05-25 09:29:30.97696	2018-05-25 09:29:30.97696
3156	4	1098	\N	2018-05-25 09:29:30.979336	2018-05-25 09:29:30.979336
3157	2	1099	\N	2018-05-25 09:29:30.985135	2018-05-25 09:29:30.985135
3158	4	1099	\N	2018-05-25 09:29:30.987817	2018-05-25 09:29:30.987817
3159	2	1100	\N	2018-05-25 09:29:30.993605	2018-05-25 09:29:30.993605
3160	4	1100	\N	2018-05-25 09:29:30.995845	2018-05-25 09:29:30.995845
3161	2	1101	\N	2018-05-25 09:29:31.001598	2018-05-25 09:29:31.001598
3162	4	1101	\N	2018-05-25 09:29:31.003747	2018-05-25 09:29:31.003747
3163	2	1102	\N	2018-05-25 09:29:31.009178	2018-05-25 09:29:31.009178
3164	4	1102	\N	2018-05-25 09:29:31.011199	2018-05-25 09:29:31.011199
3165	2	1103	\N	2018-05-25 09:29:31.015704	2018-05-25 09:29:31.015704
3166	4	1103	\N	2018-05-25 09:29:31.017725	2018-05-25 09:29:31.017725
3167	2	1104	\N	2018-05-25 09:29:31.02207	2018-05-25 09:29:31.02207
3168	4	1104	\N	2018-05-25 09:29:31.024128	2018-05-25 09:29:31.024128
3169	2	1105	\N	2018-05-25 09:29:31.030721	2018-05-25 09:29:31.030721
3170	4	1105	\N	2018-05-25 09:29:31.032787	2018-05-25 09:29:31.032787
3171	2	1106	\N	2018-05-25 09:29:31.037596	2018-05-25 09:29:31.037596
3172	4	1106	\N	2018-05-25 09:29:31.041397	2018-05-25 09:29:31.041397
3173	2	1107	\N	2018-05-25 09:29:31.049584	2018-05-25 09:29:31.049584
3174	4	1107	\N	2018-05-25 09:29:31.053325	2018-05-25 09:29:31.053325
3175	2	1108	\N	2018-05-25 09:29:31.058795	2018-05-25 09:29:31.058795
3176	4	1108	\N	2018-05-25 09:29:31.061769	2018-05-25 09:29:31.061769
3177	2	1109	\N	2018-05-25 09:29:31.06891	2018-05-25 09:29:31.06891
3178	4	1109	\N	2018-05-25 09:29:31.071034	2018-05-25 09:29:31.071034
3179	2	1110	\N	2018-05-25 09:29:31.076439	2018-05-25 09:29:31.076439
3180	4	1110	\N	2018-05-25 09:29:31.079401	2018-05-25 09:29:31.079401
3181	2	1111	\N	2018-05-25 09:29:31.084387	2018-05-25 09:29:31.084387
3182	4	1111	\N	2018-05-25 09:29:31.086493	2018-05-25 09:29:31.086493
3183	2	1112	\N	2018-05-25 09:29:31.091573	2018-05-25 09:29:31.091573
3184	4	1112	\N	2018-05-25 09:29:31.094577	2018-05-25 09:29:31.094577
3185	2	1113	\N	2018-05-25 09:29:31.099095	2018-05-25 09:29:31.099095
3186	4	1113	\N	2018-05-25 09:29:31.103108	2018-05-25 09:29:31.103108
3187	2	1114	\N	2018-05-25 09:29:31.108763	2018-05-25 09:29:31.108763
3188	4	1114	\N	2018-05-25 09:29:31.111286	2018-05-25 09:29:31.111286
3189	2	1115	\N	2018-05-25 09:29:31.115912	2018-05-25 09:29:31.115912
3190	4	1115	\N	2018-05-25 09:29:31.117847	2018-05-25 09:29:31.117847
3191	2	1116	\N	2018-05-25 09:29:31.122238	2018-05-25 09:29:31.122238
3192	4	1116	\N	2018-05-25 09:29:31.124217	2018-05-25 09:29:31.124217
3193	2	1117	\N	2018-05-25 09:29:31.131382	2018-05-25 09:29:31.131382
3194	4	1117	\N	2018-05-25 09:29:31.133473	2018-05-25 09:29:31.133473
3195	2	1118	\N	2018-05-25 09:29:31.137606	2018-05-25 09:29:31.137606
3196	4	1118	\N	2018-05-25 09:29:31.139496	2018-05-25 09:29:31.139496
3197	2	1119	\N	2018-05-25 09:29:31.14425	2018-05-25 09:29:31.14425
3198	4	1119	\N	2018-05-25 09:29:31.146336	2018-05-25 09:29:31.146336
3199	2	1120	\N	2018-05-25 09:29:31.150937	2018-05-25 09:29:31.150937
3200	4	1120	\N	2018-05-25 09:29:31.153305	2018-05-25 09:29:31.153305
3201	2	1121	\N	2018-05-25 09:29:31.158331	2018-05-25 09:29:31.158331
3202	4	1121	\N	2018-05-25 09:29:31.160487	2018-05-25 09:29:31.160487
3203	2	1122	\N	2018-05-25 09:29:31.165087	2018-05-25 09:29:31.165087
3204	4	1122	\N	2018-05-25 09:29:31.167318	2018-05-25 09:29:31.167318
3205	2	1123	\N	2018-05-25 09:29:31.172119	2018-05-25 09:29:31.172119
3206	4	1123	\N	2018-05-25 09:29:31.175105	2018-05-25 09:29:31.175105
3207	2	1124	\N	2018-05-25 09:29:31.179466	2018-05-25 09:29:31.179466
3208	4	1124	\N	2018-05-25 09:29:31.181392	2018-05-25 09:29:31.181392
3209	2	1125	\N	2018-05-25 09:29:31.185521	2018-05-25 09:29:31.185521
3210	4	1125	\N	2018-05-25 09:29:31.187432	2018-05-25 09:29:31.187432
3211	2	1126	\N	2018-05-25 09:29:31.191579	2018-05-25 09:29:31.191579
3212	4	1126	\N	2018-05-25 09:29:31.193637	2018-05-25 09:29:31.193637
3213	2	1127	\N	2018-05-25 09:29:31.197988	2018-05-25 09:29:31.197988
3214	4	1127	\N	2018-05-25 09:29:31.199758	2018-05-25 09:29:31.199758
3215	2	1128	\N	2018-05-25 09:29:31.20413	2018-05-25 09:29:31.20413
3216	4	1128	\N	2018-05-25 09:29:31.205999	2018-05-25 09:29:31.205999
3217	2	1129	\N	2018-05-25 09:29:31.211453	2018-05-25 09:29:31.211453
3218	4	1129	\N	2018-05-25 09:29:31.213215	2018-05-25 09:29:31.213215
3219	2	1130	\N	2018-05-25 09:29:31.217069	2018-05-25 09:29:31.217069
3220	4	1130	\N	2018-05-25 09:29:31.218812	2018-05-25 09:29:31.218812
3221	2	1131	\N	2018-05-25 09:29:31.223157	2018-05-25 09:29:31.223157
3222	4	1131	\N	2018-05-25 09:29:31.225457	2018-05-25 09:29:31.225457
3223	2	1132	\N	2018-05-25 09:29:31.230134	2018-05-25 09:29:31.230134
3224	4	1132	\N	2018-05-25 09:29:31.232148	2018-05-25 09:29:31.232148
3225	2	1133	\N	2018-05-25 09:29:31.2363	2018-05-25 09:29:31.2363
3226	4	1133	\N	2018-05-25 09:29:31.238265	2018-05-25 09:29:31.238265
3227	2	1134	\N	2018-05-25 09:29:31.243134	2018-05-25 09:29:31.243134
3228	4	1134	\N	2018-05-25 09:29:31.245262	2018-05-25 09:29:31.245262
3229	2	1135	\N	2018-05-25 09:29:31.249733	2018-05-25 09:29:31.249733
3230	4	1135	\N	2018-05-25 09:29:31.251726	2018-05-25 09:29:31.251726
3231	2	1136	\N	2018-05-25 09:29:31.255851	2018-05-25 09:29:31.255851
3232	4	1136	\N	2018-05-25 09:29:31.258009	2018-05-25 09:29:31.258009
3233	2	1137	\N	2018-05-25 09:29:31.262662	2018-05-25 09:29:31.262662
3234	4	1137	\N	2018-05-25 09:29:31.264859	2018-05-25 09:29:31.264859
3235	2	1138	\N	2018-05-25 09:29:31.269259	2018-05-25 09:29:31.269259
3236	4	1138	\N	2018-05-25 09:29:31.271103	2018-05-25 09:29:31.271103
3237	2	1139	\N	2018-05-25 09:29:31.275452	2018-05-25 09:29:31.275452
3238	4	1139	\N	2018-05-25 09:29:31.277586	2018-05-25 09:29:31.277586
3239	2	1140	\N	2018-05-25 09:29:31.282248	2018-05-25 09:29:31.282248
3240	4	1140	\N	2018-05-25 09:29:31.284039	2018-05-25 09:29:31.284039
3241	2	1141	\N	2018-05-25 09:29:31.289153	2018-05-25 09:29:31.289153
3242	4	1141	\N	2018-05-25 09:29:31.291424	2018-05-25 09:29:31.291424
3243	2	1142	\N	2018-05-25 09:29:31.295951	2018-05-25 09:29:31.295951
3244	4	1142	\N	2018-05-25 09:29:31.298032	2018-05-25 09:29:31.298032
3245	2	1143	\N	2018-05-25 09:29:31.302298	2018-05-25 09:29:31.302298
3246	4	1143	\N	2018-05-25 09:29:31.304166	2018-05-25 09:29:31.304166
3247	2	1144	\N	2018-05-25 09:29:31.308471	2018-05-25 09:29:31.308471
3248	4	1144	\N	2018-05-25 09:29:31.310465	2018-05-25 09:29:31.310465
3249	2	1145	\N	2018-05-25 09:29:31.315046	2018-05-25 09:29:31.315046
3250	4	1145	\N	2018-05-25 09:29:31.316975	2018-05-25 09:29:31.316975
3251	2	1146	\N	2018-05-25 09:29:31.321153	2018-05-25 09:29:31.321153
3252	4	1146	\N	2018-05-25 09:29:31.323297	2018-05-25 09:29:31.323297
3253	2	1147	\N	2018-05-25 09:29:31.328543	2018-05-25 09:29:31.328543
3254	4	1147	\N	2018-05-25 09:29:31.330762	2018-05-25 09:29:31.330762
3255	2	1148	\N	2018-05-25 09:29:31.335136	2018-05-25 09:29:31.335136
3256	4	1148	\N	2018-05-25 09:29:31.336994	2018-05-25 09:29:31.336994
3257	2	1149	\N	2018-05-25 09:29:31.340971	2018-05-25 09:29:31.340971
3258	4	1149	\N	2018-05-25 09:29:31.343238	2018-05-25 09:29:31.343238
3259	2	1150	\N	2018-05-25 09:29:31.347612	2018-05-25 09:29:31.347612
3260	4	1150	\N	2018-05-25 09:29:31.349473	2018-05-25 09:29:31.349473
3261	2	1151	\N	2018-05-25 09:29:31.353822	2018-05-25 09:29:31.353822
3262	4	1151	\N	2018-05-25 09:29:31.355888	2018-05-25 09:29:31.355888
3263	2	1152	\N	2018-05-25 09:29:31.360592	2018-05-25 09:29:31.360592
3264	4	1152	\N	2018-05-25 09:29:31.362579	2018-05-25 09:29:31.362579
3265	2	1153	\N	2018-05-25 09:29:31.367247	2018-05-25 09:29:31.367247
3266	4	1153	\N	2018-05-25 09:29:31.369278	2018-05-25 09:29:31.369278
3267	2	1154	\N	2018-05-25 09:29:31.373899	2018-05-25 09:29:31.373899
3268	4	1154	\N	2018-05-25 09:29:31.376181	2018-05-25 09:29:31.376181
3269	2	1155	\N	2018-05-25 09:29:31.382904	2018-05-25 09:29:31.382904
3270	4	1155	\N	2018-05-25 09:29:31.386202	2018-05-25 09:29:31.386202
3271	2	1156	\N	2018-05-25 09:29:31.393192	2018-05-25 09:29:31.393192
3272	4	1156	\N	2018-05-25 09:29:31.397385	2018-05-25 09:29:31.397385
3273	2	1157	\N	2018-05-25 09:29:31.402833	2018-05-25 09:29:31.402833
3274	4	1157	\N	2018-05-25 09:29:31.406424	2018-05-25 09:29:31.406424
3275	2	1158	\N	2018-05-25 09:29:31.412917	2018-05-25 09:29:31.412917
3276	4	1158	\N	2018-05-25 09:29:31.416125	2018-05-25 09:29:31.416125
3277	2	1159	\N	2018-05-25 09:29:31.422928	2018-05-25 09:29:31.422928
3278	4	1159	\N	2018-05-25 09:29:31.425764	2018-05-25 09:29:31.425764
3279	2	1160	\N	2018-05-25 09:29:31.432505	2018-05-25 09:29:31.432505
3280	4	1160	\N	2018-05-25 09:29:31.434887	2018-05-25 09:29:31.434887
3281	2	1161	\N	2018-05-25 09:29:31.442427	2018-05-25 09:29:31.442427
3282	4	1161	\N	2018-05-25 09:29:31.444896	2018-05-25 09:29:31.444896
3283	2	1162	\N	2018-05-25 09:29:31.450789	2018-05-25 09:29:31.450789
3284	4	1162	\N	2018-05-25 09:29:31.453358	2018-05-25 09:29:31.453358
3285	2	1163	\N	2018-05-25 09:29:31.4596	2018-05-25 09:29:31.4596
3286	4	1163	\N	2018-05-25 09:29:31.464065	2018-05-25 09:29:31.464065
3287	2	1164	\N	2018-05-25 09:29:31.471227	2018-05-25 09:29:31.471227
3288	4	1164	\N	2018-05-25 09:29:31.474619	2018-05-25 09:29:31.474619
3289	2	1165	\N	2018-05-25 09:29:31.481986	2018-05-25 09:29:31.481986
3290	4	1165	\N	2018-05-25 09:29:31.484765	2018-05-25 09:29:31.484765
3291	2	1166	\N	2018-05-25 09:29:31.491726	2018-05-25 09:29:31.491726
3292	4	1166	\N	2018-05-25 09:29:31.494425	2018-05-25 09:29:31.494425
3293	2	1167	\N	2018-05-25 09:29:31.500621	2018-05-25 09:29:31.500621
3294	4	1167	\N	2018-05-25 09:29:31.504788	2018-05-25 09:29:31.504788
3295	2	1168	\N	2018-05-25 09:29:31.512111	2018-05-25 09:29:31.512111
3296	4	1168	\N	2018-05-25 09:29:31.514364	2018-05-25 09:29:31.514364
3297	2	1169	\N	2018-05-25 09:29:31.521198	2018-05-25 09:29:31.521198
3298	4	1169	\N	2018-05-25 09:29:31.524799	2018-05-25 09:29:31.524799
3299	2	1170	\N	2018-05-25 09:29:31.531858	2018-05-25 09:29:31.531858
3300	4	1170	\N	2018-05-25 09:29:31.534084	2018-05-25 09:29:31.534084
3301	2	1171	\N	2018-05-25 09:29:31.54346	2018-05-25 09:29:31.54346
3302	4	1171	\N	2018-05-25 09:29:31.546523	2018-05-25 09:29:31.546523
3303	2	1172	\N	2018-05-25 09:29:31.552915	2018-05-25 09:29:31.552915
3304	4	1172	\N	2018-05-25 09:29:31.556673	2018-05-25 09:29:31.556673
3305	2	1173	\N	2018-05-25 09:29:31.564102	2018-05-25 09:29:31.564102
3306	4	1173	\N	2018-05-25 09:29:31.566636	2018-05-25 09:29:31.566636
3307	2	1174	\N	2018-05-25 09:29:31.574988	2018-05-25 09:29:31.574988
3308	4	1174	\N	2018-05-25 09:29:31.578301	2018-05-25 09:29:31.578301
3309	2	1175	\N	2018-05-25 09:29:31.584515	2018-05-25 09:29:31.584515
3310	4	1175	\N	2018-05-25 09:29:31.587154	2018-05-25 09:29:31.587154
3311	2	1176	\N	2018-05-25 09:29:31.595335	2018-05-25 09:29:31.595335
3312	4	1176	\N	2018-05-25 09:29:31.598522	2018-05-25 09:29:31.598522
3313	2	1177	\N	2018-05-25 09:29:31.612811	2018-05-25 09:29:31.612811
3314	4	1177	\N	2018-05-25 09:29:31.618235	2018-05-25 09:29:31.618235
3315	2	1178	\N	2018-05-25 09:29:31.625876	2018-05-25 09:29:31.625876
3316	4	1178	\N	2018-05-25 09:29:31.629869	2018-05-25 09:29:31.629869
3317	2	1179	\N	2018-05-25 09:29:31.637378	2018-05-25 09:29:31.637378
3318	4	1179	\N	2018-05-25 09:29:31.63992	2018-05-25 09:29:31.63992
3319	2	1180	\N	2018-05-25 09:29:31.648996	2018-05-25 09:29:31.648996
3320	4	1180	\N	2018-05-25 09:29:31.652025	2018-05-25 09:29:31.652025
3321	2	1181	\N	2018-05-25 09:29:31.657921	2018-05-25 09:29:31.657921
3322	4	1181	\N	2018-05-25 09:29:31.663705	2018-05-25 09:29:31.663705
3323	2	1182	\N	2018-05-25 09:29:31.672072	2018-05-25 09:29:31.672072
3324	4	1182	\N	2018-05-25 09:29:31.67622	2018-05-25 09:29:31.67622
3325	2	1183	\N	2018-05-25 09:29:31.686834	2018-05-25 09:29:31.686834
3326	4	1183	\N	2018-05-25 09:29:31.689491	2018-05-25 09:29:31.689491
3327	2	1184	\N	2018-05-25 09:29:31.696627	2018-05-25 09:29:31.696627
3328	4	1184	\N	2018-05-25 09:29:31.700361	2018-05-25 09:29:31.700361
3329	2	1185	\N	2018-05-25 09:29:31.709293	2018-05-25 09:29:31.709293
3330	4	1185	\N	2018-05-25 09:29:31.716056	2018-05-25 09:29:31.716056
3331	2	1186	\N	2018-05-25 09:29:31.725738	2018-05-25 09:29:31.725738
3332	4	1186	\N	2018-05-25 09:29:31.72971	2018-05-25 09:29:31.72971
3333	2	1187	\N	2018-05-25 09:29:31.736757	2018-05-25 09:29:31.736757
3334	4	1187	\N	2018-05-25 09:29:31.739015	2018-05-25 09:29:31.739015
3335	2	1188	\N	2018-05-25 09:29:31.748293	2018-05-25 09:29:31.748293
3336	4	1188	\N	2018-05-25 09:29:31.750962	2018-05-25 09:29:31.750962
3337	2	1189	\N	2018-05-25 09:29:31.764287	2018-05-25 09:29:31.764287
3338	4	1189	\N	2018-05-25 09:29:31.766596	2018-05-25 09:29:31.766596
3339	2	1190	\N	2018-05-25 09:29:31.771761	2018-05-25 09:29:31.771761
3340	4	1190	\N	2018-05-25 09:29:31.780746	2018-05-25 09:29:31.780746
3341	2	1191	\N	2018-05-25 09:29:31.794813	2018-05-25 09:29:31.794813
3342	4	1191	\N	2018-05-25 09:29:31.799797	2018-05-25 09:29:31.799797
3343	2	1192	\N	2018-05-25 09:29:31.812739	2018-05-25 09:29:31.812739
3344	4	1192	\N	2018-05-25 09:29:31.816009	2018-05-25 09:29:31.816009
3345	2	1193	\N	2018-05-25 09:29:31.820856	2018-05-25 09:29:31.820856
3346	4	1193	\N	2018-05-25 09:29:31.824369	2018-05-25 09:29:31.824369
3347	2	1194	\N	2018-05-25 09:29:31.834622	2018-05-25 09:29:31.834622
3348	4	1194	\N	2018-05-25 09:29:31.836915	2018-05-25 09:29:31.836915
3349	2	1195	\N	2018-05-25 09:29:31.844603	2018-05-25 09:29:31.844603
3350	4	1195	\N	2018-05-25 09:29:31.848762	2018-05-25 09:29:31.848762
3351	2	1196	\N	2018-05-25 09:29:31.85574	2018-05-25 09:29:31.85574
3352	4	1196	\N	2018-05-25 09:29:31.861445	2018-05-25 09:29:31.861445
3353	2	1197	\N	2018-05-25 09:29:31.873406	2018-05-25 09:29:31.873406
3354	4	1197	\N	2018-05-25 09:29:31.876306	2018-05-25 09:29:31.876306
3355	2	1198	\N	2018-05-25 09:29:31.887082	2018-05-25 09:29:31.887082
3356	4	1198	\N	2018-05-25 09:29:31.889901	2018-05-25 09:29:31.889901
3357	2	1199	\N	2018-05-25 09:29:31.899404	2018-05-25 09:29:31.899404
3358	4	1199	\N	2018-05-25 09:29:31.90169	2018-05-25 09:29:31.90169
3359	2	1200	\N	2018-05-25 09:29:31.912359	2018-05-25 09:29:31.912359
3360	4	1200	\N	2018-05-25 09:29:31.918148	2018-05-25 09:29:31.918148
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.products (id, category_id, name, description, hidden, deleted_at, created_at, updated_at) FROM stdin;
1	2	Chloe	blep	f	\N	2018-05-25 09:29:20.914974	2018-05-25 09:29:20.914974
2	2	Sugar	11/10	f	\N	2018-05-25 09:29:20.949253	2018-05-25 09:29:20.949253
3	2	Sandy	11/10	f	\N	2018-05-25 09:29:20.957428	2018-05-25 09:29:20.957428
4	2	Missy	smol pupperino	f	\N	2018-05-25 09:29:20.965235	2018-05-25 09:29:20.965235
5	2	Blue	boop the snoot	f	\N	2018-05-25 09:29:20.973165	2018-05-25 09:29:20.973165
6	2	Gracie	they're good dogs Brent	f	\N	2018-05-25 09:29:20.980968	2018-05-25 09:29:20.980968
7	2	Sasha	thicc doggo	f	\N	2018-05-25 09:29:20.988816	2018-05-25 09:29:20.988816
8	2	Lilly	they're good dogs Brent	f	\N	2018-05-25 09:29:20.996701	2018-05-25 09:29:20.996701
9	2	Molly	long boi	f	\N	2018-05-25 09:29:21.005371	2018-05-25 09:29:21.005371
10	2	Snoopy	they're good dogs Brent	f	\N	2018-05-25 09:29:21.013172	2018-05-25 09:29:21.013172
11	2	Annie	they're good dogs Brent	f	\N	2018-05-25 09:29:21.020751	2018-05-25 09:29:21.020751
12	2	Rascal	zoom	f	\N	2018-05-25 09:29:21.028716	2018-05-25 09:29:21.028716
13	2	Mia	blep	f	\N	2018-05-25 09:29:21.036399	2018-05-25 09:29:21.036399
14	2	Rascal	blep	f	\N	2018-05-25 09:29:21.044551	2018-05-25 09:29:21.044551
15	2	Chico	zoom	f	\N	2018-05-25 09:29:21.052128	2018-05-25 09:29:21.052128
16	2	Misty	heck no pal	f	\N	2018-05-25 09:29:21.059439	2018-05-25 09:29:21.059439
17	2	Lilly	smol pupperino	f	\N	2018-05-25 09:29:21.068489	2018-05-25 09:29:21.068489
18	2	Daisy	boop the snoot	f	\N	2018-05-25 09:29:21.076783	2018-05-25 09:29:21.076783
19	2	Spike	boop the snoot	f	\N	2018-05-25 09:29:21.084559	2018-05-25 09:29:21.084559
20	2	Bandit	thicc doggo	f	\N	2018-05-25 09:29:21.093422	2018-05-25 09:29:21.093422
21	2	Zeus	11/10	f	\N	2018-05-25 09:29:21.103268	2018-05-25 09:29:21.103268
22	2	Gracie	11/10	f	\N	2018-05-25 09:29:21.112514	2018-05-25 09:29:21.112514
23	2	Gracie	boop the snoot	f	\N	2018-05-25 09:29:21.120715	2018-05-25 09:29:21.120715
24	2	Ruby	mlem	f	\N	2018-05-25 09:29:21.130297	2018-05-25 09:29:21.130297
25	2	Rosie	blep	f	\N	2018-05-25 09:29:21.139752	2018-05-25 09:29:21.139752
26	2	Bo	big ol' pupper	f	\N	2018-05-25 09:29:21.148305	2018-05-25 09:29:21.148305
27	2	Lady	blep	f	\N	2018-05-25 09:29:21.156017	2018-05-25 09:29:21.156017
28	2	Precious	long boi	f	\N	2018-05-25 09:29:21.164112	2018-05-25 09:29:21.164112
29	2	Harvey	smol pupperino	f	\N	2018-05-25 09:29:21.171362	2018-05-25 09:29:21.171362
30	2	Chico	11/10	f	\N	2018-05-25 09:29:21.179445	2018-05-25 09:29:21.179445
31	2	Rocky	heck no pal	f	\N	2018-05-25 09:29:21.188059	2018-05-25 09:29:21.188059
32	2	Roxie	heck no pal	f	\N	2018-05-25 09:29:21.196214	2018-05-25 09:29:21.196214
33	2	Lexi	thicc doggo	f	\N	2018-05-25 09:29:21.206884	2018-05-25 09:29:21.206884
34	2	Penny	heck no pal	f	\N	2018-05-25 09:29:21.215284	2018-05-25 09:29:21.215284
35	2	Sassy	long boi	f	\N	2018-05-25 09:29:21.223293	2018-05-25 09:29:21.223293
36	2	Bubba	boop the snoot	f	\N	2018-05-25 09:29:21.23149	2018-05-25 09:29:21.23149
37	2	Ruby	thicc doggo	f	\N	2018-05-25 09:29:21.239135	2018-05-25 09:29:21.239135
38	2	Lilly	they're good dogs Brent	f	\N	2018-05-25 09:29:21.246581	2018-05-25 09:29:21.246581
39	2	Rex	blep	f	\N	2018-05-25 09:29:21.254448	2018-05-25 09:29:21.254448
40	2	Chico	they're good dogs Brent	f	\N	2018-05-25 09:29:21.2625	2018-05-25 09:29:21.2625
41	2	Zeus	mlem	f	\N	2018-05-25 09:29:21.271082	2018-05-25 09:29:21.271082
42	2	Casey	big ol' pupper	f	\N	2018-05-25 09:29:21.280643	2018-05-25 09:29:21.280643
43	2	Brutus	heck no pal	f	\N	2018-05-25 09:29:21.291181	2018-05-25 09:29:21.291181
44	2	Teddy	they're good dogs Brent	f	\N	2018-05-25 09:29:21.300889	2018-05-25 09:29:21.300889
45	2	Lady	11/10	f	\N	2018-05-25 09:29:21.310823	2018-05-25 09:29:21.310823
46	2	Max	blep	f	\N	2018-05-25 09:29:21.320919	2018-05-25 09:29:21.320919
47	2	Honey	thicc doggo	f	\N	2018-05-25 09:29:21.330861	2018-05-25 09:29:21.330861
48	2	Luna	they're good dogs Brent	f	\N	2018-05-25 09:29:21.341122	2018-05-25 09:29:21.341122
49	3	Peanut	smol pupperino	f	\N	2018-05-25 09:29:21.352731	2018-05-25 09:29:21.352731
50	3	Murphy	thicc doggo	f	\N	2018-05-25 09:29:21.36195	2018-05-25 09:29:21.36195
51	3	Penny	long boi	f	\N	2018-05-25 09:29:21.370041	2018-05-25 09:29:21.370041
52	3	Bear	blep	f	\N	2018-05-25 09:29:21.378406	2018-05-25 09:29:21.378406
53	3	Belle	smol pupperino	f	\N	2018-05-25 09:29:21.386029	2018-05-25 09:29:21.386029
54	3	Sugar	blep	f	\N	2018-05-25 09:29:21.393533	2018-05-25 09:29:21.393533
55	3	Mia	mlem	f	\N	2018-05-25 09:29:21.401458	2018-05-25 09:29:21.401458
56	3	Jasper	long boi	f	\N	2018-05-25 09:29:21.409425	2018-05-25 09:29:21.409425
57	3	Chloe	zoom	f	\N	2018-05-25 09:29:21.417982	2018-05-25 09:29:21.417982
58	3	Rosie	boop the snoot	f	\N	2018-05-25 09:29:21.427369	2018-05-25 09:29:21.427369
59	3	Ginger	mlem	f	\N	2018-05-25 09:29:21.435503	2018-05-25 09:29:21.435503
60	3	Lucky	thicc doggo	f	\N	2018-05-25 09:29:21.443655	2018-05-25 09:29:21.443655
61	3	Gizmo	blep	f	\N	2018-05-25 09:29:21.45138	2018-05-25 09:29:21.45138
62	3	Bubba	thicc doggo	f	\N	2018-05-25 09:29:21.459074	2018-05-25 09:29:21.459074
63	3	Baxter	blep	f	\N	2018-05-25 09:29:21.467251	2018-05-25 09:29:21.467251
64	3	Charlie	mlem	f	\N	2018-05-25 09:29:21.474845	2018-05-25 09:29:21.474845
65	3	Rocky	zoom	f	\N	2018-05-25 09:29:21.483864	2018-05-25 09:29:21.483864
66	3	Max	zoom	f	\N	2018-05-25 09:29:21.494297	2018-05-25 09:29:21.494297
67	3	Jake	zoom	f	\N	2018-05-25 09:29:21.503508	2018-05-25 09:29:21.503508
68	3	Sasha	they're good dogs Brent	f	\N	2018-05-25 09:29:21.511729	2018-05-25 09:29:21.511729
69	3	Pepper	mlem	f	\N	2018-05-25 09:29:21.519727	2018-05-25 09:29:21.519727
70	3	Baxter	big ol' pupper	f	\N	2018-05-25 09:29:21.528212	2018-05-25 09:29:21.528212
71	3	Riley	smol pupperino	f	\N	2018-05-25 09:29:21.536116	2018-05-25 09:29:21.536116
72	3	Sugar	long boi	f	\N	2018-05-25 09:29:21.544224	2018-05-25 09:29:21.544224
73	3	Bandit	big ol' pupper	f	\N	2018-05-25 09:29:21.55274	2018-05-25 09:29:21.55274
74	3	Baby	zoom	f	\N	2018-05-25 09:29:21.560855	2018-05-25 09:29:21.560855
75	3	Chico	big ol' pupper	f	\N	2018-05-25 09:29:21.569059	2018-05-25 09:29:21.569059
76	3	Bella	long boi	f	\N	2018-05-25 09:29:21.576962	2018-05-25 09:29:21.576962
77	3	Tucker	boop the snoot	f	\N	2018-05-25 09:29:21.584899	2018-05-25 09:29:21.584899
78	3	Sammy	heck no pal	f	\N	2018-05-25 09:29:21.59283	2018-05-25 09:29:21.59283
79	3	Jake	big ol' pupper	f	\N	2018-05-25 09:29:21.601376	2018-05-25 09:29:21.601376
80	3	Sadie	blep	f	\N	2018-05-25 09:29:21.611549	2018-05-25 09:29:21.611549
81	3	Oscar	11/10	f	\N	2018-05-25 09:29:21.619504	2018-05-25 09:29:21.619504
82	3	Dixie	long boi	f	\N	2018-05-25 09:29:21.628977	2018-05-25 09:29:21.628977
83	3	Mia	smol pupperino	f	\N	2018-05-25 09:29:21.63691	2018-05-25 09:29:21.63691
84	3	Peanut	mlem	f	\N	2018-05-25 09:29:21.6475	2018-05-25 09:29:21.6475
85	3	Chico	big ol' pupper	f	\N	2018-05-25 09:29:21.65539	2018-05-25 09:29:21.65539
86	3	Lucky	zoom	f	\N	2018-05-25 09:29:21.667028	2018-05-25 09:29:21.667028
87	3	Honey	thicc doggo	f	\N	2018-05-25 09:29:21.678028	2018-05-25 09:29:21.678028
88	3	Belle	thicc doggo	f	\N	2018-05-25 09:29:21.691381	2018-05-25 09:29:21.691381
89	3	Jack	11/10	f	\N	2018-05-25 09:29:21.706686	2018-05-25 09:29:21.706686
90	3	Bruno	thicc doggo	f	\N	2018-05-25 09:29:21.717823	2018-05-25 09:29:21.717823
91	3	Ginger	thicc doggo	f	\N	2018-05-25 09:29:21.727485	2018-05-25 09:29:21.727485
92	3	Sassy	11/10	f	\N	2018-05-25 09:29:21.736644	2018-05-25 09:29:21.736644
93	3	Milo	heck no pal	f	\N	2018-05-25 09:29:21.745419	2018-05-25 09:29:21.745419
94	3	Abby	heck no pal	f	\N	2018-05-25 09:29:21.753775	2018-05-25 09:29:21.753775
95	3	Roxie	mlem	f	\N	2018-05-25 09:29:21.761984	2018-05-25 09:29:21.761984
96	3	Duke	thicc doggo	f	\N	2018-05-25 09:29:21.774778	2018-05-25 09:29:21.774778
97	4	Bubba	11/10	f	\N	2018-05-25 09:29:21.787913	2018-05-25 09:29:21.787913
98	4	Sophie	heck no pal	f	\N	2018-05-25 09:29:21.798066	2018-05-25 09:29:21.798066
99	4	Molly	thicc doggo	f	\N	2018-05-25 09:29:21.808892	2018-05-25 09:29:21.808892
100	4	Molly	long boi	f	\N	2018-05-25 09:29:21.81921	2018-05-25 09:29:21.81921
101	4	Sadie	smol pupperino	f	\N	2018-05-25 09:29:21.829206	2018-05-25 09:29:21.829206
102	4	Murphy	mlem	f	\N	2018-05-25 09:29:21.837545	2018-05-25 09:29:21.837545
103	4	Oreo	boop the snoot	f	\N	2018-05-25 09:29:21.846211	2018-05-25 09:29:21.846211
104	4	Baby	thicc doggo	f	\N	2018-05-25 09:29:21.854423	2018-05-25 09:29:21.854423
105	4	Zoey	smol pupperino	f	\N	2018-05-25 09:29:21.86384	2018-05-25 09:29:21.86384
106	4	Jasmine	smol pupperino	f	\N	2018-05-25 09:29:21.872054	2018-05-25 09:29:21.872054
107	4	Zeus	smol pupperino	f	\N	2018-05-25 09:29:21.880863	2018-05-25 09:29:21.880863
108	4	Bailey	smol pupperino	f	\N	2018-05-25 09:29:21.88876	2018-05-25 09:29:21.88876
109	4	Max	they're good dogs Brent	f	\N	2018-05-25 09:29:21.897319	2018-05-25 09:29:21.897319
110	4	Honey	big ol' pupper	f	\N	2018-05-25 09:29:21.904849	2018-05-25 09:29:21.904849
111	4	Spike	long boi	f	\N	2018-05-25 09:29:21.913081	2018-05-25 09:29:21.913081
112	4	Sparky	zoom	f	\N	2018-05-25 09:29:21.920776	2018-05-25 09:29:21.920776
113	4	Roxy	long boi	f	\N	2018-05-25 09:29:21.930617	2018-05-25 09:29:21.930617
114	4	Precious	11/10	f	\N	2018-05-25 09:29:21.938461	2018-05-25 09:29:21.938461
115	4	Oreo	thicc doggo	f	\N	2018-05-25 09:29:21.946596	2018-05-25 09:29:21.946596
116	4	Coco	they're good dogs Brent	f	\N	2018-05-25 09:29:21.954292	2018-05-25 09:29:21.954292
117	4	Bailey	11/10	f	\N	2018-05-25 09:29:21.962542	2018-05-25 09:29:21.962542
118	4	Chloe	smol pupperino	f	\N	2018-05-25 09:29:21.970275	2018-05-25 09:29:21.970275
119	4	Tyson	blep	f	\N	2018-05-25 09:29:21.978805	2018-05-25 09:29:21.978805
120	4	Peanut	zoom	f	\N	2018-05-25 09:29:21.986562	2018-05-25 09:29:21.986562
121	4	Lilly	they're good dogs Brent	f	\N	2018-05-25 09:29:21.995305	2018-05-25 09:29:21.995305
122	4	Chance	they're good dogs Brent	f	\N	2018-05-25 09:29:22.004521	2018-05-25 09:29:22.004521
123	4	Sam	heck no pal	f	\N	2018-05-25 09:29:22.014009	2018-05-25 09:29:22.014009
124	4	Lilly	mlem	f	\N	2018-05-25 09:29:22.023201	2018-05-25 09:29:22.023201
125	4	Jake	thicc doggo	f	\N	2018-05-25 09:29:22.032163	2018-05-25 09:29:22.032163
126	4	Angel	thicc doggo	f	\N	2018-05-25 09:29:22.040477	2018-05-25 09:29:22.040477
127	4	Tank	smol pupperino	f	\N	2018-05-25 09:29:22.049496	2018-05-25 09:29:22.049496
128	4	Cookie	heck no pal	f	\N	2018-05-25 09:29:22.058652	2018-05-25 09:29:22.058652
129	4	Cocoa	thicc doggo	f	\N	2018-05-25 09:29:22.067768	2018-05-25 09:29:22.067768
130	4	Chloe	blep	f	\N	2018-05-25 09:29:22.07656	2018-05-25 09:29:22.07656
131	4	Baxter	long boi	f	\N	2018-05-25 09:29:22.08484	2018-05-25 09:29:22.08484
132	4	Shadow	blep	f	\N	2018-05-25 09:29:22.093131	2018-05-25 09:29:22.093131
133	4	Sparky	long boi	f	\N	2018-05-25 09:29:22.103227	2018-05-25 09:29:22.103227
134	4	Ginger	11/10	f	\N	2018-05-25 09:29:22.113281	2018-05-25 09:29:22.113281
135	4	Scooter	smol pupperino	f	\N	2018-05-25 09:29:22.122117	2018-05-25 09:29:22.122117
136	4	Snickers	big ol' pupper	f	\N	2018-05-25 09:29:22.132011	2018-05-25 09:29:22.132011
137	4	Bandit	heck no pal	f	\N	2018-05-25 09:29:22.141113	2018-05-25 09:29:22.141113
138	4	Lucky	smol pupperino	f	\N	2018-05-25 09:29:22.149807	2018-05-25 09:29:22.149807
139	4	Maggie	mlem	f	\N	2018-05-25 09:29:22.158103	2018-05-25 09:29:22.158103
140	4	Sadie	boop the snoot	f	\N	2018-05-25 09:29:22.16678	2018-05-25 09:29:22.16678
141	4	Taz	11/10	f	\N	2018-05-25 09:29:22.175371	2018-05-25 09:29:22.175371
142	4	Milo	blep	f	\N	2018-05-25 09:29:22.183715	2018-05-25 09:29:22.183715
143	4	Jake	zoom	f	\N	2018-05-25 09:29:22.191856	2018-05-25 09:29:22.191856
144	4	Sasha	mlem	f	\N	2018-05-25 09:29:22.199543	2018-05-25 09:29:22.199543
145	5	Sasha	long boi	f	\N	2018-05-25 09:29:22.208223	2018-05-25 09:29:22.208223
146	5	Baby	long boi	f	\N	2018-05-25 09:29:22.216983	2018-05-25 09:29:22.216983
147	5	Misty	blep	f	\N	2018-05-25 09:29:22.22699	2018-05-25 09:29:22.22699
148	5	Snoopy	thicc doggo	f	\N	2018-05-25 09:29:22.236947	2018-05-25 09:29:22.236947
149	5	Lily	they're good dogs Brent	f	\N	2018-05-25 09:29:22.251291	2018-05-25 09:29:22.251291
150	5	Lucy	11/10	f	\N	2018-05-25 09:29:22.265299	2018-05-25 09:29:22.265299
151	5	Patches	boop the snoot	f	\N	2018-05-25 09:29:22.274734	2018-05-25 09:29:22.274734
152	5	Harvey	blep	f	\N	2018-05-25 09:29:22.289735	2018-05-25 09:29:22.289735
153	5	Lola	thicc doggo	f	\N	2018-05-25 09:29:22.307801	2018-05-25 09:29:22.307801
154	5	Jake	mlem	f	\N	2018-05-25 09:29:22.321791	2018-05-25 09:29:22.321791
155	5	Shelby	smol pupperino	f	\N	2018-05-25 09:29:22.334571	2018-05-25 09:29:22.334571
156	5	Coco	smol pupperino	f	\N	2018-05-25 09:29:22.349715	2018-05-25 09:29:22.349715
157	5	Sassy	boop the snoot	f	\N	2018-05-25 09:29:22.372617	2018-05-25 09:29:22.372617
158	5	Ginger	zoom	f	\N	2018-05-25 09:29:22.389586	2018-05-25 09:29:22.389586
159	5	Teddy	they're good dogs Brent	f	\N	2018-05-25 09:29:22.404938	2018-05-25 09:29:22.404938
160	5	Maggie	smol pupperino	f	\N	2018-05-25 09:29:22.420632	2018-05-25 09:29:22.420632
161	5	Cody	they're good dogs Brent	f	\N	2018-05-25 09:29:22.444286	2018-05-25 09:29:22.444286
162	5	Bruno	heck no pal	f	\N	2018-05-25 09:29:22.469483	2018-05-25 09:29:22.469483
163	5	Chance	smol pupperino	f	\N	2018-05-25 09:29:22.485681	2018-05-25 09:29:22.485681
164	5	Penny	smol pupperino	f	\N	2018-05-25 09:29:22.501654	2018-05-25 09:29:22.501654
165	5	Diesel	mlem	f	\N	2018-05-25 09:29:22.514536	2018-05-25 09:29:22.514536
166	5	Brutus	they're good dogs Brent	f	\N	2018-05-25 09:29:22.522903	2018-05-25 09:29:22.522903
167	5	Bruno	heck no pal	f	\N	2018-05-25 09:29:22.53523	2018-05-25 09:29:22.53523
168	5	Luna	big ol' pupper	f	\N	2018-05-25 09:29:22.543865	2018-05-25 09:29:22.543865
169	5	Molly	blep	f	\N	2018-05-25 09:29:22.552311	2018-05-25 09:29:22.552311
170	5	Chance	blep	f	\N	2018-05-25 09:29:22.56032	2018-05-25 09:29:22.56032
171	5	Buster	thicc doggo	f	\N	2018-05-25 09:29:22.567433	2018-05-25 09:29:22.567433
172	5	Mia	heck no pal	f	\N	2018-05-25 09:29:22.575773	2018-05-25 09:29:22.575773
173	5	Riley	smol pupperino	f	\N	2018-05-25 09:29:22.586021	2018-05-25 09:29:22.586021
174	5	Rusty	blep	f	\N	2018-05-25 09:29:22.594404	2018-05-25 09:29:22.594404
175	5	Scooter	heck no pal	f	\N	2018-05-25 09:29:22.603663	2018-05-25 09:29:22.603663
176	5	Riley	zoom	f	\N	2018-05-25 09:29:22.611968	2018-05-25 09:29:22.611968
177	5	Chico	thicc doggo	f	\N	2018-05-25 09:29:22.620408	2018-05-25 09:29:22.620408
178	5	Dixie	big ol' pupper	f	\N	2018-05-25 09:29:22.629339	2018-05-25 09:29:22.629339
179	5	Lady	big ol' pupper	f	\N	2018-05-25 09:29:22.637765	2018-05-25 09:29:22.637765
180	5	Gracie	boop the snoot	f	\N	2018-05-25 09:29:22.646102	2018-05-25 09:29:22.646102
181	5	Gracie	smol pupperino	f	\N	2018-05-25 09:29:22.653813	2018-05-25 09:29:22.653813
182	5	Bandit	zoom	f	\N	2018-05-25 09:29:22.661686	2018-05-25 09:29:22.661686
183	5	Roxy	thicc doggo	f	\N	2018-05-25 09:29:22.669766	2018-05-25 09:29:22.669766
184	5	Harley	11/10	f	\N	2018-05-25 09:29:22.677674	2018-05-25 09:29:22.677674
185	5	Dixie	they're good dogs Brent	f	\N	2018-05-25 09:29:22.686166	2018-05-25 09:29:22.686166
186	5	Zeus	smol pupperino	f	\N	2018-05-25 09:29:22.693978	2018-05-25 09:29:22.693978
187	5	Rex	smol pupperino	f	\N	2018-05-25 09:29:22.702176	2018-05-25 09:29:22.702176
188	5	Buster	blep	f	\N	2018-05-25 09:29:22.710374	2018-05-25 09:29:22.710374
189	5	Sadie	thicc doggo	f	\N	2018-05-25 09:29:22.718366	2018-05-25 09:29:22.718366
190	5	Lucy	thicc doggo	f	\N	2018-05-25 09:29:22.726739	2018-05-25 09:29:22.726739
191	5	Jasper	mlem	f	\N	2018-05-25 09:29:22.736079	2018-05-25 09:29:22.736079
192	5	Snickers	zoom	f	\N	2018-05-25 09:29:22.747914	2018-05-25 09:29:22.747914
193	6	Roxy	mlem	f	\N	2018-05-25 09:29:22.761743	2018-05-25 09:29:22.761743
194	6	Baby	heck no pal	f	\N	2018-05-25 09:29:22.772088	2018-05-25 09:29:22.772088
195	6	Taz	big ol' pupper	f	\N	2018-05-25 09:29:22.785158	2018-05-25 09:29:22.785158
196	6	Brutus	11/10	f	\N	2018-05-25 09:29:22.799583	2018-05-25 09:29:22.799583
197	6	Lexi	blep	f	\N	2018-05-25 09:29:22.813514	2018-05-25 09:29:22.813514
198	6	Lucky	zoom	f	\N	2018-05-25 09:29:22.826784	2018-05-25 09:29:22.826784
199	6	Shadow	11/10	f	\N	2018-05-25 09:29:22.844393	2018-05-25 09:29:22.844393
200	6	Tank	thicc doggo	f	\N	2018-05-25 09:29:22.861035	2018-05-25 09:29:22.861035
201	6	Rusty	11/10	f	\N	2018-05-25 09:29:22.878279	2018-05-25 09:29:22.878279
202	6	Gizmo	they're good dogs Brent	f	\N	2018-05-25 09:29:22.897934	2018-05-25 09:29:22.897934
203	6	Milo	mlem	f	\N	2018-05-25 09:29:22.911635	2018-05-25 09:29:22.911635
204	6	Belle	thicc doggo	f	\N	2018-05-25 09:29:22.925733	2018-05-25 09:29:22.925733
205	6	Cooper	mlem	f	\N	2018-05-25 09:29:22.940032	2018-05-25 09:29:22.940032
206	6	Missy	zoom	f	\N	2018-05-25 09:29:22.949819	2018-05-25 09:29:22.949819
207	6	Buddy	heck no pal	f	\N	2018-05-25 09:29:22.959987	2018-05-25 09:29:22.959987
208	6	Cody	mlem	f	\N	2018-05-25 09:29:22.969251	2018-05-25 09:29:22.969251
209	6	Bo	mlem	f	\N	2018-05-25 09:29:22.980963	2018-05-25 09:29:22.980963
210	6	Diesel	11/10	f	\N	2018-05-25 09:29:22.990067	2018-05-25 09:29:22.990067
211	6	Coco	they're good dogs Brent	f	\N	2018-05-25 09:29:22.999487	2018-05-25 09:29:22.999487
212	6	Shelby	heck no pal	f	\N	2018-05-25 09:29:23.008853	2018-05-25 09:29:23.008853
213	6	Ginger	thicc doggo	f	\N	2018-05-25 09:29:23.017551	2018-05-25 09:29:23.017551
214	6	Rascal	they're good dogs Brent	f	\N	2018-05-25 09:29:23.027205	2018-05-25 09:29:23.027205
215	6	Sophie	heck no pal	f	\N	2018-05-25 09:29:23.036198	2018-05-25 09:29:23.036198
216	6	Precious	zoom	f	\N	2018-05-25 09:29:23.044892	2018-05-25 09:29:23.044892
217	6	Zeus	11/10	f	\N	2018-05-25 09:29:23.055395	2018-05-25 09:29:23.055395
218	6	Casey	thicc doggo	f	\N	2018-05-25 09:29:23.064507	2018-05-25 09:29:23.064507
219	6	Peanut	long boi	f	\N	2018-05-25 09:29:23.073213	2018-05-25 09:29:23.073213
220	6	Zoey	zoom	f	\N	2018-05-25 09:29:23.08181	2018-05-25 09:29:23.08181
221	6	Annie	zoom	f	\N	2018-05-25 09:29:23.090446	2018-05-25 09:29:23.090446
222	6	Lucky	zoom	f	\N	2018-05-25 09:29:23.099082	2018-05-25 09:29:23.099082
223	6	Tyson	11/10	f	\N	2018-05-25 09:29:23.11107	2018-05-25 09:29:23.11107
224	6	Zeus	mlem	f	\N	2018-05-25 09:29:23.121421	2018-05-25 09:29:23.121421
225	6	Lady	long boi	f	\N	2018-05-25 09:29:23.131799	2018-05-25 09:29:23.131799
226	6	Bruno	smol pupperino	f	\N	2018-05-25 09:29:23.140943	2018-05-25 09:29:23.140943
227	6	Scooter	heck no pal	f	\N	2018-05-25 09:29:23.149888	2018-05-25 09:29:23.149888
228	6	Casey	smol pupperino	f	\N	2018-05-25 09:29:23.160476	2018-05-25 09:29:23.160476
229	6	Marley	heck no pal	f	\N	2018-05-25 09:29:23.169794	2018-05-25 09:29:23.169794
230	6	Dixie	zoom	f	\N	2018-05-25 09:29:23.178995	2018-05-25 09:29:23.178995
231	6	Daisy	thicc doggo	f	\N	2018-05-25 09:29:23.188318	2018-05-25 09:29:23.188318
232	6	Sophie	heck no pal	f	\N	2018-05-25 09:29:23.198174	2018-05-25 09:29:23.198174
233	6	Bandit	mlem	f	\N	2018-05-25 09:29:23.210691	2018-05-25 09:29:23.210691
234	6	Lily	11/10	f	\N	2018-05-25 09:29:23.225813	2018-05-25 09:29:23.225813
235	6	Jake	smol pupperino	f	\N	2018-05-25 09:29:23.240925	2018-05-25 09:29:23.240925
236	6	Abby	smol pupperino	f	\N	2018-05-25 09:29:23.253918	2018-05-25 09:29:23.253918
237	6	Pepper	blep	f	\N	2018-05-25 09:29:23.263606	2018-05-25 09:29:23.263606
238	6	Pepper	thicc doggo	f	\N	2018-05-25 09:29:23.273708	2018-05-25 09:29:23.273708
239	6	Penny	long boi	f	\N	2018-05-25 09:29:23.287421	2018-05-25 09:29:23.287421
240	6	Bandit	blep	f	\N	2018-05-25 09:29:23.303318	2018-05-25 09:29:23.303318
241	7	Scooter	thicc doggo	f	\N	2018-05-25 09:29:23.322067	2018-05-25 09:29:23.322067
242	7	Abby	thicc doggo	f	\N	2018-05-25 09:29:23.337258	2018-05-25 09:29:23.337258
243	7	Pepper	thicc doggo	f	\N	2018-05-25 09:29:23.355452	2018-05-25 09:29:23.355452
244	7	Pepper	11/10	f	\N	2018-05-25 09:29:23.369707	2018-05-25 09:29:23.369707
245	7	Buddy	mlem	f	\N	2018-05-25 09:29:23.384319	2018-05-25 09:29:23.384319
246	7	Snoopy	smol pupperino	f	\N	2018-05-25 09:29:23.39906	2018-05-25 09:29:23.39906
247	7	Rex	blep	f	\N	2018-05-25 09:29:23.414156	2018-05-25 09:29:23.414156
248	7	Bo	zoom	f	\N	2018-05-25 09:29:23.437422	2018-05-25 09:29:23.437422
249	7	Murphy	boop the snoot	f	\N	2018-05-25 09:29:23.45307	2018-05-25 09:29:23.45307
250	7	Bear	boop the snoot	f	\N	2018-05-25 09:29:23.469716	2018-05-25 09:29:23.469716
251	7	Bo	11/10	f	\N	2018-05-25 09:29:23.481049	2018-05-25 09:29:23.481049
252	7	Jasper	blep	f	\N	2018-05-25 09:29:23.491426	2018-05-25 09:29:23.491426
253	7	Bandit	11/10	f	\N	2018-05-25 09:29:23.500857	2018-05-25 09:29:23.500857
254	7	Luna	boop the snoot	f	\N	2018-05-25 09:29:23.510613	2018-05-25 09:29:23.510613
255	7	Shadow	big ol' pupper	f	\N	2018-05-25 09:29:23.520912	2018-05-25 09:29:23.520912
256	7	Abby	big ol' pupper	f	\N	2018-05-25 09:29:23.534424	2018-05-25 09:29:23.534424
257	7	Lexi	boop the snoot	f	\N	2018-05-25 09:29:23.55176	2018-05-25 09:29:23.55176
258	7	Sugar	big ol' pupper	f	\N	2018-05-25 09:29:23.566622	2018-05-25 09:29:23.566622
259	7	Bella	boop the snoot	f	\N	2018-05-25 09:29:23.584341	2018-05-25 09:29:23.584341
260	7	Sassy	mlem	f	\N	2018-05-25 09:29:23.594573	2018-05-25 09:29:23.594573
261	7	Buster	big ol' pupper	f	\N	2018-05-25 09:29:23.608997	2018-05-25 09:29:23.608997
262	7	Bear	smol pupperino	f	\N	2018-05-25 09:29:23.624382	2018-05-25 09:29:23.624382
263	7	Buddy	boop the snoot	f	\N	2018-05-25 09:29:23.642479	2018-05-25 09:29:23.642479
264	7	Rex	mlem	f	\N	2018-05-25 09:29:23.658252	2018-05-25 09:29:23.658252
265	7	Luna	big ol' pupper	f	\N	2018-05-25 09:29:23.671091	2018-05-25 09:29:23.671091
266	7	Bubba	boop the snoot	f	\N	2018-05-25 09:29:23.685233	2018-05-25 09:29:23.685233
267	7	Zoe	they're good dogs Brent	f	\N	2018-05-25 09:29:23.699474	2018-05-25 09:29:23.699474
268	7	Gizmo	blep	f	\N	2018-05-25 09:29:23.7154	2018-05-25 09:29:23.7154
269	7	Baby	smol pupperino	f	\N	2018-05-25 09:29:23.736359	2018-05-25 09:29:23.736359
270	7	Lily	long boi	f	\N	2018-05-25 09:29:23.751101	2018-05-25 09:29:23.751101
271	7	Spike	zoom	f	\N	2018-05-25 09:29:23.766101	2018-05-25 09:29:23.766101
272	7	Penny	big ol' pupper	f	\N	2018-05-25 09:29:23.781185	2018-05-25 09:29:23.781185
273	7	Daisy	boop the snoot	f	\N	2018-05-25 09:29:23.801817	2018-05-25 09:29:23.801817
274	7	Lilly	11/10	f	\N	2018-05-25 09:29:23.813612	2018-05-25 09:29:23.813612
275	7	Zeus	11/10	f	\N	2018-05-25 09:29:23.825969	2018-05-25 09:29:23.825969
276	7	Pepper	boop the snoot	f	\N	2018-05-25 09:29:23.836074	2018-05-25 09:29:23.836074
277	7	Chloe	thicc doggo	f	\N	2018-05-25 09:29:23.846797	2018-05-25 09:29:23.846797
278	7	Lucky	big ol' pupper	f	\N	2018-05-25 09:29:23.855414	2018-05-25 09:29:23.855414
279	7	Shelby	they're good dogs Brent	f	\N	2018-05-25 09:29:23.865031	2018-05-25 09:29:23.865031
280	7	Sassy	11/10	f	\N	2018-05-25 09:29:23.873143	2018-05-25 09:29:23.873143
281	7	Oscar	11/10	f	\N	2018-05-25 09:29:23.882621	2018-05-25 09:29:23.882621
282	7	Lola	zoom	f	\N	2018-05-25 09:29:23.894654	2018-05-25 09:29:23.894654
283	7	Sadie	long boi	f	\N	2018-05-25 09:29:23.902173	2018-05-25 09:29:23.902173
284	7	Cookie	long boi	f	\N	2018-05-25 09:29:23.910309	2018-05-25 09:29:23.910309
285	7	Roxie	blep	f	\N	2018-05-25 09:29:23.918628	2018-05-25 09:29:23.918628
286	7	Bailey	thicc doggo	f	\N	2018-05-25 09:29:23.926577	2018-05-25 09:29:23.926577
287	7	Belle	they're good dogs Brent	f	\N	2018-05-25 09:29:23.934372	2018-05-25 09:29:23.934372
288	7	Duke	thicc doggo	f	\N	2018-05-25 09:29:23.942057	2018-05-25 09:29:23.942057
289	8	Buster	big ol' pupper	f	\N	2018-05-25 09:29:23.95113	2018-05-25 09:29:23.95113
290	8	Ruby	boop the snoot	f	\N	2018-05-25 09:29:23.95866	2018-05-25 09:29:23.95866
291	8	Snoopy	big ol' pupper	f	\N	2018-05-25 09:29:23.96617	2018-05-25 09:29:23.96617
292	8	Mia	smol pupperino	f	\N	2018-05-25 09:29:23.974239	2018-05-25 09:29:23.974239
293	8	Maggie	11/10	f	\N	2018-05-25 09:29:23.982802	2018-05-25 09:29:23.982802
294	8	Abby	smol pupperino	f	\N	2018-05-25 09:29:23.990508	2018-05-25 09:29:23.990508
295	8	Tucker	mlem	f	\N	2018-05-25 09:29:24.000505	2018-05-25 09:29:24.000505
296	8	Chloe	thicc doggo	f	\N	2018-05-25 09:29:24.011958	2018-05-25 09:29:24.011958
297	8	Cocoa	11/10	f	\N	2018-05-25 09:29:24.02303	2018-05-25 09:29:24.02303
298	8	Sophie	thicc doggo	f	\N	2018-05-25 09:29:24.037908	2018-05-25 09:29:24.037908
299	8	Lilly	long boi	f	\N	2018-05-25 09:29:24.050905	2018-05-25 09:29:24.050905
300	8	Peanut	mlem	f	\N	2018-05-25 09:29:24.063831	2018-05-25 09:29:24.063831
301	8	Bandit	blep	f	\N	2018-05-25 09:29:24.075723	2018-05-25 09:29:24.075723
302	8	Honey	they're good dogs Brent	f	\N	2018-05-25 09:29:24.0891	2018-05-25 09:29:24.0891
303	8	Misty	long boi	f	\N	2018-05-25 09:29:24.102893	2018-05-25 09:29:24.102893
304	8	Scooter	big ol' pupper	f	\N	2018-05-25 09:29:24.118995	2018-05-25 09:29:24.118995
305	8	Sam	thicc doggo	f	\N	2018-05-25 09:29:24.133451	2018-05-25 09:29:24.133451
306	8	Cookie	zoom	f	\N	2018-05-25 09:29:24.144294	2018-05-25 09:29:24.144294
307	8	Marley	long boi	f	\N	2018-05-25 09:29:24.15286	2018-05-25 09:29:24.15286
308	8	Misty	long boi	f	\N	2018-05-25 09:29:24.163047	2018-05-25 09:29:24.163047
309	8	Blue	long boi	f	\N	2018-05-25 09:29:24.172565	2018-05-25 09:29:24.172565
310	8	Zeus	thicc doggo	f	\N	2018-05-25 09:29:24.182831	2018-05-25 09:29:24.182831
311	8	Lola	long boi	f	\N	2018-05-25 09:29:24.191222	2018-05-25 09:29:24.191222
312	8	Gizmo	long boi	f	\N	2018-05-25 09:29:24.199709	2018-05-25 09:29:24.199709
313	8	Baxter	long boi	f	\N	2018-05-25 09:29:24.208178	2018-05-25 09:29:24.208178
314	8	Snoopy	mlem	f	\N	2018-05-25 09:29:24.216226	2018-05-25 09:29:24.216226
315	8	Bailey	long boi	f	\N	2018-05-25 09:29:24.224083	2018-05-25 09:29:24.224083
316	8	Molly	thicc doggo	f	\N	2018-05-25 09:29:24.231844	2018-05-25 09:29:24.231844
317	8	Marley	smol pupperino	f	\N	2018-05-25 09:29:24.239678	2018-05-25 09:29:24.239678
318	8	Sasha	blep	f	\N	2018-05-25 09:29:24.247629	2018-05-25 09:29:24.247629
319	8	Diesel	they're good dogs Brent	f	\N	2018-05-25 09:29:24.254994	2018-05-25 09:29:24.254994
320	8	Baby	blep	f	\N	2018-05-25 09:29:24.263511	2018-05-25 09:29:24.263511
321	8	Lola	heck no pal	f	\N	2018-05-25 09:29:24.272356	2018-05-25 09:29:24.272356
322	8	Lucky	heck no pal	f	\N	2018-05-25 09:29:24.281632	2018-05-25 09:29:24.281632
323	8	Sam	thicc doggo	f	\N	2018-05-25 09:29:24.290189	2018-05-25 09:29:24.290189
324	8	Chico	11/10	f	\N	2018-05-25 09:29:24.299511	2018-05-25 09:29:24.299511
325	8	Casey	long boi	f	\N	2018-05-25 09:29:24.307948	2018-05-25 09:29:24.307948
326	8	Cocoa	zoom	f	\N	2018-05-25 09:29:24.316449	2018-05-25 09:29:24.316449
327	8	Max	mlem	f	\N	2018-05-25 09:29:24.324201	2018-05-25 09:29:24.324201
328	8	Cody	they're good dogs Brent	f	\N	2018-05-25 09:29:24.332981	2018-05-25 09:29:24.332981
329	8	Sassy	long boi	f	\N	2018-05-25 09:29:24.342827	2018-05-25 09:29:24.342827
330	8	Coco	11/10	f	\N	2018-05-25 09:29:24.353052	2018-05-25 09:29:24.353052
331	8	Dixie	blep	f	\N	2018-05-25 09:29:24.363319	2018-05-25 09:29:24.363319
332	8	Dixie	thicc doggo	f	\N	2018-05-25 09:29:24.373586	2018-05-25 09:29:24.373586
333	8	Bailey	mlem	f	\N	2018-05-25 09:29:24.383002	2018-05-25 09:29:24.383002
334	8	Lucky	boop the snoot	f	\N	2018-05-25 09:29:24.391342	2018-05-25 09:29:24.391342
335	8	Max	they're good dogs Brent	f	\N	2018-05-25 09:29:24.399072	2018-05-25 09:29:24.399072
336	8	Molly	thicc doggo	f	\N	2018-05-25 09:29:24.407165	2018-05-25 09:29:24.407165
337	9	Chance	zoom	f	\N	2018-05-25 09:29:24.416502	2018-05-25 09:29:24.416502
338	9	Murphy	blep	f	\N	2018-05-25 09:29:24.424657	2018-05-25 09:29:24.424657
339	9	Jake	boop the snoot	f	\N	2018-05-25 09:29:24.432545	2018-05-25 09:29:24.432545
340	9	Cookie	zoom	f	\N	2018-05-25 09:29:24.439776	2018-05-25 09:29:24.439776
341	9	Lucky	mlem	f	\N	2018-05-25 09:29:24.447955	2018-05-25 09:29:24.447955
342	9	Gracie	zoom	f	\N	2018-05-25 09:29:24.455779	2018-05-25 09:29:24.455779
343	9	Dixie	11/10	f	\N	2018-05-25 09:29:24.465945	2018-05-25 09:29:24.465945
344	9	Tank	blep	f	\N	2018-05-25 09:29:24.474082	2018-05-25 09:29:24.474082
345	9	Shadow	heck no pal	f	\N	2018-05-25 09:29:24.482748	2018-05-25 09:29:24.482748
346	9	Toby	11/10	f	\N	2018-05-25 09:29:24.490109	2018-05-25 09:29:24.490109
347	9	Peanut	boop the snoot	f	\N	2018-05-25 09:29:24.498169	2018-05-25 09:29:24.498169
348	9	Lady	big ol' pupper	f	\N	2018-05-25 09:29:24.50576	2018-05-25 09:29:24.50576
349	9	Precious	smol pupperino	f	\N	2018-05-25 09:29:24.514096	2018-05-25 09:29:24.514096
350	9	Diamond	boop the snoot	f	\N	2018-05-25 09:29:24.522041	2018-05-25 09:29:24.522041
351	9	Molly	zoom	f	\N	2018-05-25 09:29:24.532731	2018-05-25 09:29:24.532731
352	9	Snoopy	boop the snoot	f	\N	2018-05-25 09:29:24.541343	2018-05-25 09:29:24.541343
353	9	Tucker	mlem	f	\N	2018-05-25 09:29:24.55027	2018-05-25 09:29:24.55027
354	9	Toby	zoom	f	\N	2018-05-25 09:29:24.558579	2018-05-25 09:29:24.558579
355	9	Mia	they're good dogs Brent	f	\N	2018-05-25 09:29:24.568359	2018-05-25 09:29:24.568359
356	9	Luna	boop the snoot	f	\N	2018-05-25 09:29:24.577331	2018-05-25 09:29:24.577331
357	9	Sugar	long boi	f	\N	2018-05-25 09:29:24.588168	2018-05-25 09:29:24.588168
358	9	Max	mlem	f	\N	2018-05-25 09:29:24.600552	2018-05-25 09:29:24.600552
359	9	Oreo	zoom	f	\N	2018-05-25 09:29:24.615483	2018-05-25 09:29:24.615483
360	9	Sparky	smol pupperino	f	\N	2018-05-25 09:29:24.629409	2018-05-25 09:29:24.629409
361	9	Oreo	smol pupperino	f	\N	2018-05-25 09:29:24.645124	2018-05-25 09:29:24.645124
362	9	Harvey	they're good dogs Brent	f	\N	2018-05-25 09:29:24.659637	2018-05-25 09:29:24.659637
363	9	Sophie	11/10	f	\N	2018-05-25 09:29:24.671849	2018-05-25 09:29:24.671849
364	9	Bailey	they're good dogs Brent	f	\N	2018-05-25 09:29:24.687492	2018-05-25 09:29:24.687492
365	9	Zeus	boop the snoot	f	\N	2018-05-25 09:29:24.703844	2018-05-25 09:29:24.703844
366	9	Rocky	long boi	f	\N	2018-05-25 09:29:24.719575	2018-05-25 09:29:24.719575
367	9	Chloe	blep	f	\N	2018-05-25 09:29:24.734424	2018-05-25 09:29:24.734424
368	9	Blue	smol pupperino	f	\N	2018-05-25 09:29:24.747703	2018-05-25 09:29:24.747703
369	9	Bo	long boi	f	\N	2018-05-25 09:29:24.76739	2018-05-25 09:29:24.76739
370	9	Bo	blep	f	\N	2018-05-25 09:29:24.783702	2018-05-25 09:29:24.783702
371	9	Molly	boop the snoot	f	\N	2018-05-25 09:29:24.79554	2018-05-25 09:29:24.79554
372	9	Lilly	mlem	f	\N	2018-05-25 09:29:24.803616	2018-05-25 09:29:24.803616
373	9	Belle	zoom	f	\N	2018-05-25 09:29:24.814403	2018-05-25 09:29:24.814403
374	9	Snickers	blep	f	\N	2018-05-25 09:29:24.822395	2018-05-25 09:29:24.822395
375	9	Maggie	heck no pal	f	\N	2018-05-25 09:29:24.831763	2018-05-25 09:29:24.831763
376	9	Angel	zoom	f	\N	2018-05-25 09:29:24.841495	2018-05-25 09:29:24.841495
377	9	Lola	11/10	f	\N	2018-05-25 09:29:24.852434	2018-05-25 09:29:24.852434
378	9	Princess	smol pupperino	f	\N	2018-05-25 09:29:24.86337	2018-05-25 09:29:24.86337
379	9	Sassy	smol pupperino	f	\N	2018-05-25 09:29:24.873925	2018-05-25 09:29:24.873925
380	9	Oscar	smol pupperino	f	\N	2018-05-25 09:29:24.883755	2018-05-25 09:29:24.883755
381	9	Precious	they're good dogs Brent	f	\N	2018-05-25 09:29:24.893123	2018-05-25 09:29:24.893123
382	9	Gracie	thicc doggo	f	\N	2018-05-25 09:29:24.902434	2018-05-25 09:29:24.902434
383	9	Rusty	thicc doggo	f	\N	2018-05-25 09:29:24.912729	2018-05-25 09:29:24.912729
384	9	Sparky	heck no pal	f	\N	2018-05-25 09:29:24.923732	2018-05-25 09:29:24.923732
385	10	Ginger	smol pupperino	f	\N	2018-05-25 09:29:24.935274	2018-05-25 09:29:24.935274
386	10	Chico	zoom	f	\N	2018-05-25 09:29:24.945803	2018-05-25 09:29:24.945803
387	10	Sophie	they're good dogs Brent	f	\N	2018-05-25 09:29:24.955205	2018-05-25 09:29:24.955205
388	10	Buster	11/10	f	\N	2018-05-25 09:29:24.964596	2018-05-25 09:29:24.964596
389	10	Patches	big ol' pupper	f	\N	2018-05-25 09:29:24.973031	2018-05-25 09:29:24.973031
390	10	Daisy	mlem	f	\N	2018-05-25 09:29:24.982612	2018-05-25 09:29:24.982612
391	10	Tyson	heck no pal	f	\N	2018-05-25 09:29:24.991959	2018-05-25 09:29:24.991959
392	10	Roxie	they're good dogs Brent	f	\N	2018-05-25 09:29:25.000702	2018-05-25 09:29:25.000702
393	10	Daisy	boop the snoot	f	\N	2018-05-25 09:29:25.008741	2018-05-25 09:29:25.008741
394	10	Molly	blep	f	\N	2018-05-25 09:29:25.016364	2018-05-25 09:29:25.016364
395	10	Shelby	boop the snoot	f	\N	2018-05-25 09:29:25.024477	2018-05-25 09:29:25.024477
396	10	Lilly	long boi	f	\N	2018-05-25 09:29:25.032781	2018-05-25 09:29:25.032781
397	10	Bruno	11/10	f	\N	2018-05-25 09:29:25.039845	2018-05-25 09:29:25.039845
398	10	Brutus	11/10	f	\N	2018-05-25 09:29:25.046561	2018-05-25 09:29:25.046561
399	10	Precious	long boi	f	\N	2018-05-25 09:29:25.053011	2018-05-25 09:29:25.053011
400	10	Spike	zoom	f	\N	2018-05-25 09:29:25.06018	2018-05-25 09:29:25.06018
401	10	Sasha	mlem	f	\N	2018-05-25 09:29:25.067224	2018-05-25 09:29:25.067224
402	10	Brutus	big ol' pupper	f	\N	2018-05-25 09:29:25.073686	2018-05-25 09:29:25.073686
403	10	Honey	zoom	f	\N	2018-05-25 09:29:25.081145	2018-05-25 09:29:25.081145
404	10	Chloe	thicc doggo	f	\N	2018-05-25 09:29:25.087746	2018-05-25 09:29:25.087746
405	10	Lola	boop the snoot	f	\N	2018-05-25 09:29:25.094177	2018-05-25 09:29:25.094177
406	10	Sandy	they're good dogs Brent	f	\N	2018-05-25 09:29:25.102365	2018-05-25 09:29:25.102365
407	10	Diesel	long boi	f	\N	2018-05-25 09:29:25.112898	2018-05-25 09:29:25.112898
408	10	Tank	thicc doggo	f	\N	2018-05-25 09:29:25.123324	2018-05-25 09:29:25.123324
409	10	Penny	they're good dogs Brent	f	\N	2018-05-25 09:29:25.135107	2018-05-25 09:29:25.135107
410	10	Misty	they're good dogs Brent	f	\N	2018-05-25 09:29:25.143493	2018-05-25 09:29:25.143493
411	10	Bear	smol pupperino	f	\N	2018-05-25 09:29:25.151985	2018-05-25 09:29:25.151985
412	10	Snickers	heck no pal	f	\N	2018-05-25 09:29:25.161034	2018-05-25 09:29:25.161034
413	10	Sammy	boop the snoot	f	\N	2018-05-25 09:29:25.169131	2018-05-25 09:29:25.169131
414	10	Missy	thicc doggo	f	\N	2018-05-25 09:29:25.177489	2018-05-25 09:29:25.177489
415	10	Bear	heck no pal	f	\N	2018-05-25 09:29:25.187515	2018-05-25 09:29:25.187515
416	10	Roxie	mlem	f	\N	2018-05-25 09:29:25.196017	2018-05-25 09:29:25.196017
417	10	Tucker	heck no pal	f	\N	2018-05-25 09:29:25.204833	2018-05-25 09:29:25.204833
418	10	Gracie	boop the snoot	f	\N	2018-05-25 09:29:25.214707	2018-05-25 09:29:25.214707
419	10	Cooper	they're good dogs Brent	f	\N	2018-05-25 09:29:25.222617	2018-05-25 09:29:25.222617
420	10	Murphy	thicc doggo	f	\N	2018-05-25 09:29:25.231383	2018-05-25 09:29:25.231383
421	10	Bandit	big ol' pupper	f	\N	2018-05-25 09:29:25.24075	2018-05-25 09:29:25.24075
422	10	Belle	blep	f	\N	2018-05-25 09:29:25.251201	2018-05-25 09:29:25.251201
423	10	Toby	11/10	f	\N	2018-05-25 09:29:25.261687	2018-05-25 09:29:25.261687
424	10	Tyson	mlem	f	\N	2018-05-25 09:29:25.272148	2018-05-25 09:29:25.272148
425	10	Lady	heck no pal	f	\N	2018-05-25 09:29:25.282517	2018-05-25 09:29:25.282517
426	10	Zoey	mlem	f	\N	2018-05-25 09:29:25.291106	2018-05-25 09:29:25.291106
427	10	Sugar	zoom	f	\N	2018-05-25 09:29:25.299462	2018-05-25 09:29:25.299462
428	10	Blue	blep	f	\N	2018-05-25 09:29:25.307747	2018-05-25 09:29:25.307747
429	10	Chloe	boop the snoot	f	\N	2018-05-25 09:29:25.315937	2018-05-25 09:29:25.315937
430	10	Buddy	big ol' pupper	f	\N	2018-05-25 09:29:25.324506	2018-05-25 09:29:25.324506
431	10	Ruby	blep	f	\N	2018-05-25 09:29:25.332159	2018-05-25 09:29:25.332159
432	10	Bubba	long boi	f	\N	2018-05-25 09:29:25.340153	2018-05-25 09:29:25.340153
433	11	Sammy	thicc doggo	f	\N	2018-05-25 09:29:25.349508	2018-05-25 09:29:25.349508
434	11	Diamond	smol pupperino	f	\N	2018-05-25 09:29:25.357346	2018-05-25 09:29:25.357346
435	11	Lucy	they're good dogs Brent	f	\N	2018-05-25 09:29:25.365052	2018-05-25 09:29:25.365052
436	11	Daisy	they're good dogs Brent	f	\N	2018-05-25 09:29:25.371758	2018-05-25 09:29:25.371758
437	11	Bailey	zoom	f	\N	2018-05-25 09:29:25.378911	2018-05-25 09:29:25.378911
438	11	Teddy	boop the snoot	f	\N	2018-05-25 09:29:25.38633	2018-05-25 09:29:25.38633
439	11	Lady	boop the snoot	f	\N	2018-05-25 09:29:25.394131	2018-05-25 09:29:25.394131
440	11	Abby	mlem	f	\N	2018-05-25 09:29:25.402262	2018-05-25 09:29:25.402262
441	11	Roxy	boop the snoot	f	\N	2018-05-25 09:29:25.410945	2018-05-25 09:29:25.410945
442	11	Chloe	heck no pal	f	\N	2018-05-25 09:29:25.419078	2018-05-25 09:29:25.419078
443	11	Cocoa	thicc doggo	f	\N	2018-05-25 09:29:25.42723	2018-05-25 09:29:25.42723
444	11	Snoopy	blep	f	\N	2018-05-25 09:29:25.435515	2018-05-25 09:29:25.435515
445	11	Pepper	they're good dogs Brent	f	\N	2018-05-25 09:29:25.443981	2018-05-25 09:29:25.443981
446	11	Pepper	thicc doggo	f	\N	2018-05-25 09:29:25.451849	2018-05-25 09:29:25.451849
447	11	Brutus	long boi	f	\N	2018-05-25 09:29:25.461736	2018-05-25 09:29:25.461736
448	11	Peanut	11/10	f	\N	2018-05-25 09:29:25.471487	2018-05-25 09:29:25.471487
449	11	Sparky	thicc doggo	f	\N	2018-05-25 09:29:25.482219	2018-05-25 09:29:25.482219
450	11	Lucky	they're good dogs Brent	f	\N	2018-05-25 09:29:25.49206	2018-05-25 09:29:25.49206
451	11	Cocoa	smol pupperino	f	\N	2018-05-25 09:29:25.502802	2018-05-25 09:29:25.502802
452	11	Toby	mlem	f	\N	2018-05-25 09:29:25.511494	2018-05-25 09:29:25.511494
453	11	Lily	they're good dogs Brent	f	\N	2018-05-25 09:29:25.519732	2018-05-25 09:29:25.519732
454	11	Jasper	smol pupperino	f	\N	2018-05-25 09:29:25.528573	2018-05-25 09:29:25.528573
455	11	Abby	mlem	f	\N	2018-05-25 09:29:25.536628	2018-05-25 09:29:25.536628
456	11	Chloe	11/10	f	\N	2018-05-25 09:29:25.544292	2018-05-25 09:29:25.544292
457	11	Cody	thicc doggo	f	\N	2018-05-25 09:29:25.552856	2018-05-25 09:29:25.552856
458	11	Penny	mlem	f	\N	2018-05-25 09:29:25.560956	2018-05-25 09:29:25.560956
459	11	Peanut	11/10	f	\N	2018-05-25 09:29:25.569431	2018-05-25 09:29:25.569431
460	11	Lexi	zoom	f	\N	2018-05-25 09:29:25.57807	2018-05-25 09:29:25.57807
461	11	Zoey	blep	f	\N	2018-05-25 09:29:25.586874	2018-05-25 09:29:25.586874
462	11	Dixie	11/10	f	\N	2018-05-25 09:29:25.595442	2018-05-25 09:29:25.595442
463	11	Blue	11/10	f	\N	2018-05-25 09:29:25.604278	2018-05-25 09:29:25.604278
464	11	Tank	long boi	f	\N	2018-05-25 09:29:25.617121	2018-05-25 09:29:25.617121
465	11	Jasmine	big ol' pupper	f	\N	2018-05-25 09:29:25.627964	2018-05-25 09:29:25.627964
466	11	Snickers	long boi	f	\N	2018-05-25 09:29:25.636587	2018-05-25 09:29:25.636587
467	11	Precious	zoom	f	\N	2018-05-25 09:29:25.644777	2018-05-25 09:29:25.644777
468	11	Cookie	thicc doggo	f	\N	2018-05-25 09:29:25.654875	2018-05-25 09:29:25.654875
469	11	Bella	big ol' pupper	f	\N	2018-05-25 09:29:25.662913	2018-05-25 09:29:25.662913
470	11	Lady	they're good dogs Brent	f	\N	2018-05-25 09:29:25.670348	2018-05-25 09:29:25.670348
471	11	Dixie	thicc doggo	f	\N	2018-05-25 09:29:25.678323	2018-05-25 09:29:25.678323
472	11	Taz	mlem	f	\N	2018-05-25 09:29:25.686825	2018-05-25 09:29:25.686825
473	11	Dixie	heck no pal	f	\N	2018-05-25 09:29:25.694688	2018-05-25 09:29:25.694688
474	11	Rosie	11/10	f	\N	2018-05-25 09:29:25.702628	2018-05-25 09:29:25.702628
475	11	Harvey	heck no pal	f	\N	2018-05-25 09:29:25.710852	2018-05-25 09:29:25.710852
476	11	Bo	thicc doggo	f	\N	2018-05-25 09:29:25.720351	2018-05-25 09:29:25.720351
477	11	Jack	long boi	f	\N	2018-05-25 09:29:25.729626	2018-05-25 09:29:25.729626
478	11	Zoey	mlem	f	\N	2018-05-25 09:29:25.73753	2018-05-25 09:29:25.73753
479	11	Oreo	long boi	f	\N	2018-05-25 09:29:25.746006	2018-05-25 09:29:25.746006
480	11	Penny	blep	f	\N	2018-05-25 09:29:25.75379	2018-05-25 09:29:25.75379
481	12	Abby	heck no pal	f	\N	2018-05-25 09:29:25.763057	2018-05-25 09:29:25.763057
482	12	Tucker	big ol' pupper	f	\N	2018-05-25 09:29:25.77071	2018-05-25 09:29:25.77071
483	12	Rosie	blep	f	\N	2018-05-25 09:29:25.778433	2018-05-25 09:29:25.778433
484	12	Bailey	blep	f	\N	2018-05-25 09:29:25.786303	2018-05-25 09:29:25.786303
485	12	Annie	heck no pal	f	\N	2018-05-25 09:29:25.794618	2018-05-25 09:29:25.794618
486	12	Belle	11/10	f	\N	2018-05-25 09:29:25.8034	2018-05-25 09:29:25.8034
487	12	Abby	heck no pal	f	\N	2018-05-25 09:29:25.811231	2018-05-25 09:29:25.811231
488	12	Taz	they're good dogs Brent	f	\N	2018-05-25 09:29:25.81897	2018-05-25 09:29:25.81897
489	12	Cocoa	heck no pal	f	\N	2018-05-25 09:29:25.826946	2018-05-25 09:29:25.826946
490	12	Shelby	big ol' pupper	f	\N	2018-05-25 09:29:25.8355	2018-05-25 09:29:25.8355
491	12	Roxy	11/10	f	\N	2018-05-25 09:29:25.844001	2018-05-25 09:29:25.844001
492	12	Lady	boop the snoot	f	\N	2018-05-25 09:29:25.851146	2018-05-25 09:29:25.851146
493	12	Princess	zoom	f	\N	2018-05-25 09:29:25.858103	2018-05-25 09:29:25.858103
494	12	Milo	11/10	f	\N	2018-05-25 09:29:25.865011	2018-05-25 09:29:25.865011
495	12	Ruby	long boi	f	\N	2018-05-25 09:29:25.872212	2018-05-25 09:29:25.872212
496	12	Rosie	zoom	f	\N	2018-05-25 09:29:25.879972	2018-05-25 09:29:25.879972
497	12	Baxter	they're good dogs Brent	f	\N	2018-05-25 09:29:25.888654	2018-05-25 09:29:25.888654
498	12	Max	they're good dogs Brent	f	\N	2018-05-25 09:29:25.896778	2018-05-25 09:29:25.896778
499	12	Sandy	zoom	f	\N	2018-05-25 09:29:25.904306	2018-05-25 09:29:25.904306
500	12	Tyson	blep	f	\N	2018-05-25 09:29:25.914094	2018-05-25 09:29:25.914094
501	12	Casey	mlem	f	\N	2018-05-25 09:29:25.922061	2018-05-25 09:29:25.922061
502	12	Precious	11/10	f	\N	2018-05-25 09:29:25.931076	2018-05-25 09:29:25.931076
503	12	Jake	blep	f	\N	2018-05-25 09:29:25.940354	2018-05-25 09:29:25.940354
504	12	Diesel	smol pupperino	f	\N	2018-05-25 09:29:25.950476	2018-05-25 09:29:25.950476
505	12	Chloe	heck no pal	f	\N	2018-05-25 09:29:25.95916	2018-05-25 09:29:25.95916
506	12	Max	zoom	f	\N	2018-05-25 09:29:25.969497	2018-05-25 09:29:25.969497
507	12	Snickers	boop the snoot	f	\N	2018-05-25 09:29:25.979249	2018-05-25 09:29:25.979249
508	12	Roxy	big ol' pupper	f	\N	2018-05-25 09:29:25.989521	2018-05-25 09:29:25.989521
509	12	Jake	thicc doggo	f	\N	2018-05-25 09:29:25.999799	2018-05-25 09:29:25.999799
510	12	Patches	mlem	f	\N	2018-05-25 09:29:26.010346	2018-05-25 09:29:26.010346
511	12	Annie	big ol' pupper	f	\N	2018-05-25 09:29:26.020383	2018-05-25 09:29:26.020383
512	12	Lucy	they're good dogs Brent	f	\N	2018-05-25 09:29:26.029204	2018-05-25 09:29:26.029204
513	12	Baxter	boop the snoot	f	\N	2018-05-25 09:29:26.037987	2018-05-25 09:29:26.037987
514	12	Dixie	thicc doggo	f	\N	2018-05-25 09:29:26.045786	2018-05-25 09:29:26.045786
515	12	Bo	heck no pal	f	\N	2018-05-25 09:29:26.05381	2018-05-25 09:29:26.05381
516	12	Bailey	smol pupperino	f	\N	2018-05-25 09:29:26.062021	2018-05-25 09:29:26.062021
517	12	Baby	long boi	f	\N	2018-05-25 09:29:26.070082	2018-05-25 09:29:26.070082
518	12	Peanut	zoom	f	\N	2018-05-25 09:29:26.076844	2018-05-25 09:29:26.076844
519	12	Rosie	smol pupperino	f	\N	2018-05-25 09:29:26.08355	2018-05-25 09:29:26.08355
520	12	Zoe	11/10	f	\N	2018-05-25 09:29:26.090398	2018-05-25 09:29:26.090398
521	12	Mia	zoom	f	\N	2018-05-25 09:29:26.099137	2018-05-25 09:29:26.099137
522	12	Lady	mlem	f	\N	2018-05-25 09:29:26.110381	2018-05-25 09:29:26.110381
523	12	Baby	boop the snoot	f	\N	2018-05-25 09:29:26.119613	2018-05-25 09:29:26.119613
524	12	Coco	long boi	f	\N	2018-05-25 09:29:26.132532	2018-05-25 09:29:26.132532
525	12	Oreo	they're good dogs Brent	f	\N	2018-05-25 09:29:26.142353	2018-05-25 09:29:26.142353
526	12	Pepper	they're good dogs Brent	f	\N	2018-05-25 09:29:26.152484	2018-05-25 09:29:26.152484
527	12	Blue	smol pupperino	f	\N	2018-05-25 09:29:26.162503	2018-05-25 09:29:26.162503
528	12	Penny	zoom	f	\N	2018-05-25 09:29:26.171633	2018-05-25 09:29:26.171633
529	13	Bubba	boop the snoot	f	\N	2018-05-25 09:29:26.183934	2018-05-25 09:29:26.183934
530	13	Bo	they're good dogs Brent	f	\N	2018-05-25 09:29:26.194262	2018-05-25 09:29:26.194262
531	13	Sasha	heck no pal	f	\N	2018-05-25 09:29:26.203043	2018-05-25 09:29:26.203043
532	13	Mia	long boi	f	\N	2018-05-25 09:29:26.211765	2018-05-25 09:29:26.211765
533	13	Mia	long boi	f	\N	2018-05-25 09:29:26.220242	2018-05-25 09:29:26.220242
534	13	Abby	big ol' pupper	f	\N	2018-05-25 09:29:26.229929	2018-05-25 09:29:26.229929
535	13	Molly	heck no pal	f	\N	2018-05-25 09:29:26.238106	2018-05-25 09:29:26.238106
536	13	Sam	heck no pal	f	\N	2018-05-25 09:29:26.247247	2018-05-25 09:29:26.247247
537	13	Cookie	heck no pal	f	\N	2018-05-25 09:29:26.255691	2018-05-25 09:29:26.255691
538	13	Snickers	they're good dogs Brent	f	\N	2018-05-25 09:29:26.263827	2018-05-25 09:29:26.263827
539	13	Harley	smol pupperino	f	\N	2018-05-25 09:29:26.271843	2018-05-25 09:29:26.271843
540	13	Rocky	long boi	f	\N	2018-05-25 09:29:26.280666	2018-05-25 09:29:26.280666
541	13	Murphy	boop the snoot	f	\N	2018-05-25 09:29:26.288628	2018-05-25 09:29:26.288628
542	13	Rex	11/10	f	\N	2018-05-25 09:29:26.296348	2018-05-25 09:29:26.296348
543	13	Sugar	zoom	f	\N	2018-05-25 09:29:26.304014	2018-05-25 09:29:26.304014
544	13	Snoopy	smol pupperino	f	\N	2018-05-25 09:29:26.311985	2018-05-25 09:29:26.311985
545	13	Brutus	smol pupperino	f	\N	2018-05-25 09:29:26.320257	2018-05-25 09:29:26.320257
546	13	Ruby	zoom	f	\N	2018-05-25 09:29:26.327576	2018-05-25 09:29:26.327576
547	13	Teddy	big ol' pupper	f	\N	2018-05-25 09:29:26.335693	2018-05-25 09:29:26.335693
548	13	Cocoa	blep	f	\N	2018-05-25 09:29:26.343701	2018-05-25 09:29:26.343701
549	13	Misty	boop the snoot	f	\N	2018-05-25 09:29:26.351633	2018-05-25 09:29:26.351633
550	13	Lady	smol pupperino	f	\N	2018-05-25 09:29:26.359337	2018-05-25 09:29:26.359337
551	13	Cooper	big ol' pupper	f	\N	2018-05-25 09:29:26.36813	2018-05-25 09:29:26.36813
552	13	Harvey	blep	f	\N	2018-05-25 09:29:26.375897	2018-05-25 09:29:26.375897
553	13	Sparky	11/10	f	\N	2018-05-25 09:29:26.383953	2018-05-25 09:29:26.383953
554	13	Lexi	11/10	f	\N	2018-05-25 09:29:26.391484	2018-05-25 09:29:26.391484
555	13	Buddy	smol pupperino	f	\N	2018-05-25 09:29:26.398771	2018-05-25 09:29:26.398771
556	13	Shadow	they're good dogs Brent	f	\N	2018-05-25 09:29:26.40681	2018-05-25 09:29:26.40681
557	13	Bailey	smol pupperino	f	\N	2018-05-25 09:29:26.414882	2018-05-25 09:29:26.414882
558	13	Rex	big ol' pupper	f	\N	2018-05-25 09:29:26.424024	2018-05-25 09:29:26.424024
559	13	Angel	smol pupperino	f	\N	2018-05-25 09:29:26.43284	2018-05-25 09:29:26.43284
560	13	Zeus	boop the snoot	f	\N	2018-05-25 09:29:26.440956	2018-05-25 09:29:26.440956
561	13	Teddy	blep	f	\N	2018-05-25 09:29:26.450334	2018-05-25 09:29:26.450334
562	13	Blue	smol pupperino	f	\N	2018-05-25 09:29:26.461619	2018-05-25 09:29:26.461619
563	13	Snickers	thicc doggo	f	\N	2018-05-25 09:29:26.469433	2018-05-25 09:29:26.469433
564	13	Mia	boop the snoot	f	\N	2018-05-25 09:29:26.478184	2018-05-25 09:29:26.478184
565	13	Bandit	smol pupperino	f	\N	2018-05-25 09:29:26.485817	2018-05-25 09:29:26.485817
566	13	Taz	big ol' pupper	f	\N	2018-05-25 09:29:26.493407	2018-05-25 09:29:26.493407
567	13	Blue	boop the snoot	f	\N	2018-05-25 09:29:26.501338	2018-05-25 09:29:26.501338
568	13	Penny	heck no pal	f	\N	2018-05-25 09:29:26.509188	2018-05-25 09:29:26.509188
569	13	Harvey	mlem	f	\N	2018-05-25 09:29:26.518527	2018-05-25 09:29:26.518527
570	13	Duke	mlem	f	\N	2018-05-25 09:29:26.52679	2018-05-25 09:29:26.52679
571	13	Oscar	long boi	f	\N	2018-05-25 09:29:26.536271	2018-05-25 09:29:26.536271
572	13	Gizmo	thicc doggo	f	\N	2018-05-25 09:29:26.544438	2018-05-25 09:29:26.544438
573	13	Baxter	zoom	f	\N	2018-05-25 09:29:26.553147	2018-05-25 09:29:26.553147
574	13	Bruno	mlem	f	\N	2018-05-25 09:29:26.562265	2018-05-25 09:29:26.562265
575	13	Harley	they're good dogs Brent	f	\N	2018-05-25 09:29:26.57059	2018-05-25 09:29:26.57059
576	13	Rosie	zoom	f	\N	2018-05-25 09:29:26.57768	2018-05-25 09:29:26.57768
577	14	Misty	thicc doggo	f	\N	2018-05-25 09:29:26.585453	2018-05-25 09:29:26.585453
578	14	Precious	boop the snoot	f	\N	2018-05-25 09:29:26.592794	2018-05-25 09:29:26.592794
579	14	Jasmine	heck no pal	f	\N	2018-05-25 09:29:26.601122	2018-05-25 09:29:26.601122
580	14	Bruno	thicc doggo	f	\N	2018-05-25 09:29:26.610678	2018-05-25 09:29:26.610678
581	14	Blue	big ol' pupper	f	\N	2018-05-25 09:29:26.618604	2018-05-25 09:29:26.618604
582	14	Cookie	smol pupperino	f	\N	2018-05-25 09:29:26.627793	2018-05-25 09:29:26.627793
583	14	Rascal	smol pupperino	f	\N	2018-05-25 09:29:26.635703	2018-05-25 09:29:26.635703
584	14	Marley	smol pupperino	f	\N	2018-05-25 09:29:26.644192	2018-05-25 09:29:26.644192
585	14	Rosie	smol pupperino	f	\N	2018-05-25 09:29:26.652163	2018-05-25 09:29:26.652163
586	14	Sam	11/10	f	\N	2018-05-25 09:29:26.659739	2018-05-25 09:29:26.659739
587	14	Buddy	heck no pal	f	\N	2018-05-25 09:29:26.668123	2018-05-25 09:29:26.668123
588	14	Misty	zoom	f	\N	2018-05-25 09:29:26.676465	2018-05-25 09:29:26.676465
589	14	Belle	smol pupperino	f	\N	2018-05-25 09:29:26.684507	2018-05-25 09:29:26.684507
590	14	Molly	smol pupperino	f	\N	2018-05-25 09:29:26.692589	2018-05-25 09:29:26.692589
591	14	Shelby	smol pupperino	f	\N	2018-05-25 09:29:26.700739	2018-05-25 09:29:26.700739
592	14	Bandit	blep	f	\N	2018-05-25 09:29:26.709536	2018-05-25 09:29:26.709536
593	14	Bear	they're good dogs Brent	f	\N	2018-05-25 09:29:26.72014	2018-05-25 09:29:26.72014
594	14	Luna	smol pupperino	f	\N	2018-05-25 09:29:26.731935	2018-05-25 09:29:26.731935
595	14	Rascal	mlem	f	\N	2018-05-25 09:29:26.741793	2018-05-25 09:29:26.741793
596	14	Brutus	big ol' pupper	f	\N	2018-05-25 09:29:26.754295	2018-05-25 09:29:26.754295
597	14	Teddy	11/10	f	\N	2018-05-25 09:29:26.765745	2018-05-25 09:29:26.765745
598	14	Chico	boop the snoot	f	\N	2018-05-25 09:29:26.776938	2018-05-25 09:29:26.776938
599	14	Cooper	big ol' pupper	f	\N	2018-05-25 09:29:26.788211	2018-05-25 09:29:26.788211
600	14	Jack	long boi	f	\N	2018-05-25 09:29:26.80054	2018-05-25 09:29:26.80054
601	14	Lucy	heck no pal	f	\N	2018-05-25 09:29:26.812882	2018-05-25 09:29:26.812882
602	14	Snickers	long boi	f	\N	2018-05-25 09:29:26.824134	2018-05-25 09:29:26.824134
603	14	Patches	thicc doggo	f	\N	2018-05-25 09:29:26.840569	2018-05-25 09:29:26.840569
604	14	Roxy	smol pupperino	f	\N	2018-05-25 09:29:26.857072	2018-05-25 09:29:26.857072
605	14	Snoopy	they're good dogs Brent	f	\N	2018-05-25 09:29:26.876825	2018-05-25 09:29:26.876825
606	14	Rex	boop the snoot	f	\N	2018-05-25 09:29:26.893638	2018-05-25 09:29:26.893638
607	14	Angel	heck no pal	f	\N	2018-05-25 09:29:26.908444	2018-05-25 09:29:26.908444
608	14	Lady	boop the snoot	f	\N	2018-05-25 09:29:26.92293	2018-05-25 09:29:26.92293
609	14	Mia	11/10	f	\N	2018-05-25 09:29:26.937903	2018-05-25 09:29:26.937903
610	14	Rex	smol pupperino	f	\N	2018-05-25 09:29:26.956778	2018-05-25 09:29:26.956778
611	14	Coco	mlem	f	\N	2018-05-25 09:29:26.971691	2018-05-25 09:29:26.971691
612	14	Penny	11/10	f	\N	2018-05-25 09:29:26.983423	2018-05-25 09:29:26.983423
613	14	Zoe	11/10	f	\N	2018-05-25 09:29:26.996845	2018-05-25 09:29:26.996845
614	14	Pepper	zoom	f	\N	2018-05-25 09:29:27.007664	2018-05-25 09:29:27.007664
615	14	Daisy	blep	f	\N	2018-05-25 09:29:27.017159	2018-05-25 09:29:27.017159
616	14	Diamond	boop the snoot	f	\N	2018-05-25 09:29:27.027524	2018-05-25 09:29:27.027524
617	14	Sparky	they're good dogs Brent	f	\N	2018-05-25 09:29:27.039062	2018-05-25 09:29:27.039062
618	14	Jasmine	big ol' pupper	f	\N	2018-05-25 09:29:27.048013	2018-05-25 09:29:27.048013
619	14	Dakota	they're good dogs Brent	f	\N	2018-05-25 09:29:27.05611	2018-05-25 09:29:27.05611
620	14	Gizmo	big ol' pupper	f	\N	2018-05-25 09:29:27.064589	2018-05-25 09:29:27.064589
621	14	Casey	blep	f	\N	2018-05-25 09:29:27.072616	2018-05-25 09:29:27.072616
622	14	Bandit	blep	f	\N	2018-05-25 09:29:27.080729	2018-05-25 09:29:27.080729
623	14	Diamond	they're good dogs Brent	f	\N	2018-05-25 09:29:27.089006	2018-05-25 09:29:27.089006
624	14	Snickers	11/10	f	\N	2018-05-25 09:29:27.097573	2018-05-25 09:29:27.097573
625	15	Chance	heck no pal	f	\N	2018-05-25 09:29:27.112339	2018-05-25 09:29:27.112339
626	15	Zoey	heck no pal	f	\N	2018-05-25 09:29:27.123636	2018-05-25 09:29:27.123636
627	15	Roxy	they're good dogs Brent	f	\N	2018-05-25 09:29:27.137394	2018-05-25 09:29:27.137394
628	15	Sassy	long boi	f	\N	2018-05-25 09:29:27.146677	2018-05-25 09:29:27.146677
629	15	Diamond	boop the snoot	f	\N	2018-05-25 09:29:27.155497	2018-05-25 09:29:27.155497
630	15	Chico	zoom	f	\N	2018-05-25 09:29:27.16536	2018-05-25 09:29:27.16536
631	15	Snoopy	thicc doggo	f	\N	2018-05-25 09:29:27.173824	2018-05-25 09:29:27.173824
632	15	Jasper	blep	f	\N	2018-05-25 09:29:27.183645	2018-05-25 09:29:27.183645
633	15	Jake	zoom	f	\N	2018-05-25 09:29:27.19326	2018-05-25 09:29:27.19326
634	15	Bear	boop the snoot	f	\N	2018-05-25 09:29:27.201427	2018-05-25 09:29:27.201427
635	15	Bandit	they're good dogs Brent	f	\N	2018-05-25 09:29:27.210754	2018-05-25 09:29:27.210754
636	15	Bailey	thicc doggo	f	\N	2018-05-25 09:29:27.218905	2018-05-25 09:29:27.218905
637	15	Rusty	thicc doggo	f	\N	2018-05-25 09:29:27.227907	2018-05-25 09:29:27.227907
638	15	Sasha	blep	f	\N	2018-05-25 09:29:27.23597	2018-05-25 09:29:27.23597
639	15	Bailey	11/10	f	\N	2018-05-25 09:29:27.244655	2018-05-25 09:29:27.244655
640	15	Roxy	11/10	f	\N	2018-05-25 09:29:27.252908	2018-05-25 09:29:27.252908
641	15	Bella	long boi	f	\N	2018-05-25 09:29:27.263598	2018-05-25 09:29:27.263598
642	15	Casey	blep	f	\N	2018-05-25 09:29:27.272246	2018-05-25 09:29:27.272246
643	15	Mia	smol pupperino	f	\N	2018-05-25 09:29:27.2832	2018-05-25 09:29:27.2832
644	15	Bubba	big ol' pupper	f	\N	2018-05-25 09:29:27.29126	2018-05-25 09:29:27.29126
645	15	Princess	long boi	f	\N	2018-05-25 09:29:27.30045	2018-05-25 09:29:27.30045
646	15	Daisy	heck no pal	f	\N	2018-05-25 09:29:27.309868	2018-05-25 09:29:27.309868
647	15	Sam	smol pupperino	f	\N	2018-05-25 09:29:27.318152	2018-05-25 09:29:27.318152
648	15	Toby	long boi	f	\N	2018-05-25 09:29:27.32708	2018-05-25 09:29:27.32708
649	15	Sassy	boop the snoot	f	\N	2018-05-25 09:29:27.335738	2018-05-25 09:29:27.335738
650	15	Precious	they're good dogs Brent	f	\N	2018-05-25 09:29:27.344696	2018-05-25 09:29:27.344696
651	15	Dixie	smol pupperino	f	\N	2018-05-25 09:29:27.352872	2018-05-25 09:29:27.352872
652	15	Ruby	blep	f	\N	2018-05-25 09:29:27.361828	2018-05-25 09:29:27.361828
653	15	Diesel	boop the snoot	f	\N	2018-05-25 09:29:27.370297	2018-05-25 09:29:27.370297
654	15	Buster	smol pupperino	f	\N	2018-05-25 09:29:27.379566	2018-05-25 09:29:27.379566
655	15	Sam	zoom	f	\N	2018-05-25 09:29:27.387463	2018-05-25 09:29:27.387463
656	15	Zoey	boop the snoot	f	\N	2018-05-25 09:29:27.395895	2018-05-25 09:29:27.395895
657	15	Lola	blep	f	\N	2018-05-25 09:29:27.404658	2018-05-25 09:29:27.404658
658	15	Shadow	they're good dogs Brent	f	\N	2018-05-25 09:29:27.413146	2018-05-25 09:29:27.413146
659	15	Molly	zoom	f	\N	2018-05-25 09:29:27.420892	2018-05-25 09:29:27.420892
660	15	Dakota	they're good dogs Brent	f	\N	2018-05-25 09:29:27.429151	2018-05-25 09:29:27.429151
661	15	Jasper	11/10	f	\N	2018-05-25 09:29:27.436214	2018-05-25 09:29:27.436214
662	15	Snoopy	blep	f	\N	2018-05-25 09:29:27.444042	2018-05-25 09:29:27.444042
663	15	Dixie	heck no pal	f	\N	2018-05-25 09:29:27.452138	2018-05-25 09:29:27.452138
664	15	Sophie	11/10	f	\N	2018-05-25 09:29:27.461213	2018-05-25 09:29:27.461213
665	15	Dixie	11/10	f	\N	2018-05-25 09:29:27.469464	2018-05-25 09:29:27.469464
666	15	Harley	blep	f	\N	2018-05-25 09:29:27.477974	2018-05-25 09:29:27.477974
667	15	Taz	long boi	f	\N	2018-05-25 09:29:27.486149	2018-05-25 09:29:27.486149
668	15	Rex	11/10	f	\N	2018-05-25 09:29:27.494807	2018-05-25 09:29:27.494807
669	15	Chico	mlem	f	\N	2018-05-25 09:29:27.502719	2018-05-25 09:29:27.502719
670	15	Sandy	zoom	f	\N	2018-05-25 09:29:27.511741	2018-05-25 09:29:27.511741
671	15	Murphy	thicc doggo	f	\N	2018-05-25 09:29:27.519858	2018-05-25 09:29:27.519858
672	15	Chico	boop the snoot	f	\N	2018-05-25 09:29:27.528681	2018-05-25 09:29:27.528681
673	16	Angel	smol pupperino	f	\N	2018-05-25 09:29:27.537609	2018-05-25 09:29:27.537609
674	16	Tyson	big ol' pupper	f	\N	2018-05-25 09:29:27.546047	2018-05-25 09:29:27.546047
675	16	Sophie	smol pupperino	f	\N	2018-05-25 09:29:27.553761	2018-05-25 09:29:27.553761
676	16	Max	heck no pal	f	\N	2018-05-25 09:29:27.562301	2018-05-25 09:29:27.562301
677	16	Jack	big ol' pupper	f	\N	2018-05-25 09:29:27.570248	2018-05-25 09:29:27.570248
678	16	Annie	heck no pal	f	\N	2018-05-25 09:29:27.578975	2018-05-25 09:29:27.578975
679	16	Snickers	long boi	f	\N	2018-05-25 09:29:27.588391	2018-05-25 09:29:27.588391
680	16	Spike	11/10	f	\N	2018-05-25 09:29:27.596856	2018-05-25 09:29:27.596856
681	16	Ginger	thicc doggo	f	\N	2018-05-25 09:29:27.606419	2018-05-25 09:29:27.606419
682	16	Buster	they're good dogs Brent	f	\N	2018-05-25 09:29:27.614914	2018-05-25 09:29:27.614914
683	16	Cookie	11/10	f	\N	2018-05-25 09:29:27.62266	2018-05-25 09:29:27.62266
684	16	Oreo	mlem	f	\N	2018-05-25 09:29:27.631378	2018-05-25 09:29:27.631378
685	16	Bubba	thicc doggo	f	\N	2018-05-25 09:29:27.639461	2018-05-25 09:29:27.639461
686	16	Maggie	mlem	f	\N	2018-05-25 09:29:27.647528	2018-05-25 09:29:27.647528
687	16	Chico	big ol' pupper	f	\N	2018-05-25 09:29:27.655222	2018-05-25 09:29:27.655222
688	16	Shelby	11/10	f	\N	2018-05-25 09:29:27.664227	2018-05-25 09:29:27.664227
689	16	Cody	big ol' pupper	f	\N	2018-05-25 09:29:27.672211	2018-05-25 09:29:27.672211
690	16	Gracie	they're good dogs Brent	f	\N	2018-05-25 09:29:27.681209	2018-05-25 09:29:27.681209
691	16	Cocoa	mlem	f	\N	2018-05-25 09:29:27.689415	2018-05-25 09:29:27.689415
692	16	Sasha	big ol' pupper	f	\N	2018-05-25 09:29:27.701218	2018-05-25 09:29:27.701218
693	16	Angel	blep	f	\N	2018-05-25 09:29:27.711738	2018-05-25 09:29:27.711738
694	16	Harley	heck no pal	f	\N	2018-05-25 09:29:27.720319	2018-05-25 09:29:27.720319
695	16	Rosie	11/10	f	\N	2018-05-25 09:29:27.729023	2018-05-25 09:29:27.729023
696	16	Penny	smol pupperino	f	\N	2018-05-25 09:29:27.737395	2018-05-25 09:29:27.737395
697	16	Lucy	they're good dogs Brent	f	\N	2018-05-25 09:29:27.747128	2018-05-25 09:29:27.747128
698	16	Bandit	they're good dogs Brent	f	\N	2018-05-25 09:29:27.755238	2018-05-25 09:29:27.755238
699	16	Lucy	big ol' pupper	f	\N	2018-05-25 09:29:27.766914	2018-05-25 09:29:27.766914
700	16	Gizmo	thicc doggo	f	\N	2018-05-25 09:29:27.776888	2018-05-25 09:29:27.776888
701	16	Rex	big ol' pupper	f	\N	2018-05-25 09:29:27.786054	2018-05-25 09:29:27.786054
702	16	Abby	mlem	f	\N	2018-05-25 09:29:27.796853	2018-05-25 09:29:27.796853
703	16	Sasha	11/10	f	\N	2018-05-25 09:29:27.81075	2018-05-25 09:29:27.81075
704	16	Zeus	mlem	f	\N	2018-05-25 09:29:27.82191	2018-05-25 09:29:27.82191
705	16	Abby	blep	f	\N	2018-05-25 09:29:27.837037	2018-05-25 09:29:27.837037
706	16	Bandit	11/10	f	\N	2018-05-25 09:29:27.84951	2018-05-25 09:29:27.84951
707	16	Casey	thicc doggo	f	\N	2018-05-25 09:29:27.859002	2018-05-25 09:29:27.859002
708	16	Honey	big ol' pupper	f	\N	2018-05-25 09:29:27.868639	2018-05-25 09:29:27.868639
709	16	Riley	thicc doggo	f	\N	2018-05-25 09:29:27.878728	2018-05-25 09:29:27.878728
710	16	Chance	long boi	f	\N	2018-05-25 09:29:27.888198	2018-05-25 09:29:27.888198
711	16	Jack	11/10	f	\N	2018-05-25 09:29:27.898244	2018-05-25 09:29:27.898244
712	16	Charlie	thicc doggo	f	\N	2018-05-25 09:29:27.908559	2018-05-25 09:29:27.908559
713	16	Baxter	heck no pal	f	\N	2018-05-25 09:29:27.918475	2018-05-25 09:29:27.918475
714	16	Chico	smol pupperino	f	\N	2018-05-25 09:29:27.92809	2018-05-25 09:29:27.92809
715	16	Bo	mlem	f	\N	2018-05-25 09:29:27.938001	2018-05-25 09:29:27.938001
716	16	Rascal	they're good dogs Brent	f	\N	2018-05-25 09:29:27.948821	2018-05-25 09:29:27.948821
717	16	Lily	mlem	f	\N	2018-05-25 09:29:27.958486	2018-05-25 09:29:27.958486
718	16	Luna	mlem	f	\N	2018-05-25 09:29:27.966298	2018-05-25 09:29:27.966298
719	16	Zoe	big ol' pupper	f	\N	2018-05-25 09:29:27.973853	2018-05-25 09:29:27.973853
720	16	Baxter	boop the snoot	f	\N	2018-05-25 09:29:27.982337	2018-05-25 09:29:27.982337
721	17	Sasha	boop the snoot	f	\N	2018-05-25 09:29:27.992171	2018-05-25 09:29:27.992171
722	17	Jasper	11/10	f	\N	2018-05-25 09:29:28.002927	2018-05-25 09:29:28.002927
723	17	Brutus	zoom	f	\N	2018-05-25 09:29:28.013166	2018-05-25 09:29:28.013166
724	17	Gracie	zoom	f	\N	2018-05-25 09:29:28.022517	2018-05-25 09:29:28.022517
725	17	Oscar	long boi	f	\N	2018-05-25 09:29:28.030748	2018-05-25 09:29:28.030748
726	17	Teddy	heck no pal	f	\N	2018-05-25 09:29:28.039008	2018-05-25 09:29:28.039008
727	17	Sophie	11/10	f	\N	2018-05-25 09:29:28.047128	2018-05-25 09:29:28.047128
728	17	Rascal	long boi	f	\N	2018-05-25 09:29:28.055431	2018-05-25 09:29:28.055431
729	17	Daisy	zoom	f	\N	2018-05-25 09:29:28.064194	2018-05-25 09:29:28.064194
730	17	Snickers	they're good dogs Brent	f	\N	2018-05-25 09:29:28.071985	2018-05-25 09:29:28.071985
731	17	Diesel	big ol' pupper	f	\N	2018-05-25 09:29:28.080221	2018-05-25 09:29:28.080221
732	17	Cocoa	heck no pal	f	\N	2018-05-25 09:29:28.089333	2018-05-25 09:29:28.089333
733	17	Rosie	mlem	f	\N	2018-05-25 09:29:28.09744	2018-05-25 09:29:28.09744
734	17	Rex	they're good dogs Brent	f	\N	2018-05-25 09:29:28.107355	2018-05-25 09:29:28.107355
735	17	Lilly	long boi	f	\N	2018-05-25 09:29:28.11547	2018-05-25 09:29:28.11547
736	17	Casey	smol pupperino	f	\N	2018-05-25 09:29:28.125193	2018-05-25 09:29:28.125193
737	17	Dixie	11/10	f	\N	2018-05-25 09:29:28.134267	2018-05-25 09:29:28.134267
738	17	Angel	boop the snoot	f	\N	2018-05-25 09:29:28.143592	2018-05-25 09:29:28.143592
739	17	Rex	mlem	f	\N	2018-05-25 09:29:28.151163	2018-05-25 09:29:28.151163
740	17	Dixie	zoom	f	\N	2018-05-25 09:29:28.159383	2018-05-25 09:29:28.159383
741	17	Jack	they're good dogs Brent	f	\N	2018-05-25 09:29:28.167494	2018-05-25 09:29:28.167494
742	17	Rusty	mlem	f	\N	2018-05-25 09:29:28.175597	2018-05-25 09:29:28.175597
743	17	Casey	smol pupperino	f	\N	2018-05-25 09:29:28.184005	2018-05-25 09:29:28.184005
744	17	Honey	heck no pal	f	\N	2018-05-25 09:29:28.191652	2018-05-25 09:29:28.191652
745	17	Tyson	11/10	f	\N	2018-05-25 09:29:28.200519	2018-05-25 09:29:28.200519
746	17	Sam	zoom	f	\N	2018-05-25 09:29:28.209076	2018-05-25 09:29:28.209076
747	17	Belle	heck no pal	f	\N	2018-05-25 09:29:28.218482	2018-05-25 09:29:28.218482
748	17	Sam	big ol' pupper	f	\N	2018-05-25 09:29:28.226989	2018-05-25 09:29:28.226989
749	17	Belle	smol pupperino	f	\N	2018-05-25 09:29:28.235066	2018-05-25 09:29:28.235066
750	17	Snickers	zoom	f	\N	2018-05-25 09:29:28.243248	2018-05-25 09:29:28.243248
751	17	Belle	11/10	f	\N	2018-05-25 09:29:28.251266	2018-05-25 09:29:28.251266
752	17	Pepper	boop the snoot	f	\N	2018-05-25 09:29:28.258691	2018-05-25 09:29:28.258691
753	17	Jasmine	they're good dogs Brent	f	\N	2018-05-25 09:29:28.267102	2018-05-25 09:29:28.267102
754	17	Lucky	long boi	f	\N	2018-05-25 09:29:28.274641	2018-05-25 09:29:28.274641
755	17	Roxy	11/10	f	\N	2018-05-25 09:29:28.282337	2018-05-25 09:29:28.282337
756	17	Ruby	blep	f	\N	2018-05-25 09:29:28.290458	2018-05-25 09:29:28.290458
757	17	Sammy	smol pupperino	f	\N	2018-05-25 09:29:28.298388	2018-05-25 09:29:28.298388
758	17	Tyson	big ol' pupper	f	\N	2018-05-25 09:29:28.305792	2018-05-25 09:29:28.305792
759	17	Bandit	long boi	f	\N	2018-05-25 09:29:28.312417	2018-05-25 09:29:28.312417
760	17	Toby	thicc doggo	f	\N	2018-05-25 09:29:28.319987	2018-05-25 09:29:28.319987
761	17	Marley	big ol' pupper	f	\N	2018-05-25 09:29:28.329075	2018-05-25 09:29:28.329075
762	17	Lola	11/10	f	\N	2018-05-25 09:29:28.33897	2018-05-25 09:29:28.33897
763	17	Sasha	blep	f	\N	2018-05-25 09:29:28.347257	2018-05-25 09:29:28.347257
764	17	Jasper	thicc doggo	f	\N	2018-05-25 09:29:28.355208	2018-05-25 09:29:28.355208
765	17	Ginger	big ol' pupper	f	\N	2018-05-25 09:29:28.363569	2018-05-25 09:29:28.363569
766	17	Blue	thicc doggo	f	\N	2018-05-25 09:29:28.37137	2018-05-25 09:29:28.37137
767	17	Lola	long boi	f	\N	2018-05-25 09:29:28.379187	2018-05-25 09:29:28.379187
768	17	Misty	thicc doggo	f	\N	2018-05-25 09:29:28.387576	2018-05-25 09:29:28.387576
769	18	Murphy	thicc doggo	f	\N	2018-05-25 09:29:28.39677	2018-05-25 09:29:28.39677
770	18	Brutus	11/10	f	\N	2018-05-25 09:29:28.404208	2018-05-25 09:29:28.404208
771	18	Sassy	big ol' pupper	f	\N	2018-05-25 09:29:28.412053	2018-05-25 09:29:28.412053
772	18	Lady	boop the snoot	f	\N	2018-05-25 09:29:28.419062	2018-05-25 09:29:28.419062
773	18	Toby	heck no pal	f	\N	2018-05-25 09:29:28.426143	2018-05-25 09:29:28.426143
774	18	Snickers	smol pupperino	f	\N	2018-05-25 09:29:28.432749	2018-05-25 09:29:28.432749
775	18	Roxie	zoom	f	\N	2018-05-25 09:29:28.440642	2018-05-25 09:29:28.440642
776	18	Max	heck no pal	f	\N	2018-05-25 09:29:28.448933	2018-05-25 09:29:28.448933
777	18	Diesel	blep	f	\N	2018-05-25 09:29:28.457639	2018-05-25 09:29:28.457639
778	18	Buster	heck no pal	f	\N	2018-05-25 09:29:28.465872	2018-05-25 09:29:28.465872
779	18	Angel	smol pupperino	f	\N	2018-05-25 09:29:28.474406	2018-05-25 09:29:28.474406
780	18	Bailey	big ol' pupper	f	\N	2018-05-25 09:29:28.482204	2018-05-25 09:29:28.482204
781	18	Bubba	long boi	f	\N	2018-05-25 09:29:28.489902	2018-05-25 09:29:28.489902
782	18	Charlie	mlem	f	\N	2018-05-25 09:29:28.497512	2018-05-25 09:29:28.497512
783	18	Roxy	thicc doggo	f	\N	2018-05-25 09:29:28.505201	2018-05-25 09:29:28.505201
784	18	Brutus	11/10	f	\N	2018-05-25 09:29:28.513366	2018-05-25 09:29:28.513366
785	18	Missy	smol pupperino	f	\N	2018-05-25 09:29:28.523189	2018-05-25 09:29:28.523189
786	18	Peanut	zoom	f	\N	2018-05-25 09:29:28.532128	2018-05-25 09:29:28.532128
787	18	Cody	smol pupperino	f	\N	2018-05-25 09:29:28.540297	2018-05-25 09:29:28.540297
788	18	Buddy	blep	f	\N	2018-05-25 09:29:28.548389	2018-05-25 09:29:28.548389
789	18	Taz	smol pupperino	f	\N	2018-05-25 09:29:28.55618	2018-05-25 09:29:28.55618
790	18	Honey	boop the snoot	f	\N	2018-05-25 09:29:28.564331	2018-05-25 09:29:28.564331
791	18	Penny	thicc doggo	f	\N	2018-05-25 09:29:28.572245	2018-05-25 09:29:28.572245
792	18	Chloe	heck no pal	f	\N	2018-05-25 09:29:28.580646	2018-05-25 09:29:28.580646
793	18	Cocoa	mlem	f	\N	2018-05-25 09:29:28.589216	2018-05-25 09:29:28.589216
794	18	Snoopy	zoom	f	\N	2018-05-25 09:29:28.597548	2018-05-25 09:29:28.597548
795	18	Chloe	blep	f	\N	2018-05-25 09:29:28.606293	2018-05-25 09:29:28.606293
796	18	Marley	big ol' pupper	f	\N	2018-05-25 09:29:28.613758	2018-05-25 09:29:28.613758
797	18	Oscar	big ol' pupper	f	\N	2018-05-25 09:29:28.622487	2018-05-25 09:29:28.622487
798	18	Lucky	they're good dogs Brent	f	\N	2018-05-25 09:29:28.629973	2018-05-25 09:29:28.629973
799	18	Bear	smol pupperino	f	\N	2018-05-25 09:29:28.638128	2018-05-25 09:29:28.638128
800	18	Charlie	boop the snoot	f	\N	2018-05-25 09:29:28.647344	2018-05-25 09:29:28.647344
801	18	Baby	long boi	f	\N	2018-05-25 09:29:28.658056	2018-05-25 09:29:28.658056
802	18	Diamond	heck no pal	f	\N	2018-05-25 09:29:28.667985	2018-05-25 09:29:28.667985
803	18	Jake	11/10	f	\N	2018-05-25 09:29:28.678497	2018-05-25 09:29:28.678497
804	18	Spike	heck no pal	f	\N	2018-05-25 09:29:28.687	2018-05-25 09:29:28.687
805	18	Belle	zoom	f	\N	2018-05-25 09:29:28.695372	2018-05-25 09:29:28.695372
806	18	Zoey	thicc doggo	f	\N	2018-05-25 09:29:28.704091	2018-05-25 09:29:28.704091
807	18	Gracie	mlem	f	\N	2018-05-25 09:29:28.712463	2018-05-25 09:29:28.712463
808	18	Jasper	boop the snoot	f	\N	2018-05-25 09:29:28.720394	2018-05-25 09:29:28.720394
809	18	Zeus	they're good dogs Brent	f	\N	2018-05-25 09:29:28.728801	2018-05-25 09:29:28.728801
810	18	Luna	thicc doggo	f	\N	2018-05-25 09:29:28.737057	2018-05-25 09:29:28.737057
811	18	Abby	mlem	f	\N	2018-05-25 09:29:28.745195	2018-05-25 09:29:28.745195
812	18	Snickers	thicc doggo	f	\N	2018-05-25 09:29:28.752897	2018-05-25 09:29:28.752897
813	18	Milo	11/10	f	\N	2018-05-25 09:29:28.761094	2018-05-25 09:29:28.761094
814	18	Sassy	smol pupperino	f	\N	2018-05-25 09:29:28.770223	2018-05-25 09:29:28.770223
815	18	Brutus	big ol' pupper	f	\N	2018-05-25 09:29:28.780442	2018-05-25 09:29:28.780442
816	18	Casey	smol pupperino	f	\N	2018-05-25 09:29:28.79066	2018-05-25 09:29:28.79066
817	19	Brutus	long boi	f	\N	2018-05-25 09:29:28.800958	2018-05-25 09:29:28.800958
818	19	Blue	zoom	f	\N	2018-05-25 09:29:28.809183	2018-05-25 09:29:28.809183
819	19	Luna	smol pupperino	f	\N	2018-05-25 09:29:28.817117	2018-05-25 09:29:28.817117
820	19	Cooper	mlem	f	\N	2018-05-25 09:29:28.824757	2018-05-25 09:29:28.824757
821	19	Cocoa	zoom	f	\N	2018-05-25 09:29:28.832348	2018-05-25 09:29:28.832348
822	19	Zoe	big ol' pupper	f	\N	2018-05-25 09:29:28.840101	2018-05-25 09:29:28.840101
823	19	Misty	heck no pal	f	\N	2018-05-25 09:29:28.848124	2018-05-25 09:29:28.848124
824	19	Casey	blep	f	\N	2018-05-25 09:29:28.856254	2018-05-25 09:29:28.856254
825	19	Annie	zoom	f	\N	2018-05-25 09:29:28.864718	2018-05-25 09:29:28.864718
826	19	Annie	they're good dogs Brent	f	\N	2018-05-25 09:29:28.873087	2018-05-25 09:29:28.873087
827	19	Buster	thicc doggo	f	\N	2018-05-25 09:29:28.881159	2018-05-25 09:29:28.881159
828	19	Snickers	smol pupperino	f	\N	2018-05-25 09:29:28.889382	2018-05-25 09:29:28.889382
829	19	Ginger	mlem	f	\N	2018-05-25 09:29:28.897412	2018-05-25 09:29:28.897412
830	19	Oscar	long boi	f	\N	2018-05-25 09:29:28.905251	2018-05-25 09:29:28.905251
831	19	Lady	mlem	f	\N	2018-05-25 09:29:28.913603	2018-05-25 09:29:28.913603
832	19	Sasha	zoom	f	\N	2018-05-25 09:29:28.921955	2018-05-25 09:29:28.921955
833	19	Rex	smol pupperino	f	\N	2018-05-25 09:29:28.930988	2018-05-25 09:29:28.930988
834	19	Lady	blep	f	\N	2018-05-25 09:29:28.939283	2018-05-25 09:29:28.939283
835	19	Precious	blep	f	\N	2018-05-25 09:29:28.94718	2018-05-25 09:29:28.94718
836	19	Coco	zoom	f	\N	2018-05-25 09:29:28.955295	2018-05-25 09:29:28.955295
837	19	Abby	zoom	f	\N	2018-05-25 09:29:28.963895	2018-05-25 09:29:28.963895
838	19	Charlie	they're good dogs Brent	f	\N	2018-05-25 09:29:28.97232	2018-05-25 09:29:28.97232
839	19	Sasha	smol pupperino	f	\N	2018-05-25 09:29:28.980325	2018-05-25 09:29:28.980325
840	19	Roxy	blep	f	\N	2018-05-25 09:29:28.987929	2018-05-25 09:29:28.987929
841	19	Missy	zoom	f	\N	2018-05-25 09:29:28.996611	2018-05-25 09:29:28.996611
842	19	Lola	boop the snoot	f	\N	2018-05-25 09:29:29.006407	2018-05-25 09:29:29.006407
843	19	Gracie	mlem	f	\N	2018-05-25 09:29:29.015261	2018-05-25 09:29:29.015261
844	19	Harley	thicc doggo	f	\N	2018-05-25 09:29:29.024618	2018-05-25 09:29:29.024618
845	19	Chico	zoom	f	\N	2018-05-25 09:29:29.032183	2018-05-25 09:29:29.032183
846	19	Bailey	thicc doggo	f	\N	2018-05-25 09:29:29.039586	2018-05-25 09:29:29.039586
847	19	Rosie	heck no pal	f	\N	2018-05-25 09:29:29.047031	2018-05-25 09:29:29.047031
848	19	Molly	smol pupperino	f	\N	2018-05-25 09:29:29.054703	2018-05-25 09:29:29.054703
849	19	Shelby	heck no pal	f	\N	2018-05-25 09:29:29.06353	2018-05-25 09:29:29.06353
850	19	Sam	zoom	f	\N	2018-05-25 09:29:29.071888	2018-05-25 09:29:29.071888
851	19	Precious	11/10	f	\N	2018-05-25 09:29:29.080321	2018-05-25 09:29:29.080321
852	19	Jasper	long boi	f	\N	2018-05-25 09:29:29.087942	2018-05-25 09:29:29.087942
853	19	Blue	zoom	f	\N	2018-05-25 09:29:29.09589	2018-05-25 09:29:29.09589
854	19	Toby	smol pupperino	f	\N	2018-05-25 09:29:29.105841	2018-05-25 09:29:29.105841
855	19	Teddy	they're good dogs Brent	f	\N	2018-05-25 09:29:29.113879	2018-05-25 09:29:29.113879
856	19	Snickers	11/10	f	\N	2018-05-25 09:29:29.12222	2018-05-25 09:29:29.12222
857	19	Cookie	big ol' pupper	f	\N	2018-05-25 09:29:29.131049	2018-05-25 09:29:29.131049
858	19	Tank	long boi	f	\N	2018-05-25 09:29:29.139328	2018-05-25 09:29:29.139328
859	19	Patches	mlem	f	\N	2018-05-25 09:29:29.14837	2018-05-25 09:29:29.14837
860	19	Coco	long boi	f	\N	2018-05-25 09:29:29.156954	2018-05-25 09:29:29.156954
861	19	Abby	big ol' pupper	f	\N	2018-05-25 09:29:29.165075	2018-05-25 09:29:29.165075
862	19	Chico	they're good dogs Brent	f	\N	2018-05-25 09:29:29.173337	2018-05-25 09:29:29.173337
863	19	Diamond	they're good dogs Brent	f	\N	2018-05-25 09:29:29.181265	2018-05-25 09:29:29.181265
864	19	Bubba	mlem	f	\N	2018-05-25 09:29:29.189075	2018-05-25 09:29:29.189075
865	20	Maggie	big ol' pupper	f	\N	2018-05-25 09:29:29.198575	2018-05-25 09:29:29.198575
866	20	Sadie	11/10	f	\N	2018-05-25 09:29:29.206187	2018-05-25 09:29:29.206187
867	20	Casey	zoom	f	\N	2018-05-25 09:29:29.214067	2018-05-25 09:29:29.214067
868	20	Angel	they're good dogs Brent	f	\N	2018-05-25 09:29:29.222202	2018-05-25 09:29:29.222202
869	20	Milo	they're good dogs Brent	f	\N	2018-05-25 09:29:29.230395	2018-05-25 09:29:29.230395
870	20	Dakota	big ol' pupper	f	\N	2018-05-25 09:29:29.23832	2018-05-25 09:29:29.23832
871	20	Roxie	boop the snoot	f	\N	2018-05-25 09:29:29.24638	2018-05-25 09:29:29.24638
872	20	Bailey	blep	f	\N	2018-05-25 09:29:29.253881	2018-05-25 09:29:29.253881
873	20	Belle	11/10	f	\N	2018-05-25 09:29:29.262295	2018-05-25 09:29:29.262295
874	20	Patches	11/10	f	\N	2018-05-25 09:29:29.270377	2018-05-25 09:29:29.270377
875	20	Precious	11/10	f	\N	2018-05-25 09:29:29.278164	2018-05-25 09:29:29.278164
876	20	Bella	smol pupperino	f	\N	2018-05-25 09:29:29.286235	2018-05-25 09:29:29.286235
877	20	Buster	boop the snoot	f	\N	2018-05-25 09:29:29.294213	2018-05-25 09:29:29.294213
878	20	Belle	big ol' pupper	f	\N	2018-05-25 09:29:29.302399	2018-05-25 09:29:29.302399
879	20	Cooper	big ol' pupper	f	\N	2018-05-25 09:29:29.310129	2018-05-25 09:29:29.310129
880	20	Cody	big ol' pupper	f	\N	2018-05-25 09:29:29.318889	2018-05-25 09:29:29.318889
881	20	Angel	big ol' pupper	f	\N	2018-05-25 09:29:29.328829	2018-05-25 09:29:29.328829
882	20	Lucy	heck no pal	f	\N	2018-05-25 09:29:29.336611	2018-05-25 09:29:29.336611
883	20	Rusty	they're good dogs Brent	f	\N	2018-05-25 09:29:29.345404	2018-05-25 09:29:29.345404
884	20	Snoopy	long boi	f	\N	2018-05-25 09:29:29.354449	2018-05-25 09:29:29.354449
885	20	Bailey	blep	f	\N	2018-05-25 09:29:29.364676	2018-05-25 09:29:29.364676
886	20	Maggie	smol pupperino	f	\N	2018-05-25 09:29:29.374489	2018-05-25 09:29:29.374489
887	20	Max	zoom	f	\N	2018-05-25 09:29:29.382782	2018-05-25 09:29:29.382782
888	20	Sadie	smol pupperino	f	\N	2018-05-25 09:29:29.391307	2018-05-25 09:29:29.391307
889	20	Maggie	blep	f	\N	2018-05-25 09:29:29.400783	2018-05-25 09:29:29.400783
890	20	Milo	thicc doggo	f	\N	2018-05-25 09:29:29.409343	2018-05-25 09:29:29.409343
891	20	Luna	blep	f	\N	2018-05-25 09:29:29.41865	2018-05-25 09:29:29.41865
892	20	Sammy	boop the snoot	f	\N	2018-05-25 09:29:29.426853	2018-05-25 09:29:29.426853
893	20	Angel	heck no pal	f	\N	2018-05-25 09:29:29.434755	2018-05-25 09:29:29.434755
894	20	Sassy	mlem	f	\N	2018-05-25 09:29:29.442842	2018-05-25 09:29:29.442842
895	20	Gracie	blep	f	\N	2018-05-25 09:29:29.450426	2018-05-25 09:29:29.450426
896	20	Annie	they're good dogs Brent	f	\N	2018-05-25 09:29:29.459009	2018-05-25 09:29:29.459009
897	20	Sophie	heck no pal	f	\N	2018-05-25 09:29:29.468463	2018-05-25 09:29:29.468463
898	20	Sophie	zoom	f	\N	2018-05-25 09:29:29.477337	2018-05-25 09:29:29.477337
899	20	Peanut	thicc doggo	f	\N	2018-05-25 09:29:29.485934	2018-05-25 09:29:29.485934
900	20	Diamond	heck no pal	f	\N	2018-05-25 09:29:29.494596	2018-05-25 09:29:29.494596
901	20	Riley	smol pupperino	f	\N	2018-05-25 09:29:29.502385	2018-05-25 09:29:29.502385
902	20	Misty	heck no pal	f	\N	2018-05-25 09:29:29.51008	2018-05-25 09:29:29.51008
903	20	Bubba	long boi	f	\N	2018-05-25 09:29:29.518289	2018-05-25 09:29:29.518289
904	20	Chance	zoom	f	\N	2018-05-25 09:29:29.526547	2018-05-25 09:29:29.526547
905	20	Ruby	zoom	f	\N	2018-05-25 09:29:29.538035	2018-05-25 09:29:29.538035
906	20	Diamond	smol pupperino	f	\N	2018-05-25 09:29:29.548653	2018-05-25 09:29:29.548653
907	20	Tyson	11/10	f	\N	2018-05-25 09:29:29.558969	2018-05-25 09:29:29.558969
908	20	Sassy	heck no pal	f	\N	2018-05-25 09:29:29.569378	2018-05-25 09:29:29.569378
909	20	Missy	mlem	f	\N	2018-05-25 09:29:29.579043	2018-05-25 09:29:29.579043
910	20	Casey	long boi	f	\N	2018-05-25 09:29:29.58881	2018-05-25 09:29:29.58881
911	20	Gizmo	thicc doggo	f	\N	2018-05-25 09:29:29.597926	2018-05-25 09:29:29.597926
912	20	Rocky	big ol' pupper	f	\N	2018-05-25 09:29:29.606591	2018-05-25 09:29:29.606591
913	21	Ginger	mlem	f	\N	2018-05-25 09:29:29.615627	2018-05-25 09:29:29.615627
914	21	Bubba	heck no pal	f	\N	2018-05-25 09:29:29.626175	2018-05-25 09:29:29.626175
915	21	Bella	mlem	f	\N	2018-05-25 09:29:29.634767	2018-05-25 09:29:29.634767
916	21	Casey	blep	f	\N	2018-05-25 09:29:29.643074	2018-05-25 09:29:29.643074
917	21	Pepper	11/10	f	\N	2018-05-25 09:29:29.652122	2018-05-25 09:29:29.652122
918	21	Luna	thicc doggo	f	\N	2018-05-25 09:29:29.661552	2018-05-25 09:29:29.661552
919	21	Taz	mlem	f	\N	2018-05-25 09:29:29.669608	2018-05-25 09:29:29.669608
920	21	Lady	big ol' pupper	f	\N	2018-05-25 09:29:29.677924	2018-05-25 09:29:29.677924
921	21	Maggie	11/10	f	\N	2018-05-25 09:29:29.686623	2018-05-25 09:29:29.686623
922	21	Dixie	11/10	f	\N	2018-05-25 09:29:29.694749	2018-05-25 09:29:29.694749
923	21	Cocoa	blep	f	\N	2018-05-25 09:29:29.702805	2018-05-25 09:29:29.702805
924	21	Shelby	thicc doggo	f	\N	2018-05-25 09:29:29.711548	2018-05-25 09:29:29.711548
925	21	Bandit	big ol' pupper	f	\N	2018-05-25 09:29:29.719694	2018-05-25 09:29:29.719694
926	21	Missy	blep	f	\N	2018-05-25 09:29:29.727675	2018-05-25 09:29:29.727675
927	21	Bandit	boop the snoot	f	\N	2018-05-25 09:29:29.73637	2018-05-25 09:29:29.73637
928	21	Gracie	they're good dogs Brent	f	\N	2018-05-25 09:29:29.745086	2018-05-25 09:29:29.745086
929	21	Tyson	long boi	f	\N	2018-05-25 09:29:29.755029	2018-05-25 09:29:29.755029
930	21	Cooper	big ol' pupper	f	\N	2018-05-25 09:29:29.763107	2018-05-25 09:29:29.763107
931	21	Oreo	blep	f	\N	2018-05-25 09:29:29.770943	2018-05-25 09:29:29.770943
932	21	Abby	blep	f	\N	2018-05-25 09:29:29.778891	2018-05-25 09:29:29.778891
933	21	Precious	smol pupperino	f	\N	2018-05-25 09:29:29.786441	2018-05-25 09:29:29.786441
934	21	Lucky	smol pupperino	f	\N	2018-05-25 09:29:29.794872	2018-05-25 09:29:29.794872
935	21	Charlie	11/10	f	\N	2018-05-25 09:29:29.802724	2018-05-25 09:29:29.802724
936	21	Sparky	big ol' pupper	f	\N	2018-05-25 09:29:29.810509	2018-05-25 09:29:29.810509
937	21	Sandy	11/10	f	\N	2018-05-25 09:29:29.819307	2018-05-25 09:29:29.819307
938	21	Rusty	smol pupperino	f	\N	2018-05-25 09:29:29.827361	2018-05-25 09:29:29.827361
939	21	Zeus	11/10	f	\N	2018-05-25 09:29:29.835062	2018-05-25 09:29:29.835062
940	21	Jack	thicc doggo	f	\N	2018-05-25 09:29:29.843072	2018-05-25 09:29:29.843072
941	21	Ruby	mlem	f	\N	2018-05-25 09:29:29.85092	2018-05-25 09:29:29.85092
942	21	Chloe	thicc doggo	f	\N	2018-05-25 09:29:29.858721	2018-05-25 09:29:29.858721
943	21	Rex	big ol' pupper	f	\N	2018-05-25 09:29:29.867853	2018-05-25 09:29:29.867853
944	21	Zoe	long boi	f	\N	2018-05-25 09:29:29.876236	2018-05-25 09:29:29.876236
945	21	Dakota	mlem	f	\N	2018-05-25 09:29:29.885523	2018-05-25 09:29:29.885523
946	21	Duke	blep	f	\N	2018-05-25 09:29:29.893469	2018-05-25 09:29:29.893469
947	21	Lily	long boi	f	\N	2018-05-25 09:29:29.901236	2018-05-25 09:29:29.901236
948	21	Lilly	11/10	f	\N	2018-05-25 09:29:29.909235	2018-05-25 09:29:29.909235
949	21	Gracie	11/10	f	\N	2018-05-25 09:29:29.917056	2018-05-25 09:29:29.917056
950	21	Rusty	big ol' pupper	f	\N	2018-05-25 09:29:29.926142	2018-05-25 09:29:29.926142
951	21	Sugar	long boi	f	\N	2018-05-25 09:29:29.934557	2018-05-25 09:29:29.934557
952	21	Cody	big ol' pupper	f	\N	2018-05-25 09:29:29.946634	2018-05-25 09:29:29.946634
953	21	Bo	they're good dogs Brent	f	\N	2018-05-25 09:29:29.955504	2018-05-25 09:29:29.955504
954	21	Daisy	big ol' pupper	f	\N	2018-05-25 09:29:29.962932	2018-05-25 09:29:29.962932
955	21	Zoe	big ol' pupper	f	\N	2018-05-25 09:29:29.971904	2018-05-25 09:29:29.971904
956	21	Ruby	long boi	f	\N	2018-05-25 09:29:29.980423	2018-05-25 09:29:29.980423
957	21	Roxy	thicc doggo	f	\N	2018-05-25 09:29:29.991649	2018-05-25 09:29:29.991649
958	21	Sparky	blep	f	\N	2018-05-25 09:29:30.001004	2018-05-25 09:29:30.001004
959	21	Precious	boop the snoot	f	\N	2018-05-25 09:29:30.009158	2018-05-25 09:29:30.009158
960	21	Misty	big ol' pupper	f	\N	2018-05-25 09:29:30.017505	2018-05-25 09:29:30.017505
961	23	Missy	dense, chewy, white grape, leathery, lemonade	f	\N	2018-05-25 09:29:30.027489	2018-05-25 09:29:30.027489
962	23	Smokey	clean, velvety, carbon, golden raisin, bakers chocolate	f	\N	2018-05-25 09:29:30.03407	2018-05-25 09:29:30.03407
963	23	Misty	astringent, velvety, raisin, rubber, bittersweet chocolate	f	\N	2018-05-25 09:29:30.041838	2018-05-25 09:29:30.041838
964	23	Misty	soft, full, tangerine, raspberry, barley	f	\N	2018-05-25 09:29:30.049511	2018-05-25 09:29:30.049511
965	23	Oliver	juicy, silky, soil, burnt sugar, sweet pea	f	\N	2018-05-25 09:29:30.055576	2018-05-25 09:29:30.055576
966	23	Lily	juicy, big, strawberry, grassy, lemon verbena	f	\N	2018-05-25 09:29:30.063017	2018-05-25 09:29:30.063017
967	23	Alfie	faint, syrupy, raisin, nectarine, tangerine	f	\N	2018-05-25 09:29:30.070494	2018-05-25 09:29:30.070494
968	23	Millie	clean, smooth, green-tea, vanilla, potato defect!	f	\N	2018-05-25 09:29:30.077212	2018-05-25 09:29:30.077212
969	23	Charlie	dense, syrupy, green-tea, corriander, snow pea	f	\N	2018-05-25 09:29:30.083872	2018-05-25 09:29:30.083872
970	23	Simba	clean, slick, fresh bread, corriander, cashew	f	\N	2018-05-25 09:29:30.090836	2018-05-25 09:29:30.090836
971	23	Smokey	clean, velvety, figs, passion fruit, curry	f	\N	2018-05-25 09:29:30.096877	2018-05-25 09:29:30.096877
972	23	Smudge	unbalanced, slick, snow pea, molasses, star fruit	f	\N	2018-05-25 09:29:30.105451	2018-05-25 09:29:30.105451
973	24	Misty	dry, round, molasses, white pepper, nectarine	f	\N	2018-05-25 09:29:30.113625	2018-05-25 09:29:30.113625
974	24	Lily	delicate, tea-like, star fruit, honeysuckle, honeydew	f	\N	2018-05-25 09:29:30.11965	2018-05-25 09:29:30.11965
975	24	Oliver	unbalanced, creamy, graham cracker, sundried tomato, dill	f	\N	2018-05-25 09:29:30.126224	2018-05-25 09:29:30.126224
976	24	Millie	dirty, slick, blueberry, cream, rose hips	f	\N	2018-05-25 09:29:30.132678	2018-05-25 09:29:30.132678
977	24	Sooty	juicy, smooth, cantaloupe, fresh wood, tomato	f	\N	2018-05-25 09:29:30.138917	2018-05-25 09:29:30.138917
978	24	Molly	crisp, slick, red grape, quakery, grassy	f	\N	2018-05-25 09:29:30.145175	2018-05-25 09:29:30.145175
979	24	Sooty	crisp, syrupy, hay, mint, black pepper	f	\N	2018-05-25 09:29:30.153178	2018-05-25 09:29:30.153178
980	24	Lily	juicy, coating, quakery, smokey, maple syrup	f	\N	2018-05-25 09:29:30.161791	2018-05-25 09:29:30.161791
981	24	Simba	crisp, smooth, cashew, mint, banana	f	\N	2018-05-25 09:29:30.169966	2018-05-25 09:29:30.169966
982	24	Sooty	balanced, smooth, musty, red currant, dates	f	\N	2018-05-25 09:29:30.178464	2018-05-25 09:29:30.178464
983	24	Jasper	astringent, syrupy, honeydew, green pepper, orange	f	\N	2018-05-25 09:29:30.186723	2018-05-25 09:29:30.186723
984	24	Daisy	dirty, coating, lemon, prune, medicinal	f	\N	2018-05-25 09:29:30.195111	2018-05-25 09:29:30.195111
985	25	Daisy	balanced, coating, star fruit, marzipan, white grape	f	\N	2018-05-25 09:29:30.204106	2018-05-25 09:29:30.204106
986	25	Oscar	clean, creamy, cream, prune, honeysuckle	f	\N	2018-05-25 09:29:30.211826	2018-05-25 09:29:30.211826
987	25	Oscar	lingering, juicy, rubber, mushroom, white grape	f	\N	2018-05-25 09:29:30.219737	2018-05-25 09:29:30.219737
988	25	Alfie	wild, juicy, vanilla, cherry, mint	f	\N	2018-05-25 09:29:30.22705	2018-05-25 09:29:30.22705
989	25	Max	sharp, velvety, cashew, lime, lavender	f	\N	2018-05-25 09:29:30.234664	2018-05-25 09:29:30.234664
990	25	Smudge	juicy, smooth, black cherry, raspberry, green pepper	f	\N	2018-05-25 09:29:30.243116	2018-05-25 09:29:30.243116
991	25	Sam	balanced, big, dill, marzipan, papaya	f	\N	2018-05-25 09:29:30.251824	2018-05-25 09:29:30.251824
992	25	Charlie	mild, silky, lime, soy sauce, sugar cane	f	\N	2018-05-25 09:29:30.259932	2018-05-25 09:29:30.259932
993	25	Missy	wild, creamy, sage, maple syrup, honey	f	\N	2018-05-25 09:29:30.267784	2018-05-25 09:29:30.267784
994	25	Jasper	quick, chewy, sundried tomato, star fruit, medicinal	f	\N	2018-05-25 09:29:30.274755	2018-05-25 09:29:30.274755
995	25	Jasper	clean, chewy, papaya, corriander, mandarin	f	\N	2018-05-25 09:29:30.281507	2018-05-25 09:29:30.281507
996	25	Coco	soft, watery, musty, mango, baggy	f	\N	2018-05-25 09:29:30.287903	2018-05-25 09:29:30.287903
997	26	Simba	clean, watery, nectarine, leafy greens, hay	f	\N	2018-05-25 09:29:30.295178	2018-05-25 09:29:30.295178
998	26	Oscar	deep, slick, corriander, cinnamon, black-tea	f	\N	2018-05-25 09:29:30.301664	2018-05-25 09:29:30.301664
999	26	Bella	deep, smooth, cranberry, leafy greens, bakers chocolate	f	\N	2018-05-25 09:29:30.308631	2018-05-25 09:29:30.308631
1000	26	Lucy	muted, slick, tangerine, soy sauce, honey	f	\N	2018-05-25 09:29:30.314924	2018-05-25 09:29:30.314924
1001	26	Lucy	complex, velvety, cola, hazelnut, cantaloupe	f	\N	2018-05-25 09:29:30.322052	2018-05-25 09:29:30.322052
1002	26	Lucky	unbalanced, smooth, tobacco, red grape, golden raisin	f	\N	2018-05-25 09:29:30.328503	2018-05-25 09:29:30.328503
1003	26	Sooty	dull, smooth, ginger, nutmeg, honeydew	f	\N	2018-05-25 09:29:30.335255	2018-05-25 09:29:30.335255
1004	26	Molly	mild, syrupy, cacao nibs, potato defect!, orange	f	\N	2018-05-25 09:29:30.34115	2018-05-25 09:29:30.34115
1005	26	Max	balanced, syrupy, plum, tamarind, granola	f	\N	2018-05-25 09:29:30.347541	2018-05-25 09:29:30.347541
1006	26	Simba	pointed, slick, hay, maple syrup, quakery	f	\N	2018-05-25 09:29:30.354259	2018-05-25 09:29:30.354259
1007	26	Tiger	dull, big, hazelnut, hibiscus, green pepper	f	\N	2018-05-25 09:29:30.361384	2018-05-25 09:29:30.361384
1008	26	Angel	muted, coating, snow pea, barley, red currant	f	\N	2018-05-25 09:29:30.367693	2018-05-25 09:29:30.367693
1009	27	Millie	unbalanced, smooth, brown sugar, quakery, burnt sugar	f	\N	2018-05-25 09:29:30.374775	2018-05-25 09:29:30.374775
1010	27	Tiger	dense, tea-like, black-tea, dates, orange blossom	f	\N	2018-05-25 09:29:30.380989	2018-05-25 09:29:30.380989
1011	27	Max	muted, smooth, vanilla, hops, soil	f	\N	2018-05-25 09:29:30.388145	2018-05-25 09:29:30.388145
1012	27	Lily	dry, smooth, orange, raspberry, baggy	f	\N	2018-05-25 09:29:30.395864	2018-05-25 09:29:30.395864
1013	27	Sam	sharp, coating, clove, honeydew, hazelnut	f	\N	2018-05-25 09:29:30.402324	2018-05-25 09:29:30.402324
1014	27	Sam	balanced, silky, apricot, mushroom, snow pea	f	\N	2018-05-25 09:29:30.409	2018-05-25 09:29:30.409
1015	27	Chloe	faint, slick, bergamot, green grape, liquorice	f	\N	2018-05-25 09:29:30.415794	2018-05-25 09:29:30.415794
1016	27	Jasper	structured, juicy, grassy, raspberry, mint	f	\N	2018-05-25 09:29:30.421866	2018-05-25 09:29:30.421866
1017	27	Poppy	vibrant, smooth, nutmeg, corriander, passion fruit	f	\N	2018-05-25 09:29:30.428092	2018-05-25 09:29:30.428092
1018	27	Angel	dirty, chewy, meyer lemon, nutmeg, honeydew	f	\N	2018-05-25 09:29:30.433882	2018-05-25 09:29:30.433882
1019	27	Smokey	muted, silky, clementine, banana, kiwi	f	\N	2018-05-25 09:29:30.440295	2018-05-25 09:29:30.440295
1020	27	Smudge	delicate, creamy, cinnamon, corriander, ginger	f	\N	2018-05-25 09:29:30.447156	2018-05-25 09:29:30.447156
1021	28	Sooty	dull, watery, sundried tomato, graham cracker, quakery	f	\N	2018-05-25 09:29:30.453746	2018-05-25 09:29:30.453746
1022	28	Millie	bright, coating, mint, black pepper, watermelon	f	\N	2018-05-25 09:29:30.459788	2018-05-25 09:29:30.459788
1023	28	Chloe	soft, slick, star fruit, honey, tobacco	f	\N	2018-05-25 09:29:30.466604	2018-05-25 09:29:30.466604
1024	28	Missy	lingering, round, olive, mandarin, papaya	f	\N	2018-05-25 09:29:30.472706	2018-05-25 09:29:30.472706
1025	28	Smudge	deep, juicy, cream, black pepper, wheat	f	\N	2018-05-25 09:29:30.478972	2018-05-25 09:29:30.478972
1026	28	Tiger	faint, syrupy, mushroom, tangerine, honeysuckle	f	\N	2018-05-25 09:29:30.48513	2018-05-25 09:29:30.48513
1027	28	Oscar	lingering, big, molasses, marzipan, red currant	f	\N	2018-05-25 09:29:30.491763	2018-05-25 09:29:30.491763
1028	28	Oscar	mild, creamy, lime, soil, peanut	f	\N	2018-05-25 09:29:30.498394	2018-05-25 09:29:30.498394
1029	28	Lucky	mild, watery, lychee, cacao nibs, lemongrass	f	\N	2018-05-25 09:29:30.504797	2018-05-25 09:29:30.504797
1030	28	Jasper	dry, syrupy, tobacco, white grape, plum	f	\N	2018-05-25 09:29:30.510829	2018-05-25 09:29:30.510829
1031	28	Sam	mild, velvety, dill, black cherry, passion fruit	f	\N	2018-05-25 09:29:30.517047	2018-05-25 09:29:30.517047
1032	28	Missy	astringent, round, olive, red currant, green-tea	f	\N	2018-05-25 09:29:30.523082	2018-05-25 09:29:30.523082
1033	29	Daisy	mild, juicy, magnolia, granola, leathery	f	\N	2018-05-25 09:29:30.530253	2018-05-25 09:29:30.530253
1034	29	Max	mild, velvety, milk chocolate, cashew, walnut	f	\N	2018-05-25 09:29:30.536505	2018-05-25 09:29:30.536505
1035	29	Chloe	bright, big, cola, pecan, bittersweet chocolate	f	\N	2018-05-25 09:29:30.542284	2018-05-25 09:29:30.542284
1036	29	Angel	sharp, round, lemonade, ginger, peach	f	\N	2018-05-25 09:29:30.548079	2018-05-25 09:29:30.548079
1037	29	Smudge	unbalanced, coating, bakers chocolate, pineapple, banana	f	\N	2018-05-25 09:29:30.554499	2018-05-25 09:29:30.554499
1038	29	Shadow	vibrant, coating, nutella, pecan, concord grape	f	\N	2018-05-25 09:29:30.560705	2018-05-25 09:29:30.560705
1039	29	Sam	dry, syrupy, meyer lemon, lychee, squash	f	\N	2018-05-25 09:29:30.567539	2018-05-25 09:29:30.567539
1040	29	Tiger	dry, chewy, olive, butter, green-tea	f	\N	2018-05-25 09:29:30.573853	2018-05-25 09:29:30.573853
1041	29	Bella	complex, syrupy, red currant, orange creamsicle, lemon verbena	f	\N	2018-05-25 09:29:30.580962	2018-05-25 09:29:30.580962
1042	29	Lily	muted, syrupy, orange creamsicle, marzipan, coconut	f	\N	2018-05-25 09:29:30.588657	2018-05-25 09:29:30.588657
1043	29	Simba	vibrant, round, tomato, nutmeg, nutella	f	\N	2018-05-25 09:29:30.596607	2018-05-25 09:29:30.596607
1044	29	Charlie	wild, chewy, hibiscus, baggy, bakers chocolate	f	\N	2018-05-25 09:29:30.604141	2018-05-25 09:29:30.604141
1045	30	Max	deep, syrupy, musty, corriander, soy sauce	f	\N	2018-05-25 09:29:30.611441	2018-05-25 09:29:30.611441
1046	30	Millie	clean, full, baggy, green apple, nutella	f	\N	2018-05-25 09:29:30.617659	2018-05-25 09:29:30.617659
1047	30	Misty	rounded, smooth, black pepper, dates, banana	f	\N	2018-05-25 09:29:30.624761	2018-05-25 09:29:30.624761
1048	30	Molly	structured, coating, bakers chocolate, cherry, red apple	f	\N	2018-05-25 09:29:30.631014	2018-05-25 09:29:30.631014
1049	30	Daisy	dull, watery, leathery, nutmeg, cedar	f	\N	2018-05-25 09:29:30.637227	2018-05-25 09:29:30.637227
1050	30	Smokey	clean, chewy, honey, orange creamsicle, walnut	f	\N	2018-05-25 09:29:30.644011	2018-05-25 09:29:30.644011
1051	30	Shadow	dense, full, blueberry, cola, snow pea	f	\N	2018-05-25 09:29:30.650625	2018-05-25 09:29:30.650625
1052	30	Milo	lingering, smooth, star fruit, ginger, corriander	f	\N	2018-05-25 09:29:30.657896	2018-05-25 09:29:30.657896
1053	30	Lucy	lingering, coating, green apple, star fruit, snow pea	f	\N	2018-05-25 09:29:30.664174	2018-05-25 09:29:30.664174
1054	30	Alfie	pointed, slick, strawberry, tamarind, raspberry	f	\N	2018-05-25 09:29:30.67047	2018-05-25 09:29:30.67047
1055	30	Lucy	muted, syrupy, orange, curry, orange	f	\N	2018-05-25 09:29:30.677154	2018-05-25 09:29:30.677154
1056	30	Oliver	complex, velvety, hibiscus, rubber, plum	f	\N	2018-05-25 09:29:30.683571	2018-05-25 09:29:30.683571
1057	31	Felix	tart, watery, dill, cantaloupe, quakery	f	\N	2018-05-25 09:29:30.69081	2018-05-25 09:29:30.69081
1058	31	Alfie	mild, full, tobacco, banana, black pepper	f	\N	2018-05-25 09:29:30.697394	2018-05-25 09:29:30.697394
1059	31	Tiger	mild, tea-like, star fruit, star fruit, golden raisin	f	\N	2018-05-25 09:29:30.703387	2018-05-25 09:29:30.703387
1060	31	Charlie	clean, silky, cola, curry, soil	f	\N	2018-05-25 09:29:30.709957	2018-05-25 09:29:30.709957
1061	31	Sam	dirty, smooth, watermelon, walnut, blueberry	f	\N	2018-05-25 09:29:30.716325	2018-05-25 09:29:30.716325
1062	31	Bella	dull, syrupy, soy sauce, mushroom, black-tea	f	\N	2018-05-25 09:29:30.722541	2018-05-25 09:29:30.722541
1063	31	Lucy	tart, tea-like, mandarin, musty, papaya	f	\N	2018-05-25 09:29:30.730744	2018-05-25 09:29:30.730744
1064	31	Poppy	delicate, creamy, plum, peach, green pepper	f	\N	2018-05-25 09:29:30.738767	2018-05-25 09:29:30.738767
1065	31	Jasper	dry, creamy, almond, sweet pea, cherry	f	\N	2018-05-25 09:29:30.747218	2018-05-25 09:29:30.747218
1066	31	Charlie	dirty, smooth, mango, star fruit, orange creamsicle	f	\N	2018-05-25 09:29:30.754355	2018-05-25 09:29:30.754355
1067	31	Shadow	faint, full, white grape, lime, rubber	f	\N	2018-05-25 09:29:30.761752	2018-05-25 09:29:30.761752
1068	31	Misty	lingering, watery, black currant, baggy, fresh wood	f	\N	2018-05-25 09:29:30.768672	2018-05-25 09:29:30.768672
1069	32	Charlie	juicy, big, golden raisin, hops, black currant	f	\N	2018-05-25 09:29:30.776737	2018-05-25 09:29:30.776737
1070	32	Molly	juicy, round, squash, soil, potato defect!	f	\N	2018-05-25 09:29:30.783872	2018-05-25 09:29:30.783872
1071	32	Millie	complex, juicy, tangerine, passion fruit, green-tea	f	\N	2018-05-25 09:29:30.791384	2018-05-25 09:29:30.791384
1072	32	Angel	delicate, juicy, corriander, cedar, bittersweet chocolate	f	\N	2018-05-25 09:29:30.797997	2018-05-25 09:29:30.797997
1073	32	Misty	quick, juicy, peach, dates, cream	f	\N	2018-05-25 09:29:30.804144	2018-05-25 09:29:30.804144
1074	32	Bella	balanced, watery, star fruit, pecan, maple syrup	f	\N	2018-05-25 09:29:30.810351	2018-05-25 09:29:30.810351
1075	32	Oliver	dry, syrupy, kiwi, marshmallow, sugar cane	f	\N	2018-05-25 09:29:30.816945	2018-05-25 09:29:30.816945
1076	32	Milo	vibrant, round, mango, green apple, lemon	f	\N	2018-05-25 09:29:30.822859	2018-05-25 09:29:30.822859
1077	32	Oscar	vibrant, slick, honeysuckle, toast, wheat	f	\N	2018-05-25 09:29:30.829033	2018-05-25 09:29:30.829033
1078	32	Poppy	mild, silky, blueberry, bakers chocolate, quakery	f	\N	2018-05-25 09:29:30.835157	2018-05-25 09:29:30.835157
1079	32	Lucky	structured, watery, sundried tomato, mandarin, cherry	f	\N	2018-05-25 09:29:30.841503	2018-05-25 09:29:30.841503
1080	32	Jasper	crisp, tea-like, molasses, grapefruit, potato defect!	f	\N	2018-05-25 09:29:30.847939	2018-05-25 09:29:30.847939
1081	33	Missy	pointed, slick, snow pea, almond, maple syrup	f	\N	2018-05-25 09:29:30.855197	2018-05-25 09:29:30.855197
1082	33	Coco	unbalanced, silky, honeysuckle, red apple, honeydew	f	\N	2018-05-25 09:29:30.862323	2018-05-25 09:29:30.862323
1083	33	Felix	muted, chewy, lemongrass, raspberry, sundried tomato	f	\N	2018-05-25 09:29:30.868607	2018-05-25 09:29:30.868607
1084	33	Bella	bright, slick, red apple, cola, green-tea	f	\N	2018-05-25 09:29:30.874855	2018-05-25 09:29:30.874855
1085	33	Coco	juicy, coating, mint, toast, hay	f	\N	2018-05-25 09:29:30.880861	2018-05-25 09:29:30.880861
1086	33	Shadow	rounded, chewy, honeydew, milk chocolate, green grape	f	\N	2018-05-25 09:29:30.886983	2018-05-25 09:29:30.886983
1087	33	Daisy	clean, full, watermelon, carmel, cranberry	f	\N	2018-05-25 09:29:30.894687	2018-05-25 09:29:30.894687
1088	33	Missy	complex, coating, leathery, black-tea, black cherry	f	\N	2018-05-25 09:29:30.901686	2018-05-25 09:29:30.901686
1089	33	Oliver	clean, velvety, cocoa powder, mango, cashew	f	\N	2018-05-25 09:29:30.909034	2018-05-25 09:29:30.909034
1090	33	Lucy	structured, creamy, cinnamon, tomato, olive	f	\N	2018-05-25 09:29:30.917056	2018-05-25 09:29:30.917056
1091	33	Bella	unbalanced, tea-like, passion fruit, pecan, nectarine	f	\N	2018-05-25 09:29:30.92477	2018-05-25 09:29:30.92477
1092	33	Charlie	lingering, chewy, granola, star fruit, baggy	f	\N	2018-05-25 09:29:30.931995	2018-05-25 09:29:30.931995
1093	34	Simba	balanced, coating, papaya, star fruit, white grape	f	\N	2018-05-25 09:29:30.939144	2018-05-25 09:29:30.939144
1094	34	Jasper	deep, smooth, mushroom, black currant, milk chocolate	f	\N	2018-05-25 09:29:30.945908	2018-05-25 09:29:30.945908
1095	34	Lucky	complex, syrupy, hazelnut, sugar cane, brown sugar	f	\N	2018-05-25 09:29:30.952109	2018-05-25 09:29:30.952109
1096	34	Shadow	quick, silky, curry, honey, raisin	f	\N	2018-05-25 09:29:30.958809	2018-05-25 09:29:30.958809
1097	34	Daisy	clean, syrupy, tomato, star fruit, lemon	f	\N	2018-05-25 09:29:30.966414	2018-05-25 09:29:30.966414
1098	34	Lucky	astringent, tea-like, medicinal, almond, cola	f	\N	2018-05-25 09:29:30.974515	2018-05-25 09:29:30.974515
1099	34	Max	lingering, coating, plum, raspberry, nougat	f	\N	2018-05-25 09:29:30.98251	2018-05-25 09:29:30.98251
1100	34	Milo	bright, silky, liquorice, sage, hazelnut	f	\N	2018-05-25 09:29:30.990644	2018-05-25 09:29:30.990644
1101	34	Oscar	quick, smooth, red grape, granola, milk chocolate	f	\N	2018-05-25 09:29:30.998184	2018-05-25 09:29:30.998184
1102	34	Max	structured, coating, musty, wheat, blueberry	f	\N	2018-05-25 09:29:31.00626	2018-05-25 09:29:31.00626
1103	34	Tiger	dirty, juicy, kiwi, magnolia, lychee	f	\N	2018-05-25 09:29:31.013558	2018-05-25 09:29:31.013558
1104	34	Max	unbalanced, round, lemongrass, cola, blueberry	f	\N	2018-05-25 09:29:31.019831	2018-05-25 09:29:31.019831
1105	35	Felix	unbalanced, chewy, cedar, figs, mushroom	f	\N	2018-05-25 09:29:31.028024	2018-05-25 09:29:31.028024
1106	35	Charlie	bright, coating, cinnamon, honeysuckle, red grape	f	\N	2018-05-25 09:29:31.035181	2018-05-25 09:29:31.035181
1107	35	Lily	pointed, juicy, hay, milk chocolate, red apple	f	\N	2018-05-25 09:29:31.044788	2018-05-25 09:29:31.044788
1108	35	Lucy	dull, tea-like, passion fruit, walnut, cantaloupe	f	\N	2018-05-25 09:29:31.056456	2018-05-25 09:29:31.056456
1109	35	Lucy	balanced, tea-like, magnolia, golden raisin, black pepper	f	\N	2018-05-25 09:29:31.065757	2018-05-25 09:29:31.065757
1110	35	Oscar	quick, creamy, tobacco, orange, meyer lemon	f	\N	2018-05-25 09:29:31.073363	2018-05-25 09:29:31.073363
1111	35	Lily	lingering, smooth, raisin, sweet pea, black cherry	f	\N	2018-05-25 09:29:31.082145	2018-05-25 09:29:31.082145
1112	35	Bella	astringent, full, orange creamsicle, medicinal, magnolia	f	\N	2018-05-25 09:29:31.088771	2018-05-25 09:29:31.088771
1113	35	Simba	muted, tea-like, figs, tobacco, liquorice	f	\N	2018-05-25 09:29:31.09688	2018-05-25 09:29:31.09688
1114	35	Bella	sharp, big, golden raisin, grassy, liquorice	f	\N	2018-05-25 09:29:31.105987	2018-05-25 09:29:31.105987
1115	35	Alfie	tart, watery, molasses, green-tea, orange creamsicle	f	\N	2018-05-25 09:29:31.113597	2018-05-25 09:29:31.113597
1116	35	Tiger	bright, syrupy, red apple, nutmeg, soy sauce	f	\N	2018-05-25 09:29:31.120171	2018-05-25 09:29:31.120171
1117	36	Jasper	unbalanced, chewy, carbon, concord grape, red grape	f	\N	2018-05-25 09:29:31.128823	2018-05-25 09:29:31.128823
1118	36	Lucy	dirty, watery, baggy, cinnamon, black currant	f	\N	2018-05-25 09:29:31.135534	2018-05-25 09:29:31.135534
1119	36	Bella	lingering, big, vanilla, toast, rubber	f	\N	2018-05-25 09:29:31.142029	2018-05-25 09:29:31.142029
1120	36	Felix	complex, full, green apple, coconut, honeydew	f	\N	2018-05-25 09:29:31.148539	2018-05-25 09:29:31.148539
1121	36	Max	faint, silky, tangerine, cinnamon, corriander	f	\N	2018-05-25 09:29:31.155979	2018-05-25 09:29:31.155979
1122	36	Poppy	pointed, big, lemongrass, red apple, mandarin	f	\N	2018-05-25 09:29:31.162916	2018-05-25 09:29:31.162916
1123	36	Tiger	deep, smooth, clove, ginger, rye	f	\N	2018-05-25 09:29:31.169899	2018-05-25 09:29:31.169899
1124	36	Tiger	lingering, coating, musty, cacao nibs, kiwi	f	\N	2018-05-25 09:29:31.177423	2018-05-25 09:29:31.177423
1125	36	Tiger	structured, chewy, magnolia, milk chocolate, green pepper	f	\N	2018-05-25 09:29:31.183345	2018-05-25 09:29:31.183345
1126	36	Tiger	tart, round, cedar, cola, burnt sugar	f	\N	2018-05-25 09:29:31.189433	2018-05-25 09:29:31.189433
1127	36	Bella	dirty, slick, cranberry, brown sugar, bakers chocolate	f	\N	2018-05-25 09:29:31.195915	2018-05-25 09:29:31.195915
1128	36	Oliver	dense, watery, papaya, concord grape, carbon	f	\N	2018-05-25 09:29:31.20188	2018-05-25 09:29:31.20188
1129	37	Angel	dense, slick, apricot, dill, cedar	f	\N	2018-05-25 09:29:31.209095	2018-05-25 09:29:31.209095
1130	37	Missy	tart, smooth, blueberry, vanilla, lychee	f	\N	2018-05-25 09:29:31.215159	2018-05-25 09:29:31.215159
1131	37	Chloe	crisp, big, papaya, hibiscus, musty	f	\N	2018-05-25 09:29:31.220906	2018-05-25 09:29:31.220906
1132	37	Alfie	delicate, chewy, black-tea, lemon, vanilla	f	\N	2018-05-25 09:29:31.227909	2018-05-25 09:29:31.227909
1133	37	Sooty	astringent, big, white pepper, sage, cacao nibs	f	\N	2018-05-25 09:29:31.234342	2018-05-25 09:29:31.234342
1134	37	Felix	clean, big, lychee, rye, black pepper	f	\N	2018-05-25 09:29:31.240617	2018-05-25 09:29:31.240617
1135	37	Daisy	rounded, tea-like, orange creamsicle, cashew, tomato	f	\N	2018-05-25 09:29:31.247735	2018-05-25 09:29:31.247735
1136	37	Lucy	pointed, coating, bakers chocolate, liquorice, graham cracker	f	\N	2018-05-25 09:29:31.253642	2018-05-25 09:29:31.253642
1137	37	Max	dry, velvety, marshmallow, apricot, soil	f	\N	2018-05-25 09:29:31.26051	2018-05-25 09:29:31.26051
1138	37	Poppy	juicy, chewy, jasmine, grassy, sundried tomato	f	\N	2018-05-25 09:29:31.267039	2018-05-25 09:29:31.267039
1139	37	Felix	quick, velvety, lychee, cocoa powder, golden raisin	f	\N	2018-05-25 09:29:31.273203	2018-05-25 09:29:31.273203
1140	37	Oliver	deep, velvety, olive, grassy, orange blossom	f	\N	2018-05-25 09:29:31.279848	2018-05-25 09:29:31.279848
1141	38	Missy	dirty, slick, lemonade, blueberry, pecan	f	\N	2018-05-25 09:29:31.287065	2018-05-25 09:29:31.287065
1142	38	Alfie	balanced, velvety, marshmallow, honeydew, vanilla	f	\N	2018-05-25 09:29:31.293834	2018-05-25 09:29:31.293834
1143	38	Chloe	lingering, full, white pepper, grassy, rose hips	f	\N	2018-05-25 09:29:31.30022	2018-05-25 09:29:31.30022
1144	38	Molly	structured, velvety, plum, lemongrass, red currant	f	\N	2018-05-25 09:29:31.30616	2018-05-25 09:29:31.30616
1145	38	Sooty	sharp, silky, honeydew, lemonade, sundried tomato	f	\N	2018-05-25 09:29:31.312911	2018-05-25 09:29:31.312911
1146	38	Chloe	dense, juicy, passion fruit, baggy, toast	f	\N	2018-05-25 09:29:31.319137	2018-05-25 09:29:31.319137
1147	38	Misty	dull, coating, soy sauce, cinnamon, sundried tomato	f	\N	2018-05-25 09:29:31.326171	2018-05-25 09:29:31.326171
1148	38	Chloe	astringent, smooth, star fruit, grapefruit, red currant	f	\N	2018-05-25 09:29:31.333035	2018-05-25 09:29:31.333035
1149	38	Smudge	complex, creamy, cantaloupe, baggy, fresh bread	f	\N	2018-05-25 09:29:31.338959	2018-05-25 09:29:31.338959
1150	38	Angel	deep, smooth, orange creamsicle, orange, tobacco	f	\N	2018-05-25 09:29:31.345413	2018-05-25 09:29:31.345413
1151	38	Sam	faint, chewy, walnut, hibiscus, nougat	f	\N	2018-05-25 09:29:31.351494	2018-05-25 09:29:31.351494
1152	38	Smokey	unbalanced, watery, baggy, raisin, marshmallow	f	\N	2018-05-25 09:29:31.358243	2018-05-25 09:29:31.358243
1153	39	Angel	juicy, round, apricot, granola, hibiscus	f	\N	2018-05-25 09:29:31.36536	2018-05-25 09:29:31.36536
1154	39	Sooty	lingering, silky, magnolia, tomato, butter	f	\N	2018-05-25 09:29:31.371422	2018-05-25 09:29:31.371422
1155	39	Felix	rounded, full, red apple, brown sugar, rye	f	\N	2018-05-25 09:29:31.378743	2018-05-25 09:29:31.378743
1156	39	Daisy	mild, watery, cola, nutella, black cherry	f	\N	2018-05-25 09:29:31.38988	2018-05-25 09:29:31.38988
1157	39	Shadow	juicy, juicy, kiwi, cream, cranberry	f	\N	2018-05-25 09:29:31.399939	2018-05-25 09:29:31.399939
1158	39	Daisy	balanced, creamy, grassy, cream, cinnamon	f	\N	2018-05-25 09:29:31.409797	2018-05-25 09:29:31.409797
1159	39	Daisy	astringent, syrupy, almond, peanut, peach	f	\N	2018-05-25 09:29:31.419626	2018-05-25 09:29:31.419626
1160	39	Felix	lingering, round, honeydew, golden raisin, sage	f	\N	2018-05-25 09:29:31.429674	2018-05-25 09:29:31.429674
1161	39	Molly	soft, syrupy, butter, medicinal, grapefruit	f	\N	2018-05-25 09:29:31.439137	2018-05-25 09:29:31.439137
1162	39	Poppy	sharp, full, corriander, coconut, cream	f	\N	2018-05-25 09:29:31.447955	2018-05-25 09:29:31.447955
1163	39	Coco	dull, smooth, lemon, granola, barley	f	\N	2018-05-25 09:29:31.456752	2018-05-25 09:29:31.456752
1164	39	Smudge	juicy, chewy, lychee, cola, green apple	f	\N	2018-05-25 09:29:31.466804	2018-05-25 09:29:31.466804
1165	40	Coco	clean, coating, apricot, banana, liquorice	f	\N	2018-05-25 09:29:31.479149	2018-05-25 09:29:31.479149
1166	40	Sooty	dense, watery, cola, peach, fresh bread	f	\N	2018-05-25 09:29:31.487916	2018-05-25 09:29:31.487916
1167	40	Tiger	complex, velvety, papaya, dill, honeysuckle	f	\N	2018-05-25 09:29:31.498131	2018-05-25 09:29:31.498131
1168	40	Charlie	soft, creamy, clementine, clementine, hibiscus	f	\N	2018-05-25 09:29:31.508757	2018-05-25 09:29:31.508757
1169	40	Daisy	delicate, big, rose hips, baggy, magnolia	f	\N	2018-05-25 09:29:31.517984	2018-05-25 09:29:31.517984
1170	40	Lucy	soft, chewy, nutella, golden raisin, hops	f	\N	2018-05-25 09:29:31.527741	2018-05-25 09:29:31.527741
1171	40	Poppy	unbalanced, velvety, brown sugar, walnut, ginger	f	\N	2018-05-25 09:29:31.539348	2018-05-25 09:29:31.539348
1172	40	Poppy	quick, chewy, apricot, sundried tomato, dill	f	\N	2018-05-25 09:29:31.550086	2018-05-25 09:29:31.550086
1173	40	Smudge	deep, tea-like, orange blossom, star fruit, toast	f	\N	2018-05-25 09:29:31.560153	2018-05-25 09:29:31.560153
1174	40	Millie	astringent, watery, grapefruit, black currant, olive	f	\N	2018-05-25 09:29:31.570275	2018-05-25 09:29:31.570275
1175	40	Oscar	dull, full, black currant, plum, tobacco	f	\N	2018-05-25 09:29:31.581164	2018-05-25 09:29:31.581164
1176	40	Lucy	astringent, full, almond, almond, cacao nibs	f	\N	2018-05-25 09:29:31.592107	2018-05-25 09:29:31.592107
1177	41	Coco	structured, coating, tobacco, black currant, white pepper	f	\N	2018-05-25 09:29:31.608577	2018-05-25 09:29:31.608577
1178	41	Milo	wild, full, lavender, brown sugar, nutella	f	\N	2018-05-25 09:29:31.622091	2018-05-25 09:29:31.622091
1179	41	Lucy	structured, watery, raisin, orange creamsicle, bakers chocolate	f	\N	2018-05-25 09:29:31.634134	2018-05-25 09:29:31.634134
1180	41	Milo	muted, full, orange blossom, cream, bittersweet chocolate	f	\N	2018-05-25 09:29:31.644196	2018-05-25 09:29:31.644196
1181	41	Smudge	dense, smooth, mango, blueberry, papaya	f	\N	2018-05-25 09:29:31.655318	2018-05-25 09:29:31.655318
1182	41	Shadow	rounded, juicy, olive, marzipan, prune	f	\N	2018-05-25 09:29:31.667641	2018-05-25 09:29:31.667641
1183	41	Milo	balanced, velvety, lime, smokey, toast	f	\N	2018-05-25 09:29:31.683149	2018-05-25 09:29:31.683149
1184	41	Missy	tart, velvety, tobacco, green pepper, passion fruit	f	\N	2018-05-25 09:29:31.693805	2018-05-25 09:29:31.693805
1185	41	Angel	tart, silky, cedar, maple syrup, olive	f	\N	2018-05-25 09:29:31.705149	2018-05-25 09:29:31.705149
1186	41	Chloe	lingering, chewy, golden raisin, hibiscus, lemon	f	\N	2018-05-25 09:29:31.721025	2018-05-25 09:29:31.721025
1187	41	Chloe	dirty, silky, baggy, mandarin, ginger	f	\N	2018-05-25 09:29:31.733489	2018-05-25 09:29:31.733489
1188	41	Sam	mild, smooth, cocoa powder, sweet pea, pineapple	f	\N	2018-05-25 09:29:31.744655	2018-05-25 09:29:31.744655
1189	42	Smokey	delicate, coating, kiwi, medicinal, carbon	f	\N	2018-05-25 09:29:31.75885	2018-05-25 09:29:31.75885
1190	42	Coco	tart, watery, honey, black currant, wheat	f	\N	2018-05-25 09:29:31.769357	2018-05-25 09:29:31.769357
1191	42	Molly	bright, round, orange creamsicle, star fruit, raspberry	f	\N	2018-05-25 09:29:31.789292	2018-05-25 09:29:31.789292
1192	42	Felix	bright, tea-like, meyer lemon, lemon verbena, papaya	f	\N	2018-05-25 09:29:31.807775	2018-05-25 09:29:31.807775
1193	42	Lucky	unbalanced, coating, nutella, carbon, cinnamon	f	\N	2018-05-25 09:29:31.81821	2018-05-25 09:29:31.81821
1194	42	Missy	juicy, big, fresh bread, cream, granola	f	\N	2018-05-25 09:29:31.831021	2018-05-25 09:29:31.831021
1195	42	Chloe	juicy, syrupy, cashew, raisin, potato defect!	f	\N	2018-05-25 09:29:31.83976	2018-05-25 09:29:31.83976
1196	42	Jasper	faint, chewy, leathery, dill, cola	f	\N	2018-05-25 09:29:31.85276	2018-05-25 09:29:31.85276
1197	42	Poppy	unbalanced, watery, green-tea, burnt sugar, tomato	f	\N	2018-05-25 09:29:31.866808	2018-05-25 09:29:31.866808
1198	42	Shadow	dirty, syrupy, star fruit, black currant, strawberry	f	\N	2018-05-25 09:29:31.882346	2018-05-25 09:29:31.882346
1199	42	Molly	unbalanced, full, tobacco, peach, sage	f	\N	2018-05-25 09:29:31.89464	2018-05-25 09:29:31.89464
1200	42	Jasper	muted, syrupy, fresh bread, corriander, snow pea	f	\N	2018-05-25 09:29:31.906465	2018-05-25 09:29:31.906465
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.schema_migrations (version) FROM stdin;
20180524235048
20180525000756
20180525001241
20180525001747
20180525002112
20180525002820
20180525003231
20180525003618
20180525004044
20180525005109
\.


--
-- Data for Name: variant_option_values; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.variant_option_values (id, variant_id, option_value_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	4	\N	2018-05-25 09:29:20.942905	2018-05-25 09:29:20.942905
2	1	6	\N	2018-05-25 09:29:20.945981	2018-05-25 09:29:20.945981
3	1	1	\N	2018-05-25 09:29:20.948059	2018-05-25 09:29:20.948059
4	2	4	\N	2018-05-25 09:29:20.952363	2018-05-25 09:29:20.952363
5	2	6	\N	2018-05-25 09:29:20.954272	2018-05-25 09:29:20.954272
6	2	1	\N	2018-05-25 09:29:20.956358	2018-05-25 09:29:20.956358
7	3	4	\N	2018-05-25 09:29:20.960584	2018-05-25 09:29:20.960584
8	3	7	\N	2018-05-25 09:29:20.962511	2018-05-25 09:29:20.962511
9	3	1	\N	2018-05-25 09:29:20.964261	2018-05-25 09:29:20.964261
10	4	4	\N	2018-05-25 09:29:20.968154	2018-05-25 09:29:20.968154
11	4	7	\N	2018-05-25 09:29:20.970089	2018-05-25 09:29:20.970089
12	4	1	\N	2018-05-25 09:29:20.972041	2018-05-25 09:29:20.972041
13	5	4	\N	2018-05-25 09:29:20.976186	2018-05-25 09:29:20.976186
14	5	8	\N	2018-05-25 09:29:20.978226	2018-05-25 09:29:20.978226
15	5	1	\N	2018-05-25 09:29:20.980081	2018-05-25 09:29:20.980081
16	6	4	\N	2018-05-25 09:29:20.983934	2018-05-25 09:29:20.983934
17	6	8	\N	2018-05-25 09:29:20.985919	2018-05-25 09:29:20.985919
18	6	1	\N	2018-05-25 09:29:20.987846	2018-05-25 09:29:20.987846
19	7	4	\N	2018-05-25 09:29:20.991736	2018-05-25 09:29:20.991736
20	7	9	\N	2018-05-25 09:29:20.99364	2018-05-25 09:29:20.99364
21	7	1	\N	2018-05-25 09:29:20.995619	2018-05-25 09:29:20.995619
22	8	4	\N	2018-05-25 09:29:20.999814	2018-05-25 09:29:20.999814
23	8	9	\N	2018-05-25 09:29:21.001843	2018-05-25 09:29:21.001843
24	8	1	\N	2018-05-25 09:29:21.003722	2018-05-25 09:29:21.003722
25	9	5	\N	2018-05-25 09:29:21.008566	2018-05-25 09:29:21.008566
26	9	6	\N	2018-05-25 09:29:21.010419	2018-05-25 09:29:21.010419
27	9	1	\N	2018-05-25 09:29:21.012232	2018-05-25 09:29:21.012232
28	10	5	\N	2018-05-25 09:29:21.015993	2018-05-25 09:29:21.015993
29	10	6	\N	2018-05-25 09:29:21.017731	2018-05-25 09:29:21.017731
30	10	1	\N	2018-05-25 09:29:21.019647	2018-05-25 09:29:21.019647
31	11	5	\N	2018-05-25 09:29:21.023915	2018-05-25 09:29:21.023915
32	11	7	\N	2018-05-25 09:29:21.025784	2018-05-25 09:29:21.025784
33	11	1	\N	2018-05-25 09:29:21.027693	2018-05-25 09:29:21.027693
34	12	5	\N	2018-05-25 09:29:21.031621	2018-05-25 09:29:21.031621
35	12	7	\N	2018-05-25 09:29:21.03354	2018-05-25 09:29:21.03354
36	12	1	\N	2018-05-25 09:29:21.035414	2018-05-25 09:29:21.035414
37	13	5	\N	2018-05-25 09:29:21.039682	2018-05-25 09:29:21.039682
38	13	8	\N	2018-05-25 09:29:21.041562	2018-05-25 09:29:21.041562
39	13	1	\N	2018-05-25 09:29:21.043503	2018-05-25 09:29:21.043503
40	14	5	\N	2018-05-25 09:29:21.047436	2018-05-25 09:29:21.047436
41	14	8	\N	2018-05-25 09:29:21.04937	2018-05-25 09:29:21.04937
42	14	1	\N	2018-05-25 09:29:21.05119	2018-05-25 09:29:21.05119
43	15	5	\N	2018-05-25 09:29:21.054976	2018-05-25 09:29:21.054976
44	15	9	\N	2018-05-25 09:29:21.056662	2018-05-25 09:29:21.056662
45	15	1	\N	2018-05-25 09:29:21.058466	2018-05-25 09:29:21.058466
46	16	5	\N	2018-05-25 09:29:21.062496	2018-05-25 09:29:21.062496
47	16	9	\N	2018-05-25 09:29:21.064453	2018-05-25 09:29:21.064453
48	16	1	\N	2018-05-25 09:29:21.066447	2018-05-25 09:29:21.066447
49	17	4	\N	2018-05-25 09:29:21.071573	2018-05-25 09:29:21.071573
50	17	6	\N	2018-05-25 09:29:21.07376	2018-05-25 09:29:21.07376
51	17	2	\N	2018-05-25 09:29:21.075672	2018-05-25 09:29:21.075672
52	18	4	\N	2018-05-25 09:29:21.079924	2018-05-25 09:29:21.079924
53	18	6	\N	2018-05-25 09:29:21.0817	2018-05-25 09:29:21.0817
54	18	2	\N	2018-05-25 09:29:21.083545	2018-05-25 09:29:21.083545
55	19	4	\N	2018-05-25 09:29:21.088154	2018-05-25 09:29:21.088154
56	19	7	\N	2018-05-25 09:29:21.090388	2018-05-25 09:29:21.090388
57	19	2	\N	2018-05-25 09:29:21.092374	2018-05-25 09:29:21.092374
58	20	4	\N	2018-05-25 09:29:21.096834	2018-05-25 09:29:21.096834
59	20	7	\N	2018-05-25 09:29:21.099033	2018-05-25 09:29:21.099033
60	20	2	\N	2018-05-25 09:29:21.101186	2018-05-25 09:29:21.101186
61	21	4	\N	2018-05-25 09:29:21.107324	2018-05-25 09:29:21.107324
62	21	8	\N	2018-05-25 09:29:21.109405	2018-05-25 09:29:21.109405
63	21	2	\N	2018-05-25 09:29:21.111384	2018-05-25 09:29:21.111384
64	22	4	\N	2018-05-25 09:29:21.115523	2018-05-25 09:29:21.115523
65	22	8	\N	2018-05-25 09:29:21.11745	2018-05-25 09:29:21.11745
66	22	2	\N	2018-05-25 09:29:21.119477	2018-05-25 09:29:21.119477
67	23	4	\N	2018-05-25 09:29:21.124069	2018-05-25 09:29:21.124069
68	23	9	\N	2018-05-25 09:29:21.126663	2018-05-25 09:29:21.126663
69	23	2	\N	2018-05-25 09:29:21.129169	2018-05-25 09:29:21.129169
70	24	4	\N	2018-05-25 09:29:21.133637	2018-05-25 09:29:21.133637
71	24	9	\N	2018-05-25 09:29:21.135697	2018-05-25 09:29:21.135697
72	24	2	\N	2018-05-25 09:29:21.13767	2018-05-25 09:29:21.13767
73	25	5	\N	2018-05-25 09:29:21.143342	2018-05-25 09:29:21.143342
74	25	6	\N	2018-05-25 09:29:21.145311	2018-05-25 09:29:21.145311
75	25	2	\N	2018-05-25 09:29:21.147281	2018-05-25 09:29:21.147281
76	26	5	\N	2018-05-25 09:29:21.151289	2018-05-25 09:29:21.151289
77	26	6	\N	2018-05-25 09:29:21.153087	2018-05-25 09:29:21.153087
78	26	2	\N	2018-05-25 09:29:21.155035	2018-05-25 09:29:21.155035
79	27	5	\N	2018-05-25 09:29:21.159279	2018-05-25 09:29:21.159279
80	27	7	\N	2018-05-25 09:29:21.161126	2018-05-25 09:29:21.161126
81	27	2	\N	2018-05-25 09:29:21.163004	2018-05-25 09:29:21.163004
82	28	5	\N	2018-05-25 09:29:21.166957	2018-05-25 09:29:21.166957
83	28	7	\N	2018-05-25 09:29:21.1687	2018-05-25 09:29:21.1687
84	28	2	\N	2018-05-25 09:29:21.17046	2018-05-25 09:29:21.17046
85	29	5	\N	2018-05-25 09:29:21.174686	2018-05-25 09:29:21.174686
86	29	8	\N	2018-05-25 09:29:21.176757	2018-05-25 09:29:21.176757
87	29	2	\N	2018-05-25 09:29:21.178504	2018-05-25 09:29:21.178504
88	30	5	\N	2018-05-25 09:29:21.183098	2018-05-25 09:29:21.183098
89	30	8	\N	2018-05-25 09:29:21.185196	2018-05-25 09:29:21.185196
90	30	2	\N	2018-05-25 09:29:21.187067	2018-05-25 09:29:21.187067
91	31	5	\N	2018-05-25 09:29:21.19111	2018-05-25 09:29:21.19111
92	31	9	\N	2018-05-25 09:29:21.193073	2018-05-25 09:29:21.193073
93	31	2	\N	2018-05-25 09:29:21.195181	2018-05-25 09:29:21.195181
94	32	5	\N	2018-05-25 09:29:21.200131	2018-05-25 09:29:21.200131
95	32	9	\N	2018-05-25 09:29:21.20242	2018-05-25 09:29:21.20242
96	32	2	\N	2018-05-25 09:29:21.204803	2018-05-25 09:29:21.204803
97	33	4	\N	2018-05-25 09:29:21.210127	2018-05-25 09:29:21.210127
98	33	6	\N	2018-05-25 09:29:21.212134	2018-05-25 09:29:21.212134
99	33	3	\N	2018-05-25 09:29:21.214194	2018-05-25 09:29:21.214194
100	34	4	\N	2018-05-25 09:29:21.218451	2018-05-25 09:29:21.218451
101	34	6	\N	2018-05-25 09:29:21.220186	2018-05-25 09:29:21.220186
102	34	3	\N	2018-05-25 09:29:21.222126	2018-05-25 09:29:21.222126
103	35	4	\N	2018-05-25 09:29:21.226406	2018-05-25 09:29:21.226406
104	35	7	\N	2018-05-25 09:29:21.228384	2018-05-25 09:29:21.228384
105	35	3	\N	2018-05-25 09:29:21.230405	2018-05-25 09:29:21.230405
106	36	4	\N	2018-05-25 09:29:21.234563	2018-05-25 09:29:21.234563
107	36	7	\N	2018-05-25 09:29:21.236367	2018-05-25 09:29:21.236367
108	36	3	\N	2018-05-25 09:29:21.238269	2018-05-25 09:29:21.238269
109	37	4	\N	2018-05-25 09:29:21.241911	2018-05-25 09:29:21.241911
110	37	8	\N	2018-05-25 09:29:21.243654	2018-05-25 09:29:21.243654
111	37	3	\N	2018-05-25 09:29:21.245584	2018-05-25 09:29:21.245584
112	38	4	\N	2018-05-25 09:29:21.24951	2018-05-25 09:29:21.24951
113	38	8	\N	2018-05-25 09:29:21.251337	2018-05-25 09:29:21.251337
114	38	3	\N	2018-05-25 09:29:21.253438	2018-05-25 09:29:21.253438
115	39	4	\N	2018-05-25 09:29:21.257739	2018-05-25 09:29:21.257739
116	39	9	\N	2018-05-25 09:29:21.259623	2018-05-25 09:29:21.259623
117	39	3	\N	2018-05-25 09:29:21.261457	2018-05-25 09:29:21.261457
118	40	4	\N	2018-05-25 09:29:21.265789	2018-05-25 09:29:21.265789
119	40	9	\N	2018-05-25 09:29:21.267573	2018-05-25 09:29:21.267573
120	40	3	\N	2018-05-25 09:29:21.269493	2018-05-25 09:29:21.269493
121	41	5	\N	2018-05-25 09:29:21.274859	2018-05-25 09:29:21.274859
122	41	6	\N	2018-05-25 09:29:21.277514	2018-05-25 09:29:21.277514
123	41	3	\N	2018-05-25 09:29:21.279553	2018-05-25 09:29:21.279553
124	42	5	\N	2018-05-25 09:29:21.285276	2018-05-25 09:29:21.285276
125	42	6	\N	2018-05-25 09:29:21.28742	2018-05-25 09:29:21.28742
126	42	3	\N	2018-05-25 09:29:21.29004	2018-05-25 09:29:21.29004
127	43	5	\N	2018-05-25 09:29:21.294517	2018-05-25 09:29:21.294517
128	43	7	\N	2018-05-25 09:29:21.296989	2018-05-25 09:29:21.296989
129	43	3	\N	2018-05-25 09:29:21.299519	2018-05-25 09:29:21.299519
130	44	5	\N	2018-05-25 09:29:21.304835	2018-05-25 09:29:21.304835
131	44	7	\N	2018-05-25 09:29:21.307267	2018-05-25 09:29:21.307267
132	44	3	\N	2018-05-25 09:29:21.309512	2018-05-25 09:29:21.309512
133	45	5	\N	2018-05-25 09:29:21.3149	2018-05-25 09:29:21.3149
134	45	8	\N	2018-05-25 09:29:21.317376	2018-05-25 09:29:21.317376
135	45	3	\N	2018-05-25 09:29:21.319655	2018-05-25 09:29:21.319655
136	46	5	\N	2018-05-25 09:29:21.324724	2018-05-25 09:29:21.324724
137	46	8	\N	2018-05-25 09:29:21.327056	2018-05-25 09:29:21.327056
138	46	3	\N	2018-05-25 09:29:21.329475	2018-05-25 09:29:21.329475
139	47	5	\N	2018-05-25 09:29:21.334907	2018-05-25 09:29:21.334907
140	47	9	\N	2018-05-25 09:29:21.337312	2018-05-25 09:29:21.337312
141	47	3	\N	2018-05-25 09:29:21.339792	2018-05-25 09:29:21.339792
142	48	5	\N	2018-05-25 09:29:21.34519	2018-05-25 09:29:21.34519
143	48	9	\N	2018-05-25 09:29:21.347526	2018-05-25 09:29:21.347526
144	48	3	\N	2018-05-25 09:29:21.349971	2018-05-25 09:29:21.349971
145	49	4	\N	2018-05-25 09:29:21.356695	2018-05-25 09:29:21.356695
146	49	6	\N	2018-05-25 09:29:21.358928	2018-05-25 09:29:21.358928
147	49	1	\N	2018-05-25 09:29:21.360939	2018-05-25 09:29:21.360939
148	50	4	\N	2018-05-25 09:29:21.364883	2018-05-25 09:29:21.364883
149	50	6	\N	2018-05-25 09:29:21.366707	2018-05-25 09:29:21.366707
150	50	1	\N	2018-05-25 09:29:21.368929	2018-05-25 09:29:21.368929
151	51	4	\N	2018-05-25 09:29:21.373404	2018-05-25 09:29:21.373404
152	51	7	\N	2018-05-25 09:29:21.375277	2018-05-25 09:29:21.375277
153	51	1	\N	2018-05-25 09:29:21.377396	2018-05-25 09:29:21.377396
154	52	4	\N	2018-05-25 09:29:21.381549	2018-05-25 09:29:21.381549
155	52	7	\N	2018-05-25 09:29:21.38339	2018-05-25 09:29:21.38339
156	52	1	\N	2018-05-25 09:29:21.385093	2018-05-25 09:29:21.385093
157	53	4	\N	2018-05-25 09:29:21.388929	2018-05-25 09:29:21.388929
158	53	8	\N	2018-05-25 09:29:21.390813	2018-05-25 09:29:21.390813
159	53	1	\N	2018-05-25 09:29:21.392586	2018-05-25 09:29:21.392586
160	54	4	\N	2018-05-25 09:29:21.396545	2018-05-25 09:29:21.396545
161	54	8	\N	2018-05-25 09:29:21.398405	2018-05-25 09:29:21.398405
162	54	1	\N	2018-05-25 09:29:21.400409	2018-05-25 09:29:21.400409
163	55	4	\N	2018-05-25 09:29:21.404649	2018-05-25 09:29:21.404649
164	55	9	\N	2018-05-25 09:29:21.406536	2018-05-25 09:29:21.406536
165	55	1	\N	2018-05-25 09:29:21.408441	2018-05-25 09:29:21.408441
166	56	4	\N	2018-05-25 09:29:21.412486	2018-05-25 09:29:21.412486
167	56	9	\N	2018-05-25 09:29:21.414422	2018-05-25 09:29:21.414422
168	56	1	\N	2018-05-25 09:29:21.416322	2018-05-25 09:29:21.416322
169	57	5	\N	2018-05-25 09:29:21.421238	2018-05-25 09:29:21.421238
170	57	6	\N	2018-05-25 09:29:21.423648	2018-05-25 09:29:21.423648
171	57	1	\N	2018-05-25 09:29:21.426085	2018-05-25 09:29:21.426085
172	58	5	\N	2018-05-25 09:29:21.430731	2018-05-25 09:29:21.430731
173	58	6	\N	2018-05-25 09:29:21.432662	2018-05-25 09:29:21.432662
174	58	1	\N	2018-05-25 09:29:21.434546	2018-05-25 09:29:21.434546
175	59	5	\N	2018-05-25 09:29:21.438638	2018-05-25 09:29:21.438638
176	59	7	\N	2018-05-25 09:29:21.440784	2018-05-25 09:29:21.440784
177	59	1	\N	2018-05-25 09:29:21.442704	2018-05-25 09:29:21.442704
178	60	5	\N	2018-05-25 09:29:21.446513	2018-05-25 09:29:21.446513
179	60	7	\N	2018-05-25 09:29:21.448477	2018-05-25 09:29:21.448477
180	60	1	\N	2018-05-25 09:29:21.450411	2018-05-25 09:29:21.450411
181	61	5	\N	2018-05-25 09:29:21.454316	2018-05-25 09:29:21.454316
182	61	8	\N	2018-05-25 09:29:21.456062	2018-05-25 09:29:21.456062
183	61	1	\N	2018-05-25 09:29:21.458064	2018-05-25 09:29:21.458064
184	62	5	\N	2018-05-25 09:29:21.462302	2018-05-25 09:29:21.462302
185	62	8	\N	2018-05-25 09:29:21.464304	2018-05-25 09:29:21.464304
186	62	1	\N	2018-05-25 09:29:21.466265	2018-05-25 09:29:21.466265
187	63	5	\N	2018-05-25 09:29:21.470034	2018-05-25 09:29:21.470034
188	63	9	\N	2018-05-25 09:29:21.47175	2018-05-25 09:29:21.47175
189	63	1	\N	2018-05-25 09:29:21.473815	2018-05-25 09:29:21.473815
190	64	5	\N	2018-05-25 09:29:21.47786	2018-05-25 09:29:21.47786
191	64	9	\N	2018-05-25 09:29:21.479846	2018-05-25 09:29:21.479846
192	64	1	\N	2018-05-25 09:29:21.481851	2018-05-25 09:29:21.481851
193	65	4	\N	2018-05-25 09:29:21.48756	2018-05-25 09:29:21.48756
194	65	6	\N	2018-05-25 09:29:21.490104	2018-05-25 09:29:21.490104
195	65	2	\N	2018-05-25 09:29:21.492892	2018-05-25 09:29:21.492892
196	66	4	\N	2018-05-25 09:29:21.498091	2018-05-25 09:29:21.498091
197	66	6	\N	2018-05-25 09:29:21.500198	2018-05-25 09:29:21.500198
198	66	2	\N	2018-05-25 09:29:21.502298	2018-05-25 09:29:21.502298
199	67	4	\N	2018-05-25 09:29:21.506926	2018-05-25 09:29:21.506926
200	67	7	\N	2018-05-25 09:29:21.508832	2018-05-25 09:29:21.508832
201	67	2	\N	2018-05-25 09:29:21.51067	2018-05-25 09:29:21.51067
202	68	4	\N	2018-05-25 09:29:21.514915	2018-05-25 09:29:21.514915
203	68	7	\N	2018-05-25 09:29:21.516768	2018-05-25 09:29:21.516768
204	68	2	\N	2018-05-25 09:29:21.51866	2018-05-25 09:29:21.51866
205	69	4	\N	2018-05-25 09:29:21.52284	2018-05-25 09:29:21.52284
206	69	8	\N	2018-05-25 09:29:21.524643	2018-05-25 09:29:21.524643
207	69	2	\N	2018-05-25 09:29:21.5265	2018-05-25 09:29:21.5265
208	70	4	\N	2018-05-25 09:29:21.531429	2018-05-25 09:29:21.531429
209	70	8	\N	2018-05-25 09:29:21.53327	2018-05-25 09:29:21.53327
210	70	2	\N	2018-05-25 09:29:21.535171	2018-05-25 09:29:21.535171
211	71	4	\N	2018-05-25 09:29:21.53891	2018-05-25 09:29:21.53891
212	71	9	\N	2018-05-25 09:29:21.541128	2018-05-25 09:29:21.541128
213	71	2	\N	2018-05-25 09:29:21.543282	2018-05-25 09:29:21.543282
214	72	4	\N	2018-05-25 09:29:21.547241	2018-05-25 09:29:21.547241
215	72	9	\N	2018-05-25 09:29:21.549157	2018-05-25 09:29:21.549157
216	72	2	\N	2018-05-25 09:29:21.551204	2018-05-25 09:29:21.551204
217	73	5	\N	2018-05-25 09:29:21.555867	2018-05-25 09:29:21.555867
218	73	6	\N	2018-05-25 09:29:21.557955	2018-05-25 09:29:21.557955
219	73	2	\N	2018-05-25 09:29:21.55978	2018-05-25 09:29:21.55978
220	74	5	\N	2018-05-25 09:29:21.564263	2018-05-25 09:29:21.564263
221	74	6	\N	2018-05-25 09:29:21.566344	2018-05-25 09:29:21.566344
222	74	2	\N	2018-05-25 09:29:21.568109	2018-05-25 09:29:21.568109
223	75	5	\N	2018-05-25 09:29:21.572016	2018-05-25 09:29:21.572016
224	75	7	\N	2018-05-25 09:29:21.573902	2018-05-25 09:29:21.573902
225	75	2	\N	2018-05-25 09:29:21.575855	2018-05-25 09:29:21.575855
226	76	5	\N	2018-05-25 09:29:21.580173	2018-05-25 09:29:21.580173
227	76	7	\N	2018-05-25 09:29:21.582115	2018-05-25 09:29:21.582115
228	76	2	\N	2018-05-25 09:29:21.583856	2018-05-25 09:29:21.583856
229	77	5	\N	2018-05-25 09:29:21.587802	2018-05-25 09:29:21.587802
230	77	8	\N	2018-05-25 09:29:21.589936	2018-05-25 09:29:21.589936
231	77	2	\N	2018-05-25 09:29:21.591821	2018-05-25 09:29:21.591821
232	78	5	\N	2018-05-25 09:29:21.596097	2018-05-25 09:29:21.596097
233	78	8	\N	2018-05-25 09:29:21.598168	2018-05-25 09:29:21.598168
234	78	2	\N	2018-05-25 09:29:21.600329	2018-05-25 09:29:21.600329
235	79	5	\N	2018-05-25 09:29:21.605887	2018-05-25 09:29:21.605887
236	79	9	\N	2018-05-25 09:29:21.607994	2018-05-25 09:29:21.607994
237	79	2	\N	2018-05-25 09:29:21.610472	2018-05-25 09:29:21.610472
238	80	5	\N	2018-05-25 09:29:21.614403	2018-05-25 09:29:21.614403
239	80	9	\N	2018-05-25 09:29:21.616221	2018-05-25 09:29:21.616221
240	80	2	\N	2018-05-25 09:29:21.61777	2018-05-25 09:29:21.61777
241	81	4	\N	2018-05-25 09:29:21.622813	2018-05-25 09:29:21.622813
242	81	6	\N	2018-05-25 09:29:21.625558	2018-05-25 09:29:21.625558
243	81	3	\N	2018-05-25 09:29:21.627854	2018-05-25 09:29:21.627854
244	82	4	\N	2018-05-25 09:29:21.632107	2018-05-25 09:29:21.632107
245	82	6	\N	2018-05-25 09:29:21.633943	2018-05-25 09:29:21.633943
246	82	3	\N	2018-05-25 09:29:21.635847	2018-05-25 09:29:21.635847
247	83	4	\N	2018-05-25 09:29:21.641758	2018-05-25 09:29:21.641758
248	83	7	\N	2018-05-25 09:29:21.644082	2018-05-25 09:29:21.644082
249	83	3	\N	2018-05-25 09:29:21.646316	2018-05-25 09:29:21.646316
250	84	4	\N	2018-05-25 09:29:21.650548	2018-05-25 09:29:21.650548
251	84	7	\N	2018-05-25 09:29:21.65238	2018-05-25 09:29:21.65238
252	84	3	\N	2018-05-25 09:29:21.654242	2018-05-25 09:29:21.654242
253	85	4	\N	2018-05-25 09:29:21.660895	2018-05-25 09:29:21.660895
254	85	8	\N	2018-05-25 09:29:21.663592	2018-05-25 09:29:21.663592
255	85	3	\N	2018-05-25 09:29:21.665812	2018-05-25 09:29:21.665812
256	86	4	\N	2018-05-25 09:29:21.67068	2018-05-25 09:29:21.67068
257	86	8	\N	2018-05-25 09:29:21.672856	2018-05-25 09:29:21.672856
258	86	3	\N	2018-05-25 09:29:21.676522	2018-05-25 09:29:21.676522
259	87	4	\N	2018-05-25 09:29:21.683721	2018-05-25 09:29:21.683721
260	87	9	\N	2018-05-25 09:29:21.686309	2018-05-25 09:29:21.686309
261	87	3	\N	2018-05-25 09:29:21.689986	2018-05-25 09:29:21.689986
262	88	4	\N	2018-05-25 09:29:21.699398	2018-05-25 09:29:21.699398
263	88	9	\N	2018-05-25 09:29:21.702723	2018-05-25 09:29:21.702723
264	88	3	\N	2018-05-25 09:29:21.704979	2018-05-25 09:29:21.704979
265	89	5	\N	2018-05-25 09:29:21.710503	2018-05-25 09:29:21.710503
266	89	6	\N	2018-05-25 09:29:21.713577	2018-05-25 09:29:21.713577
267	89	3	\N	2018-05-25 09:29:21.716463	2018-05-25 09:29:21.716463
268	90	5	\N	2018-05-25 09:29:21.72133	2018-05-25 09:29:21.72133
269	90	6	\N	2018-05-25 09:29:21.723211	2018-05-25 09:29:21.723211
270	90	3	\N	2018-05-25 09:29:21.726091	2018-05-25 09:29:21.726091
271	91	5	\N	2018-05-25 09:29:21.731561	2018-05-25 09:29:21.731561
272	91	7	\N	2018-05-25 09:29:21.73346	2018-05-25 09:29:21.73346
273	91	3	\N	2018-05-25 09:29:21.735563	2018-05-25 09:29:21.735563
274	92	5	\N	2018-05-25 09:29:21.739807	2018-05-25 09:29:21.739807
275	92	7	\N	2018-05-25 09:29:21.742293	2018-05-25 09:29:21.742293
276	92	3	\N	2018-05-25 09:29:21.744268	2018-05-25 09:29:21.744268
277	93	5	\N	2018-05-25 09:29:21.748903	2018-05-25 09:29:21.748903
278	93	8	\N	2018-05-25 09:29:21.750747	2018-05-25 09:29:21.750747
279	93	3	\N	2018-05-25 09:29:21.752739	2018-05-25 09:29:21.752739
280	94	5	\N	2018-05-25 09:29:21.757089	2018-05-25 09:29:21.757089
281	94	8	\N	2018-05-25 09:29:21.759249	2018-05-25 09:29:21.759249
282	94	3	\N	2018-05-25 09:29:21.760981	2018-05-25 09:29:21.760981
283	95	5	\N	2018-05-25 09:29:21.766002	2018-05-25 09:29:21.766002
284	95	9	\N	2018-05-25 09:29:21.769774	2018-05-25 09:29:21.769774
285	95	3	\N	2018-05-25 09:29:21.773108	2018-05-25 09:29:21.773108
286	96	5	\N	2018-05-25 09:29:21.779748	2018-05-25 09:29:21.779748
287	96	9	\N	2018-05-25 09:29:21.782509	2018-05-25 09:29:21.782509
288	96	3	\N	2018-05-25 09:29:21.784971	2018-05-25 09:29:21.784971
289	97	4	\N	2018-05-25 09:29:21.792038	2018-05-25 09:29:21.792038
290	97	6	\N	2018-05-25 09:29:21.79428	2018-05-25 09:29:21.79428
291	97	1	\N	2018-05-25 09:29:21.796779	2018-05-25 09:29:21.796779
292	98	4	\N	2018-05-25 09:29:21.802192	2018-05-25 09:29:21.802192
293	98	6	\N	2018-05-25 09:29:21.805017	2018-05-25 09:29:21.805017
294	98	1	\N	2018-05-25 09:29:21.807416	2018-05-25 09:29:21.807416
295	99	4	\N	2018-05-25 09:29:21.812955	2018-05-25 09:29:21.812955
296	99	7	\N	2018-05-25 09:29:21.815435	2018-05-25 09:29:21.815435
297	99	1	\N	2018-05-25 09:29:21.817762	2018-05-25 09:29:21.817762
298	100	4	\N	2018-05-25 09:29:21.82311	2018-05-25 09:29:21.82311
299	100	7	\N	2018-05-25 09:29:21.825662	2018-05-25 09:29:21.825662
300	100	1	\N	2018-05-25 09:29:21.828021	2018-05-25 09:29:21.828021
301	101	4	\N	2018-05-25 09:29:21.832727	2018-05-25 09:29:21.832727
302	101	8	\N	2018-05-25 09:29:21.834642	2018-05-25 09:29:21.834642
303	101	1	\N	2018-05-25 09:29:21.836522	2018-05-25 09:29:21.836522
304	102	4	\N	2018-05-25 09:29:21.841068	2018-05-25 09:29:21.841068
305	102	8	\N	2018-05-25 09:29:21.843221	2018-05-25 09:29:21.843221
306	102	1	\N	2018-05-25 09:29:21.845138	2018-05-25 09:29:21.845138
307	103	4	\N	2018-05-25 09:29:21.849527	2018-05-25 09:29:21.849527
308	103	9	\N	2018-05-25 09:29:21.851337	2018-05-25 09:29:21.851337
309	103	1	\N	2018-05-25 09:29:21.853308	2018-05-25 09:29:21.853308
310	104	4	\N	2018-05-25 09:29:21.858098	2018-05-25 09:29:21.858098
311	104	9	\N	2018-05-25 09:29:21.860263	2018-05-25 09:29:21.860263
312	104	1	\N	2018-05-25 09:29:21.862298	2018-05-25 09:29:21.862298
313	105	5	\N	2018-05-25 09:29:21.867192	2018-05-25 09:29:21.867192
314	105	6	\N	2018-05-25 09:29:21.869211	2018-05-25 09:29:21.869211
315	105	1	\N	2018-05-25 09:29:21.871082	2018-05-25 09:29:21.871082
316	106	5	\N	2018-05-25 09:29:21.875536	2018-05-25 09:29:21.875536
317	106	6	\N	2018-05-25 09:29:21.877822	2018-05-25 09:29:21.877822
318	106	1	\N	2018-05-25 09:29:21.87984	2018-05-25 09:29:21.87984
319	107	5	\N	2018-05-25 09:29:21.884116	2018-05-25 09:29:21.884116
320	107	7	\N	2018-05-25 09:29:21.885902	2018-05-25 09:29:21.885902
321	107	1	\N	2018-05-25 09:29:21.887731	2018-05-25 09:29:21.887731
322	108	5	\N	2018-05-25 09:29:21.892391	2018-05-25 09:29:21.892391
323	108	7	\N	2018-05-25 09:29:21.894393	2018-05-25 09:29:21.894393
324	108	1	\N	2018-05-25 09:29:21.896299	2018-05-25 09:29:21.896299
325	109	5	\N	2018-05-25 09:29:21.900266	2018-05-25 09:29:21.900266
326	109	8	\N	2018-05-25 09:29:21.902052	2018-05-25 09:29:21.902052
327	109	1	\N	2018-05-25 09:29:21.90387	2018-05-25 09:29:21.90387
328	110	5	\N	2018-05-25 09:29:21.908142	2018-05-25 09:29:21.908142
329	110	8	\N	2018-05-25 09:29:21.910215	2018-05-25 09:29:21.910215
330	110	1	\N	2018-05-25 09:29:21.912098	2018-05-25 09:29:21.912098
331	111	5	\N	2018-05-25 09:29:21.916122	2018-05-25 09:29:21.916122
332	111	9	\N	2018-05-25 09:29:21.917994	2018-05-25 09:29:21.917994
333	111	1	\N	2018-05-25 09:29:21.919731	2018-05-25 09:29:21.919731
334	112	5	\N	2018-05-25 09:29:21.923926	2018-05-25 09:29:21.923926
335	112	9	\N	2018-05-25 09:29:21.926555	2018-05-25 09:29:21.926555
336	112	1	\N	2018-05-25 09:29:21.928798	2018-05-25 09:29:21.928798
337	113	4	\N	2018-05-25 09:29:21.933709	2018-05-25 09:29:21.933709
338	113	6	\N	2018-05-25 09:29:21.93555	2018-05-25 09:29:21.93555
339	113	2	\N	2018-05-25 09:29:21.937417	2018-05-25 09:29:21.937417
340	114	4	\N	2018-05-25 09:29:21.941773	2018-05-25 09:29:21.941773
341	114	6	\N	2018-05-25 09:29:21.943836	2018-05-25 09:29:21.943836
342	114	2	\N	2018-05-25 09:29:21.945672	2018-05-25 09:29:21.945672
343	115	4	\N	2018-05-25 09:29:21.949714	2018-05-25 09:29:21.949714
344	115	7	\N	2018-05-25 09:29:21.951605	2018-05-25 09:29:21.951605
345	115	2	\N	2018-05-25 09:29:21.953345	2018-05-25 09:29:21.953345
346	116	4	\N	2018-05-25 09:29:21.957431	2018-05-25 09:29:21.957431
347	116	7	\N	2018-05-25 09:29:21.959389	2018-05-25 09:29:21.959389
348	116	2	\N	2018-05-25 09:29:21.96137	2018-05-25 09:29:21.96137
349	117	4	\N	2018-05-25 09:29:21.965648	2018-05-25 09:29:21.965648
350	117	8	\N	2018-05-25 09:29:21.967476	2018-05-25 09:29:21.967476
351	117	2	\N	2018-05-25 09:29:21.969322	2018-05-25 09:29:21.969322
352	118	4	\N	2018-05-25 09:29:21.973395	2018-05-25 09:29:21.973395
353	118	8	\N	2018-05-25 09:29:21.975447	2018-05-25 09:29:21.975447
354	118	2	\N	2018-05-25 09:29:21.977613	2018-05-25 09:29:21.977613
355	119	4	\N	2018-05-25 09:29:21.981834	2018-05-25 09:29:21.981834
356	119	9	\N	2018-05-25 09:29:21.983805	2018-05-25 09:29:21.983805
357	119	2	\N	2018-05-25 09:29:21.985582	2018-05-25 09:29:21.985582
358	120	4	\N	2018-05-25 09:29:21.989636	2018-05-25 09:29:21.989636
359	120	9	\N	2018-05-25 09:29:21.991872	2018-05-25 09:29:21.991872
360	120	2	\N	2018-05-25 09:29:21.993897	2018-05-25 09:29:21.993897
361	121	5	\N	2018-05-25 09:29:21.998616	2018-05-25 09:29:21.998616
362	121	6	\N	2018-05-25 09:29:22.000881	2018-05-25 09:29:22.000881
363	121	2	\N	2018-05-25 09:29:22.003424	2018-05-25 09:29:22.003424
364	122	5	\N	2018-05-25 09:29:22.007663	2018-05-25 09:29:22.007663
365	122	6	\N	2018-05-25 09:29:22.010801	2018-05-25 09:29:22.010801
366	122	2	\N	2018-05-25 09:29:22.012973	2018-05-25 09:29:22.012973
367	123	5	\N	2018-05-25 09:29:22.017894	2018-05-25 09:29:22.017894
368	123	7	\N	2018-05-25 09:29:22.020165	2018-05-25 09:29:22.020165
369	123	2	\N	2018-05-25 09:29:22.02209	2018-05-25 09:29:22.02209
370	124	5	\N	2018-05-25 09:29:22.027071	2018-05-25 09:29:22.027071
371	124	7	\N	2018-05-25 09:29:22.029085	2018-05-25 09:29:22.029085
372	124	2	\N	2018-05-25 09:29:22.031029	2018-05-25 09:29:22.031029
373	125	5	\N	2018-05-25 09:29:22.035239	2018-05-25 09:29:22.035239
374	125	8	\N	2018-05-25 09:29:22.037351	2018-05-25 09:29:22.037351
375	125	2	\N	2018-05-25 09:29:22.039343	2018-05-25 09:29:22.039343
376	126	5	\N	2018-05-25 09:29:22.044176	2018-05-25 09:29:22.044176
377	126	8	\N	2018-05-25 09:29:22.046129	2018-05-25 09:29:22.046129
378	126	2	\N	2018-05-25 09:29:22.048264	2018-05-25 09:29:22.048264
379	127	5	\N	2018-05-25 09:29:22.052685	2018-05-25 09:29:22.052685
380	127	9	\N	2018-05-25 09:29:22.055016	2018-05-25 09:29:22.055016
381	127	2	\N	2018-05-25 09:29:22.057248	2018-05-25 09:29:22.057248
382	128	5	\N	2018-05-25 09:29:22.061887	2018-05-25 09:29:22.061887
383	128	9	\N	2018-05-25 09:29:22.06381	2018-05-25 09:29:22.06381
384	128	2	\N	2018-05-25 09:29:22.065873	2018-05-25 09:29:22.065873
385	129	4	\N	2018-05-25 09:29:22.071009	2018-05-25 09:29:22.071009
386	129	6	\N	2018-05-25 09:29:22.073026	2018-05-25 09:29:22.073026
387	129	3	\N	2018-05-25 09:29:22.075256	2018-05-25 09:29:22.075256
388	130	4	\N	2018-05-25 09:29:22.079617	2018-05-25 09:29:22.079617
389	130	6	\N	2018-05-25 09:29:22.08168	2018-05-25 09:29:22.08168
390	130	3	\N	2018-05-25 09:29:22.083763	2018-05-25 09:29:22.083763
391	131	4	\N	2018-05-25 09:29:22.087764	2018-05-25 09:29:22.087764
392	131	7	\N	2018-05-25 09:29:22.089799	2018-05-25 09:29:22.089799
393	131	3	\N	2018-05-25 09:29:22.092013	2018-05-25 09:29:22.092013
394	132	4	\N	2018-05-25 09:29:22.096644	2018-05-25 09:29:22.096644
395	132	7	\N	2018-05-25 09:29:22.098738	2018-05-25 09:29:22.098738
396	132	3	\N	2018-05-25 09:29:22.101598	2018-05-25 09:29:22.101598
397	133	4	\N	2018-05-25 09:29:22.107237	2018-05-25 09:29:22.107237
398	133	8	\N	2018-05-25 09:29:22.109916	2018-05-25 09:29:22.109916
399	133	3	\N	2018-05-25 09:29:22.112062	2018-05-25 09:29:22.112062
400	134	4	\N	2018-05-25 09:29:22.116392	2018-05-25 09:29:22.116392
401	134	8	\N	2018-05-25 09:29:22.118659	2018-05-25 09:29:22.118659
402	134	3	\N	2018-05-25 09:29:22.120933	2018-05-25 09:29:22.120933
403	135	4	\N	2018-05-25 09:29:22.126608	2018-05-25 09:29:22.126608
404	135	9	\N	2018-05-25 09:29:22.12897	2018-05-25 09:29:22.12897
405	135	3	\N	2018-05-25 09:29:22.131008	2018-05-25 09:29:22.131008
406	136	4	\N	2018-05-25 09:29:22.135044	2018-05-25 09:29:22.135044
407	136	9	\N	2018-05-25 09:29:22.136912	2018-05-25 09:29:22.136912
408	136	3	\N	2018-05-25 09:29:22.139077	2018-05-25 09:29:22.139077
409	137	5	\N	2018-05-25 09:29:22.144816	2018-05-25 09:29:22.144816
410	137	6	\N	2018-05-25 09:29:22.146849	2018-05-25 09:29:22.146849
411	137	3	\N	2018-05-25 09:29:22.148782	2018-05-25 09:29:22.148782
412	138	5	\N	2018-05-25 09:29:22.152951	2018-05-25 09:29:22.152951
413	138	6	\N	2018-05-25 09:29:22.154989	2018-05-25 09:29:22.154989
414	138	3	\N	2018-05-25 09:29:22.156906	2018-05-25 09:29:22.156906
415	139	5	\N	2018-05-25 09:29:22.161557	2018-05-25 09:29:22.161557
416	139	7	\N	2018-05-25 09:29:22.163676	2018-05-25 09:29:22.163676
417	139	3	\N	2018-05-25 09:29:22.165702	2018-05-25 09:29:22.165702
418	140	5	\N	2018-05-25 09:29:22.170175	2018-05-25 09:29:22.170175
419	140	7	\N	2018-05-25 09:29:22.172043	2018-05-25 09:29:22.172043
420	140	3	\N	2018-05-25 09:29:22.174009	2018-05-25 09:29:22.174009
421	141	5	\N	2018-05-25 09:29:22.178695	2018-05-25 09:29:22.178695
422	141	8	\N	2018-05-25 09:29:22.180811	2018-05-25 09:29:22.180811
423	141	3	\N	2018-05-25 09:29:22.182678	2018-05-25 09:29:22.182678
424	142	5	\N	2018-05-25 09:29:22.186712	2018-05-25 09:29:22.186712
425	142	8	\N	2018-05-25 09:29:22.188593	2018-05-25 09:29:22.188593
426	142	3	\N	2018-05-25 09:29:22.190682	2018-05-25 09:29:22.190682
427	143	5	\N	2018-05-25 09:29:22.194865	2018-05-25 09:29:22.194865
428	143	9	\N	2018-05-25 09:29:22.196651	2018-05-25 09:29:22.196651
429	143	3	\N	2018-05-25 09:29:22.198597	2018-05-25 09:29:22.198597
430	144	5	\N	2018-05-25 09:29:22.202387	2018-05-25 09:29:22.202387
431	144	9	\N	2018-05-25 09:29:22.204199	2018-05-25 09:29:22.204199
432	144	3	\N	2018-05-25 09:29:22.205965	2018-05-25 09:29:22.205965
433	145	4	\N	2018-05-25 09:29:22.211633	2018-05-25 09:29:22.211633
434	145	6	\N	2018-05-25 09:29:22.213622	2018-05-25 09:29:22.213622
435	145	1	\N	2018-05-25 09:29:22.215735	2018-05-25 09:29:22.215735
436	146	4	\N	2018-05-25 09:29:22.220955	2018-05-25 09:29:22.220955
437	146	6	\N	2018-05-25 09:29:22.223223	2018-05-25 09:29:22.223223
438	146	1	\N	2018-05-25 09:29:22.225702	2018-05-25 09:29:22.225702
439	147	4	\N	2018-05-25 09:29:22.23063	2018-05-25 09:29:22.23063
440	147	7	\N	2018-05-25 09:29:22.233027	2018-05-25 09:29:22.233027
441	147	1	\N	2018-05-25 09:29:22.235544	2018-05-25 09:29:22.235544
442	148	4	\N	2018-05-25 09:29:22.241196	2018-05-25 09:29:22.241196
443	148	7	\N	2018-05-25 09:29:22.245138	2018-05-25 09:29:22.245138
444	148	1	\N	2018-05-25 09:29:22.248356	2018-05-25 09:29:22.248356
445	149	4	\N	2018-05-25 09:29:22.256838	2018-05-25 09:29:22.256838
446	149	8	\N	2018-05-25 09:29:22.26161	2018-05-25 09:29:22.26161
447	149	1	\N	2018-05-25 09:29:22.26416	2018-05-25 09:29:22.26416
448	150	4	\N	2018-05-25 09:29:22.268494	2018-05-25 09:29:22.268494
449	150	8	\N	2018-05-25 09:29:22.27078	2018-05-25 09:29:22.27078
450	150	1	\N	2018-05-25 09:29:22.273079	2018-05-25 09:29:22.273079
451	151	4	\N	2018-05-25 09:29:22.281177	2018-05-25 09:29:22.281177
452	151	9	\N	2018-05-25 09:29:22.284658	2018-05-25 09:29:22.284658
453	151	1	\N	2018-05-25 09:29:22.287903	2018-05-25 09:29:22.287903
454	152	4	\N	2018-05-25 09:29:22.296718	2018-05-25 09:29:22.296718
455	152	9	\N	2018-05-25 09:29:22.300342	2018-05-25 09:29:22.300342
456	152	1	\N	2018-05-25 09:29:22.304456	2018-05-25 09:29:22.304456
457	153	5	\N	2018-05-25 09:29:22.314525	2018-05-25 09:29:22.314525
458	153	6	\N	2018-05-25 09:29:22.317245	2018-05-25 09:29:22.317245
459	153	1	\N	2018-05-25 09:29:22.320432	2018-05-25 09:29:22.320432
460	154	5	\N	2018-05-25 09:29:22.326374	2018-05-25 09:29:22.326374
461	154	6	\N	2018-05-25 09:29:22.32961	2018-05-25 09:29:22.32961
462	154	1	\N	2018-05-25 09:29:22.332855	2018-05-25 09:29:22.332855
463	155	5	\N	2018-05-25 09:29:22.338663	2018-05-25 09:29:22.338663
464	155	7	\N	2018-05-25 09:29:22.341448	2018-05-25 09:29:22.341448
465	155	1	\N	2018-05-25 09:29:22.34767	2018-05-25 09:29:22.34767
466	156	5	\N	2018-05-25 09:29:22.355848	2018-05-25 09:29:22.355848
467	156	7	\N	2018-05-25 09:29:22.360066	2018-05-25 09:29:22.360066
468	156	1	\N	2018-05-25 09:29:22.369077	2018-05-25 09:29:22.369077
469	157	5	\N	2018-05-25 09:29:22.378751	2018-05-25 09:29:22.378751
470	157	8	\N	2018-05-25 09:29:22.383559	2018-05-25 09:29:22.383559
471	157	1	\N	2018-05-25 09:29:22.386391	2018-05-25 09:29:22.386391
472	158	5	\N	2018-05-25 09:29:22.394559	2018-05-25 09:29:22.394559
473	158	8	\N	2018-05-25 09:29:22.397066	2018-05-25 09:29:22.397066
474	158	1	\N	2018-05-25 09:29:22.40291	2018-05-25 09:29:22.40291
475	159	5	\N	2018-05-25 09:29:22.411662	2018-05-25 09:29:22.411662
476	159	9	\N	2018-05-25 09:29:22.415255	2018-05-25 09:29:22.415255
477	159	1	\N	2018-05-25 09:29:22.418844	2018-05-25 09:29:22.418844
478	160	5	\N	2018-05-25 09:29:22.427139	2018-05-25 09:29:22.427139
479	160	9	\N	2018-05-25 09:29:22.432029	2018-05-25 09:29:22.432029
480	160	1	\N	2018-05-25 09:29:22.435824	2018-05-25 09:29:22.435824
481	161	4	\N	2018-05-25 09:29:22.456483	2018-05-25 09:29:22.456483
482	161	6	\N	2018-05-25 09:29:22.464037	2018-05-25 09:29:22.464037
483	161	2	\N	2018-05-25 09:29:22.467522	2018-05-25 09:29:22.467522
484	162	4	\N	2018-05-25 09:29:22.473732	2018-05-25 09:29:22.473732
485	162	6	\N	2018-05-25 09:29:22.479992	2018-05-25 09:29:22.479992
486	162	2	\N	2018-05-25 09:29:22.482988	2018-05-25 09:29:22.482988
487	163	4	\N	2018-05-25 09:29:22.490832	2018-05-25 09:29:22.490832
488	163	7	\N	2018-05-25 09:29:22.496179	2018-05-25 09:29:22.496179
489	163	2	\N	2018-05-25 09:29:22.499289	2018-05-25 09:29:22.499289
490	164	4	\N	2018-05-25 09:29:22.506118	2018-05-25 09:29:22.506118
491	164	7	\N	2018-05-25 09:29:22.509747	2018-05-25 09:29:22.509747
492	164	2	\N	2018-05-25 09:29:22.513341	2018-05-25 09:29:22.513341
493	165	4	\N	2018-05-25 09:29:22.517724	2018-05-25 09:29:22.517724
494	165	8	\N	2018-05-25 09:29:22.519779	2018-05-25 09:29:22.519779
495	165	2	\N	2018-05-25 09:29:22.521834	2018-05-25 09:29:22.521834
496	166	4	\N	2018-05-25 09:29:22.529538	2018-05-25 09:29:22.529538
497	166	8	\N	2018-05-25 09:29:22.531639	2018-05-25 09:29:22.531639
498	166	2	\N	2018-05-25 09:29:22.533955	2018-05-25 09:29:22.533955
499	167	4	\N	2018-05-25 09:29:22.538736	2018-05-25 09:29:22.538736
500	167	9	\N	2018-05-25 09:29:22.54082	2018-05-25 09:29:22.54082
501	167	2	\N	2018-05-25 09:29:22.542838	2018-05-25 09:29:22.542838
502	168	4	\N	2018-05-25 09:29:22.546786	2018-05-25 09:29:22.546786
503	168	9	\N	2018-05-25 09:29:22.548677	2018-05-25 09:29:22.548677
504	168	2	\N	2018-05-25 09:29:22.55064	2018-05-25 09:29:22.55064
505	169	5	\N	2018-05-25 09:29:22.555629	2018-05-25 09:29:22.555629
506	169	6	\N	2018-05-25 09:29:22.557522	2018-05-25 09:29:22.557522
507	169	2	\N	2018-05-25 09:29:22.559341	2018-05-25 09:29:22.559341
508	170	5	\N	2018-05-25 09:29:22.563075	2018-05-25 09:29:22.563075
509	170	6	\N	2018-05-25 09:29:22.564687	2018-05-25 09:29:22.564687
510	170	2	\N	2018-05-25 09:29:22.566489	2018-05-25 09:29:22.566489
511	171	5	\N	2018-05-25 09:29:22.570764	2018-05-25 09:29:22.570764
512	171	7	\N	2018-05-25 09:29:22.57273	2018-05-25 09:29:22.57273
513	171	2	\N	2018-05-25 09:29:22.574623	2018-05-25 09:29:22.574623
514	172	5	\N	2018-05-25 09:29:22.579614	2018-05-25 09:29:22.579614
515	172	7	\N	2018-05-25 09:29:22.582559	2018-05-25 09:29:22.582559
516	172	2	\N	2018-05-25 09:29:22.584862	2018-05-25 09:29:22.584862
517	173	5	\N	2018-05-25 09:29:22.589397	2018-05-25 09:29:22.589397
518	173	8	\N	2018-05-25 09:29:22.591354	2018-05-25 09:29:22.591354
519	173	2	\N	2018-05-25 09:29:22.593256	2018-05-25 09:29:22.593256
520	174	5	\N	2018-05-25 09:29:22.59779	2018-05-25 09:29:22.59779
521	174	8	\N	2018-05-25 09:29:22.599723	2018-05-25 09:29:22.599723
522	174	2	\N	2018-05-25 09:29:22.602426	2018-05-25 09:29:22.602426
523	175	5	\N	2018-05-25 09:29:22.60702	2018-05-25 09:29:22.60702
524	175	9	\N	2018-05-25 09:29:22.608891	2018-05-25 09:29:22.608891
525	175	2	\N	2018-05-25 09:29:22.610925	2018-05-25 09:29:22.610925
526	176	5	\N	2018-05-25 09:29:22.615024	2018-05-25 09:29:22.615024
527	176	9	\N	2018-05-25 09:29:22.616646	2018-05-25 09:29:22.616646
528	176	2	\N	2018-05-25 09:29:22.618275	2018-05-25 09:29:22.618275
529	177	4	\N	2018-05-25 09:29:22.623645	2018-05-25 09:29:22.623645
530	177	6	\N	2018-05-25 09:29:22.625981	2018-05-25 09:29:22.625981
531	177	3	\N	2018-05-25 09:29:22.628181	2018-05-25 09:29:22.628181
532	178	4	\N	2018-05-25 09:29:22.632685	2018-05-25 09:29:22.632685
533	178	6	\N	2018-05-25 09:29:22.6347	2018-05-25 09:29:22.6347
534	178	3	\N	2018-05-25 09:29:22.636682	2018-05-25 09:29:22.636682
535	179	4	\N	2018-05-25 09:29:22.640887	2018-05-25 09:29:22.640887
536	179	7	\N	2018-05-25 09:29:22.642883	2018-05-25 09:29:22.642883
537	179	3	\N	2018-05-25 09:29:22.644982	2018-05-25 09:29:22.644982
538	180	4	\N	2018-05-25 09:29:22.649196	2018-05-25 09:29:22.649196
539	180	7	\N	2018-05-25 09:29:22.651055	2018-05-25 09:29:22.651055
540	180	3	\N	2018-05-25 09:29:22.652832	2018-05-25 09:29:22.652832
541	181	4	\N	2018-05-25 09:29:22.656822	2018-05-25 09:29:22.656822
542	181	8	\N	2018-05-25 09:29:22.658637	2018-05-25 09:29:22.658637
543	181	3	\N	2018-05-25 09:29:22.660572	2018-05-25 09:29:22.660572
544	182	4	\N	2018-05-25 09:29:22.664719	2018-05-25 09:29:22.664719
545	182	8	\N	2018-05-25 09:29:22.66691	2018-05-25 09:29:22.66691
546	182	3	\N	2018-05-25 09:29:22.668792	2018-05-25 09:29:22.668792
547	183	4	\N	2018-05-25 09:29:22.672618	2018-05-25 09:29:22.672618
548	183	9	\N	2018-05-25 09:29:22.674358	2018-05-25 09:29:22.674358
549	183	3	\N	2018-05-25 09:29:22.676347	2018-05-25 09:29:22.676347
550	184	4	\N	2018-05-25 09:29:22.681225	2018-05-25 09:29:22.681225
551	184	9	\N	2018-05-25 09:29:22.682983	2018-05-25 09:29:22.682983
552	184	3	\N	2018-05-25 09:29:22.684797	2018-05-25 09:29:22.684797
553	185	5	\N	2018-05-25 09:29:22.689099	2018-05-25 09:29:22.689099
554	185	6	\N	2018-05-25 09:29:22.691012	2018-05-25 09:29:22.691012
555	185	3	\N	2018-05-25 09:29:22.692929	2018-05-25 09:29:22.692929
556	186	5	\N	2018-05-25 09:29:22.697373	2018-05-25 09:29:22.697373
557	186	6	\N	2018-05-25 09:29:22.699245	2018-05-25 09:29:22.699245
558	186	3	\N	2018-05-25 09:29:22.701082	2018-05-25 09:29:22.701082
559	187	5	\N	2018-05-25 09:29:22.705392	2018-05-25 09:29:22.705392
560	187	7	\N	2018-05-25 09:29:22.707423	2018-05-25 09:29:22.707423
561	187	3	\N	2018-05-25 09:29:22.709386	2018-05-25 09:29:22.709386
562	188	5	\N	2018-05-25 09:29:22.713436	2018-05-25 09:29:22.713436
563	188	7	\N	2018-05-25 09:29:22.715392	2018-05-25 09:29:22.715392
564	188	3	\N	2018-05-25 09:29:22.717316	2018-05-25 09:29:22.717316
565	189	5	\N	2018-05-25 09:29:22.72153	2018-05-25 09:29:22.72153
566	189	8	\N	2018-05-25 09:29:22.723475	2018-05-25 09:29:22.723475
567	189	3	\N	2018-05-25 09:29:22.72551	2018-05-25 09:29:22.72551
568	190	5	\N	2018-05-25 09:29:22.729975	2018-05-25 09:29:22.729975
569	190	8	\N	2018-05-25 09:29:22.732914	2018-05-25 09:29:22.732914
570	190	3	\N	2018-05-25 09:29:22.735039	2018-05-25 09:29:22.735039
571	191	5	\N	2018-05-25 09:29:22.739842	2018-05-25 09:29:22.739842
572	191	9	\N	2018-05-25 09:29:22.743395	2018-05-25 09:29:22.743395
573	191	3	\N	2018-05-25 09:29:22.746191	2018-05-25 09:29:22.746191
574	192	5	\N	2018-05-25 09:29:22.752735	2018-05-25 09:29:22.752735
575	192	9	\N	2018-05-25 09:29:22.755353	2018-05-25 09:29:22.755353
576	192	3	\N	2018-05-25 09:29:22.757767	2018-05-25 09:29:22.757767
577	193	4	\N	2018-05-25 09:29:22.766137	2018-05-25 09:29:22.766137
578	193	6	\N	2018-05-25 09:29:22.768466	2018-05-25 09:29:22.768466
579	193	1	\N	2018-05-25 09:29:22.770898	2018-05-25 09:29:22.770898
580	194	4	\N	2018-05-25 09:29:22.777601	2018-05-25 09:29:22.777601
581	194	6	\N	2018-05-25 09:29:22.781325	2018-05-25 09:29:22.781325
582	194	1	\N	2018-05-25 09:29:22.784004	2018-05-25 09:29:22.784004
583	195	4	\N	2018-05-25 09:29:22.789999	2018-05-25 09:29:22.789999
584	195	7	\N	2018-05-25 09:29:22.795207	2018-05-25 09:29:22.795207
585	195	1	\N	2018-05-25 09:29:22.798263	2018-05-25 09:29:22.798263
586	196	4	\N	2018-05-25 09:29:22.804008	2018-05-25 09:29:22.804008
587	196	7	\N	2018-05-25 09:29:22.806379	2018-05-25 09:29:22.806379
588	196	1	\N	2018-05-25 09:29:22.810505	2018-05-25 09:29:22.810505
589	197	4	\N	2018-05-25 09:29:22.818866	2018-05-25 09:29:22.818866
590	197	8	\N	2018-05-25 09:29:22.821666	2018-05-25 09:29:22.821666
591	197	1	\N	2018-05-25 09:29:22.824607	2018-05-25 09:29:22.824607
592	198	4	\N	2018-05-25 09:29:22.835212	2018-05-25 09:29:22.835212
593	198	8	\N	2018-05-25 09:29:22.839745	2018-05-25 09:29:22.839745
594	198	1	\N	2018-05-25 09:29:22.842686	2018-05-25 09:29:22.842686
595	199	4	\N	2018-05-25 09:29:22.850347	2018-05-25 09:29:22.850347
596	199	9	\N	2018-05-25 09:29:22.855668	2018-05-25 09:29:22.855668
597	199	1	\N	2018-05-25 09:29:22.859796	2018-05-25 09:29:22.859796
598	200	4	\N	2018-05-25 09:29:22.865988	2018-05-25 09:29:22.865988
599	200	9	\N	2018-05-25 09:29:22.870839	2018-05-25 09:29:22.870839
600	200	1	\N	2018-05-25 09:29:22.875644	2018-05-25 09:29:22.875644
601	201	5	\N	2018-05-25 09:29:22.88581	2018-05-25 09:29:22.88581
602	201	6	\N	2018-05-25 09:29:22.890945	2018-05-25 09:29:22.890945
603	201	1	\N	2018-05-25 09:29:22.89563	2018-05-25 09:29:22.89563
604	202	5	\N	2018-05-25 09:29:22.902999	2018-05-25 09:29:22.902999
605	202	6	\N	2018-05-25 09:29:22.906438	2018-05-25 09:29:22.906438
606	202	1	\N	2018-05-25 09:29:22.909037	2018-05-25 09:29:22.909037
607	203	5	\N	2018-05-25 09:29:22.916665	2018-05-25 09:29:22.916665
608	203	7	\N	2018-05-25 09:29:22.919354	2018-05-25 09:29:22.919354
609	203	1	\N	2018-05-25 09:29:22.923594	2018-05-25 09:29:22.923594
610	204	5	\N	2018-05-25 09:29:22.93227	2018-05-25 09:29:22.93227
611	204	7	\N	2018-05-25 09:29:22.934442	2018-05-25 09:29:22.934442
612	204	1	\N	2018-05-25 09:29:22.938907	2018-05-25 09:29:22.938907
613	205	5	\N	2018-05-25 09:29:22.94335	2018-05-25 09:29:22.94335
614	205	8	\N	2018-05-25 09:29:22.946278	2018-05-25 09:29:22.946278
615	205	1	\N	2018-05-25 09:29:22.948655	2018-05-25 09:29:22.948655
616	206	5	\N	2018-05-25 09:29:22.953609	2018-05-25 09:29:22.953609
617	206	8	\N	2018-05-25 09:29:22.95612	2018-05-25 09:29:22.95612
618	206	1	\N	2018-05-25 09:29:22.958721	2018-05-25 09:29:22.958721
619	207	5	\N	2018-05-25 09:29:22.963903	2018-05-25 09:29:22.963903
620	207	9	\N	2018-05-25 09:29:22.966164	2018-05-25 09:29:22.966164
621	207	1	\N	2018-05-25 09:29:22.968114	2018-05-25 09:29:22.968114
622	208	5	\N	2018-05-25 09:29:22.973319	2018-05-25 09:29:22.973319
623	208	9	\N	2018-05-25 09:29:22.975487	2018-05-25 09:29:22.975487
624	208	1	\N	2018-05-25 09:29:22.978315	2018-05-25 09:29:22.978315
625	209	4	\N	2018-05-25 09:29:22.984793	2018-05-25 09:29:22.984793
626	209	6	\N	2018-05-25 09:29:22.986903	2018-05-25 09:29:22.986903
627	209	2	\N	2018-05-25 09:29:22.98885	2018-05-25 09:29:22.98885
628	210	4	\N	2018-05-25 09:29:22.993913	2018-05-25 09:29:22.993913
629	210	6	\N	2018-05-25 09:29:22.995814	2018-05-25 09:29:22.995814
630	210	2	\N	2018-05-25 09:29:22.998053	2018-05-25 09:29:22.998053
631	211	4	\N	2018-05-25 09:29:23.003181	2018-05-25 09:29:23.003181
632	211	7	\N	2018-05-25 09:29:23.0054	2018-05-25 09:29:23.0054
633	211	2	\N	2018-05-25 09:29:23.007778	2018-05-25 09:29:23.007778
634	212	4	\N	2018-05-25 09:29:23.012361	2018-05-25 09:29:23.012361
635	212	7	\N	2018-05-25 09:29:23.014621	2018-05-25 09:29:23.014621
636	212	2	\N	2018-05-25 09:29:23.01658	2018-05-25 09:29:23.01658
637	213	4	\N	2018-05-25 09:29:23.021461	2018-05-25 09:29:23.021461
638	213	8	\N	2018-05-25 09:29:23.023373	2018-05-25 09:29:23.023373
639	213	2	\N	2018-05-25 09:29:23.025501	2018-05-25 09:29:23.025501
640	214	4	\N	2018-05-25 09:29:23.030493	2018-05-25 09:29:23.030493
641	214	8	\N	2018-05-25 09:29:23.032802	2018-05-25 09:29:23.032802
642	214	2	\N	2018-05-25 09:29:23.035205	2018-05-25 09:29:23.035205
643	215	4	\N	2018-05-25 09:29:23.03931	2018-05-25 09:29:23.03931
644	215	9	\N	2018-05-25 09:29:23.041833	2018-05-25 09:29:23.041833
645	215	2	\N	2018-05-25 09:29:23.043958	2018-05-25 09:29:23.043958
646	216	4	\N	2018-05-25 09:29:23.048638	2018-05-25 09:29:23.048638
647	216	9	\N	2018-05-25 09:29:23.05106	2018-05-25 09:29:23.05106
648	216	2	\N	2018-05-25 09:29:23.053223	2018-05-25 09:29:23.053223
649	217	5	\N	2018-05-25 09:29:23.058786	2018-05-25 09:29:23.058786
650	217	6	\N	2018-05-25 09:29:23.061034	2018-05-25 09:29:23.061034
651	217	2	\N	2018-05-25 09:29:23.06342	2018-05-25 09:29:23.06342
652	218	5	\N	2018-05-25 09:29:23.067999	2018-05-25 09:29:23.067999
653	218	6	\N	2018-05-25 09:29:23.070391	2018-05-25 09:29:23.070391
654	218	2	\N	2018-05-25 09:29:23.072184	2018-05-25 09:29:23.072184
655	219	5	\N	2018-05-25 09:29:23.07682	2018-05-25 09:29:23.07682
656	219	7	\N	2018-05-25 09:29:23.078791	2018-05-25 09:29:23.078791
657	219	2	\N	2018-05-25 09:29:23.080657	2018-05-25 09:29:23.080657
658	220	5	\N	2018-05-25 09:29:23.085166	2018-05-25 09:29:23.085166
659	220	7	\N	2018-05-25 09:29:23.087103	2018-05-25 09:29:23.087103
660	220	2	\N	2018-05-25 09:29:23.089329	2018-05-25 09:29:23.089329
661	221	5	\N	2018-05-25 09:29:23.09352	2018-05-25 09:29:23.09352
662	221	8	\N	2018-05-25 09:29:23.095387	2018-05-25 09:29:23.095387
663	221	2	\N	2018-05-25 09:29:23.097858	2018-05-25 09:29:23.097858
664	222	5	\N	2018-05-25 09:29:23.103781	2018-05-25 09:29:23.103781
665	222	8	\N	2018-05-25 09:29:23.107391	2018-05-25 09:29:23.107391
666	222	2	\N	2018-05-25 09:29:23.109868	2018-05-25 09:29:23.109868
667	223	5	\N	2018-05-25 09:29:23.114885	2018-05-25 09:29:23.114885
668	223	9	\N	2018-05-25 09:29:23.117047	2018-05-25 09:29:23.117047
669	223	2	\N	2018-05-25 09:29:23.120088	2018-05-25 09:29:23.120088
670	224	5	\N	2018-05-25 09:29:23.125613	2018-05-25 09:29:23.125613
671	224	9	\N	2018-05-25 09:29:23.127722	2018-05-25 09:29:23.127722
672	224	2	\N	2018-05-25 09:29:23.129548	2018-05-25 09:29:23.129548
673	225	4	\N	2018-05-25 09:29:23.135247	2018-05-25 09:29:23.135247
674	225	6	\N	2018-05-25 09:29:23.1373	2018-05-25 09:29:23.1373
675	225	3	\N	2018-05-25 09:29:23.13966	2018-05-25 09:29:23.13966
676	226	4	\N	2018-05-25 09:29:23.144183	2018-05-25 09:29:23.144183
677	226	6	\N	2018-05-25 09:29:23.146515	2018-05-25 09:29:23.146515
678	226	3	\N	2018-05-25 09:29:23.14888	2018-05-25 09:29:23.14888
679	227	4	\N	2018-05-25 09:29:23.153922	2018-05-25 09:29:23.153922
680	227	7	\N	2018-05-25 09:29:23.156585	2018-05-25 09:29:23.156585
681	227	3	\N	2018-05-25 09:29:23.158906	2018-05-25 09:29:23.158906
682	228	4	\N	2018-05-25 09:29:23.163956	2018-05-25 09:29:23.163956
683	228	7	\N	2018-05-25 09:29:23.166297	2018-05-25 09:29:23.166297
684	228	3	\N	2018-05-25 09:29:23.168669	2018-05-25 09:29:23.168669
685	229	4	\N	2018-05-25 09:29:23.172827	2018-05-25 09:29:23.172827
686	229	8	\N	2018-05-25 09:29:23.175372	2018-05-25 09:29:23.175372
687	229	3	\N	2018-05-25 09:29:23.177799	2018-05-25 09:29:23.177799
688	230	4	\N	2018-05-25 09:29:23.182902	2018-05-25 09:29:23.182902
689	230	8	\N	2018-05-25 09:29:23.184806	2018-05-25 09:29:23.184806
690	230	3	\N	2018-05-25 09:29:23.186898	2018-05-25 09:29:23.186898
691	231	4	\N	2018-05-25 09:29:23.191648	2018-05-25 09:29:23.191648
692	231	9	\N	2018-05-25 09:29:23.194108	2018-05-25 09:29:23.194108
693	231	3	\N	2018-05-25 09:29:23.196946	2018-05-25 09:29:23.196946
694	232	4	\N	2018-05-25 09:29:23.201867	2018-05-25 09:29:23.201867
695	232	9	\N	2018-05-25 09:29:23.204255	2018-05-25 09:29:23.204255
696	232	3	\N	2018-05-25 09:29:23.208145	2018-05-25 09:29:23.208145
697	233	5	\N	2018-05-25 09:29:23.217033	2018-05-25 09:29:23.217033
698	233	6	\N	2018-05-25 09:29:23.220569	2018-05-25 09:29:23.220569
699	233	3	\N	2018-05-25 09:29:23.223944	2018-05-25 09:29:23.223944
700	234	5	\N	2018-05-25 09:29:23.234271	2018-05-25 09:29:23.234271
701	234	6	\N	2018-05-25 09:29:23.23678	2018-05-25 09:29:23.23678
702	234	3	\N	2018-05-25 09:29:23.239214	2018-05-25 09:29:23.239214
703	235	5	\N	2018-05-25 09:29:23.247824	2018-05-25 09:29:23.247824
704	235	7	\N	2018-05-25 09:29:23.250053	2018-05-25 09:29:23.250053
705	235	3	\N	2018-05-25 09:29:23.252489	2018-05-25 09:29:23.252489
706	236	5	\N	2018-05-25 09:29:23.257355	2018-05-25 09:29:23.257355
707	236	7	\N	2018-05-25 09:29:23.260124	2018-05-25 09:29:23.260124
708	236	3	\N	2018-05-25 09:29:23.262429	2018-05-25 09:29:23.262429
709	237	5	\N	2018-05-25 09:29:23.267645	2018-05-25 09:29:23.267645
710	237	8	\N	2018-05-25 09:29:23.269837	2018-05-25 09:29:23.269837
711	237	3	\N	2018-05-25 09:29:23.272429	2018-05-25 09:29:23.272429
712	238	5	\N	2018-05-25 09:29:23.279242	2018-05-25 09:29:23.279242
713	238	8	\N	2018-05-25 09:29:23.28261	2018-05-25 09:29:23.28261
714	238	3	\N	2018-05-25 09:29:23.285528	2018-05-25 09:29:23.285528
715	239	5	\N	2018-05-25 09:29:23.292714	2018-05-25 09:29:23.292714
716	239	9	\N	2018-05-25 09:29:23.296715	2018-05-25 09:29:23.296715
717	239	3	\N	2018-05-25 09:29:23.301829	2018-05-25 09:29:23.301829
718	240	5	\N	2018-05-25 09:29:23.308475	2018-05-25 09:29:23.308475
719	240	9	\N	2018-05-25 09:29:23.310909	2018-05-25 09:29:23.310909
720	240	3	\N	2018-05-25 09:29:23.316142	2018-05-25 09:29:23.316142
721	241	4	\N	2018-05-25 09:29:23.328876	2018-05-25 09:29:23.328876
722	241	6	\N	2018-05-25 09:29:23.333033	2018-05-25 09:29:23.333033
723	241	1	\N	2018-05-25 09:29:23.335973	2018-05-25 09:29:23.335973
724	242	4	\N	2018-05-25 09:29:23.344435	2018-05-25 09:29:23.344435
725	242	6	\N	2018-05-25 09:29:23.349543	2018-05-25 09:29:23.349543
726	242	1	\N	2018-05-25 09:29:23.352877	2018-05-25 09:29:23.352877
727	243	4	\N	2018-05-25 09:29:23.361965	2018-05-25 09:29:23.361965
728	243	7	\N	2018-05-25 09:29:23.364718	2018-05-25 09:29:23.364718
729	243	1	\N	2018-05-25 09:29:23.368496	2018-05-25 09:29:23.368496
730	244	4	\N	2018-05-25 09:29:23.375782	2018-05-25 09:29:23.375782
731	244	7	\N	2018-05-25 09:29:23.379639	2018-05-25 09:29:23.379639
732	244	1	\N	2018-05-25 09:29:23.383208	2018-05-25 09:29:23.383208
733	245	4	\N	2018-05-25 09:29:23.39139	2018-05-25 09:29:23.39139
734	245	8	\N	2018-05-25 09:29:23.395239	2018-05-25 09:29:23.395239
735	245	1	\N	2018-05-25 09:29:23.397548	2018-05-25 09:29:23.397548
736	246	4	\N	2018-05-25 09:29:23.404301	2018-05-25 09:29:23.404301
737	246	8	\N	2018-05-25 09:29:23.409819	2018-05-25 09:29:23.409819
738	246	1	\N	2018-05-25 09:29:23.412418	2018-05-25 09:29:23.412418
739	247	4	\N	2018-05-25 09:29:23.423983	2018-05-25 09:29:23.423983
740	247	9	\N	2018-05-25 09:29:23.429172	2018-05-25 09:29:23.429172
741	247	1	\N	2018-05-25 09:29:23.434279	2018-05-25 09:29:23.434279
742	248	4	\N	2018-05-25 09:29:23.442585	2018-05-25 09:29:23.442585
743	248	9	\N	2018-05-25 09:29:23.446148	2018-05-25 09:29:23.446148
744	248	1	\N	2018-05-25 09:29:23.450454	2018-05-25 09:29:23.450454
745	249	5	\N	2018-05-25 09:29:23.459927	2018-05-25 09:29:23.459927
746	249	6	\N	2018-05-25 09:29:23.464718	2018-05-25 09:29:23.464718
747	249	1	\N	2018-05-25 09:29:23.467357	2018-05-25 09:29:23.467357
748	250	5	\N	2018-05-25 09:29:23.473951	2018-05-25 09:29:23.473951
749	250	6	\N	2018-05-25 09:29:23.477104	2018-05-25 09:29:23.477104
750	250	1	\N	2018-05-25 09:29:23.479796	2018-05-25 09:29:23.479796
751	251	5	\N	2018-05-25 09:29:23.485035	2018-05-25 09:29:23.485035
752	251	7	\N	2018-05-25 09:29:23.487453	2018-05-25 09:29:23.487453
753	251	1	\N	2018-05-25 09:29:23.490249	2018-05-25 09:29:23.490249
754	252	5	\N	2018-05-25 09:29:23.49499	2018-05-25 09:29:23.49499
755	252	7	\N	2018-05-25 09:29:23.49763	2018-05-25 09:29:23.49763
756	252	1	\N	2018-05-25 09:29:23.499594	2018-05-25 09:29:23.499594
757	253	5	\N	2018-05-25 09:29:23.50465	2018-05-25 09:29:23.50465
758	253	8	\N	2018-05-25 09:29:23.506813	2018-05-25 09:29:23.506813
759	253	1	\N	2018-05-25 09:29:23.509348	2018-05-25 09:29:23.509348
760	254	5	\N	2018-05-25 09:29:23.514091	2018-05-25 09:29:23.514091
761	254	8	\N	2018-05-25 09:29:23.516662	2018-05-25 09:29:23.516662
762	254	1	\N	2018-05-25 09:29:23.519099	2018-05-25 09:29:23.519099
763	255	5	\N	2018-05-25 09:29:23.526024	2018-05-25 09:29:23.526024
764	255	9	\N	2018-05-25 09:29:23.528849	2018-05-25 09:29:23.528849
765	255	1	\N	2018-05-25 09:29:23.532961	2018-05-25 09:29:23.532961
766	256	5	\N	2018-05-25 09:29:23.541127	2018-05-25 09:29:23.541127
767	256	9	\N	2018-05-25 09:29:23.544352	2018-05-25 09:29:23.544352
768	256	1	\N	2018-05-25 09:29:23.547078	2018-05-25 09:29:23.547078
769	257	4	\N	2018-05-25 09:29:23.556209	2018-05-25 09:29:23.556209
770	257	6	\N	2018-05-25 09:29:23.560054	2018-05-25 09:29:23.560054
771	257	2	\N	2018-05-25 09:29:23.564936	2018-05-25 09:29:23.564936
772	258	4	\N	2018-05-25 09:29:23.57063	2018-05-25 09:29:23.57063
773	258	6	\N	2018-05-25 09:29:23.574382	2018-05-25 09:29:23.574382
774	258	2	\N	2018-05-25 09:29:23.580783	2018-05-25 09:29:23.580783
775	259	4	\N	2018-05-25 09:29:23.5875	2018-05-25 09:29:23.5875
776	259	7	\N	2018-05-25 09:29:23.589873	2018-05-25 09:29:23.589873
777	259	2	\N	2018-05-25 09:29:23.592213	2018-05-25 09:29:23.592213
778	260	4	\N	2018-05-25 09:29:23.598591	2018-05-25 09:29:23.598591
779	260	7	\N	2018-05-25 09:29:23.60386	2018-05-25 09:29:23.60386
780	260	2	\N	2018-05-25 09:29:23.60653	2018-05-25 09:29:23.60653
781	261	4	\N	2018-05-25 09:29:23.6165	2018-05-25 09:29:23.6165
782	261	8	\N	2018-05-25 09:29:23.619864	2018-05-25 09:29:23.619864
783	261	2	\N	2018-05-25 09:29:23.622965	2018-05-25 09:29:23.622965
784	262	4	\N	2018-05-25 09:29:23.631958	2018-05-25 09:29:23.631958
785	262	8	\N	2018-05-25 09:29:23.636025	2018-05-25 09:29:23.636025
786	262	2	\N	2018-05-25 09:29:23.640678	2018-05-25 09:29:23.640678
787	263	4	\N	2018-05-25 09:29:23.646966	2018-05-25 09:29:23.646966
788	263	9	\N	2018-05-25 09:29:23.651884	2018-05-25 09:29:23.651884
789	263	2	\N	2018-05-25 09:29:23.655566	2018-05-25 09:29:23.655566
790	264	4	\N	2018-05-25 09:29:23.662931	2018-05-25 09:29:23.662931
791	264	9	\N	2018-05-25 09:29:23.665839	2018-05-25 09:29:23.665839
792	264	2	\N	2018-05-25 09:29:23.668264	2018-05-25 09:29:23.668264
793	265	5	\N	2018-05-25 09:29:23.676946	2018-05-25 09:29:23.676946
794	265	6	\N	2018-05-25 09:29:23.681551	2018-05-25 09:29:23.681551
795	265	2	\N	2018-05-25 09:29:23.683627	2018-05-25 09:29:23.683627
796	266	5	\N	2018-05-25 09:29:23.69318	2018-05-25 09:29:23.69318
797	266	6	\N	2018-05-25 09:29:23.695134	2018-05-25 09:29:23.695134
798	266	2	\N	2018-05-25 09:29:23.697609	2018-05-25 09:29:23.697609
799	267	5	\N	2018-05-25 09:29:23.706452	2018-05-25 09:29:23.706452
800	267	7	\N	2018-05-25 09:29:23.709254	2018-05-25 09:29:23.709254
801	267	2	\N	2018-05-25 09:29:23.711718	2018-05-25 09:29:23.711718
802	268	5	\N	2018-05-25 09:29:23.723274	2018-05-25 09:29:23.723274
803	268	7	\N	2018-05-25 09:29:23.729459	2018-05-25 09:29:23.729459
804	268	2	\N	2018-05-25 09:29:23.734383	2018-05-25 09:29:23.734383
805	269	5	\N	2018-05-25 09:29:23.741508	2018-05-25 09:29:23.741508
806	269	8	\N	2018-05-25 09:29:23.746381	2018-05-25 09:29:23.746381
807	269	2	\N	2018-05-25 09:29:23.749375	2018-05-25 09:29:23.749375
808	270	5	\N	2018-05-25 09:29:23.75677	2018-05-25 09:29:23.75677
809	270	8	\N	2018-05-25 09:29:23.759206	2018-05-25 09:29:23.759206
810	270	2	\N	2018-05-25 09:29:23.762923	2018-05-25 09:29:23.762923
811	271	5	\N	2018-05-25 09:29:23.770237	2018-05-25 09:29:23.770237
812	271	9	\N	2018-05-25 09:29:23.772839	2018-05-25 09:29:23.772839
813	271	2	\N	2018-05-25 09:29:23.778613	2018-05-25 09:29:23.778613
814	272	5	\N	2018-05-25 09:29:23.791556	2018-05-25 09:29:23.791556
815	272	9	\N	2018-05-25 09:29:23.795049	2018-05-25 09:29:23.795049
816	272	2	\N	2018-05-25 09:29:23.799348	2018-05-25 09:29:23.799348
817	273	4	\N	2018-05-25 09:29:23.806755	2018-05-25 09:29:23.806755
818	273	6	\N	2018-05-25 09:29:23.810088	2018-05-25 09:29:23.810088
819	273	3	\N	2018-05-25 09:29:23.812276	2018-05-25 09:29:23.812276
820	274	4	\N	2018-05-25 09:29:23.819211	2018-05-25 09:29:23.819211
821	274	6	\N	2018-05-25 09:29:23.82117	2018-05-25 09:29:23.82117
822	274	3	\N	2018-05-25 09:29:23.822963	2018-05-25 09:29:23.822963
823	275	4	\N	2018-05-25 09:29:23.831232	2018-05-25 09:29:23.831232
824	275	7	\N	2018-05-25 09:29:23.83311	2018-05-25 09:29:23.83311
825	275	3	\N	2018-05-25 09:29:23.834957	2018-05-25 09:29:23.834957
826	276	4	\N	2018-05-25 09:29:23.839308	2018-05-25 09:29:23.839308
827	276	7	\N	2018-05-25 09:29:23.841877	2018-05-25 09:29:23.841877
828	276	3	\N	2018-05-25 09:29:23.845026	2018-05-25 09:29:23.845026
829	277	4	\N	2018-05-25 09:29:23.850324	2018-05-25 09:29:23.850324
830	277	8	\N	2018-05-25 09:29:23.852339	2018-05-25 09:29:23.852339
831	277	3	\N	2018-05-25 09:29:23.854336	2018-05-25 09:29:23.854336
832	278	4	\N	2018-05-25 09:29:23.859843	2018-05-25 09:29:23.859843
833	278	8	\N	2018-05-25 09:29:23.861949	2018-05-25 09:29:23.861949
834	278	3	\N	2018-05-25 09:29:23.863946	2018-05-25 09:29:23.863946
835	279	4	\N	2018-05-25 09:29:23.868138	2018-05-25 09:29:23.868138
836	279	9	\N	2018-05-25 09:29:23.870019	2018-05-25 09:29:23.870019
837	279	3	\N	2018-05-25 09:29:23.872072	2018-05-25 09:29:23.872072
838	280	4	\N	2018-05-25 09:29:23.876231	2018-05-25 09:29:23.876231
839	280	9	\N	2018-05-25 09:29:23.878193	2018-05-25 09:29:23.878193
840	280	3	\N	2018-05-25 09:29:23.880693	2018-05-25 09:29:23.880693
841	281	5	\N	2018-05-25 09:29:23.888729	2018-05-25 09:29:23.888729
842	281	6	\N	2018-05-25 09:29:23.891333	2018-05-25 09:29:23.891333
843	281	3	\N	2018-05-25 09:29:23.893692	2018-05-25 09:29:23.893692
844	282	5	\N	2018-05-25 09:29:23.897605	2018-05-25 09:29:23.897605
845	282	6	\N	2018-05-25 09:29:23.89947	2018-05-25 09:29:23.89947
846	282	3	\N	2018-05-25 09:29:23.901226	2018-05-25 09:29:23.901226
847	283	5	\N	2018-05-25 09:29:23.90528	2018-05-25 09:29:23.90528
848	283	7	\N	2018-05-25 09:29:23.907258	2018-05-25 09:29:23.907258
849	283	3	\N	2018-05-25 09:29:23.909258	2018-05-25 09:29:23.909258
850	284	5	\N	2018-05-25 09:29:23.913378	2018-05-25 09:29:23.913378
851	284	7	\N	2018-05-25 09:29:23.915253	2018-05-25 09:29:23.915253
852	284	3	\N	2018-05-25 09:29:23.917621	2018-05-25 09:29:23.917621
853	285	5	\N	2018-05-25 09:29:23.921667	2018-05-25 09:29:23.921667
854	285	8	\N	2018-05-25 09:29:23.923585	2018-05-25 09:29:23.923585
855	285	3	\N	2018-05-25 09:29:23.925497	2018-05-25 09:29:23.925497
856	286	5	\N	2018-05-25 09:29:23.929593	2018-05-25 09:29:23.929593
857	286	8	\N	2018-05-25 09:29:23.931563	2018-05-25 09:29:23.931563
858	286	3	\N	2018-05-25 09:29:23.933388	2018-05-25 09:29:23.933388
859	287	5	\N	2018-05-25 09:29:23.937197	2018-05-25 09:29:23.937197
860	287	9	\N	2018-05-25 09:29:23.939046	2018-05-25 09:29:23.939046
861	287	3	\N	2018-05-25 09:29:23.941038	2018-05-25 09:29:23.941038
862	288	5	\N	2018-05-25 09:29:23.944999	2018-05-25 09:29:23.944999
863	288	9	\N	2018-05-25 09:29:23.947179	2018-05-25 09:29:23.947179
864	288	3	\N	2018-05-25 09:29:23.949004	2018-05-25 09:29:23.949004
865	289	4	\N	2018-05-25 09:29:23.954101	2018-05-25 09:29:23.954101
866	289	6	\N	2018-05-25 09:29:23.955919	2018-05-25 09:29:23.955919
867	289	1	\N	2018-05-25 09:29:23.957712	2018-05-25 09:29:23.957712
868	290	4	\N	2018-05-25 09:29:23.961515	2018-05-25 09:29:23.961515
869	290	6	\N	2018-05-25 09:29:23.963399	2018-05-25 09:29:23.963399
870	290	1	\N	2018-05-25 09:29:23.965208	2018-05-25 09:29:23.965208
871	291	4	\N	2018-05-25 09:29:23.969242	2018-05-25 09:29:23.969242
872	291	7	\N	2018-05-25 09:29:23.971221	2018-05-25 09:29:23.971221
873	291	1	\N	2018-05-25 09:29:23.97312	2018-05-25 09:29:23.97312
874	292	4	\N	2018-05-25 09:29:23.977628	2018-05-25 09:29:23.977628
875	292	7	\N	2018-05-25 09:29:23.979654	2018-05-25 09:29:23.979654
876	292	1	\N	2018-05-25 09:29:23.981623	2018-05-25 09:29:23.981623
877	293	4	\N	2018-05-25 09:29:23.985723	2018-05-25 09:29:23.985723
878	293	8	\N	2018-05-25 09:29:23.987616	2018-05-25 09:29:23.987616
879	293	1	\N	2018-05-25 09:29:23.989463	2018-05-25 09:29:23.989463
880	294	4	\N	2018-05-25 09:29:23.993535	2018-05-25 09:29:23.993535
881	294	8	\N	2018-05-25 09:29:23.995721	2018-05-25 09:29:23.995721
882	294	1	\N	2018-05-25 09:29:23.998711	2018-05-25 09:29:23.998711
883	295	4	\N	2018-05-25 09:29:24.00489	2018-05-25 09:29:24.00489
884	295	9	\N	2018-05-25 09:29:24.007753	2018-05-25 09:29:24.007753
885	295	1	\N	2018-05-25 09:29:24.010603	2018-05-25 09:29:24.010603
886	296	4	\N	2018-05-25 09:29:24.015924	2018-05-25 09:29:24.015924
887	296	9	\N	2018-05-25 09:29:24.018487	2018-05-25 09:29:24.018487
888	296	1	\N	2018-05-25 09:29:24.020873	2018-05-25 09:29:24.020873
889	297	5	\N	2018-05-25 09:29:24.030351	2018-05-25 09:29:24.030351
890	297	6	\N	2018-05-25 09:29:24.033312	2018-05-25 09:29:24.033312
891	297	1	\N	2018-05-25 09:29:24.036158	2018-05-25 09:29:24.036158
892	298	5	\N	2018-05-25 09:29:24.044196	2018-05-25 09:29:24.044196
893	298	6	\N	2018-05-25 09:29:24.047025	2018-05-25 09:29:24.047025
894	298	1	\N	2018-05-25 09:29:24.049108	2018-05-25 09:29:24.049108
895	299	5	\N	2018-05-25 09:29:24.055006	2018-05-25 09:29:24.055006
896	299	7	\N	2018-05-25 09:29:24.058748	2018-05-25 09:29:24.058748
897	299	1	\N	2018-05-25 09:29:24.062014	2018-05-25 09:29:24.062014
898	300	5	\N	2018-05-25 09:29:24.067431	2018-05-25 09:29:24.067431
899	300	7	\N	2018-05-25 09:29:24.070434	2018-05-25 09:29:24.070434
900	300	1	\N	2018-05-25 09:29:24.072736	2018-05-25 09:29:24.072736
901	301	5	\N	2018-05-25 09:29:24.082154	2018-05-25 09:29:24.082154
902	301	8	\N	2018-05-25 09:29:24.084928	2018-05-25 09:29:24.084928
903	301	1	\N	2018-05-25 09:29:24.087591	2018-05-25 09:29:24.087591
904	302	5	\N	2018-05-25 09:29:24.094462	2018-05-25 09:29:24.094462
905	302	8	\N	2018-05-25 09:29:24.097695	2018-05-25 09:29:24.097695
906	302	1	\N	2018-05-25 09:29:24.100827	2018-05-25 09:29:24.100827
907	303	5	\N	2018-05-25 09:29:24.108891	2018-05-25 09:29:24.108891
908	303	9	\N	2018-05-25 09:29:24.11171	2018-05-25 09:29:24.11171
909	303	1	\N	2018-05-25 09:29:24.116343	2018-05-25 09:29:24.116343
910	304	5	\N	2018-05-25 09:29:24.124856	2018-05-25 09:29:24.124856
911	304	9	\N	2018-05-25 09:29:24.128438	2018-05-25 09:29:24.128438
912	304	1	\N	2018-05-25 09:29:24.130804	2018-05-25 09:29:24.130804
913	305	4	\N	2018-05-25 09:29:24.136859	2018-05-25 09:29:24.136859
914	305	6	\N	2018-05-25 09:29:24.138855	2018-05-25 09:29:24.138855
915	305	2	\N	2018-05-25 09:29:24.142513	2018-05-25 09:29:24.142513
916	306	4	\N	2018-05-25 09:29:24.14785	2018-05-25 09:29:24.14785
917	306	6	\N	2018-05-25 09:29:24.149942	2018-05-25 09:29:24.149942
918	306	2	\N	2018-05-25 09:29:24.151876	2018-05-25 09:29:24.151876
919	307	4	\N	2018-05-25 09:29:24.156863	2018-05-25 09:29:24.156863
920	307	7	\N	2018-05-25 09:29:24.159607	2018-05-25 09:29:24.159607
921	307	2	\N	2018-05-25 09:29:24.161973	2018-05-25 09:29:24.161973
922	308	4	\N	2018-05-25 09:29:24.16704	2018-05-25 09:29:24.16704
923	308	7	\N	2018-05-25 09:29:24.169293	2018-05-25 09:29:24.169293
924	308	2	\N	2018-05-25 09:29:24.171485	2018-05-25 09:29:24.171485
925	309	4	\N	2018-05-25 09:29:24.177768	2018-05-25 09:29:24.177768
926	309	8	\N	2018-05-25 09:29:24.179739	2018-05-25 09:29:24.179739
927	309	2	\N	2018-05-25 09:29:24.181702	2018-05-25 09:29:24.181702
928	310	4	\N	2018-05-25 09:29:24.185917	2018-05-25 09:29:24.185917
929	310	8	\N	2018-05-25 09:29:24.187932	2018-05-25 09:29:24.187932
930	310	2	\N	2018-05-25 09:29:24.190166	2018-05-25 09:29:24.190166
931	311	4	\N	2018-05-25 09:29:24.194968	2018-05-25 09:29:24.194968
932	311	9	\N	2018-05-25 09:29:24.196862	2018-05-25 09:29:24.196862
933	311	2	\N	2018-05-25 09:29:24.198678	2018-05-25 09:29:24.198678
934	312	4	\N	2018-05-25 09:29:24.202968	2018-05-25 09:29:24.202968
935	312	9	\N	2018-05-25 09:29:24.204779	2018-05-25 09:29:24.204779
936	312	2	\N	2018-05-25 09:29:24.206626	2018-05-25 09:29:24.206626
937	313	5	\N	2018-05-25 09:29:24.211396	2018-05-25 09:29:24.211396
938	313	6	\N	2018-05-25 09:29:24.213419	2018-05-25 09:29:24.213419
939	313	2	\N	2018-05-25 09:29:24.215251	2018-05-25 09:29:24.215251
940	314	5	\N	2018-05-25 09:29:24.219144	2018-05-25 09:29:24.219144
941	314	6	\N	2018-05-25 09:29:24.221016	2018-05-25 09:29:24.221016
942	314	2	\N	2018-05-25 09:29:24.222972	2018-05-25 09:29:24.222972
943	315	5	\N	2018-05-25 09:29:24.22728	2018-05-25 09:29:24.22728
944	315	7	\N	2018-05-25 09:29:24.229121	2018-05-25 09:29:24.229121
945	315	2	\N	2018-05-25 09:29:24.230857	2018-05-25 09:29:24.230857
946	316	5	\N	2018-05-25 09:29:24.23494	2018-05-25 09:29:24.23494
947	316	7	\N	2018-05-25 09:29:24.236806	2018-05-25 09:29:24.236806
948	316	2	\N	2018-05-25 09:29:24.238667	2018-05-25 09:29:24.238667
949	317	5	\N	2018-05-25 09:29:24.24292	2018-05-25 09:29:24.24292
950	317	8	\N	2018-05-25 09:29:24.244809	2018-05-25 09:29:24.244809
951	317	2	\N	2018-05-25 09:29:24.246653	2018-05-25 09:29:24.246653
952	318	5	\N	2018-05-25 09:29:24.250436	2018-05-25 09:29:24.250436
953	318	8	\N	2018-05-25 09:29:24.252247	2018-05-25 09:29:24.252247
954	318	2	\N	2018-05-25 09:29:24.253994	2018-05-25 09:29:24.253994
955	319	5	\N	2018-05-25 09:29:24.258126	2018-05-25 09:29:24.258126
956	319	9	\N	2018-05-25 09:29:24.260161	2018-05-25 09:29:24.260161
957	319	2	\N	2018-05-25 09:29:24.262412	2018-05-25 09:29:24.262412
958	320	5	\N	2018-05-25 09:29:24.266405	2018-05-25 09:29:24.266405
959	320	9	\N	2018-05-25 09:29:24.268288	2018-05-25 09:29:24.268288
960	320	2	\N	2018-05-25 09:29:24.270311	2018-05-25 09:29:24.270311
961	321	4	\N	2018-05-25 09:29:24.27578	2018-05-25 09:29:24.27578
962	321	6	\N	2018-05-25 09:29:24.278177	2018-05-25 09:29:24.278177
963	321	3	\N	2018-05-25 09:29:24.28046	2018-05-25 09:29:24.28046
964	322	4	\N	2018-05-25 09:29:24.284898	2018-05-25 09:29:24.284898
965	322	6	\N	2018-05-25 09:29:24.286861	2018-05-25 09:29:24.286861
966	322	3	\N	2018-05-25 09:29:24.288899	2018-05-25 09:29:24.288899
967	323	4	\N	2018-05-25 09:29:24.294442	2018-05-25 09:29:24.294442
968	323	7	\N	2018-05-25 09:29:24.296514	2018-05-25 09:29:24.296514
969	323	3	\N	2018-05-25 09:29:24.298437	2018-05-25 09:29:24.298437
970	324	4	\N	2018-05-25 09:29:24.302563	2018-05-25 09:29:24.302563
971	324	7	\N	2018-05-25 09:29:24.304471	2018-05-25 09:29:24.304471
972	324	3	\N	2018-05-25 09:29:24.306442	2018-05-25 09:29:24.306442
973	325	4	\N	2018-05-25 09:29:24.311723	2018-05-25 09:29:24.311723
974	325	8	\N	2018-05-25 09:29:24.313661	2018-05-25 09:29:24.313661
975	325	3	\N	2018-05-25 09:29:24.3155	2018-05-25 09:29:24.3155
976	326	4	\N	2018-05-25 09:29:24.319349	2018-05-25 09:29:24.319349
977	326	8	\N	2018-05-25 09:29:24.321131	2018-05-25 09:29:24.321131
978	326	3	\N	2018-05-25 09:29:24.32318	2018-05-25 09:29:24.32318
979	327	4	\N	2018-05-25 09:29:24.327747	2018-05-25 09:29:24.327747
980	327	9	\N	2018-05-25 09:29:24.329945	2018-05-25 09:29:24.329945
981	327	3	\N	2018-05-25 09:29:24.331975	2018-05-25 09:29:24.331975
982	328	4	\N	2018-05-25 09:29:24.336452	2018-05-25 09:29:24.336452
983	328	9	\N	2018-05-25 09:29:24.338906	2018-05-25 09:29:24.338906
984	328	3	\N	2018-05-25 09:29:24.341145	2018-05-25 09:29:24.341145
985	329	5	\N	2018-05-25 09:29:24.346339	2018-05-25 09:29:24.346339
986	329	6	\N	2018-05-25 09:29:24.349122	2018-05-25 09:29:24.349122
987	329	3	\N	2018-05-25 09:29:24.351626	2018-05-25 09:29:24.351626
988	330	5	\N	2018-05-25 09:29:24.357112	2018-05-25 09:29:24.357112
989	330	6	\N	2018-05-25 09:29:24.359612	2018-05-25 09:29:24.359612
990	330	3	\N	2018-05-25 09:29:24.361945	2018-05-25 09:29:24.361945
991	331	5	\N	2018-05-25 09:29:24.367429	2018-05-25 09:29:24.367429
992	331	7	\N	2018-05-25 09:29:24.369701	2018-05-25 09:29:24.369701
993	331	3	\N	2018-05-25 09:29:24.372231	2018-05-25 09:29:24.372231
994	332	5	\N	2018-05-25 09:29:24.377613	2018-05-25 09:29:24.377613
995	332	7	\N	2018-05-25 09:29:24.379824	2018-05-25 09:29:24.379824
996	332	3	\N	2018-05-25 09:29:24.381854	2018-05-25 09:29:24.381854
997	333	5	\N	2018-05-25 09:29:24.38654	2018-05-25 09:29:24.38654
998	333	8	\N	2018-05-25 09:29:24.388504	2018-05-25 09:29:24.388504
999	333	3	\N	2018-05-25 09:29:24.390375	2018-05-25 09:29:24.390375
1000	334	5	\N	2018-05-25 09:29:24.394225	2018-05-25 09:29:24.394225
1001	334	8	\N	2018-05-25 09:29:24.396167	2018-05-25 09:29:24.396167
1002	334	3	\N	2018-05-25 09:29:24.398	2018-05-25 09:29:24.398
1003	335	5	\N	2018-05-25 09:29:24.402102	2018-05-25 09:29:24.402102
1004	335	9	\N	2018-05-25 09:29:24.404116	2018-05-25 09:29:24.404116
1005	335	3	\N	2018-05-25 09:29:24.406113	2018-05-25 09:29:24.406113
1006	336	5	\N	2018-05-25 09:29:24.410356	2018-05-25 09:29:24.410356
1007	336	9	\N	2018-05-25 09:29:24.412259	2018-05-25 09:29:24.412259
1008	336	3	\N	2018-05-25 09:29:24.414202	2018-05-25 09:29:24.414202
1009	337	4	\N	2018-05-25 09:29:24.419695	2018-05-25 09:29:24.419695
1010	337	6	\N	2018-05-25 09:29:24.421704	2018-05-25 09:29:24.421704
1011	337	1	\N	2018-05-25 09:29:24.423604	2018-05-25 09:29:24.423604
1012	338	4	\N	2018-05-25 09:29:24.427966	2018-05-25 09:29:24.427966
1013	338	6	\N	2018-05-25 09:29:24.429799	2018-05-25 09:29:24.429799
1014	338	1	\N	2018-05-25 09:29:24.431586	2018-05-25 09:29:24.431586
1015	339	4	\N	2018-05-25 09:29:24.435262	2018-05-25 09:29:24.435262
1016	339	7	\N	2018-05-25 09:29:24.43709	2018-05-25 09:29:24.43709
1017	339	1	\N	2018-05-25 09:29:24.438703	2018-05-25 09:29:24.438703
1018	340	4	\N	2018-05-25 09:29:24.442832	2018-05-25 09:29:24.442832
1019	340	7	\N	2018-05-25 09:29:24.444857	2018-05-25 09:29:24.444857
1020	340	1	\N	2018-05-25 09:29:24.446878	2018-05-25 09:29:24.446878
1021	341	4	\N	2018-05-25 09:29:24.451032	2018-05-25 09:29:24.451032
1022	341	8	\N	2018-05-25 09:29:24.45297	2018-05-25 09:29:24.45297
1023	341	1	\N	2018-05-25 09:29:24.454757	2018-05-25 09:29:24.454757
1024	342	4	\N	2018-05-25 09:29:24.459245	2018-05-25 09:29:24.459245
1025	342	8	\N	2018-05-25 09:29:24.462598	2018-05-25 09:29:24.462598
1026	342	1	\N	2018-05-25 09:29:24.46483	2018-05-25 09:29:24.46483
1027	343	4	\N	2018-05-25 09:29:24.46899	2018-05-25 09:29:24.46899
1028	343	9	\N	2018-05-25 09:29:24.470935	2018-05-25 09:29:24.470935
1029	343	1	\N	2018-05-25 09:29:24.472924	2018-05-25 09:29:24.472924
1030	344	4	\N	2018-05-25 09:29:24.477588	2018-05-25 09:29:24.477588
1031	344	9	\N	2018-05-25 09:29:24.479579	2018-05-25 09:29:24.479579
1032	344	1	\N	2018-05-25 09:29:24.48134	2018-05-25 09:29:24.48134
1033	345	5	\N	2018-05-25 09:29:24.485578	2018-05-25 09:29:24.485578
1034	345	6	\N	2018-05-25 09:29:24.487348	2018-05-25 09:29:24.487348
1035	345	1	\N	2018-05-25 09:29:24.489168	2018-05-25 09:29:24.489168
1036	346	5	\N	2018-05-25 09:29:24.492951	2018-05-25 09:29:24.492951
1037	346	6	\N	2018-05-25 09:29:24.495184	2018-05-25 09:29:24.495184
1038	346	1	\N	2018-05-25 09:29:24.497141	2018-05-25 09:29:24.497141
1039	347	5	\N	2018-05-25 09:29:24.501184	2018-05-25 09:29:24.501184
1040	347	7	\N	2018-05-25 09:29:24.502957	2018-05-25 09:29:24.502957
1041	347	1	\N	2018-05-25 09:29:24.504683	2018-05-25 09:29:24.504683
1042	348	5	\N	2018-05-25 09:29:24.508826	2018-05-25 09:29:24.508826
1043	348	7	\N	2018-05-25 09:29:24.51081	2018-05-25 09:29:24.51081
1044	348	1	\N	2018-05-25 09:29:24.512787	2018-05-25 09:29:24.512787
1045	349	5	\N	2018-05-25 09:29:24.517234	2018-05-25 09:29:24.517234
1046	349	8	\N	2018-05-25 09:29:24.519158	2018-05-25 09:29:24.519158
1047	349	1	\N	2018-05-25 09:29:24.520992	2018-05-25 09:29:24.520992
1048	350	5	\N	2018-05-25 09:29:24.52512	2018-05-25 09:29:24.52512
1049	350	8	\N	2018-05-25 09:29:24.529026	2018-05-25 09:29:24.529026
1050	350	1	\N	2018-05-25 09:29:24.53154	2018-05-25 09:29:24.53154
1051	351	5	\N	2018-05-25 09:29:24.536183	2018-05-25 09:29:24.536183
1052	351	9	\N	2018-05-25 09:29:24.53818	2018-05-25 09:29:24.53818
1053	351	1	\N	2018-05-25 09:29:24.540318	2018-05-25 09:29:24.540318
1054	352	5	\N	2018-05-25 09:29:24.544418	2018-05-25 09:29:24.544418
1055	352	9	\N	2018-05-25 09:29:24.546478	2018-05-25 09:29:24.546478
1056	352	1	\N	2018-05-25 09:29:24.548385	2018-05-25 09:29:24.548385
1057	353	4	\N	2018-05-25 09:29:24.553484	2018-05-25 09:29:24.553484
1058	353	6	\N	2018-05-25 09:29:24.5555	2018-05-25 09:29:24.5555
1059	353	2	\N	2018-05-25 09:29:24.557535	2018-05-25 09:29:24.557535
1060	354	4	\N	2018-05-25 09:29:24.561717	2018-05-25 09:29:24.561717
1061	354	6	\N	2018-05-25 09:29:24.564058	2018-05-25 09:29:24.564058
1062	354	2	\N	2018-05-25 09:29:24.567256	2018-05-25 09:29:24.567256
1063	355	4	\N	2018-05-25 09:29:24.57158	2018-05-25 09:29:24.57158
1064	355	7	\N	2018-05-25 09:29:24.57374	2018-05-25 09:29:24.57374
1065	355	2	\N	2018-05-25 09:29:24.576208	2018-05-25 09:29:24.576208
1066	356	4	\N	2018-05-25 09:29:24.581416	2018-05-25 09:29:24.581416
1067	356	7	\N	2018-05-25 09:29:24.58416	2018-05-25 09:29:24.58416
1068	356	2	\N	2018-05-25 09:29:24.587033	2018-05-25 09:29:24.587033
1069	357	4	\N	2018-05-25 09:29:24.592679	2018-05-25 09:29:24.592679
1070	357	8	\N	2018-05-25 09:29:24.596939	2018-05-25 09:29:24.596939
1071	357	2	\N	2018-05-25 09:29:24.599159	2018-05-25 09:29:24.599159
1072	358	4	\N	2018-05-25 09:29:24.605533	2018-05-25 09:29:24.605533
1073	358	8	\N	2018-05-25 09:29:24.609508	2018-05-25 09:29:24.609508
1074	358	2	\N	2018-05-25 09:29:24.613387	2018-05-25 09:29:24.613387
1075	359	4	\N	2018-05-25 09:29:24.621142	2018-05-25 09:29:24.621142
1076	359	9	\N	2018-05-25 09:29:24.625231	2018-05-25 09:29:24.625231
1077	359	2	\N	2018-05-25 09:29:24.62781	2018-05-25 09:29:24.62781
1078	360	4	\N	2018-05-25 09:29:24.634695	2018-05-25 09:29:24.634695
1079	360	9	\N	2018-05-25 09:29:24.639401	2018-05-25 09:29:24.639401
1080	360	2	\N	2018-05-25 09:29:24.641998	2018-05-25 09:29:24.641998
1081	361	5	\N	2018-05-25 09:29:24.652314	2018-05-25 09:29:24.652314
1082	361	6	\N	2018-05-25 09:29:24.656128	2018-05-25 09:29:24.656128
1083	361	2	\N	2018-05-25 09:29:24.658254	2018-05-25 09:29:24.658254
1084	362	5	\N	2018-05-25 09:29:24.664246	2018-05-25 09:29:24.664246
1085	362	6	\N	2018-05-25 09:29:24.668742	2018-05-25 09:29:24.668742
1086	362	2	\N	2018-05-25 09:29:24.670788	2018-05-25 09:29:24.670788
1087	363	5	\N	2018-05-25 09:29:24.677476	2018-05-25 09:29:24.677476
1088	363	7	\N	2018-05-25 09:29:24.682556	2018-05-25 09:29:24.682556
1089	363	2	\N	2018-05-25 09:29:24.685697	2018-05-25 09:29:24.685697
1090	364	5	\N	2018-05-25 09:29:24.692874	2018-05-25 09:29:24.692874
1091	364	7	\N	2018-05-25 09:29:24.697025	2018-05-25 09:29:24.697025
1092	364	2	\N	2018-05-25 09:29:24.701663	2018-05-25 09:29:24.701663
1093	365	5	\N	2018-05-25 09:29:24.709089	2018-05-25 09:29:24.709089
1094	365	8	\N	2018-05-25 09:29:24.713386	2018-05-25 09:29:24.713386
1095	365	2	\N	2018-05-25 09:29:24.71761	2018-05-25 09:29:24.71761
1096	366	5	\N	2018-05-25 09:29:24.723816	2018-05-25 09:29:24.723816
1097	366	8	\N	2018-05-25 09:29:24.727367	2018-05-25 09:29:24.727367
1098	366	2	\N	2018-05-25 09:29:24.732282	2018-05-25 09:29:24.732282
1099	367	5	\N	2018-05-25 09:29:24.73907	2018-05-25 09:29:24.73907
1100	367	9	\N	2018-05-25 09:29:24.742716	2018-05-25 09:29:24.742716
1101	367	2	\N	2018-05-25 09:29:24.746456	2018-05-25 09:29:24.746456
1102	368	5	\N	2018-05-25 09:29:24.755019	2018-05-25 09:29:24.755019
1103	368	9	\N	2018-05-25 09:29:24.759525	2018-05-25 09:29:24.759525
1104	368	2	\N	2018-05-25 09:29:24.763404	2018-05-25 09:29:24.763404
1105	369	4	\N	2018-05-25 09:29:24.773346	2018-05-25 09:29:24.773346
1106	369	6	\N	2018-05-25 09:29:24.777218	2018-05-25 09:29:24.777218
1107	369	3	\N	2018-05-25 09:29:24.781822	2018-05-25 09:29:24.781822
1108	370	4	\N	2018-05-25 09:29:24.789983	2018-05-25 09:29:24.789983
1109	370	6	\N	2018-05-25 09:29:24.792357	2018-05-25 09:29:24.792357
1110	370	3	\N	2018-05-25 09:29:24.794427	2018-05-25 09:29:24.794427
1111	371	4	\N	2018-05-25 09:29:24.798905	2018-05-25 09:29:24.798905
1112	371	7	\N	2018-05-25 09:29:24.800853	2018-05-25 09:29:24.800853
1113	371	3	\N	2018-05-25 09:29:24.802703	2018-05-25 09:29:24.802703
1114	372	4	\N	2018-05-25 09:29:24.806651	2018-05-25 09:29:24.806651
1115	372	7	\N	2018-05-25 09:29:24.810712	2018-05-25 09:29:24.810712
1116	372	3	\N	2018-05-25 09:29:24.813318	2018-05-25 09:29:24.813318
1117	373	4	\N	2018-05-25 09:29:24.81736	2018-05-25 09:29:24.81736
1118	373	8	\N	2018-05-25 09:29:24.819322	2018-05-25 09:29:24.819322
1119	373	3	\N	2018-05-25 09:29:24.821303	2018-05-25 09:29:24.821303
1120	374	4	\N	2018-05-25 09:29:24.825474	2018-05-25 09:29:24.825474
1121	374	8	\N	2018-05-25 09:29:24.827743	2018-05-25 09:29:24.827743
1122	374	3	\N	2018-05-25 09:29:24.830544	2018-05-25 09:29:24.830544
1123	375	4	\N	2018-05-25 09:29:24.835199	2018-05-25 09:29:24.835199
1124	375	9	\N	2018-05-25 09:29:24.837914	2018-05-25 09:29:24.837914
1125	375	3	\N	2018-05-25 09:29:24.840413	2018-05-25 09:29:24.840413
1126	376	4	\N	2018-05-25 09:29:24.845421	2018-05-25 09:29:24.845421
1127	376	9	\N	2018-05-25 09:29:24.847959	2018-05-25 09:29:24.847959
1128	376	3	\N	2018-05-25 09:29:24.850513	2018-05-25 09:29:24.850513
1129	377	5	\N	2018-05-25 09:29:24.856752	2018-05-25 09:29:24.856752
1130	377	6	\N	2018-05-25 09:29:24.859456	2018-05-25 09:29:24.859456
1131	377	3	\N	2018-05-25 09:29:24.862008	2018-05-25 09:29:24.862008
1132	378	5	\N	2018-05-25 09:29:24.867436	2018-05-25 09:29:24.867436
1133	378	6	\N	2018-05-25 09:29:24.869946	2018-05-25 09:29:24.869946
1134	378	3	\N	2018-05-25 09:29:24.872462	2018-05-25 09:29:24.872462
1135	379	5	\N	2018-05-25 09:29:24.878268	2018-05-25 09:29:24.878268
1136	379	7	\N	2018-05-25 09:29:24.880529	2018-05-25 09:29:24.880529
1137	379	3	\N	2018-05-25 09:29:24.882572	2018-05-25 09:29:24.882572
1138	380	5	\N	2018-05-25 09:29:24.887384	2018-05-25 09:29:24.887384
1139	380	7	\N	2018-05-25 09:29:24.889482	2018-05-25 09:29:24.889482
1140	380	3	\N	2018-05-25 09:29:24.891794	2018-05-25 09:29:24.891794
1141	381	5	\N	2018-05-25 09:29:24.896607	2018-05-25 09:29:24.896607
1142	381	8	\N	2018-05-25 09:29:24.898816	2018-05-25 09:29:24.898816
1143	381	3	\N	2018-05-25 09:29:24.900954	2018-05-25 09:29:24.900954
1144	382	5	\N	2018-05-25 09:29:24.906504	2018-05-25 09:29:24.906504
1145	382	8	\N	2018-05-25 09:29:24.908866	2018-05-25 09:29:24.908866
1146	382	3	\N	2018-05-25 09:29:24.911428	2018-05-25 09:29:24.911428
1147	383	5	\N	2018-05-25 09:29:24.916788	2018-05-25 09:29:24.916788
1148	383	9	\N	2018-05-25 09:29:24.919597	2018-05-25 09:29:24.919597
1149	383	3	\N	2018-05-25 09:29:24.922397	2018-05-25 09:29:24.922397
1150	384	5	\N	2018-05-25 09:29:24.927499	2018-05-25 09:29:24.927499
1151	384	9	\N	2018-05-25 09:29:24.929836	2018-05-25 09:29:24.929836
1152	384	3	\N	2018-05-25 09:29:24.932298	2018-05-25 09:29:24.932298
1153	385	4	\N	2018-05-25 09:29:24.939483	2018-05-25 09:29:24.939483
1154	385	6	\N	2018-05-25 09:29:24.941826	2018-05-25 09:29:24.941826
1155	385	1	\N	2018-05-25 09:29:24.944402	2018-05-25 09:29:24.944402
1156	386	4	\N	2018-05-25 09:29:24.949759	2018-05-25 09:29:24.949759
1157	386	6	\N	2018-05-25 09:29:24.951967	2018-05-25 09:29:24.951967
1158	386	1	\N	2018-05-25 09:29:24.95409	2018-05-25 09:29:24.95409
1159	387	4	\N	2018-05-25 09:29:24.958682	2018-05-25 09:29:24.958682
1160	387	7	\N	2018-05-25 09:29:24.961185	2018-05-25 09:29:24.961185
1161	387	1	\N	2018-05-25 09:29:24.963411	2018-05-25 09:29:24.963411
1162	388	4	\N	2018-05-25 09:29:24.96799	2018-05-25 09:29:24.96799
1163	388	7	\N	2018-05-25 09:29:24.969974	2018-05-25 09:29:24.969974
1164	388	1	\N	2018-05-25 09:29:24.971948	2018-05-25 09:29:24.971948
1165	389	4	\N	2018-05-25 09:29:24.976742	2018-05-25 09:29:24.976742
1166	389	8	\N	2018-05-25 09:29:24.979038	2018-05-25 09:29:24.979038
1167	389	1	\N	2018-05-25 09:29:24.981332	2018-05-25 09:29:24.981332
1168	390	4	\N	2018-05-25 09:29:24.986317	2018-05-25 09:29:24.986317
1169	390	8	\N	2018-05-25 09:29:24.988564	2018-05-25 09:29:24.988564
1170	390	1	\N	2018-05-25 09:29:24.990732	2018-05-25 09:29:24.990732
1171	391	4	\N	2018-05-25 09:29:24.995542	2018-05-25 09:29:24.995542
1172	391	9	\N	2018-05-25 09:29:24.99766	2018-05-25 09:29:24.99766
1173	391	1	\N	2018-05-25 09:29:24.999619	2018-05-25 09:29:24.999619
1174	392	4	\N	2018-05-25 09:29:25.00379	2018-05-25 09:29:25.00379
1175	392	9	\N	2018-05-25 09:29:25.005634	2018-05-25 09:29:25.005634
1176	392	1	\N	2018-05-25 09:29:25.007335	2018-05-25 09:29:25.007335
1177	393	5	\N	2018-05-25 09:29:25.011737	2018-05-25 09:29:25.011737
1178	393	6	\N	2018-05-25 09:29:25.013586	2018-05-25 09:29:25.013586
1179	393	1	\N	2018-05-25 09:29:25.015376	2018-05-25 09:29:25.015376
1180	394	5	\N	2018-05-25 09:29:25.01956	2018-05-25 09:29:25.01956
1181	394	6	\N	2018-05-25 09:29:25.021524	2018-05-25 09:29:25.021524
1182	394	1	\N	2018-05-25 09:29:25.023498	2018-05-25 09:29:25.023498
1183	395	5	\N	2018-05-25 09:29:25.027937	2018-05-25 09:29:25.027937
1184	395	7	\N	2018-05-25 09:29:25.029906	2018-05-25 09:29:25.029906
1185	395	1	\N	2018-05-25 09:29:25.031803	2018-05-25 09:29:25.031803
1186	396	5	\N	2018-05-25 09:29:25.035615	2018-05-25 09:29:25.035615
1187	396	7	\N	2018-05-25 09:29:25.037308	2018-05-25 09:29:25.037308
1188	396	1	\N	2018-05-25 09:29:25.038892	2018-05-25 09:29:25.038892
1189	397	5	\N	2018-05-25 09:29:25.042565	2018-05-25 09:29:25.042565
1190	397	8	\N	2018-05-25 09:29:25.044154	2018-05-25 09:29:25.044154
1191	397	1	\N	2018-05-25 09:29:25.045673	2018-05-25 09:29:25.045673
1192	398	5	\N	2018-05-25 09:29:25.049102	2018-05-25 09:29:25.049102
1193	398	8	\N	2018-05-25 09:29:25.050668	2018-05-25 09:29:25.050668
1194	398	1	\N	2018-05-25 09:29:25.052187	2018-05-25 09:29:25.052187
1195	399	5	\N	2018-05-25 09:29:25.055976	2018-05-25 09:29:25.055976
1196	399	9	\N	2018-05-25 09:29:25.057794	2018-05-25 09:29:25.057794
1197	399	1	\N	2018-05-25 09:29:25.059391	2018-05-25 09:29:25.059391
1198	400	5	\N	2018-05-25 09:29:25.062705	2018-05-25 09:29:25.062705
1199	400	9	\N	2018-05-25 09:29:25.064213	2018-05-25 09:29:25.064213
1200	400	1	\N	2018-05-25 09:29:25.065706	2018-05-25 09:29:25.065706
1201	401	4	\N	2018-05-25 09:29:25.069756	2018-05-25 09:29:25.069756
1202	401	6	\N	2018-05-25 09:29:25.071329	2018-05-25 09:29:25.071329
1203	401	2	\N	2018-05-25 09:29:25.072858	2018-05-25 09:29:25.072858
1204	402	4	\N	2018-05-25 09:29:25.076598	2018-05-25 09:29:25.076598
1205	402	6	\N	2018-05-25 09:29:25.078527	2018-05-25 09:29:25.078527
1206	402	2	\N	2018-05-25 09:29:25.080264	2018-05-25 09:29:25.080264
1207	403	4	\N	2018-05-25 09:29:25.083692	2018-05-25 09:29:25.083692
1208	403	7	\N	2018-05-25 09:29:25.085267	2018-05-25 09:29:25.085267
1209	403	2	\N	2018-05-25 09:29:25.086907	2018-05-25 09:29:25.086907
1210	404	4	\N	2018-05-25 09:29:25.090259	2018-05-25 09:29:25.090259
1211	404	7	\N	2018-05-25 09:29:25.091799	2018-05-25 09:29:25.091799
1212	404	2	\N	2018-05-25 09:29:25.093345	2018-05-25 09:29:25.093345
1213	405	4	\N	2018-05-25 09:29:25.096864	2018-05-25 09:29:25.096864
1214	405	8	\N	2018-05-25 09:29:25.098829	2018-05-25 09:29:25.098829
1215	405	2	\N	2018-05-25 09:29:25.100721	2018-05-25 09:29:25.100721
1216	406	4	\N	2018-05-25 09:29:25.107071	2018-05-25 09:29:25.107071
1217	406	8	\N	2018-05-25 09:29:25.109627	2018-05-25 09:29:25.109627
1218	406	2	\N	2018-05-25 09:29:25.111767	2018-05-25 09:29:25.111767
1219	407	4	\N	2018-05-25 09:29:25.116649	2018-05-25 09:29:25.116649
1220	407	9	\N	2018-05-25 09:29:25.119461	2018-05-25 09:29:25.119461
1221	407	2	\N	2018-05-25 09:29:25.122045	2018-05-25 09:29:25.122045
1222	408	4	\N	2018-05-25 09:29:25.129813	2018-05-25 09:29:25.129813
1223	408	9	\N	2018-05-25 09:29:25.13184	2018-05-25 09:29:25.13184
1224	408	2	\N	2018-05-25 09:29:25.133662	2018-05-25 09:29:25.133662
1225	409	5	\N	2018-05-25 09:29:25.138491	2018-05-25 09:29:25.138491
1226	409	6	\N	2018-05-25 09:29:25.14054	2018-05-25 09:29:25.14054
1227	409	2	\N	2018-05-25 09:29:25.142336	2018-05-25 09:29:25.142336
1228	410	5	\N	2018-05-25 09:29:25.146833	2018-05-25 09:29:25.146833
1229	410	6	\N	2018-05-25 09:29:25.148824	2018-05-25 09:29:25.148824
1230	410	2	\N	2018-05-25 09:29:25.150845	2018-05-25 09:29:25.150845
1231	411	5	\N	2018-05-25 09:29:25.155339	2018-05-25 09:29:25.155339
1232	411	7	\N	2018-05-25 09:29:25.157626	2018-05-25 09:29:25.157626
1233	411	2	\N	2018-05-25 09:29:25.159734	2018-05-25 09:29:25.159734
1234	412	5	\N	2018-05-25 09:29:25.164313	2018-05-25 09:29:25.164313
1235	412	7	\N	2018-05-25 09:29:25.166274	2018-05-25 09:29:25.166274
1236	412	2	\N	2018-05-25 09:29:25.168149	2018-05-25 09:29:25.168149
1237	413	5	\N	2018-05-25 09:29:25.172016	2018-05-25 09:29:25.172016
1238	413	8	\N	2018-05-25 09:29:25.174184	2018-05-25 09:29:25.174184
1239	413	2	\N	2018-05-25 09:29:25.176293	2018-05-25 09:29:25.176293
1240	414	5	\N	2018-05-25 09:29:25.182253	2018-05-25 09:29:25.182253
1241	414	8	\N	2018-05-25 09:29:25.184498	2018-05-25 09:29:25.184498
1242	414	2	\N	2018-05-25 09:29:25.186463	2018-05-25 09:29:25.186463
1243	415	5	\N	2018-05-25 09:29:25.190652	2018-05-25 09:29:25.190652
1244	415	9	\N	2018-05-25 09:29:25.192949	2018-05-25 09:29:25.192949
1245	415	2	\N	2018-05-25 09:29:25.19495	2018-05-25 09:29:25.19495
1246	416	5	\N	2018-05-25 09:29:25.199137	2018-05-25 09:29:25.199137
1247	416	9	\N	2018-05-25 09:29:25.201008	2018-05-25 09:29:25.201008
1248	416	2	\N	2018-05-25 09:29:25.202969	2018-05-25 09:29:25.202969
1249	417	4	\N	2018-05-25 09:29:25.207969	2018-05-25 09:29:25.207969
1250	417	6	\N	2018-05-25 09:29:25.210278	2018-05-25 09:29:25.210278
1251	417	3	\N	2018-05-25 09:29:25.213315	2018-05-25 09:29:25.213315
1252	418	4	\N	2018-05-25 09:29:25.218011	2018-05-25 09:29:25.218011
1253	418	6	\N	2018-05-25 09:29:25.219871	2018-05-25 09:29:25.219871
1254	418	3	\N	2018-05-25 09:29:25.221695	2018-05-25 09:29:25.221695
1255	419	4	\N	2018-05-25 09:29:25.226302	2018-05-25 09:29:25.226302
1256	419	7	\N	2018-05-25 09:29:25.228215	2018-05-25 09:29:25.228215
1257	419	3	\N	2018-05-25 09:29:25.230227	2018-05-25 09:29:25.230227
1258	420	4	\N	2018-05-25 09:29:25.234944	2018-05-25 09:29:25.234944
1259	420	7	\N	2018-05-25 09:29:25.237221	2018-05-25 09:29:25.237221
1260	420	3	\N	2018-05-25 09:29:25.239581	2018-05-25 09:29:25.239581
1261	421	4	\N	2018-05-25 09:29:25.244612	2018-05-25 09:29:25.244612
1262	421	8	\N	2018-05-25 09:29:25.247029	2018-05-25 09:29:25.247029
1263	421	3	\N	2018-05-25 09:29:25.249853	2018-05-25 09:29:25.249853
1264	422	4	\N	2018-05-25 09:29:25.255139	2018-05-25 09:29:25.255139
1265	422	8	\N	2018-05-25 09:29:25.257798	2018-05-25 09:29:25.257798
1266	422	3	\N	2018-05-25 09:29:25.260306	2018-05-25 09:29:25.260306
1267	423	4	\N	2018-05-25 09:29:25.26579	2018-05-25 09:29:25.26579
1268	423	9	\N	2018-05-25 09:29:25.268282	2018-05-25 09:29:25.268282
1269	423	3	\N	2018-05-25 09:29:25.270752	2018-05-25 09:29:25.270752
1270	424	4	\N	2018-05-25 09:29:25.276258	2018-05-25 09:29:25.276258
1271	424	9	\N	2018-05-25 09:29:25.278687	2018-05-25 09:29:25.278687
1272	424	3	\N	2018-05-25 09:29:25.280948	2018-05-25 09:29:25.280948
1273	425	5	\N	2018-05-25 09:29:25.286011	2018-05-25 09:29:25.286011
1274	425	6	\N	2018-05-25 09:29:25.287909	2018-05-25 09:29:25.287909
1275	425	3	\N	2018-05-25 09:29:25.289998	2018-05-25 09:29:25.289998
1276	426	5	\N	2018-05-25 09:29:25.294407	2018-05-25 09:29:25.294407
1277	426	6	\N	2018-05-25 09:29:25.296518	2018-05-25 09:29:25.296518
1278	426	3	\N	2018-05-25 09:29:25.298477	2018-05-25 09:29:25.298477
1279	427	5	\N	2018-05-25 09:29:25.302582	2018-05-25 09:29:25.302582
1280	427	7	\N	2018-05-25 09:29:25.304676	2018-05-25 09:29:25.304676
1281	427	3	\N	2018-05-25 09:29:25.306566	2018-05-25 09:29:25.306566
1282	428	5	\N	2018-05-25 09:29:25.310983	2018-05-25 09:29:25.310983
1283	428	7	\N	2018-05-25 09:29:25.312984	2018-05-25 09:29:25.312984
1284	428	3	\N	2018-05-25 09:29:25.314911	2018-05-25 09:29:25.314911
1285	429	5	\N	2018-05-25 09:29:25.319003	2018-05-25 09:29:25.319003
1286	429	8	\N	2018-05-25 09:29:25.321358	2018-05-25 09:29:25.321358
1287	429	3	\N	2018-05-25 09:29:25.323438	2018-05-25 09:29:25.323438
1288	430	5	\N	2018-05-25 09:29:25.327486	2018-05-25 09:29:25.327486
1289	430	8	\N	2018-05-25 09:29:25.329327	2018-05-25 09:29:25.329327
1290	430	3	\N	2018-05-25 09:29:25.331182	2018-05-25 09:29:25.331182
1291	431	5	\N	2018-05-25 09:29:25.33524	2018-05-25 09:29:25.33524
1292	431	9	\N	2018-05-25 09:29:25.33718	2018-05-25 09:29:25.33718
1293	431	3	\N	2018-05-25 09:29:25.33907	2018-05-25 09:29:25.33907
1294	432	5	\N	2018-05-25 09:29:25.343424	2018-05-25 09:29:25.343424
1295	432	9	\N	2018-05-25 09:29:25.345339	2018-05-25 09:29:25.345339
1296	432	3	\N	2018-05-25 09:29:25.347285	2018-05-25 09:29:25.347285
1297	433	4	\N	2018-05-25 09:29:25.352573	2018-05-25 09:29:25.352573
1298	433	6	\N	2018-05-25 09:29:25.354447	2018-05-25 09:29:25.354447
1299	433	1	\N	2018-05-25 09:29:25.356337	2018-05-25 09:29:25.356337
1300	434	4	\N	2018-05-25 09:29:25.36036	2018-05-25 09:29:25.36036
1301	434	6	\N	2018-05-25 09:29:25.362414	2018-05-25 09:29:25.362414
1302	434	1	\N	2018-05-25 09:29:25.364178	2018-05-25 09:29:25.364178
1303	435	4	\N	2018-05-25 09:29:25.36752	2018-05-25 09:29:25.36752
1304	435	7	\N	2018-05-25 09:29:25.369081	2018-05-25 09:29:25.369081
1305	435	1	\N	2018-05-25 09:29:25.370871	2018-05-25 09:29:25.370871
1306	436	4	\N	2018-05-25 09:29:25.374392	2018-05-25 09:29:25.374392
1307	436	7	\N	2018-05-25 09:29:25.375925	2018-05-25 09:29:25.375925
1308	436	1	\N	2018-05-25 09:29:25.377852	2018-05-25 09:29:25.377852
1309	437	4	\N	2018-05-25 09:29:25.381764	2018-05-25 09:29:25.381764
1310	437	8	\N	2018-05-25 09:29:25.383468	2018-05-25 09:29:25.383468
1311	437	1	\N	2018-05-25 09:29:25.385335	2018-05-25 09:29:25.385335
1312	438	4	\N	2018-05-25 09:29:25.389327	2018-05-25 09:29:25.389327
1313	438	8	\N	2018-05-25 09:29:25.391224	2018-05-25 09:29:25.391224
1314	438	1	\N	2018-05-25 09:29:25.393121	2018-05-25 09:29:25.393121
1315	439	4	\N	2018-05-25 09:29:25.397058	2018-05-25 09:29:25.397058
1316	439	9	\N	2018-05-25 09:29:25.39922	2018-05-25 09:29:25.39922
1317	439	1	\N	2018-05-25 09:29:25.401286	2018-05-25 09:29:25.401286
1318	440	4	\N	2018-05-25 09:29:25.405426	2018-05-25 09:29:25.405426
1319	440	9	\N	2018-05-25 09:29:25.407443	2018-05-25 09:29:25.407443
1320	440	1	\N	2018-05-25 09:29:25.409404	2018-05-25 09:29:25.409404
1321	441	5	\N	2018-05-25 09:29:25.414158	2018-05-25 09:29:25.414158
1322	441	6	\N	2018-05-25 09:29:25.416127	2018-05-25 09:29:25.416127
1323	441	1	\N	2018-05-25 09:29:25.417985	2018-05-25 09:29:25.417985
1324	442	5	\N	2018-05-25 09:29:25.422222	2018-05-25 09:29:25.422222
1325	442	6	\N	2018-05-25 09:29:25.424219	2018-05-25 09:29:25.424219
1326	442	1	\N	2018-05-25 09:29:25.426142	2018-05-25 09:29:25.426142
1327	443	5	\N	2018-05-25 09:29:25.430116	2018-05-25 09:29:25.430116
1328	443	7	\N	2018-05-25 09:29:25.432163	2018-05-25 09:29:25.432163
1329	443	1	\N	2018-05-25 09:29:25.434458	2018-05-25 09:29:25.434458
1330	444	5	\N	2018-05-25 09:29:25.438859	2018-05-25 09:29:25.438859
1331	444	7	\N	2018-05-25 09:29:25.441126	2018-05-25 09:29:25.441126
1332	444	1	\N	2018-05-25 09:29:25.442995	2018-05-25 09:29:25.442995
1333	445	5	\N	2018-05-25 09:29:25.447052	2018-05-25 09:29:25.447052
1334	445	8	\N	2018-05-25 09:29:25.448886	2018-05-25 09:29:25.448886
1335	445	1	\N	2018-05-25 09:29:25.450816	2018-05-25 09:29:25.450816
1336	446	5	\N	2018-05-25 09:29:25.454888	2018-05-25 09:29:25.454888
1337	446	8	\N	2018-05-25 09:29:25.45706	2018-05-25 09:29:25.45706
1338	446	1	\N	2018-05-25 09:29:25.460412	2018-05-25 09:29:25.460412
1339	447	5	\N	2018-05-25 09:29:25.465959	2018-05-25 09:29:25.465959
1340	447	9	\N	2018-05-25 09:29:25.468463	2018-05-25 09:29:25.468463
1341	447	1	\N	2018-05-25 09:29:25.470509	2018-05-25 09:29:25.470509
1342	448	5	\N	2018-05-25 09:29:25.475818	2018-05-25 09:29:25.475818
1343	448	9	\N	2018-05-25 09:29:25.47829	2018-05-25 09:29:25.47829
1344	448	1	\N	2018-05-25 09:29:25.480357	2018-05-25 09:29:25.480357
1345	449	4	\N	2018-05-25 09:29:25.485804	2018-05-25 09:29:25.485804
1346	449	6	\N	2018-05-25 09:29:25.488158	2018-05-25 09:29:25.488158
1347	449	2	\N	2018-05-25 09:29:25.490676	2018-05-25 09:29:25.490676
1348	450	4	\N	2018-05-25 09:29:25.49624	2018-05-25 09:29:25.49624
1349	450	6	\N	2018-05-25 09:29:25.498851	2018-05-25 09:29:25.498851
1350	450	2	\N	2018-05-25 09:29:25.501484	2018-05-25 09:29:25.501484
1351	451	4	\N	2018-05-25 09:29:25.506287	2018-05-25 09:29:25.506287
1352	451	7	\N	2018-05-25 09:29:25.508404	2018-05-25 09:29:25.508404
1353	451	2	\N	2018-05-25 09:29:25.510389	2018-05-25 09:29:25.510389
1354	452	4	\N	2018-05-25 09:29:25.51476	2018-05-25 09:29:25.51476
1355	452	7	\N	2018-05-25 09:29:25.516689	2018-05-25 09:29:25.516689
1356	452	2	\N	2018-05-25 09:29:25.518666	2018-05-25 09:29:25.518666
1357	453	4	\N	2018-05-25 09:29:25.52341	2018-05-25 09:29:25.52341
1358	453	8	\N	2018-05-25 09:29:25.525544	2018-05-25 09:29:25.525544
1359	453	2	\N	2018-05-25 09:29:25.527622	2018-05-25 09:29:25.527622
1360	454	4	\N	2018-05-25 09:29:25.531683	2018-05-25 09:29:25.531683
1361	454	8	\N	2018-05-25 09:29:25.533713	2018-05-25 09:29:25.533713
1362	454	2	\N	2018-05-25 09:29:25.535649	2018-05-25 09:29:25.535649
1363	455	4	\N	2018-05-25 09:29:25.539606	2018-05-25 09:29:25.539606
1364	455	9	\N	2018-05-25 09:29:25.541501	2018-05-25 09:29:25.541501
1365	455	2	\N	2018-05-25 09:29:25.54323	2018-05-25 09:29:25.54323
1366	456	4	\N	2018-05-25 09:29:25.547155	2018-05-25 09:29:25.547155
1367	456	9	\N	2018-05-25 09:29:25.549209	2018-05-25 09:29:25.549209
1368	456	2	\N	2018-05-25 09:29:25.551301	2018-05-25 09:29:25.551301
1369	457	5	\N	2018-05-25 09:29:25.556023	2018-05-25 09:29:25.556023
1370	457	6	\N	2018-05-25 09:29:25.557963	2018-05-25 09:29:25.557963
1371	457	2	\N	2018-05-25 09:29:25.559965	2018-05-25 09:29:25.559965
1372	458	5	\N	2018-05-25 09:29:25.564096	2018-05-25 09:29:25.564096
1373	458	6	\N	2018-05-25 09:29:25.566095	2018-05-25 09:29:25.566095
1374	458	2	\N	2018-05-25 09:29:25.568239	2018-05-25 09:29:25.568239
1375	459	5	\N	2018-05-25 09:29:25.572835	2018-05-25 09:29:25.572835
1376	459	7	\N	2018-05-25 09:29:25.57495	2018-05-25 09:29:25.57495
1377	459	2	\N	2018-05-25 09:29:25.577006	2018-05-25 09:29:25.577006
1378	460	5	\N	2018-05-25 09:29:25.581255	2018-05-25 09:29:25.581255
1379	460	7	\N	2018-05-25 09:29:25.58334	2018-05-25 09:29:25.58334
1380	460	2	\N	2018-05-25 09:29:25.585538	2018-05-25 09:29:25.585538
1381	461	5	\N	2018-05-25 09:29:25.590781	2018-05-25 09:29:25.590781
1382	461	8	\N	2018-05-25 09:29:25.592678	2018-05-25 09:29:25.592678
1383	461	2	\N	2018-05-25 09:29:25.594493	2018-05-25 09:29:25.594493
1384	462	5	\N	2018-05-25 09:29:25.598435	2018-05-25 09:29:25.598435
1385	462	8	\N	2018-05-25 09:29:25.600189	2018-05-25 09:29:25.600189
1386	462	2	\N	2018-05-25 09:29:25.602537	2018-05-25 09:29:25.602537
1387	463	5	\N	2018-05-25 09:29:25.609164	2018-05-25 09:29:25.609164
1388	463	9	\N	2018-05-25 09:29:25.612712	2018-05-25 09:29:25.612712
1389	463	2	\N	2018-05-25 09:29:25.61607	2018-05-25 09:29:25.61607
1390	464	5	\N	2018-05-25 09:29:25.620167	2018-05-25 09:29:25.620167
1391	464	9	\N	2018-05-25 09:29:25.62196	2018-05-25 09:29:25.62196
1392	464	2	\N	2018-05-25 09:29:25.624293	2018-05-25 09:29:25.624293
1393	465	4	\N	2018-05-25 09:29:25.631306	2018-05-25 09:29:25.631306
1394	465	6	\N	2018-05-25 09:29:25.633248	2018-05-25 09:29:25.633248
1395	465	3	\N	2018-05-25 09:29:25.63532	2018-05-25 09:29:25.63532
1396	466	4	\N	2018-05-25 09:29:25.639438	2018-05-25 09:29:25.639438
1397	466	6	\N	2018-05-25 09:29:25.641343	2018-05-25 09:29:25.641343
1398	466	3	\N	2018-05-25 09:29:25.643398	2018-05-25 09:29:25.643398
1399	467	4	\N	2018-05-25 09:29:25.649692	2018-05-25 09:29:25.649692
1400	467	7	\N	2018-05-25 09:29:25.651806	2018-05-25 09:29:25.651806
1401	467	3	\N	2018-05-25 09:29:25.653848	2018-05-25 09:29:25.653848
1402	468	4	\N	2018-05-25 09:29:25.658099	2018-05-25 09:29:25.658099
1403	468	7	\N	2018-05-25 09:29:25.659902	2018-05-25 09:29:25.659902
1404	468	3	\N	2018-05-25 09:29:25.661782	2018-05-25 09:29:25.661782
1405	469	4	\N	2018-05-25 09:29:25.665864	2018-05-25 09:29:25.665864
1406	469	8	\N	2018-05-25 09:29:25.667683	2018-05-25 09:29:25.667683
1407	469	3	\N	2018-05-25 09:29:25.669394	2018-05-25 09:29:25.669394
1408	470	4	\N	2018-05-25 09:29:25.673341	2018-05-25 09:29:25.673341
1409	470	8	\N	2018-05-25 09:29:25.675332	2018-05-25 09:29:25.675332
1410	470	3	\N	2018-05-25 09:29:25.677356	2018-05-25 09:29:25.677356
1411	471	4	\N	2018-05-25 09:29:25.681606	2018-05-25 09:29:25.681606
1412	471	9	\N	2018-05-25 09:29:25.683674	2018-05-25 09:29:25.683674
1413	471	3	\N	2018-05-25 09:29:25.685728	2018-05-25 09:29:25.685728
1414	472	4	\N	2018-05-25 09:29:25.689674	2018-05-25 09:29:25.689674
1415	472	9	\N	2018-05-25 09:29:25.6914	2018-05-25 09:29:25.6914
1416	472	3	\N	2018-05-25 09:29:25.693248	2018-05-25 09:29:25.693248
1417	473	5	\N	2018-05-25 09:29:25.697641	2018-05-25 09:29:25.697641
1418	473	6	\N	2018-05-25 09:29:25.699739	2018-05-25 09:29:25.699739
1419	473	3	\N	2018-05-25 09:29:25.701618	2018-05-25 09:29:25.701618
1420	474	5	\N	2018-05-25 09:29:25.705658	2018-05-25 09:29:25.705658
1421	474	6	\N	2018-05-25 09:29:25.707581	2018-05-25 09:29:25.707581
1422	474	3	\N	2018-05-25 09:29:25.70974	2018-05-25 09:29:25.70974
1423	475	5	\N	2018-05-25 09:29:25.714707	2018-05-25 09:29:25.714707
1424	475	7	\N	2018-05-25 09:29:25.717062	2018-05-25 09:29:25.717062
1425	475	3	\N	2018-05-25 09:29:25.719233	2018-05-25 09:29:25.719233
1426	476	5	\N	2018-05-25 09:29:25.724108	2018-05-25 09:29:25.724108
1427	476	7	\N	2018-05-25 09:29:25.726687	2018-05-25 09:29:25.726687
1428	476	3	\N	2018-05-25 09:29:25.728648	2018-05-25 09:29:25.728648
1429	477	5	\N	2018-05-25 09:29:25.732663	2018-05-25 09:29:25.732663
1430	477	8	\N	2018-05-25 09:29:25.734629	2018-05-25 09:29:25.734629
1431	477	3	\N	2018-05-25 09:29:25.736471	2018-05-25 09:29:25.736471
1432	478	5	\N	2018-05-25 09:29:25.740607	2018-05-25 09:29:25.740607
1433	478	8	\N	2018-05-25 09:29:25.743053	2018-05-25 09:29:25.743053
1434	478	3	\N	2018-05-25 09:29:25.74503	2018-05-25 09:29:25.74503
1435	479	5	\N	2018-05-25 09:29:25.748957	2018-05-25 09:29:25.748957
1436	479	9	\N	2018-05-25 09:29:25.750782	2018-05-25 09:29:25.750782
1437	479	3	\N	2018-05-25 09:29:25.752708	2018-05-25 09:29:25.752708
1438	480	5	\N	2018-05-25 09:29:25.756598	2018-05-25 09:29:25.756598
1439	480	9	\N	2018-05-25 09:29:25.758361	2018-05-25 09:29:25.758361
1440	480	3	\N	2018-05-25 09:29:25.760431	2018-05-25 09:29:25.760431
1441	481	4	\N	2018-05-25 09:29:25.766135	2018-05-25 09:29:25.766135
1442	481	6	\N	2018-05-25 09:29:25.767999	2018-05-25 09:29:25.767999
1443	481	1	\N	2018-05-25 09:29:25.769772	2018-05-25 09:29:25.769772
1444	482	4	\N	2018-05-25 09:29:25.773428	2018-05-25 09:29:25.773428
1445	482	6	\N	2018-05-25 09:29:25.775196	2018-05-25 09:29:25.775196
1446	482	1	\N	2018-05-25 09:29:25.777077	2018-05-25 09:29:25.777077
1447	483	4	\N	2018-05-25 09:29:25.781541	2018-05-25 09:29:25.781541
1448	483	7	\N	2018-05-25 09:29:25.783446	2018-05-25 09:29:25.783446
1449	483	1	\N	2018-05-25 09:29:25.785362	2018-05-25 09:29:25.785362
1450	484	4	\N	2018-05-25 09:29:25.789447	2018-05-25 09:29:25.789447
1451	484	7	\N	2018-05-25 09:29:25.791503	2018-05-25 09:29:25.791503
1452	484	1	\N	2018-05-25 09:29:25.793509	2018-05-25 09:29:25.793509
1453	485	4	\N	2018-05-25 09:29:25.798042	2018-05-25 09:29:25.798042
1454	485	8	\N	2018-05-25 09:29:25.800308	2018-05-25 09:29:25.800308
1455	485	1	\N	2018-05-25 09:29:25.802409	2018-05-25 09:29:25.802409
1456	486	4	\N	2018-05-25 09:29:25.80642	2018-05-25 09:29:25.80642
1457	486	8	\N	2018-05-25 09:29:25.808359	2018-05-25 09:29:25.808359
1458	486	1	\N	2018-05-25 09:29:25.810174	2018-05-25 09:29:25.810174
1459	487	4	\N	2018-05-25 09:29:25.814145	2018-05-25 09:29:25.814145
1460	487	9	\N	2018-05-25 09:29:25.816052	2018-05-25 09:29:25.816052
1461	487	1	\N	2018-05-25 09:29:25.817968	2018-05-25 09:29:25.817968
1462	488	4	\N	2018-05-25 09:29:25.821826	2018-05-25 09:29:25.821826
1463	488	9	\N	2018-05-25 09:29:25.823543	2018-05-25 09:29:25.823543
1464	488	1	\N	2018-05-25 09:29:25.825536	2018-05-25 09:29:25.825536
1465	489	5	\N	2018-05-25 09:29:25.830265	2018-05-25 09:29:25.830265
1466	489	6	\N	2018-05-25 09:29:25.83224	2018-05-25 09:29:25.83224
1467	489	1	\N	2018-05-25 09:29:25.834227	2018-05-25 09:29:25.834227
1468	490	5	\N	2018-05-25 09:29:25.839021	2018-05-25 09:29:25.839021
1469	490	6	\N	2018-05-25 09:29:25.840999	2018-05-25 09:29:25.840999
1470	490	1	\N	2018-05-25 09:29:25.842986	2018-05-25 09:29:25.842986
1471	491	5	\N	2018-05-25 09:29:25.846941	2018-05-25 09:29:25.846941
1472	491	7	\N	2018-05-25 09:29:25.848717	2018-05-25 09:29:25.848717
1473	491	1	\N	2018-05-25 09:29:25.850291	2018-05-25 09:29:25.850291
1474	492	5	\N	2018-05-25 09:29:25.853765	2018-05-25 09:29:25.853765
1475	492	7	\N	2018-05-25 09:29:25.855278	2018-05-25 09:29:25.855278
1476	492	1	\N	2018-05-25 09:29:25.857058	2018-05-25 09:29:25.857058
1477	493	5	\N	2018-05-25 09:29:25.860793	2018-05-25 09:29:25.860793
1478	493	8	\N	2018-05-25 09:29:25.862366	2018-05-25 09:29:25.862366
1479	493	1	\N	2018-05-25 09:29:25.86395	2018-05-25 09:29:25.86395
1480	494	5	\N	2018-05-25 09:29:25.867805	2018-05-25 09:29:25.867805
1481	494	8	\N	2018-05-25 09:29:25.869415	2018-05-25 09:29:25.869415
1482	494	1	\N	2018-05-25 09:29:25.871232	2018-05-25 09:29:25.871232
1483	495	5	\N	2018-05-25 09:29:25.875082	2018-05-25 09:29:25.875082
1484	495	9	\N	2018-05-25 09:29:25.877012	2018-05-25 09:29:25.877012
1485	495	1	\N	2018-05-25 09:29:25.878948	2018-05-25 09:29:25.878948
1486	496	5	\N	2018-05-25 09:29:25.882955	2018-05-25 09:29:25.882955
1487	496	9	\N	2018-05-25 09:29:25.884827	2018-05-25 09:29:25.884827
1488	496	1	\N	2018-05-25 09:29:25.88671	2018-05-25 09:29:25.88671
1489	497	4	\N	2018-05-25 09:29:25.891881	2018-05-25 09:29:25.891881
1490	497	6	\N	2018-05-25 09:29:25.893842	2018-05-25 09:29:25.893842
1491	497	2	\N	2018-05-25 09:29:25.895733	2018-05-25 09:29:25.895733
1492	498	4	\N	2018-05-25 09:29:25.899715	2018-05-25 09:29:25.899715
1493	498	6	\N	2018-05-25 09:29:25.901519	2018-05-25 09:29:25.901519
1494	498	2	\N	2018-05-25 09:29:25.903378	2018-05-25 09:29:25.903378
1495	499	4	\N	2018-05-25 09:29:25.907963	2018-05-25 09:29:25.907963
1496	499	7	\N	2018-05-25 09:29:25.911097	2018-05-25 09:29:25.911097
1497	499	2	\N	2018-05-25 09:29:25.913075	2018-05-25 09:29:25.913075
1498	500	4	\N	2018-05-25 09:29:25.917061	2018-05-25 09:29:25.917061
1499	500	7	\N	2018-05-25 09:29:25.918887	2018-05-25 09:29:25.918887
1500	500	2	\N	2018-05-25 09:29:25.920941	2018-05-25 09:29:25.920941
1501	501	4	\N	2018-05-25 09:29:25.925481	2018-05-25 09:29:25.925481
1502	501	8	\N	2018-05-25 09:29:25.927877	2018-05-25 09:29:25.927877
1503	501	2	\N	2018-05-25 09:29:25.929972	2018-05-25 09:29:25.929972
1504	502	4	\N	2018-05-25 09:29:25.93472	2018-05-25 09:29:25.93472
1505	502	8	\N	2018-05-25 09:29:25.936956	2018-05-25 09:29:25.936956
1506	502	2	\N	2018-05-25 09:29:25.939138	2018-05-25 09:29:25.939138
1507	503	4	\N	2018-05-25 09:29:25.943888	2018-05-25 09:29:25.943888
1508	503	9	\N	2018-05-25 09:29:25.946896	2018-05-25 09:29:25.946896
1509	503	2	\N	2018-05-25 09:29:25.94926	2018-05-25 09:29:25.94926
1510	504	4	\N	2018-05-25 09:29:25.953775	2018-05-25 09:29:25.953775
1511	504	9	\N	2018-05-25 09:29:25.955712	2018-05-25 09:29:25.955712
1512	504	2	\N	2018-05-25 09:29:25.957593	2018-05-25 09:29:25.957593
1513	505	5	\N	2018-05-25 09:29:25.962931	2018-05-25 09:29:25.962931
1514	505	6	\N	2018-05-25 09:29:25.965502	2018-05-25 09:29:25.965502
1515	505	2	\N	2018-05-25 09:29:25.968168	2018-05-25 09:29:25.968168
1516	506	5	\N	2018-05-25 09:29:25.973514	2018-05-25 09:29:25.973514
1517	506	6	\N	2018-05-25 09:29:25.975776	2018-05-25 09:29:25.975776
1518	506	2	\N	2018-05-25 09:29:25.978005	2018-05-25 09:29:25.978005
1519	507	5	\N	2018-05-25 09:29:25.98346	2018-05-25 09:29:25.98346
1520	507	7	\N	2018-05-25 09:29:25.985903	2018-05-25 09:29:25.985903
1521	507	2	\N	2018-05-25 09:29:25.988141	2018-05-25 09:29:25.988141
1522	508	5	\N	2018-05-25 09:29:25.993543	2018-05-25 09:29:25.993543
1523	508	7	\N	2018-05-25 09:29:25.995876	2018-05-25 09:29:25.995876
1524	508	2	\N	2018-05-25 09:29:25.998406	2018-05-25 09:29:25.998406
1525	509	5	\N	2018-05-25 09:29:26.003831	2018-05-25 09:29:26.003831
1526	509	8	\N	2018-05-25 09:29:26.006342	2018-05-25 09:29:26.006342
1527	509	2	\N	2018-05-25 09:29:26.008906	2018-05-25 09:29:26.008906
1528	510	5	\N	2018-05-25 09:29:26.015391	2018-05-25 09:29:26.015391
1529	510	8	\N	2018-05-25 09:29:26.017506	2018-05-25 09:29:26.017506
1530	510	2	\N	2018-05-25 09:29:26.019323	2018-05-25 09:29:26.019323
1531	511	5	\N	2018-05-25 09:29:26.023593	2018-05-25 09:29:26.023593
1532	511	9	\N	2018-05-25 09:29:26.02594	2018-05-25 09:29:26.02594
1533	511	2	\N	2018-05-25 09:29:26.028161	2018-05-25 09:29:26.028161
1534	512	5	\N	2018-05-25 09:29:26.032385	2018-05-25 09:29:26.032385
1535	512	9	\N	2018-05-25 09:29:26.034309	2018-05-25 09:29:26.034309
1536	512	2	\N	2018-05-25 09:29:26.036187	2018-05-25 09:29:26.036187
1537	513	4	\N	2018-05-25 09:29:26.040934	2018-05-25 09:29:26.040934
1538	513	6	\N	2018-05-25 09:29:26.042685	2018-05-25 09:29:26.042685
1539	513	3	\N	2018-05-25 09:29:26.044647	2018-05-25 09:29:26.044647
1540	514	4	\N	2018-05-25 09:29:26.048825	2018-05-25 09:29:26.048825
1541	514	6	\N	2018-05-25 09:29:26.050938	2018-05-25 09:29:26.050938
1542	514	3	\N	2018-05-25 09:29:26.05279	2018-05-25 09:29:26.05279
1543	515	4	\N	2018-05-25 09:29:26.057099	2018-05-25 09:29:26.057099
1544	515	7	\N	2018-05-25 09:29:26.059005	2018-05-25 09:29:26.059005
1545	515	3	\N	2018-05-25 09:29:26.060948	2018-05-25 09:29:26.060948
1546	516	4	\N	2018-05-25 09:29:26.065142	2018-05-25 09:29:26.065142
1547	516	7	\N	2018-05-25 09:29:26.067264	2018-05-25 09:29:26.067264
1548	516	3	\N	2018-05-25 09:29:26.069151	2018-05-25 09:29:26.069151
1549	517	4	\N	2018-05-25 09:29:26.072731	2018-05-25 09:29:26.072731
1550	517	8	\N	2018-05-25 09:29:26.074304	2018-05-25 09:29:26.074304
1551	517	3	\N	2018-05-25 09:29:26.075977	2018-05-25 09:29:26.075977
1552	518	4	\N	2018-05-25 09:29:26.079443	2018-05-25 09:29:26.079443
1553	518	8	\N	2018-05-25 09:29:26.08105	2018-05-25 09:29:26.08105
1554	518	3	\N	2018-05-25 09:29:26.082616	2018-05-25 09:29:26.082616
1555	519	4	\N	2018-05-25 09:29:26.086305	2018-05-25 09:29:26.086305
1556	519	9	\N	2018-05-25 09:29:26.087883	2018-05-25 09:29:26.087883
1557	519	3	\N	2018-05-25 09:29:26.08943	2018-05-25 09:29:26.08943
1558	520	4	\N	2018-05-25 09:29:26.094143	2018-05-25 09:29:26.094143
1559	520	9	\N	2018-05-25 09:29:26.095883	2018-05-25 09:29:26.095883
1560	520	3	\N	2018-05-25 09:29:26.097744	2018-05-25 09:29:26.097744
1561	521	5	\N	2018-05-25 09:29:26.103903	2018-05-25 09:29:26.103903
1562	521	6	\N	2018-05-25 09:29:26.106333	2018-05-25 09:29:26.106333
1563	521	3	\N	2018-05-25 09:29:26.109019	2018-05-25 09:29:26.109019
1564	522	5	\N	2018-05-25 09:29:26.113589	2018-05-25 09:29:26.113589
1565	522	6	\N	2018-05-25 09:29:26.116168	2018-05-25 09:29:26.116168
1566	522	3	\N	2018-05-25 09:29:26.118519	2018-05-25 09:29:26.118519
1567	523	5	\N	2018-05-25 09:29:26.123242	2018-05-25 09:29:26.123242
1568	523	7	\N	2018-05-25 09:29:26.129291	2018-05-25 09:29:26.129291
1569	523	3	\N	2018-05-25 09:29:26.131494	2018-05-25 09:29:26.131494
1570	524	5	\N	2018-05-25 09:29:26.136045	2018-05-25 09:29:26.136045
1571	524	7	\N	2018-05-25 09:29:26.138224	2018-05-25 09:29:26.138224
1572	524	3	\N	2018-05-25 09:29:26.140948	2018-05-25 09:29:26.140948
1573	525	5	\N	2018-05-25 09:29:26.14626	2018-05-25 09:29:26.14626
1574	525	8	\N	2018-05-25 09:29:26.148544	2018-05-25 09:29:26.148544
1575	525	3	\N	2018-05-25 09:29:26.151157	2018-05-25 09:29:26.151157
1576	526	5	\N	2018-05-25 09:29:26.155879	2018-05-25 09:29:26.155879
1577	526	8	\N	2018-05-25 09:29:26.158704	2018-05-25 09:29:26.158704
1578	526	3	\N	2018-05-25 09:29:26.161326	2018-05-25 09:29:26.161326
1579	527	5	\N	2018-05-25 09:29:26.165891	2018-05-25 09:29:26.165891
1580	527	9	\N	2018-05-25 09:29:26.168037	2018-05-25 09:29:26.168037
1581	527	3	\N	2018-05-25 09:29:26.170209	2018-05-25 09:29:26.170209
1582	528	5	\N	2018-05-25 09:29:26.175446	2018-05-25 09:29:26.175446
1583	528	9	\N	2018-05-25 09:29:26.177686	2018-05-25 09:29:26.177686
1584	528	3	\N	2018-05-25 09:29:26.180826	2018-05-25 09:29:26.180826
1585	529	4	\N	2018-05-25 09:29:26.187955	2018-05-25 09:29:26.187955
1586	529	6	\N	2018-05-25 09:29:26.190525	2018-05-25 09:29:26.190525
1587	529	1	\N	2018-05-25 09:29:26.192942	2018-05-25 09:29:26.192942
1588	530	4	\N	2018-05-25 09:29:26.197577	2018-05-25 09:29:26.197577
1589	530	6	\N	2018-05-25 09:29:26.199665	2018-05-25 09:29:26.199665
1590	530	1	\N	2018-05-25 09:29:26.201847	2018-05-25 09:29:26.201847
1591	531	4	\N	2018-05-25 09:29:26.206636	2018-05-25 09:29:26.206636
1592	531	7	\N	2018-05-25 09:29:26.208621	2018-05-25 09:29:26.208621
1593	531	1	\N	2018-05-25 09:29:26.210749	2018-05-25 09:29:26.210749
1594	532	4	\N	2018-05-25 09:29:26.214959	2018-05-25 09:29:26.214959
1595	532	7	\N	2018-05-25 09:29:26.216836	2018-05-25 09:29:26.216836
1596	532	1	\N	2018-05-25 09:29:26.219079	2018-05-25 09:29:26.219079
1597	533	4	\N	2018-05-25 09:29:26.223302	2018-05-25 09:29:26.223302
1598	533	8	\N	2018-05-25 09:29:26.225331	2018-05-25 09:29:26.225331
1599	533	1	\N	2018-05-25 09:29:26.227793	2018-05-25 09:29:26.227793
1600	534	4	\N	2018-05-25 09:29:26.233438	2018-05-25 09:29:26.233438
1601	534	8	\N	2018-05-25 09:29:26.235334	2018-05-25 09:29:26.235334
1602	534	1	\N	2018-05-25 09:29:26.237083	2018-05-25 09:29:26.237083
1603	535	4	\N	2018-05-25 09:29:26.241571	2018-05-25 09:29:26.241571
1604	535	9	\N	2018-05-25 09:29:26.243849	2018-05-25 09:29:26.243849
1605	535	1	\N	2018-05-25 09:29:26.246146	2018-05-25 09:29:26.246146
1606	536	4	\N	2018-05-25 09:29:26.250468	2018-05-25 09:29:26.250468
1607	536	9	\N	2018-05-25 09:29:26.252294	2018-05-25 09:29:26.252294
1608	536	1	\N	2018-05-25 09:29:26.254219	2018-05-25 09:29:26.254219
1609	537	5	\N	2018-05-25 09:29:26.258626	2018-05-25 09:29:26.258626
1610	537	6	\N	2018-05-25 09:29:26.260485	2018-05-25 09:29:26.260485
1611	537	1	\N	2018-05-25 09:29:26.262624	2018-05-25 09:29:26.262624
1612	538	5	\N	2018-05-25 09:29:26.266881	2018-05-25 09:29:26.266881
1613	538	6	\N	2018-05-25 09:29:26.268696	2018-05-25 09:29:26.268696
1614	538	1	\N	2018-05-25 09:29:26.270798	2018-05-25 09:29:26.270798
1615	539	5	\N	2018-05-25 09:29:26.275224	2018-05-25 09:29:26.275224
1616	539	7	\N	2018-05-25 09:29:26.277416	2018-05-25 09:29:26.277416
1617	539	1	\N	2018-05-25 09:29:26.279489	2018-05-25 09:29:26.279489
1618	540	5	\N	2018-05-25 09:29:26.283819	2018-05-25 09:29:26.283819
1619	540	7	\N	2018-05-25 09:29:26.285684	2018-05-25 09:29:26.285684
1620	540	1	\N	2018-05-25 09:29:26.287636	2018-05-25 09:29:26.287636
1621	541	5	\N	2018-05-25 09:29:26.291759	2018-05-25 09:29:26.291759
1622	541	8	\N	2018-05-25 09:29:26.293616	2018-05-25 09:29:26.293616
1623	541	1	\N	2018-05-25 09:29:26.295444	2018-05-25 09:29:26.295444
1624	542	5	\N	2018-05-25 09:29:26.299241	2018-05-25 09:29:26.299241
1625	542	8	\N	2018-05-25 09:29:26.301249	2018-05-25 09:29:26.301249
1626	542	1	\N	2018-05-25 09:29:26.303081	2018-05-25 09:29:26.303081
1627	543	5	\N	2018-05-25 09:29:26.307304	2018-05-25 09:29:26.307304
1628	543	9	\N	2018-05-25 09:29:26.309214	2018-05-25 09:29:26.309214
1629	543	1	\N	2018-05-25 09:29:26.310955	2018-05-25 09:29:26.310955
1630	544	5	\N	2018-05-25 09:29:26.314864	2018-05-25 09:29:26.314864
1631	544	9	\N	2018-05-25 09:29:26.316745	2018-05-25 09:29:26.316745
1632	544	1	\N	2018-05-25 09:29:26.318603	2018-05-25 09:29:26.318603
1633	545	4	\N	2018-05-25 09:29:26.323091	2018-05-25 09:29:26.323091
1634	545	6	\N	2018-05-25 09:29:26.324934	2018-05-25 09:29:26.324934
1635	545	2	\N	2018-05-25 09:29:26.32665	2018-05-25 09:29:26.32665
1636	546	4	\N	2018-05-25 09:29:26.330606	2018-05-25 09:29:26.330606
1637	546	6	\N	2018-05-25 09:29:26.332593	2018-05-25 09:29:26.332593
1638	546	2	\N	2018-05-25 09:29:26.33454	2018-05-25 09:29:26.33454
1639	547	4	\N	2018-05-25 09:29:26.338902	2018-05-25 09:29:26.338902
1640	547	7	\N	2018-05-25 09:29:26.340915	2018-05-25 09:29:26.340915
1641	547	2	\N	2018-05-25 09:29:26.342791	2018-05-25 09:29:26.342791
1642	548	4	\N	2018-05-25 09:29:26.346642	2018-05-25 09:29:26.346642
1643	548	7	\N	2018-05-25 09:29:26.348724	2018-05-25 09:29:26.348724
1644	548	2	\N	2018-05-25 09:29:26.350667	2018-05-25 09:29:26.350667
1645	549	4	\N	2018-05-25 09:29:26.354385	2018-05-25 09:29:26.354385
1646	549	8	\N	2018-05-25 09:29:26.356132	2018-05-25 09:29:26.356132
1647	549	2	\N	2018-05-25 09:29:26.358229	2018-05-25 09:29:26.358229
1648	550	4	\N	2018-05-25 09:29:26.363087	2018-05-25 09:29:26.363087
1649	550	8	\N	2018-05-25 09:29:26.365162	2018-05-25 09:29:26.365162
1650	550	2	\N	2018-05-25 09:29:26.367146	2018-05-25 09:29:26.367146
1651	551	4	\N	2018-05-25 09:29:26.371005	2018-05-25 09:29:26.371005
1652	551	9	\N	2018-05-25 09:29:26.373026	2018-05-25 09:29:26.373026
1653	551	2	\N	2018-05-25 09:29:26.374934	2018-05-25 09:29:26.374934
1654	552	4	\N	2018-05-25 09:29:26.378662	2018-05-25 09:29:26.378662
1655	552	9	\N	2018-05-25 09:29:26.38071	2018-05-25 09:29:26.38071
1656	552	2	\N	2018-05-25 09:29:26.382508	2018-05-25 09:29:26.382508
1657	553	5	\N	2018-05-25 09:29:26.386952	2018-05-25 09:29:26.386952
1658	553	6	\N	2018-05-25 09:29:26.388752	2018-05-25 09:29:26.388752
1659	553	2	\N	2018-05-25 09:29:26.390522	2018-05-25 09:29:26.390522
1660	554	5	\N	2018-05-25 09:29:26.394296	2018-05-25 09:29:26.394296
1661	554	6	\N	2018-05-25 09:29:26.396047	2018-05-25 09:29:26.396047
1662	554	2	\N	2018-05-25 09:29:26.397835	2018-05-25 09:29:26.397835
1663	555	5	\N	2018-05-25 09:29:26.401991	2018-05-25 09:29:26.401991
1664	555	7	\N	2018-05-25 09:29:26.403872	2018-05-25 09:29:26.403872
1665	555	2	\N	2018-05-25 09:29:26.405742	2018-05-25 09:29:26.405742
1666	556	5	\N	2018-05-25 09:29:26.410062	2018-05-25 09:29:26.410062
1667	556	7	\N	2018-05-25 09:29:26.411922	2018-05-25 09:29:26.411922
1668	556	2	\N	2018-05-25 09:29:26.413826	2018-05-25 09:29:26.413826
1669	557	5	\N	2018-05-25 09:29:26.418038	2018-05-25 09:29:26.418038
1670	557	8	\N	2018-05-25 09:29:26.420637	2018-05-25 09:29:26.420637
1671	557	2	\N	2018-05-25 09:29:26.422818	2018-05-25 09:29:26.422818
1672	558	5	\N	2018-05-25 09:29:26.427734	2018-05-25 09:29:26.427734
1673	558	8	\N	2018-05-25 09:29:26.429836	2018-05-25 09:29:26.429836
1674	558	2	\N	2018-05-25 09:29:26.431781	2018-05-25 09:29:26.431781
1675	559	5	\N	2018-05-25 09:29:26.435913	2018-05-25 09:29:26.435913
1676	559	9	\N	2018-05-25 09:29:26.438052	2018-05-25 09:29:26.438052
1677	559	2	\N	2018-05-25 09:29:26.439955	2018-05-25 09:29:26.439955
1678	560	5	\N	2018-05-25 09:29:26.443965	2018-05-25 09:29:26.443965
1679	560	9	\N	2018-05-25 09:29:26.445857	2018-05-25 09:29:26.445857
1680	560	2	\N	2018-05-25 09:29:26.447977	2018-05-25 09:29:26.447977
1681	561	4	\N	2018-05-25 09:29:26.456648	2018-05-25 09:29:26.456648
1682	561	6	\N	2018-05-25 09:29:26.458825	2018-05-25 09:29:26.458825
1683	561	3	\N	2018-05-25 09:29:26.460612	2018-05-25 09:29:26.460612
1684	562	4	\N	2018-05-25 09:29:26.464722	2018-05-25 09:29:26.464722
1685	562	6	\N	2018-05-25 09:29:26.46663	2018-05-25 09:29:26.46663
1686	562	3	\N	2018-05-25 09:29:26.468397	2018-05-25 09:29:26.468397
1687	563	4	\N	2018-05-25 09:29:26.472512	2018-05-25 09:29:26.472512
1688	563	7	\N	2018-05-25 09:29:26.47476	2018-05-25 09:29:26.47476
1689	563	3	\N	2018-05-25 09:29:26.477019	2018-05-25 09:29:26.477019
1690	564	4	\N	2018-05-25 09:29:26.481171	2018-05-25 09:29:26.481171
1691	564	7	\N	2018-05-25 09:29:26.483	2018-05-25 09:29:26.483
1692	564	3	\N	2018-05-25 09:29:26.484831	2018-05-25 09:29:26.484831
1693	565	4	\N	2018-05-25 09:29:26.488673	2018-05-25 09:29:26.488673
1694	565	8	\N	2018-05-25 09:29:26.490527	2018-05-25 09:29:26.490527
1695	565	3	\N	2018-05-25 09:29:26.492378	2018-05-25 09:29:26.492378
1696	566	4	\N	2018-05-25 09:29:26.496663	2018-05-25 09:29:26.496663
1697	566	8	\N	2018-05-25 09:29:26.498458	2018-05-25 09:29:26.498458
1698	566	3	\N	2018-05-25 09:29:26.500298	2018-05-25 09:29:26.500298
1699	567	4	\N	2018-05-25 09:29:26.50437	2018-05-25 09:29:26.50437
1700	567	9	\N	2018-05-25 09:29:26.506164	2018-05-25 09:29:26.506164
1701	567	3	\N	2018-05-25 09:29:26.50798	2018-05-25 09:29:26.50798
1702	568	4	\N	2018-05-25 09:29:26.512708	2018-05-25 09:29:26.512708
1703	568	9	\N	2018-05-25 09:29:26.514782	2018-05-25 09:29:26.514782
1704	568	3	\N	2018-05-25 09:29:26.516834	2018-05-25 09:29:26.516834
1705	569	5	\N	2018-05-25 09:29:26.521746	2018-05-25 09:29:26.521746
1706	569	6	\N	2018-05-25 09:29:26.523689	2018-05-25 09:29:26.523689
1707	569	3	\N	2018-05-25 09:29:26.525665	2018-05-25 09:29:26.525665
1708	570	5	\N	2018-05-25 09:29:26.531378	2018-05-25 09:29:26.531378
1709	570	6	\N	2018-05-25 09:29:26.533294	2018-05-25 09:29:26.533294
1710	570	3	\N	2018-05-25 09:29:26.535243	2018-05-25 09:29:26.535243
1711	571	5	\N	2018-05-25 09:29:26.53938	2018-05-25 09:29:26.53938
1712	571	7	\N	2018-05-25 09:29:26.541327	2018-05-25 09:29:26.541327
1713	571	3	\N	2018-05-25 09:29:26.543252	2018-05-25 09:29:26.543252
1714	572	5	\N	2018-05-25 09:29:26.548005	2018-05-25 09:29:26.548005
1715	572	7	\N	2018-05-25 09:29:26.550092	2018-05-25 09:29:26.550092
1716	572	3	\N	2018-05-25 09:29:26.55209	2018-05-25 09:29:26.55209
1717	573	5	\N	2018-05-25 09:29:26.557122	2018-05-25 09:29:26.557122
1718	573	8	\N	2018-05-25 09:29:26.559068	2018-05-25 09:29:26.559068
1719	573	3	\N	2018-05-25 09:29:26.561043	2018-05-25 09:29:26.561043
1720	574	5	\N	2018-05-25 09:29:26.565685	2018-05-25 09:29:26.565685
1721	574	8	\N	2018-05-25 09:29:26.567733	2018-05-25 09:29:26.567733
1722	574	3	\N	2018-05-25 09:29:26.569604	2018-05-25 09:29:26.569604
1723	575	5	\N	2018-05-25 09:29:26.573507	2018-05-25 09:29:26.573507
1724	575	9	\N	2018-05-25 09:29:26.575229	2018-05-25 09:29:26.575229
1725	575	3	\N	2018-05-25 09:29:26.57682	2018-05-25 09:29:26.57682
1726	576	5	\N	2018-05-25 09:29:26.580383	2018-05-25 09:29:26.580383
1727	576	9	\N	2018-05-25 09:29:26.581983	2018-05-25 09:29:26.581983
1728	576	3	\N	2018-05-25 09:29:26.583582	2018-05-25 09:29:26.583582
1729	577	4	\N	2018-05-25 09:29:26.588204	2018-05-25 09:29:26.588204
1730	577	6	\N	2018-05-25 09:29:26.590131	2018-05-25 09:29:26.590131
1731	577	1	\N	2018-05-25 09:29:26.591832	2018-05-25 09:29:26.591832
1732	578	4	\N	2018-05-25 09:29:26.596046	2018-05-25 09:29:26.596046
1733	578	6	\N	2018-05-25 09:29:26.597839	2018-05-25 09:29:26.597839
1734	578	1	\N	2018-05-25 09:29:26.59972	2018-05-25 09:29:26.59972
1735	579	4	\N	2018-05-25 09:29:26.605123	2018-05-25 09:29:26.605123
1736	579	7	\N	2018-05-25 09:29:26.607627	2018-05-25 09:29:26.607627
1737	579	1	\N	2018-05-25 09:29:26.609524	2018-05-25 09:29:26.609524
1738	580	4	\N	2018-05-25 09:29:26.613762	2018-05-25 09:29:26.613762
1739	580	7	\N	2018-05-25 09:29:26.615602	2018-05-25 09:29:26.615602
1740	580	1	\N	2018-05-25 09:29:26.617568	2018-05-25 09:29:26.617568
1741	581	4	\N	2018-05-25 09:29:26.621686	2018-05-25 09:29:26.621686
1742	581	8	\N	2018-05-25 09:29:26.623759	2018-05-25 09:29:26.623759
1743	581	1	\N	2018-05-25 09:29:26.626509	2018-05-25 09:29:26.626509
1744	582	4	\N	2018-05-25 09:29:26.630819	2018-05-25 09:29:26.630819
1745	582	8	\N	2018-05-25 09:29:26.632681	2018-05-25 09:29:26.632681
1746	582	1	\N	2018-05-25 09:29:26.634577	2018-05-25 09:29:26.634577
1747	583	4	\N	2018-05-25 09:29:26.638739	2018-05-25 09:29:26.638739
1748	583	9	\N	2018-05-25 09:29:26.640765	2018-05-25 09:29:26.640765
1749	583	1	\N	2018-05-25 09:29:26.643071	2018-05-25 09:29:26.643071
1750	584	4	\N	2018-05-25 09:29:26.647183	2018-05-25 09:29:26.647183
1751	584	9	\N	2018-05-25 09:29:26.648996	2018-05-25 09:29:26.648996
1752	584	1	\N	2018-05-25 09:29:26.65081	2018-05-25 09:29:26.65081
1753	585	5	\N	2018-05-25 09:29:26.654905	2018-05-25 09:29:26.654905
1754	585	6	\N	2018-05-25 09:29:26.656835	2018-05-25 09:29:26.656835
1755	585	1	\N	2018-05-25 09:29:26.658784	2018-05-25 09:29:26.658784
1756	586	5	\N	2018-05-25 09:29:26.662886	2018-05-25 09:29:26.662886
1757	586	6	\N	2018-05-25 09:29:26.664996	2018-05-25 09:29:26.664996
1758	586	1	\N	2018-05-25 09:29:26.667041	2018-05-25 09:29:26.667041
1759	587	5	\N	2018-05-25 09:29:26.671116	2018-05-25 09:29:26.671116
1760	587	7	\N	2018-05-25 09:29:26.673168	2018-05-25 09:29:26.673168
1761	587	1	\N	2018-05-25 09:29:26.675247	2018-05-25 09:29:26.675247
1762	588	5	\N	2018-05-25 09:29:26.679585	2018-05-25 09:29:26.679585
1763	588	7	\N	2018-05-25 09:29:26.681548	2018-05-25 09:29:26.681548
1764	588	1	\N	2018-05-25 09:29:26.683545	2018-05-25 09:29:26.683545
1765	589	5	\N	2018-05-25 09:29:26.687731	2018-05-25 09:29:26.687731
1766	589	8	\N	2018-05-25 09:29:26.689679	2018-05-25 09:29:26.689679
1767	589	1	\N	2018-05-25 09:29:26.691621	2018-05-25 09:29:26.691621
1768	590	5	\N	2018-05-25 09:29:26.695673	2018-05-25 09:29:26.695673
1769	590	8	\N	2018-05-25 09:29:26.697732	2018-05-25 09:29:26.697732
1770	590	1	\N	2018-05-25 09:29:26.699664	2018-05-25 09:29:26.699664
1771	591	5	\N	2018-05-25 09:29:26.703731	2018-05-25 09:29:26.703731
1772	591	9	\N	2018-05-25 09:29:26.705754	2018-05-25 09:29:26.705754
1773	591	1	\N	2018-05-25 09:29:26.708239	2018-05-25 09:29:26.708239
1774	592	5	\N	2018-05-25 09:29:26.713064	2018-05-25 09:29:26.713064
1775	592	9	\N	2018-05-25 09:29:26.715237	2018-05-25 09:29:26.715237
1776	592	1	\N	2018-05-25 09:29:26.717808	2018-05-25 09:29:26.717808
1777	593	4	\N	2018-05-25 09:29:26.724392	2018-05-25 09:29:26.724392
1778	593	6	\N	2018-05-25 09:29:26.728411	2018-05-25 09:29:26.728411
1779	593	2	\N	2018-05-25 09:29:26.730731	2018-05-25 09:29:26.730731
1780	594	4	\N	2018-05-25 09:29:26.735899	2018-05-25 09:29:26.735899
1781	594	6	\N	2018-05-25 09:29:26.73806	2018-05-25 09:29:26.73806
1782	594	2	\N	2018-05-25 09:29:26.740499	2018-05-25 09:29:26.740499
1783	595	4	\N	2018-05-25 09:29:26.747867	2018-05-25 09:29:26.747867
1784	595	7	\N	2018-05-25 09:29:26.750025	2018-05-25 09:29:26.750025
1785	595	2	\N	2018-05-25 09:29:26.752849	2018-05-25 09:29:26.752849
1786	596	4	\N	2018-05-25 09:29:26.758939	2018-05-25 09:29:26.758939
1787	596	7	\N	2018-05-25 09:29:26.761471	2018-05-25 09:29:26.761471
1788	596	2	\N	2018-05-25 09:29:26.763995	2018-05-25 09:29:26.763995
1789	597	4	\N	2018-05-25 09:29:26.769186	2018-05-25 09:29:26.769186
1790	597	8	\N	2018-05-25 09:29:26.771768	2018-05-25 09:29:26.771768
1791	597	2	\N	2018-05-25 09:29:26.774087	2018-05-25 09:29:26.774087
1792	598	4	\N	2018-05-25 09:29:26.782267	2018-05-25 09:29:26.782267
1793	598	8	\N	2018-05-25 09:29:26.78446	2018-05-25 09:29:26.78446
1794	598	2	\N	2018-05-25 09:29:26.786818	2018-05-25 09:29:26.786818
1795	599	4	\N	2018-05-25 09:29:26.793771	2018-05-25 09:29:26.793771
1796	599	9	\N	2018-05-25 09:29:26.79691	2018-05-25 09:29:26.79691
1797	599	2	\N	2018-05-25 09:29:26.799016	2018-05-25 09:29:26.799016
1798	600	4	\N	2018-05-25 09:29:26.804704	2018-05-25 09:29:26.804704
1799	600	9	\N	2018-05-25 09:29:26.806949	2018-05-25 09:29:26.806949
1800	600	2	\N	2018-05-25 09:29:26.810347	2018-05-25 09:29:26.810347
1801	601	5	\N	2018-05-25 09:29:26.817237	2018-05-25 09:29:26.817237
1802	601	6	\N	2018-05-25 09:29:26.819925	2018-05-25 09:29:26.819925
1803	601	2	\N	2018-05-25 09:29:26.822467	2018-05-25 09:29:26.822467
1804	602	5	\N	2018-05-25 09:29:26.831962	2018-05-25 09:29:26.831962
1805	602	6	\N	2018-05-25 09:29:26.835148	2018-05-25 09:29:26.835148
1806	602	2	\N	2018-05-25 09:29:26.839189	2018-05-25 09:29:26.839189
1807	603	5	\N	2018-05-25 09:29:26.848332	2018-05-25 09:29:26.848332
1808	603	7	\N	2018-05-25 09:29:26.851682	2018-05-25 09:29:26.851682
1809	603	2	\N	2018-05-25 09:29:26.855481	2018-05-25 09:29:26.855481
1810	604	5	\N	2018-05-25 09:29:26.86691	2018-05-25 09:29:26.86691
1811	604	7	\N	2018-05-25 09:29:26.871502	2018-05-25 09:29:26.871502
1812	604	2	\N	2018-05-25 09:29:26.875449	2018-05-25 09:29:26.875449
1813	605	5	\N	2018-05-25 09:29:26.883561	2018-05-25 09:29:26.883561
1814	605	8	\N	2018-05-25 09:29:26.888013	2018-05-25 09:29:26.888013
1815	605	2	\N	2018-05-25 09:29:26.892008	2018-05-25 09:29:26.892008
1816	606	5	\N	2018-05-25 09:29:26.900114	2018-05-25 09:29:26.900114
1817	606	8	\N	2018-05-25 09:29:26.90386	2018-05-25 09:29:26.90386
1818	606	2	\N	2018-05-25 09:29:26.906605	2018-05-25 09:29:26.906605
1819	607	5	\N	2018-05-25 09:29:26.914811	2018-05-25 09:29:26.914811
1820	607	9	\N	2018-05-25 09:29:26.917963	2018-05-25 09:29:26.917963
1821	607	2	\N	2018-05-25 09:29:26.921256	2018-05-25 09:29:26.921256
1822	608	5	\N	2018-05-25 09:29:26.927843	2018-05-25 09:29:26.927843
1823	608	9	\N	2018-05-25 09:29:26.931462	2018-05-25 09:29:26.931462
1824	608	2	\N	2018-05-25 09:29:26.935346	2018-05-25 09:29:26.935346
1825	609	4	\N	2018-05-25 09:29:26.944386	2018-05-25 09:29:26.944386
1826	609	6	\N	2018-05-25 09:29:26.950452	2018-05-25 09:29:26.950452
1827	609	3	\N	2018-05-25 09:29:26.955435	2018-05-25 09:29:26.955435
1828	610	4	\N	2018-05-25 09:29:26.961502	2018-05-25 09:29:26.961502
1829	610	6	\N	2018-05-25 09:29:26.967386	2018-05-25 09:29:26.967386
1830	610	3	\N	2018-05-25 09:29:26.969895	2018-05-25 09:29:26.969895
1831	611	4	\N	2018-05-25 09:29:26.976696	2018-05-25 09:29:26.976696
1832	611	7	\N	2018-05-25 09:29:26.979171	2018-05-25 09:29:26.979171
1833	611	3	\N	2018-05-25 09:29:26.981999	2018-05-25 09:29:26.981999
1834	612	4	\N	2018-05-25 09:29:26.986903	2018-05-25 09:29:26.986903
1835	612	7	\N	2018-05-25 09:29:26.989944	2018-05-25 09:29:26.989944
1836	612	3	\N	2018-05-25 09:29:26.994334	2018-05-25 09:29:26.994334
1837	613	4	\N	2018-05-25 09:29:27.002216	2018-05-25 09:29:27.002216
1838	613	8	\N	2018-05-25 09:29:27.00474	2018-05-25 09:29:27.00474
1839	613	3	\N	2018-05-25 09:29:27.006636	2018-05-25 09:29:27.006636
1840	614	4	\N	2018-05-25 09:29:27.010714	2018-05-25 09:29:27.010714
1841	614	8	\N	2018-05-25 09:29:27.013205	2018-05-25 09:29:27.013205
1842	614	3	\N	2018-05-25 09:29:27.015819	2018-05-25 09:29:27.015819
1843	615	4	\N	2018-05-25 09:29:27.020875	2018-05-25 09:29:27.020875
1844	615	9	\N	2018-05-25 09:29:27.023427	2018-05-25 09:29:27.023427
1845	615	3	\N	2018-05-25 09:29:27.026013	2018-05-25 09:29:27.026013
1846	616	4	\N	2018-05-25 09:29:27.033383	2018-05-25 09:29:27.033383
1847	616	9	\N	2018-05-25 09:29:27.035529	2018-05-25 09:29:27.035529
1848	616	3	\N	2018-05-25 09:29:27.037486	2018-05-25 09:29:27.037486
1849	617	5	\N	2018-05-25 09:29:27.042858	2018-05-25 09:29:27.042858
1850	617	6	\N	2018-05-25 09:29:27.044927	2018-05-25 09:29:27.044927
1851	617	3	\N	2018-05-25 09:29:27.046976	2018-05-25 09:29:27.046976
1852	618	5	\N	2018-05-25 09:29:27.05129	2018-05-25 09:29:27.05129
1853	618	6	\N	2018-05-25 09:29:27.05308	2018-05-25 09:29:27.05308
1854	618	3	\N	2018-05-25 09:29:27.054966	2018-05-25 09:29:27.054966
1855	619	5	\N	2018-05-25 09:29:27.059713	2018-05-25 09:29:27.059713
1856	619	7	\N	2018-05-25 09:29:27.061698	2018-05-25 09:29:27.061698
1857	619	3	\N	2018-05-25 09:29:27.063565	2018-05-25 09:29:27.063565
1858	620	5	\N	2018-05-25 09:29:27.067875	2018-05-25 09:29:27.067875
1859	620	7	\N	2018-05-25 09:29:27.069886	2018-05-25 09:29:27.069886
1860	620	3	\N	2018-05-25 09:29:27.07165	2018-05-25 09:29:27.07165
1861	621	5	\N	2018-05-25 09:29:27.075651	2018-05-25 09:29:27.075651
1862	621	8	\N	2018-05-25 09:29:27.077871	2018-05-25 09:29:27.077871
1863	621	3	\N	2018-05-25 09:29:27.079714	2018-05-25 09:29:27.079714
1864	622	5	\N	2018-05-25 09:29:27.083872	2018-05-25 09:29:27.083872
1865	622	8	\N	2018-05-25 09:29:27.085831	2018-05-25 09:29:27.085831
1866	622	3	\N	2018-05-25 09:29:27.087832	2018-05-25 09:29:27.087832
1867	623	5	\N	2018-05-25 09:29:27.092106	2018-05-25 09:29:27.092106
1868	623	9	\N	2018-05-25 09:29:27.094323	2018-05-25 09:29:27.094323
1869	623	3	\N	2018-05-25 09:29:27.096481	2018-05-25 09:29:27.096481
1870	624	5	\N	2018-05-25 09:29:27.102154	2018-05-25 09:29:27.102154
1871	624	9	\N	2018-05-25 09:29:27.105728	2018-05-25 09:29:27.105728
1872	624	3	\N	2018-05-25 09:29:27.109209	2018-05-25 09:29:27.109209
1873	625	4	\N	2018-05-25 09:29:27.116301	2018-05-25 09:29:27.116301
1874	625	6	\N	2018-05-25 09:29:27.118625	2018-05-25 09:29:27.118625
1875	625	1	\N	2018-05-25 09:29:27.121311	2018-05-25 09:29:27.121311
1876	626	4	\N	2018-05-25 09:29:27.131804	2018-05-25 09:29:27.131804
1877	626	6	\N	2018-05-25 09:29:27.133955	2018-05-25 09:29:27.133955
1878	626	1	\N	2018-05-25 09:29:27.136105	2018-05-25 09:29:27.136105
1879	627	4	\N	2018-05-25 09:29:27.140919	2018-05-25 09:29:27.140919
1880	627	7	\N	2018-05-25 09:29:27.143449	2018-05-25 09:29:27.143449
1881	627	1	\N	2018-05-25 09:29:27.14556	2018-05-25 09:29:27.14556
1882	628	4	\N	2018-05-25 09:29:27.149747	2018-05-25 09:29:27.149747
1883	628	7	\N	2018-05-25 09:29:27.151756	2018-05-25 09:29:27.151756
1884	628	1	\N	2018-05-25 09:29:27.154346	2018-05-25 09:29:27.154346
1885	629	4	\N	2018-05-25 09:29:27.160037	2018-05-25 09:29:27.160037
1886	629	8	\N	2018-05-25 09:29:27.162422	2018-05-25 09:29:27.162422
1887	629	1	\N	2018-05-25 09:29:27.164273	2018-05-25 09:29:27.164273
1888	630	4	\N	2018-05-25 09:29:27.168356	2018-05-25 09:29:27.168356
1889	630	8	\N	2018-05-25 09:29:27.170583	2018-05-25 09:29:27.170583
1890	630	1	\N	2018-05-25 09:29:27.172698	2018-05-25 09:29:27.172698
1891	631	4	\N	2018-05-25 09:29:27.178594	2018-05-25 09:29:27.178594
1892	631	9	\N	2018-05-25 09:29:27.18051	2018-05-25 09:29:27.18051
1893	631	1	\N	2018-05-25 09:29:27.182683	2018-05-25 09:29:27.182683
1894	632	4	\N	2018-05-25 09:29:27.186606	2018-05-25 09:29:27.186606
1895	632	9	\N	2018-05-25 09:29:27.188725	2018-05-25 09:29:27.188725
1896	632	1	\N	2018-05-25 09:29:27.191297	2018-05-25 09:29:27.191297
1897	633	5	\N	2018-05-25 09:29:27.196602	2018-05-25 09:29:27.196602
1898	633	6	\N	2018-05-25 09:29:27.19865	2018-05-25 09:29:27.19865
1899	633	1	\N	2018-05-25 09:29:27.200377	2018-05-25 09:29:27.200377
1900	634	5	\N	2018-05-25 09:29:27.204602	2018-05-25 09:29:27.204602
1901	634	6	\N	2018-05-25 09:29:27.206816	2018-05-25 09:29:27.206816
1902	634	1	\N	2018-05-25 09:29:27.209536	2018-05-25 09:29:27.209536
1903	635	5	\N	2018-05-25 09:29:27.21411	2018-05-25 09:29:27.21411
1904	635	7	\N	2018-05-25 09:29:27.216049	2018-05-25 09:29:27.216049
1905	635	1	\N	2018-05-25 09:29:27.217964	2018-05-25 09:29:27.217964
1906	636	5	\N	2018-05-25 09:29:27.222107	2018-05-25 09:29:27.222107
1907	636	7	\N	2018-05-25 09:29:27.224448	2018-05-25 09:29:27.224448
1908	636	1	\N	2018-05-25 09:29:27.226707	2018-05-25 09:29:27.226707
1909	637	5	\N	2018-05-25 09:29:27.231117	2018-05-25 09:29:27.231117
1910	637	8	\N	2018-05-25 09:29:27.232991	2018-05-25 09:29:27.232991
1911	637	1	\N	2018-05-25 09:29:27.234877	2018-05-25 09:29:27.234877
1912	638	5	\N	2018-05-25 09:29:27.238934	2018-05-25 09:29:27.238934
1913	638	8	\N	2018-05-25 09:29:27.241102	2018-05-25 09:29:27.241102
1914	638	1	\N	2018-05-25 09:29:27.243458	2018-05-25 09:29:27.243458
1915	639	5	\N	2018-05-25 09:29:27.24784	2018-05-25 09:29:27.24784
1916	639	9	\N	2018-05-25 09:29:27.249956	2018-05-25 09:29:27.249956
1917	639	1	\N	2018-05-25 09:29:27.251912	2018-05-25 09:29:27.251912
1918	640	5	\N	2018-05-25 09:29:27.255941	2018-05-25 09:29:27.255941
1919	640	9	\N	2018-05-25 09:29:27.25857	2018-05-25 09:29:27.25857
1920	640	1	\N	2018-05-25 09:29:27.261042	2018-05-25 09:29:27.261042
1921	641	4	\N	2018-05-25 09:29:27.267266	2018-05-25 09:29:27.267266
1922	641	6	\N	2018-05-25 09:29:27.269159	2018-05-25 09:29:27.269159
1923	641	2	\N	2018-05-25 09:29:27.271242	2018-05-25 09:29:27.271242
1924	642	4	\N	2018-05-25 09:29:27.277913	2018-05-25 09:29:27.277913
1925	642	6	\N	2018-05-25 09:29:27.28001	2018-05-25 09:29:27.28001
1926	642	2	\N	2018-05-25 09:29:27.28214	2018-05-25 09:29:27.28214
1927	643	4	\N	2018-05-25 09:29:27.28629	2018-05-25 09:29:27.28629
1928	643	7	\N	2018-05-25 09:29:27.288183	2018-05-25 09:29:27.288183
1929	643	2	\N	2018-05-25 09:29:27.290076	2018-05-25 09:29:27.290076
1930	644	4	\N	2018-05-25 09:29:27.29552	2018-05-25 09:29:27.29552
1931	644	7	\N	2018-05-25 09:29:27.297594	2018-05-25 09:29:27.297594
1932	644	2	\N	2018-05-25 09:29:27.299431	2018-05-25 09:29:27.299431
1933	645	4	\N	2018-05-25 09:29:27.303749	2018-05-25 09:29:27.303749
1934	645	8	\N	2018-05-25 09:29:27.306465	2018-05-25 09:29:27.306465
1935	645	2	\N	2018-05-25 09:29:27.308634	2018-05-25 09:29:27.308634
1936	646	4	\N	2018-05-25 09:29:27.313218	2018-05-25 09:29:27.313218
1937	646	8	\N	2018-05-25 09:29:27.315317	2018-05-25 09:29:27.315317
1938	646	2	\N	2018-05-25 09:29:27.317147	2018-05-25 09:29:27.317147
1939	647	4	\N	2018-05-25 09:29:27.321324	2018-05-25 09:29:27.321324
1940	647	9	\N	2018-05-25 09:29:27.323306	2018-05-25 09:29:27.323306
1941	647	2	\N	2018-05-25 09:29:27.325666	2018-05-25 09:29:27.325666
1942	648	4	\N	2018-05-25 09:29:27.330534	2018-05-25 09:29:27.330534
1943	648	9	\N	2018-05-25 09:29:27.332327	2018-05-25 09:29:27.332327
1944	648	2	\N	2018-05-25 09:29:27.334158	2018-05-25 09:29:27.334158
1945	649	5	\N	2018-05-25 09:29:27.338941	2018-05-25 09:29:27.338941
1946	649	6	\N	2018-05-25 09:29:27.341269	2018-05-25 09:29:27.341269
1947	649	2	\N	2018-05-25 09:29:27.343623	2018-05-25 09:29:27.343623
1948	650	5	\N	2018-05-25 09:29:27.34782	2018-05-25 09:29:27.34782
1949	650	6	\N	2018-05-25 09:29:27.34977	2018-05-25 09:29:27.34977
1950	650	2	\N	2018-05-25 09:29:27.351729	2018-05-25 09:29:27.351729
1951	651	5	\N	2018-05-25 09:29:27.355989	2018-05-25 09:29:27.355989
1952	651	7	\N	2018-05-25 09:29:27.358354	2018-05-25 09:29:27.358354
1953	651	2	\N	2018-05-25 09:29:27.360699	2018-05-25 09:29:27.360699
1954	652	5	\N	2018-05-25 09:29:27.365164	2018-05-25 09:29:27.365164
1955	652	7	\N	2018-05-25 09:29:27.367265	2018-05-25 09:29:27.367265
1956	652	2	\N	2018-05-25 09:29:27.369281	2018-05-25 09:29:27.369281
1957	653	5	\N	2018-05-25 09:29:27.373615	2018-05-25 09:29:27.373615
1958	653	8	\N	2018-05-25 09:29:27.376515	2018-05-25 09:29:27.376515
1959	653	2	\N	2018-05-25 09:29:27.378484	2018-05-25 09:29:27.378484
1960	654	5	\N	2018-05-25 09:29:27.382636	2018-05-25 09:29:27.382636
1961	654	8	\N	2018-05-25 09:29:27.38455	2018-05-25 09:29:27.38455
1962	654	2	\N	2018-05-25 09:29:27.386363	2018-05-25 09:29:27.386363
1963	655	5	\N	2018-05-25 09:29:27.390379	2018-05-25 09:29:27.390379
1964	655	9	\N	2018-05-25 09:29:27.392734	2018-05-25 09:29:27.392734
1965	655	2	\N	2018-05-25 09:29:27.394844	2018-05-25 09:29:27.394844
1966	656	5	\N	2018-05-25 09:29:27.398997	2018-05-25 09:29:27.398997
1967	656	9	\N	2018-05-25 09:29:27.400929	2018-05-25 09:29:27.400929
1968	656	2	\N	2018-05-25 09:29:27.40287	2018-05-25 09:29:27.40287
1969	657	4	\N	2018-05-25 09:29:27.407907	2018-05-25 09:29:27.407907
1970	657	6	\N	2018-05-25 09:29:27.410086	2018-05-25 09:29:27.410086
1971	657	3	\N	2018-05-25 09:29:27.412121	2018-05-25 09:29:27.412121
1972	658	4	\N	2018-05-25 09:29:27.416283	2018-05-25 09:29:27.416283
1973	658	6	\N	2018-05-25 09:29:27.418113	2018-05-25 09:29:27.418113
1974	658	3	\N	2018-05-25 09:29:27.419989	2018-05-25 09:29:27.419989
1975	659	4	\N	2018-05-25 09:29:27.42395	2018-05-25 09:29:27.42395
1976	659	7	\N	2018-05-25 09:29:27.426235	2018-05-25 09:29:27.426235
1977	659	3	\N	2018-05-25 09:29:27.428207	2018-05-25 09:29:27.428207
1978	660	4	\N	2018-05-25 09:29:27.432025	2018-05-25 09:29:27.432025
1979	660	7	\N	2018-05-25 09:29:27.43372	2018-05-25 09:29:27.43372
1980	660	3	\N	2018-05-25 09:29:27.435342	2018-05-25 09:29:27.435342
1981	661	4	\N	2018-05-25 09:29:27.438917	2018-05-25 09:29:27.438917
1982	661	8	\N	2018-05-25 09:29:27.440822	2018-05-25 09:29:27.440822
1983	661	3	\N	2018-05-25 09:29:27.442956	2018-05-25 09:29:27.442956
1984	662	4	\N	2018-05-25 09:29:27.447374	2018-05-25 09:29:27.447374
1985	662	8	\N	2018-05-25 09:29:27.449289	2018-05-25 09:29:27.449289
1986	662	3	\N	2018-05-25 09:29:27.451064	2018-05-25 09:29:27.451064
1987	663	4	\N	2018-05-25 09:29:27.455462	2018-05-25 09:29:27.455462
1988	663	9	\N	2018-05-25 09:29:27.457789	2018-05-25 09:29:27.457789
1989	663	3	\N	2018-05-25 09:29:27.460085	2018-05-25 09:29:27.460085
1990	664	4	\N	2018-05-25 09:29:27.464344	2018-05-25 09:29:27.464344
1991	664	9	\N	2018-05-25 09:29:27.466242	2018-05-25 09:29:27.466242
1992	664	3	\N	2018-05-25 09:29:27.468123	2018-05-25 09:29:27.468123
1993	665	5	\N	2018-05-25 09:29:27.472569	2018-05-25 09:29:27.472569
1994	665	6	\N	2018-05-25 09:29:27.474844	2018-05-25 09:29:27.474844
1995	665	3	\N	2018-05-25 09:29:27.476969	2018-05-25 09:29:27.476969
1996	666	5	\N	2018-05-25 09:29:27.481012	2018-05-25 09:29:27.481012
1997	666	6	\N	2018-05-25 09:29:27.483047	2018-05-25 09:29:27.483047
1998	666	3	\N	2018-05-25 09:29:27.485042	2018-05-25 09:29:27.485042
1999	667	5	\N	2018-05-25 09:29:27.489322	2018-05-25 09:29:27.489322
2000	667	7	\N	2018-05-25 09:29:27.491561	2018-05-25 09:29:27.491561
2001	667	3	\N	2018-05-25 09:29:27.493745	2018-05-25 09:29:27.493745
2002	668	5	\N	2018-05-25 09:29:27.498023	2018-05-25 09:29:27.498023
2003	668	7	\N	2018-05-25 09:29:27.49999	2018-05-25 09:29:27.49999
2004	668	3	\N	2018-05-25 09:29:27.501737	2018-05-25 09:29:27.501737
2005	669	5	\N	2018-05-25 09:29:27.505785	2018-05-25 09:29:27.505785
2006	669	8	\N	2018-05-25 09:29:27.508604	2018-05-25 09:29:27.508604
2007	669	3	\N	2018-05-25 09:29:27.510646	2018-05-25 09:29:27.510646
2008	670	5	\N	2018-05-25 09:29:27.514619	2018-05-25 09:29:27.514619
2009	670	8	\N	2018-05-25 09:29:27.516422	2018-05-25 09:29:27.516422
2010	670	3	\N	2018-05-25 09:29:27.518414	2018-05-25 09:29:27.518414
2011	671	5	\N	2018-05-25 09:29:27.523167	2018-05-25 09:29:27.523167
2012	671	9	\N	2018-05-25 09:29:27.52557	2018-05-25 09:29:27.52557
2013	671	3	\N	2018-05-25 09:29:27.527683	2018-05-25 09:29:27.527683
2014	672	5	\N	2018-05-25 09:29:27.531748	2018-05-25 09:29:27.531748
2015	672	9	\N	2018-05-25 09:29:27.533629	2018-05-25 09:29:27.533629
2016	672	3	\N	2018-05-25 09:29:27.535439	2018-05-25 09:29:27.535439
2017	673	4	\N	2018-05-25 09:29:27.541029	2018-05-25 09:29:27.541029
2018	673	6	\N	2018-05-25 09:29:27.543054	2018-05-25 09:29:27.543054
2019	673	1	\N	2018-05-25 09:29:27.545046	2018-05-25 09:29:27.545046
2020	674	4	\N	2018-05-25 09:29:27.54897	2018-05-25 09:29:27.54897
2021	674	6	\N	2018-05-25 09:29:27.550891	2018-05-25 09:29:27.550891
2022	674	1	\N	2018-05-25 09:29:27.552781	2018-05-25 09:29:27.552781
2023	675	4	\N	2018-05-25 09:29:27.556931	2018-05-25 09:29:27.556931
2024	675	7	\N	2018-05-25 09:29:27.559034	2018-05-25 09:29:27.559034
2025	675	1	\N	2018-05-25 09:29:27.561182	2018-05-25 09:29:27.561182
2026	676	4	\N	2018-05-25 09:29:27.565369	2018-05-25 09:29:27.565369
2027	676	7	\N	2018-05-25 09:29:27.567341	2018-05-25 09:29:27.567341
2028	676	1	\N	2018-05-25 09:29:27.569278	2018-05-25 09:29:27.569278
2029	677	4	\N	2018-05-25 09:29:27.573626	2018-05-25 09:29:27.573626
2030	677	8	\N	2018-05-25 09:29:27.575673	2018-05-25 09:29:27.575673
2031	677	1	\N	2018-05-25 09:29:27.577833	2018-05-25 09:29:27.577833
2032	678	4	\N	2018-05-25 09:29:27.582142	2018-05-25 09:29:27.582142
2033	678	8	\N	2018-05-25 09:29:27.58435	2018-05-25 09:29:27.58435
2034	678	1	\N	2018-05-25 09:29:27.586558	2018-05-25 09:29:27.586558
2035	679	4	\N	2018-05-25 09:29:27.59168	2018-05-25 09:29:27.59168
2036	679	9	\N	2018-05-25 09:29:27.593839	2018-05-25 09:29:27.593839
2037	679	1	\N	2018-05-25 09:29:27.595772	2018-05-25 09:29:27.595772
2038	680	4	\N	2018-05-25 09:29:27.599988	2018-05-25 09:29:27.599988
2039	680	9	\N	2018-05-25 09:29:27.602447	2018-05-25 09:29:27.602447
2040	680	1	\N	2018-05-25 09:29:27.60491	2018-05-25 09:29:27.60491
2041	681	5	\N	2018-05-25 09:29:27.610078	2018-05-25 09:29:27.610078
2042	681	6	\N	2018-05-25 09:29:27.612109	2018-05-25 09:29:27.612109
2043	681	1	\N	2018-05-25 09:29:27.61386	2018-05-25 09:29:27.61386
2044	682	5	\N	2018-05-25 09:29:27.617888	2018-05-25 09:29:27.617888
2045	682	6	\N	2018-05-25 09:29:27.619794	2018-05-25 09:29:27.619794
2046	682	1	\N	2018-05-25 09:29:27.621703	2018-05-25 09:29:27.621703
2047	683	5	\N	2018-05-25 09:29:27.626592	2018-05-25 09:29:27.626592
2048	683	7	\N	2018-05-25 09:29:27.628555	2018-05-25 09:29:27.628555
2049	683	1	\N	2018-05-25 09:29:27.630365	2018-05-25 09:29:27.630365
2050	684	5	\N	2018-05-25 09:29:27.634378	2018-05-25 09:29:27.634378
2051	684	7	\N	2018-05-25 09:29:27.636112	2018-05-25 09:29:27.636112
2052	684	1	\N	2018-05-25 09:29:27.638338	2018-05-25 09:29:27.638338
2053	685	5	\N	2018-05-25 09:29:27.642921	2018-05-25 09:29:27.642921
2054	685	8	\N	2018-05-25 09:29:27.644856	2018-05-25 09:29:27.644856
2055	685	1	\N	2018-05-25 09:29:27.646633	2018-05-25 09:29:27.646633
2056	686	5	\N	2018-05-25 09:29:27.65042	2018-05-25 09:29:27.65042
2057	686	8	\N	2018-05-25 09:29:27.652256	2018-05-25 09:29:27.652256
2058	686	1	\N	2018-05-25 09:29:27.654117	2018-05-25 09:29:27.654117
2059	687	5	\N	2018-05-25 09:29:27.658977	2018-05-25 09:29:27.658977
2060	687	9	\N	2018-05-25 09:29:27.661136	2018-05-25 09:29:27.661136
2061	687	1	\N	2018-05-25 09:29:27.663189	2018-05-25 09:29:27.663189
2062	688	5	\N	2018-05-25 09:29:27.66704	2018-05-25 09:29:27.66704
2063	688	9	\N	2018-05-25 09:29:27.668789	2018-05-25 09:29:27.668789
2064	688	1	\N	2018-05-25 09:29:27.67056	2018-05-25 09:29:27.67056
2065	689	4	\N	2018-05-25 09:29:27.675953	2018-05-25 09:29:27.675953
2066	689	6	\N	2018-05-25 09:29:27.67812	2018-05-25 09:29:27.67812
2067	689	2	\N	2018-05-25 09:29:27.680078	2018-05-25 09:29:27.680078
2068	690	4	\N	2018-05-25 09:29:27.684441	2018-05-25 09:29:27.684441
2069	690	6	\N	2018-05-25 09:29:27.686514	2018-05-25 09:29:27.686514
2070	690	2	\N	2018-05-25 09:29:27.688363	2018-05-25 09:29:27.688363
2071	691	4	\N	2018-05-25 09:29:27.692728	2018-05-25 09:29:27.692728
2072	691	7	\N	2018-05-25 09:29:27.694788	2018-05-25 09:29:27.694788
2073	691	2	\N	2018-05-25 09:29:27.699488	2018-05-25 09:29:27.699488
2074	692	4	\N	2018-05-25 09:29:27.704911	2018-05-25 09:29:27.704911
2075	692	7	\N	2018-05-25 09:29:27.708016	2018-05-25 09:29:27.708016
2076	692	2	\N	2018-05-25 09:29:27.710501	2018-05-25 09:29:27.710501
2077	693	4	\N	2018-05-25 09:29:27.715226	2018-05-25 09:29:27.715226
2078	693	8	\N	2018-05-25 09:29:27.717185	2018-05-25 09:29:27.717185
2079	693	2	\N	2018-05-25 09:29:27.71919	2018-05-25 09:29:27.71919
2080	694	4	\N	2018-05-25 09:29:27.72384	2018-05-25 09:29:27.72384
2081	694	8	\N	2018-05-25 09:29:27.725985	2018-05-25 09:29:27.725985
2082	694	2	\N	2018-05-25 09:29:27.728037	2018-05-25 09:29:27.728037
2083	695	4	\N	2018-05-25 09:29:27.732214	2018-05-25 09:29:27.732214
2084	695	9	\N	2018-05-25 09:29:27.734128	2018-05-25 09:29:27.734128
2085	695	2	\N	2018-05-25 09:29:27.736002	2018-05-25 09:29:27.736002
2086	696	4	\N	2018-05-25 09:29:27.740703	2018-05-25 09:29:27.740703
2087	696	9	\N	2018-05-25 09:29:27.74286	2018-05-25 09:29:27.74286
2088	696	2	\N	2018-05-25 09:29:27.74545	2018-05-25 09:29:27.74545
2089	697	5	\N	2018-05-25 09:29:27.750224	2018-05-25 09:29:27.750224
2090	697	6	\N	2018-05-25 09:29:27.752186	2018-05-25 09:29:27.752186
2091	697	2	\N	2018-05-25 09:29:27.75412	2018-05-25 09:29:27.75412
2092	698	5	\N	2018-05-25 09:29:27.761221	2018-05-25 09:29:27.761221
2093	698	6	\N	2018-05-25 09:29:27.763766	2018-05-25 09:29:27.763766
2094	698	2	\N	2018-05-25 09:29:27.765735	2018-05-25 09:29:27.765735
2095	699	5	\N	2018-05-25 09:29:27.770279	2018-05-25 09:29:27.770279
2096	699	7	\N	2018-05-25 09:29:27.772221	2018-05-25 09:29:27.772221
2097	699	2	\N	2018-05-25 09:29:27.774869	2018-05-25 09:29:27.774869
2098	700	5	\N	2018-05-25 09:29:27.781137	2018-05-25 09:29:27.781137
2099	700	7	\N	2018-05-25 09:29:27.783065	2018-05-25 09:29:27.783065
2100	700	2	\N	2018-05-25 09:29:27.785035	2018-05-25 09:29:27.785035
2101	701	5	\N	2018-05-25 09:29:27.789743	2018-05-25 09:29:27.789743
2102	701	8	\N	2018-05-25 09:29:27.792509	2018-05-25 09:29:27.792509
2103	701	2	\N	2018-05-25 09:29:27.794631	2018-05-25 09:29:27.794631
2104	702	5	\N	2018-05-25 09:29:27.802209	2018-05-25 09:29:27.802209
2105	702	8	\N	2018-05-25 09:29:27.805003	2018-05-25 09:29:27.805003
2106	702	2	\N	2018-05-25 09:29:27.809148	2018-05-25 09:29:27.809148
2107	703	5	\N	2018-05-25 09:29:27.815494	2018-05-25 09:29:27.815494
2108	703	9	\N	2018-05-25 09:29:27.818014	2018-05-25 09:29:27.818014
2109	703	2	\N	2018-05-25 09:29:27.820193	2018-05-25 09:29:27.820193
2110	704	5	\N	2018-05-25 09:29:27.827169	2018-05-25 09:29:27.827169
2111	704	9	\N	2018-05-25 09:29:27.831177	2018-05-25 09:29:27.831177
2112	704	2	\N	2018-05-25 09:29:27.834389	2018-05-25 09:29:27.834389
2113	705	4	\N	2018-05-25 09:29:27.842121	2018-05-25 09:29:27.842121
2114	705	6	\N	2018-05-25 09:29:27.845741	2018-05-25 09:29:27.845741
2115	705	3	\N	2018-05-25 09:29:27.848346	2018-05-25 09:29:27.848346
2116	706	4	\N	2018-05-25 09:29:27.853118	2018-05-25 09:29:27.853118
2117	706	6	\N	2018-05-25 09:29:27.85546	2018-05-25 09:29:27.85546
2118	706	3	\N	2018-05-25 09:29:27.857726	2018-05-25 09:29:27.857726
2119	707	4	\N	2018-05-25 09:29:27.86264	2018-05-25 09:29:27.86264
2120	707	7	\N	2018-05-25 09:29:27.865076	2018-05-25 09:29:27.865076
2121	707	3	\N	2018-05-25 09:29:27.867362	2018-05-25 09:29:27.867362
2122	708	4	\N	2018-05-25 09:29:27.87238	2018-05-25 09:29:27.87238
2123	708	7	\N	2018-05-25 09:29:27.874687	2018-05-25 09:29:27.874687
2124	708	3	\N	2018-05-25 09:29:27.877255	2018-05-25 09:29:27.877255
2125	709	4	\N	2018-05-25 09:29:27.882164	2018-05-25 09:29:27.882164
2126	709	8	\N	2018-05-25 09:29:27.884541	2018-05-25 09:29:27.884541
2127	709	3	\N	2018-05-25 09:29:27.886799	2018-05-25 09:29:27.886799
2128	710	4	\N	2018-05-25 09:29:27.891718	2018-05-25 09:29:27.891718
2129	710	8	\N	2018-05-25 09:29:27.894014	2018-05-25 09:29:27.894014
2130	710	3	\N	2018-05-25 09:29:27.896599	2018-05-25 09:29:27.896599
2131	711	4	\N	2018-05-25 09:29:27.901962	2018-05-25 09:29:27.901962
2132	711	9	\N	2018-05-25 09:29:27.904371	2018-05-25 09:29:27.904371
2133	711	3	\N	2018-05-25 09:29:27.907128	2018-05-25 09:29:27.907128
2134	712	4	\N	2018-05-25 09:29:27.912116	2018-05-25 09:29:27.912116
2135	712	9	\N	2018-05-25 09:29:27.914511	2018-05-25 09:29:27.914511
2136	712	3	\N	2018-05-25 09:29:27.91664	2018-05-25 09:29:27.91664
2137	713	5	\N	2018-05-25 09:29:27.922075	2018-05-25 09:29:27.922075
2138	713	6	\N	2018-05-25 09:29:27.924433	2018-05-25 09:29:27.924433
2139	713	3	\N	2018-05-25 09:29:27.926619	2018-05-25 09:29:27.926619
2140	714	5	\N	2018-05-25 09:29:27.931814	2018-05-25 09:29:27.931814
2141	714	6	\N	2018-05-25 09:29:27.934234	2018-05-25 09:29:27.934234
2142	714	3	\N	2018-05-25 09:29:27.936693	2018-05-25 09:29:27.936693
2143	715	5	\N	2018-05-25 09:29:27.942134	2018-05-25 09:29:27.942134
2144	715	7	\N	2018-05-25 09:29:27.94498	2018-05-25 09:29:27.94498
2145	715	3	\N	2018-05-25 09:29:27.94746	2018-05-25 09:29:27.94746
2146	716	5	\N	2018-05-25 09:29:27.952071	2018-05-25 09:29:27.952071
2147	716	7	\N	2018-05-25 09:29:27.954708	2018-05-25 09:29:27.954708
2148	716	3	\N	2018-05-25 09:29:27.957389	2018-05-25 09:29:27.957389
2149	717	5	\N	2018-05-25 09:29:27.961575	2018-05-25 09:29:27.961575
2150	717	8	\N	2018-05-25 09:29:27.963497	2018-05-25 09:29:27.963497
2151	717	3	\N	2018-05-25 09:29:27.965274	2018-05-25 09:29:27.965274
2152	718	5	\N	2018-05-25 09:29:27.969166	2018-05-25 09:29:27.969166
2153	718	8	\N	2018-05-25 09:29:27.970958	2018-05-25 09:29:27.970958
2154	718	3	\N	2018-05-25 09:29:27.972822	2018-05-25 09:29:27.972822
2155	719	5	\N	2018-05-25 09:29:27.977363	2018-05-25 09:29:27.977363
2156	719	9	\N	2018-05-25 09:29:27.979312	2018-05-25 09:29:27.979312
2157	719	3	\N	2018-05-25 09:29:27.981277	2018-05-25 09:29:27.981277
2158	720	5	\N	2018-05-25 09:29:27.985633	2018-05-25 09:29:27.985633
2159	720	9	\N	2018-05-25 09:29:27.987741	2018-05-25 09:29:27.987741
2160	720	3	\N	2018-05-25 09:29:27.989823	2018-05-25 09:29:27.989823
2161	721	4	\N	2018-05-25 09:29:27.996661	2018-05-25 09:29:27.996661
2162	721	6	\N	2018-05-25 09:29:27.999409	2018-05-25 09:29:27.999409
2163	721	1	\N	2018-05-25 09:29:28.001699	2018-05-25 09:29:28.001699
2164	722	4	\N	2018-05-25 09:29:28.007098	2018-05-25 09:29:28.007098
2165	722	6	\N	2018-05-25 09:29:28.009708	2018-05-25 09:29:28.009708
2166	722	1	\N	2018-05-25 09:29:28.01201	2018-05-25 09:29:28.01201
2167	723	4	\N	2018-05-25 09:29:28.016905	2018-05-25 09:29:28.016905
2168	723	7	\N	2018-05-25 09:29:28.019136	2018-05-25 09:29:28.019136
2169	723	1	\N	2018-05-25 09:29:28.021313	2018-05-25 09:29:28.021313
2170	724	4	\N	2018-05-25 09:29:28.026038	2018-05-25 09:29:28.026038
2171	724	7	\N	2018-05-25 09:29:28.027961	2018-05-25 09:29:28.027961
2172	724	1	\N	2018-05-25 09:29:28.02979	2018-05-25 09:29:28.02979
2173	725	4	\N	2018-05-25 09:29:28.03406	2018-05-25 09:29:28.03406
2174	725	8	\N	2018-05-25 09:29:28.036047	2018-05-25 09:29:28.036047
2175	725	1	\N	2018-05-25 09:29:28.037944	2018-05-25 09:29:28.037944
2176	726	4	\N	2018-05-25 09:29:28.042213	2018-05-25 09:29:28.042213
2177	726	8	\N	2018-05-25 09:29:28.0441	2018-05-25 09:29:28.0441
2178	726	1	\N	2018-05-25 09:29:28.046011	2018-05-25 09:29:28.046011
2179	727	4	\N	2018-05-25 09:29:28.050306	2018-05-25 09:29:28.050306
2180	727	9	\N	2018-05-25 09:29:28.052523	2018-05-25 09:29:28.052523
2181	727	1	\N	2018-05-25 09:29:28.054392	2018-05-25 09:29:28.054392
2182	728	4	\N	2018-05-25 09:29:28.058791	2018-05-25 09:29:28.058791
2183	728	9	\N	2018-05-25 09:29:28.060771	2018-05-25 09:29:28.060771
2184	728	1	\N	2018-05-25 09:29:28.062705	2018-05-25 09:29:28.062705
2185	729	5	\N	2018-05-25 09:29:28.067104	2018-05-25 09:29:28.067104
2186	729	6	\N	2018-05-25 09:29:28.069098	2018-05-25 09:29:28.069098
2187	729	1	\N	2018-05-25 09:29:28.070972	2018-05-25 09:29:28.070972
2188	730	5	\N	2018-05-25 09:29:28.07512	2018-05-25 09:29:28.07512
2189	730	6	\N	2018-05-25 09:29:28.077186	2018-05-25 09:29:28.077186
2190	730	1	\N	2018-05-25 09:29:28.079229	2018-05-25 09:29:28.079229
2191	731	5	\N	2018-05-25 09:29:28.083386	2018-05-25 09:29:28.083386
2192	731	7	\N	2018-05-25 09:29:28.085479	2018-05-25 09:29:28.085479
2193	731	1	\N	2018-05-25 09:29:28.088277	2018-05-25 09:29:28.088277
2194	732	5	\N	2018-05-25 09:29:28.092351	2018-05-25 09:29:28.092351
2195	732	7	\N	2018-05-25 09:29:28.094248	2018-05-25 09:29:28.094248
2196	732	1	\N	2018-05-25 09:29:28.096373	2018-05-25 09:29:28.096373
2197	733	5	\N	2018-05-25 09:29:28.101772	2018-05-25 09:29:28.101772
2198	733	8	\N	2018-05-25 09:29:28.104294	2018-05-25 09:29:28.104294
2199	733	1	\N	2018-05-25 09:29:28.106202	2018-05-25 09:29:28.106202
2200	734	5	\N	2018-05-25 09:29:28.110443	2018-05-25 09:29:28.110443
2201	734	8	\N	2018-05-25 09:29:28.112294	2018-05-25 09:29:28.112294
2202	734	1	\N	2018-05-25 09:29:28.114408	2018-05-25 09:29:28.114408
2203	735	5	\N	2018-05-25 09:29:28.118707	2018-05-25 09:29:28.118707
2204	735	9	\N	2018-05-25 09:29:28.121819	2018-05-25 09:29:28.121819
2205	735	1	\N	2018-05-25 09:29:28.124089	2018-05-25 09:29:28.124089
2206	736	5	\N	2018-05-25 09:29:28.128205	2018-05-25 09:29:28.128205
2207	736	9	\N	2018-05-25 09:29:28.130265	2018-05-25 09:29:28.130265
2208	736	1	\N	2018-05-25 09:29:28.132081	2018-05-25 09:29:28.132081
2209	737	4	\N	2018-05-25 09:29:28.137682	2018-05-25 09:29:28.137682
2210	737	6	\N	2018-05-25 09:29:28.140309	2018-05-25 09:29:28.140309
2211	737	2	\N	2018-05-25 09:29:28.142569	2018-05-25 09:29:28.142569
2212	738	4	\N	2018-05-25 09:29:28.146422	2018-05-25 09:29:28.146422
2213	738	6	\N	2018-05-25 09:29:28.148352	2018-05-25 09:29:28.148352
2214	738	2	\N	2018-05-25 09:29:28.150196	2018-05-25 09:29:28.150196
2215	739	4	\N	2018-05-25 09:29:28.154168	2018-05-25 09:29:28.154168
2216	739	7	\N	2018-05-25 09:29:28.156293	2018-05-25 09:29:28.156293
2217	739	2	\N	2018-05-25 09:29:28.158295	2018-05-25 09:29:28.158295
2218	740	4	\N	2018-05-25 09:29:28.162524	2018-05-25 09:29:28.162524
2219	740	7	\N	2018-05-25 09:29:28.164303	2018-05-25 09:29:28.164303
2220	740	2	\N	2018-05-25 09:29:28.166308	2018-05-25 09:29:28.166308
2221	741	4	\N	2018-05-25 09:29:28.170563	2018-05-25 09:29:28.170563
2222	741	8	\N	2018-05-25 09:29:28.172418	2018-05-25 09:29:28.172418
2223	741	2	\N	2018-05-25 09:29:28.174371	2018-05-25 09:29:28.174371
2224	742	4	\N	2018-05-25 09:29:28.178851	2018-05-25 09:29:28.178851
2225	742	8	\N	2018-05-25 09:29:28.180794	2018-05-25 09:29:28.180794
2226	742	2	\N	2018-05-25 09:29:28.182772	2018-05-25 09:29:28.182772
2227	743	4	\N	2018-05-25 09:29:28.18705	2018-05-25 09:29:28.18705
2228	743	9	\N	2018-05-25 09:29:28.1889	2018-05-25 09:29:28.1889
2229	743	2	\N	2018-05-25 09:29:28.190702	2018-05-25 09:29:28.190702
2230	744	4	\N	2018-05-25 09:29:28.194821	2018-05-25 09:29:28.194821
2231	744	9	\N	2018-05-25 09:29:28.19672	2018-05-25 09:29:28.19672
2232	744	2	\N	2018-05-25 09:29:28.198718	2018-05-25 09:29:28.198718
2233	745	5	\N	2018-05-25 09:29:28.204018	2018-05-25 09:29:28.204018
2234	745	6	\N	2018-05-25 09:29:28.205853	2018-05-25 09:29:28.205853
2235	745	2	\N	2018-05-25 09:29:28.208023	2018-05-25 09:29:28.208023
2236	746	5	\N	2018-05-25 09:29:28.212735	2018-05-25 09:29:28.212735
2237	746	6	\N	2018-05-25 09:29:28.214834	2018-05-25 09:29:28.214834
2238	746	2	\N	2018-05-25 09:29:28.217129	2018-05-25 09:29:28.217129
2239	747	5	\N	2018-05-25 09:29:28.221678	2018-05-25 09:29:28.221678
2240	747	7	\N	2018-05-25 09:29:28.223718	2018-05-25 09:29:28.223718
2241	747	2	\N	2018-05-25 09:29:28.225799	2018-05-25 09:29:28.225799
2242	748	5	\N	2018-05-25 09:29:28.229949	2018-05-25 09:29:28.229949
2243	748	7	\N	2018-05-25 09:29:28.23195	2018-05-25 09:29:28.23195
2244	748	2	\N	2018-05-25 09:29:28.234059	2018-05-25 09:29:28.234059
2245	749	5	\N	2018-05-25 09:29:28.238095	2018-05-25 09:29:28.238095
2246	749	8	\N	2018-05-25 09:29:28.240228	2018-05-25 09:29:28.240228
2247	749	2	\N	2018-05-25 09:29:28.242179	2018-05-25 09:29:28.242179
2248	750	5	\N	2018-05-25 09:29:28.246292	2018-05-25 09:29:28.246292
2249	750	8	\N	2018-05-25 09:29:28.2483	2018-05-25 09:29:28.2483
2250	750	2	\N	2018-05-25 09:29:28.25028	2018-05-25 09:29:28.25028
2251	751	5	\N	2018-05-25 09:29:28.254028	2018-05-25 09:29:28.254028
2252	751	9	\N	2018-05-25 09:29:28.255912	2018-05-25 09:29:28.255912
2253	751	2	\N	2018-05-25 09:29:28.257776	2018-05-25 09:29:28.257776
2254	752	5	\N	2018-05-25 09:29:28.261613	2018-05-25 09:29:28.261613
2255	752	9	\N	2018-05-25 09:29:28.26345	2018-05-25 09:29:28.26345
2256	752	2	\N	2018-05-25 09:29:28.265262	2018-05-25 09:29:28.265262
2257	753	4	\N	2018-05-25 09:29:28.26989	2018-05-25 09:29:28.26989
2258	753	6	\N	2018-05-25 09:29:28.27171	2018-05-25 09:29:28.27171
2259	753	3	\N	2018-05-25 09:29:28.273563	2018-05-25 09:29:28.273563
2260	754	4	\N	2018-05-25 09:29:28.27779	2018-05-25 09:29:28.27779
2261	754	6	\N	2018-05-25 09:29:28.279562	2018-05-25 09:29:28.279562
2262	754	3	\N	2018-05-25 09:29:28.281429	2018-05-25 09:29:28.281429
2263	755	4	\N	2018-05-25 09:29:28.285346	2018-05-25 09:29:28.285346
2264	755	7	\N	2018-05-25 09:29:28.287326	2018-05-25 09:29:28.287326
2265	755	3	\N	2018-05-25 09:29:28.289337	2018-05-25 09:29:28.289337
2266	756	4	\N	2018-05-25 09:29:28.293575	2018-05-25 09:29:28.293575
2267	756	7	\N	2018-05-25 09:29:28.295365	2018-05-25 09:29:28.295365
2268	756	3	\N	2018-05-25 09:29:28.297397	2018-05-25 09:29:28.297397
2269	757	4	\N	2018-05-25 09:29:28.301228	2018-05-25 09:29:28.301228
2270	757	8	\N	2018-05-25 09:29:28.303113	2018-05-25 09:29:28.303113
2271	757	3	\N	2018-05-25 09:29:28.304897	2018-05-25 09:29:28.304897
2272	758	4	\N	2018-05-25 09:29:28.308325	2018-05-25 09:29:28.308325
2273	758	8	\N	2018-05-25 09:29:28.30989	2018-05-25 09:29:28.30989
2274	758	3	\N	2018-05-25 09:29:28.31151	2018-05-25 09:29:28.31151
2275	759	4	\N	2018-05-25 09:29:28.315172	2018-05-25 09:29:28.315172
2276	759	9	\N	2018-05-25 09:29:28.317123	2018-05-25 09:29:28.317123
2277	759	3	\N	2018-05-25 09:29:28.318999	2018-05-25 09:29:28.318999
2278	760	4	\N	2018-05-25 09:29:28.323133	2018-05-25 09:29:28.323133
2279	760	9	\N	2018-05-25 09:29:28.325332	2018-05-25 09:29:28.325332
2280	760	3	\N	2018-05-25 09:29:28.327337	2018-05-25 09:29:28.327337
2281	761	5	\N	2018-05-25 09:29:28.332737	2018-05-25 09:29:28.332737
2282	761	6	\N	2018-05-25 09:29:28.335149	2018-05-25 09:29:28.335149
2283	761	3	\N	2018-05-25 09:29:28.337656	2018-05-25 09:29:28.337656
2284	762	5	\N	2018-05-25 09:29:28.342464	2018-05-25 09:29:28.342464
2285	762	6	\N	2018-05-25 09:29:28.344302	2018-05-25 09:29:28.344302
2286	762	3	\N	2018-05-25 09:29:28.346288	2018-05-25 09:29:28.346288
2287	763	5	\N	2018-05-25 09:29:28.350289	2018-05-25 09:29:28.350289
2288	763	7	\N	2018-05-25 09:29:28.352097	2018-05-25 09:29:28.352097
2289	763	3	\N	2018-05-25 09:29:28.354102	2018-05-25 09:29:28.354102
2290	764	5	\N	2018-05-25 09:29:28.358559	2018-05-25 09:29:28.358559
2291	764	7	\N	2018-05-25 09:29:28.360583	2018-05-25 09:29:28.360583
2292	764	3	\N	2018-05-25 09:29:28.362619	2018-05-25 09:29:28.362619
2293	765	5	\N	2018-05-25 09:29:28.36662	2018-05-25 09:29:28.36662
2294	765	8	\N	2018-05-25 09:29:28.368494	2018-05-25 09:29:28.368494
2295	765	3	\N	2018-05-25 09:29:28.370408	2018-05-25 09:29:28.370408
2296	766	5	\N	2018-05-25 09:29:28.374421	2018-05-25 09:29:28.374421
2297	766	8	\N	2018-05-25 09:29:28.37638	2018-05-25 09:29:28.37638
2298	766	3	\N	2018-05-25 09:29:28.378214	2018-05-25 09:29:28.378214
2299	767	5	\N	2018-05-25 09:29:28.382018	2018-05-25 09:29:28.382018
2300	767	9	\N	2018-05-25 09:29:28.384061	2018-05-25 09:29:28.384061
2301	767	3	\N	2018-05-25 09:29:28.386182	2018-05-25 09:29:28.386182
2302	768	5	\N	2018-05-25 09:29:28.391054	2018-05-25 09:29:28.391054
2303	768	9	\N	2018-05-25 09:29:28.39285	2018-05-25 09:29:28.39285
2304	768	3	\N	2018-05-25 09:29:28.394621	2018-05-25 09:29:28.394621
2305	769	4	\N	2018-05-25 09:29:28.399616	2018-05-25 09:29:28.399616
2306	769	6	\N	2018-05-25 09:29:28.401445	2018-05-25 09:29:28.401445
2307	769	1	\N	2018-05-25 09:29:28.403267	2018-05-25 09:29:28.403267
2308	770	4	\N	2018-05-25 09:29:28.407339	2018-05-25 09:29:28.407339
2309	770	6	\N	2018-05-25 09:29:28.409286	2018-05-25 09:29:28.409286
2310	770	1	\N	2018-05-25 09:29:28.411098	2018-05-25 09:29:28.411098
2311	771	4	\N	2018-05-25 09:29:28.414803	2018-05-25 09:29:28.414803
2312	771	7	\N	2018-05-25 09:29:28.416521	2018-05-25 09:29:28.416521
2313	771	1	\N	2018-05-25 09:29:28.418175	2018-05-25 09:29:28.418175
2314	772	4	\N	2018-05-25 09:29:28.421545	2018-05-25 09:29:28.421545
2315	772	7	\N	2018-05-25 09:29:28.423361	2018-05-25 09:29:28.423361
2316	772	1	\N	2018-05-25 09:29:28.425281	2018-05-25 09:29:28.425281
2317	773	4	\N	2018-05-25 09:29:28.428632	2018-05-25 09:29:28.428632
2318	773	8	\N	2018-05-25 09:29:28.430292	2018-05-25 09:29:28.430292
2319	773	1	\N	2018-05-25 09:29:28.431831	2018-05-25 09:29:28.431831
2320	774	4	\N	2018-05-25 09:29:28.435994	2018-05-25 09:29:28.435994
2321	774	8	\N	2018-05-25 09:29:28.43775	2018-05-25 09:29:28.43775
2322	774	1	\N	2018-05-25 09:29:28.439478	2018-05-25 09:29:28.439478
2323	775	4	\N	2018-05-25 09:29:28.443966	2018-05-25 09:29:28.443966
2324	775	9	\N	2018-05-25 09:29:28.44589	2018-05-25 09:29:28.44589
2325	775	1	\N	2018-05-25 09:29:28.447891	2018-05-25 09:29:28.447891
2326	776	4	\N	2018-05-25 09:29:28.452094	2018-05-25 09:29:28.452094
2327	776	9	\N	2018-05-25 09:29:28.453974	2018-05-25 09:29:28.453974
2328	776	1	\N	2018-05-25 09:29:28.456042	2018-05-25 09:29:28.456042
2329	777	5	\N	2018-05-25 09:29:28.460741	2018-05-25 09:29:28.460741
2330	777	6	\N	2018-05-25 09:29:28.462715	2018-05-25 09:29:28.462715
2331	777	1	\N	2018-05-25 09:29:28.464683	2018-05-25 09:29:28.464683
2332	778	5	\N	2018-05-25 09:29:28.469204	2018-05-25 09:29:28.469204
2333	778	6	\N	2018-05-25 09:29:28.471142	2018-05-25 09:29:28.471142
2334	778	1	\N	2018-05-25 09:29:28.473158	2018-05-25 09:29:28.473158
2335	779	5	\N	2018-05-25 09:29:28.477585	2018-05-25 09:29:28.477585
2336	779	7	\N	2018-05-25 09:29:28.479474	2018-05-25 09:29:28.479474
2337	779	1	\N	2018-05-25 09:29:28.481256	2018-05-25 09:29:28.481256
2338	780	5	\N	2018-05-25 09:29:28.485118	2018-05-25 09:29:28.485118
2339	780	7	\N	2018-05-25 09:29:28.487102	2018-05-25 09:29:28.487102
2340	780	1	\N	2018-05-25 09:29:28.488941	2018-05-25 09:29:28.488941
2341	781	5	\N	2018-05-25 09:29:28.492742	2018-05-25 09:29:28.492742
2342	781	8	\N	2018-05-25 09:29:28.494611	2018-05-25 09:29:28.494611
2343	781	1	\N	2018-05-25 09:29:28.496491	2018-05-25 09:29:28.496491
2344	782	5	\N	2018-05-25 09:29:28.500317	2018-05-25 09:29:28.500317
2345	782	8	\N	2018-05-25 09:29:28.502321	2018-05-25 09:29:28.502321
2346	782	1	\N	2018-05-25 09:29:28.504189	2018-05-25 09:29:28.504189
2347	783	5	\N	2018-05-25 09:29:28.50838	2018-05-25 09:29:28.50838
2348	783	9	\N	2018-05-25 09:29:28.510318	2018-05-25 09:29:28.510318
2349	783	1	\N	2018-05-25 09:29:28.512325	2018-05-25 09:29:28.512325
2350	784	5	\N	2018-05-25 09:29:28.516588	2018-05-25 09:29:28.516588
2351	784	9	\N	2018-05-25 09:29:28.518659	2018-05-25 09:29:28.518659
2352	784	1	\N	2018-05-25 09:29:28.521302	2018-05-25 09:29:28.521302
2353	785	4	\N	2018-05-25 09:29:28.526519	2018-05-25 09:29:28.526519
2354	785	6	\N	2018-05-25 09:29:28.52904	2018-05-25 09:29:28.52904
2355	785	2	\N	2018-05-25 09:29:28.531038	2018-05-25 09:29:28.531038
2356	786	4	\N	2018-05-25 09:29:28.535257	2018-05-25 09:29:28.535257
2357	786	6	\N	2018-05-25 09:29:28.537259	2018-05-25 09:29:28.537259
2358	786	2	\N	2018-05-25 09:29:28.539179	2018-05-25 09:29:28.539179
2359	787	4	\N	2018-05-25 09:29:28.543582	2018-05-25 09:29:28.543582
2360	787	7	\N	2018-05-25 09:29:28.545449	2018-05-25 09:29:28.545449
2361	787	2	\N	2018-05-25 09:29:28.547336	2018-05-25 09:29:28.547336
2362	788	4	\N	2018-05-25 09:29:28.551324	2018-05-25 09:29:28.551324
2363	788	7	\N	2018-05-25 09:29:28.553065	2018-05-25 09:29:28.553065
2364	788	2	\N	2018-05-25 09:29:28.554909	2018-05-25 09:29:28.554909
2365	789	4	\N	2018-05-25 09:29:28.559461	2018-05-25 09:29:28.559461
2366	789	8	\N	2018-05-25 09:29:28.561434	2018-05-25 09:29:28.561434
2367	789	2	\N	2018-05-25 09:29:28.563364	2018-05-25 09:29:28.563364
2368	790	4	\N	2018-05-25 09:29:28.567271	2018-05-25 09:29:28.567271
2369	790	8	\N	2018-05-25 09:29:28.569227	2018-05-25 09:29:28.569227
2370	790	2	\N	2018-05-25 09:29:28.571217	2018-05-25 09:29:28.571217
2371	791	4	\N	2018-05-25 09:29:28.57553	2018-05-25 09:29:28.57553
2372	791	9	\N	2018-05-25 09:29:28.577596	2018-05-25 09:29:28.577596
2373	791	2	\N	2018-05-25 09:29:28.579604	2018-05-25 09:29:28.579604
2374	792	4	\N	2018-05-25 09:29:28.583782	2018-05-25 09:29:28.583782
2375	792	9	\N	2018-05-25 09:29:28.58569	2018-05-25 09:29:28.58569
2376	792	2	\N	2018-05-25 09:29:28.587708	2018-05-25 09:29:28.587708
2377	793	5	\N	2018-05-25 09:29:28.59274	2018-05-25 09:29:28.59274
2378	793	6	\N	2018-05-25 09:29:28.5947	2018-05-25 09:29:28.5947
2379	793	2	\N	2018-05-25 09:29:28.596579	2018-05-25 09:29:28.596579
2380	794	5	\N	2018-05-25 09:29:28.600895	2018-05-25 09:29:28.600895
2381	794	6	\N	2018-05-25 09:29:28.603335	2018-05-25 09:29:28.603335
2382	794	2	\N	2018-05-25 09:29:28.60529	2018-05-25 09:29:28.60529
2383	795	5	\N	2018-05-25 09:29:28.609239	2018-05-25 09:29:28.609239
2384	795	7	\N	2018-05-25 09:29:28.611002	2018-05-25 09:29:28.611002
2385	795	2	\N	2018-05-25 09:29:28.612769	2018-05-25 09:29:28.612769
2386	796	5	\N	2018-05-25 09:29:28.616804	2018-05-25 09:29:28.616804
2387	796	7	\N	2018-05-25 09:29:28.619264	2018-05-25 09:29:28.619264
2388	796	2	\N	2018-05-25 09:29:28.621437	2018-05-25 09:29:28.621437
2389	797	5	\N	2018-05-25 09:29:28.625492	2018-05-25 09:29:28.625492
2390	797	8	\N	2018-05-25 09:29:28.627322	2018-05-25 09:29:28.627322
2391	797	2	\N	2018-05-25 09:29:28.629044	2018-05-25 09:29:28.629044
2392	798	5	\N	2018-05-25 09:29:28.632896	2018-05-25 09:29:28.632896
2393	798	8	\N	2018-05-25 09:29:28.63483	2018-05-25 09:29:28.63483
2394	798	2	\N	2018-05-25 09:29:28.636855	2018-05-25 09:29:28.636855
2395	799	5	\N	2018-05-25 09:29:28.641443	2018-05-25 09:29:28.641443
2396	799	9	\N	2018-05-25 09:29:28.643814	2018-05-25 09:29:28.643814
2397	799	2	\N	2018-05-25 09:29:28.646117	2018-05-25 09:29:28.646117
2398	800	5	\N	2018-05-25 09:29:28.650787	2018-05-25 09:29:28.650787
2399	800	9	\N	2018-05-25 09:29:28.652902	2018-05-25 09:29:28.652902
2400	800	2	\N	2018-05-25 09:29:28.655467	2018-05-25 09:29:28.655467
2401	801	4	\N	2018-05-25 09:29:28.661682	2018-05-25 09:29:28.661682
2402	801	6	\N	2018-05-25 09:29:28.664178	2018-05-25 09:29:28.664178
2403	801	3	\N	2018-05-25 09:29:28.666691	2018-05-25 09:29:28.666691
2404	802	4	\N	2018-05-25 09:29:28.671928	2018-05-25 09:29:28.671928
2405	802	6	\N	2018-05-25 09:29:28.67473	2018-05-25 09:29:28.67473
2406	802	3	\N	2018-05-25 09:29:28.6772	2018-05-25 09:29:28.6772
2407	803	4	\N	2018-05-25 09:29:28.682036	2018-05-25 09:29:28.682036
2408	803	7	\N	2018-05-25 09:29:28.684207	2018-05-25 09:29:28.684207
2409	803	3	\N	2018-05-25 09:29:28.686043	2018-05-25 09:29:28.686043
2410	804	4	\N	2018-05-25 09:29:28.689944	2018-05-25 09:29:28.689944
2411	804	7	\N	2018-05-25 09:29:28.692295	2018-05-25 09:29:28.692295
2412	804	3	\N	2018-05-25 09:29:28.694196	2018-05-25 09:29:28.694196
2413	805	4	\N	2018-05-25 09:29:28.698833	2018-05-25 09:29:28.698833
2414	805	8	\N	2018-05-25 09:29:28.700968	2018-05-25 09:29:28.700968
2415	805	3	\N	2018-05-25 09:29:28.703007	2018-05-25 09:29:28.703007
2416	806	4	\N	2018-05-25 09:29:28.707442	2018-05-25 09:29:28.707442
2417	806	8	\N	2018-05-25 09:29:28.709332	2018-05-25 09:29:28.709332
2418	806	3	\N	2018-05-25 09:29:28.711421	2018-05-25 09:29:28.711421
2419	807	4	\N	2018-05-25 09:29:28.715562	2018-05-25 09:29:28.715562
2420	807	9	\N	2018-05-25 09:29:28.717488	2018-05-25 09:29:28.717488
2421	807	3	\N	2018-05-25 09:29:28.719354	2018-05-25 09:29:28.719354
2422	808	4	\N	2018-05-25 09:29:28.723398	2018-05-25 09:29:28.723398
2423	808	9	\N	2018-05-25 09:29:28.725371	2018-05-25 09:29:28.725371
2424	808	3	\N	2018-05-25 09:29:28.727268	2018-05-25 09:29:28.727268
2425	809	5	\N	2018-05-25 09:29:28.731853	2018-05-25 09:29:28.731853
2426	809	6	\N	2018-05-25 09:29:28.733882	2018-05-25 09:29:28.733882
2427	809	3	\N	2018-05-25 09:29:28.735916	2018-05-25 09:29:28.735916
2428	810	5	\N	2018-05-25 09:29:28.740159	2018-05-25 09:29:28.740159
2429	810	6	\N	2018-05-25 09:29:28.742213	2018-05-25 09:29:28.742213
2430	810	3	\N	2018-05-25 09:29:28.744154	2018-05-25 09:29:28.744154
2431	811	5	\N	2018-05-25 09:29:28.74831	2018-05-25 09:29:28.74831
2432	811	7	\N	2018-05-25 09:29:28.750175	2018-05-25 09:29:28.750175
2433	811	3	\N	2018-05-25 09:29:28.751949	2018-05-25 09:29:28.751949
2434	812	5	\N	2018-05-25 09:29:28.755876	2018-05-25 09:29:28.755876
2435	812	7	\N	2018-05-25 09:29:28.757883	2018-05-25 09:29:28.757883
2436	812	3	\N	2018-05-25 09:29:28.760007	2018-05-25 09:29:28.760007
2437	813	5	\N	2018-05-25 09:29:28.764732	2018-05-25 09:29:28.764732
2438	813	8	\N	2018-05-25 09:29:28.767022	2018-05-25 09:29:28.767022
2439	813	3	\N	2018-05-25 09:29:28.769153	2018-05-25 09:29:28.769153
2440	814	5	\N	2018-05-25 09:29:28.774019	2018-05-25 09:29:28.774019
2441	814	8	\N	2018-05-25 09:29:28.776409	2018-05-25 09:29:28.776409
2442	814	3	\N	2018-05-25 09:29:28.77908	2018-05-25 09:29:28.77908
2443	815	5	\N	2018-05-25 09:29:28.784511	2018-05-25 09:29:28.784511
2444	815	9	\N	2018-05-25 09:29:28.786973	2018-05-25 09:29:28.786973
2445	815	3	\N	2018-05-25 09:29:28.789345	2018-05-25 09:29:28.789345
2446	816	5	\N	2018-05-25 09:29:28.794387	2018-05-25 09:29:28.794387
2447	816	9	\N	2018-05-25 09:29:28.796576	2018-05-25 09:29:28.796576
2448	816	3	\N	2018-05-25 09:29:28.798673	2018-05-25 09:29:28.798673
2449	817	4	\N	2018-05-25 09:29:28.80416	2018-05-25 09:29:28.80416
2450	817	6	\N	2018-05-25 09:29:28.806044	2018-05-25 09:29:28.806044
2451	817	1	\N	2018-05-25 09:29:28.808093	2018-05-25 09:29:28.808093
2452	818	4	\N	2018-05-25 09:29:28.812356	2018-05-25 09:29:28.812356
2453	818	6	\N	2018-05-25 09:29:28.814257	2018-05-25 09:29:28.814257
2454	818	1	\N	2018-05-25 09:29:28.816088	2018-05-25 09:29:28.816088
2455	819	4	\N	2018-05-25 09:29:28.820238	2018-05-25 09:29:28.820238
2456	819	7	\N	2018-05-25 09:29:28.822069	2018-05-25 09:29:28.822069
2457	819	1	\N	2018-05-25 09:29:28.823755	2018-05-25 09:29:28.823755
2458	820	4	\N	2018-05-25 09:29:28.827762	2018-05-25 09:29:28.827762
2459	820	7	\N	2018-05-25 09:29:28.829618	2018-05-25 09:29:28.829618
2460	820	1	\N	2018-05-25 09:29:28.831385	2018-05-25 09:29:28.831385
2461	821	4	\N	2018-05-25 09:29:28.83534	2018-05-25 09:29:28.83534
2462	821	8	\N	2018-05-25 09:29:28.837233	2018-05-25 09:29:28.837233
2463	821	1	\N	2018-05-25 09:29:28.839149	2018-05-25 09:29:28.839149
2464	822	4	\N	2018-05-25 09:29:28.843223	2018-05-25 09:29:28.843223
2465	822	8	\N	2018-05-25 09:29:28.845123	2018-05-25 09:29:28.845123
2466	822	1	\N	2018-05-25 09:29:28.847084	2018-05-25 09:29:28.847084
2467	823	4	\N	2018-05-25 09:29:28.851209	2018-05-25 09:29:28.851209
2468	823	9	\N	2018-05-25 09:29:28.853218	2018-05-25 09:29:28.853218
2469	823	1	\N	2018-05-25 09:29:28.855138	2018-05-25 09:29:28.855138
2470	824	4	\N	2018-05-25 09:29:28.85934	2018-05-25 09:29:28.85934
2471	824	9	\N	2018-05-25 09:29:28.861322	2018-05-25 09:29:28.861322
2472	824	1	\N	2018-05-25 09:29:28.863191	2018-05-25 09:29:28.863191
2473	825	5	\N	2018-05-25 09:29:28.867813	2018-05-25 09:29:28.867813
2474	825	6	\N	2018-05-25 09:29:28.869824	2018-05-25 09:29:28.869824
2475	825	1	\N	2018-05-25 09:29:28.871837	2018-05-25 09:29:28.871837
2476	826	5	\N	2018-05-25 09:29:28.876466	2018-05-25 09:29:28.876466
2477	826	6	\N	2018-05-25 09:29:28.878397	2018-05-25 09:29:28.878397
2478	826	1	\N	2018-05-25 09:29:28.880176	2018-05-25 09:29:28.880176
2479	827	5	\N	2018-05-25 09:29:28.884255	2018-05-25 09:29:28.884255
2480	827	7	\N	2018-05-25 09:29:28.886165	2018-05-25 09:29:28.886165
2481	827	1	\N	2018-05-25 09:29:28.88832	2018-05-25 09:29:28.88832
2482	828	5	\N	2018-05-25 09:29:28.892681	2018-05-25 09:29:28.892681
2483	828	7	\N	2018-05-25 09:29:28.894701	2018-05-25 09:29:28.894701
2484	828	1	\N	2018-05-25 09:29:28.896426	2018-05-25 09:29:28.896426
2485	829	5	\N	2018-05-25 09:29:28.900488	2018-05-25 09:29:28.900488
2486	829	8	\N	2018-05-25 09:29:28.902295	2018-05-25 09:29:28.902295
2487	829	1	\N	2018-05-25 09:29:28.904197	2018-05-25 09:29:28.904197
2488	830	5	\N	2018-05-25 09:29:28.908493	2018-05-25 09:29:28.908493
2489	830	8	\N	2018-05-25 09:29:28.910545	2018-05-25 09:29:28.910545
2490	830	1	\N	2018-05-25 09:29:28.912551	2018-05-25 09:29:28.912551
2491	831	5	\N	2018-05-25 09:29:28.916874	2018-05-25 09:29:28.916874
2492	831	9	\N	2018-05-25 09:29:28.918886	2018-05-25 09:29:28.918886
2493	831	1	\N	2018-05-25 09:29:28.920857	2018-05-25 09:29:28.920857
2494	832	5	\N	2018-05-25 09:29:28.925073	2018-05-25 09:29:28.925073
2495	832	9	\N	2018-05-25 09:29:28.927025	2018-05-25 09:29:28.927025
2496	832	1	\N	2018-05-25 09:29:28.929019	2018-05-25 09:29:28.929019
2497	833	4	\N	2018-05-25 09:29:28.934204	2018-05-25 09:29:28.934204
2498	833	6	\N	2018-05-25 09:29:28.93625	2018-05-25 09:29:28.93625
2499	833	2	\N	2018-05-25 09:29:28.938237	2018-05-25 09:29:28.938237
2500	834	4	\N	2018-05-25 09:29:28.942312	2018-05-25 09:29:28.942312
2501	834	6	\N	2018-05-25 09:29:28.944206	2018-05-25 09:29:28.944206
2502	834	2	\N	2018-05-25 09:29:28.946099	2018-05-25 09:29:28.946099
2503	835	4	\N	2018-05-25 09:29:28.950304	2018-05-25 09:29:28.950304
2504	835	7	\N	2018-05-25 09:29:28.952254	2018-05-25 09:29:28.952254
2505	835	2	\N	2018-05-25 09:29:28.954257	2018-05-25 09:29:28.954257
2506	836	4	\N	2018-05-25 09:29:28.958737	2018-05-25 09:29:28.958737
2507	836	7	\N	2018-05-25 09:29:28.960861	2018-05-25 09:29:28.960861
2508	836	2	\N	2018-05-25 09:29:28.962851	2018-05-25 09:29:28.962851
2509	837	4	\N	2018-05-25 09:29:28.967648	2018-05-25 09:29:28.967648
2510	837	8	\N	2018-05-25 09:29:28.969556	2018-05-25 09:29:28.969556
2511	837	2	\N	2018-05-25 09:29:28.971372	2018-05-25 09:29:28.971372
2512	838	4	\N	2018-05-25 09:29:28.975115	2018-05-25 09:29:28.975115
2513	838	8	\N	2018-05-25 09:29:28.977243	2018-05-25 09:29:28.977243
2514	838	2	\N	2018-05-25 09:29:28.979269	2018-05-25 09:29:28.979269
2515	839	4	\N	2018-05-25 09:29:28.983422	2018-05-25 09:29:28.983422
2516	839	9	\N	2018-05-25 09:29:28.985283	2018-05-25 09:29:28.985283
2517	839	2	\N	2018-05-25 09:29:28.987049	2018-05-25 09:29:28.987049
2518	840	4	\N	2018-05-25 09:29:28.991118	2018-05-25 09:29:28.991118
2519	840	9	\N	2018-05-25 09:29:28.993011	2018-05-25 09:29:28.993011
2520	840	2	\N	2018-05-25 09:29:28.994976	2018-05-25 09:29:28.994976
2521	841	5	\N	2018-05-25 09:29:29.000152	2018-05-25 09:29:29.000152
2522	841	6	\N	2018-05-25 09:29:29.002634	2018-05-25 09:29:29.002634
2523	841	2	\N	2018-05-25 09:29:29.005106	2018-05-25 09:29:29.005106
2524	842	5	\N	2018-05-25 09:29:29.010145	2018-05-25 09:29:29.010145
2525	842	6	\N	2018-05-25 09:29:29.01218	2018-05-25 09:29:29.01218
2526	842	2	\N	2018-05-25 09:29:29.014175	2018-05-25 09:29:29.014175
2527	843	5	\N	2018-05-25 09:29:29.019158	2018-05-25 09:29:29.019158
2528	843	7	\N	2018-05-25 09:29:29.0215	2018-05-25 09:29:29.0215
2529	843	2	\N	2018-05-25 09:29:29.023411	2018-05-25 09:29:29.023411
2530	844	5	\N	2018-05-25 09:29:29.027656	2018-05-25 09:29:29.027656
2531	844	7	\N	2018-05-25 09:29:29.029492	2018-05-25 09:29:29.029492
2532	844	2	\N	2018-05-25 09:29:29.031216	2018-05-25 09:29:29.031216
2533	845	5	\N	2018-05-25 09:29:29.035204	2018-05-25 09:29:29.035204
2534	845	8	\N	2018-05-25 09:29:29.037009	2018-05-25 09:29:29.037009
2535	845	2	\N	2018-05-25 09:29:29.038664	2018-05-25 09:29:29.038664
2536	846	5	\N	2018-05-25 09:29:29.042532	2018-05-25 09:29:29.042532
2537	846	8	\N	2018-05-25 09:29:29.044271	2018-05-25 09:29:29.044271
2538	846	2	\N	2018-05-25 09:29:29.046064	2018-05-25 09:29:29.046064
2539	847	5	\N	2018-05-25 09:29:29.049902	2018-05-25 09:29:29.049902
2540	847	9	\N	2018-05-25 09:29:29.051973	2018-05-25 09:29:29.051973
2541	847	2	\N	2018-05-25 09:29:29.05374	2018-05-25 09:29:29.05374
2542	848	5	\N	2018-05-25 09:29:29.057828	2018-05-25 09:29:29.057828
2543	848	9	\N	2018-05-25 09:29:29.059715	2018-05-25 09:29:29.059715
2544	848	2	\N	2018-05-25 09:29:29.061623	2018-05-25 09:29:29.061623
2545	849	4	\N	2018-05-25 09:29:29.066794	2018-05-25 09:29:29.066794
2546	849	6	\N	2018-05-25 09:29:29.06886	2018-05-25 09:29:29.06886
2547	849	3	\N	2018-05-25 09:29:29.070847	2018-05-25 09:29:29.070847
2548	850	4	\N	2018-05-25 09:29:29.075277	2018-05-25 09:29:29.075277
2549	850	6	\N	2018-05-25 09:29:29.077348	2018-05-25 09:29:29.077348
2550	850	3	\N	2018-05-25 09:29:29.0793	2018-05-25 09:29:29.0793
2551	851	4	\N	2018-05-25 09:29:29.083248	2018-05-25 09:29:29.083248
2552	851	7	\N	2018-05-25 09:29:29.084927	2018-05-25 09:29:29.084927
2553	851	3	\N	2018-05-25 09:29:29.086892	2018-05-25 09:29:29.086892
2554	852	4	\N	2018-05-25 09:29:29.090978	2018-05-25 09:29:29.090978
2555	852	7	\N	2018-05-25 09:29:29.092902	2018-05-25 09:29:29.092902
2556	852	3	\N	2018-05-25 09:29:29.094818	2018-05-25 09:29:29.094818
2557	853	4	\N	2018-05-25 09:29:29.099116	2018-05-25 09:29:29.099116
2558	853	8	\N	2018-05-25 09:29:29.101949	2018-05-25 09:29:29.101949
2559	853	3	\N	2018-05-25 09:29:29.104702	2018-05-25 09:29:29.104702
2560	854	4	\N	2018-05-25 09:29:29.109057	2018-05-25 09:29:29.109057
2561	854	8	\N	2018-05-25 09:29:29.110932	2018-05-25 09:29:29.110932
2562	854	3	\N	2018-05-25 09:29:29.112879	2018-05-25 09:29:29.112879
2563	855	4	\N	2018-05-25 09:29:29.116952	2018-05-25 09:29:29.116952
2564	855	9	\N	2018-05-25 09:29:29.118869	2018-05-25 09:29:29.118869
2565	855	3	\N	2018-05-25 09:29:29.121135	2018-05-25 09:29:29.121135
2566	856	4	\N	2018-05-25 09:29:29.125157	2018-05-25 09:29:29.125157
2567	856	9	\N	2018-05-25 09:29:29.127501	2018-05-25 09:29:29.127501
2568	856	3	\N	2018-05-25 09:29:29.129518	2018-05-25 09:29:29.129518
2569	857	5	\N	2018-05-25 09:29:29.134048	2018-05-25 09:29:29.134048
2570	857	6	\N	2018-05-25 09:29:29.135922	2018-05-25 09:29:29.135922
2571	857	3	\N	2018-05-25 09:29:29.138315	2018-05-25 09:29:29.138315
2572	858	5	\N	2018-05-25 09:29:29.142604	2018-05-25 09:29:29.142604
2573	858	6	\N	2018-05-25 09:29:29.144796	2018-05-25 09:29:29.144796
2574	858	3	\N	2018-05-25 09:29:29.147195	2018-05-25 09:29:29.147195
2575	859	5	\N	2018-05-25 09:29:29.1515	2018-05-25 09:29:29.1515
2576	859	7	\N	2018-05-25 09:29:29.153495	2018-05-25 09:29:29.153495
2577	859	3	\N	2018-05-25 09:29:29.155731	2018-05-25 09:29:29.155731
2578	860	5	\N	2018-05-25 09:29:29.160003	2018-05-25 09:29:29.160003
2579	860	7	\N	2018-05-25 09:29:29.162108	2018-05-25 09:29:29.162108
2580	860	3	\N	2018-05-25 09:29:29.164115	2018-05-25 09:29:29.164115
2581	861	5	\N	2018-05-25 09:29:29.168081	2018-05-25 09:29:29.168081
2582	861	8	\N	2018-05-25 09:29:29.170148	2018-05-25 09:29:29.170148
2583	861	3	\N	2018-05-25 09:29:29.17204	2018-05-25 09:29:29.17204
2584	862	5	\N	2018-05-25 09:29:29.176675	2018-05-25 09:29:29.176675
2585	862	8	\N	2018-05-25 09:29:29.178451	2018-05-25 09:29:29.178451
2586	862	3	\N	2018-05-25 09:29:29.180234	2018-05-25 09:29:29.180234
2587	863	5	\N	2018-05-25 09:29:29.184068	2018-05-25 09:29:29.184068
2588	863	9	\N	2018-05-25 09:29:29.185951	2018-05-25 09:29:29.185951
2589	863	3	\N	2018-05-25 09:29:29.1879	2018-05-25 09:29:29.1879
2590	864	5	\N	2018-05-25 09:29:29.192623	2018-05-25 09:29:29.192623
2591	864	9	\N	2018-05-25 09:29:29.19461	2018-05-25 09:29:29.19461
2592	864	3	\N	2018-05-25 09:29:29.196496	2018-05-25 09:29:29.196496
2593	865	4	\N	2018-05-25 09:29:29.201569	2018-05-25 09:29:29.201569
2594	865	6	\N	2018-05-25 09:29:29.203384	2018-05-25 09:29:29.203384
2595	865	1	\N	2018-05-25 09:29:29.20516	2018-05-25 09:29:29.20516
2596	866	4	\N	2018-05-25 09:29:29.209267	2018-05-25 09:29:29.209267
2597	866	6	\N	2018-05-25 09:29:29.211151	2018-05-25 09:29:29.211151
2598	866	1	\N	2018-05-25 09:29:29.213006	2018-05-25 09:29:29.213006
2599	867	4	\N	2018-05-25 09:29:29.217257	2018-05-25 09:29:29.217257
2600	867	7	\N	2018-05-25 09:29:29.219161	2018-05-25 09:29:29.219161
2601	867	1	\N	2018-05-25 09:29:29.221132	2018-05-25 09:29:29.221132
2602	868	4	\N	2018-05-25 09:29:29.225544	2018-05-25 09:29:29.225544
2603	868	7	\N	2018-05-25 09:29:29.22728	2018-05-25 09:29:29.22728
2604	868	1	\N	2018-05-25 09:29:29.229302	2018-05-25 09:29:29.229302
2605	869	4	\N	2018-05-25 09:29:29.233255	2018-05-25 09:29:29.233255
2606	869	8	\N	2018-05-25 09:29:29.234966	2018-05-25 09:29:29.234966
2607	869	1	\N	2018-05-25 09:29:29.237154	2018-05-25 09:29:29.237154
2608	870	4	\N	2018-05-25 09:29:29.241481	2018-05-25 09:29:29.241481
2609	870	8	\N	2018-05-25 09:29:29.243367	2018-05-25 09:29:29.243367
2610	870	1	\N	2018-05-25 09:29:29.24535	2018-05-25 09:29:29.24535
2611	871	4	\N	2018-05-25 09:29:29.249368	2018-05-25 09:29:29.249368
2612	871	9	\N	2018-05-25 09:29:29.251113	2018-05-25 09:29:29.251113
2613	871	1	\N	2018-05-25 09:29:29.25292	2018-05-25 09:29:29.25292
2614	872	4	\N	2018-05-25 09:29:29.2569	2018-05-25 09:29:29.2569
2615	872	9	\N	2018-05-25 09:29:29.258828	2018-05-25 09:29:29.258828
2616	872	1	\N	2018-05-25 09:29:29.260777	2018-05-25 09:29:29.260777
2617	873	5	\N	2018-05-25 09:29:29.265631	2018-05-25 09:29:29.265631
2618	873	6	\N	2018-05-25 09:29:29.267562	2018-05-25 09:29:29.267562
2619	873	1	\N	2018-05-25 09:29:29.269336	2018-05-25 09:29:29.269336
2620	874	5	\N	2018-05-25 09:29:29.273342	2018-05-25 09:29:29.273342
2621	874	6	\N	2018-05-25 09:29:29.275148	2018-05-25 09:29:29.275148
2622	874	1	\N	2018-05-25 09:29:29.277088	2018-05-25 09:29:29.277088
2623	875	5	\N	2018-05-25 09:29:29.281326	2018-05-25 09:29:29.281326
2624	875	7	\N	2018-05-25 09:29:29.283307	2018-05-25 09:29:29.283307
2625	875	1	\N	2018-05-25 09:29:29.285254	2018-05-25 09:29:29.285254
2626	876	5	\N	2018-05-25 09:29:29.289117	2018-05-25 09:29:29.289117
2627	876	7	\N	2018-05-25 09:29:29.29119	2018-05-25 09:29:29.29119
2628	876	1	\N	2018-05-25 09:29:29.293198	2018-05-25 09:29:29.293198
2629	877	5	\N	2018-05-25 09:29:29.297214	2018-05-25 09:29:29.297214
2630	877	8	\N	2018-05-25 09:29:29.299412	2018-05-25 09:29:29.299412
2631	877	1	\N	2018-05-25 09:29:29.301438	2018-05-25 09:29:29.301438
2632	878	5	\N	2018-05-25 09:29:29.305289	2018-05-25 09:29:29.305289
2633	878	8	\N	2018-05-25 09:29:29.307364	2018-05-25 09:29:29.307364
2634	878	1	\N	2018-05-25 09:29:29.309202	2018-05-25 09:29:29.309202
2635	879	5	\N	2018-05-25 09:29:29.313336	2018-05-25 09:29:29.313336
2636	879	9	\N	2018-05-25 09:29:29.315785	2018-05-25 09:29:29.315785
2637	879	1	\N	2018-05-25 09:29:29.317747	2018-05-25 09:29:29.317747
2638	880	5	\N	2018-05-25 09:29:29.322929	2018-05-25 09:29:29.322929
2639	880	9	\N	2018-05-25 09:29:29.325054	2018-05-25 09:29:29.325054
2640	880	1	\N	2018-05-25 09:29:29.327089	2018-05-25 09:29:29.327089
2641	881	4	\N	2018-05-25 09:29:29.331704	2018-05-25 09:29:29.331704
2642	881	6	\N	2018-05-25 09:29:29.333571	2018-05-25 09:29:29.333571
2643	881	2	\N	2018-05-25 09:29:29.335476	2018-05-25 09:29:29.335476
2644	882	4	\N	2018-05-25 09:29:29.339903	2018-05-25 09:29:29.339903
2645	882	6	\N	2018-05-25 09:29:29.34202	2018-05-25 09:29:29.34202
2646	882	2	\N	2018-05-25 09:29:29.344079	2018-05-25 09:29:29.344079
2647	883	4	\N	2018-05-25 09:29:29.348925	2018-05-25 09:29:29.348925
2648	883	7	\N	2018-05-25 09:29:29.35114	2018-05-25 09:29:29.35114
2649	883	2	\N	2018-05-25 09:29:29.353313	2018-05-25 09:29:29.353313
2650	884	4	\N	2018-05-25 09:29:29.358112	2018-05-25 09:29:29.358112
2651	884	7	\N	2018-05-25 09:29:29.360691	2018-05-25 09:29:29.360691
2652	884	2	\N	2018-05-25 09:29:29.363277	2018-05-25 09:29:29.363277
2653	885	4	\N	2018-05-25 09:29:29.368782	2018-05-25 09:29:29.368782
2654	885	8	\N	2018-05-25 09:29:29.370993	2018-05-25 09:29:29.370993
2655	885	2	\N	2018-05-25 09:29:29.373239	2018-05-25 09:29:29.373239
2656	886	4	\N	2018-05-25 09:29:29.377951	2018-05-25 09:29:29.377951
2657	886	8	\N	2018-05-25 09:29:29.379866	2018-05-25 09:29:29.379866
2658	886	2	\N	2018-05-25 09:29:29.381739	2018-05-25 09:29:29.381739
2659	887	4	\N	2018-05-25 09:29:29.385871	2018-05-25 09:29:29.385871
2660	887	9	\N	2018-05-25 09:29:29.38795	2018-05-25 09:29:29.38795
2661	887	2	\N	2018-05-25 09:29:29.390085	2018-05-25 09:29:29.390085
2662	888	4	\N	2018-05-25 09:29:29.394792	2018-05-25 09:29:29.394792
2663	888	9	\N	2018-05-25 09:29:29.397193	2018-05-25 09:29:29.397193
2664	888	2	\N	2018-05-25 09:29:29.399083	2018-05-25 09:29:29.399083
2665	889	5	\N	2018-05-25 09:29:29.403989	2018-05-25 09:29:29.403989
2666	889	6	\N	2018-05-25 09:29:29.406046	2018-05-25 09:29:29.406046
2667	889	2	\N	2018-05-25 09:29:29.408276	2018-05-25 09:29:29.408276
2668	890	5	\N	2018-05-25 09:29:29.413338	2018-05-25 09:29:29.413338
2669	890	6	\N	2018-05-25 09:29:29.415432	2018-05-25 09:29:29.415432
2670	890	2	\N	2018-05-25 09:29:29.417486	2018-05-25 09:29:29.417486
2671	891	5	\N	2018-05-25 09:29:29.421804	2018-05-25 09:29:29.421804
2672	891	7	\N	2018-05-25 09:29:29.423756	2018-05-25 09:29:29.423756
2673	891	2	\N	2018-05-25 09:29:29.425605	2018-05-25 09:29:29.425605
2674	892	5	\N	2018-05-25 09:29:29.429789	2018-05-25 09:29:29.429789
2675	892	7	\N	2018-05-25 09:29:29.431702	2018-05-25 09:29:29.431702
2676	892	2	\N	2018-05-25 09:29:29.433739	2018-05-25 09:29:29.433739
2677	893	5	\N	2018-05-25 09:29:29.437755	2018-05-25 09:29:29.437755
2678	893	8	\N	2018-05-25 09:29:29.43967	2018-05-25 09:29:29.43967
2679	893	2	\N	2018-05-25 09:29:29.441692	2018-05-25 09:29:29.441692
2680	894	5	\N	2018-05-25 09:29:29.445894	2018-05-25 09:29:29.445894
2681	894	8	\N	2018-05-25 09:29:29.447738	2018-05-25 09:29:29.447738
2682	894	2	\N	2018-05-25 09:29:29.44946	2018-05-25 09:29:29.44946
2683	895	5	\N	2018-05-25 09:29:29.453599	2018-05-25 09:29:29.453599
2684	895	9	\N	2018-05-25 09:29:29.455562	2018-05-25 09:29:29.455562
2685	895	2	\N	2018-05-25 09:29:29.457848	2018-05-25 09:29:29.457848
2686	896	5	\N	2018-05-25 09:29:29.462341	2018-05-25 09:29:29.462341
2687	896	9	\N	2018-05-25 09:29:29.464487	2018-05-25 09:29:29.464487
2688	896	2	\N	2018-05-25 09:29:29.466517	2018-05-25 09:29:29.466517
2689	897	4	\N	2018-05-25 09:29:29.471639	2018-05-25 09:29:29.471639
2690	897	6	\N	2018-05-25 09:29:29.473781	2018-05-25 09:29:29.473781
2691	897	3	\N	2018-05-25 09:29:29.476063	2018-05-25 09:29:29.476063
2692	898	4	\N	2018-05-25 09:29:29.480835	2018-05-25 09:29:29.480835
2693	898	6	\N	2018-05-25 09:29:29.482907	2018-05-25 09:29:29.482907
2694	898	3	\N	2018-05-25 09:29:29.484849	2018-05-25 09:29:29.484849
2695	899	4	\N	2018-05-25 09:29:29.48928	2018-05-25 09:29:29.48928
2696	899	7	\N	2018-05-25 09:29:29.491341	2018-05-25 09:29:29.491341
2697	899	3	\N	2018-05-25 09:29:29.493477	2018-05-25 09:29:29.493477
2698	900	4	\N	2018-05-25 09:29:29.497601	2018-05-25 09:29:29.497601
2699	900	7	\N	2018-05-25 09:29:29.49959	2018-05-25 09:29:29.49959
2700	900	3	\N	2018-05-25 09:29:29.501433	2018-05-25 09:29:29.501433
2701	901	4	\N	2018-05-25 09:29:29.505189	2018-05-25 09:29:29.505189
2702	901	8	\N	2018-05-25 09:29:29.507074	2018-05-25 09:29:29.507074
2703	901	3	\N	2018-05-25 09:29:29.509098	2018-05-25 09:29:29.509098
2704	902	4	\N	2018-05-25 09:29:29.513318	2018-05-25 09:29:29.513318
2705	902	8	\N	2018-05-25 09:29:29.515385	2018-05-25 09:29:29.515385
2706	902	3	\N	2018-05-25 09:29:29.517385	2018-05-25 09:29:29.517385
2707	903	4	\N	2018-05-25 09:29:29.521231	2018-05-25 09:29:29.521231
2708	903	9	\N	2018-05-25 09:29:29.523402	2018-05-25 09:29:29.523402
2709	903	3	\N	2018-05-25 09:29:29.525397	2018-05-25 09:29:29.525397
2710	904	4	\N	2018-05-25 09:29:29.53179	2018-05-25 09:29:29.53179
2711	904	9	\N	2018-05-25 09:29:29.533935	2018-05-25 09:29:29.533935
2712	904	3	\N	2018-05-25 09:29:29.536092	2018-05-25 09:29:29.536092
2713	905	5	\N	2018-05-25 09:29:29.542084	2018-05-25 09:29:29.542084
2714	905	6	\N	2018-05-25 09:29:29.54469	2018-05-25 09:29:29.54469
2715	905	3	\N	2018-05-25 09:29:29.547286	2018-05-25 09:29:29.547286
2716	906	5	\N	2018-05-25 09:29:29.552475	2018-05-25 09:29:29.552475
2717	906	6	\N	2018-05-25 09:29:29.554996	2018-05-25 09:29:29.554996
2718	906	3	\N	2018-05-25 09:29:29.557632	2018-05-25 09:29:29.557632
2719	907	5	\N	2018-05-25 09:29:29.563137	2018-05-25 09:29:29.563137
2720	907	7	\N	2018-05-25 09:29:29.56568	2018-05-25 09:29:29.56568
2721	907	3	\N	2018-05-25 09:29:29.568151	2018-05-25 09:29:29.568151
2722	908	5	\N	2018-05-25 09:29:29.572901	2018-05-25 09:29:29.572901
2723	908	7	\N	2018-05-25 09:29:29.575215	2018-05-25 09:29:29.575215
2724	908	3	\N	2018-05-25 09:29:29.577683	2018-05-25 09:29:29.577683
2725	909	5	\N	2018-05-25 09:29:29.582771	2018-05-25 09:29:29.582771
2726	909	8	\N	2018-05-25 09:29:29.585053	2018-05-25 09:29:29.585053
2727	909	3	\N	2018-05-25 09:29:29.587527	2018-05-25 09:29:29.587527
2728	910	5	\N	2018-05-25 09:29:29.592593	2018-05-25 09:29:29.592593
2729	910	8	\N	2018-05-25 09:29:29.594841	2018-05-25 09:29:29.594841
2730	910	3	\N	2018-05-25 09:29:29.59684	2018-05-25 09:29:29.59684
2731	911	5	\N	2018-05-25 09:29:29.601047	2018-05-25 09:29:29.601047
2732	911	9	\N	2018-05-25 09:29:29.603428	2018-05-25 09:29:29.603428
2733	911	3	\N	2018-05-25 09:29:29.605504	2018-05-25 09:29:29.605504
2734	912	5	\N	2018-05-25 09:29:29.609614	2018-05-25 09:29:29.609614
2735	912	9	\N	2018-05-25 09:29:29.611402	2018-05-25 09:29:29.611402
2736	912	3	\N	2018-05-25 09:29:29.613237	2018-05-25 09:29:29.613237
2737	913	4	\N	2018-05-25 09:29:29.618977	2018-05-25 09:29:29.618977
2738	913	6	\N	2018-05-25 09:29:29.62184	2018-05-25 09:29:29.62184
2739	913	1	\N	2018-05-25 09:29:29.624584	2018-05-25 09:29:29.624584
2740	914	4	\N	2018-05-25 09:29:29.629758	2018-05-25 09:29:29.629758
2741	914	6	\N	2018-05-25 09:29:29.631671	2018-05-25 09:29:29.631671
2742	914	1	\N	2018-05-25 09:29:29.633712	2018-05-25 09:29:29.633712
2743	915	4	\N	2018-05-25 09:29:29.638072	2018-05-25 09:29:29.638072
2744	915	7	\N	2018-05-25 09:29:29.640146	2018-05-25 09:29:29.640146
2745	915	1	\N	2018-05-25 09:29:29.642022	2018-05-25 09:29:29.642022
2746	916	4	\N	2018-05-25 09:29:29.646228	2018-05-25 09:29:29.646228
2747	916	7	\N	2018-05-25 09:29:29.648487	2018-05-25 09:29:29.648487
2748	916	1	\N	2018-05-25 09:29:29.650771	2018-05-25 09:29:29.650771
2749	917	4	\N	2018-05-25 09:29:29.656003	2018-05-25 09:29:29.656003
2750	917	8	\N	2018-05-25 09:29:29.658371	2018-05-25 09:29:29.658371
2751	917	1	\N	2018-05-25 09:29:29.660371	2018-05-25 09:29:29.660371
2752	918	4	\N	2018-05-25 09:29:29.664733	2018-05-25 09:29:29.664733
2753	918	8	\N	2018-05-25 09:29:29.666544	2018-05-25 09:29:29.666544
2754	918	1	\N	2018-05-25 09:29:29.668533	2018-05-25 09:29:29.668533
2755	919	4	\N	2018-05-25 09:29:29.672765	2018-05-25 09:29:29.672765
2756	919	9	\N	2018-05-25 09:29:29.674943	2018-05-25 09:29:29.674943
2757	919	1	\N	2018-05-25 09:29:29.676845	2018-05-25 09:29:29.676845
2758	920	4	\N	2018-05-25 09:29:29.681162	2018-05-25 09:29:29.681162
2759	920	9	\N	2018-05-25 09:29:29.683089	2018-05-25 09:29:29.683089
2760	920	1	\N	2018-05-25 09:29:29.685134	2018-05-25 09:29:29.685134
2761	921	5	\N	2018-05-25 09:29:29.689529	2018-05-25 09:29:29.689529
2762	921	6	\N	2018-05-25 09:29:29.691749	2018-05-25 09:29:29.691749
2763	921	1	\N	2018-05-25 09:29:29.693721	2018-05-25 09:29:29.693721
2764	922	5	\N	2018-05-25 09:29:29.697717	2018-05-25 09:29:29.697717
2765	922	6	\N	2018-05-25 09:29:29.69985	2018-05-25 09:29:29.69985
2766	922	1	\N	2018-05-25 09:29:29.701787	2018-05-25 09:29:29.701787
2767	923	5	\N	2018-05-25 09:29:29.705845	2018-05-25 09:29:29.705845
2768	923	7	\N	2018-05-25 09:29:29.70792	2018-05-25 09:29:29.70792
2769	923	1	\N	2018-05-25 09:29:29.710213	2018-05-25 09:29:29.710213
2770	924	5	\N	2018-05-25 09:29:29.714817	2018-05-25 09:29:29.714817
2771	924	7	\N	2018-05-25 09:29:29.716823	2018-05-25 09:29:29.716823
2772	924	1	\N	2018-05-25 09:29:29.718694	2018-05-25 09:29:29.718694
2773	925	5	\N	2018-05-25 09:29:29.72266	2018-05-25 09:29:29.72266
2774	925	8	\N	2018-05-25 09:29:29.724423	2018-05-25 09:29:29.724423
2775	925	1	\N	2018-05-25 09:29:29.726565	2018-05-25 09:29:29.726565
2776	926	5	\N	2018-05-25 09:29:29.730869	2018-05-25 09:29:29.730869
2777	926	8	\N	2018-05-25 09:29:29.732835	2018-05-25 09:29:29.732835
2778	926	1	\N	2018-05-25 09:29:29.735186	2018-05-25 09:29:29.735186
2779	927	5	\N	2018-05-25 09:29:29.739939	2018-05-25 09:29:29.739939
2780	927	9	\N	2018-05-25 09:29:29.741992	2018-05-25 09:29:29.741992
2781	927	1	\N	2018-05-25 09:29:29.74406	2018-05-25 09:29:29.74406
2782	928	5	\N	2018-05-25 09:29:29.748831	2018-05-25 09:29:29.748831
2783	928	9	\N	2018-05-25 09:29:29.751027	2018-05-25 09:29:29.751027
2784	928	1	\N	2018-05-25 09:29:29.753055	2018-05-25 09:29:29.753055
2785	929	4	\N	2018-05-25 09:29:29.758265	2018-05-25 09:29:29.758265
2786	929	6	\N	2018-05-25 09:29:29.76027	2018-05-25 09:29:29.76027
2787	929	2	\N	2018-05-25 09:29:29.762123	2018-05-25 09:29:29.762123
2788	930	4	\N	2018-05-25 09:29:29.765964	2018-05-25 09:29:29.765964
2789	930	6	\N	2018-05-25 09:29:29.767988	2018-05-25 09:29:29.767988
2790	930	2	\N	2018-05-25 09:29:29.769921	2018-05-25 09:29:29.769921
2791	931	4	\N	2018-05-25 09:29:29.774148	2018-05-25 09:29:29.774148
2792	931	7	\N	2018-05-25 09:29:29.776109	2018-05-25 09:29:29.776109
2793	931	2	\N	2018-05-25 09:29:29.77797	2018-05-25 09:29:29.77797
2794	932	4	\N	2018-05-25 09:29:29.78198	2018-05-25 09:29:29.78198
2795	932	7	\N	2018-05-25 09:29:29.783737	2018-05-25 09:29:29.783737
2796	932	2	\N	2018-05-25 09:29:29.785451	2018-05-25 09:29:29.785451
2797	933	4	\N	2018-05-25 09:29:29.789817	2018-05-25 09:29:29.789817
2798	933	8	\N	2018-05-25 09:29:29.791823	2018-05-25 09:29:29.791823
2799	933	2	\N	2018-05-25 09:29:29.793737	2018-05-25 09:29:29.793737
2800	934	4	\N	2018-05-25 09:29:29.797927	2018-05-25 09:29:29.797927
2801	934	8	\N	2018-05-25 09:29:29.799786	2018-05-25 09:29:29.799786
2802	934	2	\N	2018-05-25 09:29:29.801645	2018-05-25 09:29:29.801645
2803	935	4	\N	2018-05-25 09:29:29.805631	2018-05-25 09:29:29.805631
2804	935	9	\N	2018-05-25 09:29:29.807535	2018-05-25 09:29:29.807535
2805	935	2	\N	2018-05-25 09:29:29.809448	2018-05-25 09:29:29.809448
2806	936	4	\N	2018-05-25 09:29:29.81364	2018-05-25 09:29:29.81364
2807	936	9	\N	2018-05-25 09:29:29.815649	2018-05-25 09:29:29.815649
2808	936	2	\N	2018-05-25 09:29:29.817724	2018-05-25 09:29:29.817724
2809	937	5	\N	2018-05-25 09:29:29.822454	2018-05-25 09:29:29.822454
2810	937	6	\N	2018-05-25 09:29:29.824546	2018-05-25 09:29:29.824546
2811	937	2	\N	2018-05-25 09:29:29.826392	2018-05-25 09:29:29.826392
2812	938	5	\N	2018-05-25 09:29:29.83048	2018-05-25 09:29:29.83048
2813	938	6	\N	2018-05-25 09:29:29.832312	2018-05-25 09:29:29.832312
2814	938	2	\N	2018-05-25 09:29:29.834115	2018-05-25 09:29:29.834115
2815	939	5	\N	2018-05-25 09:29:29.83813	2018-05-25 09:29:29.83813
2816	939	7	\N	2018-05-25 09:29:29.840137	2018-05-25 09:29:29.840137
2817	939	2	\N	2018-05-25 09:29:29.842027	2018-05-25 09:29:29.842027
2818	940	5	\N	2018-05-25 09:29:29.846187	2018-05-25 09:29:29.846187
2819	940	7	\N	2018-05-25 09:29:29.848034	2018-05-25 09:29:29.848034
2820	940	2	\N	2018-05-25 09:29:29.849921	2018-05-25 09:29:29.849921
2821	941	5	\N	2018-05-25 09:29:29.853774	2018-05-25 09:29:29.853774
2822	941	8	\N	2018-05-25 09:29:29.855572	2018-05-25 09:29:29.855572
2823	941	2	\N	2018-05-25 09:29:29.857494	2018-05-25 09:29:29.857494
2824	942	5	\N	2018-05-25 09:29:29.861921	2018-05-25 09:29:29.861921
2825	942	8	\N	2018-05-25 09:29:29.863932	2018-05-25 09:29:29.863932
2826	942	2	\N	2018-05-25 09:29:29.866875	2018-05-25 09:29:29.866875
2827	943	5	\N	2018-05-25 09:29:29.870946	2018-05-25 09:29:29.870946
2828	943	9	\N	2018-05-25 09:29:29.873104	2018-05-25 09:29:29.873104
2829	943	2	\N	2018-05-25 09:29:29.875141	2018-05-25 09:29:29.875141
2830	944	5	\N	2018-05-25 09:29:29.879347	2018-05-25 09:29:29.879347
2831	944	9	\N	2018-05-25 09:29:29.881523	2018-05-25 09:29:29.881523
2832	944	2	\N	2018-05-25 09:29:29.883648	2018-05-25 09:29:29.883648
2833	945	4	\N	2018-05-25 09:29:29.888642	2018-05-25 09:29:29.888642
2834	945	6	\N	2018-05-25 09:29:29.890564	2018-05-25 09:29:29.890564
2835	945	3	\N	2018-05-25 09:29:29.892416	2018-05-25 09:29:29.892416
2836	946	4	\N	2018-05-25 09:29:29.896491	2018-05-25 09:29:29.896491
2837	946	6	\N	2018-05-25 09:29:29.898284	2018-05-25 09:29:29.898284
2838	946	3	\N	2018-05-25 09:29:29.900146	2018-05-25 09:29:29.900146
2839	947	4	\N	2018-05-25 09:29:29.904416	2018-05-25 09:29:29.904416
2840	947	7	\N	2018-05-25 09:29:29.906372	2018-05-25 09:29:29.906372
2841	947	3	\N	2018-05-25 09:29:29.908306	2018-05-25 09:29:29.908306
2842	948	4	\N	2018-05-25 09:29:29.912425	2018-05-25 09:29:29.912425
2843	948	7	\N	2018-05-25 09:29:29.914274	2018-05-25 09:29:29.914274
2844	948	3	\N	2018-05-25 09:29:29.91606	2018-05-25 09:29:29.91606
2845	949	4	\N	2018-05-25 09:29:29.920402	2018-05-25 09:29:29.920402
2846	949	8	\N	2018-05-25 09:29:29.923063	2018-05-25 09:29:29.923063
2847	949	3	\N	2018-05-25 09:29:29.925079	2018-05-25 09:29:29.925079
2848	950	4	\N	2018-05-25 09:29:29.929935	2018-05-25 09:29:29.929935
2849	950	8	\N	2018-05-25 09:29:29.931731	2018-05-25 09:29:29.931731
2850	950	3	\N	2018-05-25 09:29:29.933608	2018-05-25 09:29:29.933608
2851	951	4	\N	2018-05-25 09:29:29.937798	2018-05-25 09:29:29.937798
2852	951	9	\N	2018-05-25 09:29:29.940003	2018-05-25 09:29:29.940003
2853	951	3	\N	2018-05-25 09:29:29.944622	2018-05-25 09:29:29.944622
2854	952	4	\N	2018-05-25 09:29:29.950035	2018-05-25 09:29:29.950035
2855	952	9	\N	2018-05-25 09:29:29.952029	2018-05-25 09:29:29.952029
2856	952	3	\N	2018-05-25 09:29:29.954033	2018-05-25 09:29:29.954033
2857	953	5	\N	2018-05-25 09:29:29.958453	2018-05-25 09:29:29.958453
2858	953	6	\N	2018-05-25 09:29:29.960184	2018-05-25 09:29:29.960184
2859	953	3	\N	2018-05-25 09:29:29.961974	2018-05-25 09:29:29.961974
2860	954	5	\N	2018-05-25 09:29:29.966285	2018-05-25 09:29:29.966285
2861	954	6	\N	2018-05-25 09:29:29.968403	2018-05-25 09:29:29.968403
2862	954	3	\N	2018-05-25 09:29:29.970471	2018-05-25 09:29:29.970471
2863	955	5	\N	2018-05-25 09:29:29.975188	2018-05-25 09:29:29.975188
2864	955	7	\N	2018-05-25 09:29:29.977174	2018-05-25 09:29:29.977174
2865	955	3	\N	2018-05-25 09:29:29.979396	2018-05-25 09:29:29.979396
2866	956	5	\N	2018-05-25 09:29:29.984249	2018-05-25 09:29:29.984249
2867	956	7	\N	2018-05-25 09:29:29.98665	2018-05-25 09:29:29.98665
2868	956	3	\N	2018-05-25 09:29:29.989268	2018-05-25 09:29:29.989268
2869	957	5	\N	2018-05-25 09:29:29.995738	2018-05-25 09:29:29.995738
2870	957	8	\N	2018-05-25 09:29:29.99784	2018-05-25 09:29:29.99784
2871	957	3	\N	2018-05-25 09:29:29.999904	2018-05-25 09:29:29.999904
2872	958	5	\N	2018-05-25 09:29:30.004317	2018-05-25 09:29:30.004317
2873	958	8	\N	2018-05-25 09:29:30.006245	2018-05-25 09:29:30.006245
2874	958	3	\N	2018-05-25 09:29:30.008158	2018-05-25 09:29:30.008158
2875	959	5	\N	2018-05-25 09:29:30.012157	2018-05-25 09:29:30.012157
2876	959	9	\N	2018-05-25 09:29:30.014149	2018-05-25 09:29:30.014149
2877	959	3	\N	2018-05-25 09:29:30.016339	2018-05-25 09:29:30.016339
2878	960	5	\N	2018-05-25 09:29:30.020745	2018-05-25 09:29:30.020745
2879	960	9	\N	2018-05-25 09:29:30.022744	2018-05-25 09:29:30.022744
2880	960	3	\N	2018-05-25 09:29:30.024721	2018-05-25 09:29:30.024721
2881	961	4	\N	2018-05-25 09:29:30.030895	2018-05-25 09:29:30.030895
2882	961	10	\N	2018-05-25 09:29:30.032861	2018-05-25 09:29:30.032861
2883	962	4	\N	2018-05-25 09:29:30.038104	2018-05-25 09:29:30.038104
2884	962	10	\N	2018-05-25 09:29:30.040068	2018-05-25 09:29:30.040068
2885	963	4	\N	2018-05-25 09:29:30.04624	2018-05-25 09:29:30.04624
2886	963	11	\N	2018-05-25 09:29:30.04842	2018-05-25 09:29:30.04842
2887	964	4	\N	2018-05-25 09:29:30.052522	2018-05-25 09:29:30.052522
2888	964	11	\N	2018-05-25 09:29:30.054451	2018-05-25 09:29:30.054451
2889	965	4	\N	2018-05-25 09:29:30.059117	2018-05-25 09:29:30.059117
2890	965	12	\N	2018-05-25 09:29:30.061692	2018-05-25 09:29:30.061692
2891	966	4	\N	2018-05-25 09:29:30.066656	2018-05-25 09:29:30.066656
2892	966	12	\N	2018-05-25 09:29:30.068751	2018-05-25 09:29:30.068751
2893	967	5	\N	2018-05-25 09:29:30.073482	2018-05-25 09:29:30.073482
2894	967	10	\N	2018-05-25 09:29:30.075779	2018-05-25 09:29:30.075779
2895	968	5	\N	2018-05-25 09:29:30.080508	2018-05-25 09:29:30.080508
2896	968	10	\N	2018-05-25 09:29:30.082611	2018-05-25 09:29:30.082611
2897	969	5	\N	2018-05-25 09:29:30.087233	2018-05-25 09:29:30.087233
2898	969	11	\N	2018-05-25 09:29:30.089354	2018-05-25 09:29:30.089354
2899	970	5	\N	2018-05-25 09:29:30.093763	2018-05-25 09:29:30.093763
2900	970	11	\N	2018-05-25 09:29:30.095741	2018-05-25 09:29:30.095741
2901	971	5	\N	2018-05-25 09:29:30.100081	2018-05-25 09:29:30.100081
2902	971	12	\N	2018-05-25 09:29:30.102483	2018-05-25 09:29:30.102483
2903	972	5	\N	2018-05-25 09:29:30.109534	2018-05-25 09:29:30.109534
2904	972	12	\N	2018-05-25 09:29:30.111663	2018-05-25 09:29:30.111663
2905	973	4	\N	2018-05-25 09:29:30.116686	2018-05-25 09:29:30.116686
2906	973	10	\N	2018-05-25 09:29:30.118539	2018-05-25 09:29:30.118539
2907	974	4	\N	2018-05-25 09:29:30.122905	2018-05-25 09:29:30.122905
2908	974	10	\N	2018-05-25 09:29:30.125049	2018-05-25 09:29:30.125049
2909	975	4	\N	2018-05-25 09:29:30.129399	2018-05-25 09:29:30.129399
2910	975	11	\N	2018-05-25 09:29:30.131486	2018-05-25 09:29:30.131486
2911	976	4	\N	2018-05-25 09:29:30.135587	2018-05-25 09:29:30.135587
2912	976	11	\N	2018-05-25 09:29:30.13765	2018-05-25 09:29:30.13765
2913	977	4	\N	2018-05-25 09:29:30.141983	2018-05-25 09:29:30.141983
2914	977	12	\N	2018-05-25 09:29:30.143947	2018-05-25 09:29:30.143947
2915	978	4	\N	2018-05-25 09:29:30.148732	2018-05-25 09:29:30.148732
2916	978	12	\N	2018-05-25 09:29:30.151081	2018-05-25 09:29:30.151081
2917	979	5	\N	2018-05-25 09:29:30.157661	2018-05-25 09:29:30.157661
2918	979	10	\N	2018-05-25 09:29:30.160348	2018-05-25 09:29:30.160348
2919	980	5	\N	2018-05-25 09:29:30.165987	2018-05-25 09:29:30.165987
2920	980	10	\N	2018-05-25 09:29:30.168511	2018-05-25 09:29:30.168511
2921	981	5	\N	2018-05-25 09:29:30.174104	2018-05-25 09:29:30.174104
2922	981	11	\N	2018-05-25 09:29:30.176723	2018-05-25 09:29:30.176723
2923	982	5	\N	2018-05-25 09:29:30.182617	2018-05-25 09:29:30.182617
2924	982	11	\N	2018-05-25 09:29:30.18511	2018-05-25 09:29:30.18511
2925	983	5	\N	2018-05-25 09:29:30.190983	2018-05-25 09:29:30.190983
2926	983	12	\N	2018-05-25 09:29:30.193534	2018-05-25 09:29:30.193534
2927	984	5	\N	2018-05-25 09:29:30.198947	2018-05-25 09:29:30.198947
2928	984	12	\N	2018-05-25 09:29:30.201505	2018-05-25 09:29:30.201505
2929	985	4	\N	2018-05-25 09:29:30.208055	2018-05-25 09:29:30.208055
2930	985	10	\N	2018-05-25 09:29:30.21052	2018-05-25 09:29:30.21052
2931	986	4	\N	2018-05-25 09:29:30.215619	2018-05-25 09:29:30.215619
2932	986	10	\N	2018-05-25 09:29:30.218207	2018-05-25 09:29:30.218207
2933	987	4	\N	2018-05-25 09:29:30.223372	2018-05-25 09:29:30.223372
2934	987	11	\N	2018-05-25 09:29:30.225733	2018-05-25 09:29:30.225733
2935	988	4	\N	2018-05-25 09:29:30.23065	2018-05-25 09:29:30.23065
2936	988	11	\N	2018-05-25 09:29:30.23313	2018-05-25 09:29:30.23313
2937	989	4	\N	2018-05-25 09:29:30.238794	2018-05-25 09:29:30.238794
2938	989	12	\N	2018-05-25 09:29:30.241491	2018-05-25 09:29:30.241491
2939	990	4	\N	2018-05-25 09:29:30.247309	2018-05-25 09:29:30.247309
2940	990	12	\N	2018-05-25 09:29:30.249803	2018-05-25 09:29:30.249803
2941	991	5	\N	2018-05-25 09:29:30.255988	2018-05-25 09:29:30.255988
2942	991	10	\N	2018-05-25 09:29:30.258433	2018-05-25 09:29:30.258433
2943	992	5	\N	2018-05-25 09:29:30.263864	2018-05-25 09:29:30.263864
2944	992	10	\N	2018-05-25 09:29:30.266288	2018-05-25 09:29:30.266288
2945	993	5	\N	2018-05-25 09:29:30.271465	2018-05-25 09:29:30.271465
2946	993	11	\N	2018-05-25 09:29:30.273458	2018-05-25 09:29:30.273458
2947	994	5	\N	2018-05-25 09:29:30.278322	2018-05-25 09:29:30.278322
2948	994	11	\N	2018-05-25 09:29:30.280376	2018-05-25 09:29:30.280376
2949	995	5	\N	2018-05-25 09:29:30.284829	2018-05-25 09:29:30.284829
2950	995	12	\N	2018-05-25 09:29:30.286798	2018-05-25 09:29:30.286798
2951	996	5	\N	2018-05-25 09:29:30.291145	2018-05-25 09:29:30.291145
2952	996	12	\N	2018-05-25 09:29:30.293232	2018-05-25 09:29:30.293232
2953	997	4	\N	2018-05-25 09:29:30.298442	2018-05-25 09:29:30.298442
2954	997	10	\N	2018-05-25 09:29:30.300537	2018-05-25 09:29:30.300537
2955	998	4	\N	2018-05-25 09:29:30.305119	2018-05-25 09:29:30.305119
2956	998	10	\N	2018-05-25 09:29:30.307343	2018-05-25 09:29:30.307343
2957	999	4	\N	2018-05-25 09:29:30.311921	2018-05-25 09:29:30.311921
2958	999	11	\N	2018-05-25 09:29:30.313821	2018-05-25 09:29:30.313821
2959	1000	4	\N	2018-05-25 09:29:30.317998	2018-05-25 09:29:30.317998
2960	1000	11	\N	2018-05-25 09:29:30.320089	2018-05-25 09:29:30.320089
2961	1001	4	\N	2018-05-25 09:29:30.325258	2018-05-25 09:29:30.325258
2962	1001	12	\N	2018-05-25 09:29:30.327313	2018-05-25 09:29:30.327313
2963	1002	4	\N	2018-05-25 09:29:30.331725	2018-05-25 09:29:30.331725
2964	1002	12	\N	2018-05-25 09:29:30.333621	2018-05-25 09:29:30.333621
2965	1003	5	\N	2018-05-25 09:29:30.33814	2018-05-25 09:29:30.33814
2966	1003	10	\N	2018-05-25 09:29:30.340025	2018-05-25 09:29:30.340025
2967	1004	5	\N	2018-05-25 09:29:30.344317	2018-05-25 09:29:30.344317
2968	1004	10	\N	2018-05-25 09:29:30.346419	2018-05-25 09:29:30.346419
2969	1005	5	\N	2018-05-25 09:29:30.350679	2018-05-25 09:29:30.350679
2970	1005	11	\N	2018-05-25 09:29:30.352816	2018-05-25 09:29:30.352816
2971	1006	5	\N	2018-05-25 09:29:30.358077	2018-05-25 09:29:30.358077
2972	1006	11	\N	2018-05-25 09:29:30.360128	2018-05-25 09:29:30.360128
2973	1007	5	\N	2018-05-25 09:29:30.364462	2018-05-25 09:29:30.364462
2974	1007	12	\N	2018-05-25 09:29:30.366437	2018-05-25 09:29:30.366437
2975	1008	5	\N	2018-05-25 09:29:30.370877	2018-05-25 09:29:30.370877
2976	1008	12	\N	2018-05-25 09:29:30.372662	2018-05-25 09:29:30.372662
2977	1009	4	\N	2018-05-25 09:29:30.377872	2018-05-25 09:29:30.377872
2978	1009	10	\N	2018-05-25 09:29:30.379816	2018-05-25 09:29:30.379816
2979	1010	4	\N	2018-05-25 09:29:30.384401	2018-05-25 09:29:30.384401
2980	1010	10	\N	2018-05-25 09:29:30.386658	2018-05-25 09:29:30.386658
2981	1011	4	\N	2018-05-25 09:29:30.392209	2018-05-25 09:29:30.392209
2982	1011	11	\N	2018-05-25 09:29:30.394352	2018-05-25 09:29:30.394352
2983	1012	4	\N	2018-05-25 09:29:30.399238	2018-05-25 09:29:30.399238
2984	1012	11	\N	2018-05-25 09:29:30.401169	2018-05-25 09:29:30.401169
2985	1013	4	\N	2018-05-25 09:29:30.405628	2018-05-25 09:29:30.405628
2986	1013	12	\N	2018-05-25 09:29:30.40777	2018-05-25 09:29:30.40777
2987	1014	4	\N	2018-05-25 09:29:30.412154	2018-05-25 09:29:30.412154
2988	1014	12	\N	2018-05-25 09:29:30.414115	2018-05-25 09:29:30.414115
2989	1015	5	\N	2018-05-25 09:29:30.418887	2018-05-25 09:29:30.418887
2990	1015	10	\N	2018-05-25 09:29:30.42078	2018-05-25 09:29:30.42078
2991	1016	5	\N	2018-05-25 09:29:30.425054	2018-05-25 09:29:30.425054
2992	1016	10	\N	2018-05-25 09:29:30.42699	2018-05-25 09:29:30.42699
2993	1017	5	\N	2018-05-25 09:29:30.431061	2018-05-25 09:29:30.431061
2994	1017	11	\N	2018-05-25 09:29:30.432808	2018-05-25 09:29:30.432808
2995	1018	5	\N	2018-05-25 09:29:30.437082	2018-05-25 09:29:30.437082
2996	1018	11	\N	2018-05-25 09:29:30.439148	2018-05-25 09:29:30.439148
2997	1019	5	\N	2018-05-25 09:29:30.443407	2018-05-25 09:29:30.443407
2998	1019	12	\N	2018-05-25 09:29:30.445836	2018-05-25 09:29:30.445836
2999	1020	5	\N	2018-05-25 09:29:30.450054	2018-05-25 09:29:30.450054
3000	1020	12	\N	2018-05-25 09:29:30.451887	2018-05-25 09:29:30.451887
3001	1021	4	\N	2018-05-25 09:29:30.456506	2018-05-25 09:29:30.456506
3002	1021	10	\N	2018-05-25 09:29:30.458629	2018-05-25 09:29:30.458629
3003	1022	4	\N	2018-05-25 09:29:30.46334	2018-05-25 09:29:30.46334
3004	1022	10	\N	2018-05-25 09:29:30.465363	2018-05-25 09:29:30.465363
3005	1023	4	\N	2018-05-25 09:29:30.469541	2018-05-25 09:29:30.469541
3006	1023	11	\N	2018-05-25 09:29:30.471525	2018-05-25 09:29:30.471525
3007	1024	4	\N	2018-05-25 09:29:30.475726	2018-05-25 09:29:30.475726
3008	1024	11	\N	2018-05-25 09:29:30.477831	2018-05-25 09:29:30.477831
3009	1025	4	\N	2018-05-25 09:29:30.482203	2018-05-25 09:29:30.482203
3010	1025	12	\N	2018-05-25 09:29:30.484032	2018-05-25 09:29:30.484032
3011	1026	4	\N	2018-05-25 09:29:30.488201	2018-05-25 09:29:30.488201
3012	1026	12	\N	2018-05-25 09:29:30.490032	2018-05-25 09:29:30.490032
3013	1027	5	\N	2018-05-25 09:29:30.49511	2018-05-25 09:29:30.49511
3014	1027	10	\N	2018-05-25 09:29:30.49709	2018-05-25 09:29:30.49709
3015	1028	5	\N	2018-05-25 09:29:30.501616	2018-05-25 09:29:30.501616
3016	1028	10	\N	2018-05-25 09:29:30.503601	2018-05-25 09:29:30.503601
3017	1029	5	\N	2018-05-25 09:29:30.507885	2018-05-25 09:29:30.507885
3018	1029	11	\N	2018-05-25 09:29:30.509759	2018-05-25 09:29:30.509759
3019	1030	5	\N	2018-05-25 09:29:30.514051	2018-05-25 09:29:30.514051
3020	1030	11	\N	2018-05-25 09:29:30.51591	2018-05-25 09:29:30.51591
3021	1031	5	\N	2018-05-25 09:29:30.519909	2018-05-25 09:29:30.519909
3022	1031	12	\N	2018-05-25 09:29:30.521911	2018-05-25 09:29:30.521911
3023	1032	5	\N	2018-05-25 09:29:30.526386	2018-05-25 09:29:30.526386
3024	1032	12	\N	2018-05-25 09:29:30.52834	2018-05-25 09:29:30.52834
3025	1033	4	\N	2018-05-25 09:29:30.533416	2018-05-25 09:29:30.533416
3026	1033	10	\N	2018-05-25 09:29:30.535361	2018-05-25 09:29:30.535361
3027	1034	4	\N	2018-05-25 09:29:30.539402	2018-05-25 09:29:30.539402
3028	1034	10	\N	2018-05-25 09:29:30.54124	2018-05-25 09:29:30.54124
3029	1035	4	\N	2018-05-25 09:29:30.545272	2018-05-25 09:29:30.545272
3030	1035	11	\N	2018-05-25 09:29:30.547007	2018-05-25 09:29:30.547007
3031	1036	4	\N	2018-05-25 09:29:30.551201	2018-05-25 09:29:30.551201
3032	1036	11	\N	2018-05-25 09:29:30.553296	2018-05-25 09:29:30.553296
3033	1037	4	\N	2018-05-25 09:29:30.557569	2018-05-25 09:29:30.557569
3034	1037	12	\N	2018-05-25 09:29:30.559515	2018-05-25 09:29:30.559515
3035	1038	4	\N	2018-05-25 09:29:30.563775	2018-05-25 09:29:30.563775
3036	1038	12	\N	2018-05-25 09:29:30.565757	2018-05-25 09:29:30.565757
3037	1039	5	\N	2018-05-25 09:29:30.570525	2018-05-25 09:29:30.570525
3038	1039	10	\N	2018-05-25 09:29:30.572535	2018-05-25 09:29:30.572535
3039	1040	5	\N	2018-05-25 09:29:30.577576	2018-05-25 09:29:30.577576
3040	1040	10	\N	2018-05-25 09:29:30.579701	2018-05-25 09:29:30.579701
3041	1041	5	\N	2018-05-25 09:29:30.584524	2018-05-25 09:29:30.584524
3042	1041	11	\N	2018-05-25 09:29:30.587127	2018-05-25 09:29:30.587127
3043	1042	5	\N	2018-05-25 09:29:30.592726	2018-05-25 09:29:30.592726
3044	1042	11	\N	2018-05-25 09:29:30.595135	2018-05-25 09:29:30.595135
3045	1043	5	\N	2018-05-25 09:29:30.600173	2018-05-25 09:29:30.600173
3046	1043	12	\N	2018-05-25 09:29:30.602677	2018-05-25 09:29:30.602677
3047	1044	5	\N	2018-05-25 09:29:30.607258	2018-05-25 09:29:30.607258
3048	1044	12	\N	2018-05-25 09:29:30.609368	2018-05-25 09:29:30.609368
3049	1045	4	\N	2018-05-25 09:29:30.614745	2018-05-25 09:29:30.614745
3050	1045	10	\N	2018-05-25 09:29:30.616585	2018-05-25 09:29:30.616585
3051	1046	4	\N	2018-05-25 09:29:30.62121	2018-05-25 09:29:30.62121
3052	1046	10	\N	2018-05-25 09:29:30.623331	2018-05-25 09:29:30.623331
3053	1047	4	\N	2018-05-25 09:29:30.627761	2018-05-25 09:29:30.627761
3054	1047	11	\N	2018-05-25 09:29:30.629876	2018-05-25 09:29:30.629876
3055	1048	4	\N	2018-05-25 09:29:30.634083	2018-05-25 09:29:30.634083
3056	1048	11	\N	2018-05-25 09:29:30.635872	2018-05-25 09:29:30.635872
3057	1049	4	\N	2018-05-25 09:29:30.640779	2018-05-25 09:29:30.640779
3058	1049	12	\N	2018-05-25 09:29:30.64281	2018-05-25 09:29:30.64281
3059	1050	4	\N	2018-05-25 09:29:30.647257	2018-05-25 09:29:30.647257
3060	1050	12	\N	2018-05-25 09:29:30.649012	2018-05-25 09:29:30.649012
3061	1051	5	\N	2018-05-25 09:29:30.65395	2018-05-25 09:29:30.65395
3062	1051	10	\N	2018-05-25 09:29:30.656321	2018-05-25 09:29:30.656321
3063	1052	5	\N	2018-05-25 09:29:30.661137	2018-05-25 09:29:30.661137
3064	1052	10	\N	2018-05-25 09:29:30.662985	2018-05-25 09:29:30.662985
3065	1053	5	\N	2018-05-25 09:29:30.66722	2018-05-25 09:29:30.66722
3066	1053	11	\N	2018-05-25 09:29:30.669258	2018-05-25 09:29:30.669258
3067	1054	5	\N	2018-05-25 09:29:30.673933	2018-05-25 09:29:30.673933
3068	1054	11	\N	2018-05-25 09:29:30.67593	2018-05-25 09:29:30.67593
3069	1055	5	\N	2018-05-25 09:29:30.680564	2018-05-25 09:29:30.680564
3070	1055	12	\N	2018-05-25 09:29:30.682374	2018-05-25 09:29:30.682374
3071	1056	5	\N	2018-05-25 09:29:30.686621	2018-05-25 09:29:30.686621
3072	1056	12	\N	2018-05-25 09:29:30.688606	2018-05-25 09:29:30.688606
3073	1057	4	\N	2018-05-25 09:29:30.694193	2018-05-25 09:29:30.694193
3074	1057	10	\N	2018-05-25 09:29:30.696246	2018-05-25 09:29:30.696246
3075	1058	4	\N	2018-05-25 09:29:30.700275	2018-05-25 09:29:30.700275
3076	1058	10	\N	2018-05-25 09:29:30.702278	2018-05-25 09:29:30.702278
3077	1059	4	\N	2018-05-25 09:29:30.706561	2018-05-25 09:29:30.706561
3078	1059	11	\N	2018-05-25 09:29:30.708725	2018-05-25 09:29:30.708725
3079	1060	4	\N	2018-05-25 09:29:30.713125	2018-05-25 09:29:30.713125
3080	1060	11	\N	2018-05-25 09:29:30.715062	2018-05-25 09:29:30.715062
3081	1061	4	\N	2018-05-25 09:29:30.719327	2018-05-25 09:29:30.719327
3082	1061	12	\N	2018-05-25 09:29:30.72127	2018-05-25 09:29:30.72127
3083	1062	4	\N	2018-05-25 09:29:30.726754	2018-05-25 09:29:30.726754
3084	1062	12	\N	2018-05-25 09:29:30.728995	2018-05-25 09:29:30.728995
3085	1063	5	\N	2018-05-25 09:29:30.734698	2018-05-25 09:29:30.734698
3086	1063	10	\N	2018-05-25 09:29:30.737252	2018-05-25 09:29:30.737252
3087	1064	5	\N	2018-05-25 09:29:30.743	2018-05-25 09:29:30.743
3088	1064	10	\N	2018-05-25 09:29:30.745627	2018-05-25 09:29:30.745627
3089	1065	5	\N	2018-05-25 09:29:30.750946	2018-05-25 09:29:30.750946
3090	1065	11	\N	2018-05-25 09:29:30.753028	2018-05-25 09:29:30.753028
3091	1066	5	\N	2018-05-25 09:29:30.757762	2018-05-25 09:29:30.757762
3092	1066	11	\N	2018-05-25 09:29:30.76022	2018-05-25 09:29:30.76022
3093	1067	5	\N	2018-05-25 09:29:30.765402	2018-05-25 09:29:30.765402
3094	1067	12	\N	2018-05-25 09:29:30.767527	2018-05-25 09:29:30.767527
3095	1068	5	\N	2018-05-25 09:29:30.772189	2018-05-25 09:29:30.772189
3096	1068	12	\N	2018-05-25 09:29:30.774454	2018-05-25 09:29:30.774454
3097	1069	4	\N	2018-05-25 09:29:30.780145	2018-05-25 09:29:30.780145
3098	1069	10	\N	2018-05-25 09:29:30.782309	2018-05-25 09:29:30.782309
3099	1070	4	\N	2018-05-25 09:29:30.787662	2018-05-25 09:29:30.787662
3100	1070	10	\N	2018-05-25 09:29:30.789901	2018-05-25 09:29:30.789901
3101	1071	4	\N	2018-05-25 09:29:30.794753	2018-05-25 09:29:30.794753
3102	1071	11	\N	2018-05-25 09:29:30.796755	2018-05-25 09:29:30.796755
3103	1072	4	\N	2018-05-25 09:29:30.801094	2018-05-25 09:29:30.801094
3104	1072	11	\N	2018-05-25 09:29:30.802977	2018-05-25 09:29:30.802977
3105	1073	4	\N	2018-05-25 09:29:30.807322	2018-05-25 09:29:30.807322
3106	1073	12	\N	2018-05-25 09:29:30.809101	2018-05-25 09:29:30.809101
3107	1074	4	\N	2018-05-25 09:29:30.813607	2018-05-25 09:29:30.813607
3108	1074	12	\N	2018-05-25 09:29:30.815415	2018-05-25 09:29:30.815415
3109	1075	5	\N	2018-05-25 09:29:30.81981	2018-05-25 09:29:30.81981
3110	1075	10	\N	2018-05-25 09:29:30.821715	2018-05-25 09:29:30.821715
3111	1076	5	\N	2018-05-25 09:29:30.82609	2018-05-25 09:29:30.82609
3112	1076	10	\N	2018-05-25 09:29:30.827925	2018-05-25 09:29:30.827925
3113	1077	5	\N	2018-05-25 09:29:30.831971	2018-05-25 09:29:30.831971
3114	1077	11	\N	2018-05-25 09:29:30.833978	2018-05-25 09:29:30.833978
3115	1078	5	\N	2018-05-25 09:29:30.8382	2018-05-25 09:29:30.8382
3116	1078	11	\N	2018-05-25 09:29:30.840079	2018-05-25 09:29:30.840079
3117	1079	5	\N	2018-05-25 09:29:30.844762	2018-05-25 09:29:30.844762
3118	1079	12	\N	2018-05-25 09:29:30.846792	2018-05-25 09:29:30.846792
3119	1080	5	\N	2018-05-25 09:29:30.851086	2018-05-25 09:29:30.851086
3120	1080	12	\N	2018-05-25 09:29:30.853077	2018-05-25 09:29:30.853077
3121	1081	4	\N	2018-05-25 09:29:30.859072	2018-05-25 09:29:30.859072
3122	1081	10	\N	2018-05-25 09:29:30.861117	2018-05-25 09:29:30.861117
3123	1082	4	\N	2018-05-25 09:29:30.86549	2018-05-25 09:29:30.86549
3124	1082	10	\N	2018-05-25 09:29:30.867489	2018-05-25 09:29:30.867489
3125	1083	4	\N	2018-05-25 09:29:30.871852	2018-05-25 09:29:30.871852
3126	1083	11	\N	2018-05-25 09:29:30.873809	2018-05-25 09:29:30.873809
3127	1084	4	\N	2018-05-25 09:29:30.877965	2018-05-25 09:29:30.877965
3128	1084	11	\N	2018-05-25 09:29:30.879777	2018-05-25 09:29:30.879777
3129	1085	4	\N	2018-05-25 09:29:30.883987	2018-05-25 09:29:30.883987
3130	1085	12	\N	2018-05-25 09:29:30.885864	2018-05-25 09:29:30.885864
3131	1086	4	\N	2018-05-25 09:29:30.890272	2018-05-25 09:29:30.890272
3132	1086	12	\N	2018-05-25 09:29:30.892652	2018-05-25 09:29:30.892652
3133	1087	5	\N	2018-05-25 09:29:30.898373	2018-05-25 09:29:30.898373
3134	1087	10	\N	2018-05-25 09:29:30.90039	2018-05-25 09:29:30.90039
3135	1088	5	\N	2018-05-25 09:29:30.90527	2018-05-25 09:29:30.90527
3136	1088	10	\N	2018-05-25 09:29:30.907719	2018-05-25 09:29:30.907719
3137	1089	5	\N	2018-05-25 09:29:30.912891	2018-05-25 09:29:30.912891
3138	1089	11	\N	2018-05-25 09:29:30.915463	2018-05-25 09:29:30.915463
3139	1090	5	\N	2018-05-25 09:29:30.921001	2018-05-25 09:29:30.921001
3140	1090	11	\N	2018-05-25 09:29:30.9234	2018-05-25 09:29:30.9234
3141	1091	5	\N	2018-05-25 09:29:30.928252	2018-05-25 09:29:30.928252
3142	1091	12	\N	2018-05-25 09:29:30.930575	2018-05-25 09:29:30.930575
3143	1092	5	\N	2018-05-25 09:29:30.934973	2018-05-25 09:29:30.934973
3144	1092	12	\N	2018-05-25 09:29:30.936942	2018-05-25 09:29:30.936942
3145	1093	4	\N	2018-05-25 09:29:30.942652	2018-05-25 09:29:30.942652
3146	1093	10	\N	2018-05-25 09:29:30.944637	2018-05-25 09:29:30.944637
3147	1094	4	\N	2018-05-25 09:29:30.949175	2018-05-25 09:29:30.949175
3148	1094	10	\N	2018-05-25 09:29:30.951033	2018-05-25 09:29:30.951033
3149	1095	4	\N	2018-05-25 09:29:30.955431	2018-05-25 09:29:30.955431
3150	1095	11	\N	2018-05-25 09:29:30.957517	2018-05-25 09:29:30.957517
3151	1096	4	\N	2018-05-25 09:29:30.962354	2018-05-25 09:29:30.962354
3152	1096	11	\N	2018-05-25 09:29:30.964903	2018-05-25 09:29:30.964903
3153	1097	4	\N	2018-05-25 09:29:30.970301	2018-05-25 09:29:30.970301
3154	1097	12	\N	2018-05-25 09:29:30.972999	2018-05-25 09:29:30.972999
3155	1098	4	\N	2018-05-25 09:29:30.978193	2018-05-25 09:29:30.978193
3156	1098	12	\N	2018-05-25 09:29:30.98046	2018-05-25 09:29:30.98046
3157	1099	5	\N	2018-05-25 09:29:30.986542	2018-05-25 09:29:30.986542
3158	1099	10	\N	2018-05-25 09:29:30.989069	2018-05-25 09:29:30.989069
3159	1100	5	\N	2018-05-25 09:29:30.994708	2018-05-25 09:29:30.994708
3160	1100	10	\N	2018-05-25 09:29:30.996878	2018-05-25 09:29:30.996878
3161	1101	5	\N	2018-05-25 09:29:31.002775	2018-05-25 09:29:31.002775
3162	1101	11	\N	2018-05-25 09:29:31.004903	2018-05-25 09:29:31.004903
3163	1102	5	\N	2018-05-25 09:29:31.010198	2018-05-25 09:29:31.010198
3164	1102	11	\N	2018-05-25 09:29:31.01223	2018-05-25 09:29:31.01223
3165	1103	5	\N	2018-05-25 09:29:31.016756	2018-05-25 09:29:31.016756
3166	1103	12	\N	2018-05-25 09:29:31.018671	2018-05-25 09:29:31.018671
3167	1104	5	\N	2018-05-25 09:29:31.023055	2018-05-25 09:29:31.023055
3168	1104	12	\N	2018-05-25 09:29:31.025794	2018-05-25 09:29:31.025794
3169	1105	4	\N	2018-05-25 09:29:31.031749	2018-05-25 09:29:31.031749
3170	1105	10	\N	2018-05-25 09:29:31.033961	2018-05-25 09:29:31.033961
3171	1106	4	\N	2018-05-25 09:29:31.039577	2018-05-25 09:29:31.039577
3172	1106	10	\N	2018-05-25 09:29:31.042769	2018-05-25 09:29:31.042769
3173	1107	4	\N	2018-05-25 09:29:31.051181	2018-05-25 09:29:31.051181
3174	1107	11	\N	2018-05-25 09:29:31.05493	2018-05-25 09:29:31.05493
3175	1108	4	\N	2018-05-25 09:29:31.060271	2018-05-25 09:29:31.060271
3176	1108	11	\N	2018-05-25 09:29:31.063893	2018-05-25 09:29:31.063893
3177	1109	4	\N	2018-05-25 09:29:31.070088	2018-05-25 09:29:31.070088
3178	1109	12	\N	2018-05-25 09:29:31.072153	2018-05-25 09:29:31.072153
3179	1110	4	\N	2018-05-25 09:29:31.078107	2018-05-25 09:29:31.078107
3180	1110	12	\N	2018-05-25 09:29:31.080489	2018-05-25 09:29:31.080489
3181	1111	5	\N	2018-05-25 09:29:31.085451	2018-05-25 09:29:31.085451
3182	1111	10	\N	2018-05-25 09:29:31.087549	2018-05-25 09:29:31.087549
3183	1112	5	\N	2018-05-25 09:29:31.093194	2018-05-25 09:29:31.093194
3184	1112	10	\N	2018-05-25 09:29:31.095657	2018-05-25 09:29:31.095657
3185	1113	5	\N	2018-05-25 09:29:31.101033	2018-05-25 09:29:31.101033
3186	1113	11	\N	2018-05-25 09:29:31.104565	2018-05-25 09:29:31.104565
3187	1114	5	\N	2018-05-25 09:29:31.11015	2018-05-25 09:29:31.11015
3188	1114	11	\N	2018-05-25 09:29:31.112357	2018-05-25 09:29:31.112357
3189	1115	5	\N	2018-05-25 09:29:31.116899	2018-05-25 09:29:31.116899
3190	1115	12	\N	2018-05-25 09:29:31.118928	2018-05-25 09:29:31.118928
3191	1116	5	\N	2018-05-25 09:29:31.123164	2018-05-25 09:29:31.123164
3192	1116	12	\N	2018-05-25 09:29:31.125886	2018-05-25 09:29:31.125886
3193	1117	4	\N	2018-05-25 09:29:31.13255	2018-05-25 09:29:31.13255
3194	1117	10	\N	2018-05-25 09:29:31.13442	2018-05-25 09:29:31.13442
3195	1118	4	\N	2018-05-25 09:29:31.138522	2018-05-25 09:29:31.138522
3196	1118	10	\N	2018-05-25 09:29:31.140555	2018-05-25 09:29:31.140555
3197	1119	4	\N	2018-05-25 09:29:31.145334	2018-05-25 09:29:31.145334
3198	1119	11	\N	2018-05-25 09:29:31.14728	2018-05-25 09:29:31.14728
3199	1120	4	\N	2018-05-25 09:29:31.152108	2018-05-25 09:29:31.152108
3200	1120	11	\N	2018-05-25 09:29:31.15463	2018-05-25 09:29:31.15463
3201	1121	4	\N	2018-05-25 09:29:31.159449	2018-05-25 09:29:31.159449
3202	1121	12	\N	2018-05-25 09:29:31.161624	2018-05-25 09:29:31.161624
3203	1122	4	\N	2018-05-25 09:29:31.16626	2018-05-25 09:29:31.16626
3204	1122	12	\N	2018-05-25 09:29:31.168348	2018-05-25 09:29:31.168348
3205	1123	5	\N	2018-05-25 09:29:31.173116	2018-05-25 09:29:31.173116
3206	1123	10	\N	2018-05-25 09:29:31.176081	2018-05-25 09:29:31.176081
3207	1124	5	\N	2018-05-25 09:29:31.18041	2018-05-25 09:29:31.18041
3208	1124	10	\N	2018-05-25 09:29:31.182291	2018-05-25 09:29:31.182291
3209	1125	5	\N	2018-05-25 09:29:31.186497	2018-05-25 09:29:31.186497
3210	1125	11	\N	2018-05-25 09:29:31.188349	2018-05-25 09:29:31.188349
3211	1126	5	\N	2018-05-25 09:29:31.1926	2018-05-25 09:29:31.1926
3212	1126	11	\N	2018-05-25 09:29:31.194661	2018-05-25 09:29:31.194661
3213	1127	5	\N	2018-05-25 09:29:31.198836	2018-05-25 09:29:31.198836
3214	1127	12	\N	2018-05-25 09:29:31.200676	2018-05-25 09:29:31.200676
3215	1128	5	\N	2018-05-25 09:29:31.205067	2018-05-25 09:29:31.205067
3216	1128	12	\N	2018-05-25 09:29:31.206906	2018-05-25 09:29:31.206906
3217	1129	4	\N	2018-05-25 09:29:31.212313	2018-05-25 09:29:31.212313
3218	1129	10	\N	2018-05-25 09:29:31.214127	2018-05-25 09:29:31.214127
3219	1130	4	\N	2018-05-25 09:29:31.217976	2018-05-25 09:29:31.217976
3220	1130	10	\N	2018-05-25 09:29:31.219778	2018-05-25 09:29:31.219778
3221	1131	4	\N	2018-05-25 09:29:31.224284	2018-05-25 09:29:31.224284
3222	1131	11	\N	2018-05-25 09:29:31.226637	2018-05-25 09:29:31.226637
3223	1132	4	\N	2018-05-25 09:29:31.231146	2018-05-25 09:29:31.231146
3224	1132	11	\N	2018-05-25 09:29:31.233128	2018-05-25 09:29:31.233128
3225	1133	4	\N	2018-05-25 09:29:31.237276	2018-05-25 09:29:31.237276
3226	1133	12	\N	2018-05-25 09:29:31.23934	2018-05-25 09:29:31.23934
3227	1134	4	\N	2018-05-25 09:29:31.244215	2018-05-25 09:29:31.244215
3228	1134	12	\N	2018-05-25 09:29:31.246166	2018-05-25 09:29:31.246166
3229	1135	5	\N	2018-05-25 09:29:31.250775	2018-05-25 09:29:31.250775
3230	1135	10	\N	2018-05-25 09:29:31.252621	2018-05-25 09:29:31.252621
3231	1136	5	\N	2018-05-25 09:29:31.256884	2018-05-25 09:29:31.256884
3232	1136	10	\N	2018-05-25 09:29:31.259191	2018-05-25 09:29:31.259191
3233	1137	5	\N	2018-05-25 09:29:31.263712	2018-05-25 09:29:31.263712
3234	1137	11	\N	2018-05-25 09:29:31.265872	2018-05-25 09:29:31.265872
3235	1138	5	\N	2018-05-25 09:29:31.270215	2018-05-25 09:29:31.270215
3236	1138	11	\N	2018-05-25 09:29:31.272004	2018-05-25 09:29:31.272004
3237	1139	5	\N	2018-05-25 09:29:31.276574	2018-05-25 09:29:31.276574
3238	1139	12	\N	2018-05-25 09:29:31.278551	2018-05-25 09:29:31.278551
3239	1140	5	\N	2018-05-25 09:29:31.283147	2018-05-25 09:29:31.283147
3240	1140	12	\N	2018-05-25 09:29:31.285005	2018-05-25 09:29:31.285005
3241	1141	4	\N	2018-05-25 09:29:31.29028	2018-05-25 09:29:31.29028
3242	1141	10	\N	2018-05-25 09:29:31.292481	2018-05-25 09:29:31.292481
3243	1142	4	\N	2018-05-25 09:29:31.297059	2018-05-25 09:29:31.297059
3244	1142	10	\N	2018-05-25 09:29:31.299059	2018-05-25 09:29:31.299059
3245	1143	4	\N	2018-05-25 09:29:31.303214	2018-05-25 09:29:31.303214
3246	1143	11	\N	2018-05-25 09:29:31.305051	2018-05-25 09:29:31.305051
3247	1144	4	\N	2018-05-25 09:29:31.309504	2018-05-25 09:29:31.309504
3248	1144	11	\N	2018-05-25 09:29:31.311583	2018-05-25 09:29:31.311583
3249	1145	4	\N	2018-05-25 09:29:31.315979	2018-05-25 09:29:31.315979
3250	1145	12	\N	2018-05-25 09:29:31.317975	2018-05-25 09:29:31.317975
3251	1146	4	\N	2018-05-25 09:29:31.322334	2018-05-25 09:29:31.322334
3252	1146	12	\N	2018-05-25 09:29:31.324401	2018-05-25 09:29:31.324401
3253	1147	5	\N	2018-05-25 09:29:31.329764	2018-05-25 09:29:31.329764
3254	1147	10	\N	2018-05-25 09:29:31.331821	2018-05-25 09:29:31.331821
3255	1148	5	\N	2018-05-25 09:29:31.336039	2018-05-25 09:29:31.336039
3256	1148	10	\N	2018-05-25 09:29:31.33789	2018-05-25 09:29:31.33789
3257	1149	5	\N	2018-05-25 09:29:31.342038	2018-05-25 09:29:31.342038
3258	1149	11	\N	2018-05-25 09:29:31.344266	2018-05-25 09:29:31.344266
3259	1150	5	\N	2018-05-25 09:29:31.348493	2018-05-25 09:29:31.348493
3260	1150	11	\N	2018-05-25 09:29:31.35043	2018-05-25 09:29:31.35043
3261	1151	5	\N	2018-05-25 09:29:31.354883	2018-05-25 09:29:31.354883
3262	1151	12	\N	2018-05-25 09:29:31.356924	2018-05-25 09:29:31.356924
3263	1152	5	\N	2018-05-25 09:29:31.361586	2018-05-25 09:29:31.361586
3264	1152	12	\N	2018-05-25 09:29:31.3635	2018-05-25 09:29:31.3635
3265	1153	4	\N	2018-05-25 09:29:31.368276	2018-05-25 09:29:31.368276
3266	1153	10	\N	2018-05-25 09:29:31.370265	2018-05-25 09:29:31.370265
3267	1154	4	\N	2018-05-25 09:29:31.375086	2018-05-25 09:29:31.375086
3268	1154	10	\N	2018-05-25 09:29:31.37723	2018-05-25 09:29:31.37723
3269	1155	4	\N	2018-05-25 09:29:31.384562	2018-05-25 09:29:31.384562
3270	1155	11	\N	2018-05-25 09:29:31.387925	2018-05-25 09:29:31.387925
3271	1156	4	\N	2018-05-25 09:29:31.395188	2018-05-25 09:29:31.395188
3272	1156	11	\N	2018-05-25 09:29:31.398645	2018-05-25 09:29:31.398645
3273	1157	4	\N	2018-05-25 09:29:31.404928	2018-05-25 09:29:31.404928
3274	1157	12	\N	2018-05-25 09:29:31.407636	2018-05-25 09:29:31.407636
3275	1158	4	\N	2018-05-25 09:29:31.414152	2018-05-25 09:29:31.414152
3276	1158	12	\N	2018-05-25 09:29:31.417374	2018-05-25 09:29:31.417374
3277	1159	5	\N	2018-05-25 09:29:31.424573	2018-05-25 09:29:31.424573
3278	1159	10	\N	2018-05-25 09:29:31.427346	2018-05-25 09:29:31.427346
3279	1160	5	\N	2018-05-25 09:29:31.433607	2018-05-25 09:29:31.433607
3280	1160	10	\N	2018-05-25 09:29:31.43678	2018-05-25 09:29:31.43678
3281	1161	5	\N	2018-05-25 09:29:31.443644	2018-05-25 09:29:31.443644
3282	1161	11	\N	2018-05-25 09:29:31.446022	2018-05-25 09:29:31.446022
3283	1162	5	\N	2018-05-25 09:29:31.452171	2018-05-25 09:29:31.452171
3284	1162	11	\N	2018-05-25 09:29:31.454973	2018-05-25 09:29:31.454973
3285	1163	5	\N	2018-05-25 09:29:31.462341	2018-05-25 09:29:31.462341
3286	1163	12	\N	2018-05-25 09:29:31.465317	2018-05-25 09:29:31.465317
3287	1164	5	\N	2018-05-25 09:29:31.472843	2018-05-25 09:29:31.472843
3288	1164	12	\N	2018-05-25 09:29:31.475994	2018-05-25 09:29:31.475994
3289	1165	4	\N	2018-05-25 09:29:31.483554	2018-05-25 09:29:31.483554
3290	1165	10	\N	2018-05-25 09:29:31.486122	2018-05-25 09:29:31.486122
3291	1166	4	\N	2018-05-25 09:29:31.493142	2018-05-25 09:29:31.493142
3292	1166	10	\N	2018-05-25 09:29:31.496622	2018-05-25 09:29:31.496622
3293	1167	4	\N	2018-05-25 09:29:31.502861	2018-05-25 09:29:31.502861
3294	1167	11	\N	2018-05-25 09:29:31.50649	2018-05-25 09:29:31.50649
3295	1168	4	\N	2018-05-25 09:29:31.513381	2018-05-25 09:29:31.513381
3296	1168	11	\N	2018-05-25 09:29:31.516316	2018-05-25 09:29:31.516316
3297	1169	4	\N	2018-05-25 09:29:31.523103	2018-05-25 09:29:31.523103
3298	1169	12	\N	2018-05-25 09:29:31.52606	2018-05-25 09:29:31.52606
3299	1170	4	\N	2018-05-25 09:29:31.532988	2018-05-25 09:29:31.532988
3300	1170	12	\N	2018-05-25 09:29:31.535627	2018-05-25 09:29:31.535627
3301	1171	5	\N	2018-05-25 09:29:31.54502	2018-05-25 09:29:31.54502
3302	1171	10	\N	2018-05-25 09:29:31.548563	2018-05-25 09:29:31.548563
3303	1172	5	\N	2018-05-25 09:29:31.554344	2018-05-25 09:29:31.554344
3304	1172	10	\N	2018-05-25 09:29:31.558457	2018-05-25 09:29:31.558457
3305	1173	5	\N	2018-05-25 09:29:31.565495	2018-05-25 09:29:31.565495
3306	1173	11	\N	2018-05-25 09:29:31.567769	2018-05-25 09:29:31.567769
3307	1174	5	\N	2018-05-25 09:29:31.576823	2018-05-25 09:29:31.576823
3308	1174	11	\N	2018-05-25 09:29:31.579625	2018-05-25 09:29:31.579625
3309	1175	5	\N	2018-05-25 09:29:31.585831	2018-05-25 09:29:31.585831
3310	1175	12	\N	2018-05-25 09:29:31.589227	2018-05-25 09:29:31.589227
3311	1176	5	\N	2018-05-25 09:29:31.596632	2018-05-25 09:29:31.596632
3312	1176	12	\N	2018-05-25 09:29:31.599511	2018-05-25 09:29:31.599511
3313	1177	4	\N	2018-05-25 09:29:31.615852	2018-05-25 09:29:31.615852
3314	1177	10	\N	2018-05-25 09:29:31.620018	2018-05-25 09:29:31.620018
3315	1178	4	\N	2018-05-25 09:29:31.628726	2018-05-25 09:29:31.628726
3316	1178	10	\N	2018-05-25 09:29:31.631636	2018-05-25 09:29:31.631636
3317	1179	4	\N	2018-05-25 09:29:31.638491	2018-05-25 09:29:31.638491
3318	1179	11	\N	2018-05-25 09:29:31.64183	2018-05-25 09:29:31.64183
3319	1180	4	\N	2018-05-25 09:29:31.650443	2018-05-25 09:29:31.650443
3320	1180	11	\N	2018-05-25 09:29:31.653499	2018-05-25 09:29:31.653499
3321	1181	4	\N	2018-05-25 09:29:31.661347	2018-05-25 09:29:31.661347
3322	1181	12	\N	2018-05-25 09:29:31.664998	2018-05-25 09:29:31.664998
3323	1182	4	\N	2018-05-25 09:29:31.67336	2018-05-25 09:29:31.67336
3324	1182	12	\N	2018-05-25 09:29:31.678275	2018-05-25 09:29:31.678275
3325	1183	5	\N	2018-05-25 09:29:31.688108	2018-05-25 09:29:31.688108
3326	1183	10	\N	2018-05-25 09:29:31.691024	2018-05-25 09:29:31.691024
3327	1184	5	\N	2018-05-25 09:29:31.698539	2018-05-25 09:29:31.698539
3328	1184	10	\N	2018-05-25 09:29:31.702314	2018-05-25 09:29:31.702314
3329	1185	5	\N	2018-05-25 09:29:31.71297	2018-05-25 09:29:31.71297
3330	1185	11	\N	2018-05-25 09:29:31.718922	2018-05-25 09:29:31.718922
3331	1186	5	\N	2018-05-25 09:29:31.728177	2018-05-25 09:29:31.728177
3332	1186	11	\N	2018-05-25 09:29:31.730753	2018-05-25 09:29:31.730753
3333	1187	5	\N	2018-05-25 09:29:31.737857	2018-05-25 09:29:31.737857
3334	1187	12	\N	2018-05-25 09:29:31.740332	2018-05-25 09:29:31.740332
3335	1188	5	\N	2018-05-25 09:29:31.749742	2018-05-25 09:29:31.749742
3336	1188	12	\N	2018-05-25 09:29:31.754327	2018-05-25 09:29:31.754327
3337	1189	4	\N	2018-05-25 09:29:31.765508	2018-05-25 09:29:31.765508
3338	1189	10	\N	2018-05-25 09:29:31.768061	2018-05-25 09:29:31.768061
3339	1190	4	\N	2018-05-25 09:29:31.77461	2018-05-25 09:29:31.77461
3340	1190	10	\N	2018-05-25 09:29:31.785977	2018-05-25 09:29:31.785977
3341	1191	4	\N	2018-05-25 09:29:31.797265	2018-05-25 09:29:31.797265
3342	1191	11	\N	2018-05-25 09:29:31.803839	2018-05-25 09:29:31.803839
3343	1192	4	\N	2018-05-25 09:29:31.814873	2018-05-25 09:29:31.814873
3344	1192	11	\N	2018-05-25 09:29:31.81702	2018-05-25 09:29:31.81702
3345	1193	4	\N	2018-05-25 09:29:31.822539	2018-05-25 09:29:31.822539
3346	1193	12	\N	2018-05-25 09:29:31.826639	2018-05-25 09:29:31.826639
3347	1194	4	\N	2018-05-25 09:29:31.835596	2018-05-25 09:29:31.835596
3348	1194	12	\N	2018-05-25 09:29:31.837926	2018-05-25 09:29:31.837926
3349	1195	5	\N	2018-05-25 09:29:31.846309	2018-05-25 09:29:31.846309
3350	1195	10	\N	2018-05-25 09:29:31.850748	2018-05-25 09:29:31.850748
3351	1196	5	\N	2018-05-25 09:29:31.857138	2018-05-25 09:29:31.857138
3352	1196	10	\N	2018-05-25 09:29:31.863711	2018-05-25 09:29:31.863711
3353	1197	5	\N	2018-05-25 09:29:31.874988	2018-05-25 09:29:31.874988
3354	1197	11	\N	2018-05-25 09:29:31.878925	2018-05-25 09:29:31.878925
3355	1198	5	\N	2018-05-25 09:29:31.888307	2018-05-25 09:29:31.888307
3356	1198	11	\N	2018-05-25 09:29:31.891323	2018-05-25 09:29:31.891323
3357	1199	5	\N	2018-05-25 09:29:31.900473	2018-05-25 09:29:31.900473
3358	1199	12	\N	2018-05-25 09:29:31.902944	2018-05-25 09:29:31.902944
3359	1200	5	\N	2018-05-25 09:29:31.914136	2018-05-25 09:29:31.914136
3360	1200	12	\N	2018-05-25 09:29:31.920139	2018-05-25 09:29:31.920139
\.


--
-- Data for Name: variants; Type: TABLE DATA; Schema: public; Owner: alen_marz
--

COPY public.variants (id, product_id, sku, barcode, price, amount, deleted_at, created_at, updated_at) FROM stdin;
2	2	B0000DHCZT	\N	12.86	0.0	\N	2018-05-25 09:29:20.950353	2018-05-25 09:29:31.983044
3	3	B000AF8T1C	\N	31.12	0.0	\N	2018-05-25 09:29:20.958478	2018-05-25 09:29:31.996348
4	4	B000A2MHMW	\N	50.44	0.0	\N	2018-05-25 09:29:20.96618	2018-05-25 09:29:32.005472
5	5	B00065E4WY	\N	44.92	0.0	\N	2018-05-25 09:29:20.974252	2018-05-25 09:29:32.009727
6	6	B000HW06LY	\N	38.07	0.0	\N	2018-05-25 09:29:20.981938	2018-05-25 09:29:32.01456
7	7	B000JQ0JNS	\N	0.68	0.0	\N	2018-05-25 09:29:20.989803	2018-05-25 09:29:32.026545
8	8	B000IXHC2S	\N	81.67	0.0	\N	2018-05-25 09:29:20.997836	2018-05-25 09:29:32.032579
9	9	B000A2NIK2	\N	42.49	0.0	\N	2018-05-25 09:29:21.006446	2018-05-25 09:29:32.036469
10	10	B000FTQ5A0	\N	52.46	0.0	\N	2018-05-25 09:29:21.014164	2018-05-25 09:29:32.048953
11	11	B0000VFDCY	\N	43.99	0.0	\N	2018-05-25 09:29:21.02179	2018-05-25 09:29:32.061096
12	12	B0000AAGJF	\N	42.23	0.0	\N	2018-05-25 09:29:21.029673	2018-05-25 09:29:32.065213
13	13	B0001H5RIC	\N	32.75	0.0	\N	2018-05-25 09:29:21.037542	2018-05-25 09:29:32.077012
14	14	B0009QHJSG	\N	90.85	0.0	\N	2018-05-25 09:29:21.045579	2018-05-25 09:29:32.08886
15	15	B000BHLISA	\N	71.0	0.0	\N	2018-05-25 09:29:21.053092	2018-05-25 09:29:32.096534
16	16	B0002RTXMM	\N	53.71	0.0	\N	2018-05-25 09:29:21.060428	2018-05-25 09:29:32.10683
17	17	B000IAPR0U	\N	3.91	0.0	\N	2018-05-25 09:29:21.069603	2018-05-25 09:29:32.111068
18	18	B000O332KS	\N	10.0	0.0	\N	2018-05-25 09:29:21.077901	2018-05-25 09:29:32.11688
19	19	B000A70EOU	\N	73.94	0.0	\N	2018-05-25 09:29:21.085641	2018-05-25 09:29:32.137081
21	21	B000PWBC6Y	\N	56.59	0.0	\N	2018-05-25 09:29:21.10515	2018-05-25 09:29:32.155689
22	22	B000A3JNTG	\N	41.36	0.0	\N	2018-05-25 09:29:21.113593	2018-05-25 09:29:32.161008
23	23	B0000DEVGP	\N	76.07	0.0	\N	2018-05-25 09:29:21.121832	2018-05-25 09:29:32.171763
24	24	B000HCTRK0	\N	94.37	0.0	\N	2018-05-25 09:29:21.131493	2018-05-25 09:29:32.183246
25	25	B000KBAL6W	\N	29.61	0.0	\N	2018-05-25 09:29:21.140959	2018-05-25 09:29:32.187926
26	26	B000P4178K	\N	11.38	0.0	\N	2018-05-25 09:29:21.149403	2018-05-25 09:29:32.198857
27	27	B000A2LSJ0	\N	5.27	0.0	\N	2018-05-25 09:29:21.157188	2018-05-25 09:29:32.203169
28	28	B000HW06LY	\N	4.34	0.0	\N	2018-05-25 09:29:21.165112	2018-05-25 09:29:32.21225
29	29	B000N5HN3Y	\N	26.43	0.0	\N	2018-05-25 09:29:21.172442	2018-05-25 09:29:32.219197
30	30	B0000DE0T8	\N	2.44	0.0	\N	2018-05-25 09:29:21.180445	2018-05-25 09:29:32.22717
31	31	B000FNP6CY	\N	23.02	0.0	\N	2018-05-25 09:29:21.18902	2018-05-25 09:29:32.229724
32	32	B000BJ0LSQ	\N	49.82	0.0	\N	2018-05-25 09:29:21.197503	2018-05-25 09:29:32.239636
33	33	B000A2LSJ0	\N	93.19	0.0	\N	2018-05-25 09:29:21.208053	2018-05-25 09:29:32.242301
34	34	B0009IOFWC	\N	42.85	0.0	\N	2018-05-25 09:29:21.21639	2018-05-25 09:29:32.247859
35	35	B000HB0138	\N	39.72	0.0	\N	2018-05-25 09:29:21.2243	2018-05-25 09:29:32.254798
36	36	B000ALH1DI	\N	0.64	0.0	\N	2018-05-25 09:29:21.23258	2018-05-25 09:29:32.259305
37	37	B000Q313FC	\N	89.12	0.0	\N	2018-05-25 09:29:21.240088	2018-05-25 09:29:32.273182
38	38	B000BYDF4I	\N	14.96	0.0	\N	2018-05-25 09:29:21.247686	2018-05-25 09:29:32.277232
39	39	B000A70EOU	\N	78.48	0.0	\N	2018-05-25 09:29:21.255541	2018-05-25 09:29:32.280166
40	40	B00079UXEC	\N	62.28	0.0	\N	2018-05-25 09:29:21.263595	2018-05-25 09:29:32.291576
41	41	B000KJW2JS	\N	27.06	0.0	\N	2018-05-25 09:29:21.272226	2018-05-25 09:29:32.298644
42	42	B000A2NZFK	\N	78.73	0.0	\N	2018-05-25 09:29:21.283146	2018-05-25 09:29:32.306284
44	44	B0000DFH0E	\N	39.54	0.0	\N	2018-05-25 09:29:21.3023	2018-05-25 09:29:32.315232
45	45	B00066USX2	\N	60.57	0.0	\N	2018-05-25 09:29:21.312211	2018-05-25 09:29:32.328611
46	46	B0000DYZW5	\N	21.22	0.0	\N	2018-05-25 09:29:21.322274	2018-05-25 09:29:32.338098
47	47	B0000DFPMN	\N	34.74	0.0	\N	2018-05-25 09:29:21.332279	2018-05-25 09:29:32.347471
48	48	B0002GL2BS	\N	16.69	0.0	\N	2018-05-25 09:29:21.342524	2018-05-25 09:29:32.354602
49	49	B000ARBM9G	\N	67.19	0.0	\N	2018-05-25 09:29:21.353977	2018-05-25 09:29:32.358996
50	50	B0002RFYGQ	\N	66.85	0.0	\N	2018-05-25 09:29:21.363015	2018-05-25 09:29:32.366573
51	51	B0001H5RIC	\N	53.09	0.0	\N	2018-05-25 09:29:21.371204	2018-05-25 09:29:32.377927
52	52	B0000DGH5J	\N	14.24	0.0	\N	2018-05-25 09:29:21.379504	2018-05-25 09:29:32.381228
53	53	B000N5HN3Y	\N	99.84	0.0	\N	2018-05-25 09:29:21.387017	2018-05-25 09:29:32.386242
54	54	B0002RFYGQ	\N	56.67	0.0	\N	2018-05-25 09:29:21.394489	2018-05-25 09:29:32.390346
55	55	B000J42NY8	\N	13.15	0.0	\N	2018-05-25 09:29:21.402688	2018-05-25 09:29:32.405264
56	56	B000A6QSTG	\N	49.44	0.0	\N	2018-05-25 09:29:21.410428	2018-05-25 09:29:32.409651
57	57	B000JMIRRC	\N	1.56	0.0	\N	2018-05-25 09:29:21.419077	2018-05-25 09:29:32.414827
58	58	B0000DFLFJ	\N	85.27	0.0	\N	2018-05-25 09:29:21.42864	2018-05-25 09:29:32.425182
59	59	B000I6QKZU	\N	99.46	0.0	\N	2018-05-25 09:29:21.436569	2018-05-25 09:29:32.43933
60	60	B0000DYXE0	\N	66.67	0.0	\N	2018-05-25 09:29:21.444609	2018-05-25 09:29:32.444048
61	61	B000CENBP0	\N	98.17	0.0	\N	2018-05-25 09:29:21.452409	2018-05-25 09:29:32.451016
62	62	B0000DGTOF	\N	79.51	0.0	\N	2018-05-25 09:29:21.460219	2018-05-25 09:29:32.453828
63	63	B000MLA1UQ	\N	42.29	0.0	\N	2018-05-25 09:29:21.468212	2018-05-25 09:29:32.466959
64	64	B0000DFOKF	\N	27.35	0.0	\N	2018-05-25 09:29:21.475909	2018-05-25 09:29:32.472545
65	65	B000GTFRX0	\N	17.83	0.0	\N	2018-05-25 09:29:21.485116	2018-05-25 09:29:32.481906
67	67	B000675MDW	\N	17.63	0.0	\N	2018-05-25 09:29:21.504736	2018-05-25 09:29:32.487229
68	68	B0001FGAO4	\N	91.76	0.0	\N	2018-05-25 09:29:21.51288	2018-05-25 09:29:32.498001
69	69	B0000DEVGP	\N	7.69	0.0	\N	2018-05-25 09:29:21.520823	2018-05-25 09:29:32.501277
70	70	B000HW20EA	\N	99.57	0.0	\N	2018-05-25 09:29:21.529315	2018-05-25 09:29:32.512952
71	71	B000Q6Y34W	\N	1.69	0.0	\N	2018-05-25 09:29:21.537057	2018-05-25 09:29:32.516592
72	72	B000B7722Q	\N	37.72	0.0	\N	2018-05-25 09:29:21.545196	2018-05-25 09:29:32.528289
73	73	B000AR9FZE	\N	42.47	0.0	\N	2018-05-25 09:29:21.553836	2018-05-25 09:29:32.530802
74	74	B000ABNX30	\N	86.91	0.0	\N	2018-05-25 09:29:21.562046	2018-05-25 09:29:32.536843
75	75	B0000DGFW7	\N	3.86	0.0	\N	2018-05-25 09:29:21.570028	2018-05-25 09:29:32.543394
76	76	B000E5GB3Q	\N	71.87	0.0	\N	2018-05-25 09:29:21.57816	2018-05-25 09:29:32.554676
77	77	B000BPHSLS	\N	0.33	0.0	\N	2018-05-25 09:29:21.585964	2018-05-25 09:29:32.560584
78	78	B000IT4T9Q	\N	81.36	0.0	\N	2018-05-25 09:29:21.593921	2018-05-25 09:29:32.56542
79	79	B000A2MHMW	\N	17.49	0.0	\N	2018-05-25 09:29:21.603587	2018-05-25 09:29:32.570102
80	80	B0000DDEMJ	\N	72.25	0.0	\N	2018-05-25 09:29:21.612589	2018-05-25 09:29:32.574119
81	81	B000A70B9I	\N	59.99	0.0	\N	2018-05-25 09:29:21.620489	2018-05-25 09:29:32.579635
82	82	B000BPNBCI	\N	93.92	0.0	\N	2018-05-25 09:29:21.630037	2018-05-25 09:29:32.590222
83	83	B000IT4T96	\N	48.47	0.0	\N	2018-05-25 09:29:21.637959	2018-05-25 09:29:32.592609
84	84	B0002I6HKW	\N	13.65	0.0	\N	2018-05-25 09:29:21.648651	2018-05-25 09:29:32.598717
85	85	B000BPZFNQ	\N	5.32	0.0	\N	2018-05-25 09:29:21.656897	2018-05-25 09:29:32.606198
86	86	B000662ADI	\N	98.72	0.0	\N	2018-05-25 09:29:21.66834	2018-05-25 09:29:32.619055
87	87	B0000DGQ5D	\N	77.31	0.0	\N	2018-05-25 09:29:21.679635	2018-05-25 09:29:32.63314
88	88	B0000DFDWF	\N	84.34	0.0	\N	2018-05-25 09:29:21.693492	2018-05-25 09:29:32.645784
90	90	B000I6MK7W	\N	20.66	0.0	\N	2018-05-25 09:29:21.719092	2018-05-25 09:29:32.658793
91	91	B0009R9L7W	\N	52.7	0.0	\N	2018-05-25 09:29:21.729335	2018-05-25 09:29:32.664939
92	92	B000K0WZ2G	\N	56.73	0.0	\N	2018-05-25 09:29:21.737634	2018-05-25 09:29:32.668975
93	93	B000II6WOW	\N	49.68	0.0	\N	2018-05-25 09:29:21.746897	2018-05-25 09:29:32.679133
94	94	B000A2SVXQ	\N	14.54	0.0	\N	2018-05-25 09:29:21.754897	2018-05-25 09:29:32.68281
95	95	B0000W2LW8	\N	89.68	0.0	\N	2018-05-25 09:29:21.763246	2018-05-25 09:29:32.68886
96	96	B00012FB6K	\N	80.98	0.0	\N	2018-05-25 09:29:21.776913	2018-05-25 09:29:32.700003
97	97	B000PGCLWY	\N	61.72	0.0	\N	2018-05-25 09:29:21.789328	2018-05-25 09:29:32.705969
98	98	B0000DHWDX	\N	94.3	0.0	\N	2018-05-25 09:29:21.799481	2018-05-25 09:29:32.709735
99	99	B000A2NZFK	\N	92.5	0.0	\N	2018-05-25 09:29:21.810353	2018-05-25 09:29:32.721091
100	100	B0000AATPM	\N	77.83	0.0	\N	2018-05-25 09:29:21.820687	2018-05-25 09:29:32.723505
101	101	B0000VFDCY	\N	84.71	0.0	\N	2018-05-25 09:29:21.830725	2018-05-25 09:29:32.731125
102	102	B00067PLD8	\N	84.19	0.0	\N	2018-05-25 09:29:21.838605	2018-05-25 09:29:32.736886
103	103	B000GTYMOK	\N	1.81	0.0	\N	2018-05-25 09:29:21.847314	2018-05-25 09:29:32.745528
104	104	B0000AATPM	\N	50.32	0.0	\N	2018-05-25 09:29:21.85564	2018-05-25 09:29:32.749656
105	105	B000A2LWKU	\N	85.32	0.0	\N	2018-05-25 09:29:21.865014	2018-05-25 09:29:32.756533
106	106	B000KGCZ8O	\N	18.17	0.0	\N	2018-05-25 09:29:21.873064	2018-05-25 09:29:32.764578
107	107	B000JZZHEU	\N	99.67	0.0	\N	2018-05-25 09:29:21.881932	2018-05-25 09:29:32.768018
109	109	B000BHE134	\N	34.81	0.0	\N	2018-05-25 09:29:21.898308	2018-05-25 09:29:32.784021
110	110	B000BJ8TZI	\N	61.89	0.0	\N	2018-05-25 09:29:21.905885	2018-05-25 09:29:32.786686
111	111	B0000TFLNM	\N	29.7	0.0	\N	2018-05-25 09:29:21.914126	2018-05-25 09:29:32.793858
112	112	B000A6Y8AW	\N	32.21	0.0	\N	2018-05-25 09:29:21.921708	2018-05-25 09:29:32.798939
113	113	B0000V3W9U	\N	51.11	0.0	\N	2018-05-25 09:29:21.931652	2018-05-25 09:29:32.803764
114	114	B0000DHWAB	\N	74.99	0.0	\N	2018-05-25 09:29:21.939489	2018-05-25 09:29:32.809983
115	115	B0000DHF4M	\N	77.04	0.0	\N	2018-05-25 09:29:21.947719	2018-05-25 09:29:32.818475
116	116	B000IATJ5Y	\N	47.2	0.0	\N	2018-05-25 09:29:21.95532	2018-05-25 09:29:32.823819
117	117	B0002SUQUY	\N	1.49	0.0	\N	2018-05-25 09:29:21.963651	2018-05-25 09:29:32.826344
118	118	B000A2NIK2	\N	79.63	0.0	\N	2018-05-25 09:29:21.971346	2018-05-25 09:29:32.842144
119	119	B0002X4OIY	\N	60.47	0.0	\N	2018-05-25 09:29:21.979899	2018-05-25 09:29:32.847003
120	120	B000I6XDVE	\N	13.39	0.0	\N	2018-05-25 09:29:21.987687	2018-05-25 09:29:32.851532
121	121	B000Q313FC	\N	3.76	0.0	\N	2018-05-25 09:29:21.996314	2018-05-25 09:29:32.861401
122	122	B00005R12M	\N	79.1	0.0	\N	2018-05-25 09:29:22.005609	2018-05-25 09:29:32.866583
123	123	B0009R9L7W	\N	34.4	0.0	\N	2018-05-25 09:29:22.015097	2018-05-25 09:29:32.875306
124	124	B000ITBS40	\N	45.48	0.0	\N	2018-05-25 09:29:22.024638	2018-05-25 09:29:32.880044
125	125	B000BMHOVU	\N	8.97	0.0	\N	2018-05-25 09:29:22.033303	2018-05-25 09:29:32.883389
126	126	B0000DHY2O	\N	48.19	0.0	\N	2018-05-25 09:29:22.041883	2018-05-25 09:29:32.891388
127	127	B000A2NVLS	\N	56.45	0.0	\N	2018-05-25 09:29:22.050577	2018-05-25 09:29:32.896055
128	128	B000ML8E7I	\N	53.93	0.0	\N	2018-05-25 09:29:22.059837	2018-05-25 09:29:32.898901
129	129	B000BJ0KBO	\N	21.16	0.0	\N	2018-05-25 09:29:22.068862	2018-05-25 09:29:32.908775
130	130	B00067EOF4	\N	94.95	0.0	\N	2018-05-25 09:29:22.077614	2018-05-25 09:29:32.914318
132	132	B00066USKU	\N	12.72	0.0	\N	2018-05-25 09:29:22.094285	2018-05-25 09:29:32.928971
133	133	B000A3PVZ6	\N	69.05	0.0	\N	2018-05-25 09:29:22.104635	2018-05-25 09:29:32.936937
134	134	B000IBFL2S	\N	10.44	0.0	\N	2018-05-25 09:29:22.114521	2018-05-25 09:29:32.941054
135	135	B000A2SP0K	\N	59.32	0.0	\N	2018-05-25 09:29:22.123267	2018-05-25 09:29:32.944396
136	136	B0000DHW2M	\N	45.66	0.0	\N	2018-05-25 09:29:22.133066	2018-05-25 09:29:32.953615
137	137	B000ALJYO2	\N	91.59	0.0	\N	2018-05-25 09:29:22.142472	2018-05-25 09:29:32.9659
138	138	B000GPHRW8	\N	69.21	0.0	\N	2018-05-25 09:29:22.150877	2018-05-25 09:29:32.968757
139	139	B000HVZOOO	\N	44.47	0.0	\N	2018-05-25 09:29:22.159452	2018-05-25 09:29:32.975777
140	140	B000IAPR0U	\N	42.81	0.0	\N	2018-05-25 09:29:22.167832	2018-05-25 09:29:32.987554
141	141	B000ALH1DI	\N	38.31	0.0	\N	2018-05-25 09:29:22.176566	2018-05-25 09:29:32.991204
142	142	B000AADDGS	\N	61.2	0.0	\N	2018-05-25 09:29:22.184821	2018-05-25 09:29:33.005748
143	143	B000ALH1DI	\N	4.31	0.0	\N	2018-05-25 09:29:22.192921	2018-05-25 09:29:33.0146
144	144	B000A3PVZ6	\N	56.88	0.0	\N	2018-05-25 09:29:22.200531	2018-05-25 09:29:33.020409
145	145	B000NKOHPG	\N	43.31	0.0	\N	2018-05-25 09:29:22.209403	2018-05-25 09:29:33.024992
146	146	B000AADDGS	\N	48.61	0.0	\N	2018-05-25 09:29:22.218379	2018-05-25 09:29:33.03005
147	147	B000NKUUKW	\N	14.38	0.0	\N	2018-05-25 09:29:22.2281	2018-05-25 09:29:33.041819
148	148	B00079UXEC	\N	96.07	0.0	\N	2018-05-25 09:29:22.238439	2018-05-25 09:29:33.044318
149	149	B000675MDW	\N	32.29	0.0	\N	2018-05-25 09:29:22.25324	2018-05-25 09:29:33.053424
150	150	B000IXR5RK	\N	0.08	0.0	\N	2018-05-25 09:29:22.266417	2018-05-25 09:29:33.064325
151	151	B000BOIITU	\N	70.1	0.0	\N	2018-05-25 09:29:22.277156	2018-05-25 09:29:33.067534
152	152	B000BHP4DA	\N	36.59	0.0	\N	2018-05-25 09:29:22.291798	2018-05-25 09:29:33.083164
153	153	B000FTBJGA	\N	44.05	0.0	\N	2018-05-25 09:29:22.309515	2018-05-25 09:29:33.088437
155	155	B000BPGAOE	\N	67.83	0.0	\N	2018-05-25 09:29:22.335797	2018-05-25 09:29:33.102971
156	156	B000A3PGTC	\N	86.49	0.0	\N	2018-05-25 09:29:22.351221	2018-05-25 09:29:33.107507
157	157	B000NKSOOQ	\N	63.4	0.0	\N	2018-05-25 09:29:22.374278	2018-05-25 09:29:33.12476
158	158	B0000DGI28	\N	36.71	0.0	\N	2018-05-25 09:29:22.391813	2018-05-25 09:29:33.136454
159	159	B000Q6Y34W	\N	94.12	0.0	\N	2018-05-25 09:29:22.407413	2018-05-25 09:29:33.148139
160	160	B0000DIEOI	\N	60.05	0.0	\N	2018-05-25 09:29:22.423279	2018-05-25 09:29:33.155837
161	161	B000I6QKZU	\N	9.76	0.0	\N	2018-05-25 09:29:22.452918	2018-05-25 09:29:33.16426
162	162	B000IT4T96	\N	48.05	0.0	\N	2018-05-25 09:29:22.471107	2018-05-25 09:29:33.17516
163	163	B000A2TMH0	\N	42.17	0.0	\N	2018-05-25 09:29:22.488073	2018-05-25 09:29:33.184644
164	164	B000A2O26G	\N	70.77	0.0	\N	2018-05-25 09:29:22.503618	2018-05-25 09:29:33.194985
165	165	B000Q71WNG	\N	24.49	0.0	\N	2018-05-25 09:29:22.515566	2018-05-25 09:29:33.197854
166	166	B0000DHWDX	\N	92.82	0.0	\N	2018-05-25 09:29:22.525577	2018-05-25 09:29:33.208191
167	167	B000A6Y8AW	\N	3.75	0.0	\N	2018-05-25 09:29:22.536476	2018-05-25 09:29:33.213299
168	168	B0002TJ4JM	\N	19.45	0.0	\N	2018-05-25 09:29:22.544893	2018-05-25 09:29:33.218284
169	169	B00025AGUM	\N	15.78	0.0	\N	2018-05-25 09:29:22.553451	2018-05-25 09:29:33.225206
170	170	B000II6WOW	\N	65.66	0.0	\N	2018-05-25 09:29:22.561245	2018-05-25 09:29:33.229867
171	171	B000GWGMP4	\N	10.45	0.0	\N	2018-05-25 09:29:22.568401	2018-05-25 09:29:33.241713
172	172	B000A3M9CY	\N	50.17	0.0	\N	2018-05-25 09:29:22.57707	2018-05-25 09:29:33.247304
173	173	B0002I6HKW	\N	11.61	0.0	\N	2018-05-25 09:29:22.587139	2018-05-25 09:29:33.251702
174	174	B000IBJ3OA	\N	12.12	0.0	\N	2018-05-25 09:29:22.595521	2018-05-25 09:29:33.258124
175	175	B0000DFH0E	\N	97.57	0.0	\N	2018-05-25 09:29:22.604912	2018-05-25 09:29:33.262747
176	176	B0000DYX4V	\N	36.0	0.0	\N	2018-05-25 09:29:22.612939	2018-05-25 09:29:33.267852
178	178	B0000DHW2M	\N	38.61	0.0	\N	2018-05-25 09:29:22.630519	2018-05-25 09:29:33.28542
179	179	B00065F3KG	\N	5.04	0.0	\N	2018-05-25 09:29:22.638817	2018-05-25 09:29:33.290823
180	180	B000CENBP0	\N	98.28	0.0	\N	2018-05-25 09:29:22.647194	2018-05-25 09:29:33.30035
181	181	B000BHP3T0	\N	79.88	0.0	\N	2018-05-25 09:29:22.654859	2018-05-25 09:29:33.305691
182	182	B000IAPYWQ	\N	32.91	0.0	\N	2018-05-25 09:29:22.662754	2018-05-25 09:29:33.310907
183	183	B000A1AUBI	\N	88.34	0.0	\N	2018-05-25 09:29:22.670785	2018-05-25 09:29:33.31515
184	184	B0000VFDCY	\N	53.15	0.0	\N	2018-05-25 09:29:22.679121	2018-05-25 09:29:33.323956
185	185	B0000008XW	\N	84.89	0.0	\N	2018-05-25 09:29:22.687143	2018-05-25 09:29:33.328281
186	186	B0000ACB9R	\N	16.92	0.0	\N	2018-05-25 09:29:22.695084	2018-05-25 09:29:33.338324
187	187	B000BJ0LSQ	\N	46.67	0.0	\N	2018-05-25 09:29:22.703315	2018-05-25 09:29:33.343492
188	188	B000PGCLWY	\N	91.53	0.0	\N	2018-05-25 09:29:22.711446	2018-05-25 09:29:33.347701
189	189	B0000DYZRA	\N	74.46	0.0	\N	2018-05-25 09:29:22.719431	2018-05-25 09:29:33.357709
190	190	B000662QI2	\N	87.86	0.0	\N	2018-05-25 09:29:22.727922	2018-05-25 09:29:33.363976
191	191	B000GT8JQC	\N	8.27	0.0	\N	2018-05-25 09:29:22.737161	2018-05-25 09:29:33.372256
192	192	B0000DGWB4	\N	16.61	0.0	\N	2018-05-25 09:29:22.749368	2018-05-25 09:29:33.376411
193	193	B000BSH8AQ	\N	38.79	0.0	\N	2018-05-25 09:29:22.763891	2018-05-25 09:29:33.3865
194	194	B000J0NOTK	\N	0.75	0.0	\N	2018-05-25 09:29:22.773687	2018-05-25 09:29:33.397946
195	195	B0009QHJSG	\N	59.78	0.0	\N	2018-05-25 09:29:22.786849	2018-05-25 09:29:33.40276
197	197	B000FTQ5A0	\N	47.29	0.0	\N	2018-05-25 09:29:22.81522	2018-05-25 09:29:33.418041
198	198	B000A3PVZ6	\N	87.27	0.0	\N	2018-05-25 09:29:22.830912	2018-05-25 09:29:33.420656
199	199	B00000AYGE	\N	44.04	0.0	\N	2018-05-25 09:29:22.84663	2018-05-25 09:29:33.424497
200	200	B000BQ2HR2	\N	84.5	0.0	\N	2018-05-25 09:29:22.862885	2018-05-25 09:29:33.436125
201	201	B000662ADI	\N	38.35	0.0	\N	2018-05-25 09:29:22.881474	2018-05-25 09:29:33.443302
202	202	B0002X4OIY	\N	95.37	0.0	\N	2018-05-25 09:29:22.899651	2018-05-25 09:29:33.44965
203	203	B000BHE134	\N	62.78	0.0	\N	2018-05-25 09:29:22.913026	2018-05-25 09:29:33.453544
204	204	B000IAPYWQ	\N	48.99	0.0	\N	2018-05-25 09:29:22.928032	2018-05-25 09:29:33.457524
205	205	B000BIWPKO	\N	65.01	0.0	\N	2018-05-25 09:29:22.941142	2018-05-25 09:29:33.477079
206	206	B000KEYQLA	\N	49.56	0.0	\N	2018-05-25 09:29:22.950928	2018-05-25 09:29:33.487336
207	207	B000AOMPAY	\N	90.02	0.0	\N	2018-05-25 09:29:22.961152	2018-05-25 09:29:33.497952
208	208	B0000W2MNQ	\N	33.02	0.0	\N	2018-05-25 09:29:22.970618	2018-05-25 09:29:33.50833
209	209	B00067PLD8	\N	58.65	0.0	\N	2018-05-25 09:29:22.982222	2018-05-25 09:29:33.518022
210	210	B000GT8JQC	\N	11.9	0.0	\N	2018-05-25 09:29:22.991522	2018-05-25 09:29:33.520622
211	211	B0000DGTOF	\N	45.06	0.0	\N	2018-05-25 09:29:23.000965	2018-05-25 09:29:33.530609
212	212	B000CR7COS	\N	94.36	0.0	\N	2018-05-25 09:29:23.00989	2018-05-25 09:29:33.534669
213	213	B0002XUV3G	\N	36.99	0.0	\N	2018-05-25 09:29:23.018863	2018-05-25 09:29:33.547799
214	214	B0002STO02	\N	75.98	0.0	\N	2018-05-25 09:29:23.028435	2018-05-25 09:29:33.55874
215	215	B000A3TB9I	\N	77.27	0.0	\N	2018-05-25 09:29:23.037251	2018-05-25 09:29:33.563433
216	216	B000B7722Q	\N	15.83	0.0	\N	2018-05-25 09:29:23.045906	2018-05-25 09:29:33.568291
217	217	B000BHP3T0	\N	66.66	0.0	\N	2018-05-25 09:29:23.056795	2018-05-25 09:29:33.574357
218	218	B000B7CC94	\N	52.49	0.0	\N	2018-05-25 09:29:23.06549	2018-05-25 09:29:33.579
220	220	B000GWH2DU	\N	61.94	0.0	\N	2018-05-25 09:29:23.083059	2018-05-25 09:29:33.593614
221	221	B000CFIMWQ	\N	5.36	0.0	\N	2018-05-25 09:29:23.091499	2018-05-25 09:29:33.60029
222	222	B000KU5ELA	\N	89.04	0.0	\N	2018-05-25 09:29:23.100698	2018-05-25 09:29:33.608872
223	223	B000A3J9AE	\N	27.09	0.0	\N	2018-05-25 09:29:23.112471	2018-05-25 09:29:33.614186
224	224	B00067PKPM	\N	69.47	0.0	\N	2018-05-25 09:29:23.122557	2018-05-25 09:29:33.624749
225	225	B000BJ8TZI	\N	77.73	0.0	\N	2018-05-25 09:29:23.13325	2018-05-25 09:29:33.631537
226	226	B000BJ20OE	\N	51.46	0.0	\N	2018-05-25 09:29:23.142035	2018-05-25 09:29:33.636383
227	227	B000A0AQPO	\N	73.54	0.0	\N	2018-05-25 09:29:23.151096	2018-05-25 09:29:33.64695
228	228	B000A3K6TM	\N	95.15	0.0	\N	2018-05-25 09:29:23.161842	2018-05-25 09:29:33.650829
229	229	B000A3T33M	\N	16.16	0.0	\N	2018-05-25 09:29:23.170821	2018-05-25 09:29:33.65695
230	230	B00067PKPM	\N	48.15	0.0	\N	2018-05-25 09:29:23.180438	2018-05-25 09:29:33.660256
231	231	B000NKUUKW	\N	33.34	0.0	\N	2018-05-25 09:29:23.189585	2018-05-25 09:29:33.671238
232	232	B000KMRYNO	\N	55.85	0.0	\N	2018-05-25 09:29:23.199299	2018-05-25 09:29:33.674139
233	233	B0000W463K	\N	24.45	0.0	\N	2018-05-25 09:29:23.213526	2018-05-25 09:29:33.678687
234	234	B000BJ6VNA	\N	3.74	0.0	\N	2018-05-25 09:29:23.22878	2018-05-25 09:29:33.684966
235	235	B000A3LC6I	\N	48.94	0.0	\N	2018-05-25 09:29:23.243666	2018-05-25 09:29:33.690422
236	236	B000E5GB3Q	\N	57.29	0.0	\N	2018-05-25 09:29:23.25513	2018-05-25 09:29:33.701957
237	237	B000IT9ZLI	\N	13.28	0.0	\N	2018-05-25 09:29:23.265093	2018-05-25 09:29:33.707342
238	238	B0006DRM02	\N	86.41	0.0	\N	2018-05-25 09:29:23.275799	2018-05-25 09:29:33.711368
239	239	B000P5XI6S	\N	25.64	0.0	\N	2018-05-25 09:29:23.289717	2018-05-25 09:29:33.719445
240	240	B000A3PYLW	\N	61.29	0.0	\N	2018-05-25 09:29:23.305451	2018-05-25 09:29:33.725297
241	241	B000675MDW	\N	53.19	0.0	\N	2018-05-25 09:29:23.323719	2018-05-25 09:29:33.72933
243	243	B000P42ICO	\N	81.55	0.0	\N	2018-05-25 09:29:23.356832	2018-05-25 09:29:33.746302
244	244	B000HGWGHW	\N	94.2	0.0	\N	2018-05-25 09:29:23.371452	2018-05-25 09:29:33.749017
245	245	B000GTYMOK	\N	1.12	0.0	\N	2018-05-25 09:29:23.385347	2018-05-25 09:29:33.757447
246	246	B000GFCVA6	\N	45.06	0.0	\N	2018-05-25 09:29:23.400325	2018-05-25 09:29:33.760953
247	247	B000675MDW	\N	17.98	0.0	\N	2018-05-25 09:29:23.417848	2018-05-25 09:29:33.771768
248	248	B000GWH2DU	\N	48.74	0.0	\N	2018-05-25 09:29:23.438776	2018-05-25 09:29:33.774285
249	249	B0009IT5P4	\N	48.28	0.0	\N	2018-05-25 09:29:23.456038	2018-05-25 09:29:33.782256
250	250	B000A2MF7E	\N	87.19	0.0	\N	2018-05-25 09:29:23.471504	2018-05-25 09:29:33.793139
251	251	B000KGCZ8O	\N	16.43	0.0	\N	2018-05-25 09:29:23.482266	2018-05-25 09:29:33.800232
252	252	B000HKQS6I	\N	87.48	0.0	\N	2018-05-25 09:29:23.492545	2018-05-25 09:29:33.804326
253	253	B000P42ICO	\N	96.78	0.0	\N	2018-05-25 09:29:23.502315	2018-05-25 09:29:33.812158
254	254	B0000DFLFJ	\N	33.55	0.0	\N	2018-05-25 09:29:23.511923	2018-05-25 09:29:33.817559
255	255	B000FTQ5A0	\N	80.87	0.0	\N	2018-05-25 09:29:23.522258	2018-05-25 09:29:33.822428
256	256	B000BPGAOE	\N	94.43	0.0	\N	2018-05-25 09:29:23.536983	2018-05-25 09:29:33.830772
257	257	B000KEYQLA	\N	83.09	0.0	\N	2018-05-25 09:29:23.55334	2018-05-25 09:29:33.843318
258	258	B000BPZFNQ	\N	58.22	0.0	\N	2018-05-25 09:29:23.56777	2018-05-25 09:29:33.853843
259	259	B0002BXBEY	\N	87.06	0.0	\N	2018-05-25 09:29:23.585571	2018-05-25 09:29:33.857832
260	260	B0000DYXE0	\N	19.17	0.0	\N	2018-05-25 09:29:23.596201	2018-05-25 09:29:33.866834
261	261	B0002BXBEY	\N	62.45	0.0	\N	2018-05-25 09:29:23.611024	2018-05-25 09:29:33.870879
262	262	B00067668W	\N	30.28	0.0	\N	2018-05-25 09:29:23.627906	2018-05-25 09:29:33.884023
263	263	B000I6MK7W	\N	28.72	0.0	\N	2018-05-25 09:29:23.643728	2018-05-25 09:29:33.886758
264	264	B000CSAK3M	\N	75.13	0.0	\N	2018-05-25 09:29:23.65963	2018-05-25 09:29:33.89236
266	266	B000BJ8TIA	\N	13.99	0.0	\N	2018-05-25 09:29:23.688208	2018-05-25 09:29:33.910912
267	267	B000A2NZFK	\N	23.41	0.0	\N	2018-05-25 09:29:23.70195	2018-05-25 09:29:33.91404
268	268	B0000DEC3S	\N	45.78	0.0	\N	2018-05-25 09:29:23.719715	2018-05-25 09:29:33.922912
269	269	B000GFCVA6	\N	24.37	0.0	\N	2018-05-25 09:29:23.737879	2018-05-25 09:29:33.928146
270	270	B000A409WK	\N	84.59	0.0	\N	2018-05-25 09:29:23.752795	2018-05-25 09:29:33.933973
271	271	B000BOIITU	\N	7.38	0.0	\N	2018-05-25 09:29:23.767557	2018-05-25 09:29:33.944258
272	272	B000675MDW	\N	58.79	0.0	\N	2018-05-25 09:29:23.784693	2018-05-25 09:29:33.954538
273	273	B0000AAGDL	\N	96.91	0.0	\N	2018-05-25 09:29:23.803144	2018-05-25 09:29:33.959623
274	274	B0000DGWB4	\N	57.67	0.0	\N	2018-05-25 09:29:23.816325	2018-05-25 09:29:33.968084
275	275	B0006OGUPY	\N	88.87	0.0	\N	2018-05-25 09:29:23.828697	2018-05-25 09:29:33.974229
276	276	B0000DGWB4	\N	62.16	0.0	\N	2018-05-25 09:29:23.83717	2018-05-25 09:29:33.978448
277	277	B000BPX542	\N	73.7	0.0	\N	2018-05-25 09:29:23.848244	2018-05-25 09:29:33.994721
278	278	B0000DYXE0	\N	93.86	0.0	\N	2018-05-25 09:29:23.856672	2018-05-25 09:29:33.999598
279	279	B0000W2MNQ	\N	68.26	0.0	\N	2018-05-25 09:29:23.866193	2018-05-25 09:29:34.004112
280	280	B0000B0IVU	\N	19.11	0.0	\N	2018-05-25 09:29:23.87418	2018-05-25 09:29:34.014858
281	281	B000A6Y9HY	\N	70.38	0.0	\N	2018-05-25 09:29:23.883869	2018-05-25 09:29:34.018232
282	282	B000BHP43U	\N	31.48	0.0	\N	2018-05-25 09:29:23.895714	2018-05-25 09:29:34.023153
283	283	B000COF89C	\N	48.12	0.0	\N	2018-05-25 09:29:23.903118	2018-05-25 09:29:34.031133
285	285	B0000DGXE8	\N	66.35	0.0	\N	2018-05-25 09:29:23.919732	2018-05-25 09:29:34.046152
286	286	B00000AQ4N	\N	15.84	0.0	\N	2018-05-25 09:29:23.927656	2018-05-25 09:29:34.055927
287	287	B000J2II3K	\N	80.65	0.0	\N	2018-05-25 09:29:23.935359	2018-05-25 09:29:34.059057
288	288	B000A6LPTO	\N	81.65	0.0	\N	2018-05-25 09:29:23.942999	2018-05-25 09:29:34.070173
289	289	B0009R9L7W	\N	64.87	0.0	\N	2018-05-25 09:29:23.952194	2018-05-25 09:29:34.078811
290	290	B0002GMWEO	\N	96.31	0.0	\N	2018-05-25 09:29:23.959623	2018-05-25 09:29:34.081259
291	291	B000N5HN3Y	\N	89.94	0.0	\N	2018-05-25 09:29:23.967177	2018-05-25 09:29:34.086623
292	292	B000AF8T1C	\N	89.04	0.0	\N	2018-05-25 09:29:23.97537	2018-05-25 09:29:34.09483
293	293	B0000DIEOI	\N	22.09	0.0	\N	2018-05-25 09:29:23.983826	2018-05-25 09:29:34.102414
294	294	B000A6PMBG	\N	21.78	0.0	\N	2018-05-25 09:29:23.991511	2018-05-25 09:29:34.115878
295	295	B000IBFL2S	\N	93.68	0.0	\N	2018-05-25 09:29:24.0022	2018-05-25 09:29:34.120963
296	296	B000BHP2LO	\N	7.49	0.0	\N	2018-05-25 09:29:24.013299	2018-05-25 09:29:34.125466
297	297	B0000DEC3S	\N	72.97	0.0	\N	2018-05-25 09:29:24.0249	2018-05-25 09:29:34.141425
298	298	B0000DHUGW	\N	54.72	0.0	\N	2018-05-25 09:29:24.039315	2018-05-25 09:29:34.149227
299	299	B000A2MIJY	\N	15.16	0.0	\N	2018-05-25 09:29:24.052529	2018-05-25 09:29:34.153948
300	300	B0002TJ4JM	\N	12.53	0.0	\N	2018-05-25 09:29:24.065013	2018-05-25 09:29:34.163447
301	301	B0000DHWDX	\N	97.24	0.0	\N	2018-05-25 09:29:24.078791	2018-05-25 09:29:34.168955
302	302	B0002GL2BS	\N	41.19	0.0	\N	2018-05-25 09:29:24.090363	2018-05-25 09:29:34.171384
303	303	B000A0GB7Q	\N	48.12	0.0	\N	2018-05-25 09:29:24.10537	2018-05-25 09:29:34.18054
304	304	B000A2T37E	\N	28.57	0.0	\N	2018-05-25 09:29:24.121448	2018-05-25 09:29:34.185609
305	305	B00067PA2U	\N	21.57	0.0	\N	2018-05-25 09:29:24.13478	2018-05-25 09:29:34.188047
306	306	B000Q75VCO	\N	75.7	0.0	\N	2018-05-25 09:29:24.145572	2018-05-25 09:29:34.20092
308	308	B000A3K36I	\N	69.21	0.0	\N	2018-05-25 09:29:24.164863	2018-05-25 09:29:34.207358
309	309	B000JSBHCS	\N	89.81	0.0	\N	2018-05-25 09:29:24.174265	2018-05-25 09:29:34.214588
310	310	B0007Z6B42	\N	24.14	0.0	\N	2018-05-25 09:29:24.183928	2018-05-25 09:29:34.225912
311	311	B00025BKCK	\N	65.57	0.0	\N	2018-05-25 09:29:24.192423	2018-05-25 09:29:34.22922
312	312	B0000DDZ3N	\N	35.38	0.0	\N	2018-05-25 09:29:24.200838	2018-05-25 09:29:34.241951
313	313	B000ILRO82	\N	3.57	0.0	\N	2018-05-25 09:29:24.209237	2018-05-25 09:29:34.246066
314	314	B000J2NHC2	\N	8.9	0.0	\N	2018-05-25 09:29:24.217211	2018-05-25 09:29:34.249109
315	315	B000AOMPAY	\N	31.55	0.0	\N	2018-05-25 09:29:24.22523	2018-05-25 09:29:34.256291
316	316	B000ALH1DI	\N	47.67	0.0	\N	2018-05-25 09:29:24.23286	2018-05-25 09:29:34.2684
317	317	B000IT4T96	\N	56.49	0.0	\N	2018-05-25 09:29:24.240721	2018-05-25 09:29:34.271633
318	318	B000CR7COS	\N	11.56	0.0	\N	2018-05-25 09:29:24.248608	2018-05-25 09:29:34.27926
319	319	B0000DHDOF	\N	52.63	0.0	\N	2018-05-25 09:29:24.256111	2018-05-25 09:29:34.284055
320	320	B000BQ2HR2	\N	37.23	0.0	\N	2018-05-25 09:29:24.264558	2018-05-25 09:29:34.29468
321	321	B0000B0IVU	\N	14.43	0.0	\N	2018-05-25 09:29:24.273436	2018-05-25 09:29:34.299359
322	322	B000JS9C70	\N	6.05	0.0	\N	2018-05-25 09:29:24.282772	2018-05-25 09:29:34.306746
323	323	B000A0AQPO	\N	39.02	0.0	\N	2018-05-25 09:29:24.29149	2018-05-25 09:29:34.311902
324	324	B000IT4T9Q	\N	14.95	0.0	\N	2018-05-25 09:29:24.300621	2018-05-25 09:29:34.316531
325	325	B0002SVARW	\N	34.22	0.0	\N	2018-05-25 09:29:24.309363	2018-05-25 09:29:34.326085
326	326	B000PAOCOU	\N	68.98	0.0	\N	2018-05-25 09:29:24.317483	2018-05-25 09:29:34.33245
327	327	B000K99WQE	\N	38.09	0.0	\N	2018-05-25 09:29:24.325413	2018-05-25 09:29:34.335218
328	328	B000A2SVXQ	\N	98.08	0.0	\N	2018-05-25 09:29:24.334109	2018-05-25 09:29:34.342543
329	329	B000B7CDX4	\N	20.46	0.0	\N	2018-05-25 09:29:24.344011	2018-05-25 09:29:34.34793
331	331	B000HVZOOO	\N	10.19	0.0	\N	2018-05-25 09:29:24.364781	2018-05-25 09:29:34.363707
332	332	B0000DYZW5	\N	81.8	0.0	\N	2018-05-25 09:29:24.375088	2018-05-25 09:29:34.367629
333	333	B0000DDEMJ	\N	98.03	0.0	\N	2018-05-25 09:29:24.384142	2018-05-25 09:29:34.374373
334	334	B000A0AQPO	\N	74.24	0.0	\N	2018-05-25 09:29:24.392311	2018-05-25 09:29:34.379874
335	335	B0000DIIQA	\N	42.23	0.0	\N	2018-05-25 09:29:24.400142	2018-05-25 09:29:34.385983
336	336	B000B5MVJM	\N	19.27	0.0	\N	2018-05-25 09:29:24.408284	2018-05-25 09:29:34.390735
337	337	B0009QW44A	\N	57.26	0.0	\N	2018-05-25 09:29:24.417582	2018-05-25 09:29:34.393649
338	338	B0000DGTWR	\N	19.31	0.0	\N	2018-05-25 09:29:24.425713	2018-05-25 09:29:34.406375
339	339	B000A6WENA	\N	78.07	0.0	\N	2018-05-25 09:29:24.433505	2018-05-25 09:29:34.411427
340	340	B000A6LSXW	\N	58.52	0.0	\N	2018-05-25 09:29:24.440807	2018-05-25 09:29:34.42084
341	341	B0000W47PC	\N	3.27	0.0	\N	2018-05-25 09:29:24.449032	2018-05-25 09:29:34.433657
342	342	B00067Q9HK	\N	90.8	0.0	\N	2018-05-25 09:29:24.456876	2018-05-25 09:29:34.443797
343	343	B000A2LNPO	\N	53.7	0.0	\N	2018-05-25 09:29:24.467071	2018-05-25 09:29:34.449615
344	344	B0000VAA8G	\N	72.25	0.0	\N	2018-05-25 09:29:24.475379	2018-05-25 09:29:34.454011
345	345	B000IAS0JU	\N	69.48	0.0	\N	2018-05-25 09:29:24.483712	2018-05-25 09:29:34.462212
346	346	B000PAOCOU	\N	70.07	0.0	\N	2018-05-25 09:29:24.491055	2018-05-25 09:29:34.470169
347	347	B000I6TCGO	\N	51.7	0.0	\N	2018-05-25 09:29:24.499173	2018-05-25 09:29:34.486876
348	348	B000K0WZ2G	\N	68.89	0.0	\N	2018-05-25 09:29:24.506886	2018-05-25 09:29:34.492329
349	349	B000P42ICO	\N	38.83	0.0	\N	2018-05-25 09:29:24.515265	2018-05-25 09:29:34.499957
350	350	B0000DGWB4	\N	51.33	0.0	\N	2018-05-25 09:29:24.523067	2018-05-25 09:29:34.504062
351	351	B0000DDZ3N	\N	35.71	0.0	\N	2018-05-25 09:29:24.533925	2018-05-25 09:29:34.512662
352	352	B0000VAA8G	\N	92.44	0.0	\N	2018-05-25 09:29:24.542466	2018-05-25 09:29:34.518252
354	354	B000AA5SMU	\N	34.55	0.0	\N	2018-05-25 09:29:24.559622	2018-05-25 09:29:34.529708
355	355	B0000DHDW3	\N	81.26	0.0	\N	2018-05-25 09:29:24.569423	2018-05-25 09:29:34.540267
356	356	B000A2LQ2O	\N	46.07	0.0	\N	2018-05-25 09:29:24.578547	2018-05-25 09:29:34.548943
357	357	B0000AATPM	\N	24.2	0.0	\N	2018-05-25 09:29:24.589687	2018-05-25 09:29:34.553103
358	358	B000AR99QO	\N	25.85	0.0	\N	2018-05-25 09:29:24.602528	2018-05-25 09:29:34.568087
359	359	B000JSBHCS	\N	24.93	0.0	\N	2018-05-25 09:29:24.616875	2018-05-25 09:29:34.573345
360	360	B0000DGQ5D	\N	42.8	0.0	\N	2018-05-25 09:29:24.631726	2018-05-25 09:29:34.576105
361	361	B000HGNY7I	\N	76.69	0.0	\N	2018-05-25 09:29:24.64778	2018-05-25 09:29:34.587081
362	362	B000IXR5RK	\N	64.35	0.0	\N	2018-05-25 09:29:24.660932	2018-05-25 09:29:34.600774
363	363	B000BJ0LSQ	\N	73.02	0.0	\N	2018-05-25 09:29:24.673009	2018-05-25 09:29:34.60349
364	364	B000BHE134	\N	46.15	0.0	\N	2018-05-25 09:29:24.690338	2018-05-25 09:29:34.617756
365	365	B000HQGKRO	\N	62.93	0.0	\N	2018-05-25 09:29:24.705089	2018-05-25 09:29:34.623149
366	366	B000A4RJ8C	\N	6.04	0.0	\N	2018-05-25 09:29:24.720867	2018-05-25 09:29:34.63114
367	367	B000BIWQNA	\N	42.75	0.0	\N	2018-05-25 09:29:24.73589	2018-05-25 09:29:34.63578
368	368	B0000DFH0E	\N	1.68	0.0	\N	2018-05-25 09:29:24.750771	2018-05-25 09:29:34.639086
369	369	B000AR9H5C	\N	19.83	0.0	\N	2018-05-25 09:29:24.768947	2018-05-25 09:29:34.648525
370	370	B0000DDEMJ	\N	67.97	0.0	\N	2018-05-25 09:29:24.786319	2018-05-25 09:29:34.651943
371	371	B0002I6HKW	\N	78.23	0.0	\N	2018-05-25 09:29:24.796711	2018-05-25 09:29:34.664079
373	373	B000I6VQX6	\N	75.78	0.0	\N	2018-05-25 09:29:24.815384	2018-05-25 09:29:34.676545
374	374	B000IATJ5Y	\N	41.56	0.0	\N	2018-05-25 09:29:24.823503	2018-05-25 09:29:34.683372
375	375	B000BUYO60	\N	79.29	0.0	\N	2018-05-25 09:29:24.832968	2018-05-25 09:29:34.69325
376	376	B000HB2O2O	\N	38.93	0.0	\N	2018-05-25 09:29:24.842651	2018-05-25 09:29:34.700978
377	377	B000HQGKRO	\N	72.3	0.0	\N	2018-05-25 09:29:24.853697	2018-05-25 09:29:34.705893
378	378	B00067Q9HK	\N	13.67	0.0	\N	2018-05-25 09:29:24.864728	2018-05-25 09:29:34.716035
379	379	B0000VDPWE	\N	2.61	0.0	\N	2018-05-25 09:29:24.875734	2018-05-25 09:29:34.721607
380	380	B000BJ8TIA	\N	34.97	0.0	\N	2018-05-25 09:29:24.88511	2018-05-25 09:29:34.724738
381	381	B000AM78JO	\N	41.98	0.0	\N	2018-05-25 09:29:24.894473	2018-05-25 09:29:34.740979
382	382	B000A3J9AE	\N	71.65	0.0	\N	2018-05-25 09:29:24.9038	2018-05-25 09:29:34.75086
383	383	B0000DGI28	\N	85.28	0.0	\N	2018-05-25 09:29:24.914154	2018-05-25 09:29:34.763235
384	384	B00067EOF4	\N	19.65	0.0	\N	2018-05-25 09:29:24.925046	2018-05-25 09:29:34.76794
385	385	B0000DHBRP	\N	61.4	0.0	\N	2018-05-25 09:29:24.936659	2018-05-25 09:29:34.772509
386	386	B000BPIBPK	\N	73.98	0.0	\N	2018-05-25 09:29:24.947213	2018-05-25 09:29:34.779652
387	387	B000ALJYO2	\N	81.7	0.0	\N	2018-05-25 09:29:24.956419	2018-05-25 09:29:34.785156
388	388	B000A2RR04	\N	38.47	0.0	\N	2018-05-25 09:29:24.965765	2018-05-25 09:29:34.793616
389	389	B000A2MIJY	\N	86.25	0.0	\N	2018-05-25 09:29:24.974213	2018-05-25 09:29:34.799431
390	390	B000BJ8NJU	\N	74.45	0.0	\N	2018-05-25 09:29:24.983889	2018-05-25 09:29:34.80356
391	391	B000E5GB3Q	\N	36.7	0.0	\N	2018-05-25 09:29:24.993219	2018-05-25 09:29:34.812104
392	392	B000JKKCMW	\N	17.59	0.0	\N	2018-05-25 09:29:25.00181	2018-05-25 09:29:34.818161
393	393	B0001DJXAY	\N	51.63	0.0	\N	2018-05-25 09:29:25.009718	2018-05-25 09:29:34.834881
394	394	B000A6ULLW	\N	36.95	0.0	\N	2018-05-25 09:29:25.017432	2018-05-25 09:29:34.839398
396	396	B0000DGWB4	\N	89.14	0.0	\N	2018-05-25 09:29:25.033809	2018-05-25 09:29:34.856916
397	397	B000BJ0LSQ	\N	54.83	0.0	\N	2018-05-25 09:29:25.040878	2018-05-25 09:29:34.863683
398	398	B000BJ5JHE	\N	16.73	0.0	\N	2018-05-25 09:29:25.047478	2018-05-25 09:29:34.867983
399	399	B000N5HN3Y	\N	53.99	0.0	\N	2018-05-25 09:29:25.053989	2018-05-25 09:29:34.873457
400	400	B000I6VJ7O	\N	61.05	0.0	\N	2018-05-25 09:29:25.061044	2018-05-25 09:29:34.880703
401	401	B000GLXHGC	\N	86.29	0.0	\N	2018-05-25 09:29:25.068084	2018-05-25 09:29:34.888038
402	402	B000A6WENA	\N	11.65	0.0	\N	2018-05-25 09:29:25.074593	2018-05-25 09:29:34.895868
403	403	B000GT9P4C	\N	32.36	0.0	\N	2018-05-25 09:29:25.082023	2018-05-25 09:29:34.902944
404	404	B000AM3FKK	\N	94.24	0.0	\N	2018-05-25 09:29:25.088604	2018-05-25 09:29:34.909188
405	405	B000JLDYM6	\N	45.9	0.0	\N	2018-05-25 09:29:25.09506	2018-05-25 09:29:34.911566
406	406	B0000VQ4YA	\N	56.64	0.0	\N	2018-05-25 09:29:25.104096	2018-05-25 09:29:34.921262
407	407	B0000DKWG0	\N	24.89	0.0	\N	2018-05-25 09:29:25.114106	2018-05-25 09:29:34.927671
408	408	B000JQ0JNS	\N	45.82	0.0	\N	2018-05-25 09:29:25.126591	2018-05-25 09:29:34.940672
409	409	B000IXHC2S	\N	77.48	0.0	\N	2018-05-25 09:29:25.136255	2018-05-25 09:29:34.945412
410	410	B000GLXHGC	\N	74.2	0.0	\N	2018-05-25 09:29:25.144665	2018-05-25 09:29:34.952906
411	411	B000A2RR04	\N	62.63	0.0	\N	2018-05-25 09:29:25.15311	2018-05-25 09:29:34.955298
412	412	B000HGNY7I	\N	84.77	0.0	\N	2018-05-25 09:29:25.162184	2018-05-25 09:29:34.966927
413	413	B000BIWPKO	\N	22.91	0.0	\N	2018-05-25 09:29:25.170136	2018-05-25 09:29:34.971717
414	414	B000N5HN3Y	\N	12.37	0.0	\N	2018-05-25 09:29:25.178732	2018-05-25 09:29:34.97643
415	415	B0006OGUPY	\N	71.39	0.0	\N	2018-05-25 09:29:25.18865	2018-05-25 09:29:34.988639
416	416	B0000AJDKF	\N	9.11	0.0	\N	2018-05-25 09:29:25.197103	2018-05-25 09:29:34.992485
417	417	B000IBFL2S	\N	1.11	0.0	\N	2018-05-25 09:29:25.205827	2018-05-25 09:29:34.999217
419	419	B0000W47PC	\N	8.69	0.0	\N	2018-05-25 09:29:25.223769	2018-05-25 09:29:35.012954
420	420	B000PIGTK2	\N	87.31	0.0	\N	2018-05-25 09:29:25.232484	2018-05-25 09:29:35.016151
421	421	B0007WHCXY	\N	95.63	0.0	\N	2018-05-25 09:29:25.242043	2018-05-25 09:29:35.035144
422	422	B000BYDF4I	\N	88.0	0.0	\N	2018-05-25 09:29:25.25258	2018-05-25 09:29:35.042807
423	423	B0000DKWE1	\N	52.69	0.0	\N	2018-05-25 09:29:25.263048	2018-05-25 09:29:35.045704
424	424	B000BHP4DA	\N	62.08	0.0	\N	2018-05-25 09:29:25.27357	2018-05-25 09:29:35.048289
425	425	B0000DHDW3	\N	27.56	0.0	\N	2018-05-25 09:29:25.283766	2018-05-25 09:29:35.055707
426	426	B000GWH2DU	\N	71.37	0.0	\N	2018-05-25 09:29:25.292257	2018-05-25 09:29:35.058666
427	427	B000B7722Q	\N	45.79	0.0	\N	2018-05-25 09:29:25.300534	2018-05-25 09:29:35.06352
428	428	B000CSAK3M	\N	79.31	0.0	\N	2018-05-25 09:29:25.30886	2018-05-25 09:29:35.065868
429	429	B000JZZHEU	\N	30.47	0.0	\N	2018-05-25 09:29:25.316972	2018-05-25 09:29:35.072005
430	430	B000B5MVJM	\N	59.28	0.0	\N	2018-05-25 09:29:25.325552	2018-05-25 09:29:35.074369
431	431	B000A2TMH0	\N	56.03	0.0	\N	2018-05-25 09:29:25.333162	2018-05-25 09:29:35.080797
432	432	B0000DGH5J	\N	65.17	0.0	\N	2018-05-25 09:29:25.34131	2018-05-25 09:29:35.085764
433	433	B000I6VJ7O	\N	6.95	0.0	\N	2018-05-25 09:29:25.350593	2018-05-25 09:29:35.088177
434	434	B0009R9L7W	\N	14.82	0.0	\N	2018-05-25 09:29:25.358395	2018-05-25 09:29:35.094754
435	435	B000IATJ5Y	\N	25.88	0.0	\N	2018-05-25 09:29:25.365875	2018-05-25 09:29:35.097872
436	436	B0000YKHC2	\N	0.49	0.0	\N	2018-05-25 09:29:25.372671	2018-05-25 09:29:35.10816
437	437	B000662SOY	\N	63.01	0.0	\N	2018-05-25 09:29:25.379938	2018-05-25 09:29:35.114705
438	438	B000GTFRX0	\N	89.46	0.0	\N	2018-05-25 09:29:25.387249	2018-05-25 09:29:35.117299
439	439	B000Q75VCO	\N	7.41	0.0	\N	2018-05-25 09:29:25.395152	2018-05-25 09:29:35.126192
440	440	B000I6QSBG	\N	6.98	0.0	\N	2018-05-25 09:29:25.403337	2018-05-25 09:29:35.132292
442	442	B000AOMPAY	\N	74.52	0.0	\N	2018-05-25 09:29:25.42012	2018-05-25 09:29:35.143215
443	443	B000JR91YA	\N	19.44	0.0	\N	2018-05-25 09:29:25.428239	2018-05-25 09:29:35.145968
444	444	B000NG1GKO	\N	44.85	0.0	\N	2018-05-25 09:29:25.436566	2018-05-25 09:29:35.148905
445	445	B0000DGJD1	\N	31.32	0.0	\N	2018-05-25 09:29:25.445205	2018-05-25 09:29:35.155403
446	446	B000PIIXBA	\N	88.74	0.0	\N	2018-05-25 09:29:25.45286	2018-05-25 09:29:35.161957
447	447	B000MW7MJ8	\N	64.26	0.0	\N	2018-05-25 09:29:25.462944	2018-05-25 09:29:35.164595
448	448	B000A2RL4Q	\N	52.58	0.0	\N	2018-05-25 09:29:25.472591	2018-05-25 09:29:35.171322
449	449	B000A2LSJ0	\N	53.1	0.0	\N	2018-05-25 09:29:25.483335	2018-05-25 09:29:35.177974
450	450	B000A3PYLW	\N	2.28	0.0	\N	2018-05-25 09:29:25.493417	2018-05-25 09:29:35.182489
451	451	B0009RSVD2	\N	67.46	0.0	\N	2018-05-25 09:29:25.504023	2018-05-25 09:29:35.184842
452	452	B000A2SVXQ	\N	70.72	0.0	\N	2018-05-25 09:29:25.512653	2018-05-25 09:29:35.187046
453	453	B000A6LQZ2	\N	52.74	0.0	\N	2018-05-25 09:29:25.520892	2018-05-25 09:29:35.193439
454	454	B0000008XW	\N	50.99	0.0	\N	2018-05-25 09:29:25.529549	2018-05-25 09:29:35.199587
455	455	B0002XCH2E	\N	29.26	0.0	\N	2018-05-25 09:29:25.537667	2018-05-25 09:29:35.206808
456	456	B000A3LPTC	\N	68.64	0.0	\N	2018-05-25 09:29:25.545264	2018-05-25 09:29:35.209322
457	457	B0002X4OIY	\N	64.68	0.0	\N	2018-05-25 09:29:25.553954	2018-05-25 09:29:35.217419
458	458	B0000DHVM5	\N	98.23	0.0	\N	2018-05-25 09:29:25.562045	2018-05-25 09:29:35.221271
459	459	B000ARBM9G	\N	57.13	0.0	\N	2018-05-25 09:29:25.570588	2018-05-25 09:29:35.227811
461	461	B000A3LPTC	\N	99.4	0.0	\N	2018-05-25 09:29:25.588098	2018-05-25 09:29:35.236375
462	462	B000BFMIY0	\N	5.24	0.0	\N	2018-05-25 09:29:25.596521	2018-05-25 09:29:35.23922
463	463	B000BJ5JHE	\N	35.08	0.0	\N	2018-05-25 09:29:25.605551	2018-05-25 09:29:35.245233
464	464	B000G1CIH6	\N	28.21	0.0	\N	2018-05-25 09:29:25.61815	2018-05-25 09:29:35.248144
465	465	B0001FGAO4	\N	22.16	0.0	\N	2018-05-25 09:29:25.62941	2018-05-25 09:29:35.25037
466	466	B000HBXMHK	\N	0.49	0.0	\N	2018-05-25 09:29:25.637578	2018-05-25 09:29:35.255173
467	467	B000I6VJ7O	\N	48.87	0.0	\N	2018-05-25 09:29:25.646315	2018-05-25 09:29:35.261972
468	468	B00067PA2U	\N	27.11	0.0	\N	2018-05-25 09:29:25.65597	2018-05-25 09:29:35.264123
469	469	B000GTFRX0	\N	11.28	0.0	\N	2018-05-25 09:29:25.66397	2018-05-25 09:29:35.26694
470	470	B0002XUV3G	\N	84.77	0.0	\N	2018-05-25 09:29:25.671387	2018-05-25 09:29:35.273899
471	471	B000A3PYLW	\N	14.95	0.0	\N	2018-05-25 09:29:25.679305	2018-05-25 09:29:35.276872
472	472	B000BNLKWS	\N	76.02	0.0	\N	2018-05-25 09:29:25.68785	2018-05-25 09:29:35.283171
473	473	B000ITBS40	\N	50.62	0.0	\N	2018-05-25 09:29:25.69561	2018-05-25 09:29:35.292743
474	474	B0000DFH0E	\N	29.4	0.0	\N	2018-05-25 09:29:25.703675	2018-05-25 09:29:35.295752
475	475	B000JS9C70	\N	94.62	0.0	\N	2018-05-25 09:29:25.712255	2018-05-25 09:29:35.29984
476	476	B0000B0JG4	\N	3.86	0.0	\N	2018-05-25 09:29:25.721581	2018-05-25 09:29:35.307709
477	477	B0002F4AB8	\N	1.22	0.0	\N	2018-05-25 09:29:25.730634	2018-05-25 09:29:35.312195
478	478	B000AA5SMU	\N	50.2	0.0	\N	2018-05-25 09:29:25.738552	2018-05-25 09:29:35.316332
479	479	B000IT9ZLI	\N	30.74	0.0	\N	2018-05-25 09:29:25.746974	2018-05-25 09:29:35.322721
480	480	B000PIM89S	\N	72.93	0.0	\N	2018-05-25 09:29:25.754817	2018-05-25 09:29:35.326693
481	481	B000JFLI7U	\N	7.9	0.0	\N	2018-05-25 09:29:25.7642	2018-05-25 09:29:35.337921
482	482	B000BY634C	\N	27.89	0.0	\N	2018-05-25 09:29:25.771641	2018-05-25 09:29:35.346671
484	484	B000BMHOVU	\N	65.13	0.0	\N	2018-05-25 09:29:25.787225	2018-05-25 09:29:35.353889
485	485	B000BJ4UQ0	\N	94.25	0.0	\N	2018-05-25 09:29:25.795748	2018-05-25 09:29:35.361205
486	486	B000IT4T9Q	\N	18.05	0.0	\N	2018-05-25 09:29:25.804476	2018-05-25 09:29:35.365708
487	487	B000HBXMHK	\N	61.86	0.0	\N	2018-05-25 09:29:25.81226	2018-05-25 09:29:35.380614
488	488	B000GWIHF2	\N	60.81	0.0	\N	2018-05-25 09:29:25.819951	2018-05-25 09:29:35.385913
489	489	B000BJ20OE	\N	54.08	0.0	\N	2018-05-25 09:29:25.828056	2018-05-25 09:29:35.392613
490	490	B000HB2O2O	\N	75.08	0.0	\N	2018-05-25 09:29:25.836733	2018-05-25 09:29:35.403488
491	491	B000F8FY6M	\N	11.87	0.0	\N	2018-05-25 09:29:25.844987	2018-05-25 09:29:35.408863
492	492	B000PAOCOU	\N	12.56	0.0	\N	2018-05-25 09:29:25.852111	2018-05-25 09:29:35.412209
493	493	B0000DGUFP	\N	51.13	0.0	\N	2018-05-25 09:29:25.859066	2018-05-25 09:29:35.423881
494	494	B0000DHWAB	\N	95.34	0.0	\N	2018-05-25 09:29:25.865913	2018-05-25 09:29:35.428946
495	495	B00000AYGE	\N	9.33	0.0	\N	2018-05-25 09:29:25.873228	2018-05-25 09:29:35.433907
496	496	B0000VAA8G	\N	26.55	0.0	\N	2018-05-25 09:29:25.881033	2018-05-25 09:29:35.440135
497	497	B000ALJYO2	\N	98.66	0.0	\N	2018-05-25 09:29:25.889749	2018-05-25 09:29:35.444924
498	498	B000A2MF7E	\N	13.98	0.0	\N	2018-05-25 09:29:25.897834	2018-05-25 09:29:35.450178
499	499	B0000DHY2O	\N	16.81	0.0	\N	2018-05-25 09:29:25.905446	2018-05-25 09:29:35.460391
500	500	B0000W47PC	\N	49.59	0.0	\N	2018-05-25 09:29:25.915147	2018-05-25 09:29:35.462805
501	501	B0002EZWRK	\N	35.59	0.0	\N	2018-05-25 09:29:25.923164	2018-05-25 09:29:35.467838
502	502	B000A6Y9HY	\N	90.43	0.0	\N	2018-05-25 09:29:25.93228	2018-05-25 09:29:35.471945
503	503	B000A6ULLW	\N	3.72	0.0	\N	2018-05-25 09:29:25.941489	2018-05-25 09:29:35.473999
504	504	B0006PJMEE	\N	84.23	0.0	\N	2018-05-25 09:29:25.951619	2018-05-25 09:29:35.482005
505	505	B000J0NOTK	\N	52.58	0.0	\N	2018-05-25 09:29:25.960348	2018-05-25 09:29:35.485909
507	507	B000LCZCRS	\N	76.91	0.0	\N	2018-05-25 09:29:25.980565	2018-05-25 09:29:35.493625
508	508	B000ABFA7W	\N	10.86	0.0	\N	2018-05-25 09:29:25.99094	2018-05-25 09:29:35.495662
509	509	B000LCZCRS	\N	2.18	0.0	\N	2018-05-25 09:29:26.001073	2018-05-25 09:29:35.499244
510	510	B000JS9C7K	\N	63.23	0.0	\N	2018-05-25 09:29:26.01183	2018-05-25 09:29:35.501207
511	511	B000A3TB9I	\N	7.7	0.0	\N	2018-05-25 09:29:26.021471	2018-05-25 09:29:35.506588
512	512	B0000DGTOF	\N	83.64	0.0	\N	2018-05-25 09:29:26.030335	2018-05-25 09:29:35.50892
513	513	B000BJ6VNA	\N	14.61	0.0	\N	2018-05-25 09:29:26.03899	2018-05-25 09:29:35.510964
514	514	B000AM78JO	\N	88.8	0.0	\N	2018-05-25 09:29:26.04683	2018-05-25 09:29:35.516095
515	515	B0000DGITY	\N	45.92	0.0	\N	2018-05-25 09:29:26.054985	2018-05-25 09:29:35.518493
516	516	B000A70EAO	\N	94.47	0.0	\N	2018-05-25 09:29:26.063101	2018-05-25 09:29:35.520474
517	517	B000JS9C7K	\N	98.38	0.0	\N	2018-05-25 09:29:26.071001	2018-05-25 09:29:35.526035
518	518	B000HBXMHK	\N	77.75	0.0	\N	2018-05-25 09:29:26.077765	2018-05-25 09:29:35.531009
519	519	B0000DGXE8	\N	64.68	0.0	\N	2018-05-25 09:29:26.084498	2018-05-25 09:29:35.5382
520	520	B000000Z1F	\N	5.57	0.0	\N	2018-05-25 09:29:26.091465	2018-05-25 09:29:35.543656
521	521	B000GT9P4C	\N	48.16	0.0	\N	2018-05-25 09:29:26.100177	2018-05-25 09:29:35.545887
522	522	B000GWGMP4	\N	49.12	0.0	\N	2018-05-25 09:29:26.11153	2018-05-25 09:29:35.549454
523	523	B000A3PGTC	\N	63.38	0.0	\N	2018-05-25 09:29:26.120853	2018-05-25 09:29:35.557187
524	524	B000CR7COS	\N	41.12	0.0	\N	2018-05-25 09:29:26.133724	2018-05-25 09:29:35.561486
525	525	B000BPC71E	\N	80.8	0.0	\N	2018-05-25 09:29:26.14371	2018-05-25 09:29:35.565986
526	526	B00069TDVW	\N	96.89	0.0	\N	2018-05-25 09:29:26.153632	2018-05-25 09:29:35.56867
527	527	B000JMIRRC	\N	76.58	0.0	\N	2018-05-25 09:29:26.163701	2018-05-25 09:29:35.571496
528	528	B0000DKWL7	\N	79.12	0.0	\N	2018-05-25 09:29:26.172961	2018-05-25 09:29:35.57835
577	577	B0000DFH0E	\N	92.75	1.0	\N	2018-05-25 09:29:26.58629	2018-05-25 09:29:26.58629
578	578	B000ILRO82	\N	81.85	1.0	\N	2018-05-25 09:29:26.593836	2018-05-25 09:29:26.593836
579	579	B000BPX542	\N	47.65	1.0	\N	2018-05-25 09:29:26.602632	2018-05-25 09:29:26.602632
580	580	B00000AQ4N	\N	75.13	1.0	\N	2018-05-25 09:29:26.611818	2018-05-25 09:29:26.611818
581	581	B0001H5RIC	\N	62.5	1.0	\N	2018-05-25 09:29:26.61968	2018-05-25 09:29:26.61968
582	582	B000A6LSXW	\N	10.1	1.0	\N	2018-05-25 09:29:26.628838	2018-05-25 09:29:26.628838
583	583	B000A3PI3G	\N	58.18	1.0	\N	2018-05-25 09:29:26.636765	2018-05-25 09:29:26.636765
584	584	B0002F40AY	\N	90.07	1.0	\N	2018-05-25 09:29:26.645238	2018-05-25 09:29:26.645238
585	585	B000IBFL2S	\N	95.42	1.0	\N	2018-05-25 09:29:26.653079	2018-05-25 09:29:26.653079
586	586	B00095NYV8	\N	82.51	1.0	\N	2018-05-25 09:29:26.660801	2018-05-25 09:29:26.660801
587	587	B000A2O26G	\N	56.2	1.0	\N	2018-05-25 09:29:26.669173	2018-05-25 09:29:26.669173
588	588	B000A2MF7E	\N	73.99	1.0	\N	2018-05-25 09:29:26.677532	2018-05-25 09:29:26.677532
589	589	B0000AATPM	\N	0.47	1.0	\N	2018-05-25 09:29:26.685662	2018-05-25 09:29:26.685662
590	590	B0000DYZRA	\N	24.35	1.0	\N	2018-05-25 09:29:26.693654	2018-05-25 09:29:26.693654
591	591	B0002GM6DQ	\N	20.85	1.0	\N	2018-05-25 09:29:26.701747	2018-05-25 09:29:26.701747
592	592	B0000DYX4V	\N	6.5	1.0	\N	2018-05-25 09:29:26.710952	2018-05-25 09:29:26.710952
593	593	B000I6VJ7O	\N	87.26	1.0	\N	2018-05-25 09:29:26.721623	2018-05-25 09:29:26.721623
594	594	B000KP4VP0	\N	9.91	1.0	\N	2018-05-25 09:29:26.733486	2018-05-25 09:29:26.733486
595	595	B000BJ8TIA	\N	26.77	1.0	\N	2018-05-25 09:29:26.744192	2018-05-25 09:29:26.744192
596	596	B000A2SVXQ	\N	74.25	1.0	\N	2018-05-25 09:29:26.755585	2018-05-25 09:29:26.755585
597	597	B0000VG5MG	\N	53.89	1.0	\N	2018-05-25 09:29:26.766919	2018-05-25 09:29:26.766919
598	598	B000BTBGDK	\N	73.63	1.0	\N	2018-05-25 09:29:26.779015	2018-05-25 09:29:26.779015
599	599	B000FTBJGA	\N	13.12	1.0	\N	2018-05-25 09:29:26.789347	2018-05-25 09:29:26.789347
600	600	B000AF8T1C	\N	74.38	1.0	\N	2018-05-25 09:29:26.802328	2018-05-25 09:29:26.802328
601	601	B000675MDW	\N	66.01	1.0	\N	2018-05-25 09:29:26.814842	2018-05-25 09:29:26.814842
602	602	B000AA5SMU	\N	10.09	1.0	\N	2018-05-25 09:29:26.827689	2018-05-25 09:29:26.827689
603	603	B000Q6Y34W	\N	23.53	1.0	\N	2018-05-25 09:29:26.843097	2018-05-25 09:29:26.843097
604	604	B000ABFA7W	\N	34.16	1.0	\N	2018-05-25 09:29:26.859052	2018-05-25 09:29:26.859052
605	605	B000ALH1DI	\N	81.12	1.0	\N	2018-05-25 09:29:26.879102	2018-05-25 09:29:26.879102
606	606	B0000W4DP6	\N	54.03	1.0	\N	2018-05-25 09:29:26.896172	2018-05-25 09:29:26.896172
607	607	B000PGCLWY	\N	55.61	1.0	\N	2018-05-25 09:29:26.910728	2018-05-25 09:29:26.910728
608	608	B000JKMDTW	\N	85.4	1.0	\N	2018-05-25 09:29:26.925439	2018-05-25 09:29:26.925439
609	609	B000B7CDX4	\N	18.14	1.0	\N	2018-05-25 09:29:26.939454	2018-05-25 09:29:26.939454
610	610	B0001H5NK4	\N	38.13	1.0	\N	2018-05-25 09:29:26.958527	2018-05-25 09:29:26.958527
611	611	B000HB2O2O	\N	20.78	1.0	\N	2018-05-25 09:29:26.972902	2018-05-25 09:29:26.972902
612	612	B0000DKWL7	\N	26.93	1.0	\N	2018-05-25 09:29:26.984561	2018-05-25 09:29:26.984561
613	613	B000BMHOVU	\N	16.7	1.0	\N	2018-05-25 09:29:26.998335	2018-05-25 09:29:26.998335
614	614	B000BPC71E	\N	41.19	1.0	\N	2018-05-25 09:29:27.008651	2018-05-25 09:29:27.008651
615	615	B0002RFYGQ	\N	20.65	1.0	\N	2018-05-25 09:29:27.018496	2018-05-25 09:29:27.018496
616	616	B000GWGMP4	\N	7.84	1.0	\N	2018-05-25 09:29:27.028943	2018-05-25 09:29:27.028943
530	530	B000AR85S2	\N	85.1	0.0	\N	2018-05-25 09:29:26.195472	2018-05-25 09:29:35.58751
531	531	B000GWIHF2	\N	31.39	0.0	\N	2018-05-25 09:29:26.204444	2018-05-25 09:29:35.590496
532	532	B000A6LR6K	\N	42.68	0.0	\N	2018-05-25 09:29:26.212885	2018-05-25 09:29:35.595109
533	533	B000GPHRW8	\N	76.89	0.0	\N	2018-05-25 09:29:26.221372	2018-05-25 09:29:35.597805
534	534	B0002I6HKW	\N	71.54	0.0	\N	2018-05-25 09:29:26.231292	2018-05-25 09:29:35.600493
535	535	B000KEYQLA	\N	42.53	0.0	\N	2018-05-25 09:29:26.239229	2018-05-25 09:29:35.608938
536	536	B0000DFLFJ	\N	97.64	0.0	\N	2018-05-25 09:29:26.248349	2018-05-25 09:29:35.618126
537	537	B00067EOF4	\N	98.14	0.0	\N	2018-05-25 09:29:26.256688	2018-05-25 09:29:35.620704
538	538	B000675MDW	\N	2.73	0.0	\N	2018-05-25 09:29:26.264988	2018-05-25 09:29:35.623363
539	539	B0000DHUGW	\N	79.84	0.0	\N	2018-05-25 09:29:26.273006	2018-05-25 09:29:35.629338
540	540	B000AOMOVE	\N	68.4	0.0	\N	2018-05-25 09:29:26.281837	2018-05-25 09:29:35.635673
541	541	B0002GLP6K	\N	6.14	0.0	\N	2018-05-25 09:29:26.289753	2018-05-25 09:29:35.638211
542	542	B000I6VQX6	\N	21.41	0.0	\N	2018-05-25 09:29:26.297327	2018-05-25 09:29:35.647258
543	543	B000AQNDBM	\N	70.29	0.0	\N	2018-05-25 09:29:26.304962	2018-05-25 09:29:35.649885
544	544	B000Q7F1OW	\N	68.05	0.0	\N	2018-05-25 09:29:26.31296	2018-05-25 09:29:35.653739
545	545	B00025AGUM	\N	98.98	0.0	\N	2018-05-25 09:29:26.321265	2018-05-25 09:29:35.655971
546	546	B000BHLISA	\N	6.21	0.0	\N	2018-05-25 09:29:26.328543	2018-05-25 09:29:35.658511
547	547	B000Q313FC	\N	1.56	0.0	\N	2018-05-25 09:29:26.336805	2018-05-25 09:29:35.664113
549	549	B0006628FS	\N	43.51	0.0	\N	2018-05-25 09:29:26.352561	2018-05-25 09:29:35.668326
550	550	B000NKUUKW	\N	29.55	0.0	\N	2018-05-25 09:29:26.360647	2018-05-25 09:29:35.672098
551	551	B0000DHUGW	\N	91.42	0.0	\N	2018-05-25 09:29:26.369139	2018-05-25 09:29:35.674117
552	552	B000I4W7S6	\N	83.55	0.0	\N	2018-05-25 09:29:26.376854	2018-05-25 09:29:35.678226
553	553	B0002GL2BS	\N	14.55	0.0	\N	2018-05-25 09:29:26.384917	2018-05-25 09:29:35.683722
554	554	B000I6ONRM	\N	11.01	0.0	\N	2018-05-25 09:29:26.392441	2018-05-25 09:29:35.688186
555	555	B00067Q9HK	\N	68.5	0.0	\N	2018-05-25 09:29:26.399908	2018-05-25 09:29:35.690312
556	556	B0000DHVM5	\N	85.91	0.0	\N	2018-05-25 09:29:26.407905	2018-05-25 09:29:35.696139
557	557	B000OVNFDE	\N	84.46	0.0	\N	2018-05-25 09:29:26.415914	2018-05-25 09:29:35.701506
558	558	B000A2ROWK	\N	11.87	0.0	\N	2018-05-25 09:29:26.425545	2018-05-25 09:29:35.703696
559	559	B0000ACB9R	\N	65.69	0.0	\N	2018-05-25 09:29:26.433867	2018-05-25 09:29:35.707556
560	560	B0000DEVGP	\N	65.41	0.0	\N	2018-05-25 09:29:26.442017	2018-05-25 09:29:35.709822
561	561	B000ITBS40	\N	9.29	0.0	\N	2018-05-25 09:29:26.451611	2018-05-25 09:29:35.716111
562	562	B000IAPYWQ	\N	78.65	0.0	\N	2018-05-25 09:29:26.462644	2018-05-25 09:29:35.71881
563	563	B000I6XDVE	\N	10.37	0.0	\N	2018-05-25 09:29:26.470568	2018-05-25 09:29:35.72148
564	564	B0000VDPWE	\N	58.44	0.0	\N	2018-05-25 09:29:26.479192	2018-05-25 09:29:35.725963
565	565	B000ALJYO2	\N	41.02	0.0	\N	2018-05-25 09:29:26.486802	2018-05-25 09:29:35.732546
566	566	B000OVNFDE	\N	75.73	0.0	\N	2018-05-25 09:29:26.494674	2018-05-25 09:29:35.73907
567	567	B000I6RITM	\N	39.07	0.0	\N	2018-05-25 09:29:26.502361	2018-05-25 09:29:35.741873
568	568	B000I6VQX6	\N	66.71	0.0	\N	2018-05-25 09:29:26.510522	2018-05-25 09:29:35.744373
569	569	B000A0AQPO	\N	99.24	0.0	\N	2018-05-25 09:29:26.519656	2018-05-25 09:29:35.748468
570	570	B000BPX542	\N	90.83	0.0	\N	2018-05-25 09:29:26.52913	2018-05-25 09:29:35.750572
572	572	B000A3LC6I	\N	6.0	0.0	\N	2018-05-25 09:29:26.545732	2018-05-25 09:29:35.758001
573	573	B000JS9C7K	\N	53.58	0.0	\N	2018-05-25 09:29:26.55424	2018-05-25 09:29:35.760068
574	574	B0000DKWL7	\N	14.11	0.0	\N	2018-05-25 09:29:26.563517	2018-05-25 09:29:35.763737
575	575	B0000DHBRP	\N	98.7	0.0	\N	2018-05-25 09:29:26.571585	2018-05-25 09:29:35.76593
576	576	B000BPIBPK	\N	12.1	0.0	\N	2018-05-25 09:29:26.578543	2018-05-25 09:29:35.768089
617	617	B0001DJWXW	\N	29.18	1.0	\N	2018-05-25 09:29:27.040316	2018-05-25 09:29:27.040316
618	618	B000AR9G7G	\N	38.25	1.0	\N	2018-05-25 09:29:27.049189	2018-05-25 09:29:27.049189
619	619	B000A0AQPO	\N	28.01	1.0	\N	2018-05-25 09:29:27.057281	2018-05-25 09:29:27.057281
620	620	B000A2O3U6	\N	97.73	1.0	\N	2018-05-25 09:29:27.065726	2018-05-25 09:29:27.065726
621	621	B000J2NHC2	\N	23.36	1.0	\N	2018-05-25 09:29:27.073585	2018-05-25 09:29:27.073585
622	622	B000AF8T1C	\N	54.61	1.0	\N	2018-05-25 09:29:27.081868	2018-05-25 09:29:27.081868
623	623	B000Q75VCO	\N	86.77	1.0	\N	2018-05-25 09:29:27.090005	2018-05-25 09:29:27.090005
624	624	B0000AAGJF	\N	78.21	1.0	\N	2018-05-25 09:29:27.098662	2018-05-25 09:29:27.098662
625	625	B00019774M	\N	92.6	1.0	\N	2018-05-25 09:29:27.113758	2018-05-25 09:29:27.113758
626	626	B0000W463K	\N	36.97	1.0	\N	2018-05-25 09:29:27.128576	2018-05-25 09:29:27.128576
627	627	B000FTQ5A0	\N	74.92	1.0	\N	2018-05-25 09:29:27.138681	2018-05-25 09:29:27.138681
628	628	B000GFCRDC	\N	17.17	1.0	\N	2018-05-25 09:29:27.147836	2018-05-25 09:29:27.147836
629	629	B0002STO02	\N	2.8	1.0	\N	2018-05-25 09:29:27.156694	2018-05-25 09:29:27.156694
630	630	B000KBAL6W	\N	43.22	1.0	\N	2018-05-25 09:29:27.166385	2018-05-25 09:29:27.166385
631	631	B0000DIIQA	\N	66.05	1.0	\N	2018-05-25 09:29:27.175982	2018-05-25 09:29:27.175982
632	632	B0002F4AB8	\N	9.72	1.0	\N	2018-05-25 09:29:27.184666	2018-05-25 09:29:27.184666
633	633	B000O332KS	\N	59.92	1.0	\N	2018-05-25 09:29:27.194428	2018-05-25 09:29:27.194428
634	634	B000A3WUAK	\N	95.39	1.0	\N	2018-05-25 09:29:27.202467	2018-05-25 09:29:27.202467
635	635	B000BJ8NJU	\N	53.11	1.0	\N	2018-05-25 09:29:27.211965	2018-05-25 09:29:27.211965
636	636	B0000AAFWT	\N	11.56	1.0	\N	2018-05-25 09:29:27.219987	2018-05-25 09:29:27.219987
637	637	B000I6ONRM	\N	59.89	1.0	\N	2018-05-25 09:29:27.229058	2018-05-25 09:29:27.229058
638	638	B000P5YK8S	\N	68.06	1.0	\N	2018-05-25 09:29:27.237048	2018-05-25 09:29:27.237048
639	639	B000GPWOLW	\N	64.18	1.0	\N	2018-05-25 09:29:27.245782	2018-05-25 09:29:27.245782
640	640	B0006DRM02	\N	56.42	1.0	\N	2018-05-25 09:29:27.253878	2018-05-25 09:29:27.253878
641	641	B000HU7P92	\N	96.49	1.0	\N	2018-05-25 09:29:27.264874	2018-05-25 09:29:27.264874
642	642	B000A4YC14	\N	43.78	1.0	\N	2018-05-25 09:29:27.273566	2018-05-25 09:29:27.273566
643	643	B000CR7COI	\N	67.82	1.0	\N	2018-05-25 09:29:27.28417	2018-05-25 09:29:27.28417
644	644	B0009QMECC	\N	62.01	1.0	\N	2018-05-25 09:29:27.293165	2018-05-25 09:29:27.293165
645	645	B0000DKWL7	\N	79.71	1.0	\N	2018-05-25 09:29:27.301494	2018-05-25 09:29:27.301494
646	646	B000A0AQPO	\N	94.22	1.0	\N	2018-05-25 09:29:27.311003	2018-05-25 09:29:27.311003
647	647	B000I6VQX6	\N	56.75	1.0	\N	2018-05-25 09:29:27.319236	2018-05-25 09:29:27.319236
648	648	B00019774M	\N	78.7	1.0	\N	2018-05-25 09:29:27.328327	2018-05-25 09:29:27.328327
649	649	B000BYDF4I	\N	6.81	1.0	\N	2018-05-25 09:29:27.336982	2018-05-25 09:29:27.336982
650	650	B00067PA2U	\N	46.87	1.0	\N	2018-05-25 09:29:27.345815	2018-05-25 09:29:27.345815
651	651	B000AOMOVE	\N	13.24	1.0	\N	2018-05-25 09:29:27.35396	2018-05-25 09:29:27.35396
652	652	B000NQLULE	\N	67.6	1.0	\N	2018-05-25 09:29:27.363039	2018-05-25 09:29:27.363039
653	653	B000KU5ELA	\N	69.97	1.0	\N	2018-05-25 09:29:27.371422	2018-05-25 09:29:27.371422
654	654	B000BPIBPK	\N	38.99	1.0	\N	2018-05-25 09:29:27.380629	2018-05-25 09:29:27.380629
655	655	B000IXR5RK	\N	35.58	1.0	\N	2018-05-25 09:29:27.38843	2018-05-25 09:29:27.38843
656	656	B0000DFH0E	\N	55.86	1.0	\N	2018-05-25 09:29:27.39698	2018-05-25 09:29:27.39698
657	657	B000GPWOLW	\N	96.82	1.0	\N	2018-05-25 09:29:27.405697	2018-05-25 09:29:27.405697
658	658	B000HW20EA	\N	1.97	1.0	\N	2018-05-25 09:29:27.414163	2018-05-25 09:29:27.414163
659	659	B000FFAGDG	\N	71.42	1.0	\N	2018-05-25 09:29:27.421904	2018-05-25 09:29:27.421904
660	660	B000A2LWKU	\N	22.99	1.0	\N	2018-05-25 09:29:27.430199	2018-05-25 09:29:27.430199
661	661	B000COF89C	\N	50.99	1.0	\N	2018-05-25 09:29:27.437053	2018-05-25 09:29:27.437053
662	662	B000BPC71E	\N	25.06	1.0	\N	2018-05-25 09:29:27.445223	2018-05-25 09:29:27.445223
663	663	B000ALH1DI	\N	32.01	1.0	\N	2018-05-25 09:29:27.453252	2018-05-25 09:29:27.453252
664	664	B0000VDUVA	\N	28.58	1.0	\N	2018-05-25 09:29:27.462422	2018-05-25 09:29:27.462422
665	665	B000GT8JQC	\N	70.49	1.0	\N	2018-05-25 09:29:27.470469	2018-05-25 09:29:27.470469
666	666	B000A3WUAK	\N	95.33	1.0	\N	2018-05-25 09:29:27.479066	2018-05-25 09:29:27.479066
667	667	B0002EZWRK	\N	58.92	1.0	\N	2018-05-25 09:29:27.4873	2018-05-25 09:29:27.4873
668	668	B000662SOY	\N	59.83	1.0	\N	2018-05-25 09:29:27.495919	2018-05-25 09:29:27.495919
669	669	B000B7CC94	\N	24.33	1.0	\N	2018-05-25 09:29:27.503694	2018-05-25 09:29:27.503694
670	670	B000BPIBPK	\N	73.63	1.0	\N	2018-05-25 09:29:27.512733	2018-05-25 09:29:27.512733
671	671	B0002W2RBG	\N	53.02	1.0	\N	2018-05-25 09:29:27.521065	2018-05-25 09:29:27.521065
672	672	B0000DGQ5D	\N	70.73	1.0	\N	2018-05-25 09:29:27.529691	2018-05-25 09:29:27.529691
673	673	B00066OELO	\N	94.97	1.0	\N	2018-05-25 09:29:27.538665	2018-05-25 09:29:27.538665
674	674	B000KAAIA2	\N	0.96	1.0	\N	2018-05-25 09:29:27.547015	2018-05-25 09:29:27.547015
675	675	B0000DYXE0	\N	65.92	1.0	\N	2018-05-25 09:29:27.554798	2018-05-25 09:29:27.554798
676	676	B0000DGTOF	\N	84.0	1.0	\N	2018-05-25 09:29:27.56337	2018-05-25 09:29:27.56337
677	677	B000BFMIY0	\N	5.12	1.0	\N	2018-05-25 09:29:27.57126	2018-05-25 09:29:27.57126
678	678	B000FOOQK6	\N	83.86	1.0	\N	2018-05-25 09:29:27.580028	2018-05-25 09:29:27.580028
679	679	B000GFCVA6	\N	32.32	1.0	\N	2018-05-25 09:29:27.58948	2018-05-25 09:29:27.58948
680	680	B0009XOXXS	\N	73.7	1.0	\N	2018-05-25 09:29:27.597983	2018-05-25 09:29:27.597983
681	681	B0000DHDW3	\N	70.63	1.0	\N	2018-05-25 09:29:27.607852	2018-05-25 09:29:27.607852
682	682	B000I6S5NU	\N	57.36	1.0	\N	2018-05-25 09:29:27.615934	2018-05-25 09:29:27.615934
683	683	B000BX5BBY	\N	90.03	1.0	\N	2018-05-25 09:29:27.624253	2018-05-25 09:29:27.624253
684	684	B000K0WZ2G	\N	29.01	1.0	\N	2018-05-25 09:29:27.632469	2018-05-25 09:29:27.632469
685	685	B000J0NOTK	\N	47.97	1.0	\N	2018-05-25 09:29:27.640717	2018-05-25 09:29:27.640717
686	686	B000A2RL4Q	\N	3.86	1.0	\N	2018-05-25 09:29:27.648511	2018-05-25 09:29:27.648511
687	687	B00066USX2	\N	33.21	1.0	\N	2018-05-25 09:29:27.656491	2018-05-25 09:29:27.656491
688	688	B000A70EAO	\N	24.35	1.0	\N	2018-05-25 09:29:27.665238	2018-05-25 09:29:27.665238
689	689	B000CR7COI	\N	1.32	1.0	\N	2018-05-25 09:29:27.673632	2018-05-25 09:29:27.673632
690	690	B0001DJXAY	\N	5.56	1.0	\N	2018-05-25 09:29:27.682296	2018-05-25 09:29:27.682296
691	691	B0007WHCXY	\N	8.07	1.0	\N	2018-05-25 09:29:27.690718	2018-05-25 09:29:27.690718
692	692	B000HU7P92	\N	68.43	1.0	\N	2018-05-25 09:29:27.702553	2018-05-25 09:29:27.702553
693	693	B000J3401I	\N	38.59	1.0	\N	2018-05-25 09:29:27.712938	2018-05-25 09:29:27.712938
694	694	B00005R12M	\N	64.95	1.0	\N	2018-05-25 09:29:27.721459	2018-05-25 09:29:27.721459
695	695	B0002XCH2E	\N	98.49	1.0	\N	2018-05-25 09:29:27.730084	2018-05-25 09:29:27.730084
696	696	B000A6Y9HY	\N	30.67	1.0	\N	2018-05-25 09:29:27.738574	2018-05-25 09:29:27.738574
697	697	B0009PC1XA	\N	35.79	1.0	\N	2018-05-25 09:29:27.748163	2018-05-25 09:29:27.748163
698	698	B000A3PGTC	\N	57.88	1.0	\N	2018-05-25 09:29:27.756331	2018-05-25 09:29:27.756331
699	699	B0000W47PC	\N	3.57	1.0	\N	2018-05-25 09:29:27.76804	2018-05-25 09:29:27.76804
700	700	B00067PKPM	\N	82.68	1.0	\N	2018-05-25 09:29:27.778613	2018-05-25 09:29:27.778613
701	701	B000A2SXYS	\N	87.8	1.0	\N	2018-05-25 09:29:27.787096	2018-05-25 09:29:27.787096
702	702	B000IATH6K	\N	51.17	1.0	\N	2018-05-25 09:29:27.798942	2018-05-25 09:29:27.798942
703	703	B000BPIBPK	\N	25.32	1.0	\N	2018-05-25 09:29:27.812299	2018-05-25 09:29:27.812299
704	704	B000AOMPAY	\N	1.6	1.0	\N	2018-05-25 09:29:27.823181	2018-05-25 09:29:27.823181
705	705	B000A3PVZ6	\N	30.22	1.0	\N	2018-05-25 09:29:27.838799	2018-05-25 09:29:27.838799
706	706	B000A70EOU	\N	58.97	1.0	\N	2018-05-25 09:29:27.850639	2018-05-25 09:29:27.850639
707	707	B000CR7CP2	\N	21.09	1.0	\N	2018-05-25 09:29:27.860204	2018-05-25 09:29:27.860204
708	708	B000A2LSJ0	\N	61.69	1.0	\N	2018-05-25 09:29:27.869926	2018-05-25 09:29:27.869926
709	709	B000BKCYUS	\N	96.92	1.0	\N	2018-05-25 09:29:27.87988	2018-05-25 09:29:27.87988
710	710	B000IT4T96	\N	7.21	1.0	\N	2018-05-25 09:29:27.889438	2018-05-25 09:29:27.889438
711	711	B0000DE0T8	\N	21.5	1.0	\N	2018-05-25 09:29:27.899598	2018-05-25 09:29:27.899598
712	712	B000KEYQLA	\N	72.12	1.0	\N	2018-05-25 09:29:27.90978	2018-05-25 09:29:27.90978
713	713	B000J3401I	\N	28.69	1.0	\N	2018-05-25 09:29:27.91973	2018-05-25 09:29:27.91973
714	714	B00000AQ4N	\N	0.92	1.0	\N	2018-05-25 09:29:27.929422	2018-05-25 09:29:27.929422
715	715	B0009ICOZ2	\N	2.76	1.0	\N	2018-05-25 09:29:27.939072	2018-05-25 09:29:27.939072
716	716	B000A3J9AE	\N	37.35	1.0	\N	2018-05-25 09:29:27.95004	2018-05-25 09:29:27.95004
717	717	B0009R9L7W	\N	14.79	1.0	\N	2018-05-25 09:29:27.959467	2018-05-25 09:29:27.959467
718	718	B0007WHCXY	\N	30.96	1.0	\N	2018-05-25 09:29:27.967289	2018-05-25 09:29:27.967289
719	719	B0000DIIQA	\N	47.29	1.0	\N	2018-05-25 09:29:27.97491	2018-05-25 09:29:27.97491
720	720	B00012FB6K	\N	9.5	1.0	\N	2018-05-25 09:29:27.98353	2018-05-25 09:29:27.98353
721	721	B000NKSOOQ	\N	9.39	1.0	\N	2018-05-25 09:29:27.993567	2018-05-25 09:29:27.993567
722	722	B000A143NO	\N	13.1	1.0	\N	2018-05-25 09:29:28.004236	2018-05-25 09:29:28.004236
723	723	B00019774M	\N	71.83	1.0	\N	2018-05-25 09:29:28.014347	2018-05-25 09:29:28.014347
724	724	B000A2SXYS	\N	16.63	1.0	\N	2018-05-25 09:29:28.023941	2018-05-25 09:29:28.023941
725	725	B000I6RUQ8	\N	79.64	1.0	\N	2018-05-25 09:29:28.031758	2018-05-25 09:29:28.031758
726	726	B000BSH8AQ	\N	72.48	1.0	\N	2018-05-25 09:29:28.040065	2018-05-25 09:29:28.040065
727	727	B0002SUQUY	\N	1.7	1.0	\N	2018-05-25 09:29:28.04818	2018-05-25 09:29:28.04818
728	728	B00066USKU	\N	9.35	1.0	\N	2018-05-25 09:29:28.056438	2018-05-25 09:29:28.056438
729	729	B0000W4I2O	\N	85.65	1.0	\N	2018-05-25 09:29:28.065212	2018-05-25 09:29:28.065212
730	730	B000A6ULLW	\N	75.9	1.0	\N	2018-05-25 09:29:28.072988	2018-05-25 09:29:28.072988
731	731	B000FQ9CTY	\N	97.41	1.0	\N	2018-05-25 09:29:28.081244	2018-05-25 09:29:28.081244
732	732	B0000W4DP6	\N	48.36	1.0	\N	2018-05-25 09:29:28.090435	2018-05-25 09:29:28.090435
733	733	B000A3LPTC	\N	45.26	1.0	\N	2018-05-25 09:29:28.098467	2018-05-25 09:29:28.098467
734	734	B000A3WUAK	\N	83.83	1.0	\N	2018-05-25 09:29:28.108488	2018-05-25 09:29:28.108488
735	735	B000AOMPAY	\N	12.91	1.0	\N	2018-05-25 09:29:28.11659	2018-05-25 09:29:28.11659
736	736	B000NKSOOQ	\N	92.6	1.0	\N	2018-05-25 09:29:28.126296	2018-05-25 09:29:28.126296
737	737	B0000DGJD1	\N	55.12	1.0	\N	2018-05-25 09:29:28.135386	2018-05-25 09:29:28.135386
738	738	B000BUYO60	\N	49.98	1.0	\N	2018-05-25 09:29:28.144625	2018-05-25 09:29:28.144625
739	739	B000HQGKRO	\N	45.15	1.0	\N	2018-05-25 09:29:28.152104	2018-05-25 09:29:28.152104
740	740	B000662SOY	\N	99.66	1.0	\N	2018-05-25 09:29:28.160501	2018-05-25 09:29:28.160501
741	741	B000OVNFDE	\N	49.69	1.0	\N	2018-05-25 09:29:28.168649	2018-05-25 09:29:28.168649
742	742	B000GFCRDC	\N	90.08	1.0	\N	2018-05-25 09:29:28.176718	2018-05-25 09:29:28.176718
743	743	B000HKQS6I	\N	58.79	1.0	\N	2018-05-25 09:29:28.185067	2018-05-25 09:29:28.185067
744	744	B000A2MJY8	\N	71.33	1.0	\N	2018-05-25 09:29:28.19266	2018-05-25 09:29:28.19266
745	745	B000PWBC6Y	\N	8.15	1.0	\N	2018-05-25 09:29:28.201661	2018-05-25 09:29:28.201661
746	746	B00095NYV8	\N	15.0	1.0	\N	2018-05-25 09:29:28.210391	2018-05-25 09:29:28.210391
747	747	B000A6NVNM	\N	71.96	1.0	\N	2018-05-25 09:29:28.219466	2018-05-25 09:29:28.219466
748	748	B00025C3HG	\N	90.24	1.0	\N	2018-05-25 09:29:28.228055	2018-05-25 09:29:28.228055
749	749	B00066USKU	\N	34.36	1.0	\N	2018-05-25 09:29:28.236159	2018-05-25 09:29:28.236159
750	750	B000NKOHPG	\N	65.62	1.0	\N	2018-05-25 09:29:28.244227	2018-05-25 09:29:28.244227
751	751	B000BJ4VFA	\N	22.14	1.0	\N	2018-05-25 09:29:28.252226	2018-05-25 09:29:28.252226
752	752	B0009IT5P4	\N	73.24	1.0	\N	2018-05-25 09:29:28.259708	2018-05-25 09:29:28.259708
753	753	B0002SVARW	\N	14.01	1.0	\N	2018-05-25 09:29:28.268013	2018-05-25 09:29:28.268013
754	754	B000I6TI2C	\N	26.31	1.0	\N	2018-05-25 09:29:28.275673	2018-05-25 09:29:28.275673
755	755	B000J1E1RS	\N	66.11	1.0	\N	2018-05-25 09:29:28.283308	2018-05-25 09:29:28.283308
756	756	B000II6WOW	\N	2.3	1.0	\N	2018-05-25 09:29:28.291482	2018-05-25 09:29:28.291482
757	757	B000A3PI3G	\N	45.81	1.0	\N	2018-05-25 09:29:28.299394	2018-05-25 09:29:28.299394
758	758	B000CFIMWQ	\N	22.49	1.0	\N	2018-05-25 09:29:28.306707	2018-05-25 09:29:28.306707
759	759	B0009IT5P4	\N	25.91	1.0	\N	2018-05-25 09:29:28.313275	2018-05-25 09:29:28.313275
760	760	B00000AQ4N	\N	58.03	1.0	\N	2018-05-25 09:29:28.321077	2018-05-25 09:29:28.321077
761	761	B000K99WQE	\N	92.34	1.0	\N	2018-05-25 09:29:28.330215	2018-05-25 09:29:28.330215
762	762	B000CDC7O2	\N	46.15	1.0	\N	2018-05-25 09:29:28.340232	2018-05-25 09:29:28.340232
763	763	B0000W463K	\N	33.96	1.0	\N	2018-05-25 09:29:28.34826	2018-05-25 09:29:28.34826
764	764	B0000DHUGW	\N	80.71	1.0	\N	2018-05-25 09:29:28.356297	2018-05-25 09:29:28.356297
765	765	B000AXVVY6	\N	82.33	1.0	\N	2018-05-25 09:29:28.364538	2018-05-25 09:29:28.364538
766	766	B000HC0P2E	\N	48.87	1.0	\N	2018-05-25 09:29:28.372451	2018-05-25 09:29:28.372451
767	767	B000AR9H5C	\N	92.49	1.0	\N	2018-05-25 09:29:28.380154	2018-05-25 09:29:28.380154
768	768	B000A70EAO	\N	68.79	1.0	\N	2018-05-25 09:29:28.388805	2018-05-25 09:29:28.388805
769	769	B000A6Y9HY	\N	68.95	1.0	\N	2018-05-25 09:29:28.39773	2018-05-25 09:29:28.39773
770	770	B000BIWQNA	\N	60.56	1.0	\N	2018-05-25 09:29:28.40522	2018-05-25 09:29:28.40522
771	771	B000AMNV8G	\N	94.6	1.0	\N	2018-05-25 09:29:28.41301	2018-05-25 09:29:28.41301
772	772	B000J2NMGS	\N	13.9	1.0	\N	2018-05-25 09:29:28.419944	2018-05-25 09:29:28.419944
773	773	B000GPHRW8	\N	54.38	1.0	\N	2018-05-25 09:29:28.42699	2018-05-25 09:29:28.42699
774	774	B000A1FW8E	\N	39.24	1.0	\N	2018-05-25 09:29:28.433903	2018-05-25 09:29:28.433903
775	775	B0000VF9C8	\N	12.85	1.0	\N	2018-05-25 09:29:28.441802	2018-05-25 09:29:28.441802
776	776	B000BHP4DA	\N	1.54	1.0	\N	2018-05-25 09:29:28.450056	2018-05-25 09:29:28.450056
777	777	B000A70B7K	\N	83.67	1.0	\N	2018-05-25 09:29:28.458707	2018-05-25 09:29:28.458707
778	778	B000ILNR10	\N	99.21	1.0	\N	2018-05-25 09:29:28.467096	2018-05-25 09:29:28.467096
779	779	B000GQ2P7O	\N	6.3	1.0	\N	2018-05-25 09:29:28.475468	2018-05-25 09:29:28.475468
780	780	B0002XUV3G	\N	12.86	1.0	\N	2018-05-25 09:29:28.483145	2018-05-25 09:29:28.483145
781	781	B000A2SVXQ	\N	6.49	1.0	\N	2018-05-25 09:29:28.490893	2018-05-25 09:29:28.490893
782	782	B000HVZOOO	\N	61.87	1.0	\N	2018-05-25 09:29:28.498483	2018-05-25 09:29:28.498483
783	783	B000BJ20Y4	\N	85.24	1.0	\N	2018-05-25 09:29:28.506275	2018-05-25 09:29:28.506275
784	784	B000NQLUNC	\N	8.88	1.0	\N	2018-05-25 09:29:28.514469	2018-05-25 09:29:28.514469
785	785	B000Q313FC	\N	32.55	1.0	\N	2018-05-25 09:29:28.524301	2018-05-25 09:29:28.524301
786	786	B0000DKWG0	\N	83.65	1.0	\N	2018-05-25 09:29:28.53324	2018-05-25 09:29:28.53324
787	787	B000JS9C70	\N	28.1	1.0	\N	2018-05-25 09:29:28.541467	2018-05-25 09:29:28.541467
788	788	B000GWGQ5K	\N	33.66	1.0	\N	2018-05-25 09:29:28.549406	2018-05-25 09:29:28.549406
789	789	B000AMNV8G	\N	14.31	1.0	\N	2018-05-25 09:29:28.55731	2018-05-25 09:29:28.55731
790	790	B000QA7ZFC	\N	66.17	1.0	\N	2018-05-25 09:29:28.56527	2018-05-25 09:29:28.56527
791	791	B000IT4T9Q	\N	14.48	1.0	\N	2018-05-25 09:29:28.57341	2018-05-25 09:29:28.57341
792	792	B0002SUQUY	\N	84.09	1.0	\N	2018-05-25 09:29:28.581691	2018-05-25 09:29:28.581691
793	793	B000IATJ5Y	\N	72.17	1.0	\N	2018-05-25 09:29:28.590472	2018-05-25 09:29:28.590472
794	794	B0002F4AB8	\N	99.95	1.0	\N	2018-05-25 09:29:28.59859	2018-05-25 09:29:28.59859
795	795	B000A2T37E	\N	14.43	1.0	\N	2018-05-25 09:29:28.607275	2018-05-25 09:29:28.607275
796	796	B0009XOXXS	\N	25.6	1.0	\N	2018-05-25 09:29:28.614801	2018-05-25 09:29:28.614801
797	797	B0000DKWG0	\N	97.96	1.0	\N	2018-05-25 09:29:28.623587	2018-05-25 09:29:28.623587
798	798	B000PAOCOU	\N	0.0	1.0	\N	2018-05-25 09:29:28.630879	2018-05-25 09:29:28.630879
799	799	B000HW1EGK	\N	28.49	1.0	\N	2018-05-25 09:29:28.639322	2018-05-25 09:29:28.639322
800	800	B000J2NHC2	\N	74.2	1.0	\N	2018-05-25 09:29:28.648638	2018-05-25 09:29:28.648638
801	801	B000A2O26G	\N	25.68	1.0	\N	2018-05-25 09:29:28.659312	2018-05-25 09:29:28.659312
802	802	B000A2SXYS	\N	91.9	1.0	\N	2018-05-25 09:29:28.669316	2018-05-25 09:29:28.669316
803	803	B000AM3FKK	\N	28.0	1.0	\N	2018-05-25 09:29:28.679816	2018-05-25 09:29:28.679816
804	804	B0007WHCXE	\N	90.81	1.0	\N	2018-05-25 09:29:28.687945	2018-05-25 09:29:28.687945
805	805	B0000DGQ5D	\N	26.96	1.0	\N	2018-05-25 09:29:28.696573	2018-05-25 09:29:28.696573
806	806	B0000DGWB4	\N	4.56	1.0	\N	2018-05-25 09:29:28.705267	2018-05-25 09:29:28.705267
807	807	B000B7722Q	\N	42.43	1.0	\N	2018-05-25 09:29:28.713544	2018-05-25 09:29:28.713544
808	808	B000ILRO82	\N	82.85	1.0	\N	2018-05-25 09:29:28.72145	2018-05-25 09:29:28.72145
809	809	B000NI7RW8	\N	49.26	1.0	\N	2018-05-25 09:29:28.729779	2018-05-25 09:29:28.729779
810	810	B000HW5FFG	\N	85.48	1.0	\N	2018-05-25 09:29:28.738159	2018-05-25 09:29:28.738159
811	811	B000BJ4UQ0	\N	1.34	1.0	\N	2018-05-25 09:29:28.746346	2018-05-25 09:29:28.746346
812	812	B000A2LNPO	\N	26.97	1.0	\N	2018-05-25 09:29:28.753836	2018-05-25 09:29:28.753836
813	813	B000AR9FZE	\N	46.41	1.0	\N	2018-05-25 09:29:28.762329	2018-05-25 09:29:28.762329
814	814	B000J2NHC2	\N	12.31	1.0	\N	2018-05-25 09:29:28.771472	2018-05-25 09:29:28.771472
815	815	B000Q75VCO	\N	94.15	1.0	\N	2018-05-25 09:29:28.781823	2018-05-25 09:29:28.781823
816	816	B000GFCVA6	\N	92.09	1.0	\N	2018-05-25 09:29:28.791998	2018-05-25 09:29:28.791998
817	817	B00066USKU	\N	81.56	1.0	\N	2018-05-25 09:29:28.802092	2018-05-25 09:29:28.802092
818	818	B000JKMDTW	\N	58.85	1.0	\N	2018-05-25 09:29:28.810296	2018-05-25 09:29:28.810296
819	819	B0007WHCXY	\N	2.7	1.0	\N	2018-05-25 09:29:28.818226	2018-05-25 09:29:28.818226
820	820	B0000W463K	\N	48.87	1.0	\N	2018-05-25 09:29:28.825794	2018-05-25 09:29:28.825794
821	821	B0001DJWXW	\N	13.79	1.0	\N	2018-05-25 09:29:28.833395	2018-05-25 09:29:28.833395
822	822	B000A4YC14	\N	22.7	1.0	\N	2018-05-25 09:29:28.8411	2018-05-25 09:29:28.8411
823	823	B0002IQM52	\N	88.35	1.0	\N	2018-05-25 09:29:28.849225	2018-05-25 09:29:28.849225
824	824	B0000DGFW7	\N	15.7	1.0	\N	2018-05-25 09:29:28.857311	2018-05-25 09:29:28.857311
825	825	B000P5YK8S	\N	5.21	1.0	\N	2018-05-25 09:29:28.865755	2018-05-25 09:29:28.865755
826	826	B0000DIIQA	\N	64.85	1.0	\N	2018-05-25 09:29:28.874323	2018-05-25 09:29:28.874323
827	827	B00019774M	\N	9.66	1.0	\N	2018-05-25 09:29:28.882221	2018-05-25 09:29:28.882221
828	828	B000B5MVJM	\N	5.24	1.0	\N	2018-05-25 09:29:28.890549	2018-05-25 09:29:28.890549
829	829	B0009IOFWC	\N	93.64	1.0	\N	2018-05-25 09:29:28.898519	2018-05-25 09:29:28.898519
830	830	B000GQ2P7O	\N	18.19	1.0	\N	2018-05-25 09:29:28.906359	2018-05-25 09:29:28.906359
831	831	B0000DGXE8	\N	12.26	1.0	\N	2018-05-25 09:29:28.914712	2018-05-25 09:29:28.914712
832	832	B0002SZELK	\N	0.4	1.0	\N	2018-05-25 09:29:28.923003	2018-05-25 09:29:28.923003
833	833	B000A2NCLW	\N	71.38	1.0	\N	2018-05-25 09:29:28.932047	2018-05-25 09:29:28.932047
834	834	B000GWKIMC	\N	23.34	1.0	\N	2018-05-25 09:29:28.940325	2018-05-25 09:29:28.940325
835	835	B0000DHWDX	\N	82.3	1.0	\N	2018-05-25 09:29:28.948307	2018-05-25 09:29:28.948307
836	836	B000B7722Q	\N	68.38	1.0	\N	2018-05-25 09:29:28.956408	2018-05-25 09:29:28.956408
837	837	B000AMNV8G	\N	5.31	1.0	\N	2018-05-25 09:29:28.964976	2018-05-25 09:29:28.964976
838	838	B000NQLUNC	\N	33.38	1.0	\N	2018-05-25 09:29:28.973277	2018-05-25 09:29:28.973277
839	839	B0000DYX4V	\N	8.45	1.0	\N	2018-05-25 09:29:28.981371	2018-05-25 09:29:28.981371
840	840	B0000DHWAB	\N	90.4	1.0	\N	2018-05-25 09:29:28.988911	2018-05-25 09:29:28.988911
841	841	B000HQGKRO	\N	77.86	1.0	\N	2018-05-25 09:29:28.997706	2018-05-25 09:29:28.997706
842	842	B000ILNR10	\N	73.63	1.0	\N	2018-05-25 09:29:29.007723	2018-05-25 09:29:29.007723
843	843	B000JZZHEU	\N	97.48	1.0	\N	2018-05-25 09:29:29.016513	2018-05-25 09:29:29.016513
844	844	B000Q6Y34W	\N	64.36	1.0	\N	2018-05-25 09:29:29.025791	2018-05-25 09:29:29.025791
845	845	B0000DGUFP	\N	47.45	1.0	\N	2018-05-25 09:29:29.033152	2018-05-25 09:29:29.033152
846	846	B000NKSOOQ	\N	55.77	1.0	\N	2018-05-25 09:29:29.040623	2018-05-25 09:29:29.040623
847	847	B000A2MIJY	\N	22.23	1.0	\N	2018-05-25 09:29:29.047979	2018-05-25 09:29:29.047979
848	848	B0007657T6	\N	50.0	1.0	\N	2018-05-25 09:29:29.055756	2018-05-25 09:29:29.055756
849	849	B000KEYQLA	\N	11.09	1.0	\N	2018-05-25 09:29:29.064558	2018-05-25 09:29:29.064558
850	850	B0009R9L7W	\N	29.56	1.0	\N	2018-05-25 09:29:29.073018	2018-05-25 09:29:29.073018
851	851	B000F8MENI	\N	98.88	1.0	\N	2018-05-25 09:29:29.081317	2018-05-25 09:29:29.081317
852	852	B0009QHJSG	\N	21.56	1.0	\N	2018-05-25 09:29:29.089052	2018-05-25 09:29:29.089052
853	853	B000Q71WNG	\N	29.85	1.0	\N	2018-05-25 09:29:29.097005	2018-05-25 09:29:29.097005
854	854	B0000DFDWF	\N	33.63	1.0	\N	2018-05-25 09:29:29.106937	2018-05-25 09:29:29.106937
855	855	B000G1CIH6	\N	16.42	1.0	\N	2018-05-25 09:29:29.114912	2018-05-25 09:29:29.114912
856	856	B000662ADI	\N	43.55	1.0	\N	2018-05-25 09:29:29.123256	2018-05-25 09:29:29.123256
857	857	B000A2MHMW	\N	80.02	1.0	\N	2018-05-25 09:29:29.132095	2018-05-25 09:29:29.132095
858	858	B000N5HN3Y	\N	58.3	1.0	\N	2018-05-25 09:29:29.140644	2018-05-25 09:29:29.140644
859	859	B000A0AQPO	\N	59.74	1.0	\N	2018-05-25 09:29:29.149442	2018-05-25 09:29:29.149442
860	860	B0000AAGJF	\N	28.17	1.0	\N	2018-05-25 09:29:29.158031	2018-05-25 09:29:29.158031
861	861	B000IT4T9Q	\N	88.03	1.0	\N	2018-05-25 09:29:29.166112	2018-05-25 09:29:29.166112
862	862	B000P5XI6S	\N	94.09	1.0	\N	2018-05-25 09:29:29.174642	2018-05-25 09:29:29.174642
863	863	B000A2MI80	\N	38.15	1.0	\N	2018-05-25 09:29:29.182264	2018-05-25 09:29:29.182264
864	864	B000A3JNTG	\N	65.42	1.0	\N	2018-05-25 09:29:29.190436	2018-05-25 09:29:29.190436
865	865	B000BJ4UQ0	\N	3.59	1.0	\N	2018-05-25 09:29:29.199614	2018-05-25 09:29:29.199614
866	866	B0001FGAO4	\N	13.94	1.0	\N	2018-05-25 09:29:29.207287	2018-05-25 09:29:29.207287
867	867	B0001FGAO4	\N	74.22	1.0	\N	2018-05-25 09:29:29.215086	2018-05-25 09:29:29.215086
868	868	B000BJ8LGU	\N	2.6	1.0	\N	2018-05-25 09:29:29.223377	2018-05-25 09:29:29.223377
869	869	B0000VAA8G	\N	23.79	1.0	\N	2018-05-25 09:29:29.231401	2018-05-25 09:29:29.231401
870	870	B0000DFDWF	\N	56.8	1.0	\N	2018-05-25 09:29:29.239434	2018-05-25 09:29:29.239434
871	871	B0000DGV0O	\N	48.98	1.0	\N	2018-05-25 09:29:29.247476	2018-05-25 09:29:29.247476
872	872	B000CDC7O2	\N	99.61	1.0	\N	2018-05-25 09:29:29.254898	2018-05-25 09:29:29.254898
873	873	B000F8FY6M	\N	80.42	1.0	\N	2018-05-25 09:29:29.263456	2018-05-25 09:29:29.263456
874	874	B000IT4T9Q	\N	74.29	1.0	\N	2018-05-25 09:29:29.271429	2018-05-25 09:29:29.271429
875	875	B000A2NCLW	\N	2.15	1.0	\N	2018-05-25 09:29:29.279278	2018-05-25 09:29:29.279278
876	876	B000IT4T96	\N	0.09	1.0	\N	2018-05-25 09:29:29.287148	2018-05-25 09:29:29.287148
877	877	B0002XTOHK	\N	34.01	1.0	\N	2018-05-25 09:29:29.295268	2018-05-25 09:29:29.295268
878	878	B0000W47PC	\N	69.21	1.0	\N	2018-05-25 09:29:29.303381	2018-05-25 09:29:29.303381
879	879	B0002GL2BS	\N	92.32	1.0	\N	2018-05-25 09:29:29.311123	2018-05-25 09:29:29.311123
880	880	B000675MDW	\N	92.42	1.0	\N	2018-05-25 09:29:29.320332	2018-05-25 09:29:29.320332
881	881	B00066OELO	\N	92.9	1.0	\N	2018-05-25 09:29:29.329793	2018-05-25 09:29:29.329793
882	882	B000II6WOW	\N	2.49	1.0	\N	2018-05-25 09:29:29.337757	2018-05-25 09:29:29.337757
883	883	B0000ACB9R	\N	29.31	1.0	\N	2018-05-25 09:29:29.346602	2018-05-25 09:29:29.346602
884	884	B000JTR9CE	\N	86.59	1.0	\N	2018-05-25 09:29:29.355581	2018-05-25 09:29:29.355581
885	885	B000675MDW	\N	52.17	1.0	\N	2018-05-25 09:29:29.366078	2018-05-25 09:29:29.366078
886	886	B000MW7MJ8	\N	55.49	1.0	\N	2018-05-25 09:29:29.375733	2018-05-25 09:29:29.375733
887	887	B000I6S5NU	\N	19.16	1.0	\N	2018-05-25 09:29:29.383786	2018-05-25 09:29:29.383786
888	888	B0007WHCXO	\N	56.47	1.0	\N	2018-05-25 09:29:29.392556	2018-05-25 09:29:29.392556
889	889	B0000DE593	\N	6.73	1.0	\N	2018-05-25 09:29:29.401867	2018-05-25 09:29:29.401867
890	890	B0002SVARW	\N	90.01	1.0	\N	2018-05-25 09:29:29.411311	2018-05-25 09:29:29.411311
891	891	B000PIIXBA	\N	26.97	1.0	\N	2018-05-25 09:29:29.419735	2018-05-25 09:29:29.419735
892	892	B000OVNFDE	\N	5.88	1.0	\N	2018-05-25 09:29:29.427985	2018-05-25 09:29:29.427985
893	893	B000PLUEEQ	\N	92.34	1.0	\N	2018-05-25 09:29:29.435817	2018-05-25 09:29:29.435817
894	894	B0001FGAO4	\N	39.46	1.0	\N	2018-05-25 09:29:29.44383	2018-05-25 09:29:29.44383
895	895	B000I6RUQ8	\N	27.94	1.0	\N	2018-05-25 09:29:29.451536	2018-05-25 09:29:29.451536
896	896	B0002XCH2E	\N	96.84	1.0	\N	2018-05-25 09:29:29.460223	2018-05-25 09:29:29.460223
897	897	B0007Z6BBA	\N	29.53	1.0	\N	2018-05-25 09:29:29.469531	2018-05-25 09:29:29.469531
898	898	B000IXHC2S	\N	2.83	1.0	\N	2018-05-25 09:29:29.47858	2018-05-25 09:29:29.47858
899	899	B000A6LQZ2	\N	37.02	1.0	\N	2018-05-25 09:29:29.487093	2018-05-25 09:29:29.487093
900	900	B000N5FYOE	\N	17.94	1.0	\N	2018-05-25 09:29:29.49572	2018-05-25 09:29:29.49572
901	901	B000IT4T96	\N	1.11	1.0	\N	2018-05-25 09:29:29.503345	2018-05-25 09:29:29.503345
902	902	B000HKQS6I	\N	24.48	1.0	\N	2018-05-25 09:29:29.511297	2018-05-25 09:29:29.511297
903	903	B0000DDZ3N	\N	21.32	1.0	\N	2018-05-25 09:29:29.519271	2018-05-25 09:29:29.519271
904	904	B000P42ICO	\N	8.81	1.0	\N	2018-05-25 09:29:29.529171	2018-05-25 09:29:29.529171
905	905	B00069TDVW	\N	71.71	1.0	\N	2018-05-25 09:29:29.53939	2018-05-25 09:29:29.53939
906	906	B000AR9H5C	\N	6.85	1.0	\N	2018-05-25 09:29:29.549933	2018-05-25 09:29:29.549933
907	907	B000662QI2	\N	62.13	1.0	\N	2018-05-25 09:29:29.560436	2018-05-25 09:29:29.560436
908	908	B000A1AUBI	\N	10.58	1.0	\N	2018-05-25 09:29:29.570595	2018-05-25 09:29:29.570595
909	909	B000IT4T9Q	\N	30.01	1.0	\N	2018-05-25 09:29:29.580385	2018-05-25 09:29:29.580385
910	910	B0000DGV0O	\N	87.73	1.0	\N	2018-05-25 09:29:29.590168	2018-05-25 09:29:29.590168
911	911	B0000DHCHM	\N	54.42	1.0	\N	2018-05-25 09:29:29.598968	2018-05-25 09:29:29.598968
912	912	B0002XUV3G	\N	75.43	1.0	\N	2018-05-25 09:29:29.607598	2018-05-25 09:29:29.607598
913	913	B000BJ5JHE	\N	34.41	1.0	\N	2018-05-25 09:29:29.616874	2018-05-25 09:29:29.616874
914	914	B0000DEVGP	\N	44.59	1.0	\N	2018-05-25 09:29:29.627659	2018-05-25 09:29:29.627659
915	915	B000A3JNTG	\N	3.32	1.0	\N	2018-05-25 09:29:29.635891	2018-05-25 09:29:29.635891
916	916	B000OVNFDE	\N	23.29	1.0	\N	2018-05-25 09:29:29.64404	2018-05-25 09:29:29.64404
917	917	B000BUWUX4	\N	71.8	1.0	\N	2018-05-25 09:29:29.653431	2018-05-25 09:29:29.653431
918	918	B0000DGV0O	\N	88.72	1.0	\N	2018-05-25 09:29:29.662659	2018-05-25 09:29:29.662659
919	919	B000A0GB7Q	\N	0.43	1.0	\N	2018-05-25 09:29:29.670705	2018-05-25 09:29:29.670705
920	920	B0002SZELK	\N	22.84	1.0	\N	2018-05-25 09:29:29.678998	2018-05-25 09:29:29.678998
921	921	B000BPC71E	\N	5.02	1.0	\N	2018-05-25 09:29:29.687616	2018-05-25 09:29:29.687616
922	922	B0000DGXE8	\N	21.69	1.0	\N	2018-05-25 09:29:29.695731	2018-05-25 09:29:29.695731
923	923	B000A3PGTC	\N	90.23	1.0	\N	2018-05-25 09:29:29.703867	2018-05-25 09:29:29.703867
924	924	B000JTDF6I	\N	99.28	1.0	\N	2018-05-25 09:29:29.712695	2018-05-25 09:29:29.712695
925	925	B0009QHJSG	\N	2.1	1.0	\N	2018-05-25 09:29:29.7207	2018-05-25 09:29:29.7207
926	926	B0002F03NW	\N	75.14	1.0	\N	2018-05-25 09:29:29.728728	2018-05-25 09:29:29.728728
927	927	B000IXHC2S	\N	39.19	1.0	\N	2018-05-25 09:29:29.737555	2018-05-25 09:29:29.737555
928	928	B00069TDVW	\N	90.42	1.0	\N	2018-05-25 09:29:29.746269	2018-05-25 09:29:29.746269
929	929	B000A2O3U6	\N	40.9	1.0	\N	2018-05-25 09:29:29.756164	2018-05-25 09:29:29.756164
930	930	B00067PATS	\N	44.12	1.0	\N	2018-05-25 09:29:29.7641	2018-05-25 09:29:29.7641
931	931	B000CENBP0	\N	91.14	1.0	\N	2018-05-25 09:29:29.771935	2018-05-25 09:29:29.771935
932	932	B000HU7P92	\N	65.9	1.0	\N	2018-05-25 09:29:29.779898	2018-05-25 09:29:29.779898
933	933	B000GWGMP4	\N	75.48	1.0	\N	2018-05-25 09:29:29.787588	2018-05-25 09:29:29.787588
934	934	B0000DHBRP	\N	77.19	1.0	\N	2018-05-25 09:29:29.796037	2018-05-25 09:29:29.796037
935	935	B000BY634C	\N	39.17	1.0	\N	2018-05-25 09:29:29.8037	2018-05-25 09:29:29.8037
936	936	B0000DGWB4	\N	97.51	1.0	\N	2018-05-25 09:29:29.811559	2018-05-25 09:29:29.811559
937	937	B0000DHF4M	\N	45.97	1.0	\N	2018-05-25 09:29:29.820473	2018-05-25 09:29:29.820473
938	938	B000BQ6ML4	\N	70.67	1.0	\N	2018-05-25 09:29:29.828396	2018-05-25 09:29:29.828396
939	939	B000CENBP0	\N	29.88	1.0	\N	2018-05-25 09:29:29.836039	2018-05-25 09:29:29.836039
940	940	B0006PJMEE	\N	86.98	1.0	\N	2018-05-25 09:29:29.844154	2018-05-25 09:29:29.844154
941	941	B000CEPH52	\N	92.59	1.0	\N	2018-05-25 09:29:29.851925	2018-05-25 09:29:29.851925
942	942	B0000DGGHM	\N	73.51	1.0	\N	2018-05-25 09:29:29.859828	2018-05-25 09:29:29.859828
943	943	B0002W2RBG	\N	1.96	1.0	\N	2018-05-25 09:29:29.868789	2018-05-25 09:29:29.868789
944	944	B000NQLUNC	\N	61.89	1.0	\N	2018-05-25 09:29:29.877331	2018-05-25 09:29:29.877331
945	945	B00012D9TQ	\N	95.64	1.0	\N	2018-05-25 09:29:29.886578	2018-05-25 09:29:29.886578
946	946	B000A2MIJY	\N	31.22	1.0	\N	2018-05-25 09:29:29.894467	2018-05-25 09:29:29.894467
947	947	B000HB4E90	\N	74.87	1.0	\N	2018-05-25 09:29:29.902352	2018-05-25 09:29:29.902352
948	948	B000AR8ERO	\N	40.34	1.0	\N	2018-05-25 09:29:29.910263	2018-05-25 09:29:29.910263
949	949	B00025DRIA	\N	57.22	1.0	\N	2018-05-25 09:29:29.918059	2018-05-25 09:29:29.918059
950	950	B000BIWQNA	\N	77.1	1.0	\N	2018-05-25 09:29:29.927229	2018-05-25 09:29:29.927229
951	951	B00067OVMK	\N	75.49	1.0	\N	2018-05-25 09:29:29.935557	2018-05-25 09:29:29.935557
952	952	B000I6QSBG	\N	12.19	1.0	\N	2018-05-25 09:29:29.947791	2018-05-25 09:29:29.947791
953	953	B000A6LSXW	\N	43.49	1.0	\N	2018-05-25 09:29:29.956548	2018-05-25 09:29:29.956548
954	954	B000A1AQWQ	\N	14.31	1.0	\N	2018-05-25 09:29:29.963939	2018-05-25 09:29:29.963939
955	955	B0000W2LW8	\N	82.24	1.0	\N	2018-05-25 09:29:29.973247	2018-05-25 09:29:29.973247
956	956	B000BJ4VFA	\N	83.47	1.0	\N	2018-05-25 09:29:29.981591	2018-05-25 09:29:29.981591
957	957	B000Q75VCO	\N	62.04	1.0	\N	2018-05-25 09:29:29.993262	2018-05-25 09:29:29.993262
958	958	B000HQGKRO	\N	67.35	1.0	\N	2018-05-25 09:29:30.002274	2018-05-25 09:29:30.002274
959	959	B0000TFLNM	\N	85.15	1.0	\N	2018-05-25 09:29:30.010231	2018-05-25 09:29:30.010231
960	960	B0000DFUHY	\N	38.9	1.0	\N	2018-05-25 09:29:30.018543	2018-05-25 09:29:30.018543
961	961	B000NI7RW8	\N	43.62	1.0	\N	2018-05-25 09:29:30.028679	2018-05-25 09:29:30.028679
962	962	B0000DGTOF	\N	64.06	1.0	\N	2018-05-25 09:29:30.035259	2018-05-25 09:29:30.035259
963	963	B000A2NVLS	\N	60.57	1.0	\N	2018-05-25 09:29:30.043615	2018-05-25 09:29:30.043615
964	964	B000HB4DU0	\N	35.95	1.0	\N	2018-05-25 09:29:30.05045	2018-05-25 09:29:30.05045
965	965	B000A143NO	\N	31.07	1.0	\N	2018-05-25 09:29:30.056731	2018-05-25 09:29:30.056731
966	966	B0007WHCXE	\N	86.93	1.0	\N	2018-05-25 09:29:30.064151	2018-05-25 09:29:30.064151
967	967	B000IAO9A4	\N	67.13	1.0	\N	2018-05-25 09:29:30.071525	2018-05-25 09:29:30.071525
968	968	B000ALJYO2	\N	94.82	1.0	\N	2018-05-25 09:29:30.078314	2018-05-25 09:29:30.078314
969	969	B000A3J9AE	\N	25.61	1.0	\N	2018-05-25 09:29:30.085005	2018-05-25 09:29:30.085005
970	970	B00004YKMI	\N	70.37	1.0	\N	2018-05-25 09:29:30.091888	2018-05-25 09:29:30.091888
971	971	B0002I6HKW	\N	38.08	1.0	\N	2018-05-25 09:29:30.098104	2018-05-25 09:29:30.098104
972	972	B000AM6Z7K	\N	87.46	1.0	\N	2018-05-25 09:29:30.107131	2018-05-25 09:29:30.107131
973	973	B000A2O26G	\N	26.32	1.0	\N	2018-05-25 09:29:30.114661	2018-05-25 09:29:30.114661
974	974	B000ALH1DI	\N	63.97	1.0	\N	2018-05-25 09:29:30.120744	2018-05-25 09:29:30.120744
975	975	B000A2MJY8	\N	86.22	1.0	\N	2018-05-25 09:29:30.127254	2018-05-25 09:29:30.127254
976	976	B000JKMDTW	\N	84.9	1.0	\N	2018-05-25 09:29:30.133724	2018-05-25 09:29:30.133724
977	977	B0000VG5MG	\N	78.53	1.0	\N	2018-05-25 09:29:30.140075	2018-05-25 09:29:30.140075
978	978	B000A2NZFK	\N	53.01	1.0	\N	2018-05-25 09:29:30.146277	2018-05-25 09:29:30.146277
979	979	B000A6PMBG	\N	92.71	1.0	\N	2018-05-25 09:29:30.1545	2018-05-25 09:29:30.1545
980	980	B0000DFH0E	\N	61.6	1.0	\N	2018-05-25 09:29:30.163199	2018-05-25 09:29:30.163199
981	981	B000P42ICO	\N	10.28	1.0	\N	2018-05-25 09:29:30.171373	2018-05-25 09:29:30.171373
982	982	B0000AAGJF	\N	63.91	1.0	\N	2018-05-25 09:29:30.179833	2018-05-25 09:29:30.179833
983	983	B000HU5ZIA	\N	68.29	1.0	\N	2018-05-25 09:29:30.188182	2018-05-25 09:29:30.188182
984	984	B0007WHCXO	\N	28.18	1.0	\N	2018-05-25 09:29:30.196397	2018-05-25 09:29:30.196397
985	985	B00065E4WY	\N	43.75	1.0	\N	2018-05-25 09:29:30.205447	2018-05-25 09:29:30.205447
986	986	B000BSH8AQ	\N	65.16	1.0	\N	2018-05-25 09:29:30.213092	2018-05-25 09:29:30.213092
987	987	B000E5GB3Q	\N	3.79	1.0	\N	2018-05-25 09:29:30.220972	2018-05-25 09:29:30.220972
988	988	B000J1E1RS	\N	22.33	1.0	\N	2018-05-25 09:29:30.22838	2018-05-25 09:29:30.22838
989	989	B0000B0IVU	\N	31.22	1.0	\N	2018-05-25 09:29:30.236078	2018-05-25 09:29:30.236078
990	990	B000N5FYO4	\N	6.38	1.0	\N	2018-05-25 09:29:30.244562	2018-05-25 09:29:30.244562
991	991	B000I6VJ7O	\N	65.75	1.0	\N	2018-05-25 09:29:30.253223	2018-05-25 09:29:30.253223
992	992	B0000DHWAB	\N	90.61	1.0	\N	2018-05-25 09:29:30.26127	2018-05-25 09:29:30.26127
993	993	B000KEYQLA	\N	1.49	1.0	\N	2018-05-25 09:29:30.269083	2018-05-25 09:29:30.269083
994	994	B000A3K36I	\N	12.87	1.0	\N	2018-05-25 09:29:30.276033	2018-05-25 09:29:30.276033
995	995	B000GQ2P7O	\N	54.7	1.0	\N	2018-05-25 09:29:30.2826	2018-05-25 09:29:30.2826
996	996	B000JFLI7U	\N	74.35	1.0	\N	2018-05-25 09:29:30.289034	2018-05-25 09:29:30.289034
997	997	B0009IT5P4	\N	89.92	1.0	\N	2018-05-25 09:29:30.296432	2018-05-25 09:29:30.296432
998	998	B000CDC7O2	\N	67.11	1.0	\N	2018-05-25 09:29:30.302761	2018-05-25 09:29:30.302761
999	999	B000I6RITM	\N	38.29	1.0	\N	2018-05-25 09:29:30.309802	2018-05-25 09:29:30.309802
1000	1000	B000A70B9I	\N	21.78	1.0	\N	2018-05-25 09:29:30.315895	2018-05-25 09:29:30.315895
1001	1001	B0000DFLFJ	\N	39.88	1.0	\N	2018-05-25 09:29:30.323178	2018-05-25 09:29:30.323178
1002	1002	B000I6S5NU	\N	10.22	1.0	\N	2018-05-25 09:29:30.329636	2018-05-25 09:29:30.329636
1003	1003	B0009RSVD2	\N	67.52	1.0	\N	2018-05-25 09:29:30.336271	2018-05-25 09:29:30.336271
1004	1004	B000P5YK8S	\N	55.96	1.0	\N	2018-05-25 09:29:30.342234	2018-05-25 09:29:30.342234
1005	1005	B0009QW44A	\N	88.35	1.0	\N	2018-05-25 09:29:30.348657	2018-05-25 09:29:30.348657
1006	1006	B000GIWNCE	\N	58.75	1.0	\N	2018-05-25 09:29:30.355679	2018-05-25 09:29:30.355679
1007	1007	B000Q75VCO	\N	41.78	1.0	\N	2018-05-25 09:29:30.362473	2018-05-25 09:29:30.362473
1008	1008	B0000AAMF4	\N	91.47	1.0	\N	2018-05-25 09:29:30.368761	2018-05-25 09:29:30.368761
1009	1009	B000A3J9AE	\N	51.2	1.0	\N	2018-05-25 09:29:30.375863	2018-05-25 09:29:30.375863
1010	1010	B0002F03NW	\N	99.87	1.0	\N	2018-05-25 09:29:30.382044	2018-05-25 09:29:30.382044
1011	1011	B000A3T3LY	\N	32.87	1.0	\N	2018-05-25 09:29:30.389511	2018-05-25 09:29:30.389511
1012	1012	B0000TFLNM	\N	42.1	1.0	\N	2018-05-25 09:29:30.397081	2018-05-25 09:29:30.397081
1013	1013	B000BHP43U	\N	5.23	1.0	\N	2018-05-25 09:29:30.403386	2018-05-25 09:29:30.403386
1014	1014	B000IT4T96	\N	35.81	1.0	\N	2018-05-25 09:29:30.410073	2018-05-25 09:29:30.410073
1015	1015	B0006OGUPY	\N	80.72	1.0	\N	2018-05-25 09:29:30.416803	2018-05-25 09:29:30.416803
1016	1016	B0002GLP6K	\N	30.52	1.0	\N	2018-05-25 09:29:30.422973	2018-05-25 09:29:30.422973
1017	1017	B0000DHVM5	\N	84.07	1.0	\N	2018-05-25 09:29:30.429223	2018-05-25 09:29:30.429223
1018	1018	B0000DGTWR	\N	43.45	1.0	\N	2018-05-25 09:29:30.434986	2018-05-25 09:29:30.434986
1019	1019	B000NQLUNC	\N	18.56	1.0	\N	2018-05-25 09:29:30.44138	2018-05-25 09:29:30.44138
1020	1020	B000B7CBWM	\N	88.96	1.0	\N	2018-05-25 09:29:30.448256	2018-05-25 09:29:30.448256
1021	1021	B000BSH87O	\N	19.95	1.0	\N	2018-05-25 09:29:30.454735	2018-05-25 09:29:30.454735
1022	1022	B0002XTOHK	\N	76.04	1.0	\N	2018-05-25 09:29:30.460906	2018-05-25 09:29:30.460906
1023	1023	B000GWGMP4	\N	2.61	1.0	\N	2018-05-25 09:29:30.467662	2018-05-25 09:29:30.467662
1024	1024	B000BHLISA	\N	50.05	1.0	\N	2018-05-25 09:29:30.473718	2018-05-25 09:29:30.473718
1025	1025	B000A0AQPO	\N	63.44	1.0	\N	2018-05-25 09:29:30.48012	2018-05-25 09:29:30.48012
1026	1026	B000GIWNCE	\N	33.49	1.0	\N	2018-05-25 09:29:30.486175	2018-05-25 09:29:30.486175
1027	1027	B000IXHC2S	\N	64.9	1.0	\N	2018-05-25 09:29:30.49273	2018-05-25 09:29:30.49273
1028	1028	B0002F03NW	\N	16.48	1.0	\N	2018-05-25 09:29:30.499504	2018-05-25 09:29:30.499504
1029	1029	B000GWGJK2	\N	35.02	1.0	\N	2018-05-25 09:29:30.505845	2018-05-25 09:29:30.505845
1030	1030	B000HB4DU0	\N	55.77	1.0	\N	2018-05-25 09:29:30.512043	2018-05-25 09:29:30.512043
1031	1031	B000BHP2LO	\N	22.29	1.0	\N	2018-05-25 09:29:30.518006	2018-05-25 09:29:30.518006
1032	1032	B0002BWS1G	\N	4.7	1.0	\N	2018-05-25 09:29:30.524404	2018-05-25 09:29:30.524404
1033	1033	B000A2MI80	\N	10.92	1.0	\N	2018-05-25 09:29:30.531289	2018-05-25 09:29:30.531289
1034	1034	B000A1AUBI	\N	94.99	1.0	\N	2018-05-25 09:29:30.537568	2018-05-25 09:29:30.537568
1035	1035	B000GIWNCE	\N	9.53	1.0	\N	2018-05-25 09:29:30.543196	2018-05-25 09:29:30.543196
1036	1036	B000A2T37E	\N	2.26	1.0	\N	2018-05-25 09:29:30.549149	2018-05-25 09:29:30.549149
1037	1037	B00065E4WY	\N	43.96	1.0	\N	2018-05-25 09:29:30.555667	2018-05-25 09:29:30.555667
1038	1038	B0001H5NK4	\N	86.23	1.0	\N	2018-05-25 09:29:30.561673	2018-05-25 09:29:30.561673
1039	1039	B000CENBP0	\N	47.29	1.0	\N	2018-05-25 09:29:30.568605	2018-05-25 09:29:30.568605
1040	1040	B000J42NY8	\N	69.26	1.0	\N	2018-05-25 09:29:30.575134	2018-05-25 09:29:30.575134
1041	1041	B000BPIBPK	\N	46.83	1.0	\N	2018-05-25 09:29:30.582101	2018-05-25 09:29:30.582101
1042	1042	B000GT9P4C	\N	90.44	1.0	\N	2018-05-25 09:29:30.59006	2018-05-25 09:29:30.59006
1043	1043	B000FNP6CY	\N	41.38	1.0	\N	2018-05-25 09:29:30.597938	2018-05-25 09:29:30.597938
1044	1044	B000HC0P2E	\N	68.17	1.0	\N	2018-05-25 09:29:30.605211	2018-05-25 09:29:30.605211
1045	1045	B000BJ5JHE	\N	5.63	1.0	\N	2018-05-25 09:29:30.61247	2018-05-25 09:29:30.61247
1046	1046	B000A6Y9HY	\N	56.36	1.0	\N	2018-05-25 09:29:30.618772	2018-05-25 09:29:30.618772
1047	1047	B0000DGGHM	\N	76.26	1.0	\N	2018-05-25 09:29:30.625874	2018-05-25 09:29:30.625874
1048	1048	B000N5HN3Y	\N	35.62	1.0	\N	2018-05-25 09:29:30.632066	2018-05-25 09:29:30.632066
1049	1049	B0000DEVGP	\N	6.8	1.0	\N	2018-05-25 09:29:30.638447	2018-05-25 09:29:30.638447
1050	1050	B000FTBJGA	\N	40.19	1.0	\N	2018-05-25 09:29:30.645214	2018-05-25 09:29:30.645214
1051	1051	B000NKSOOQ	\N	32.39	1.0	\N	2018-05-25 09:29:30.651744	2018-05-25 09:29:30.651744
1052	1052	B000AOVECO	\N	93.22	1.0	\N	2018-05-25 09:29:30.659036	2018-05-25 09:29:30.659036
1053	1053	B000A1AQWQ	\N	16.63	1.0	\N	2018-05-25 09:29:30.665174	2018-05-25 09:29:30.665174
1054	1054	B000IT4T9Q	\N	92.39	1.0	\N	2018-05-25 09:29:30.671596	2018-05-25 09:29:30.671596
1055	1055	B0000DGWB4	\N	28.47	1.0	\N	2018-05-25 09:29:30.678444	2018-05-25 09:29:30.678444
1056	1056	B000PIM89S	\N	95.43	1.0	\N	2018-05-25 09:29:30.684578	2018-05-25 09:29:30.684578
1057	1057	B000A1AQWQ	\N	38.62	1.0	\N	2018-05-25 09:29:30.69197	2018-05-25 09:29:30.69197
1058	1058	B0009IT5P4	\N	83.63	1.0	\N	2018-05-25 09:29:30.698443	2018-05-25 09:29:30.698443
1059	1059	B0002F03NW	\N	38.8	1.0	\N	2018-05-25 09:29:30.704531	2018-05-25 09:29:30.704531
1060	1060	B000B7722Q	\N	34.22	1.0	\N	2018-05-25 09:29:30.71108	2018-05-25 09:29:30.71108
1061	1061	B000CPJHQG	\N	84.26	1.0	\N	2018-05-25 09:29:30.717413	2018-05-25 09:29:30.717413
1062	1062	B0009QHJSG	\N	87.27	1.0	\N	2018-05-25 09:29:30.723792	2018-05-25 09:29:30.723792
1063	1063	B0000AJDKF	\N	94.68	1.0	\N	2018-05-25 09:29:30.732064	2018-05-25 09:29:30.732064
1064	1064	B000JTDF6I	\N	75.65	1.0	\N	2018-05-25 09:29:30.740142	2018-05-25 09:29:30.740142
1065	1065	B0000AB07P	\N	84.16	1.0	\N	2018-05-25 09:29:30.748569	2018-05-25 09:29:30.748569
1066	1066	B000JTR9CE	\N	32.61	1.0	\N	2018-05-25 09:29:30.755523	2018-05-25 09:29:30.755523
1067	1067	B000FTQ5A0	\N	89.13	1.0	\N	2018-05-25 09:29:30.762957	2018-05-25 09:29:30.762957
1068	1068	B000HB4E90	\N	25.63	1.0	\N	2018-05-25 09:29:30.769859	2018-05-25 09:29:30.769859
1069	1069	B0000DEC3S	\N	92.11	1.0	\N	2018-05-25 09:29:30.778003	2018-05-25 09:29:30.778003
1070	1070	B0000DYXE0	\N	73.18	1.0	\N	2018-05-25 09:29:30.785199	2018-05-25 09:29:30.785199
1071	1071	B000A70EOU	\N	65.64	1.0	\N	2018-05-25 09:29:30.792489	2018-05-25 09:29:30.792489
1072	1072	B000AOMPAY	\N	68.78	1.0	\N	2018-05-25 09:29:30.799015	2018-05-25 09:29:30.799015
1073	1073	B000NKSOOQ	\N	23.08	1.0	\N	2018-05-25 09:29:30.805116	2018-05-25 09:29:30.805116
1074	1074	B000J2NHC2	\N	86.57	1.0	\N	2018-05-25 09:29:30.81154	2018-05-25 09:29:30.81154
1075	1075	B000BOIITU	\N	35.4	1.0	\N	2018-05-25 09:29:30.817986	2018-05-25 09:29:30.817986
1076	1076	B000A2LNPO	\N	74.38	1.0	\N	2018-05-25 09:29:30.82404	2018-05-25 09:29:30.82404
1077	1077	B00069TDVW	\N	68.73	1.0	\N	2018-05-25 09:29:30.830007	2018-05-25 09:29:30.830007
1078	1078	B000P4178K	\N	5.33	1.0	\N	2018-05-25 09:29:30.836206	2018-05-25 09:29:30.836206
1079	1079	B0000V3W9U	\N	77.66	1.0	\N	2018-05-25 09:29:30.842619	2018-05-25 09:29:30.842619
1080	1080	B000Q313FC	\N	89.25	1.0	\N	2018-05-25 09:29:30.849026	2018-05-25 09:29:30.849026
1081	1081	B0002SVARW	\N	73.74	1.0	\N	2018-05-25 09:29:30.856324	2018-05-25 09:29:30.856324
1082	1082	B000CEPH52	\N	57.47	1.0	\N	2018-05-25 09:29:30.863501	2018-05-25 09:29:30.863501
1083	1083	B000JR91YA	\N	16.49	1.0	\N	2018-05-25 09:29:30.869738	2018-05-25 09:29:30.869738
1084	1084	B00065E4WY	\N	40.58	1.0	\N	2018-05-25 09:29:30.87587	2018-05-25 09:29:30.87587
1085	1085	B0002W2RBG	\N	98.59	1.0	\N	2018-05-25 09:29:30.881888	2018-05-25 09:29:30.881888
1086	1086	B000BYDF4I	\N	33.88	1.0	\N	2018-05-25 09:29:30.888116	2018-05-25 09:29:30.888116
1087	1087	B000BHP3T0	\N	58.3	1.0	\N	2018-05-25 09:29:30.896092	2018-05-25 09:29:30.896092
1088	1088	B000ML8E7I	\N	29.68	1.0	\N	2018-05-25 09:29:30.902779	2018-05-25 09:29:30.902779
1089	1089	B000HVZOOO	\N	19.83	1.0	\N	2018-05-25 09:29:30.910313	2018-05-25 09:29:30.910313
1090	1090	B0000DGITY	\N	83.34	1.0	\N	2018-05-25 09:29:30.918337	2018-05-25 09:29:30.918337
1091	1091	B000FTBJGA	\N	10.58	1.0	\N	2018-05-25 09:29:30.926068	2018-05-25 09:29:30.926068
1092	1092	B00067OVMK	\N	82.77	1.0	\N	2018-05-25 09:29:30.932995	2018-05-25 09:29:30.932995
1093	1093	B0002BXBEY	\N	58.38	1.0	\N	2018-05-25 09:29:30.940387	2018-05-25 09:29:30.940387
1094	1094	B000FFAGDG	\N	13.11	1.0	\N	2018-05-25 09:29:30.947074	2018-05-25 09:29:30.947074
1095	1095	B000A2SXYS	\N	1.56	1.0	\N	2018-05-25 09:29:30.953178	2018-05-25 09:29:30.953178
1096	1096	B0009PC1XA	\N	45.95	1.0	\N	2018-05-25 09:29:30.959997	2018-05-25 09:29:30.959997
1097	1097	B000CSAK3M	\N	37.75	1.0	\N	2018-05-25 09:29:30.96774	2018-05-25 09:29:30.96774
1098	1098	B00067EOF4	\N	11.06	1.0	\N	2018-05-25 09:29:30.975791	2018-05-25 09:29:30.975791
1099	1099	B000BHP43U	\N	43.64	1.0	\N	2018-05-25 09:29:30.983899	2018-05-25 09:29:30.983899
1100	1100	B000N5HN3Y	\N	31.79	1.0	\N	2018-05-25 09:29:30.992205	2018-05-25 09:29:30.992205
1101	1101	B000AR8ERO	\N	70.47	1.0	\N	2018-05-25 09:29:30.999794	2018-05-25 09:29:30.999794
1102	1102	B000A6WENA	\N	45.38	1.0	\N	2018-05-25 09:29:31.007649	2018-05-25 09:29:31.007649
1103	1103	B000A2RL4Q	\N	7.68	1.0	\N	2018-05-25 09:29:31.014719	2018-05-25 09:29:31.014719
1104	1104	B000BY634C	\N	14.6	1.0	\N	2018-05-25 09:29:31.020891	2018-05-25 09:29:31.020891
1105	1105	B000ILNR10	\N	4.96	1.0	\N	2018-05-25 09:29:31.029279	2018-05-25 09:29:31.029279
1106	1106	B0009XDRTE	\N	5.33	1.0	\N	2018-05-25 09:29:31.036285	2018-05-25 09:29:31.036285
1107	1107	B000J3401I	\N	77.08	1.0	\N	2018-05-25 09:29:31.047354	2018-05-25 09:29:31.047354
1108	1108	B000FTBJGA	\N	94.97	1.0	\N	2018-05-25 09:29:31.05772	2018-05-25 09:29:31.05772
1109	1109	B000P5XI6S	\N	13.71	1.0	\N	2018-05-25 09:29:31.067542	2018-05-25 09:29:31.067542
1110	1110	B000HGWGHW	\N	43.95	1.0	\N	2018-05-25 09:29:31.074401	2018-05-25 09:29:31.074401
1111	1111	B0000VAE3M	\N	54.27	1.0	\N	2018-05-25 09:29:31.083298	2018-05-25 09:29:31.083298
1112	1112	B0002STO02	\N	69.51	1.0	\N	2018-05-25 09:29:31.089832	2018-05-25 09:29:31.089832
1113	1113	B000IT4T9Q	\N	20.84	1.0	\N	2018-05-25 09:29:31.097982	2018-05-25 09:29:31.097982
1114	1114	B0007657T6	\N	53.82	1.0	\N	2018-05-25 09:29:31.107199	2018-05-25 09:29:31.107199
1115	1115	B0000DFPMN	\N	18.89	1.0	\N	2018-05-25 09:29:31.114796	2018-05-25 09:29:31.114796
1116	1116	B000ALJYO2	\N	42.06	1.0	\N	2018-05-25 09:29:31.121229	2018-05-25 09:29:31.121229
1117	1117	B0000VG5MG	\N	2.13	1.0	\N	2018-05-25 09:29:31.130092	2018-05-25 09:29:31.130092
1118	1118	B0002GMWEO	\N	68.77	1.0	\N	2018-05-25 09:29:31.136607	2018-05-25 09:29:31.136607
1119	1119	B000HKQS6I	\N	75.18	1.0	\N	2018-05-25 09:29:31.143163	2018-05-25 09:29:31.143163
1120	1120	B0002RTXMM	\N	48.4	1.0	\N	2018-05-25 09:29:31.149709	2018-05-25 09:29:31.149709
1121	1121	B00025AGUM	\N	99.42	1.0	\N	2018-05-25 09:29:31.157066	2018-05-25 09:29:31.157066
1122	1122	B000662QI2	\N	56.86	1.0	\N	2018-05-25 09:29:31.16401	2018-05-25 09:29:31.16401
1123	1123	B000PWBC6Y	\N	68.46	1.0	\N	2018-05-25 09:29:31.171024	2018-05-25 09:29:31.171024
1124	1124	B0000AAGDL	\N	61.98	1.0	\N	2018-05-25 09:29:31.178495	2018-05-25 09:29:31.178495
1125	1125	B0006PJMEE	\N	10.54	1.0	\N	2018-05-25 09:29:31.184468	2018-05-25 09:29:31.184468
1126	1126	B000P42ICO	\N	55.15	1.0	\N	2018-05-25 09:29:31.190415	2018-05-25 09:29:31.190415
1127	1127	B000A2LSJ0	\N	4.81	1.0	\N	2018-05-25 09:29:31.197017	2018-05-25 09:29:31.197017
1128	1128	B000K99WQE	\N	27.33	1.0	\N	2018-05-25 09:29:31.203098	2018-05-25 09:29:31.203098
1129	1129	B000675MDW	\N	20.1	1.0	\N	2018-05-25 09:29:31.210375	2018-05-25 09:29:31.210375
1130	1130	B000662QI2	\N	54.15	1.0	\N	2018-05-25 09:29:31.216126	2018-05-25 09:29:31.216126
1131	1131	B0006628FS	\N	64.38	1.0	\N	2018-05-25 09:29:31.222015	2018-05-25 09:29:31.222015
1132	1132	B00066OELO	\N	34.81	1.0	\N	2018-05-25 09:29:31.229014	2018-05-25 09:29:31.229014
1133	1133	B000AQNDBM	\N	90.23	1.0	\N	2018-05-25 09:29:31.235313	2018-05-25 09:29:31.235313
1134	1134	B0002GM6DQ	\N	31.94	1.0	\N	2018-05-25 09:29:31.241907	2018-05-25 09:29:31.241907
1135	1135	B000JSBHCS	\N	80.31	1.0	\N	2018-05-25 09:29:31.248745	2018-05-25 09:29:31.248745
1136	1136	B000BJ0Z50	\N	26.09	1.0	\N	2018-05-25 09:29:31.254713	2018-05-25 09:29:31.254713
1137	1137	B0000DGQ5D	\N	21.65	1.0	\N	2018-05-25 09:29:31.261669	2018-05-25 09:29:31.261669
1138	1138	B000KP4VP0	\N	64.34	1.0	\N	2018-05-25 09:29:31.26817	2018-05-25 09:29:31.26817
1139	1139	B000BPX542	\N	22.97	1.0	\N	2018-05-25 09:29:31.274318	2018-05-25 09:29:31.274318
1140	1140	B000N5FYNK	\N	91.51	1.0	\N	2018-05-25 09:29:31.281036	2018-05-25 09:29:31.281036
1141	1141	B0007Z6B42	\N	43.83	1.0	\N	2018-05-25 09:29:31.288178	2018-05-25 09:29:31.288178
1142	1142	B0000DDZ3N	\N	53.61	1.0	\N	2018-05-25 09:29:31.294901	2018-05-25 09:29:31.294901
1143	1143	B0000DFUHY	\N	85.44	1.0	\N	2018-05-25 09:29:31.301262	2018-05-25 09:29:31.301262
1144	1144	B0000DE593	\N	31.35	1.0	\N	2018-05-25 09:29:31.30712	2018-05-25 09:29:31.30712
1145	1145	B0000DGI28	\N	91.6	1.0	\N	2018-05-25 09:29:31.314002	2018-05-25 09:29:31.314002
1146	1146	B0000W2LW8	\N	64.11	1.0	\N	2018-05-25 09:29:31.320112	2018-05-25 09:29:31.320112
1147	1147	B0000DYX4V	\N	22.04	1.0	\N	2018-05-25 09:29:31.327344	2018-05-25 09:29:31.327344
1148	1148	B000KFZ32A	\N	94.96	1.0	\N	2018-05-25 09:29:31.334094	2018-05-25 09:29:31.334094
1149	1149	B0000DECN1	\N	70.02	1.0	\N	2018-05-25 09:29:31.340012	2018-05-25 09:29:31.340012
1150	1150	B0000DGTOF	\N	50.03	1.0	\N	2018-05-25 09:29:31.346531	2018-05-25 09:29:31.346531
1151	1151	B000AA5SMU	\N	30.05	1.0	\N	2018-05-25 09:29:31.352597	2018-05-25 09:29:31.352597
1152	1152	B000JQ0JNS	\N	79.23	1.0	\N	2018-05-25 09:29:31.359477	2018-05-25 09:29:31.359477
1153	1153	B0000DIIQA	\N	11.48	1.0	\N	2018-05-25 09:29:31.366315	2018-05-25 09:29:31.366315
1154	1154	B000HB4DU0	\N	13.11	1.0	\N	2018-05-25 09:29:31.372778	2018-05-25 09:29:31.372778
1155	1155	B0000AHC6J	\N	32.35	1.0	\N	2018-05-25 09:29:31.380319	2018-05-25 09:29:31.380319
1156	1156	B000654P8C	\N	87.18	1.0	\N	2018-05-25 09:29:31.391545	2018-05-25 09:29:31.391545
1157	1157	B000A70EOU	\N	25.87	1.0	\N	2018-05-25 09:29:31.401251	2018-05-25 09:29:31.401251
1158	1158	B000CPJHQG	\N	71.11	1.0	\N	2018-05-25 09:29:31.411546	2018-05-25 09:29:31.411546
1159	1159	B000A2O3U6	\N	91.32	1.0	\N	2018-05-25 09:29:31.420987	2018-05-25 09:29:31.420987
1160	1160	B000HB0138	\N	3.64	1.0	\N	2018-05-25 09:29:31.431366	2018-05-25 09:29:31.431366
1161	1161	B000MZW1GE	\N	60.78	1.0	\N	2018-05-25 09:29:31.440703	2018-05-25 09:29:31.440703
1162	1162	B00019774M	\N	7.79	1.0	\N	2018-05-25 09:29:31.449631	2018-05-25 09:29:31.449631
1163	1163	B00069TDVW	\N	37.3	1.0	\N	2018-05-25 09:29:31.458066	2018-05-25 09:29:31.458066
1164	1164	B000Q71WNG	\N	95.31	1.0	\N	2018-05-25 09:29:31.468976	2018-05-25 09:29:31.468976
1165	1165	B000000Z1F	\N	59.58	1.0	\N	2018-05-25 09:29:31.480338	2018-05-25 09:29:31.480338
1166	1166	B000A2RR04	\N	58.59	1.0	\N	2018-05-25 09:29:31.490117	2018-05-25 09:29:31.490117
1167	1167	B0000VFDCY	\N	4.31	1.0	\N	2018-05-25 09:29:31.499305	2018-05-25 09:29:31.499305
1168	1168	B000PIIXBA	\N	61.53	1.0	\N	2018-05-25 09:29:31.510517	2018-05-25 09:29:31.510517
1169	1169	B000662ADI	\N	46.82	1.0	\N	2018-05-25 09:29:31.519468	2018-05-25 09:29:31.519468
1170	1170	B000BIWPKO	\N	23.64	1.0	\N	2018-05-25 09:29:31.529623	2018-05-25 09:29:31.529623
1171	1171	B0000DHUGW	\N	30.02	1.0	\N	2018-05-25 09:29:31.541498	2018-05-25 09:29:31.541498
1172	1172	B00000AQ4N	\N	58.09	1.0	\N	2018-05-25 09:29:31.551458	2018-05-25 09:29:31.551458
1173	1173	B000A3K6TM	\N	49.17	1.0	\N	2018-05-25 09:29:31.56183	2018-05-25 09:29:31.56183
1174	1174	B000B7CC94	\N	2.27	1.0	\N	2018-05-25 09:29:31.572603	2018-05-25 09:29:31.572603
1175	1175	B0009XDRTE	\N	33.62	1.0	\N	2018-05-25 09:29:31.582326	2018-05-25 09:29:31.582326
1176	1176	B0000DHWDX	\N	89.49	1.0	\N	2018-05-25 09:29:31.593709	2018-05-25 09:29:31.593709
1177	1177	B000I4ZLIE	\N	44.52	1.0	\N	2018-05-25 09:29:31.610209	2018-05-25 09:29:31.610209
1178	1178	B000I00RTG	\N	94.34	1.0	\N	2018-05-25 09:29:31.623893	2018-05-25 09:29:31.623893
1179	1179	B000IAS0JU	\N	15.68	1.0	\N	2018-05-25 09:29:31.635866	2018-05-25 09:29:31.635866
1180	1180	B000HU5ZIA	\N	43.43	1.0	\N	2018-05-25 09:29:31.646844	2018-05-25 09:29:31.646844
1181	1181	B0000VAA8G	\N	17.24	1.0	\N	2018-05-25 09:29:31.656687	2018-05-25 09:29:31.656687
1182	1182	B000NKSTVO	\N	5.52	1.0	\N	2018-05-25 09:29:31.670198	2018-05-25 09:29:31.670198
1183	1183	B000IT4T96	\N	16.15	1.0	\N	2018-05-25 09:29:31.685037	2018-05-25 09:29:31.685037
1184	1184	B000A6LPM6	\N	20.96	1.0	\N	2018-05-25 09:29:31.695512	2018-05-25 09:29:31.695512
1185	1185	B000AR85S2	\N	80.11	1.0	\N	2018-05-25 09:29:31.707671	2018-05-25 09:29:31.707671
1186	1186	B000AR9G7G	\N	12.94	1.0	\N	2018-05-25 09:29:31.723003	2018-05-25 09:29:31.723003
1187	1187	B000AOMPAY	\N	72.45	1.0	\N	2018-05-25 09:29:31.73563	2018-05-25 09:29:31.73563
1188	1188	B00067EOF4	\N	74.41	1.0	\N	2018-05-25 09:29:31.746464	2018-05-25 09:29:31.746464
1189	1189	B000PIIXBA	\N	57.8	1.0	\N	2018-05-25 09:29:31.76188	2018-05-25 09:29:31.76188
1190	1190	B0000DHWDX	\N	52.31	1.0	\N	2018-05-25 09:29:31.770498	2018-05-25 09:29:31.770498
1191	1191	B000HQGKRO	\N	55.35	1.0	\N	2018-05-25 09:29:31.791018	2018-05-25 09:29:31.791018
1192	1192	B000JKKCMW	\N	39.38	1.0	\N	2018-05-25 09:29:31.810864	2018-05-25 09:29:31.810864
1193	1193	B000PLUEEQ	\N	68.61	1.0	\N	2018-05-25 09:29:31.819738	2018-05-25 09:29:31.819738
1194	1194	B000A2T37E	\N	41.3	1.0	\N	2018-05-25 09:29:31.833553	2018-05-25 09:29:31.833553
1195	1195	B0002EZWRK	\N	24.35	1.0	\N	2018-05-25 09:29:31.84214	2018-05-25 09:29:31.84214
1196	1196	B000662QI2	\N	28.79	1.0	\N	2018-05-25 09:29:31.854029	2018-05-25 09:29:31.854029
1197	1197	B0009IOFWC	\N	51.89	1.0	\N	2018-05-25 09:29:31.870581	2018-05-25 09:29:31.870581
1198	1198	B000ARBM9G	\N	30.25	1.0	\N	2018-05-25 09:29:31.885597	2018-05-25 09:29:31.885597
1199	1199	B0000DGQ5D	\N	17.09	1.0	\N	2018-05-25 09:29:31.898237	2018-05-25 09:29:31.898237
1200	1200	B0000VAE3M	\N	96.16	1.0	\N	2018-05-25 09:29:31.910152	2018-05-25 09:29:31.910152
1	1	B000BJ8TIA	\N	31.53	0.0	\N	2018-05-25 09:29:20.925946	2018-05-25 09:29:31.97916
20	20	B000JKMDTW	\N	74.72	0.0	\N	2018-05-25 09:29:21.094569	2018-05-25 09:29:32.148439
43	43	B0009ICOZ2	\N	39.05	0.0	\N	2018-05-25 09:29:21.292276	2018-05-25 09:29:32.311002
66	66	B0002IQM66	\N	65.0	0.0	\N	2018-05-25 09:29:21.495736	2018-05-25 09:29:32.484578
89	89	B000A2O3U6	\N	75.27	0.0	\N	2018-05-25 09:29:21.707948	2018-05-25 09:29:32.651607
108	108	B000IATJ5Y	\N	79.21	0.0	\N	2018-05-25 09:29:21.889966	2018-05-25 09:29:32.77272
131	131	B0002XCH2E	\N	72.21	0.0	\N	2018-05-25 09:29:22.085807	2018-05-25 09:29:32.924827
154	154	B0000DDQNC	\N	55.71	0.0	\N	2018-05-25 09:29:22.322996	2018-05-25 09:29:33.095789
177	177	B00024VYL8	\N	30.97	0.0	\N	2018-05-25 09:29:22.621546	2018-05-25 09:29:33.281852
196	196	B0000W2LW8	\N	90.51	0.0	\N	2018-05-25 09:29:22.801008	2018-05-25 09:29:33.406169
219	219	B0001FGAO4	\N	16.31	0.0	\N	2018-05-25 09:29:23.074523	2018-05-25 09:29:33.583059
242	242	B0000DKWL7	\N	21.71	0.0	\N	2018-05-25 09:29:23.340288	2018-05-25 09:29:33.741102
265	265	B0000DHDOF	\N	76.59	0.0	\N	2018-05-25 09:29:23.673623	2018-05-25 09:29:33.904594
284	284	B0000DHDOF	\N	63.69	0.0	\N	2018-05-25 09:29:23.911382	2018-05-25 09:29:34.041354
307	307	B0002C489K	\N	13.46	0.0	\N	2018-05-25 09:29:24.153888	2018-05-25 09:29:34.203409
330	330	B000NI7RW8	\N	28.34	0.0	\N	2018-05-25 09:29:24.354457	2018-05-25 09:29:34.361528
353	353	B0000DHCHM	\N	16.18	0.0	\N	2018-05-25 09:29:24.551318	2018-05-25 09:29:34.524828
372	372	B000BJ8TZI	\N	11.6	0.0	\N	2018-05-25 09:29:24.804642	2018-05-25 09:29:34.668467
395	395	B000HW20EA	\N	88.72	0.0	\N	2018-05-25 09:29:25.025602	2018-05-25 09:29:34.853178
418	418	B0000DGTOF	\N	50.87	0.0	\N	2018-05-25 09:29:25.216024	2018-05-25 09:29:35.007002
441	441	B0002GLP6K	\N	86.76	0.0	\N	2018-05-25 09:29:25.412044	2018-05-25 09:29:35.137956
460	460	B000BHP3T0	\N	45.55	0.0	\N	2018-05-25 09:29:25.57914	2018-05-25 09:29:35.232384
483	483	B000ILRO82	\N	12.36	0.0	\N	2018-05-25 09:29:25.779509	2018-05-25 09:29:35.349944
506	506	B000BNLKWS	\N	61.22	0.0	\N	2018-05-25 09:29:25.97089	2018-05-25 09:29:35.4915
529	529	B000MLA1UQ	\N	79.48	0.0	\N	2018-05-25 09:29:26.185287	2018-05-25 09:29:35.580966
548	548	B0000DHVM5	\N	67.46	0.0	\N	2018-05-25 09:29:26.344771	2018-05-25 09:29:35.666229
571	571	B0001DJWXW	\N	23.03	0.0	\N	2018-05-25 09:29:26.537328	2018-05-25 09:29:35.755809
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alen_marz
--

SELECT pg_catalog.setval('public.categories_id_seq', 42, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alen_marz
--

SELECT pg_catalog.setval('public.customers_id_seq', 200, true);


--
-- Name: option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alen_marz
--

SELECT pg_catalog.setval('public.option_values_id_seq', 12, true);


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alen_marz
--

SELECT pg_catalog.setval('public.options_id_seq', 4, true);


--
-- Name: order_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alen_marz
--

SELECT pg_catalog.setval('public.order_lines_id_seq', 576, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alen_marz
--

SELECT pg_catalog.setval('public.orders_id_seq', 289, true);


--
-- Name: product_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alen_marz
--

SELECT pg_catalog.setval('public.product_options_id_seq', 3360, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alen_marz
--

SELECT pg_catalog.setval('public.products_id_seq', 1200, true);


--
-- Name: variant_option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alen_marz
--

SELECT pg_catalog.setval('public.variant_option_values_id_seq', 3360, true);


--
-- Name: variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alen_marz
--

SELECT pg_catalog.setval('public.variants_id_seq', 1200, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: option_values option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.option_values
    ADD CONSTRAINT option_values_pkey PRIMARY KEY (id);


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: order_lines order_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.order_lines
    ADD CONSTRAINT order_lines_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_options product_options_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT product_options_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: variant_option_values variant_option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.variant_option_values
    ADD CONSTRAINT variant_option_values_pkey PRIMARY KEY (id);


--
-- Name: variants variants_pkey; Type: CONSTRAINT; Schema: public; Owner: alen_marz
--

ALTER TABLE ONLY public.variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (id);


--
-- Name: index_categories_on_category_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_categories_on_category_id ON public.categories USING btree (category_id);


--
-- Name: index_option_values_on_option_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_option_values_on_option_id ON public.option_values USING btree (option_id);


--
-- Name: index_option_values_on_option_id_and_name; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE UNIQUE INDEX index_option_values_on_option_id_and_name ON public.option_values USING btree (option_id, name);


--
-- Name: index_order_lines_on_order_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_order_lines_on_order_id ON public.order_lines USING btree (order_id);


--
-- Name: index_order_lines_on_order_id_and_variant_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE UNIQUE INDEX index_order_lines_on_order_id_and_variant_id ON public.order_lines USING btree (order_id, variant_id);


--
-- Name: index_order_lines_on_variant_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_order_lines_on_variant_id ON public.order_lines USING btree (variant_id);


--
-- Name: index_orders_on_customer_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_orders_on_customer_id ON public.orders USING btree (customer_id);


--
-- Name: index_product_options_on_option_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_product_options_on_option_id ON public.product_options USING btree (option_id);


--
-- Name: index_product_options_on_option_id_and_product_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE UNIQUE INDEX index_product_options_on_option_id_and_product_id ON public.product_options USING btree (option_id, product_id);


--
-- Name: index_product_options_on_product_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_product_options_on_product_id ON public.product_options USING btree (product_id);


--
-- Name: index_products_on_category_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_products_on_category_id ON public.products USING btree (category_id);


--
-- Name: index_variant_option_values_on_option_value_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_variant_option_values_on_option_value_id ON public.variant_option_values USING btree (option_value_id);


--
-- Name: index_variant_option_values_on_variant_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_variant_option_values_on_variant_id ON public.variant_option_values USING btree (variant_id);


--
-- Name: index_variant_option_values_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE UNIQUE INDEX index_variant_option_values_on_variant_id_and_option_value_id ON public.variant_option_values USING btree (variant_id, option_value_id);


--
-- Name: index_variants_on_product_id; Type: INDEX; Schema: public; Owner: alen_marz
--

CREATE INDEX index_variants_on_product_id ON public.variants USING btree (product_id);


--
-- PostgreSQL database dump complete
--

