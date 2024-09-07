--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1)

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
-- Name: advices; Type: TABLE; Schema: public; Owner: kanbynet
--

CREATE TABLE public.advices (
    id integer NOT NULL,
    date text,
    source text,
    content_raw text,
    content_rendered text,
    title text
);


ALTER TABLE public.advices OWNER TO kanbynet;

--
-- Name: advices_id_seq; Type: SEQUENCE; Schema: public; Owner: kanbynet
--

CREATE SEQUENCE public.advices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.advices_id_seq OWNER TO kanbynet;

--
-- Name: advices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kanbynet
--

ALTER SEQUENCE public.advices_id_seq OWNED BY public.advices.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: kanbynet
--

CREATE TABLE public.blogs (
    id integer NOT NULL,
    title text,
    description text,
    language text,
    author text,
    creation_date text,
    last_modify_date text,
    url_path text,
    thumbnail_url text,
    meta_title text,
    meta_description text,
    rendered_content text
);


ALTER TABLE public.blogs OWNER TO kanbynet;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: kanbynet
--

CREATE SEQUENCE public.blogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blogs_id_seq OWNER TO kanbynet;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kanbynet
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: kanbynet
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login_name text,
    creation_date text,
    password_hash text,
    profile_picture_url text,
    privilege text,
    public_name text
);


ALTER TABLE public.users OWNER TO kanbynet;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: kanbynet
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO kanbynet;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kanbynet
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: variables; Type: TABLE; Schema: public; Owner: kanbynet
--

CREATE TABLE public.variables (
    key character varying(255),
    value text[]
);


ALTER TABLE public.variables OWNER TO kanbynet;

--
-- Name: advices id; Type: DEFAULT; Schema: public; Owner: kanbynet
--

ALTER TABLE ONLY public.advices ALTER COLUMN id SET DEFAULT nextval('public.advices_id_seq'::regclass);


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: kanbynet
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: kanbynet
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: advices; Type: TABLE DATA; Schema: public; Owner: kanbynet
--

