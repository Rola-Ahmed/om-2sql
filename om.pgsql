--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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

--
-- Name: ortho_trail_delete; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ortho_trail_delete WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE ortho_trail_delete OWNER TO postgres;

\connect ortho_trail_delete

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

--
-- Name: enum_factories_verified; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_factories_verified AS ENUM (
    '0',
    '1'
);


ALTER TYPE public.enum_factories_verified OWNER TO postgres;

--
-- Name: enum_purchasingOrders_paymentType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_purchasingOrders_paymentType" AS ENUM (
    'cash',
    'card'
);


ALTER TYPE public."enum_purchasingOrders_paymentType" OWNER TO postgres;

--
-- Name: enum_subscriptions_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_subscriptions_type AS ENUM (
    'Free',
    'Standard',
    'Gold',
    'Premium'
);


ALTER TYPE public.enum_subscriptions_type OWNER TO postgres;

--
-- Name: enum_users_language; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_language AS ENUM (
    'english',
    'arabic',
    'german',
    'french'
);


ALTER TYPE public.enum_users_language OWNER TO postgres;

--
-- Name: enum_users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_role AS ENUM (
    'admin',
    'importer',
    'factory',
    'user',
    'shippingCompany'
);


ALTER TYPE public.enum_users_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contactUs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."contactUs" (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    phone character varying(255),
    message character varying(255) NOT NULL,
    company character varying(255),
    address character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."contactUs" OWNER TO postgres;

--
-- Name: contactUs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."contactUs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."contactUs_id_seq" OWNER TO postgres;

--
-- Name: contactUs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."contactUs_id_seq" OWNED BY public."contactUs".id;


--
-- Name: factories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factories (
    id integer NOT NULL,
    name character varying(255),
    description text,
    address character varying(255)[],
    "coverImage" character varying(255),
    images character varying(255)[],
    phone character varying(255),
    country character varying(255),
    city character varying(255),
    "socialLinks" jsonb,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.factories OWNER TO postgres;

--
-- Name: factories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factories_id_seq OWNER TO postgres;

--
-- Name: factories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factories_id_seq OWNED BY public.factories.id;


--
-- Name: ordersProducts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ordersProducts" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "productId" integer,
    "purchasingOrderId" integer,
    "userId" integer
);


ALTER TABLE public."ordersProducts" OWNER TO postgres;

--
-- Name: ordersProducts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ordersProducts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ordersProducts_id_seq" OWNER TO postgres;

--
-- Name: ordersProducts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ordersProducts_id_seq" OWNED BY public."ordersProducts".id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    "coverImage" character varying(255),
    images character varying(255)[],
    price double precision,
    available boolean DEFAULT true,
    "availableSize" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "factoryId" integer,
    "sectorId" integer,
    "DescriptionPoints" character varying(255)[],
    "IndicationPoints" character varying(255)[],
    "factoryName" character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: productsIds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."productsIds" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "purchasingOrderId" integer NOT NULL,
    "productId" integer NOT NULL
);


ALTER TABLE public."productsIds" OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: purchasingOrders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."purchasingOrders" (
    id integer NOT NULL,
    "totalPrice" double precision,
    "productsIds" integer[],
    "paymentType" public."enum_purchasingOrders_paymentType",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "extraDetails" character varying(255),
    quantity jsonb
);


ALTER TABLE public."purchasingOrders" OWNER TO postgres;

--
-- Name: purchasingOrders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."purchasingOrders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."purchasingOrders_id_seq" OWNER TO postgres;

--
-- Name: purchasingOrders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."purchasingOrders_id_seq" OWNED BY public."purchasingOrders".id;


--
-- Name: sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sectors (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.sectors OWNER TO postgres;

--
-- Name: sectors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sectors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sectors_id_seq OWNER TO postgres;

--
-- Name: sectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sectors_id_seq OWNED BY public.sectors.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type public.enum_subscriptions_type,
    description character varying(255)[] NOT NULL,
    price double precision NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscriptions_id_seq OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255)[],
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(255),
    role public.enum_users_role DEFAULT 'user'::public.enum_users_role,
    logout boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    company character varying(255),
    city character varying(255),
    country character varying(255),
    street character varying(255),
    fax character varying(255),
    "zipCode" character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: contactUs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."contactUs" ALTER COLUMN id SET DEFAULT nextval('public."contactUs_id_seq"'::regclass);


--
-- Name: factories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories ALTER COLUMN id SET DEFAULT nextval('public.factories_id_seq'::regclass);


--
-- Name: ordersProducts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ordersProducts" ALTER COLUMN id SET DEFAULT nextval('public."ordersProducts_id_seq"'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: purchasingOrders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."purchasingOrders" ALTER COLUMN id SET DEFAULT nextval('public."purchasingOrders_id_seq"'::regclass);


