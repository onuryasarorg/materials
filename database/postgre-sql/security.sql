
CREATE DATABASE "lemoras-security-db"
    WITH 
    OWNER = lemoras
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

\connect "lemoras-security-db"


CREATE SCHEMA kernel;


ALTER SCHEMA kernel OWNER TO lemoras;


CREATE SCHEMA security;


ALTER SCHEMA security OWNER TO lemoras;


CREATE TABLE kernel.application_module (
    application_module_id integer NOT NULL,
    application_id integer DEFAULT 0 NOT NULL,
    module_id integer DEFAULT 0 NOT NULL,
    business_logic_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE kernel.application_module OWNER TO lemoras;


CREATE SEQUENCE kernel.application_module_application_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kernel.application_module_application_module_id_seq OWNER TO lemoras;


ALTER SEQUENCE kernel.application_module_application_module_id_seq OWNED BY kernel.application_module.application_module_id;


CREATE TABLE kernel.business_logic (
    business_logic_id integer NOT NULL,
    business_logic_name character varying(50) DEFAULT '0'::character varying NOT NULL,
    business_service_id integer NOT NULL,
    unique_key character varying(50) NOT NULL
);


ALTER TABLE kernel.business_logic OWNER TO lemoras;


CREATE SEQUENCE kernel.business_logic_business_logic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kernel.business_logic_business_logic_id_seq OWNER TO lemoras;


ALTER SEQUENCE kernel.business_logic_business_logic_id_seq OWNED BY kernel.business_logic.business_logic_id;


CREATE TABLE kernel.business_service (
    business_service_id integer NOT NULL,
    business_service_name character varying(50) DEFAULT '0'::character varying,
    business_service_key character varying(50) DEFAULT '0'::character varying NOT NULL
);


ALTER TABLE kernel.business_service OWNER TO lemoras;


CREATE SEQUENCE kernel.business_service_business_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kernel.business_service_business_service_id_seq OWNER TO lemoras;


ALTER SEQUENCE kernel.business_service_business_service_id_seq OWNED BY kernel.business_service.business_service_id;


CREATE TABLE kernel.command (
    command_id integer NOT NULL,
    command_name character varying(50) DEFAULT '0'::character varying NOT NULL,
    business_service_id integer NOT NULL
);


ALTER TABLE kernel.command OWNER TO lemoras;

CREATE SEQUENCE kernel.command_command_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kernel.command_command_id_seq OWNER TO lemoras;


ALTER SEQUENCE kernel.command_command_id_seq OWNED BY kernel.command.command_id;


CREATE TABLE kernel.role_authorise (
    role_authorise_id integer NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    command_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE kernel.role_authorise OWNER TO lemoras;

CREATE SEQUENCE kernel.role_authorise_role_authorise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kernel.role_authorise_role_authorise_id_seq OWNER TO lemoras;


ALTER SEQUENCE kernel.role_authorise_role_authorise_id_seq OWNED BY kernel.role_authorise.role_authorise_id;

--
-- TOC entry 243 (class 1259 OID 16519)
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: security; Owner: lemoras
--

CREATE SEQUENCE security.user_user_id_seq
    START WITH 21
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE security.user_user_id_seq OWNER TO lemoras;


CREATE TABLE security."user" (
    user_id integer DEFAULT nextval('security.user_user_id_seq'::regclass) NOT NULL,
    username character varying(50) DEFAULT '0'::character varying NOT NULL,
    password character varying(50) DEFAULT '0'::character varying NOT NULL,
    email character varying(50) DEFAULT '0'::character varying NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    active boolean,
    last_login_date timestamp without time zone
);


ALTER TABLE security."user" OWNER TO lemoras;


CREATE SEQUENCE security.user_contact_user_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE security.user_contact_user_contact_id_seq OWNER TO lemoras;


CREATE TABLE security.user_contact (
    user_contact_id integer DEFAULT nextval('security.user_contact_user_contact_id_seq'::regclass) NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    phone character varying(13) DEFAULT '0'::character varying NOT NULL,
    fax character varying(13) DEFAULT '0'::character varying NOT NULL
);


ALTER TABLE security.user_contact OWNER TO lemoras;


CREATE SEQUENCE security.user_role_user_role_id_seq
    START WITH 31
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE security.user_role_user_role_id_seq OWNER TO lemoras;

CREATE TABLE security.user_role (
    user_role_id integer DEFAULT nextval('security.user_role_user_role_id_seq'::regclass) NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    application_instance_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    application_id integer NOT NULL,
    application_tag_name character varying(50)
);


ALTER TABLE security.user_role OWNER TO lemoras;


--
-- TOC entry 2967 (class 2604 OID 16600)
-- Name: application_module application_module_id; Type: DEFAULT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.application_module ALTER COLUMN application_module_id SET DEFAULT nextval('kernel.application_module_application_module_id_seq'::regclass);


--
-- TOC entry 2969 (class 2604 OID 16601)
-- Name: business_logic business_logic_id; Type: DEFAULT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.business_logic ALTER COLUMN business_logic_id SET DEFAULT nextval('kernel.business_logic_business_logic_id_seq'::regclass);


--
-- TOC entry 2972 (class 2604 OID 16602)
-- Name: business_service business_service_id; Type: DEFAULT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.business_service ALTER COLUMN business_service_id SET DEFAULT nextval('kernel.business_service_business_service_id_seq'::regclass);


--
-- TOC entry 2974 (class 2604 OID 16603)
-- Name: command command_id; Type: DEFAULT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.command ALTER COLUMN command_id SET DEFAULT nextval('kernel.command_command_id_seq'::regclass);


--
-- TOC entry 2977 (class 2604 OID 16604)
-- Name: role_authorise role_authorise_id; Type: DEFAULT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.role_authorise ALTER COLUMN role_authorise_id SET DEFAULT nextval('kernel.role_authorise_role_authorise_id_seq'::regclass);


--
-- TOC entry 3283 (class 0 OID 16465)
-- Dependencies: 228
-- Data for Name: application_module; Type: TABLE DATA; Schema: kernel; Owner: lemoras
--

COPY kernel.application_module (application_module_id, application_id, module_id, business_logic_id) FROM stdin;
19	6	5	4
20	6	3	5
21	6	4	7
23	6	7	8
27	6	6	8
28	6	8	17
32	6	10	8
33	6	2	8
34	6	9	8
46	2	4	12
47	2	7	13
50	2	5	9
55	1	4	12
57	6	23	7
58	6	16	8
59	6	17	8
60	6	18	15
61	6	19	8
62	6	20	8
63	6	22	8
64	6	24	8
65	6	25	8
\.


--
-- TOC entry 3285 (class 0 OID 16473)
-- Dependencies: 230
-- Data for Name: business_logic; Type: TABLE DATA; Schema: kernel; Owner: lemoras
--

COPY kernel.business_logic (business_logic_id, business_logic_name, business_service_id, unique_key) FROM stdin;
4	Application_Default_Logic	1	ApplicationService
5	Company_Default_Logic	2	CompanyService
6	Config_Default_Logic	3	ConfigService
7	User_Default_logic	4	UserService
8	System_Default_logic	5	SystemService
9	Application_Limited_Logic	1	LimitedApplicationService
12	User_Limited_Logic	4	LimitedUserService
13	System_Limited_Logic	5	LimitedSystemService
15	Menu_Default_Logic	6	MenuService
16	Menu_Limited_Logic	6	LimitedMenuService
17	Page_Default_Logic	7	PageService
18	Page_Limited_logic	7	LimitedPageService
\.


--
-- TOC entry 3287 (class 0 OID 16479)
-- Dependencies: 232
-- Data for Name: business_service; Type: TABLE DATA; Schema: kernel; Owner: lemoras
--

COPY kernel.business_service (business_service_id, business_service_name, business_service_key) FROM stdin;
1	Application Service	IApplicationService
2	Company Service	ICompanyService
3	Config Service	IConfigService
4	User Service	IUserService
5	System Service	ISystemService
6	Menu Service	IMenuService
7	Page Service	IPageService
\.


--
-- TOC entry 3289 (class 0 OID 16486)
-- Dependencies: 234
-- Data for Name: command; Type: TABLE DATA; Schema: kernel; Owner: lemoras
--

COPY kernel.command (command_id, command_name, business_service_id) FROM stdin;
1	AddNewApplication	1
2	DeleteApplication	1
3	RemoveApplicationFromCompany	1
4	AttachToApplicationAtCompany	1
5	SetActiveToApplication	1
6	SetPassiveToApplication	1
8	GetApplicationsOfCompany	1
9	GetApplications	1
10	GetApplicationTypes	1
11	GetApplicationType	1
12	CreateRoleToApplication	1
13	RemoveRoleFromApplication	1
14	GetRolesOfApplication	1
15	GetApplicationsOfRole	1
16	AddNewCompany	2
17	DeleteCompany	2
18	UpdateCompany	2
19	SetActiveToCompany	2
20	SetPassiveToCompany	2
21	GetCompanies	2
22	GetCompany	2
24	AddNewUser	4
25	DeleteUser	4
26	RemoveUserFromApplicationAndRole	4
27	AttachToUserAtApplicationAndRole	4
28	SetActiveToUser	4
29	SetPassiveToUser	4
30	GetUsersOfCompany	4
31	GetUsersOfApplication	4
32	GetUsers	4
33	GetUserRole	4
34	GetMyProfile	4
35	AddNewModule	5
36	DeleteModule	5
37	AttachToPageAtModule	5
38	AttachToCommandAtRole	5
39	AttachToModuleAtMicroservice	5
40	AddNewPage	5
41	DeletePage	5
42	AddNewCommand	5
43	DeleteCommand	5
44	AddNewBusinessLogic	5
45	DeleteBusinessLogic	5
46	AddNewMicroservice	5
47	DeleteMicroservice	5
48	GetMicroservices	5
49	GetMicroserviceModules	5
50	GetModules	5
51	GetModuleRoutes	5
52	GetRoles	5
53	GetRoleAuthorises	5
54	GetRoutes	5
55	GetCommands	5
56	GetBusinessLogics	5
57	GetApplicationModules	1
58	UpdateProfile	4
59	AddNewApplicationType	1
60	GetApplicationsOfCompanies	1
61	DeleteApplicationType	1
63	DeleteRoleAuthorise	5
64	DeleteMicroserviceModule	5
65	DeleteApplicationModule	1
66	AddNewApplicationModule	1
69	GetBusinessServices	5
70	AddNewBusinessService	5
71	DeleteBusinessService	5
72	GetLanguages	5
73	AddLanguage	5
74	DeleteLanguage	5
75	GetTemplates	5
76	AddTemplate	5
77	DeleteTemplate	5
78	GetMenus	6
79	AddMenu	6
80	DeleteMenu	6
81	GetMenuIcons	6
82	AddMenuIcon	6
83	DeleteMenuIcon	6
84	GetMenuTypes	6
85	AddMenuType	6
86	DeleteMenuType	6
87	GetMenuValues	6
88	AddMenuValue	6
89	DeleteMenuValue	6
90	GetPages	7
91	AddPage	7
96	GetPageDetails	7
97	AddPageDetail	7
98	DeletePageDetail	7
99	GetPageProperties	7
100	AddPageProperty	7
101	DeletePageProperty	7
\.


--
-- TOC entry 3291 (class 0 OID 16492)
-- Dependencies: 236
-- Data for Name: role_authorise; Type: TABLE DATA; Schema: kernel; Owner: lemoras
--

COPY kernel.role_authorise (role_authorise_id, role_id, command_id) FROM stdin;
4	7	1
5	7	2
6	7	3
7	7	4
8	7	5
9	7	6
10	7	16
11	7	24
12	7	27
14	7	12
16	7	17
17	7	25
18	7	9
19	7	8
22	7	15
23	7	11
24	7	10
26	7	21
27	7	22
29	7	14
30	7	33
31	7	32
32	7	31
33	7	30
34	7	13
35	7	26
36	7	19
37	7	28
39	7	20
41	7	29
43	7	18
44	7	34
45	7	35
46	7	36
47	7	37
48	7	38
49	7	39
50	7	40
51	7	41
54	7	42
55	7	43
56	7	44
57	7	45
58	7	46
59	7	47
60	7	48
61	7	49
62	7	50
63	7	51
64	7	52
65	7	53
66	7	54
67	7	55
68	7	56
69	7	57
70	7	58
71	7	59
74	7	60
75	7	61
78	7	63
80	7	64
81	7	65
82	7	66
89	5	34
91	6	34
92	6	32
94	6	14
95	6	60
96	6	33
97	11	34
98	6	24
99	7	70
100	7	69
101	7	71
102	7	72
103	7	73
104	7	74
105	7	75
106	7	76
107	7	77
108	7	78
109	7	79
110	7	80
111	7	81
112	7	82
113	7	83
114	7	84
115	7	85
116	7	86
117	7	87
118	7	88
119	7	89
120	7	90
121	7	91
124	7	96
125	7	97
126	7	98
127	7	99
128	7	100
129	7	101
\.


--
-- TOC entry 3299 (class 0 OID 16521)
-- Dependencies: 244
-- Data for Name: user; Type: TABLE DATA; Schema: security; Owner: lemoras
--

COPY security."user" (user_id, username, password, email, first_name, last_name, active, last_login_date) FROM stdin;
1	admin	admin	onur.yasar@tatilsepeti.com	onur	yaşar	t	2019-10-20 11:05:28
2	omerdelikaya	123456	omder.delikaya@sompojapan.com.tr	Ömer	Delikaya	t	2019-03-08 09:33:10
3	sabri	123	sabri@umur.com.tr	Sabri Asil	Eyüp	t	2019-07-16 17:27:34
24	dila	dila	dila.coskun@umur.com.tr	dila	coşkun	t	2019-04-05 06:37:38
25	hasan	hasan	hasan@gmail.com	hasan	yaşar	t	2019-06-30 12:12:41
26	omer	123	omer@lemoras.com	Hasan Ömer	Yaşar	t	2019-06-30 13:30:39
\.


--
-- TOC entry 3301 (class 0 OID 16530)
-- Dependencies: 246
-- Data for Name: user_contact; Type: TABLE DATA; Schema: security; Owner: lemoras
--

COPY security.user_contact (user_contact_id, user_id, phone, fax) FROM stdin;
1	1	0	0
\.


--
-- TOC entry 3303 (class 0 OID 16539)
-- Dependencies: 248
-- Data for Name: user_role; Type: TABLE DATA; Schema: security; Owner: lemoras
--

COPY security.user_role (user_role_id, user_id, application_instance_id, role_id, application_id, application_tag_name) FROM stdin;
32	1	8	11	1	Lemoras E-Ticaret
34	2	5	5	2	Sompo E-Commerce
35	3	5	5	2	Sompo E-Commerce
36	24	5	5	2	Sompo E-Commerce
38	25	5	6	2	Sompo E-Commerce
39	26	8	11	1	Lemoras E-Ticaret
41	1	5	6	2	Sompo E-Commerce
40	1	7	7	6	Tüm Sistemin Admin Uygulaması
\.


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 229
-- Name: application_module_application_module_id_seq; Type: SEQUENCE SET; Schema: kernel; Owner: lemoras
--

SELECT pg_catalog.setval('kernel.application_module_application_module_id_seq', 65, true);


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 231
-- Name: business_logic_business_logic_id_seq; Type: SEQUENCE SET; Schema: kernel; Owner: lemoras
--

SELECT pg_catalog.setval('kernel.business_logic_business_logic_id_seq', 18, true);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 233
-- Name: business_service_business_service_id_seq; Type: SEQUENCE SET; Schema: kernel; Owner: lemoras
--

SELECT pg_catalog.setval('kernel.business_service_business_service_id_seq', 7, true);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 235
-- Name: command_command_id_seq; Type: SEQUENCE SET; Schema: kernel; Owner: lemoras
--

SELECT pg_catalog.setval('kernel.command_command_id_seq', 101, true);


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 237
-- Name: role_authorise_role_authorise_id_seq; Type: SEQUENCE SET; Schema: kernel; Owner: lemoras
--

SELECT pg_catalog.setval('kernel.role_authorise_role_authorise_id_seq', 129, true);


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 245
-- Name: user_contact_user_contact_id_seq; Type: SEQUENCE SET; Schema: security; Owner: lemoras
--

SELECT pg_catalog.setval('security.user_contact_user_contact_id_seq', 1, true);


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 247
-- Name: user_role_user_role_id_seq; Type: SEQUENCE SET; Schema: security; Owner: lemoras
--

SELECT pg_catalog.setval('security.user_role_user_role_id_seq', 41, true);


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 243
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: security; Owner: lemoras
--

SELECT pg_catalog.setval('security.user_user_id_seq', 26, true);


--
-- TOC entry 3050 (class 2606 OID 16639)
-- Name: application_module application_module_pkey; Type: CONSTRAINT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.application_module
    ADD CONSTRAINT application_module_pkey PRIMARY KEY (application_module_id);


--
-- TOC entry 3053 (class 2606 OID 16641)
-- Name: business_logic business_logic_pkey; Type: CONSTRAINT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.business_logic
    ADD CONSTRAINT business_logic_pkey PRIMARY KEY (business_logic_id);


--
-- TOC entry 3055 (class 2606 OID 16643)
-- Name: business_service business_service_pkey; Type: CONSTRAINT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.business_service
    ADD CONSTRAINT business_service_pkey PRIMARY KEY (business_service_id);


--
-- TOC entry 3058 (class 2606 OID 16645)
-- Name: command command_command_name_key; Type: CONSTRAINT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.command
    ADD CONSTRAINT command_command_name_key UNIQUE (command_name);


--
-- TOC entry 3060 (class 2606 OID 16647)
-- Name: command command_pkey; Type: CONSTRAINT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.command
    ADD CONSTRAINT command_pkey PRIMARY KEY (command_id);


--
-- TOC entry 3064 (class 2606 OID 16649)
-- Name: role_authorise role_authorise_pkey; Type: CONSTRAINT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.role_authorise
    ADD CONSTRAINT role_authorise_pkey PRIMARY KEY (role_authorise_id);


--
-- TOC entry 3076 (class 2606 OID 16655)
-- Name: user_contact user_contact_pkey; Type: CONSTRAINT; Schema: security; Owner: lemoras
--

ALTER TABLE ONLY security.user_contact
    ADD CONSTRAINT user_contact_pkey PRIMARY KEY (user_contact_id);


--
-- TOC entry 3073 (class 2606 OID 16657)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: security; Owner: lemoras
--

ALTER TABLE ONLY security."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3079 (class 2606 OID 16659)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: security; Owner: lemoras
--

ALTER TABLE ONLY security.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_role_id);


--
-- TOC entry 3046 (class 1259 OID 16679)
-- Name: application_module_FK_application_module_appliaciton; Type: INDEX; Schema: kernel; Owner: lemoras
--

CREATE INDEX "application_module_FK_application_module_appliaciton" ON kernel.application_module USING btree (application_id);


--
-- TOC entry 3047 (class 1259 OID 16680)
-- Name: application_module_FK_application_module_business_logic; Type: INDEX; Schema: kernel; Owner: lemoras
--

CREATE INDEX "application_module_FK_application_module_business_logic" ON kernel.application_module USING btree (business_logic_id);


--
-- TOC entry 3048 (class 1259 OID 16681)
-- Name: application_module_FK_application_module_module; Type: INDEX; Schema: kernel; Owner: lemoras
--

CREATE INDEX "application_module_FK_application_module_module" ON kernel.application_module USING btree (module_id);


--
-- TOC entry 3051 (class 1259 OID 16682)
-- Name: business_logic_FK_business_logic_business_service; Type: INDEX; Schema: kernel; Owner: lemoras
--

CREATE INDEX "business_logic_FK_business_logic_business_service" ON kernel.business_logic USING btree (business_service_id);


--
-- TOC entry 3056 (class 1259 OID 16683)
-- Name: command_FK_command_business_service; Type: INDEX; Schema: kernel; Owner: lemoras
--

CREATE INDEX "command_FK_command_business_service" ON kernel.command USING btree (business_service_id);


--
-- TOC entry 3061 (class 1259 OID 16684)
-- Name: role_authorise_FK_role_authorise_role; Type: INDEX; Schema: kernel; Owner: lemoras
--

CREATE INDEX "role_authorise_FK_role_authorise_role" ON kernel.role_authorise USING btree (role_id);


--
-- TOC entry 3062 (class 1259 OID 16685)
-- Name: role_authorise_FK_role_authorise_route; Type: INDEX; Schema: kernel; Owner: lemoras
--

CREATE INDEX "role_authorise_FK_role_authorise_route" ON kernel.role_authorise USING btree (command_id);


--
-- TOC entry 3074 (class 1259 OID 16689)
-- Name: user_contact_FK_user_contact_user; Type: INDEX; Schema: security; Owner: lemoras
--

CREATE INDEX "user_contact_FK_user_contact_user" ON security.user_contact USING btree (user_id);


--
-- TOC entry 3077 (class 1259 OID 16690)
-- Name: user_role_FK_user_role_user; Type: INDEX; Schema: security; Owner: lemoras
--

CREATE INDEX "user_role_FK_user_role_user" ON security.user_role USING btree (user_id);

--
-- TOC entry 3112 (class 2606 OID 16743)
-- Name: application_module FK_application_module_business_logic; Type: FK CONSTRAINT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.application_module
    ADD CONSTRAINT "FK_application_module_business_logic" FOREIGN KEY (business_logic_id) REFERENCES kernel.business_logic(business_logic_id) ON UPDATE RESTRICT ON DELETE RESTRICT;

--
-- TOC entry 3114 (class 2606 OID 16753)
-- Name: business_logic FK_business_logic_business_service; Type: FK CONSTRAINT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.business_logic
    ADD CONSTRAINT "FK_business_logic_business_service" FOREIGN KEY (business_service_id) REFERENCES kernel.business_service(business_service_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3115 (class 2606 OID 16758)
-- Name: command FK_command_business_service; Type: FK CONSTRAINT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.command
    ADD CONSTRAINT "FK_command_business_service" FOREIGN KEY (business_service_id) REFERENCES kernel.business_service(business_service_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3116 (class 2606 OID 16763)
-- Name: role_authorise FK_role_authorise_command; Type: FK CONSTRAINT; Schema: kernel; Owner: lemoras
--

ALTER TABLE ONLY kernel.role_authorise
    ADD CONSTRAINT "FK_role_authorise_command" FOREIGN KEY (command_id) REFERENCES kernel.command(command_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3121 (class 2606 OID 16788)
-- Name: user_contact FK_user_contact_user; Type: FK CONSTRAINT; Schema: security; Owner: lemoras
--

ALTER TABLE ONLY security.user_contact
    ADD CONSTRAINT "FK_user_contact_user" FOREIGN KEY (user_id) REFERENCES security."user"(user_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3124 (class 2606 OID 16803)
-- Name: user_role FK_user_role_user; Type: FK CONSTRAINT; Schema: security; Owner: lemoras
--

ALTER TABLE ONLY security.user_role
    ADD CONSTRAINT "FK_user_role_user" FOREIGN KEY (user_id) REFERENCES security."user"(user_id) ON UPDATE RESTRICT ON DELETE RESTRICT;

	