COPY public.advices (id, date, source, content_raw, content_rendered, title) FROM stdin;
38	1725510481525	Annem	Çanakkaleden geldiklerinde uyuyordum, ve gürültüden uyandım. Kardeşim Berat okula gitmek istemediği için ağlıyordu.\n\nBen uyandım gittim yanına, Annem de gitti.\n\nVe onu ikna etmeye çalıştık. ve aklıma ilkokul ortaokul ve lise yıllarım geldi. Koskoca 12 YIL.\n\nBerata dedim ki ne güzel önünde uzun yılların var.\n\nAnnem dedi ki zaman o kadar hızlı geçiyor ki anlayamıyorsun.\n\nNe yaşarsan yaşa, ne kadar zorluk çekersen çek, ne kadar mutlu olursan ol. zaman çok hızlı geçiyor.\n\nEvet kanbay, çocukken hep bir an önce büyümek isterdin. Şimdi büyüdün, kaybedecek zamanın yok.	<p>Çanakkaleden geldiklerinde uyuyordum, ve gürültüden uyandım. Kardeşim Berat okula gitmek istemediği için ağlıyordu.</p>\n<p>Ben uyandım gittim yanına, Annem de gitti.</p>\n<p>Ve onu ikna etmeye çalıştık. ve aklıma ilkokul ortaokul ve lise yıllarım geldi. Koskoca 12 YIL.</p>\n<p>Berata dedim ki ne güzel önünde uzun yılların var.</p>\n<p>Annem dedi ki zaman o kadar hızlı geçiyor ki anlayamıyorsun.</p>\n<p>Ne yaşarsan yaşa, ne kadar zorluk çekersen çek, ne kadar mutlu olursan ol. zaman çok hızlı geçiyor.</p>\n<p>Evet kanbay, çocukken hep bir an önce büyümek isterdin. Şimdi büyüdün, kaybedecek zamanın yok.</p>\n	Zaman çok hızlı akıyor, anlayamıyorsun
40	1725598268241	Yaşadoğım olay	Yılmaz abi beni aradı malum kaynakçı saadet partili olan, \n\n- **dedi ki** bizim gevşekleri hatırlıyor musun?\n\n(gevşekler dediği daha önce montaja gittiğimiz bir evdeki çocuklardı)\n\n- evet dedim.\n\n- **dedi ki** onların abisi benden bir şey rica etti, televizyon montaj işi varmış adam arıyormuş, benim de aklıma sen geldin. Bu çocuk kardeşleri gibi değil gerçekten düzgün bir insan 40 yılın başı bir şey istedi mahçup etme beni lütfen güzel insan.\n\n- emin misin düzgün olduğuna kefil olur musun?\n\n- evet, bu çocuk çok düzgün, tanıştığına mutlu olacaksın. Hem sana 2500 tl civarında para da vereceğini söyledi.\n\n\nneyse bana numarasını verdi çocuğun konuştuk, düzgün bir sesi vardı. Elektrikten anlamadığını söyledi ve gittiğimiz yerlerde televizyon montajını onun, ethernet kabo işlemini benim yapacağımı konuştuk ve anlaştık. nelerin gerektiğini konuştuk, malzeme listesi çıkardık.\n\nErtesi gün, buluştık ama bana buluşmadan önce birşeyleri söylemedi.\n\n1. Bu televizyonları kim ne amaçla takıyor?\n2. Wifi olur mu ethernet yerine?\n\nneyse bunları gün içinde konuştuk ve saat 8 deçıktığım eve saat gece 01:40 ta geldim. 	<p>Yılmaz abi beni aradı malum kaynakçı saadet partili olan,</p>\n<ul>\n<li><strong>dedi ki</strong> bizim gevşekleri hatırlıyor musun?</li>\n</ul>\n<p>(gevşekler dediği daha önce montaja gittiğimiz bir evdeki çocuklardı)</p>\n<ul>\n<li>\n<p>evet dedim.</p>\n</li>\n<li>\n<p><strong>dedi ki</strong> onların abisi benden bir şey rica etti, televizyon montaj işi varmış adam arıyormuş, benim de aklıma sen geldin. Bu çocuk kardeşleri gibi değil gerçekten düzgün bir insan 40 yılın başı bir şey istedi mahçup etme beni lütfen güzel insan.</p>\n</li>\n<li>\n<p>emin misin düzgün olduğuna kefil olur musun?</p>\n</li>\n<li>\n<p>evet, bu çocuk çok düzgün, tanıştığına mutlu olacaksın. Hem sana 2500 tl civarında para da vereceğini söyledi.</p>\n</li>\n</ul>\n<p>neyse bana numarasını verdi çocuğun konuştuk, düzgün bir sesi vardı. Elektrikten anlamadığını söyledi ve gittiğimiz yerlerde televizyon montajını onun, ethernet kabo işlemini benim yapacağımı konuştuk ve anlaştık. nelerin gerektiğini konuştuk, malzeme listesi çıkardık.</p>\n<p>Ertesi gün, buluştık ama bana buluşmadan önce birşeyleri söylemedi.</p>\n<ol>\n<li>Bu televizyonları kim ne amaçla takıyor?</li>\n<li>Wifi olur mu ethernet yerine?</li>\n</ol>\n<p>neyse bunları gün içinde konuştuk ve saat 8 deçıktığım eve saat gece 01:40 ta geldim.</p>\n	Televizyon Montajı
33	1725456425261	Remzi FIRAT	## Peçete Olayı\n\nBu olay ilk değil, tekstil de de denemelerimin başarısız olduğunu biliyordu, ve seyyar peçete satma fikri acayip geldi. neyse yaklaşık saat 9 dan 11 e kadar falan sokaklarda dolaşıp, bazı dükkanlara girip sorarak peçete satmaya çalıştım. ama olmadı ve bende bıraktım.\n\n- ve bana dayım yeterince uzun süre yapmadığım için başarısız olduğumu söyledi	<h2>Peçete Olayı</h2>\n<p>Bu olay ilk değil, tekstil de de denemelerimin başarısız olduğunu biliyordu, ve seyyar peçete satma fikri acayip geldi. neyse yaklaşık saat 9 dan 11 e kadar falan sokaklarda dolaşıp, bazı dükkanlara girip sorarak peçete satmaya çalıştım. ama olmadı ve bende bıraktım.</p>\n<ul>\n<li>ve bana dayım yeterince uzun süre yapmadığım için başarısız olduğumu söyledi</li>\n</ul>\n	Zaman vermeden, başarı olmaz
28	1725453728130	Instagram	the universe will put you in **same situation** over and over again `until you learn`\n\nuntil you learn to react differently\nuntil you learn to think differently\nuntil you learn that enough is enough\n\nRemember this:\n\nOld habits do not open new doors\n you must eliminate in order to evolve\n	<p>the universe will put you in <strong>same situation</strong> over and over again <code>until you learn</code></p>\n<p>until you learn to react differently\nuntil you learn to think differently\nuntil you learn that enough is enough</p>\n<p>Remember this:</p>\n<p>Old habits do not open new doors\nyou must eliminate in order to evolve</p>\n	Until You Learn
37	1725510278215	Babam	## Sorum sonrası atasözü söyledi\n\nBabama sorum şuydu,\n\n- Herkesin durumu farklı, kimisi inanılmaz zorluklarla karşı karşıya kalıp yılmadan usanmadan devam ediyor, yaşanabilecek her türlü zorlukla karşılaşıyor ve başarıya ulaşıyor,\n\n- Kimisi ise sanki başarı ona gelir gibi, azim çalışma hırs gibi şeyler çok yüksek olmadan yaşanabilecek en iyi olayları yaşayıp yine eline "başarı" geçiyor.\n\nBu durum nedir diye sordum.\n\nDedi ki \n\n> Oğlum, zor kazanılan zor kaybedilir\n\nve şu örneği verdi.\n\nbirisi iddia oynayarak koyduğu 100TL yi birkaç hemen 1000TL ye çevirebilir. ve bu olunca paranın kolay kazanıldığını zanneder ve o 1000TL yi de iddia ya yatırır. Yani o para onun için kolay risk edilebilecek bir para. Hiç plan yapmadan kaybeder hepsini. eğer zor yoldan kazanmış olsa idi o parayı o kadar kolay harcayamzdı.\n\nUnutma Zor kazanılan zor kaybedilir.	<h2>Sorum sonrası atasözü söyledi</h2>\n<p>Babama sorum şuydu,</p>\n<ul>\n<li>\n<p>Herkesin durumu farklı, kimisi inanılmaz zorluklarla karşı karşıya kalıp yılmadan usanmadan devam ediyor, yaşanabilecek her türlü zorlukla karşılaşıyor ve başarıya ulaşıyor,</p>\n</li>\n<li>\n<p>Kimisi ise sanki başarı ona gelir gibi, azim çalışma hırs gibi şeyler çok yüksek olmadan yaşanabilecek en iyi olayları yaşayıp yine eline &quot;başarı&quot; geçiyor.</p>\n</li>\n</ul>\n<p>Bu durum nedir diye sordum.</p>\n<p>Dedi ki</p>\n<blockquote>\n<p>Oğlum, zor kazanılan zor kaybedilir</p>\n</blockquote>\n<p>ve şu örneği verdi.</p>\n<p>birisi iddia oynayarak koyduğu 100TL yi birkaç hemen 1000TL ye çevirebilir. ve bu olunca paranın kolay kazanıldığını zanneder ve o 1000TL yi de iddia ya yatırır. Yani o para onun için kolay risk edilebilecek bir para. Hiç plan yapmadan kaybeder hepsini. eğer zor yoldan kazanmış olsa idi o parayı o kadar kolay harcayamzdı.</p>\n<p>Unutma Zor kazanılan zor kaybedilir.</p>\n	Zor Kazanılan Zor Kayabedilir
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: kanbynet
--