--
-- Name: sectors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors ALTER COLUMN id SET DEFAULT nextval('public.sectors_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: contactUs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."contactUs" (id, name, email, phone, message, company, address, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: factories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factories (id, name, description, address, "coverImage", images, phone, country, city, "socialLinks", "createdAt", "updatedAt") FROM stdin;
3	PRiM,S.A	\N	\N	uploads/factories/coverImage-1719245364305-igCSQ_9LLJCH-iGVOL5Esprim-2.png	\N	\N	\N	\N	\N	2024-06-26 02:59:26.879+03	2024-06-26 02:59:26.879+03
4	DJO Global	\N	\N	uploads/factories/coverImage-1719243439790-6ch2KzG6rcj1OjWDVwtLKDJO.png	\N	\N	\N	\N	\N	2024-06-26 02:59:26.879+03	2024-06-26 02:59:26.879+03
5	PROCOSIL hightech prosthesis	\N	\N	uploads/factories/coverImage-1719245430969-aVEsI7wo7aiuN272qwY80PROCOSIL.png	\N	\N	\N	\N	\N	2024-06-26 02:59:26.879+03	2024-06-26 02:59:26.879+03
6	Streifeneder	\N	\N	uploads/factories/coverImage-1719245470059-6TJ0lGqwX4JrJGR3bXqdrSIREFENDER.png	\N	\N	\N	\N	\N	2024-06-26 02:59:26.879+03	2024-06-26 02:59:26.879+03
7	Trulife	\N	\N	uploads/factories/coverImage-1719245514320-aAoz3grlcNL1aSyjUIAuOtrulife.png	\N	\N	\N	\N	\N	2024-06-26 02:59:26.879+03	2024-06-26 02:59:26.879+03
1	Move	\N	{'edede'}	uploads/factories/coverImage-1719245290951-iHpScTtVGtPKYsS5Wf8Ywmove.png	{uploads/factories/images-1719245859598-OIOfe3I1053ofwsHh1rSKmove.jpeg}	\N	\N	\N	\N	2024-06-26 02:59:26.879+03	2024-06-26 02:59:26.879+03
8	Orthomedics	\N	\N	uploads/factories/coverImage-1719246266364-Q7RccW2CCO0cqWAT8HMVMlogo.png	{uploads/factories/images-1719246266369-IeRnJ86pGI4SW1p_51ogoorthomedics-header.jpeg}	\N	\N	\N	\N	2024-06-26 02:59:26.879+03	2024-06-26 02:59:26.879+03
2	Orthobock	\N	\N	uploads/factories/coverImage-1719245319865-oDRda5h2U57P9zpoBmsABothobock.png\n	{uploads/factories/images-1719246394020-ZRl_cJAKnls1ffnOwARuOottobock-header.png}	\N	\N	\N	\N	2024-06-26 02:59:26.879+03	2024-06-26 02:59:26.879+03
\.


--
-- Data for Name: ordersProducts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ordersProducts" (id, "createdAt", "updatedAt", "productId", "purchasingOrderId", "userId") FROM stdin;
1	2024-07-01 09:01:28.804+03	2024-07-01 09:01:28.804+03	3	1	13
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, "coverImage", images, price, available, "availableSize", "createdAt", "updatedAt", "factoryId", "sectorId", "DescriptionPoints", "IndicationPoints", "factoryName") FROM stdin;
57	Pediatric Shoes (P - 10)	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 10).jpg"}	\N	t	23 to 32	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"1- Manufactured from high quality leather to support foot & ankle.","2- Open design to make the product more comfortable to wear.","3- Open design to reduce moisture & sweating.","4- Convenient buckle system to secure fixation.","5- High rigid neck for ankle support.","6- Non - slippery outsole that secures safety & durability.","7 - Available in different cheerful colors for kids."}	{"Pediatric Foot Deformity"}	Move
60	Pediatric Shoes (P - 70)	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 70)..jpg"}	\N	t	19 to 41	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"1- Manufactured from high quality leather to support foot & ankle.","2- Open design to make the product more comfortable to wear.","3- Open design to reduce moisture & sweating.","4- Convenient buckle system to secure fixation.","5- High rigid neck for ankle support.","6- Non - slippery outsole that secures safety & durability.","7 - Available in different cheerful colors for kids."}	{"Pediatric Foot Deformity"}	Move
62	Pediatric Shoes (P - 40)	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 40).jpg"}	\N	t	23 to 32	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"1- High rigid neck for ankle support.","2- Rubber, non - slippery outsole for safety & durability, to absorb shocks and reduce pain during playing & daily activities.","3- Straight last sole to keep the foot in normal position for more support & control.","4- Lacing to allow secure fixation.","5- Available in a different cheerful colors & stylish design for more comfort & confidence."}	{"Pediatric Foot Deformity"}	Move
63	Pediatric Shoes (P - 50)	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 50).jpg"}	\N	t	23 to 32	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"1- Manufactured from high quality leather.","2- High rigid neck for ankle support.","3- Rubber, non - slippery outsole for safety & durability, to absorb shocks and reduce pain during playing & daily activities.","4- Straight last sole to keep the foot in normal position for more support & control.","5- Lacing to allow secure fixation.","6- Available in a different cheerful colors & stylish design for more comfort & confidence."}	{"Pediatric Foot Deformity"}	Move
64	Pediatric Shoes (P - 60)	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 60).jpg"}	\N	t	23 to 32	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"1- Manufactured from high quality leather.","2- High rigid neck for ankle support.","3- Rubber, non - slippery outsole for safety & durability, to absorb shocks and reduce pain during playing & daily activities.","4- Straight last sole to keep the foot in normal position for more support & control.","5- Lacing to allow secure fixation.","6- Available in a different cheerful colors & stylish design for more comfort & confidence."}	{"Pediatric Foot Deformity"}	Move
66	Talipes Sandal	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Talipes Sandal.jpg"}	\N	t	18 to 35	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"For babies with club foot to be used while start walking. Best quality material to guarantee maximum correction and comfort."}	{"Talipes equinovarus"}	Move
127	Memory Foam Cervical Pillow	1	\N	{"../../../../uploads/products/5-Lifestyle/Memory Foam Cervical Pillow.jpg"}	0	t	One Size	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	2	{" Made of memory foam covered with soft velour."}	{"Conforms to the natural curvature of the body head and neck."," Supports the head & neck to ensure superior comfort."," Reduces neck & back pain."," Alleviates shoulder stiffness."," Enhances proper spine alignment & muscle relaxation."}	Move
90	Long CAM Walker	1	\N	{"../../../../uploads/products/3-lowerLimb/Long CAM Walker.jpg"}	0	t	S to XXL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{"Lightweight, ergonomic design."," Wide footbed for increased stability & accommodation of edema or bandages"," Anterior/Posterior & Medial/Lateral shells for better fixation & support."," Cushioned sole designed to absorb shock upon heel strike."," Padded with foam for extra comfort."," Contact closure straps for ease of application & removal."," Rocker sole to promote natural gait & reduce plantar pressures."}	{"Acute ankle sprains "," Fractures of the foot (Mid or forefoot)"," Achilles tendon ruptures. "," Post - operative. "," Soft tissue injuries."," Distal fibula fractures. "," Trauma "," Rehabilitation"}	Move
106	Diabetic Shoes (D-110)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-110).jpg"}	0	t	40 to 45	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Comfortable velcro fasteners"}	{"Diabetic Foot"}	Move
38	Above Knee Sock with Silicone Band 	\N	\N	{"../../../../uploads/products/7-Elastic/Above Knee Sock with Silicone Band.jpg"}	\N	t	M to 3XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	6	{"Attractive silicone top band","Very soft & smooth touch","Easy put on & take off","High wearing comfort"}	{Lymphoedema,"Chronic Venous Insufficiency","Varicose Veins"}	Move
18	Abdominal Belt	\N	\N	{"../../../../uploads/products/1-spin2&neck/Abdominal Belt.jpg"}	\N	t	S to 6XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" High grade elastic material."," Extra Velcro closure."," The straps are of Grade 2+ straps guarantee high quality and durability."}	{" Moderate low back pain."," Weak abdominal muscle."," Abdominal muscles sprains & strains."}	Move
20	Thoracolumbar Support Normal	\N	\N	{"../../../../uploads/products/1-spin2&neck/Thoracolumbar Support Normal.jpg"}	\N	t	S to 4XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" High grade elastic material. "," Extra X-shaped wide straps for additional support. "," Contact closures for additional support. "," Grade 2+ straps reflecting high quality & durability."}	{" Lumbar & lower thoracic spine strains & sprains "," Mild osteoporosis "," Posture control Available Size I"}	Move
22	Lumbosacral Support Normal	\N	\N	{"../../../../uploads/products/1-spin2&neck/Lumbosacral Support Normal.jpg"}	\N	t	S to 6XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" High grade elastic material lined with cotton."," 4 posterior metallic stays to support the lumbosacral zone."," Extra Velcro closure."," Grade 2+ straps guarantee high quality and durability."}	{" Moderate low back pain."," Weak abdominal muscles."," Abdominal muscles sprains & strains."}	Move
21	Lumbosacral Support GX	\N	\N	{"../../../../uploads/products/1-spin2&neck/Lumbosacral Support GX.jpg"}	\N	t	S to 5XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" High grade elastic material lined with cotton."," Extra X-shaped wide straps for additional support."," 4 posterior metallic stays to support the lumbosacral zone."," 2 metallic stays -1 lateral & 1 medial for extra support."," 2 anterior anti-roll metallic stays."," Grade 2+ straps guarantee high quality and durability."}	{" Moderate low back pain."," Lumbar muscle weakness."," Lumbar sprains & strains."}	Move
39	Below Knee Sock	\N	\N	{"../../../../uploads/products/7-Elastic/Below Knee Sock.jpg"}	\N	t	M to 3XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	6	{"Very soft & smooth touch","Easy put on & take off"," High wearing comfort"}	{Lymphoedema,"Chronic Venous Insufficiency","Varicose Veins"}	Move
40	Elastic Knee Support	\N	\N	{"../../../../uploads/products/7-Elastic/Elastic Knee Support.jpg"}	\N	t	M to 3XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	6	{"Wraparound breathable support","Leads to thermo-compression & knee protection","Smart design which allows perfect customized adaptation to the patient."}	{"Knee sprains & strains","Knee injuries"}	Move
41	Elastic Ankle Support	\N	\N	{"../../../../uploads/products/7-Elastic/Elastic Ankle Support.jpg"}	\N	t	M to 3XL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	6	{"Wraparound breathable support","Leads to thermo-compression & ankle stabilization.","Smart design which allows perfect customized adaptation to the patient.","Wearable in shoes & during simple activities"}	{"Ankle sprains & strains","Soft tissue injuries"}	Move
23	Lumbosacral Brace	\N	\N	{"../../../../uploads/products/1-spin2&neck/Lumbosacral Brace.jpg"}	\N	t	S to XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" Lightweight, breathable & durable frame that covers the lumbar & sacral parts of the vertebral column."," Posterior plastic component lined with foam for optimal comfort."," Easy to wear with adjustable straps for additional compression."," The brace helps maintaining the spine in neutral alignment while permitting ease of movement."}	{" Spondylolisthesis. "," Spondylosis. "," Osteoporosis."," Degenerative intervertebral disc. "," Chronic muscle weakness."," Vertebral compression fractures."}	Move
5	Thumb Support	\N	\N	{"../../../../uploads/products/2-upperLimb/Thumb Support.jpg"}	\N	t	S to XXXL - RT & LT	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	9	{" Soft, breathable elastic material."," Removable stay supporting the thumb."," Adjustable Velcro closure straps."}	{" Tendonitis."," Thumb strains or sprains."," Gamekeeper thumb."," Post-cast removal."}	Move
43	Pediatric Ar Sling	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Pediatric Ar Sling.jpg"}	\N	t	S to XL	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	8	{"Seamless, lightweight durable materials."," Adjustable shoulder strap for ease of application & removal."}	{" For cast support & post-cast."," Injuries to the arm, wrist or hand for children."," Immobilization of the arm following injury."}	Move
37	Above Knee Sock	\N	\N	{"../../../../uploads/products/7-Elastic/Above Knee Sock.jpg"}	\N	t	M to 3XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	6	{"Very soft & smooth touch.","Easy put on & take off.","High wearing comfort."}	{Lymphoedema,"Chronic Venous Insufficiency","Varicose Veins"}	Move
131	Ring Cushion	1	\N	{"../../../../uploads/products/5-Lifestyle/Ring Cushion 0.jpg"}	0	t	One Size	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	2	{"Made of memory foam covered with durable mesh fabric."}	{" Distributes the weight evenly.","Maintains the correct posture.","Relieves: - Post-natal discomfort. - Post-operative pain. - Pain associated with hemorrhoids. - Pain associated with pregnancy.- Bruised / fractured coccyx. - Hip bursitis.  - Pain associated with prostate inflammation."}	Move
93	Rocking Long Walker	1	\N	{"../../../../uploads/products/3-lowerLimb/Rocking Long Walker.jpg"}	0	t	S to XXL	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"Rigid, non-slip rocker sole."," Anti-bending shoe neck made of micro-perforated fabric for proper aeration (avoid sweating)."," 4 Velcro straps for easy fitting."," Washable footwear to keep good shape."}	{"Diabetic foot ulcers."," Tarsal & Ankle fractures."," Chronic phase management of Charcot foot."," Post-rehabilitation. "," Post-operative."}	Move
100	Diabetic Shoes (Regular)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (Regular).jpg"}	0	t	30 to 50	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{" Wide, non-slip shock absorber sole."," Well cushioned with Velcro closure strap for easy fitting & foot deformities accommodation."," Made of high quality material for maximum comfort and fast healing."}	{" Diabetic foot as it distributes plantar surface pressure & reduces pain."," Hallux valgus."," Hammer Toes."," Post-operative rehabilitation."}	Move
80	Knee Support Padded	1	\N	{"../../../../uploads/products/3-lowerLimb/Knee Support Padded.jpg"}	0	t	S to 4XL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{"Made of latex-free, high quality neoprene which guarantees warmth and compression."," Adjustable Velcro closures."," Open patella."}	{"Moderate knee sprains or strains."," Knee injuries."," Arthritis."}	Move
83	Knee Ranger	1	\N	{"../../../../uploads/products/3-lowerLimb/Knee Ranger.jpg"}	0	t	S to XXL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{" Made of high quality neoprene which guarantees warmth and compression."," Adjustable Velcro closures."," Provides immobilization & protected range of movement from 0 to 120 flexion & 0 to 70 extension."," Dual axis hinges."}	{"Immobilization & protected range of movement associated with ACl, PCl, lCl & MCl surgeries."," Collateral ligament strain & sprain."}	Move
6	Wrist Support	\N	\N	{"../../../../uploads/products/2-upperLimb/Wrist Support.jpg"}	\N	t	S to XXXL - RT & LT	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	9	{" Soft, breathable elastic material."," Removable wrist stay supporting the palmar surface of wrist & keeping it in a neutral position."," Adjustable Velcro closure straps."}	{" Carpal tunnel syndrome."," Tendonitis."," Wrist strains or sprains."}	Move
53	Ground Reaction AFO	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Ground Reaction AFO.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"High quality polypropylene material"}	{"Used specifically to apply forces to assist in knee extension (straightening) in walking & stabilising the ankle/foot complex."}	Move
84	Hinged Knee Brace	1	\N	{"../../../../uploads/products/3-lowerLimb/Hinged Knee Brace.jpg"}	0	t	One Size	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{"Front opening, lightweight design."," Dual axis hinges allowing for range of movement from 0 to 120 flexion & 0 to 70 extension."," Adjustable 6 straps for ease of application & removal."}	{" ACl, PCl, MCl & lCl injuries. "," Tibial plateau fractures."," Osteochondral repairs. "," Meniscal repairs."," Patella tendon repairs. "," Acute knee sprains / strains."," High tibial osteotomy."}	Move
85	Ankle Brace	1	\N	{"../../../../uploads/products/3-lowerLimb/Ankle Brace.jpg"}	0	t	S to XXXL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{" Contoured design, made of high quality neoprene which guarantees warmth and compression."," Figure - 8-shaped lock calcaneus bone in addition to medial & lateral metal stays providing ideal inversion / eversion control and support the ankle joint."," Fits comfortably into athletic or street shoes."}	{"Ankle sprains & strains. "," Soft tissue injuries."," Ankle joint immobilization."}	Move
86	Ankle Gel Support	1	\N	{"../../../../uploads/products/3-lowerLimb/Ankle Gel Support.jpg"}	0	t	One Size	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{" Rigid thermoplastic shells with adjustable heel strap to prevent inversion / eversion."," Gel bladder used for cold therapy to treat tender or swollen ankles."," Contact closure straps for ease of application & removal."," Fits right & left ankles"}	{" Ankle sprain and strains."," Prophylactic use in chronic ankle instability."}	Move
88	Long Air Walker	1	\N	{"../../../../uploads/products/3-lowerLimb/Long Air Walker.jpg"}	0	t	S to XXL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{"Molded plastic exterior with foam lining & circumferential strapping."," Inflatable air chambers to accommodate changes in edema & maximize patient compliance."," Cushioned inner sole."," Non-slip rocker sole for easy motion, increased stability & comfort"}	{" Acute ankle sprains. "," Post-operative use. "," Achilles tendon ruptures."," A better alternative of casting in case of stable fractures of lower leg, foot and ankle."}	Move
92	Rocking Short Walker	1	\N	{"../../../../uploads/products/3-lowerLimb/Rocking Short Walker.jpg"}	0	t	S to XXL	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"Rigid, non-slip rocker sole."," Anti-bending shoe neck made of micro-perforated fabric for proper aeration (avoid sweating)."," 3 Velcro straps for easy fitting."," Washable footwear to keep good shape."}	{"Diabetic foot ulcers."," Neuro-ischemic ulcer."," Management of injured foot. "," Metatarsal fractures."," Post-rehabilitation. "," Post-operative."}	Move
16	Posture Corrector Brace	\N	\N	{"../../../../uploads/products/1-spin2&neck/Posture Corrector Brace.jpg"}	\N	t	S to XXXL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" Durable brace that covers the entire spine."," Made of durable, breathable materials with adjustable Velcro straps for proper fitting."," Contains 2 metal splints on the back side for firm support & pressure reduction."," X-shape waist strap for extra support."}	{" Postural disorders."," Back pain."}	Move
79	Patella Strap	1	\N	{"../../../../uploads/products/3-lowerLimb/Patella Strap 0 .jpg"}	0	t	S to XXL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{"Made of latex-free, high quality neoprene which guarantees warmth and compression."," Contact closures that secure uniform compression & customized fit."}	{"Relieves anterior knee pain caused by:- Patellar tendonitis. - Chondromalacia. - Osgood Schlatter disease."}	Move
82	Knee Immobilizer	1	\N	{"../../../../uploads/products/3-lowerLimb/Knee Immobilizer.jpg"}	0	t	S to XXL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{"Made of soft breathable foam material."," Adjustable straps for ease of application & removal."," Medial & lateral stays in addition to rigid posterior stay that provide stability and secure knee immobilization."," Guarantees zero flexion of the knee."}	{"Post-operative knee immobilization."," Knee injuries where full extension of the leg is desired."}	Move
52	Supra Malleolar Orthosis	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Supra Malleolar Orthosis.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"High quality polypropylene material"}	{"Foot deformity"}	Move
55	Standing Frame	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Standing Frame.jpg"}	\N	t	75 - 80 - 90 - 100 - 110 - 115 - 120-130 -135 -140 -150 cm	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"To provide external support for children with inadequate postural control of the neck, head, and trunk in standing position"}	{" Cerebral Palsy"}	Move
56	Ankle Foot Orthosis	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Ankle Foot Orthosis.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{" Helps dorsiflexion while providing minor medial and lateral support for ankles."," To give more support to the forefoot, the foot plate is larger than normal."," The lightweight orthosis is rigid to resist mild extensor spasticity"}	{" Foot drop"}	Move
12	Soft Cervical Collar	\N	\N	{"../../../../uploads/products/1-spin2&neck/Soft Cervical Collar.jpg"}	\N	t	S to XXL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" Made of medium density foam."," Contoured design with soft cotton stockinette cover for enhanced comfort."," Velcro straps allowing easy fit & removal."}	{" Neck traumas."," Post-operative."," Cervical sprains & strains."," Degenerative disc disease."}	Move
14	Clavicle Support	\N	\N	{"../../../../uploads/products/1-spin2&neck/Clavicle Support.jpg"}	\N	t	S to XXXL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" Foam padded shoulder straps covered with stockinette."," 3-way adjustment buckles closure."}	{" Postural problems."," Clavicular fractures."," Sternoclavicular dislocations."}	Move
15	Posture Corrector	\N	\N	{"../../../../uploads/products/1-spin2&neck/Posture Corrector.jpg"}	\N	t	S to XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" Made of high quality neoprene that provides warmth & compression."," Adjustable Velcro straps."}	{" Postural disorders."," Back pain."}	Move
126	Cervical Pad	\N	\N	{"../../../../uploads/products/5-Lifestyle/Cervical Pad.jpg"}	\N	t	One Size	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	2	{" Made of memory foam covered with soft velour."}	{"Relieves the pressure on the cervical area.","The best choice for those who suffer from cervical spondylosis.","Prevents headache & neck pain.","Used while travelling or driving for long distance."}	Move
128	Cold Cure Cervical Pillow	1	\N	{"../../../../uploads/products/5-Lifestyle/Cold Cure Cervical Pillow.jpg"}	0	t	One Size	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	2	{"Made of cold cure foam with cotton cover."}	{"Improves sleep.","Alleviates headache & other problems resulted from inadequate sleep."}	Move
130	Lumbar Pad	1	\N	{"../../../../uploads/products/5-Lifestyle/Lumbar Pad 1.jpg"}	0	t	One Size	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	2	{"Made of cold cure covered with black mesh fabric.","Dual adjustable straps."}	{"Provides ultimate comfort by improving the posture.","Supports the low back area.","Relieves low back pain.","Recommended for car, home & office usage."}	Move
81	Hinged Knee Support	1	\N	{"../../../../uploads/products/3-lowerLimb/Hinged Knee Support.jpg"}	0	t	S to 4XL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{" Made of high quality neoprene which guarantees warmth and compression."," Adjustable Velcro closures. "," Open patella."," Dual axis polycentric hinges (medial & lateral)."," Wraparound design."}	{"Medial/lateral knee instability. "," Hyperextended knee."," Ligament weakness or injury. "," Tendonitis."," Arthritis. "," Degenerative joint disease."}	Move
87	Short Air Walker	1	\N	{"../../../../uploads/products/3-lowerLimb/Short Air Walker.jpg"}	0	t	S to XXL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{" Molded plastic exterior with foam lining & circumferential strapping."," Inflatable air chambers to accommodate changes in edema & maximize patient compliance."," Cushioned inner sole."," Non-slip, rocker sole for easy motion, increased stability & comfort."}	{"Acute ankle sprains. "," Post-operative. "," Achilles tendon ruptures."," A better alternative of casting in case of stable fractures of lower leg, foot and ankle."}	Move
89	Short CAM Walker	1	\N	{"../../../../uploads/products/3-lowerLimb/Short CAM Walker.jpg"}	0	t	S to XXL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{" Wide footbed for increased stability & accommodation of edema or bandages."," Anterior/Posterior & Medial/Lateral shells for better fixation & support."," Cushioned sole designed to absorb shock upon heel strike."," Padded with foam for extra comfort."," Contact closure straps for ease of application & removal."," Rocker sole to promote natural gait & reduce plantar pressures."}	{" Acute ankle sprains. "," Post - operative use."," Fractures of the lower leg, foot & ankle."}	Move
108	Diabetic Shoes (D-120)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-120).jpg"}	0	t	36 to 41	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Comfortable velcro fasteners"}	{"Diabetic Foot"}	Move
74	Hip Knee Ankle Foot Orthosis	\N	\N	{"../../../../uploads/products/8-Orthoses/Hip Knee Ankle Foot Orthosis.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.343+03	2024-06-26 14:36:42.343+03	1	4	{" High quality polypropylene material."," It improves body alignment and posture."," It increases bone and muscle strength."}	{" Cerebral Palsy."," Paraplagia"," Hip, knee & ankle muscle weakness & instability."}	Move
70	Boston Brace Orthosis	\N	\N	{"../../../../uploads/products/8-Orthoses/Boston Brace Orthosis.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.343+03	2024-06-26 14:36:42.343+03	1	4	{"The Boston Brace is a plastic body jacket used in The treatment of adolescents with idiopathic scoliosis.","The Boston Brace, also referred to as a Thoraco-Lumbo-Sacral Orthosis (TLSO) Brace, wraps under The arms and around The rib cage, lower back and hips in order to cast The spine into a straighter position."}	{" Idiopathic Scoliosis"}	Move
71	Short Genu Recurvatum Brace	\N	\N	{"../../../../uploads/products/8-Orthoses/Short Genu Recurvatum Brace.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.343+03	2024-06-26 14:36:42.343+03	1	4	{"Lightweight,"," Adjustable, posterior pressure pad,"," Improves joint function"," Improves ambulation"," Permits knee flexion, restricts extension"}	{" Knee hyperextension, genu recurvatum"}	Move
9	Mallet Finger Splint	\N	\N	{"../../../../uploads/products/2-upperLimb/Mallet Finger Splint.jpg"}	\N	t	Short & Long	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	9	{" Immobilization and protection of injured fingers for faster healing."," Keeps interphalangeal joints in the right position."}	{" Mallet fingers"," Osteoarthritis"," Finger stiffness"," Finger sprain"," Finger fracture"}	Move
45	Dennis Brown Splint	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Dennis Brown Splint.jpg"}	\N	t	Bar: 6 - 12 inches , Sandal: 14 to 24	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	8	{"Made of highly durable components."," The splint is equipped with wing nuts to allow individual abduction of each foot."," Ankle strap to ensure that the heel fits inside the shoes."," Sandal is made of high quality leather."}	{"Congenital Talipes Equinovarus."," Tibia vara."}	Move
48	Flat Foot Shoes	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Flat Foot Shoes.jpg"}	\N	t	14 to 34	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"Specially designed handmade shoes for flat foot."," Produced with premium quality soft leather."," Secured arch support."," High neck to secure stability."," Straight outside heel."}	{"Correction of flat foot & genu-valgus."," Improves foot balance & minimizes pronation."}	Move
54	Corner Chair	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Corner Chair.jpg"}	\N	t	35 - 40 - 45 -50 & 60 cm	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"To provide external support for children with inadequate control of the neck, head & trunk who are inclined to fall sideways or back if they overstretch."}	{"Cerebral Palsy"}	Move
13	Philadelphia Collar	\N	\N	{"../../../../uploads/products/1-spin2&neck/Philadelphia Collar.jpg"}	\N	t	S to XL (2.25; 3.25; 4.25; 525)	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" Ready-made molded latex-free foam."," Anterior & posterior rigid plastic reinforcements that limit the neck movement."," Frontal trachea opening to alleviate heat & moisture."," The collar maintains the head in neutral position & supports occipital & mandibular areas."}	{" Degenerative disc diseases."," Immobilization after trauma or surgery."," Spinal stenosis. "," Spondylolisthesis."}	Move
129	Cold Cure Cervical Pillow	1	\N	{"../../../../uploads/products/5-Lifestyle/Cold Cure Cervical Pillow.jpg"}	0	t	One Size	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	2	{" Made of cold cure foam with cotton cover."}	{"Improves sleep.","Alleviates headache & other problems resulted from inadequate sleep."}	Move
91	Cast Boot	1	\N	{"../../../../uploads/products/3-lowerLimb/Cast Boot.jpg"}	0	t	S to XXL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	5	{"Ribbed, non-skid sole."," Upper contact closure straps for ease of application & removal."," Open toes & heel for comfort & breathability."}	{" Lower leg casted fractures."}	Move
49	Hip Abduction Splint	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Hip Abduction Splint.jpg"}	\N	t	XS to XL	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"High quality polypropylene material."}	{"Developmental Dysplasia of the hip."}	Move
97	Rocking Diabetic Sandal	1	\N	{"../../../../uploads/products/3-lowerLimb/Rocking Diabetic Sandal .jpg"}	0	t	S to XXL	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{" Rigid, non-slip rocker sole."," Breathable, washable & micro-perforated fabric with 2 Velcro straps."}	{" Diabetic foot as it distributes plantar surface pressure & reduces pain."," Hallux valgus surgery."," Hammer toe surgery."," Morton Neuroma surgery."," Toe fractures."}	Move
98	Diabetic Shoes "Leather" "Gold	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes Leather Gold.jpg"}	0	t	38 to 49	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{" Wide, non-slip shock absorber sole."," Well cushioned with Velcro closure strap for easy fitting & foot deformities accommodation."," Made of leather and mesh for maximum comfort and areation."}	{" Diabetic foot as it distributes plantar surface pressure & reduces pain."," Hallux valgus"," Hammer Toes"," Post-operative rehabilitation."}	Move
99	Diabetic Shoes with Side Velcro	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes with Side Velcro.jpg"}	0	t	38 to 46	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{" Wide, non-slip shock absorber sole."," Well cushioned with Velcro closure strap for easy fitting & foot deformities accommodation."," Made of high quality material for maximum comfort and fast healing."}	{" Diabetic foot as it distributes plantar surface pressure & reduces pain."," Hallux valgus"," Hammer Toes"," Post-operative rehabilitation."}	Move
102	Diabetic Slipper	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Slipper.jpg"}	0	t	37 to 46	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{" Wide , non-slip shock absorber sole."," Well cushioned with velcro closure straps for easy fitting & foot deformities."," Open design for areation."}	{"Diabetic Foot"}	Move
95	Offloading Shoes (Metatarsal)	1	\N	{"../../../../uploads/products/3-lowerLimb/Offloading Shoes (Metatarsal).jpg"}	0	t	XS to XL	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"Square toe design."," Ankle strap that holds foot firmly in shoe."," Removable forefoot closure straps."," Non-slip, rigid rocker sole."}	{" Relieve pressure on ulcerated areas of the forefoot during the treatment of diabetic foot ulcers to allow healing."}	Move
101	Diabetic Sandal	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Sandal.jpg"}	0	t	30 to 50	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{" Made of high quality material for maximum comfort and fast healing."," Open design padded with foam & wide shock absorber sole."," Extra depth footwear with wide Velcro closure strap."}	{" Accommodates foot deformities."," Diabetic foot as it distributes plantar surface pressure & reduces pain."," Hallux valgus"," Hammer toes."," Metatarsalgia"}	Move
103	Diabetic Insole	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Insole.jpg"}	0	t	38 to 46	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{" Specific custom made insole made by foot print system to redistribute pressure anf off load pressure from the ulcer site"}	{"Diabetic Ulcers"}	Move
104	Diabetic Sports Shoes (D-200)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Sports Shoes (D-200).jpg"}	0	t	36 to 41	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}	{"Diabetic Foot"}	Move
73	Knee Ankle Foot Orthosis	\N	\N	{"../../../../uploads/products/8-Orthoses/Knee Ankle Foot Orthosis.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.343+03	2024-06-26 14:36:42.343+03	1	4	{"High quality polypropylene material","It improves leg alignment and posture in normal position, increases bone and muscle strength."}	{" Knee Instability.","Hip, knee & ankle muscle weakness.","Knee contracture","Knee hyperextension"," Foot and ankle control"}	Move
46	Bebax	\N	\N	{../../../../uploads/products/4-PediatricProducts/Bebax.jpg}	\N	t	7.5,8,8.5,10,10.5,11.5,12,12.5,13.5	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{" For the first time - made in Egypt by Orthomedics."," Lightweight alternative to casting or splints, hence eliminates skin problems commonly associated with casting."," Has multi-directional hinge that is quickly & easily adjusted to adjust the forefoot in the desired position."," Provides serial casting & contact moulding to forefoot & heel without plaster."}	{"Congenital forefoot deformities e.g. Metatarsus Varus & Pes Valgus"," Prevents retraction due to muscular or neurological disorders."}	Move
17	Rib Belt	\N	\N	{"../../../../uploads/products/1-spin2&neck/Rib Belt.jpg"}	\N	t	S to XXXL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" High grade elastic material."," Extra Velcro closure."}	{" Fractured or bruised rib."," Intercostal muscle strains."}	Move
94	Offloading Shoes (Heel Off)	1	\N	{"../../../../uploads/products/3-lowerLimb/Offloading Shoes (Heel Off).jpg"}	0	t	XS to XL	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"Square toe design."," Ankle strap that holds foot firmly in shoe to reduce heel slippage & eliminate friction."," Removable forefoot closure straps."," Non-slip, rigid rocker sole."}	{"Relieve pressure on ulcerated areas of the heel during the treatment of diabetic foot ulcers to allow healing."}	Move
69	Fracture Elbow Orthosis	\N	\N	{"../../../../uploads/products/8-Orthoses/Fracture Elbow Orthosis.jpg"}	\N	t	One Size	2024-06-26 14:36:42.343+03	2024-06-26 14:36:42.343+03	1	4	{"Protect your forearm, elbow and upper arm after injury or surgery.","This splint provides comfort and secures immobilization of your elbow at 90-degree angle.","For progressive rehabilitation after ligament injuries and tears"}	{"Broken elbow.","Distal humerus fracture.","Proximal ulnar fracture After Elbow surgery."," Elbow hyperextension."}	Move
110	Diabetic Shoes (D-80)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-80).jpg"}	0	t	36 to 41	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Comfortable velcro fasteners"}	{"Diabetic Foot"}	Move
112	Diabetic Shoes (D-50)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-50).jpg"}	0	t	36 to 41	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Comfortable velcro fasteners.","4- Wide toe-box and stretchable upper part To alleviate foot and toe pressures"}	{Bunion}	Move
114	Orthotic High - Neck Shoes (H-10)	1	\N	{"../../../../uploads/products/3-lowerLimb/Orthotic High - Neck Shoes (H-10).jpg"}	0	t	39 to 45	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}	{"Diabetic Foot"}	Move
115	Orthotic High - Neck Shoes (H-20)	1	\N	{"../../../../uploads/products/3-lowerLimb/Orthotic High - Neck Shoes (H-20).jpg"}	0	t	39 to 45	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}	{"Diabetic Foot"}	Move
116	Diabetic Shoes (D-70)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-70).jpg"}	0	t	39 to 45	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}	{"Diabetic Foot"}	Move
118	Diabetic Shoes (D-30)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-30).jpg"}	0	t	36 to 41	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}	{"Diabetic Foot"}	Move
119	Orthotic High - Neck Shoes (O -20)	1	\N	{"../../../../uploads/products/3-lowerLimb/Orthotic High - Neck Shoes (O -20).jpg"}	0	t	36 to 41	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}	{"Diabetic Foot"}	Move
120	Orthopedic High - Neck Shoes (H-70)	1	\N	{"../../../../uploads/products/3-lowerLimb/Orthopedic High - Neck Shoes (H-70).jpg"}	0	t	33 to 38	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}	{"Diabetic Foot"}	Move
121	Diabetic Sports Shoes (D-100)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Sports Shoes (D-100).jpg"}	0	t	39 to 45	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}	{"Diabetic Foot"}	Move
51	Sitting, Walking, Standing Hip Abduction	\N	\N	{../../../../uploads/products/4-PediatricProducts/Sitting,Walking,"Standing Hip Abduction.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"High quality polypropylene material"}	{"Developmental Dysplasia of the hip."}	Move
107	Diabetic Shoes (D-10)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-10).jpg"}	0	t	40 to 45	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}	{"Diabetic Foot"}	Move
109	Diabetic Shoes (D-20)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-20).jpg"}	0	t	39 to 45	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}	{"Diabetic Foot"}	Move
111	Diabetic Shoes (D-90)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-90).jpg"}	0	t	36 to 41	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}	{"Diabetic Foot"}	Move
113	Diabetic Shoes (D-60)	1	\N	{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-60).jpg"}	0	t	36 to 41	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Comfortable velcro fasteners"}	{"Diabetic Foot"}	Move
117	Orthopedic High - Neck Shoes (H-30)	1	\N	{"../../../../uploads/products/3-lowerLimb/Orthopedic High - Neck Shoes (H-30).jpg"}	0	t	39 to 45	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}	{"Diabetic Foot"}	Move
11	Hard Cervical Collar	\N	\N	{"../../../../uploads/products/1-spin2&neck/Hard Cervical Collar.jpg"}	\N	t	S to XL	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	7	{" Made of rigid plastic."," The collar height & length can be easily adjusted by Velcro straps."," Well ventilated for enhanced comfort."}	{" Cervical spine immobilization."," Post-operative discectomy & cervical vertebrae fusion."," Neck injuries."," Degenerative diseases of cervical vertebrae."}	Move
123	Orthopedic High - Neck Shoes (H-50)	1	\N	{"../../../../uploads/products/3-lowerLimb/Orthopedic High - Neck Shoes (H-50).jpg"}	0	t	39 to 45	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}	{"Diabetic Foot"}	Move
125	Heel Lift	1	\N	{"../../../../uploads/products/3-lowerLimb/Heel lift.JPG"}	0	t	One Size	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{" Pressure offloading device"," Padded internally by velvet cotton material"," Externally made of Iycra fabric padded with sponge."," 3 Velcro straps for easy fit"}	{"Management of heel pressure ulcers"}	Move
24	Arch Flat Foot Insoles - Adult	\N	\N	{"../../../../uploads/products/6-silicone/Arch Flat Foot Insoles - Pediatrics.jpg"}	0	t	S to XL	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{"Top quality, German, & non-toxic silicone materials.","Provide comfortable arch support.","Lifting for both high arch & flat foot.","Reduce pressure & stabilize the arch."}	{"Flat Foot"}	Move
78	Total Body Support Orthosis	\N	\N	{"../../../../uploads/products/8-Orthoses/Total Body Support Orthosis.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	4	{"High quality polypropylene material."," It improves body alignment and posture."," It increases bone and muscle strength."}	{" Whole body instability & muscle weakness."}	Move
68	Humeral Fracture Brace	\N	\N	{"../../../../uploads/products/8-Orthoses/Humeral Fracture Brace.jpg"}	\N	t	S to XXL	2024-06-26 14:36:42.343+03	2024-06-26 14:36:42.343+03	1	4	{"Two-part medial/lateral construction increases circumferential compression.","Plastic deltoid extension adds protection and helps prevent distal migration."}	{"Management of mid-shaft and distal third humeral fractures."}	Move
2	Elbow Orthosis	\N	\N	{"../../../../uploads/products/2-upperLimb/Elbow Orthosis.jpg"}	\N	t	One Size	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	9	{" Lightweight design provides static adjustable stretch of the elbow in flexion & extension."," Calibrated control knob easy to read & assists in monitoring therapy progress."," Manufactured from rigid polyethylene laminated shells lined with foam."," Velcro straps closure system."}	{" Fracture dislocation elbow. "," Biceps / triceps tendon rupture."," Elbow arthroplasty."," Ligament repair."}	Move
7	Wrist & Thumb Support	\N	\N	{"../../../../uploads/products/2-upperLimb/Wrist Support-2.png"}	\N	t	S to XXL - RT & LT	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	9	{" Soft, breathable elastic material."," Dual removable stays supporting the palmar surface of wrist & the thumb."," Adjustable Velcro closure straps."}	{" De Quervain's Syndrome."," Tendonitis."," Thumb strains or sprains."," Post-cast removal."}	Move
8	Tennis Elbow	\N	\N	{"../../../../uploads/products/2-upperLimb/Tennis Elbow.jpg"}	\N	t	XS to XXL	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	9	{"High grade neoprene"}	{" Lateral epicondylitis (Tennis elbow)."," Medial epicondylitis (Golfer's elbow)."," Bursitis."," Elbow strain, sprain."," Tendonitis."}	Move
50	Above Knee Splint	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Above Knee Splint.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"High quality polypropylene material"}	{"Cerebral Palsy","Muscle weakness"}	Move
25	Arch Flat Foot Insoles - Pediatrics	1	\N	{"../../../../uploads/products/6-silicone/Arch Flat Foot Insoles - Adult.jpg"}	0	t	XS to XL	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{"Top quality, German, & non-toxic silicone materials.","Provide comfortable arch support.","Lifting for both high arch & flat foot.","Reduce pressure & stabilize the arch."}	{"Flat Foot"}	Move
132	Pediatric Shoes (P - 20)	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 20).jpg"}	\N	t	23 to 32	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"1- Manufactured from high quality leather to support foot & ankle.","2- Open design to make the product more comfortable to wear.","3- Open design to reduce moisture & sweating.","4- Convenient buckle system to secure fixation.","5- High rigid neck for ankle support.","6- Non - slippery outsole that secures safety & durability.","7 - Available in different cheerful colors for kids."}	{"Pediatric Foot Deformity"}	Move
44	Pavlik Harness	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Pavlik Harness.jpg"}	\N	t	XS to L	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	8	{" Soft padded straps."," Strong cotton webbing with comfort padding."," Hook & loop fastening straps."," Soft cotton bootees."}	{"Correct the developmental dysplasia of the hip from birth to 6 months of age."}	Move
124	Orthopedic High - Neck Shoes (H-60)	1	\N	{"../../../../uploads/products/3-lowerLimb/Orthopedic High - Neck Shoes (H-60).jpg"}	0	t	39 to 45	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}	{"Diabetic Foot"}	Move
67	Tibial Fracture Brace	\N	\N	{"../../../../uploads/products/8-Orthoses/Tibial Fracture Brace.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.341+03	2024-06-26 14:36:42.341+03	1	4	{" Foam lined polypropylene brace, that provides intimate contact needed for effective support of tibial fractures and aids in healing and alignment of an injured bone."}	{"Fracture of Tibia"}	Move
77	Taylor Spinal Brace	\N	\N	{"../../../../uploads/products/8-Orthoses/Taylor Spinal Brace.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	4	{" Durable, light weight rigid splints that provide effective immobilization & cover the dorsal, thoracic, lumbar & sacral parts."," Adjustable shoulder straps that correct the shoulder posture.,"," Maintains the spine in neutral position and allows accurate posture correction."}	{" Thoraco-Iumbar injuries & intervertebral disc problems."," Supports weak dorsolumbar spine, post-operative rehabilitation, and osteoporosis."," Supports thoracic vertebrae fracture."," Any indication requiring dorso-Iumbar immobilizations"}	Move
61	Pediatric Shoes (P - 80)	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 80).jpg"}	\N	t	23 to 32	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"1- Manufactured from high quality leather to support foot & ankle.","2- Open design to make the product more comfortable to wear.","3- Open design to reduce moisture & sweating.","4- Convenient buckle system to secure fixation.","5- High rigid neck for ankle support.","6- Non - slippery outsole that secures safety & durability.","7 - Available in different cheerful colors for kids."}	{"Pediatric Foot Deformity"}	Move
65	Pediatric Shoes (P - 90)	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 90).jpg"}	\N	t	23 to 32	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"1- Manufactured from high quality leather.","2- High rigid neck for ankle support.","3- Rubber, non - slippery outsole for safety & durability, to absorb shocks and reduce pain during playing & daily activities.","4- Straight last sole to keep the foot in normal position for more support & control.","5- Lacing to allow secure fixation.","6- Available in a different cheerful colors & stylish design for more comfort & confidence."}	{"Pediatric Foot Deformity"}	Move
42	Elastic Wrist Support	\N	\N	{"../../../../uploads/products/7-Elastic/Elastic Wrist Support.jpg"}	\N	t	M to 3XL	2024-06-26 14:36:42.348+03	2024-06-26 14:36:42.348+03	1	6	{"Wraparound breathable support","Leads to thermo-compression & ankle stabilization.","Smart design which allows perfect customized adaptation to the patient.","Wearable in shoes & during simple activities."}	{"Ankle sprains & strains","Soft tissue injuries"}	Move
105	Orthotic High - Neck Shoes (O-10)	1	\N	{"../../../../uploads/products/3-lowerLimb/Orthotic High - Neck Shoes (O-10).jpg"}	0	t	36 to 42	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{"1- Manufactured from high quality leather."," 2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}	{"Diabetic Foot"}	Move
122	Orthopedic High - Neck Shoes (H-40)	1	\N	{"../../../../uploads/products/3-lowerLimb/Orthopedic High - Neck Shoes (H-40).jpg"}	0	t	39 to 45	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	5	{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}	{"Diabetic Foot"}	Move
26	Full Length Silicone Insoles	1	\N	{"../../../../uploads/products/6-silicone/Full Length Silicone Insoles.jpg"}	0	t	S to XL	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{"Top quality, German, & non-toxic silicone materials","Made of silicone with two different densities.","Provide relief & comfort by preventing pressure in the heel & metatarsal areas."}	{"Plantar Fasciitis",Metatarsalgia,"Flat Foot",Talalgia}	Move
27	Heel Cup	1	\N	{"../../../../uploads/products/6-silicone/Heel Cup.jpg"}	0	t	S to L	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{"Top quality, German, & non-toxic silicone materials","Made of silicone with two different densities.","Provide relief & comfort by preventing pressure in the heel & metatarsal areas."}	{"Calcanean Spur"}	Move
28	Toe Separator	1	\N	{"../../../../uploads/products/6-silicone/Toe Separator.jpg"}	0	t	S to L	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{"Top quality, German, & non-toxic silicone materials.","Straightens & aligns the big toe.","Prevents toe overlapping.","Relieves bunion pain."}	{"Hallux Valgus.","Overlapping Toes."}	Move
29	metatarsal Cushion Insoles	1	\N	{"../../../../uploads/products/6-silicone/Metatarsal Cushion Insoles.jpg"}	0	t	One Size	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{"Top quality, German, & non-toxic silicone materials.","Ensure better stress distribution.","Pain reduction at the metatarsal area by reducing the pressure & rubbing when walking.","Eliminates calluses of the foot sale."}	{Metatarsalgia}	Move
72	Cock - Up	\N	\N	{"../../../../uploads/products/8-Orthoses/Cock - Up.jpg"}	\N	t	S to 2XL - RT & LT	2024-06-26 14:36:42.343+03	2024-06-26 14:36:42.343+03	1	4	{" Immobilization of the wrist joint for restriction of motion, pain relief, joint alignment, functional support, and/ or positioning for healing."}	{" Fractures."," Nerve compressions (Carpal tunnel syndrome)."," Wrist sprains."," Tendonitis."," Arthritis."," Post-surgical conditions."}	Move
31	Toe Separator with Ring	1	\N	{"../../../../uploads/products/6-silicone/Toe Separator with Ring.jpg"}	0	t	One Size	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{"Top quality, German, & non-toxic silicone materials"," Incorporates a loop that holds the separator in place while providing protection to the other toe."}	{"Hammer Toes","Claw Toes","Mallet Toes","Toenail Injuries","Fractured Toes"}	Move
1	Adult Arm Sling	\N	\N	{"../../../../uploads/products/2-upperLimb/Arm Sling.jpg"}	\N	t	S to XXL	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	9	{" Seamless, lightweight durable materials."," Thumb loop prevents wrist drop."," Adjustable shoulder strap for ease of application & removal."}	{" Cast support to maintain the arm in the neutral position."," Injuries to the arm, Upper limb injuries."," Provides elevation, protection, immobilization & support to hand, arm & shoulder."}	Move
10	Shoulder Immobilizer	\N	\N	{"../../../../uploads/products/2-upperLimb/Shoulder Immobilizer.jpg"}	\N	t	One Size	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	9	{" Padded shoulder strap covered with breathable mesh material."," The whole product is made of soft material that does not contain hard materials such as plastics and metals."," Adjustable"," Universal: it could be used for the left and right shoulder."," Suitable for men and women use."}	{" Shoulder joint injuries & dislocation."}	Move
3	Shoulder Support	\N	\N	{"../../../../uploads/products/2-upperLimb/Shoulder Support.jpg"}	\N	t	S to XXL - RT & LT	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	9	{" Made of high quality neoprene which guarantees warmth and compression."," Adjustable elastic shoulder strap."}	{" Post shoulder dislocation."," As part of physical therapy after strains or rehabilitation program."," Sport injuries."," Arthritis."," Post-Operative."}	Move
75	Hyperextension TLSO	\N	\N	{"../../../../uploads/products/8-Orthoses/Hyperextension TLSO.jpg"}	\N	t	Custom - Made	2024-06-26 14:36:42.343+03	2024-06-26 14:36:42.343+03	1	4	{"High quality material."," Soft padding."," High quality velcro closures."}	{"Spinal Fractures"," Post operative"," Post traumatic"," Severe kyphosis"}	Move
4	Shoulder Abductor Support	\N	\N	{"../../../../uploads/products/2-upperLimb/Shoulder Abductor Support.jpg"}	\N	t	One Size	2024-06-26 14:36:42.344+03	2024-06-26 14:36:42.344+03	1	9	{" High density foam cushion that provides 15 degrees of abduction for optimal support."," Adjustable waist strap."," Padded shoulder strap covered with breathable mesh material."}	{" Shoulder dislocation & subluxation."}	Move
47	Talipes Shoes	\N	\N	{"../../../../uploads/products/4-PediatricProducts/Talipes Shoes.jpg"}	\N	t	14 to 40	2024-06-26 14:36:42.345+03	2024-06-26 14:36:42.345+03	1	8	{"Specially designed handmade shoes for Talipes Equinovarus."," Produced with premium quality soft leather."," Leather insole."," Available in black & colored models."}	{"Congenital Talipes Equinovarus"}	Move
19	Thoracolumbar Support	\N	\N	{"../../../../uploads/products/1-spin2&neck/Thoracolumbar Support.jpg"}	\N	t	S to 4XL	2024-06-26 14:36:42.347+03	2024-06-26 14:36:42.347+03	1	7	{" High grade elastic material lined with cotton."," Extra X-shaped wide straps for additional support."," 4 posterior metallic stays to support the thoracolumbar zone."," 2 anterior metallic stays for abdominal support."," Contact closures for additional support."," Grade 2+ straps guarantee high quality and durability."}	{" Lumbar & lower thoracic spine strains & sprains."," Mild osteoporosis."," Posture control. "," Compression fractures."}	Move
33	Heel Cup - Lateral	1	\N	{"../../../../uploads/products/6-silicone/Heel Cup - Lateral.jpg"}	0	t	S to L	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{"German, high - grade, hypo-allergic silicone material."}	{"Heel pain.","Calceneal spur."}	Move
35	Big Toe Protector with Ring	1	\N	{"../../../../uploads/products/6-silicone/Big Toe Protector with Ring.jpg"}	0	t	One Size	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{" German, high - grade, hypo-allergic silicone material."}	{Bunion,"Hallux valgus"}	Move
30	Anti - Varus / Anti - Valgus Heel Cup	1	\N	{"../../../../uploads/products/6-silicone/Anti - Varus  Anti - Valgus Heel Cup.jpg"}	0	t	M to 2XL	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{" Top quality, German, & non-toxic silicone materials."}	{"Conservative treatment of Genu-Valgus & Genu-Varum.","Heel spur.","Achilles Tendonitis."}	Move
34	Bunion Night Splint	1	\N	{"../../../../uploads/products/6-silicone/Bunion Night Splint.jpg"}	0	t	One Size - RT & LT	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{"Aligns big toe.","Ideal for treating early stage bunions.","Semi-flexible plastic provides comfortable adjustment.","Realign toe bones while sleeping."}	{Bunion,"Hallux valgus"}	Move
36	Tired Silicone Insole	\N	\N	{"../../../../uploads/products/6-silicone/Tired Silicone Insole.jpg"}	\N	t	S to XL	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{" German, high - grade, hypo-allergic silicone material."}	{Sports.,"Long standing."}	Move
32	Toe Elevator	1	\N	{"../../../../uploads/products/6-silicone/Toe Elevator.jpg"}	0	t	S to L	2024-06-26 14:36:42.35+03	2024-06-26 14:36:42.35+03	1	3	{"Top quality, German, & non-toxic silicone materials","Toe crests with loop.","Placed under the toes where they adapt anatomically"}	{"Correct toe flexion","Claw & Hammer Toes"}	Move
76	Swedish A.F.O	\N	\N	{"../../../../uploads/products/8-Orthoses/Swedish A.F.O.jpg"}	\N	t	M to L - RT & LT	2024-06-26 14:36:42.343+03	2024-06-26 14:36:42.343+03	1	4	{" Provides static dorsiflexion assistance and lateral stability for the ankle/foot area."," The low arch and open heel give a neat shape which fits into the shoes easily."}	{"Foot Drop"}	Move
96	Rocking Diabetic Shoes	1	\N	{"../../../../uploads/products/3-lowerLimb/Rocking Diabetic Shoes.jpg"}	0	t	S to XXL	2024-06-26 14:36:42.349+03	2024-06-26 14:36:42.349+03	1	5	{" Rigid, non-slip rocker sole."," Breathable, washable & micro-perforated fabric with 3 Velcro straps."}	{" Distributes plantar surface pressure."," Supports diabetic foot & reduces pain."," Hindfoot instability."," Hallux valgus surgery."," Hammer toe surgery."," Morton Neuroma surgery."," Toe fractures."}	Move
\.


--
-- Data for Name: productsIds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."productsIds" ("createdAt", "updatedAt", "purchasingOrderId", "productId") FROM stdin;
\.


--
-- Data for Name: purchasingOrders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."purchasingOrders" (id, "totalPrice", "productsIds", "paymentType", "createdAt", "updatedAt", "userId", "extraDetails", quantity) FROM stdin;
1	200	{3}	cash	2024-07-01 09:01:28.764+03	2024-07-01 09:01:28.764+03	13	testt	{"id": 3, "quantity": 6}
\.


--
-- Data for Name: sectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sectors (id, name, image, "createdAt", "updatedAt") FROM stdin;
6	Elastic	uploads/sectors/image-1719211176226-cEBtKn8iADumWJE1yfRfx6-bands.jpg	2024-06-26 02:59:27.034+03	2024-06-26 02:59:27.034+03
4	Orthoses	uploads/sectors/image-1719211229348-aUg0osrNevGYgpE9d0TbD3-Orthotics- Therapeutic Shoes.jpeg	2024-06-26 02:59:27.034+03	2024-06-26 02:59:27.034+03
3	Silicone	uploads/sectors/image-1719211246424-CO4zV1lNyt2dcYrJBx53O2-Silicone.jpg	2024-06-26 02:59:27.034+03	2024-06-26 02:59:27.034+03
2	Lifestyle	uploads/sectors/image-1719211266871-MFzPNWrThXEDhrMLxKCgf1-lifestyle.jpg	2024-06-26 02:59:27.034+03	2024-06-26 02:59:27.034+03
9	Upper Limb	uploads/sectors/image-1719211067058-PlPCuLbEh3aQmgbwae8l-8-uppderLimb.jpeg	2024-06-26 02:59:27.034+03	2024-06-26 02:59:27.034+03
8	Pediatric	uploads/sectors/image-1719211104165-2wPOYw-PrD7KiAbP3vTHr7-Pediatric.jpeg	2024-06-26 02:59:27.034+03	2024-06-26 02:59:27.034+03
5	Lower Limb	uploads/sectors/image-1719211205427-0sBhja1Sj0T-qXh0ow66v4-Modular Orthotic Joint System.jpeg	2024-06-26 02:59:27.034+03	2024-06-26 02:59:27.034+03
7	Spine & Neck	uploads/sectors/image-1719211130103-X2uDXzUK6Srew4menusF35-Spine&Neck.jpeg	2024-06-26 02:59:27.034+03	2024-06-26 02:59:27.034+03
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, name, type, description, price, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, phone, role, logout, "createdAt", "updatedAt", company, city, country, street, fax, "zipCode") FROM stdin;
1	\N	rolawafi209@outlook.com	$2b$09$gmPPAUgv2jwvTOk27twpkuqBsAXTu6wceVEceVCxJxrRa9knVaSdW	\N	admin	\N	2024-06-26 02:59:26.757+03	2024-06-26 02:59:26.757+03	\N	\N	\N	\N	\N	\N
12	\N	rolawafi209@gmail.com	$2b$09$G5rHgMU.SFvOquq9bXJkf.Np7hkLfpqehx.Gi3Y8/VAKIJtrYWpAi	\N	user	\N	2024-06-27 07:56:55.463+03	2024-06-27 07:56:55.463+03	\N	\N	\N	\N	\N	\N
13	\N	rolaahmed1807542@miuegypt.edu.eg	$2b$09$sBWFhNXkNM5DBByGvZ0zBuu/WwsvkotJaPqqJ2Y8c8IbfKZI9B3Cq	\N	user	\N	2024-06-27 08:00:52.456+03	2024-06-27 08:00:52.456+03	\N	\N	\N	\N	\N	\N
\.


--
-- Name: contactUs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."contactUs_id_seq"', 3, true);


--
-- Name: factories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factories_id_seq', 1, false);


--
-- Name: ordersProducts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ordersProducts_id_seq"', 1, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: purchasingOrders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."purchasingOrders_id_seq"', 1, true);


--
-- Name: sectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sectors_id_seq', 1, false);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- Name: contactUs contactUs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."contactUs"
    ADD CONSTRAINT "contactUs_pkey" PRIMARY KEY (id);


--
-- Name: factories factories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key UNIQUE (name);


--
-- Name: factories factories_name_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key1 UNIQUE (name);


--
-- Name: factories factories_name_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key10 UNIQUE (name);


--
-- Name: factories factories_name_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key100 UNIQUE (name);


--
-- Name: factories factories_name_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key101 UNIQUE (name);


--
-- Name: factories factories_name_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key102 UNIQUE (name);


--
-- Name: factories factories_name_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key103 UNIQUE (name);


--
-- Name: factories factories_name_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key104 UNIQUE (name);


--
-- Name: factories factories_name_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key105 UNIQUE (name);


--
-- Name: factories factories_name_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key106 UNIQUE (name);


--
-- Name: factories factories_name_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key107 UNIQUE (name);


--
-- Name: factories factories_name_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key108 UNIQUE (name);