COPY public.blogs (id, title, description, language, author, creation_date, last_modify_date, url_path, thumbnail_url, meta_title, meta_description, rendered_content) FROM stdin;
2	My first blog	This is my first blog	Turkish	Emre Kanbay	1725137061063	\N	\N	\N	first blog meta title	meta desc	<h1>first blog</h1>\r\n<p>This website is still on developmenti now i am working on blog adding part.</p>\r\n<p><strong>31 agust 2024</strong></p>
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kanbynet
--

COPY public.users (id, login_name, creation_date, password_hash, profile_picture_url, privilege, public_name) FROM stdin;
5	EmreKanbay	15/08/2024	887b1b604d9fc0ebfbfdfd2512b15dd6db71a3fa59400626e2b5997c63d350e0	https://avatars.githubusercontent.com/u/80778171?v=4	admin	Emre Kanbay
6	test	date	aa	aas	dasa	asd
\.


--
-- Data for Name: variables; Type: TABLE DATA; Schema: public; Owner: kanbynet
--

COPY public.variables (key, value) FROM stdin;
languages	{Turkish,English}
\.


--
-- Name: advices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kanbynet
--

SELECT pg_catalog.setval('public.advices_id_seq', 42, true);


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kanbynet
--

SELECT pg_catalog.setval('public.blogs_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kanbynet
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: advices advices_pkey; Type: CONSTRAINT; Schema: public; Owner: kanbynet
--

ALTER TABLE ONLY public.advices
    ADD CONSTRAINT advices_pkey PRIMARY KEY (id);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: kanbynet
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: kanbynet
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