--
-- Name: factories factories_name_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key109 UNIQUE (name);


--
-- Name: factories factories_name_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key11 UNIQUE (name);


--
-- Name: factories factories_name_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key110 UNIQUE (name);


--
-- Name: factories factories_name_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key111 UNIQUE (name);


--
-- Name: factories factories_name_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key112 UNIQUE (name);


--
-- Name: factories factories_name_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key113 UNIQUE (name);


--
-- Name: factories factories_name_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key114 UNIQUE (name);


--
-- Name: factories factories_name_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key115 UNIQUE (name);


--
-- Name: factories factories_name_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key116 UNIQUE (name);


--
-- Name: factories factories_name_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key117 UNIQUE (name);


--
-- Name: factories factories_name_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key118 UNIQUE (name);


--
-- Name: factories factories_name_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key119 UNIQUE (name);


--
-- Name: factories factories_name_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key12 UNIQUE (name);


--
-- Name: factories factories_name_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key120 UNIQUE (name);


--
-- Name: factories factories_name_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key121 UNIQUE (name);


--
-- Name: factories factories_name_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key122 UNIQUE (name);


--
-- Name: factories factories_name_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key123 UNIQUE (name);


--
-- Name: factories factories_name_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key124 UNIQUE (name);


--
-- Name: factories factories_name_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key125 UNIQUE (name);


--
-- Name: factories factories_name_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key126 UNIQUE (name);


--
-- Name: factories factories_name_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key127 UNIQUE (name);


--
-- Name: factories factories_name_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key128 UNIQUE (name);


--
-- Name: factories factories_name_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key129 UNIQUE (name);


--
-- Name: factories factories_name_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key13 UNIQUE (name);


--
-- Name: factories factories_name_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key130 UNIQUE (name);


--
-- Name: factories factories_name_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key131 UNIQUE (name);


--
-- Name: factories factories_name_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key132 UNIQUE (name);


--
-- Name: factories factories_name_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key133 UNIQUE (name);


--
-- Name: factories factories_name_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key134 UNIQUE (name);


--
-- Name: factories factories_name_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key135 UNIQUE (name);


--
-- Name: factories factories_name_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key136 UNIQUE (name);


--
-- Name: factories factories_name_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key137 UNIQUE (name);


--
-- Name: factories factories_name_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key138 UNIQUE (name);


--
-- Name: factories factories_name_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key139 UNIQUE (name);


--
-- Name: factories factories_name_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key14 UNIQUE (name);


--
-- Name: factories factories_name_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key140 UNIQUE (name);


--
-- Name: factories factories_name_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key141 UNIQUE (name);


--
-- Name: factories factories_name_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key142 UNIQUE (name);


--
-- Name: factories factories_name_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key143 UNIQUE (name);


--
-- Name: factories factories_name_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key144 UNIQUE (name);


--
-- Name: factories factories_name_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key145 UNIQUE (name);


--
-- Name: factories factories_name_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key146 UNIQUE (name);


--
-- Name: factories factories_name_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key147 UNIQUE (name);


--
-- Name: factories factories_name_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key148 UNIQUE (name);


--
-- Name: factories factories_name_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key149 UNIQUE (name);


--
-- Name: factories factories_name_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key15 UNIQUE (name);


--
-- Name: factories factories_name_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key150 UNIQUE (name);


--
-- Name: factories factories_name_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key151 UNIQUE (name);


--
-- Name: factories factories_name_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key152 UNIQUE (name);


--
-- Name: factories factories_name_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key153 UNIQUE (name);


--
-- Name: factories factories_name_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key154 UNIQUE (name);


--
-- Name: factories factories_name_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key155 UNIQUE (name);


--
-- Name: factories factories_name_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key156 UNIQUE (name);


--
-- Name: factories factories_name_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key157 UNIQUE (name);


--
-- Name: factories factories_name_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key158 UNIQUE (name);


--
-- Name: factories factories_name_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key159 UNIQUE (name);


--
-- Name: factories factories_name_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key16 UNIQUE (name);


--
-- Name: factories factories_name_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key160 UNIQUE (name);


--
-- Name: factories factories_name_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key161 UNIQUE (name);


--
-- Name: factories factories_name_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key162 UNIQUE (name);


--
-- Name: factories factories_name_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key163 UNIQUE (name);


--
-- Name: factories factories_name_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key164 UNIQUE (name);


--
-- Name: factories factories_name_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key165 UNIQUE (name);


--
-- Name: factories factories_name_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key166 UNIQUE (name);


--
-- Name: factories factories_name_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key167 UNIQUE (name);


--
-- Name: factories factories_name_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key168 UNIQUE (name);


--
-- Name: factories factories_name_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key169 UNIQUE (name);


--
-- Name: factories factories_name_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key17 UNIQUE (name);


--
-- Name: factories factories_name_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key170 UNIQUE (name);


--
-- Name: factories factories_name_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key171 UNIQUE (name);


--
-- Name: factories factories_name_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key172 UNIQUE (name);


--
-- Name: factories factories_name_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key173 UNIQUE (name);


--
-- Name: factories factories_name_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key174 UNIQUE (name);


--
-- Name: factories factories_name_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key175 UNIQUE (name);


--
-- Name: factories factories_name_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key176 UNIQUE (name);


--
-- Name: factories factories_name_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key177 UNIQUE (name);


--
-- Name: factories factories_name_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key178 UNIQUE (name);


--
-- Name: factories factories_name_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key179 UNIQUE (name);


--
-- Name: factories factories_name_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key18 UNIQUE (name);


--
-- Name: factories factories_name_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key180 UNIQUE (name);


--
-- Name: factories factories_name_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key181 UNIQUE (name);


--
-- Name: factories factories_name_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key182 UNIQUE (name);


--
-- Name: factories factories_name_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key183 UNIQUE (name);


--
-- Name: factories factories_name_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key184 UNIQUE (name);


--
-- Name: factories factories_name_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key185 UNIQUE (name);


--
-- Name: factories factories_name_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key186 UNIQUE (name);


--
-- Name: factories factories_name_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key187 UNIQUE (name);


--
-- Name: factories factories_name_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key188 UNIQUE (name);


--
-- Name: factories factories_name_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key189 UNIQUE (name);


--
-- Name: factories factories_name_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key19 UNIQUE (name);


--
-- Name: factories factories_name_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key190 UNIQUE (name);


--
-- Name: factories factories_name_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key191 UNIQUE (name);


--
-- Name: factories factories_name_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key192 UNIQUE (name);


--
-- Name: factories factories_name_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key193 UNIQUE (name);


--
-- Name: factories factories_name_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key194 UNIQUE (name);


--
-- Name: factories factories_name_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key195 UNIQUE (name);


--
-- Name: factories factories_name_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key196 UNIQUE (name);


--
-- Name: factories factories_name_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key197 UNIQUE (name);


--
-- Name: factories factories_name_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key198 UNIQUE (name);


--
-- Name: factories factories_name_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key199 UNIQUE (name);


--
-- Name: factories factories_name_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key2 UNIQUE (name);


--
-- Name: factories factories_name_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key20 UNIQUE (name);


--
-- Name: factories factories_name_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key200 UNIQUE (name);


--
-- Name: factories factories_name_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key201 UNIQUE (name);


--
-- Name: factories factories_name_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key202 UNIQUE (name);


--
-- Name: factories factories_name_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key203 UNIQUE (name);


--
-- Name: factories factories_name_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key204 UNIQUE (name);


--
-- Name: factories factories_name_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key205 UNIQUE (name);


--
-- Name: factories factories_name_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key206 UNIQUE (name);


--
-- Name: factories factories_name_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key207 UNIQUE (name);


--
-- Name: factories factories_name_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key208 UNIQUE (name);


--
-- Name: factories factories_name_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key209 UNIQUE (name);


--
-- Name: factories factories_name_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key21 UNIQUE (name);


--
-- Name: factories factories_name_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key210 UNIQUE (name);


--
-- Name: factories factories_name_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key211 UNIQUE (name);


--
-- Name: factories factories_name_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key212 UNIQUE (name);


--
-- Name: factories factories_name_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key213 UNIQUE (name);


--
-- Name: factories factories_name_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key214 UNIQUE (name);


--
-- Name: factories factories_name_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key215 UNIQUE (name);


--
-- Name: factories factories_name_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key216 UNIQUE (name);


--
-- Name: factories factories_name_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key217 UNIQUE (name);


--
-- Name: factories factories_name_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key218 UNIQUE (name);


--
-- Name: factories factories_name_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key219 UNIQUE (name);


--
-- Name: factories factories_name_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key22 UNIQUE (name);


--
-- Name: factories factories_name_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key220 UNIQUE (name);


--
-- Name: factories factories_name_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key221 UNIQUE (name);


--
-- Name: factories factories_name_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key222 UNIQUE (name);


--
-- Name: factories factories_name_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key223 UNIQUE (name);


--
-- Name: factories factories_name_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key224 UNIQUE (name);


--
-- Name: factories factories_name_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key225 UNIQUE (name);


--
-- Name: factories factories_name_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key226 UNIQUE (name);


--
-- Name: factories factories_name_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key227 UNIQUE (name);


--
-- Name: factories factories_name_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key228 UNIQUE (name);


--
-- Name: factories factories_name_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key229 UNIQUE (name);


--
-- Name: factories factories_name_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key23 UNIQUE (name);


--
-- Name: factories factories_name_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key230 UNIQUE (name);


--
-- Name: factories factories_name_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key231 UNIQUE (name);


--
-- Name: factories factories_name_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key232 UNIQUE (name);


--
-- Name: factories factories_name_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key233 UNIQUE (name);


--
-- Name: factories factories_name_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key234 UNIQUE (name);


--
-- Name: factories factories_name_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key235 UNIQUE (name);


--
-- Name: factories factories_name_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key236 UNIQUE (name);


--
-- Name: factories factories_name_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key237 UNIQUE (name);


--
-- Name: factories factories_name_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key238 UNIQUE (name);


--
-- Name: factories factories_name_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key239 UNIQUE (name);


--
-- Name: factories factories_name_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key24 UNIQUE (name);


--
-- Name: factories factories_name_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key240 UNIQUE (name);


--
-- Name: factories factories_name_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key241 UNIQUE (name);


--
-- Name: factories factories_name_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key242 UNIQUE (name);


--
-- Name: factories factories_name_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key243 UNIQUE (name);


--
-- Name: factories factories_name_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key244 UNIQUE (name);


--
-- Name: factories factories_name_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key245 UNIQUE (name);


--
-- Name: factories factories_name_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key246 UNIQUE (name);


--
-- Name: factories factories_name_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key247 UNIQUE (name);


--
-- Name: factories factories_name_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key248 UNIQUE (name);


--
-- Name: factories factories_name_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key249 UNIQUE (name);


--
-- Name: factories factories_name_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key25 UNIQUE (name);


--
-- Name: factories factories_name_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key250 UNIQUE (name);


--
-- Name: factories factories_name_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key251 UNIQUE (name);


--
-- Name: factories factories_name_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key252 UNIQUE (name);


--
-- Name: factories factories_name_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key253 UNIQUE (name);


--
-- Name: factories factories_name_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key254 UNIQUE (name);


--
-- Name: factories factories_name_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key255 UNIQUE (name);


--
-- Name: factories factories_name_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key256 UNIQUE (name);


--
-- Name: factories factories_name_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key257 UNIQUE (name);


--
-- Name: factories factories_name_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key258 UNIQUE (name);


--
-- Name: factories factories_name_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key259 UNIQUE (name);


--
-- Name: factories factories_name_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key26 UNIQUE (name);


--
-- Name: factories factories_name_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key260 UNIQUE (name);


--
-- Name: factories factories_name_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key261 UNIQUE (name);


--
-- Name: factories factories_name_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key262 UNIQUE (name);


--
-- Name: factories factories_name_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key263 UNIQUE (name);


--
-- Name: factories factories_name_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key264 UNIQUE (name);


--
-- Name: factories factories_name_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key265 UNIQUE (name);


--
-- Name: factories factories_name_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key266 UNIQUE (name);


--
-- Name: factories factories_name_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key267 UNIQUE (name);


--
-- Name: factories factories_name_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key268 UNIQUE (name);


--
-- Name: factories factories_name_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key269 UNIQUE (name);


--
-- Name: factories factories_name_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key27 UNIQUE (name);


--
-- Name: factories factories_name_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key270 UNIQUE (name);


--
-- Name: factories factories_name_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key271 UNIQUE (name);


--
-- Name: factories factories_name_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key272 UNIQUE (name);


--
-- Name: factories factories_name_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key273 UNIQUE (name);


--
-- Name: factories factories_name_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key274 UNIQUE (name);


--
-- Name: factories factories_name_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key275 UNIQUE (name);


--
-- Name: factories factories_name_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key276 UNIQUE (name);


--
-- Name: factories factories_name_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key277 UNIQUE (name);


--
-- Name: factories factories_name_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key278 UNIQUE (name);


--
-- Name: factories factories_name_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key279 UNIQUE (name);


--
-- Name: factories factories_name_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key28 UNIQUE (name);


--
-- Name: factories factories_name_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key280 UNIQUE (name);


--
-- Name: factories factories_name_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key281 UNIQUE (name);


--
-- Name: factories factories_name_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key282 UNIQUE (name);


--
-- Name: factories factories_name_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key283 UNIQUE (name);


--
-- Name: factories factories_name_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key284 UNIQUE (name);


--
-- Name: factories factories_name_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key285 UNIQUE (name);


--
-- Name: factories factories_name_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key286 UNIQUE (name);


--
-- Name: factories factories_name_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key287 UNIQUE (name);


--
-- Name: factories factories_name_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key288 UNIQUE (name);


--
-- Name: factories factories_name_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key289 UNIQUE (name);


--
-- Name: factories factories_name_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key29 UNIQUE (name);


--
-- Name: factories factories_name_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key290 UNIQUE (name);


--
-- Name: factories factories_name_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key291 UNIQUE (name);


--
-- Name: factories factories_name_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key292 UNIQUE (name);


--
-- Name: factories factories_name_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key293 UNIQUE (name);


--
-- Name: factories factories_name_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key294 UNIQUE (name);


--
-- Name: factories factories_name_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key295 UNIQUE (name);


--
-- Name: factories factories_name_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key296 UNIQUE (name);


--
-- Name: factories factories_name_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key297 UNIQUE (name);


--
-- Name: factories factories_name_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key298 UNIQUE (name);


--
-- Name: factories factories_name_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key299 UNIQUE (name);


--
-- Name: factories factories_name_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key3 UNIQUE (name);


--
-- Name: factories factories_name_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key30 UNIQUE (name);


--
-- Name: factories factories_name_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key300 UNIQUE (name);


--
-- Name: factories factories_name_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key301 UNIQUE (name);


--
-- Name: factories factories_name_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key302 UNIQUE (name);


--
-- Name: factories factories_name_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key303 UNIQUE (name);


--
-- Name: factories factories_name_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key304 UNIQUE (name);


--
-- Name: factories factories_name_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key305 UNIQUE (name);


--
-- Name: factories factories_name_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key306 UNIQUE (name);


--
-- Name: factories factories_name_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key307 UNIQUE (name);


--
-- Name: factories factories_name_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key308 UNIQUE (name);


--
-- Name: factories factories_name_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key309 UNIQUE (name);


--
-- Name: factories factories_name_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key31 UNIQUE (name);


--
-- Name: factories factories_name_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key310 UNIQUE (name);


--
-- Name: factories factories_name_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key311 UNIQUE (name);


--
-- Name: factories factories_name_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key312 UNIQUE (name);


--
-- Name: factories factories_name_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key313 UNIQUE (name);


--
-- Name: factories factories_name_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key314 UNIQUE (name);


--
-- Name: factories factories_name_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key315 UNIQUE (name);


--
-- Name: factories factories_name_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key316 UNIQUE (name);


--
-- Name: factories factories_name_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key317 UNIQUE (name);


--
-- Name: factories factories_name_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key318 UNIQUE (name);


--
-- Name: factories factories_name_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key319 UNIQUE (name);


--
-- Name: factories factories_name_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key32 UNIQUE (name);


--
-- Name: factories factories_name_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key320 UNIQUE (name);


--
-- Name: factories factories_name_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key321 UNIQUE (name);


--
-- Name: factories factories_name_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key322 UNIQUE (name);


--
-- Name: factories factories_name_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key323 UNIQUE (name);


--
-- Name: factories factories_name_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key324 UNIQUE (name);


--
-- Name: factories factories_name_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key325 UNIQUE (name);


--
-- Name: factories factories_name_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key326 UNIQUE (name);


--
-- Name: factories factories_name_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key327 UNIQUE (name);


--
-- Name: factories factories_name_key328; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key328 UNIQUE (name);


--
-- Name: factories factories_name_key329; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key329 UNIQUE (name);


--
-- Name: factories factories_name_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key33 UNIQUE (name);


--
-- Name: factories factories_name_key330; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key330 UNIQUE (name);


--
-- Name: factories factories_name_key331; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key331 UNIQUE (name);


--
-- Name: factories factories_name_key332; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key332 UNIQUE (name);


--
-- Name: factories factories_name_key333; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key333 UNIQUE (name);


--
-- Name: factories factories_name_key334; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key334 UNIQUE (name);


--
-- Name: factories factories_name_key335; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key335 UNIQUE (name);


--
-- Name: factories factories_name_key336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key336 UNIQUE (name);


--
-- Name: factories factories_name_key337; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key337 UNIQUE (name);


--
-- Name: factories factories_name_key338; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key338 UNIQUE (name);


--
-- Name: factories factories_name_key339; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key339 UNIQUE (name);


--
-- Name: factories factories_name_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key34 UNIQUE (name);


--
-- Name: factories factories_name_key340; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key340 UNIQUE (name);


--
-- Name: factories factories_name_key341; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key341 UNIQUE (name);


--
-- Name: factories factories_name_key342; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key342 UNIQUE (name);


--
-- Name: factories factories_name_key343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key343 UNIQUE (name);


--
-- Name: factories factories_name_key344; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key344 UNIQUE (name);


--
-- Name: factories factories_name_key345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key345 UNIQUE (name);


--
-- Name: factories factories_name_key346; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key346 UNIQUE (name);


--
-- Name: factories factories_name_key347; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key347 UNIQUE (name);


--
-- Name: factories factories_name_key348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key348 UNIQUE (name);


--
-- Name: factories factories_name_key349; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key349 UNIQUE (name);


--
-- Name: factories factories_name_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key35 UNIQUE (name);


--
-- Name: factories factories_name_key350; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key350 UNIQUE (name);


--
-- Name: factories factories_name_key351; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key351 UNIQUE (name);


--
-- Name: factories factories_name_key352; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key352 UNIQUE (name);


--
-- Name: factories factories_name_key353; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key353 UNIQUE (name);


--
-- Name: factories factories_name_key354; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key354 UNIQUE (name);


--
-- Name: factories factories_name_key355; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key355 UNIQUE (name);


--
-- Name: factories factories_name_key356; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key356 UNIQUE (name);


--
-- Name: factories factories_name_key357; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key357 UNIQUE (name);


--
-- Name: factories factories_name_key358; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key358 UNIQUE (name);


--
-- Name: factories factories_name_key359; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key359 UNIQUE (name);


--
-- Name: factories factories_name_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key36 UNIQUE (name);


--
-- Name: factories factories_name_key360; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key360 UNIQUE (name);


--
-- Name: factories factories_name_key361; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key361 UNIQUE (name);


--
-- Name: factories factories_name_key362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key362 UNIQUE (name);


--
-- Name: factories factories_name_key363; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key363 UNIQUE (name);


--
-- Name: factories factories_name_key364; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key364 UNIQUE (name);


--
-- Name: factories factories_name_key365; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key365 UNIQUE (name);


--
-- Name: factories factories_name_key366; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key366 UNIQUE (name);


--
-- Name: factories factories_name_key367; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key367 UNIQUE (name);


--
-- Name: factories factories_name_key368; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key368 UNIQUE (name);


--
-- Name: factories factories_name_key369; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key369 UNIQUE (name);


--
-- Name: factories factories_name_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key37 UNIQUE (name);


--
-- Name: factories factories_name_key370; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key370 UNIQUE (name);


--
-- Name: factories factories_name_key371; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key371 UNIQUE (name);


--
-- Name: factories factories_name_key372; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key372 UNIQUE (name);


--
-- Name: factories factories_name_key373; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key373 UNIQUE (name);


--
-- Name: factories factories_name_key374; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key374 UNIQUE (name);


--
-- Name: factories factories_name_key375; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key375 UNIQUE (name);


--
-- Name: factories factories_name_key376; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key376 UNIQUE (name);


--
-- Name: factories factories_name_key377; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key377 UNIQUE (name);


--
-- Name: factories factories_name_key378; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key378 UNIQUE (name);


--
-- Name: factories factories_name_key379; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key379 UNIQUE (name);


--
-- Name: factories factories_name_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key38 UNIQUE (name);


--
-- Name: factories factories_name_key380; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key380 UNIQUE (name);


--
-- Name: factories factories_name_key381; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key381 UNIQUE (name);


--
-- Name: factories factories_name_key382; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key382 UNIQUE (name);


--
-- Name: factories factories_name_key383; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key383 UNIQUE (name);


--
-- Name: factories factories_name_key384; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key384 UNIQUE (name);


--
-- Name: factories factories_name_key385; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key385 UNIQUE (name);


--
-- Name: factories factories_name_key386; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key386 UNIQUE (name);


--
-- Name: factories factories_name_key387; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key387 UNIQUE (name);


--
-- Name: factories factories_name_key388; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key388 UNIQUE (name);


--
-- Name: factories factories_name_key389; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key389 UNIQUE (name);


--
-- Name: factories factories_name_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key39 UNIQUE (name);


--
-- Name: factories factories_name_key390; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key390 UNIQUE (name);


--
-- Name: factories factories_name_key391; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key391 UNIQUE (name);


--
-- Name: factories factories_name_key392; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key392 UNIQUE (name);


--
-- Name: factories factories_name_key393; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key393 UNIQUE (name);


--
-- Name: factories factories_name_key394; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key394 UNIQUE (name);


--
-- Name: factories factories_name_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key4 UNIQUE (name);


--
-- Name: factories factories_name_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key40 UNIQUE (name);


--
-- Name: factories factories_name_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key41 UNIQUE (name);


--
-- Name: factories factories_name_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key42 UNIQUE (name);


--
-- Name: factories factories_name_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key43 UNIQUE (name);


--
-- Name: factories factories_name_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key44 UNIQUE (name);


--
-- Name: factories factories_name_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key45 UNIQUE (name);


--
-- Name: factories factories_name_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key46 UNIQUE (name);


--
-- Name: factories factories_name_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key47 UNIQUE (name);


--
-- Name: factories factories_name_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key48 UNIQUE (name);


--
-- Name: factories factories_name_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key49 UNIQUE (name);


--
-- Name: factories factories_name_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key5 UNIQUE (name);


--
-- Name: factories factories_name_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key50 UNIQUE (name);


--
-- Name: factories factories_name_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key51 UNIQUE (name);


--
-- Name: factories factories_name_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key52 UNIQUE (name);


--
-- Name: factories factories_name_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key53 UNIQUE (name);


--
-- Name: factories factories_name_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key54 UNIQUE (name);


--
-- Name: factories factories_name_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key55 UNIQUE (name);


--
-- Name: factories factories_name_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key56 UNIQUE (name);


--
-- Name: factories factories_name_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key57 UNIQUE (name);


--
-- Name: factories factories_name_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key58 UNIQUE (name);


--
-- Name: factories factories_name_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key59 UNIQUE (name);


--
-- Name: factories factories_name_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key6 UNIQUE (name);


--
-- Name: factories factories_name_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key60 UNIQUE (name);


--
-- Name: factories factories_name_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key61 UNIQUE (name);


--
-- Name: factories factories_name_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key62 UNIQUE (name);


--
-- Name: factories factories_name_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key63 UNIQUE (name);


--
-- Name: factories factories_name_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key64 UNIQUE (name);


--
-- Name: factories factories_name_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key65 UNIQUE (name);


--
-- Name: factories factories_name_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key66 UNIQUE (name);


--
-- Name: factories factories_name_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key67 UNIQUE (name);


--
-- Name: factories factories_name_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key68 UNIQUE (name);


--
-- Name: factories factories_name_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key69 UNIQUE (name);


--
-- Name: factories factories_name_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key7 UNIQUE (name);


--
-- Name: factories factories_name_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key70 UNIQUE (name);


--
-- Name: factories factories_name_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key71 UNIQUE (name);


--
-- Name: factories factories_name_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key72 UNIQUE (name);


--
-- Name: factories factories_name_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key73 UNIQUE (name);


--
-- Name: factories factories_name_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key74 UNIQUE (name);


--
-- Name: factories factories_name_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key75 UNIQUE (name);


--
-- Name: factories factories_name_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key76 UNIQUE (name);


--
-- Name: factories factories_name_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key77 UNIQUE (name);


--
-- Name: factories factories_name_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key78 UNIQUE (name);


--
-- Name: factories factories_name_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key79 UNIQUE (name);


--
-- Name: factories factories_name_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key8 UNIQUE (name);


--
-- Name: factories factories_name_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key80 UNIQUE (name);


--
-- Name: factories factories_name_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key81 UNIQUE (name);


--
-- Name: factories factories_name_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key82 UNIQUE (name);


--
-- Name: factories factories_name_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key83 UNIQUE (name);


--
-- Name: factories factories_name_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key84 UNIQUE (name);


--
-- Name: factories factories_name_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key85 UNIQUE (name);


--
-- Name: factories factories_name_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key86 UNIQUE (name);


--
-- Name: factories factories_name_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key87 UNIQUE (name);


--
-- Name: factories factories_name_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key88 UNIQUE (name);


--
-- Name: factories factories_name_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key89 UNIQUE (name);


--
-- Name: factories factories_name_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key9 UNIQUE (name);


--
-- Name: factories factories_name_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key90 UNIQUE (name);


--
-- Name: factories factories_name_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key91 UNIQUE (name);


--
-- Name: factories factories_name_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key92 UNIQUE (name);


--
-- Name: factories factories_name_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key93 UNIQUE (name);


--
-- Name: factories factories_name_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key94 UNIQUE (name);


--
-- Name: factories factories_name_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key95 UNIQUE (name);


--
-- Name: factories factories_name_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key96 UNIQUE (name);


--
-- Name: factories factories_name_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key97 UNIQUE (name);


--
-- Name: factories factories_name_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key98 UNIQUE (name);


--
-- Name: factories factories_name_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key99 UNIQUE (name);


--
-- Name: factories factories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_pkey PRIMARY KEY (id);


--
-- Name: ordersProducts ordersProducts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ordersProducts"
    ADD CONSTRAINT "ordersProducts_pkey" PRIMARY KEY (id);


--
-- Name: productsIds productsIds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."productsIds"
    ADD CONSTRAINT "productsIds_pkey" PRIMARY KEY ("purchasingOrderId", "productId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: purchasingOrders purchasingOrders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."purchasingOrders"
    ADD CONSTRAINT "purchasingOrders_pkey" PRIMARY KEY (id);


--
-- Name: sectors sectors_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key UNIQUE (name);


--
-- Name: sectors sectors_name_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key1 UNIQUE (name);


--
-- Name: sectors sectors_name_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key10 UNIQUE (name);


--
-- Name: sectors sectors_name_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key100 UNIQUE (name);


--
-- Name: sectors sectors_name_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key101 UNIQUE (name);


--
-- Name: sectors sectors_name_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key102 UNIQUE (name);


--
-- Name: sectors sectors_name_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key103 UNIQUE (name);


--
-- Name: sectors sectors_name_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key104 UNIQUE (name);


--
-- Name: sectors sectors_name_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key105 UNIQUE (name);


--
-- Name: sectors sectors_name_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key106 UNIQUE (name);


--
-- Name: sectors sectors_name_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key107 UNIQUE (name);


--
-- Name: sectors sectors_name_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key108 UNIQUE (name);


--
-- Name: sectors sectors_name_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key109 UNIQUE (name);


--
-- Name: sectors sectors_name_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key11 UNIQUE (name);


--
-- Name: sectors sectors_name_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key110 UNIQUE (name);


--
-- Name: sectors sectors_name_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key111 UNIQUE (name);


--
-- Name: sectors sectors_name_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key112 UNIQUE (name);


--
-- Name: sectors sectors_name_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key113 UNIQUE (name);


--
-- Name: sectors sectors_name_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key114 UNIQUE (name);


--
-- Name: sectors sectors_name_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key115 UNIQUE (name);


--
-- Name: sectors sectors_name_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key116 UNIQUE (name);


--
-- Name: sectors sectors_name_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key117 UNIQUE (name);


--
-- Name: sectors sectors_name_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key118 UNIQUE (name);


--
-- Name: sectors sectors_name_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key119 UNIQUE (name);


--
-- Name: sectors sectors_name_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key12 UNIQUE (name);


--
-- Name: sectors sectors_name_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key120 UNIQUE (name);


--
-- Name: sectors sectors_name_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key121 UNIQUE (name);


--
-- Name: sectors sectors_name_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key122 UNIQUE (name);


--
-- Name: sectors sectors_name_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key123 UNIQUE (name);


--
-- Name: sectors sectors_name_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key124 UNIQUE (name);


--
-- Name: sectors sectors_name_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key125 UNIQUE (name);


--
-- Name: sectors sectors_name_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key126 UNIQUE (name);


--
-- Name: sectors sectors_name_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key127 UNIQUE (name);


--
-- Name: sectors sectors_name_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key128 UNIQUE (name);


--
-- Name: sectors sectors_name_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key129 UNIQUE (name);


--
-- Name: sectors sectors_name_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key13 UNIQUE (name);


--
-- Name: sectors sectors_name_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key130 UNIQUE (name);


--
-- Name: sectors sectors_name_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key131 UNIQUE (name);


--
-- Name: sectors sectors_name_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key132 UNIQUE (name);


--
-- Name: sectors sectors_name_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key133 UNIQUE (name);


--
-- Name: sectors sectors_name_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key134 UNIQUE (name);


--
-- Name: sectors sectors_name_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key135 UNIQUE (name);


--
-- Name: sectors sectors_name_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key136 UNIQUE (name);


--
-- Name: sectors sectors_name_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key137 UNIQUE (name);


--
-- Name: sectors sectors_name_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key138 UNIQUE (name);


--
-- Name: sectors sectors_name_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key139 UNIQUE (name);


--
-- Name: sectors sectors_name_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key14 UNIQUE (name);


--
-- Name: sectors sectors_name_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key140 UNIQUE (name);


--
-- Name: sectors sectors_name_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key141 UNIQUE (name);


--
-- Name: sectors sectors_name_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key142 UNIQUE (name);


--
-- Name: sectors sectors_name_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key143 UNIQUE (name);


--
-- Name: sectors sectors_name_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key144 UNIQUE (name);


--
-- Name: sectors sectors_name_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key145 UNIQUE (name);


--
-- Name: sectors sectors_name_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key146 UNIQUE (name);


--
-- Name: sectors sectors_name_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key147 UNIQUE (name);


--
-- Name: sectors sectors_name_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key148 UNIQUE (name);


--
-- Name: sectors sectors_name_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key149 UNIQUE (name);


--
-- Name: sectors sectors_name_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key15 UNIQUE (name);


--
-- Name: sectors sectors_name_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key150 UNIQUE (name);


--
-- Name: sectors sectors_name_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key151 UNIQUE (name);


--
-- Name: sectors sectors_name_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key152 UNIQUE (name);


--
-- Name: sectors sectors_name_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key153 UNIQUE (name);


--
-- Name: sectors sectors_name_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key154 UNIQUE (name);


--
-- Name: sectors sectors_name_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key155 UNIQUE (name);


--
-- Name: sectors sectors_name_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key156 UNIQUE (name);


--
-- Name: sectors sectors_name_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key157 UNIQUE (name);


--
-- Name: sectors sectors_name_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key158 UNIQUE (name);


--
-- Name: sectors sectors_name_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key159 UNIQUE (name);


--
-- Name: sectors sectors_name_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key16 UNIQUE (name);


--
-- Name: sectors sectors_name_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key160 UNIQUE (name);


--
-- Name: sectors sectors_name_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key161 UNIQUE (name);


--
-- Name: sectors sectors_name_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key162 UNIQUE (name);


--
-- Name: sectors sectors_name_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key163 UNIQUE (name);


--
-- Name: sectors sectors_name_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key164 UNIQUE (name);


--
-- Name: sectors sectors_name_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key165 UNIQUE (name);


--
-- Name: sectors sectors_name_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key166 UNIQUE (name);


--
-- Name: sectors sectors_name_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key167 UNIQUE (name);


--
-- Name: sectors sectors_name_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key168 UNIQUE (name);


--
-- Name: sectors sectors_name_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key169 UNIQUE (name);


--
-- Name: sectors sectors_name_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key17 UNIQUE (name);


--
-- Name: sectors sectors_name_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key170 UNIQUE (name);


--
-- Name: sectors sectors_name_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key171 UNIQUE (name);


--
-- Name: sectors sectors_name_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key172 UNIQUE (name);


--
-- Name: sectors sectors_name_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key173 UNIQUE (name);


--
-- Name: sectors sectors_name_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key174 UNIQUE (name);


--
-- Name: sectors sectors_name_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key175 UNIQUE (name);


--
-- Name: sectors sectors_name_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key176 UNIQUE (name);


--
-- Name: sectors sectors_name_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key177 UNIQUE (name);


--
-- Name: sectors sectors_name_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key178 UNIQUE (name);


--
-- Name: sectors sectors_name_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key179 UNIQUE (name);


--
-- Name: sectors sectors_name_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key18 UNIQUE (name);


--
-- Name: sectors sectors_name_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key180 UNIQUE (name);


--
-- Name: sectors sectors_name_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key181 UNIQUE (name);


--
-- Name: sectors sectors_name_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key182 UNIQUE (name);


--
-- Name: sectors sectors_name_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key183 UNIQUE (name);


--
-- Name: sectors sectors_name_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key184 UNIQUE (name);


--
-- Name: sectors sectors_name_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key185 UNIQUE (name);


--
-- Name: sectors sectors_name_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key186 UNIQUE (name);


--
-- Name: sectors sectors_name_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key187 UNIQUE (name);


--
-- Name: sectors sectors_name_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key188 UNIQUE (name);


--
-- Name: sectors sectors_name_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key189 UNIQUE (name);


--
-- Name: sectors sectors_name_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key19 UNIQUE (name);


--
-- Name: sectors sectors_name_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key190 UNIQUE (name);


--
-- Name: sectors sectors_name_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key191 UNIQUE (name);


--
-- Name: sectors sectors_name_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key192 UNIQUE (name);


--
-- Name: sectors sectors_name_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key193 UNIQUE (name);


--
-- Name: sectors sectors_name_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key194 UNIQUE (name);


--
-- Name: sectors sectors_name_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key195 UNIQUE (name);


--
-- Name: sectors sectors_name_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key196 UNIQUE (name);


--
-- Name: sectors sectors_name_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key197 UNIQUE (name);


--
-- Name: sectors sectors_name_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key198 UNIQUE (name);


--
-- Name: sectors sectors_name_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key199 UNIQUE (name);


--
-- Name: sectors sectors_name_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key2 UNIQUE (name);


--
-- Name: sectors sectors_name_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key20 UNIQUE (name);


--
-- Name: sectors sectors_name_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key200 UNIQUE (name);


--
-- Name: sectors sectors_name_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key201 UNIQUE (name);


--
-- Name: sectors sectors_name_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key202 UNIQUE (name);


--
-- Name: sectors sectors_name_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key203 UNIQUE (name);


--
-- Name: sectors sectors_name_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key204 UNIQUE (name);


--
-- Name: sectors sectors_name_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key205 UNIQUE (name);


--
-- Name: sectors sectors_name_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key206 UNIQUE (name);


--
-- Name: sectors sectors_name_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key207 UNIQUE (name);


--
-- Name: sectors sectors_name_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key208 UNIQUE (name);


--
-- Name: sectors sectors_name_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key209 UNIQUE (name);


--
-- Name: sectors sectors_name_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key21 UNIQUE (name);


--
-- Name: sectors sectors_name_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key210 UNIQUE (name);


--
-- Name: sectors sectors_name_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key211 UNIQUE (name);


--
-- Name: sectors sectors_name_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key212 UNIQUE (name);


--
-- Name: sectors sectors_name_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key213 UNIQUE (name);


--
-- Name: sectors sectors_name_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key214 UNIQUE (name);


--
-- Name: sectors sectors_name_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key215 UNIQUE (name);


--
-- Name: sectors sectors_name_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key216 UNIQUE (name);


--
-- Name: sectors sectors_name_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key217 UNIQUE (name);


--
-- Name: sectors sectors_name_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key218 UNIQUE (name);


--
-- Name: sectors sectors_name_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key219 UNIQUE (name);


--
-- Name: sectors sectors_name_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key22 UNIQUE (name);


--
-- Name: sectors sectors_name_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key220 UNIQUE (name);


--
-- Name: sectors sectors_name_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key221 UNIQUE (name);


--
-- Name: sectors sectors_name_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key222 UNIQUE (name);


--
-- Name: sectors sectors_name_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key223 UNIQUE (name);


--
-- Name: sectors sectors_name_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key224 UNIQUE (name);


--
-- Name: sectors sectors_name_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key225 UNIQUE (name);


--
-- Name: sectors sectors_name_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key226 UNIQUE (name);


--
-- Name: sectors sectors_name_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key227 UNIQUE (name);


--
-- Name: sectors sectors_name_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key228 UNIQUE (name);


--
-- Name: sectors sectors_name_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key229 UNIQUE (name);


--
-- Name: sectors sectors_name_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key23 UNIQUE (name);


--
-- Name: sectors sectors_name_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key230 UNIQUE (name);


--
-- Name: sectors sectors_name_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key231 UNIQUE (name);


--
-- Name: sectors sectors_name_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key232 UNIQUE (name);


--
-- Name: sectors sectors_name_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key233 UNIQUE (name);


--
-- Name: sectors sectors_name_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key234 UNIQUE (name);


--
-- Name: sectors sectors_name_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key235 UNIQUE (name);


--
-- Name: sectors sectors_name_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key236 UNIQUE (name);


--
-- Name: sectors sectors_name_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key237 UNIQUE (name);


--
-- Name: sectors sectors_name_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key238 UNIQUE (name);


--
-- Name: sectors sectors_name_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key239 UNIQUE (name);


--
-- Name: sectors sectors_name_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key24 UNIQUE (name);


--
-- Name: sectors sectors_name_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key240 UNIQUE (name);


--
-- Name: sectors sectors_name_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key241 UNIQUE (name);


--
-- Name: sectors sectors_name_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key242 UNIQUE (name);


--
-- Name: sectors sectors_name_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key243 UNIQUE (name);


--
-- Name: sectors sectors_name_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key244 UNIQUE (name);


--
-- Name: sectors sectors_name_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key245 UNIQUE (name);


--
-- Name: sectors sectors_name_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key246 UNIQUE (name);


--
-- Name: sectors sectors_name_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key247 UNIQUE (name);


--
-- Name: sectors sectors_name_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key248 UNIQUE (name);


--
-- Name: sectors sectors_name_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key249 UNIQUE (name);


--
-- Name: sectors sectors_name_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key25 UNIQUE (name);


--
-- Name: sectors sectors_name_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key250 UNIQUE (name);


--
-- Name: sectors sectors_name_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key251 UNIQUE (name);


--
-- Name: sectors sectors_name_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key252 UNIQUE (name);


--
-- Name: sectors sectors_name_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key253 UNIQUE (name);


--
-- Name: sectors sectors_name_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key254 UNIQUE (name);


--
-- Name: sectors sectors_name_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key255 UNIQUE (name);


--
-- Name: sectors sectors_name_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key256 UNIQUE (name);


--
-- Name: sectors sectors_name_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key257 UNIQUE (name);


--
-- Name: sectors sectors_name_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key258 UNIQUE (name);


--
-- Name: sectors sectors_name_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key259 UNIQUE (name);


--
-- Name: sectors sectors_name_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key26 UNIQUE (name);


--
-- Name: sectors sectors_name_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key260 UNIQUE (name);


--
-- Name: sectors sectors_name_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key261 UNIQUE (name);


--
-- Name: sectors sectors_name_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key262 UNIQUE (name);


--
-- Name: sectors sectors_name_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key263 UNIQUE (name);


--
-- Name: sectors sectors_name_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key264 UNIQUE (name);


--
-- Name: sectors sectors_name_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key265 UNIQUE (name);


--
-- Name: sectors sectors_name_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key266 UNIQUE (name);


--
-- Name: sectors sectors_name_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key267 UNIQUE (name);


--
-- Name: sectors sectors_name_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key268 UNIQUE (name);


--
-- Name: sectors sectors_name_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key269 UNIQUE (name);


--
-- Name: sectors sectors_name_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key27 UNIQUE (name);


--
-- Name: sectors sectors_name_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key270 UNIQUE (name);


--
-- Name: sectors sectors_name_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key271 UNIQUE (name);


--
-- Name: sectors sectors_name_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key272 UNIQUE (name);


--
-- Name: sectors sectors_name_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key273 UNIQUE (name);


--
-- Name: sectors sectors_name_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key274 UNIQUE (name);


--
-- Name: sectors sectors_name_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key275 UNIQUE (name);


--
-- Name: sectors sectors_name_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key276 UNIQUE (name);


--
-- Name: sectors sectors_name_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key277 UNIQUE (name);


--
-- Name: sectors sectors_name_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key278 UNIQUE (name);


--
-- Name: sectors sectors_name_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key279 UNIQUE (name);


--
-- Name: sectors sectors_name_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key28 UNIQUE (name);


--
-- Name: sectors sectors_name_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key280 UNIQUE (name);


--
-- Name: sectors sectors_name_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key281 UNIQUE (name);


--
-- Name: sectors sectors_name_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key282 UNIQUE (name);


--
-- Name: sectors sectors_name_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key283 UNIQUE (name);


--
-- Name: sectors sectors_name_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key284 UNIQUE (name);


--
-- Name: sectors sectors_name_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key285 UNIQUE (name);


--
-- Name: sectors sectors_name_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key286 UNIQUE (name);


--
-- Name: sectors sectors_name_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key287 UNIQUE (name);


--
-- Name: sectors sectors_name_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key288 UNIQUE (name);


--
-- Name: sectors sectors_name_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key289 UNIQUE (name);


--
-- Name: sectors sectors_name_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key29 UNIQUE (name);


--
-- Name: sectors sectors_name_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key290 UNIQUE (name);


--
-- Name: sectors sectors_name_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key291 UNIQUE (name);


--
-- Name: sectors sectors_name_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key292 UNIQUE (name);


--
-- Name: sectors sectors_name_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key293 UNIQUE (name);


--
-- Name: sectors sectors_name_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key294 UNIQUE (name);


--
-- Name: sectors sectors_name_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key295 UNIQUE (name);


--
-- Name: sectors sectors_name_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key296 UNIQUE (name);


--
-- Name: sectors sectors_name_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key297 UNIQUE (name);


--
-- Name: sectors sectors_name_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key298 UNIQUE (name);


--
-- Name: sectors sectors_name_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key299 UNIQUE (name);


--
-- Name: sectors sectors_name_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key3 UNIQUE (name);


--
-- Name: sectors sectors_name_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key30 UNIQUE (name);


--
-- Name: sectors sectors_name_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key300 UNIQUE (name);


--
-- Name: sectors sectors_name_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key301 UNIQUE (name);


--
-- Name: sectors sectors_name_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key302 UNIQUE (name);


--
-- Name: sectors sectors_name_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key303 UNIQUE (name);


--
-- Name: sectors sectors_name_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key304 UNIQUE (name);


--
-- Name: sectors sectors_name_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key305 UNIQUE (name);


--
-- Name: sectors sectors_name_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key306 UNIQUE (name);


--
-- Name: sectors sectors_name_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key307 UNIQUE (name);


--
-- Name: sectors sectors_name_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key308 UNIQUE (name);


--
-- Name: sectors sectors_name_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key309 UNIQUE (name);


--
-- Name: sectors sectors_name_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key31 UNIQUE (name);


--
-- Name: sectors sectors_name_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key310 UNIQUE (name);


--
-- Name: sectors sectors_name_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key311 UNIQUE (name);


--
-- Name: sectors sectors_name_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key312 UNIQUE (name);


--
-- Name: sectors sectors_name_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key313 UNIQUE (name);


--
-- Name: sectors sectors_name_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key314 UNIQUE (name);


--
-- Name: sectors sectors_name_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key315 UNIQUE (name);


--
-- Name: sectors sectors_name_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key316 UNIQUE (name);


--
-- Name: sectors sectors_name_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key317 UNIQUE (name);


--
-- Name: sectors sectors_name_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key318 UNIQUE (name);


--
-- Name: sectors sectors_name_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key319 UNIQUE (name);


--
-- Name: sectors sectors_name_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key32 UNIQUE (name);


--
-- Name: sectors sectors_name_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key320 UNIQUE (name);


--
-- Name: sectors sectors_name_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key321 UNIQUE (name);


--
-- Name: sectors sectors_name_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key322 UNIQUE (name);


--
-- Name: sectors sectors_name_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key323 UNIQUE (name);


--
-- Name: sectors sectors_name_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key324 UNIQUE (name);


--
-- Name: sectors sectors_name_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key325 UNIQUE (name);


--
-- Name: sectors sectors_name_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key326 UNIQUE (name);


--
-- Name: sectors sectors_name_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key327 UNIQUE (name);


--
-- Name: sectors sectors_name_key328; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key328 UNIQUE (name);


--
-- Name: sectors sectors_name_key329; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key329 UNIQUE (name);


--
-- Name: sectors sectors_name_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key33 UNIQUE (name);


--
-- Name: sectors sectors_name_key330; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key330 UNIQUE (name);


--
-- Name: sectors sectors_name_key331; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key331 UNIQUE (name);


--
-- Name: sectors sectors_name_key332; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key332 UNIQUE (name);


--
-- Name: sectors sectors_name_key333; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key333 UNIQUE (name);


--
-- Name: sectors sectors_name_key334; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key334 UNIQUE (name);


--
-- Name: sectors sectors_name_key335; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key335 UNIQUE (name);


--
-- Name: sectors sectors_name_key336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key336 UNIQUE (name);


--
-- Name: sectors sectors_name_key337; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key337 UNIQUE (name);


--
-- Name: sectors sectors_name_key338; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key338 UNIQUE (name);


--
-- Name: sectors sectors_name_key339; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key339 UNIQUE (name);


--
-- Name: sectors sectors_name_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key34 UNIQUE (name);


--
-- Name: sectors sectors_name_key340; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key340 UNIQUE (name);


--
-- Name: sectors sectors_name_key341; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key341 UNIQUE (name);


--
-- Name: sectors sectors_name_key342; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key342 UNIQUE (name);


--
-- Name: sectors sectors_name_key343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key343 UNIQUE (name);


--
-- Name: sectors sectors_name_key344; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key344 UNIQUE (name);


--
-- Name: sectors sectors_name_key345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key345 UNIQUE (name);


--
-- Name: sectors sectors_name_key346; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key346 UNIQUE (name);


--
-- Name: sectors sectors_name_key347; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key347 UNIQUE (name);


--
-- Name: sectors sectors_name_key348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key348 UNIQUE (name);


--
-- Name: sectors sectors_name_key349; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key349 UNIQUE (name);


--
-- Name: sectors sectors_name_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key35 UNIQUE (name);


--
-- Name: sectors sectors_name_key350; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key350 UNIQUE (name);


--
-- Name: sectors sectors_name_key351; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key351 UNIQUE (name);


--
-- Name: sectors sectors_name_key352; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key352 UNIQUE (name);


--
-- Name: sectors sectors_name_key353; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key353 UNIQUE (name);


--
-- Name: sectors sectors_name_key354; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key354 UNIQUE (name);


--
-- Name: sectors sectors_name_key355; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key355 UNIQUE (name);


--
-- Name: sectors sectors_name_key356; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key356 UNIQUE (name);


--
-- Name: sectors sectors_name_key357; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key357 UNIQUE (name);


--
-- Name: sectors sectors_name_key358; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key358 UNIQUE (name);


--
-- Name: sectors sectors_name_key359; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key359 UNIQUE (name);


--
-- Name: sectors sectors_name_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key36 UNIQUE (name);


--
-- Name: sectors sectors_name_key360; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key360 UNIQUE (name);


--
-- Name: sectors sectors_name_key361; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key361 UNIQUE (name);


--
-- Name: sectors sectors_name_key362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key362 UNIQUE (name);


--
-- Name: sectors sectors_name_key363; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key363 UNIQUE (name);


--
-- Name: sectors sectors_name_key364; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key364 UNIQUE (name);


--
-- Name: sectors sectors_name_key365; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key365 UNIQUE (name);


--
-- Name: sectors sectors_name_key366; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key366 UNIQUE (name);


--
-- Name: sectors sectors_name_key367; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key367 UNIQUE (name);


--
-- Name: sectors sectors_name_key368; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key368 UNIQUE (name);


--
-- Name: sectors sectors_name_key369; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key369 UNIQUE (name);


--
-- Name: sectors sectors_name_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key37 UNIQUE (name);


--
-- Name: sectors sectors_name_key370; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key370 UNIQUE (name);


--
-- Name: sectors sectors_name_key371; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key371 UNIQUE (name);


--
-- Name: sectors sectors_name_key372; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key372 UNIQUE (name);


--
-- Name: sectors sectors_name_key373; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key373 UNIQUE (name);


--
-- Name: sectors sectors_name_key374; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key374 UNIQUE (name);


--
-- Name: sectors sectors_name_key375; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key375 UNIQUE (name);


--
-- Name: sectors sectors_name_key376; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key376 UNIQUE (name);


--
-- Name: sectors sectors_name_key377; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key377 UNIQUE (name);


--
-- Name: sectors sectors_name_key378; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key378 UNIQUE (name);


--
-- Name: sectors sectors_name_key379; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key379 UNIQUE (name);


--
-- Name: sectors sectors_name_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key38 UNIQUE (name);


--
-- Name: sectors sectors_name_key380; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key380 UNIQUE (name);


--
-- Name: sectors sectors_name_key381; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key381 UNIQUE (name);


--
-- Name: sectors sectors_name_key382; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key382 UNIQUE (name);


--
-- Name: sectors sectors_name_key383; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key383 UNIQUE (name);


--
-- Name: sectors sectors_name_key384; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key384 UNIQUE (name);


--
-- Name: sectors sectors_name_key385; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key385 UNIQUE (name);


--
-- Name: sectors sectors_name_key386; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key386 UNIQUE (name);


--
-- Name: sectors sectors_name_key387; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key387 UNIQUE (name);


--
-- Name: sectors sectors_name_key388; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key388 UNIQUE (name);


--
-- Name: sectors sectors_name_key389; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key389 UNIQUE (name);


--
-- Name: sectors sectors_name_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key39 UNIQUE (name);


--
-- Name: sectors sectors_name_key390; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key390 UNIQUE (name);


--
-- Name: sectors sectors_name_key391; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key391 UNIQUE (name);


--
-- Name: sectors sectors_name_key392; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key392 UNIQUE (name);


--
-- Name: sectors sectors_name_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key4 UNIQUE (name);


--
-- Name: sectors sectors_name_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key40 UNIQUE (name);


--
-- Name: sectors sectors_name_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key41 UNIQUE (name);


--
-- Name: sectors sectors_name_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key42 UNIQUE (name);


--
-- Name: sectors sectors_name_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key43 UNIQUE (name);


--
-- Name: sectors sectors_name_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key44 UNIQUE (name);


--
-- Name: sectors sectors_name_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key45 UNIQUE (name);


--
-- Name: sectors sectors_name_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key46 UNIQUE (name);


--
-- Name: sectors sectors_name_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key47 UNIQUE (name);


--
-- Name: sectors sectors_name_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key48 UNIQUE (name);


--
-- Name: sectors sectors_name_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key49 UNIQUE (name);


--
-- Name: sectors sectors_name_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key5 UNIQUE (name);


--
-- Name: sectors sectors_name_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key50 UNIQUE (name);


--
-- Name: sectors sectors_name_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key51 UNIQUE (name);


--
-- Name: sectors sectors_name_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key52 UNIQUE (name);


--
-- Name: sectors sectors_name_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key53 UNIQUE (name);


--
-- Name: sectors sectors_name_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key54 UNIQUE (name);


--
-- Name: sectors sectors_name_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key55 UNIQUE (name);


--
-- Name: sectors sectors_name_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key56 UNIQUE (name);


--
-- Name: sectors sectors_name_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key57 UNIQUE (name);


--
-- Name: sectors sectors_name_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key58 UNIQUE (name);


--
-- Name: sectors sectors_name_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key59 UNIQUE (name);


--
-- Name: sectors sectors_name_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key6 UNIQUE (name);


--
-- Name: sectors sectors_name_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key60 UNIQUE (name);


--
-- Name: sectors sectors_name_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key61 UNIQUE (name);


--
-- Name: sectors sectors_name_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key62 UNIQUE (name);


--
-- Name: sectors sectors_name_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key63 UNIQUE (name);


--
-- Name: sectors sectors_name_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key64 UNIQUE (name);


--
-- Name: sectors sectors_name_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key65 UNIQUE (name);


--
-- Name: sectors sectors_name_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key66 UNIQUE (name);


--
-- Name: sectors sectors_name_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key67 UNIQUE (name);


--
-- Name: sectors sectors_name_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key68 UNIQUE (name);


--
-- Name: sectors sectors_name_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key69 UNIQUE (name);


--
-- Name: sectors sectors_name_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key7 UNIQUE (name);


--
-- Name: sectors sectors_name_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key70 UNIQUE (name);


--
-- Name: sectors sectors_name_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key71 UNIQUE (name);


--
-- Name: sectors sectors_name_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key72 UNIQUE (name);


--
-- Name: sectors sectors_name_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key73 UNIQUE (name);


--
-- Name: sectors sectors_name_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key74 UNIQUE (name);


--
-- Name: sectors sectors_name_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key75 UNIQUE (name);


--
-- Name: sectors sectors_name_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key76 UNIQUE (name);


--
-- Name: sectors sectors_name_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key77 UNIQUE (name);


--
-- Name: sectors sectors_name_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key78 UNIQUE (name);


--
-- Name: sectors sectors_name_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key79 UNIQUE (name);


--
-- Name: sectors sectors_name_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key8 UNIQUE (name);


--
-- Name: sectors sectors_name_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key80 UNIQUE (name);


--
-- Name: sectors sectors_name_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key81 UNIQUE (name);


--
-- Name: sectors sectors_name_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key82 UNIQUE (name);


--
-- Name: sectors sectors_name_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key83 UNIQUE (name);


--
-- Name: sectors sectors_name_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key84 UNIQUE (name);


--
-- Name: sectors sectors_name_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key85 UNIQUE (name);


--
-- Name: sectors sectors_name_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key86 UNIQUE (name);


--
-- Name: sectors sectors_name_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key87 UNIQUE (name);


--
-- Name: sectors sectors_name_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key88 UNIQUE (name);


--
-- Name: sectors sectors_name_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key89 UNIQUE (name);


--
-- Name: sectors sectors_name_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key9 UNIQUE (name);


--
-- Name: sectors sectors_name_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key90 UNIQUE (name);


--
-- Name: sectors sectors_name_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key91 UNIQUE (name);


--
-- Name: sectors sectors_name_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key92 UNIQUE (name);


--
-- Name: sectors sectors_name_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key93 UNIQUE (name);


--
-- Name: sectors sectors_name_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key94 UNIQUE (name);


--
-- Name: sectors sectors_name_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key95 UNIQUE (name);


--
-- Name: sectors sectors_name_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key96 UNIQUE (name);


--
-- Name: sectors sectors_name_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key97 UNIQUE (name);


--
-- Name: sectors sectors_name_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key98 UNIQUE (name);


--
-- Name: sectors sectors_name_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key99 UNIQUE (name);


--
-- Name: sectors sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_name_key UNIQUE (name);


--
-- Name: subscriptions subscriptions_name_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_name_key1 UNIQUE (name);


--
-- Name: subscriptions subscriptions_name_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_name_key2 UNIQUE (name);


--
-- Name: subscriptions subscriptions_name_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_name_key3 UNIQUE (name);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);


--
-- Name: users users_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key10 UNIQUE (email);


--
-- Name: users users_email_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key100 UNIQUE (email);


--
-- Name: users users_email_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key101 UNIQUE (email);


--
-- Name: users users_email_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key102 UNIQUE (email);


--
-- Name: users users_email_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key103 UNIQUE (email);


--
-- Name: users users_email_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key104 UNIQUE (email);


--
-- Name: users users_email_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key105 UNIQUE (email);


--
-- Name: users users_email_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key106 UNIQUE (email);


--
-- Name: users users_email_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key107 UNIQUE (email);


--
-- Name: users users_email_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key108 UNIQUE (email);


--
-- Name: users users_email_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key109 UNIQUE (email);


--
-- Name: users users_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key11 UNIQUE (email);


--
-- Name: users users_email_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key110 UNIQUE (email);


--
-- Name: users users_email_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key111 UNIQUE (email);


--
-- Name: users users_email_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key112 UNIQUE (email);


--
-- Name: users users_email_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key113 UNIQUE (email);


--
-- Name: users users_email_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key114 UNIQUE (email);


--
-- Name: users users_email_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key115 UNIQUE (email);


--
-- Name: users users_email_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key116 UNIQUE (email);


--
-- Name: users users_email_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key117 UNIQUE (email);


--
-- Name: users users_email_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key118 UNIQUE (email);


--
-- Name: users users_email_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key119 UNIQUE (email);


--
-- Name: users users_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key12 UNIQUE (email);


--
-- Name: users users_email_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key120 UNIQUE (email);


--
-- Name: users users_email_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key121 UNIQUE (email);


--
-- Name: users users_email_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key122 UNIQUE (email);


--
-- Name: users users_email_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key123 UNIQUE (email);


--
-- Name: users users_email_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key124 UNIQUE (email);


--
-- Name: users users_email_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key125 UNIQUE (email);


--
-- Name: users users_email_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key126 UNIQUE (email);


--
-- Name: users users_email_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key127 UNIQUE (email);


--
-- Name: users users_email_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key128 UNIQUE (email);


--
-- Name: users users_email_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key129 UNIQUE (email);


--
-- Name: users users_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key13 UNIQUE (email);


--
-- Name: users users_email_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key130 UNIQUE (email);


--
-- Name: users users_email_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key131 UNIQUE (email);


--
-- Name: users users_email_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key132 UNIQUE (email);


--
-- Name: users users_email_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key133 UNIQUE (email);


--
-- Name: users users_email_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key134 UNIQUE (email);


--
-- Name: users users_email_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key135 UNIQUE (email);


--
-- Name: users users_email_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key136 UNIQUE (email);


--
-- Name: users users_email_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key137 UNIQUE (email);


--
-- Name: users users_email_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key138 UNIQUE (email);


--
-- Name: users users_email_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key139 UNIQUE (email);


--
-- Name: users users_email_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key14 UNIQUE (email);


--
-- Name: users users_email_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key140 UNIQUE (email);


--
-- Name: users users_email_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key141 UNIQUE (email);


--
-- Name: users users_email_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key142 UNIQUE (email);


--
-- Name: users users_email_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key143 UNIQUE (email);


--
-- Name: users users_email_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key144 UNIQUE (email);


--
-- Name: users users_email_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key145 UNIQUE (email);


--
-- Name: users users_email_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key146 UNIQUE (email);


--
-- Name: users users_email_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key147 UNIQUE (email);


--
-- Name: users users_email_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key148 UNIQUE (email);


--
-- Name: users users_email_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key149 UNIQUE (email);


--
-- Name: users users_email_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key15 UNIQUE (email);


--
-- Name: users users_email_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key150 UNIQUE (email);


--
-- Name: users users_email_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key151 UNIQUE (email);


--
-- Name: users users_email_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key152 UNIQUE (email);


--
-- Name: users users_email_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key153 UNIQUE (email);


--
-- Name: users users_email_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key154 UNIQUE (email);


--
-- Name: users users_email_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key155 UNIQUE (email);


--
-- Name: users users_email_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key156 UNIQUE (email);


--
-- Name: users users_email_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key157 UNIQUE (email);


--
-- Name: users users_email_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key158 UNIQUE (email);


--
-- Name: users users_email_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key159 UNIQUE (email);


--
-- Name: users users_email_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key16 UNIQUE (email);


--
-- Name: users users_email_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key160 UNIQUE (email);


--
-- Name: users users_email_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key161 UNIQUE (email);


--
-- Name: users users_email_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key162 UNIQUE (email);


--
-- Name: users users_email_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key163 UNIQUE (email);


--
-- Name: users users_email_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key164 UNIQUE (email);


--
-- Name: users users_email_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key165 UNIQUE (email);


--
-- Name: users users_email_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key166 UNIQUE (email);


--
-- Name: users users_email_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key167 UNIQUE (email);


--
-- Name: users users_email_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key168 UNIQUE (email);


--
-- Name: users users_email_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key169 UNIQUE (email);


--
-- Name: users users_email_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key17 UNIQUE (email);


--
-- Name: users users_email_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key170 UNIQUE (email);


--
-- Name: users users_email_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key171 UNIQUE (email);


--
-- Name: users users_email_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key172 UNIQUE (email);


--
-- Name: users users_email_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key173 UNIQUE (email);


--
-- Name: users users_email_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key174 UNIQUE (email);


--
-- Name: users users_email_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key175 UNIQUE (email);


--
-- Name: users users_email_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key176 UNIQUE (email);


--
-- Name: users users_email_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key177 UNIQUE (email);


--
-- Name: users users_email_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key178 UNIQUE (email);


--
-- Name: users users_email_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key179 UNIQUE (email);


--
-- Name: users users_email_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key18 UNIQUE (email);


--
-- Name: users users_email_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key180 UNIQUE (email);


--
-- Name: users users_email_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key181 UNIQUE (email);


--
-- Name: users users_email_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key182 UNIQUE (email);


--
-- Name: users users_email_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key183 UNIQUE (email);


--
-- Name: users users_email_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key184 UNIQUE (email);


--
-- Name: users users_email_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key185 UNIQUE (email);


--
-- Name: users users_email_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key186 UNIQUE (email);


--
-- Name: users users_email_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key187 UNIQUE (email);


--
-- Name: users users_email_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key188 UNIQUE (email);


--
-- Name: users users_email_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key189 UNIQUE (email);


--
-- Name: users users_email_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key19 UNIQUE (email);


--
-- Name: users users_email_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key190 UNIQUE (email);


--
-- Name: users users_email_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key191 UNIQUE (email);


--
-- Name: users users_email_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key192 UNIQUE (email);


--
-- Name: users users_email_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key193 UNIQUE (email);


--
-- Name: users users_email_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key194 UNIQUE (email);


--
-- Name: users users_email_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key195 UNIQUE (email);


--
-- Name: users users_email_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key196 UNIQUE (email);


--
-- Name: users users_email_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key197 UNIQUE (email);


--
-- Name: users users_email_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key198 UNIQUE (email);


--
-- Name: users users_email_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key199 UNIQUE (email);


--
-- Name: users users_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);


--
-- Name: users users_email_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key20 UNIQUE (email);


--
-- Name: users users_email_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key200 UNIQUE (email);


--
-- Name: users users_email_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key201 UNIQUE (email);


--
-- Name: users users_email_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key202 UNIQUE (email);


--
-- Name: users users_email_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key203 UNIQUE (email);


--
-- Name: users users_email_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key204 UNIQUE (email);


--
-- Name: users users_email_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key205 UNIQUE (email);


--
-- Name: users users_email_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key206 UNIQUE (email);


--
-- Name: users users_email_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key207 UNIQUE (email);


--
-- Name: users users_email_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key208 UNIQUE (email);


--
-- Name: users users_email_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key209 UNIQUE (email);


--
-- Name: users users_email_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key21 UNIQUE (email);


--
-- Name: users users_email_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key210 UNIQUE (email);


--
-- Name: users users_email_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key211 UNIQUE (email);


--
-- Name: users users_email_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key212 UNIQUE (email);


--
-- Name: users users_email_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key213 UNIQUE (email);


--
-- Name: users users_email_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key214 UNIQUE (email);


--
-- Name: users users_email_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key215 UNIQUE (email);


--
-- Name: users users_email_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key216 UNIQUE (email);


--
-- Name: users users_email_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key217 UNIQUE (email);


--
-- Name: users users_email_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key218 UNIQUE (email);


--
-- Name: users users_email_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key219 UNIQUE (email);


--
-- Name: users users_email_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key22 UNIQUE (email);


--
-- Name: users users_email_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key220 UNIQUE (email);


--
-- Name: users users_email_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key221 UNIQUE (email);


--
-- Name: users users_email_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key222 UNIQUE (email);


--
-- Name: users users_email_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key223 UNIQUE (email);


--
-- Name: users users_email_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key224 UNIQUE (email);


--
-- Name: users users_email_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key225 UNIQUE (email);


--
-- Name: users users_email_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key226 UNIQUE (email);


--
-- Name: users users_email_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key227 UNIQUE (email);


--
-- Name: users users_email_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key228 UNIQUE (email);


--
-- Name: users users_email_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key229 UNIQUE (email);


--
-- Name: users users_email_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key23 UNIQUE (email);


--
-- Name: users users_email_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key230 UNIQUE (email);


--
-- Name: users users_email_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key231 UNIQUE (email);


--
-- Name: users users_email_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key232 UNIQUE (email);


--
-- Name: users users_email_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key233 UNIQUE (email);


--
-- Name: users users_email_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key234 UNIQUE (email);


--
-- Name: users users_email_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key235 UNIQUE (email);


--
-- Name: users users_email_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key236 UNIQUE (email);


--
-- Name: users users_email_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key237 UNIQUE (email);


--
-- Name: users users_email_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key238 UNIQUE (email);


--
-- Name: users users_email_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key239 UNIQUE (email);


--
-- Name: users users_email_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key24 UNIQUE (email);


--
-- Name: users users_email_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key240 UNIQUE (email);


--
-- Name: users users_email_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key241 UNIQUE (email);


--
-- Name: users users_email_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key242 UNIQUE (email);


--
-- Name: users users_email_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key243 UNIQUE (email);


--
-- Name: users users_email_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key244 UNIQUE (email);


--
-- Name: users users_email_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key245 UNIQUE (email);


--
-- Name: users users_email_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key246 UNIQUE (email);


--
-- Name: users users_email_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key247 UNIQUE (email);


--
-- Name: users users_email_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key248 UNIQUE (email);


--
-- Name: users users_email_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key249 UNIQUE (email);


--
-- Name: users users_email_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key25 UNIQUE (email);


--
-- Name: users users_email_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key250 UNIQUE (email);


--
-- Name: users users_email_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key251 UNIQUE (email);


--
-- Name: users users_email_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key252 UNIQUE (email);


--
-- Name: users users_email_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key253 UNIQUE (email);


--
-- Name: users users_email_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key254 UNIQUE (email);


--
-- Name: users users_email_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key255 UNIQUE (email);


--
-- Name: users users_email_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key256 UNIQUE (email);


--
-- Name: users users_email_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key257 UNIQUE (email);


--
-- Name: users users_email_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key258 UNIQUE (email);


--
-- Name: users users_email_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key259 UNIQUE (email);


--
-- Name: users users_email_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key26 UNIQUE (email);


--
-- Name: users users_email_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key260 UNIQUE (email);


--
-- Name: users users_email_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key261 UNIQUE (email);


--
-- Name: users users_email_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key262 UNIQUE (email);


--
-- Name: users users_email_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key263 UNIQUE (email);


--
-- Name: users users_email_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key264 UNIQUE (email);


--
-- Name: users users_email_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key265 UNIQUE (email);


--
-- Name: users users_email_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key266 UNIQUE (email);


--
-- Name: users users_email_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key267 UNIQUE (email);


--
-- Name: users users_email_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key268 UNIQUE (email);


--
-- Name: users users_email_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key269 UNIQUE (email);


--
-- Name: users users_email_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key27 UNIQUE (email);


--
-- Name: users users_email_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key270 UNIQUE (email);


--
-- Name: users users_email_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key271 UNIQUE (email);


--
-- Name: users users_email_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key272 UNIQUE (email);


--
-- Name: users users_email_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key273 UNIQUE (email);


--
-- Name: users users_email_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key274 UNIQUE (email);


--
-- Name: users users_email_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key275 UNIQUE (email);


--
-- Name: users users_email_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key276 UNIQUE (email);


--
-- Name: users users_email_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key277 UNIQUE (email);


--
-- Name: users users_email_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key278 UNIQUE (email);


--
-- Name: users users_email_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key279 UNIQUE (email);


--
-- Name: users users_email_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key28 UNIQUE (email);


--
-- Name: users users_email_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key280 UNIQUE (email);


--
-- Name: users users_email_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key281 UNIQUE (email);


--
-- Name: users users_email_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key282 UNIQUE (email);


--
-- Name: users users_email_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key283 UNIQUE (email);


--
-- Name: users users_email_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key284 UNIQUE (email);


--
-- Name: users users_email_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key285 UNIQUE (email);


--
-- Name: users users_email_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key286 UNIQUE (email);


--
-- Name: users users_email_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key287 UNIQUE (email);


--
-- Name: users users_email_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key288 UNIQUE (email);


--
-- Name: users users_email_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key289 UNIQUE (email);


--
-- Name: users users_email_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key29 UNIQUE (email);


--
-- Name: users users_email_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key290 UNIQUE (email);


--
-- Name: users users_email_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key291 UNIQUE (email);


--
-- Name: users users_email_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key292 UNIQUE (email);


--
-- Name: users users_email_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key293 UNIQUE (email);


--
-- Name: users users_email_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key294 UNIQUE (email);


--
-- Name: users users_email_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key295 UNIQUE (email);


--
-- Name: users users_email_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key296 UNIQUE (email);


--
-- Name: users users_email_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key297 UNIQUE (email);


--
-- Name: users users_email_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key298 UNIQUE (email);


--
-- Name: users users_email_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key299 UNIQUE (email);


--
-- Name: users users_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);


--
-- Name: users users_email_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key30 UNIQUE (email);


--
-- Name: users users_email_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key300 UNIQUE (email);


--
-- Name: users users_email_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key301 UNIQUE (email);


--
-- Name: users users_email_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key302 UNIQUE (email);


--
-- Name: users users_email_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key303 UNIQUE (email);


--
-- Name: users users_email_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key304 UNIQUE (email);


--
-- Name: users users_email_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key305 UNIQUE (email);


--
-- Name: users users_email_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key306 UNIQUE (email);


--
-- Name: users users_email_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key307 UNIQUE (email);


--
-- Name: users users_email_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key308 UNIQUE (email);


--
-- Name: users users_email_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key309 UNIQUE (email);


--
-- Name: users users_email_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key31 UNIQUE (email);


--
-- Name: users users_email_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key310 UNIQUE (email);


--
-- Name: users users_email_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key311 UNIQUE (email);


--
-- Name: users users_email_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key312 UNIQUE (email);


--
-- Name: users users_email_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key313 UNIQUE (email);


--
-- Name: users users_email_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key314 UNIQUE (email);


--
-- Name: users users_email_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key315 UNIQUE (email);


--
-- Name: users users_email_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key316 UNIQUE (email);


--
-- Name: users users_email_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key317 UNIQUE (email);


--
-- Name: users users_email_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key318 UNIQUE (email);


--
-- Name: users users_email_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key319 UNIQUE (email);


--
-- Name: users users_email_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key32 UNIQUE (email);


--
-- Name: users users_email_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key320 UNIQUE (email);


--
-- Name: users users_email_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key321 UNIQUE (email);


--
-- Name: users users_email_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key322 UNIQUE (email);


--
-- Name: users users_email_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key323 UNIQUE (email);


--
-- Name: users users_email_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key324 UNIQUE (email);


--
-- Name: users users_email_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key325 UNIQUE (email);


--
-- Name: users users_email_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key326 UNIQUE (email);


--
-- Name: users users_email_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key327 UNIQUE (email);


--
-- Name: users users_email_key328; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key328 UNIQUE (email);


--
-- Name: users users_email_key329; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key329 UNIQUE (email);


--
-- Name: users users_email_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key33 UNIQUE (email);


--
-- Name: users users_email_key330; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key330 UNIQUE (email);


--
-- Name: users users_email_key331; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key331 UNIQUE (email);


--
-- Name: users users_email_key332; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key332 UNIQUE (email);


--
-- Name: users users_email_key333; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key333 UNIQUE (email);


--
-- Name: users users_email_key334; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key334 UNIQUE (email);


--
-- Name: users users_email_key335; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key335 UNIQUE (email);


--
-- Name: users users_email_key336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key336 UNIQUE (email);


--
-- Name: users users_email_key337; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key337 UNIQUE (email);


--
-- Name: users users_email_key338; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key338 UNIQUE (email);


--
-- Name: users users_email_key339; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key339 UNIQUE (email);


--
-- Name: users users_email_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key34 UNIQUE (email);


--
-- Name: users users_email_key340; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key340 UNIQUE (email);


--
-- Name: users users_email_key341; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key341 UNIQUE (email);


--
-- Name: users users_email_key342; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key342 UNIQUE (email);


--
-- Name: users users_email_key343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key343 UNIQUE (email);


--
-- Name: users users_email_key344; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key344 UNIQUE (email);


--
-- Name: users users_email_key345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key345 UNIQUE (email);


--
-- Name: users users_email_key346; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key346 UNIQUE (email);


--
-- Name: users users_email_key347; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key347 UNIQUE (email);


--
-- Name: users users_email_key348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key348 UNIQUE (email);


--
-- Name: users users_email_key349; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key349 UNIQUE (email);


--
-- Name: users users_email_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key35 UNIQUE (email);


--
-- Name: users users_email_key350; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key350 UNIQUE (email);


--
-- Name: users users_email_key351; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key351 UNIQUE (email);


--
-- Name: users users_email_key352; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key352 UNIQUE (email);


--
-- Name: users users_email_key353; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key353 UNIQUE (email);


--
-- Name: users users_email_key354; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key354 UNIQUE (email);


--
-- Name: users users_email_key355; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key355 UNIQUE (email);


--
-- Name: users users_email_key356; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key356 UNIQUE (email);


--
-- Name: users users_email_key357; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key357 UNIQUE (email);


--
-- Name: users users_email_key358; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key358 UNIQUE (email);


--
-- Name: users users_email_key359; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key359 UNIQUE (email);


--
-- Name: users users_email_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key36 UNIQUE (email);


--
-- Name: users users_email_key360; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key360 UNIQUE (email);


--
-- Name: users users_email_key361; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key361 UNIQUE (email);


--
-- Name: users users_email_key362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key362 UNIQUE (email);


--
-- Name: users users_email_key363; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key363 UNIQUE (email);


--
-- Name: users users_email_key364; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key364 UNIQUE (email);


--
-- Name: users users_email_key365; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key365 UNIQUE (email);


--
-- Name: users users_email_key366; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key366 UNIQUE (email);


--
-- Name: users users_email_key367; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key367 UNIQUE (email);


--
-- Name: users users_email_key368; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key368 UNIQUE (email);


--
-- Name: users users_email_key369; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key369 UNIQUE (email);


--
-- Name: users users_email_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key37 UNIQUE (email);


--
-- Name: users users_email_key370; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key370 UNIQUE (email);


--
-- Name: users users_email_key371; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key371 UNIQUE (email);


--
-- Name: users users_email_key372; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key372 UNIQUE (email);


--
-- Name: users users_email_key373; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key373 UNIQUE (email);


--
-- Name: users users_email_key374; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key374 UNIQUE (email);


--
-- Name: users users_email_key375; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key375 UNIQUE (email);


--
-- Name: users users_email_key376; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key376 UNIQUE (email);


--
-- Name: users users_email_key377; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key377 UNIQUE (email);


--
-- Name: users users_email_key378; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key378 UNIQUE (email);


--
-- Name: users users_email_key379; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key379 UNIQUE (email);


--
-- Name: users users_email_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key38 UNIQUE (email);


--
-- Name: users users_email_key380; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key380 UNIQUE (email);


--
-- Name: users users_email_key381; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key381 UNIQUE (email);


--
-- Name: users users_email_key382; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key382 UNIQUE (email);


--
-- Name: users users_email_key383; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key383 UNIQUE (email);


--
-- Name: users users_email_key384; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key384 UNIQUE (email);


--
-- Name: users users_email_key385; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key385 UNIQUE (email);


--
-- Name: users users_email_key386; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key386 UNIQUE (email);


--
-- Name: users users_email_key387; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key387 UNIQUE (email);


--
-- Name: users users_email_key388; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key388 UNIQUE (email);


--
-- Name: users users_email_key389; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key389 UNIQUE (email);


--
-- Name: users users_email_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key39 UNIQUE (email);


--
-- Name: users users_email_key390; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key390 UNIQUE (email);


--
-- Name: users users_email_key391; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key391 UNIQUE (email);


--
-- Name: users users_email_key392; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key392 UNIQUE (email);


--
-- Name: users users_email_key393; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key393 UNIQUE (email);


--
-- Name: users users_email_key394; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key394 UNIQUE (email);


--
-- Name: users users_email_key395; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key395 UNIQUE (email);


--
-- Name: users users_email_key396; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key396 UNIQUE (email);


--
-- Name: users users_email_key397; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key397 UNIQUE (email);


--
-- Name: users users_email_key398; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key398 UNIQUE (email);


--
-- Name: users users_email_key399; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key399 UNIQUE (email);


--
-- Name: users users_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key4 UNIQUE (email);


--
-- Name: users users_email_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key40 UNIQUE (email);


--
-- Name: users users_email_key400; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key400 UNIQUE (email);


--
-- Name: users users_email_key401; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key401 UNIQUE (email);


--
-- Name: users users_email_key402; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key402 UNIQUE (email);


--
-- Name: users users_email_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key41 UNIQUE (email);


--
-- Name: users users_email_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key42 UNIQUE (email);


--
-- Name: users users_email_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key43 UNIQUE (email);


--
-- Name: users users_email_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key44 UNIQUE (email);


--
-- Name: users users_email_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key45 UNIQUE (email);


--
-- Name: users users_email_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key46 UNIQUE (email);


--
-- Name: users users_email_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key47 UNIQUE (email);


--
-- Name: users users_email_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key48 UNIQUE (email);


--
-- Name: users users_email_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key49 UNIQUE (email);


--
-- Name: users users_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key5 UNIQUE (email);


--
-- Name: users users_email_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key50 UNIQUE (email);


--
-- Name: users users_email_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key51 UNIQUE (email);


--
-- Name: users users_email_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key52 UNIQUE (email);


--
-- Name: users users_email_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key53 UNIQUE (email);


--
-- Name: users users_email_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key54 UNIQUE (email);


--
-- Name: users users_email_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key55 UNIQUE (email);


--
-- Name: users users_email_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key56 UNIQUE (email);


--
-- Name: users users_email_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key57 UNIQUE (email);


--
-- Name: users users_email_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key58 UNIQUE (email);


--
-- Name: users users_email_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key59 UNIQUE (email);


--
-- Name: users users_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key6 UNIQUE (email);


--
-- Name: users users_email_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key60 UNIQUE (email);


--
-- Name: users users_email_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key61 UNIQUE (email);


--
-- Name: users users_email_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key62 UNIQUE (email);


--
-- Name: users users_email_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key63 UNIQUE (email);


--
-- Name: users users_email_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key64 UNIQUE (email);


--
-- Name: users users_email_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key65 UNIQUE (email);


--
-- Name: users users_email_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key66 UNIQUE (email);


--
-- Name: users users_email_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key67 UNIQUE (email);


--
-- Name: users users_email_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key68 UNIQUE (email);


--
-- Name: users users_email_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key69 UNIQUE (email);


--
-- Name: users users_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key7 UNIQUE (email);


--
-- Name: users users_email_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key70 UNIQUE (email);


--
-- Name: users users_email_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key71 UNIQUE (email);


--
-- Name: users users_email_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key72 UNIQUE (email);


--
-- Name: users users_email_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key73 UNIQUE (email);


--
-- Name: users users_email_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key74 UNIQUE (email);


--
-- Name: users users_email_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key75 UNIQUE (email);


--
-- Name: users users_email_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key76 UNIQUE (email);


--
-- Name: users users_email_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key77 UNIQUE (email);


--
-- Name: users users_email_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key78 UNIQUE (email);


--
-- Name: users users_email_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key79 UNIQUE (email);


--
-- Name: users users_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key8 UNIQUE (email);


--
-- Name: users users_email_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key80 UNIQUE (email);


--
-- Name: users users_email_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key81 UNIQUE (email);


--
-- Name: users users_email_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key82 UNIQUE (email);


--
-- Name: users users_email_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key83 UNIQUE (email);


--
-- Name: users users_email_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key84 UNIQUE (email);


--
-- Name: users users_email_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key85 UNIQUE (email);


--
-- Name: users users_email_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key86 UNIQUE (email);


--
-- Name: users users_email_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key87 UNIQUE (email);


--
-- Name: users users_email_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key88 UNIQUE (email);


--
-- Name: users users_email_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key89 UNIQUE (email);


--
-- Name: users users_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key9 UNIQUE (email);


--
-- Name: users users_email_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key90 UNIQUE (email);


--
-- Name: users users_email_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key91 UNIQUE (email);


--
-- Name: users users_email_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key92 UNIQUE (email);


--
-- Name: users users_email_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key93 UNIQUE (email);


--
-- Name: users users_email_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key94 UNIQUE (email);


--
-- Name: users users_email_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key95 UNIQUE (email);


--
-- Name: users users_email_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key96 UNIQUE (email);


--
-- Name: users users_email_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key97 UNIQUE (email);


--
-- Name: users users_email_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key98 UNIQUE (email);


--
-- Name: users users_email_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key99 UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ordersProducts ordersProducts_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ordersProducts"
    ADD CONSTRAINT "ordersProducts_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ordersProducts ordersProducts_purchasingOrderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ordersProducts"
    ADD CONSTRAINT "ordersProducts_purchasingOrderId_fkey" FOREIGN KEY ("purchasingOrderId") REFERENCES public."purchasingOrders"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ordersProducts ordersProducts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ordersProducts"
    ADD CONSTRAINT "ordersProducts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: productsIds productsIds_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."productsIds"
    ADD CONSTRAINT "productsIds_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: productsIds productsIds_purchasingOrderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."productsIds"
    ADD CONSTRAINT "productsIds_purchasingOrderId_fkey" FOREIGN KEY ("purchasingOrderId") REFERENCES public."purchasingOrders"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products products_factoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_factoryId_fkey" FOREIGN KEY ("factoryId") REFERENCES public.factories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products products_sectorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_sectorId_fkey" FOREIGN KEY ("sectorId") REFERENCES public.sectors(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: purchasingOrders purchasingOrders_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."purchasingOrders"
    ADD CONSTRAINT "purchasingOrders_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

