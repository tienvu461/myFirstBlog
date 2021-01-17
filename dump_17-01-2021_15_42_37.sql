--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE blogdb;




--
-- Drop roles
--

DROP ROLE blogdb;


--
-- Roles
--

CREATE ROLE blogdb;
ALTER ROLE blogdb WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5dbd6de03bbf033f95fadfb93b2e957e1';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: blogdb
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO blogdb;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: blogdb
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: blogdb
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: blogdb
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "blogdb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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
-- Name: blogdb; Type: DATABASE; Schema: -; Owner: blogdb
--

CREATE DATABASE blogdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE blogdb OWNER TO blogdb;

\connect blogdb

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO blogdb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO blogdb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO blogdb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO blogdb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO blogdb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO blogdb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO blogdb;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO blogdb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO blogdb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO blogdb;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO blogdb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO blogdb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: blogApp_blogpost; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public."blogApp_blogpost" (
    id integer NOT NULL,
    created_date timestamp with time zone NOT NULL,
    mod_date timestamp with time zone,
    title character varying(50) NOT NULL,
    body text NOT NULL,
    author_id integer,
    slug character varying(200),
    status integer NOT NULL
);


ALTER TABLE public."blogApp_blogpost" OWNER TO blogdb;

--
-- Name: blogApp_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public."blogApp_blogpost_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."blogApp_blogpost_id_seq" OWNER TO blogdb;

--
-- Name: blogApp_blogpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public."blogApp_blogpost_id_seq" OWNED BY public."blogApp_blogpost".id;


--
-- Name: blogApp_genericconfig; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public."blogApp_genericconfig" (
    id integer NOT NULL,
    blog_name character varying(50) NOT NULL,
    welcome_phrase character varying(200) NOT NULL,
    short_description character varying(200) NOT NULL,
    brief_intro character varying(200) NOT NULL,
    social_url character varying(50) NOT NULL,
    config_name character varying(50) NOT NULL,
    in_use boolean NOT NULL
);


ALTER TABLE public."blogApp_genericconfig" OWNER TO blogdb;

--
-- Name: blogApp_genericconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public."blogApp_genericconfig_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."blogApp_genericconfig_id_seq" OWNER TO blogdb;

--
-- Name: blogApp_genericconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public."blogApp_genericconfig_id_seq" OWNED BY public."blogApp_genericconfig".id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO blogdb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO blogdb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO blogdb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO blogdb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO blogdb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: blogdb
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO blogdb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blogdb
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: blogdb
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO blogdb;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blogApp_blogpost id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public."blogApp_blogpost" ALTER COLUMN id SET DEFAULT nextval('public."blogApp_blogpost_id_seq"'::regclass);


--
-- Name: blogApp_genericconfig id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public."blogApp_genericconfig" ALTER COLUMN id SET DEFAULT nextval('public."blogApp_genericconfig_id_seq"'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add post	7	add_post
26	Can change post	7	change_post
27	Can delete post	7	delete_post
28	Can view post	7	view_post
29	Can add blog post	8	add_blogpost
30	Can change blog post	8	change_blogpost
31	Can delete blog post	8	delete_blogpost
32	Can view blog post	8	view_blogpost
33	Can add generic config	9	add_genericconfig
34	Can change generic config	9	change_genericconfig
35	Can delete generic config	9	delete_genericconfig
36	Can view generic config	9	view_genericconfig
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$9DO6aqSxehyM$1pRFl7vzcMdzYYy2T7Pu8Fxbj9ihaFZpnGxSWuxXz7s=	2021-01-16 13:03:17.577306+00	t	tienvv			tienvu461@gmail.com	t	t	2021-01-16 12:57:05.469631+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blogApp_blogpost; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public."blogApp_blogpost" (id, created_date, mod_date, title, body, author_id, slug, status) FROM stdin;
1	2021-01-16 15:49:57+00	\N	Hello World!	_~English below~_\r\n\r\n\r\nHừm....\r\n\r\nViết gì giờ nhỉ?\r\n\r\nChắc là nguyên nhân về sự tồn tại của cái blog này???\r\n\r\nChào mừng đến với blog của tienvv, sau quãng thời gian ấp ủ và thai nghén suốt vài tháng, cuối cùng thì mình cũng có thời gian để ngồi lại, mày mò và gõ lạch cạch để ra một cái blog nho nhỏ để chia sẻ và cũng như là để lưu lại chút kỉ niệm đời thường.\r\n\r\nNội dung của chiếc blog này chắc là loanh quanh cuộc sống hằng ngày, tình cảm, gia đình, một chút công nghệ và công việc của mình nữa.\r\n\r\nĐón xem!!!\r\n\r\n---\r\n\r\nHmmm....\r\n\r\nWhat to write about?\r\n\r\nMay be about the story how this blog is on???\r\n\r\nWelcome to tienvv's blog. Well... after a very long long time of thinking and procastinating, I have finally reach to a decision to sit down and take a real efford to build up and publish this blog site. With an intention to have a little corner to write and to share my memory.\r\n\r\nThis blog's content will be about every day life, love, family and technologies, especially on computer technology which is my profession.\r\n\r\nSo stay tune and wait for more!!!\r\n\r\n---\r\n\r\n<p align="right">\r\n11th December, 2020\r\n\r\n</br>\r\n\r\nTien Vu\r\n</p>\r\n\r\n<p align="center">\r\n  <img width="460" src="/media/backgrounds/2021/01/17/stay-tuned-neon-signs-style-text_118419-1374.jpg">\r\n</p>	1	hello-world	1
2	2021-01-17 03:30:44+00	\N	test mardown	# myFirstBlog\r\ntrying to host my first blog\r\n\r\n# For Windows User\r\n1. Install Ubuntu 20.04 on WSL 2 \r\nhttps://ubuntu.com/blog/ubuntu-on-wsl-2-is-generally-available\r\nhttps://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly\r\n\r\n2. Install Terminal\r\nhttps://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701\r\n\r\n3. Install Docker Desktop to work with Ubuntu on WSL 2\r\nhttps://docs.docker.com/docker-for-windows/wsl/\r\n\r\n4. Install Docker & Docker compose on Ubuntu on WSL 2\r\n### Open Terminal with Ubuntu \r\n```\r\nsudo apt-get install docker.io\r\n```\r\n5. Check all prerequisites are completed:\r\n```\r\ndocker --version \r\nDocker version 20.10.2, build 2291f61\r\ndocker-compose --version\r\ndocker-compose version 1.27.4, build 40524192\r\npip --version\r\npip 20.0.2 from /usr/lib/python3/dist-packages/pip (python 3.8)\r\npython --version\r\nPython 3.8.5\r\n```\r\n\r\n6. Start services\r\n### Build and start docker \r\n```\r\ndocker-compose up -d --build\r\n```\r\n### Tail logs\r\n```\r\ndocker-compose logs -f\r\n```\r\n### Create superuser\r\n```\r\ndocker-compose exec web python manage.py createsuperuser\r\n```\r\n### Check db\r\n```\r\ndocker-compose exec db psql --username=blogdb --dbname=blogdb\r\n```\r\n### Restore db\r\n```\r\ncat postgresql_dump.sql | docker exec -i myfirstblog_postgresql_1 psql -U blogdb\r\n```\r\n# Reference\r\n\r\nhttps://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/\r\nhttps://github.com/developerayyo/django-blog/blob/master/blog/templates/blog/post/detail.html\r\nhttps://github.com/rileypredum/Your_Blog_Part_2/blob/master/src/templates/read_article.html\r\n\r\n# Image\r\n\r\n![alt text](https://github.com/n48.png "Logo Title")\r\n![alt text](/media/backgrounds/2021/01/17/stay-tuned-neon-signs-style-text_118419-1374.jpg)	1	\N	0
3	2021-01-17 07:31:49+00	\N	Test author	test author	1	\N	0
\.


--
-- Data for Name: blogApp_genericconfig; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public."blogApp_genericconfig" (id, blog_name, welcome_phrase, short_description, brief_intro, social_url, config_name, in_use) FROM stdin;
2	myBlog	Welcome	Description	Hello	www.example.com	default	f
1	tienvv's blog	Welcome to tienvv's Humble Corner	Everyday love, life, family and technologies	Let's get to know each other via my social media links below	https://www.linkedin.com/in/tienvu461/	tienvv	t
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-01-16 13:03:32.477186+00	1	Hello World!	1	[{"added": {}}]	7	1
2	2021-01-16 15:51:12.665406+00	1	BlogPost object (1)	1	[{"added": {}}]	8	1
3	2021-01-17 03:30:31.582885+00	1	BlogPost object (1)	2	[{"changed": {"fields": ["Body"]}}]	8	1
4	2021-01-17 03:30:53.165481+00	2	BlogPost object (2)	1	[{"added": {}}]	8	1
5	2021-01-17 03:35:53.446518+00	2	BlogPost object (2)	2	[{"changed": {"fields": ["Body"]}}]	8	1
6	2021-01-17 03:36:59.894827+00	2	BlogPost object (2)	2	[{"changed": {"fields": ["Body", "Background image"]}}]	8	1
7	2021-01-17 03:37:23.587919+00	2	BlogPost object (2)	2	[{"changed": {"fields": ["Body"]}}]	8	1
8	2021-01-17 03:41:48.0335+00	2	BlogPost object (2)	2	[{"changed": {"fields": ["Body"]}}]	8	1
9	2021-01-17 03:42:49.397538+00	2	BlogPost object (2)	2	[{"changed": {"fields": ["Background image"]}}]	8	1
10	2021-01-17 03:43:28.35112+00	2	BlogPost object (2)	2	[{"changed": {"fields": ["Background image"]}}]	8	1
11	2021-01-17 04:22:58.099332+00	1	BlogPost object (1)	2	[{"changed": {"fields": ["Body"]}}]	8	1
12	2021-01-17 04:24:52.839031+00	1	BlogPost object (1)	2	[{"changed": {"fields": ["Body"]}}]	8	1
13	2021-01-17 04:26:19.087507+00	1	BlogPost object (1)	2	[{"changed": {"fields": ["Body"]}}]	8	1
14	2021-01-17 04:27:25.184496+00	1	BlogPost object (1)	2	[{"changed": {"fields": ["Body"]}}]	8	1
15	2021-01-17 07:30:32.986098+00	1	BlogPost object (1)	2	[]	8	1
16	2021-01-17 07:32:01.561756+00	3	BlogPost object (3)	1	[{"added": {}}]	8	1
17	2021-01-17 07:40:45.805487+00	1	Hello World!	2	[{"changed": {"fields": ["Slug", "Status"]}}]	8	1
18	2021-01-17 08:05:42.792388+00	1	GenericConfig object (1)	1	[{"added": {}}]	9	1
19	2021-01-17 08:13:00.870702+00	1	GenericConfig object (1)	2	[{"changed": {"fields": ["In use"]}}]	9	1
20	2021-01-17 08:13:18.665249+00	2	GenericConfig object (2)	1	[{"added": {}}]	9	1
21	2021-01-17 08:13:25.402059+00	1	GenericConfig object (1)	2	[{"changed": {"fields": ["Config name"]}}]	9	1
22	2021-01-17 08:13:29.554409+00	1	GenericConfig object (1)	2	[{"changed": {"fields": ["In use"]}}]	9	1
23	2021-01-17 08:36:04.156997+00	1	Hello World!	2	[{"changed": {"fields": ["Body"]}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	blogApp	post
8	blogApp	blogpost
9	blogApp	genericconfig
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-01-16 12:54:45.987259+00
2	auth	0001_initial	2021-01-16 12:54:46.095204+00
3	admin	0001_initial	2021-01-16 12:54:46.208407+00
4	admin	0002_logentry_remove_auto_add	2021-01-16 12:54:46.236833+00
5	admin	0003_logentry_add_action_flag_choices	2021-01-16 12:54:46.252147+00
6	contenttypes	0002_remove_content_type_name	2021-01-16 12:54:46.280281+00
7	auth	0002_alter_permission_name_max_length	2021-01-16 12:54:46.295903+00
8	auth	0003_alter_user_email_max_length	2021-01-16 12:54:46.31137+00
9	auth	0004_alter_user_username_opts	2021-01-16 12:54:46.324989+00
10	auth	0005_alter_user_last_login_null	2021-01-16 12:54:46.339653+00
11	auth	0006_require_contenttypes_0002	2021-01-16 12:54:46.346129+00
12	auth	0007_alter_validators_add_error_messages	2021-01-16 12:54:46.35894+00
13	auth	0008_alter_user_username_max_length	2021-01-16 12:54:46.381555+00
14	auth	0009_alter_user_last_name_max_length	2021-01-16 12:54:46.396457+00
15	auth	0010_alter_group_name_max_length	2021-01-16 12:54:46.411392+00
16	auth	0011_update_proxy_permissions	2021-01-16 12:54:46.425005+00
17	auth	0012_alter_user_first_name_max_length	2021-01-16 12:54:46.439163+00
18	blogApp	0001_initial	2021-01-16 12:54:46.478647+00
19	sessions	0001_initial	2021-01-16 12:54:46.515522+00
21	blogApp	0003_auto_20210117_1139	2021-01-17 07:29:05.033871+00
22	blogApp	0004_auto_20210117_1429	2021-01-17 07:29:05.111672+00
23	blogApp	0004_auto_20210117_1440	2021-01-17 07:40:05.863292+00
24	blogApp	0005_genericconfig	2021-01-17 08:03:00.544794+00
25	blogApp	0006_auto_20210117_1511	2021-01-17 08:11:48.062707+00
20	blogApp	0002_blogpost	2021-01-16 15:49:50.724607+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: blogdb
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
hbbaq6hnyqeewaunkabz3anjja0hasrf	.eJxVjDsOwjAQBe_iGlneJf5R0ucM1trr4ACypTipEHeHSCmgfTPzXiLQtpaw9byEmcVFgDj9bpHSI9cd8J3qrcnU6rrMUe6KPGiXY-P8vB7u30GhXr51JGsgW28Jzs4jRtKoPQxk2HnjDKNRiSYHwENy2SNPqEhpy9YzGBbvD8fbN1A:1l0l8e:7glU6GkKbi58H5hFgx5HhE77zn6xFfhpliKyaXcgP-s	2021-01-30 12:57:08.84824+00
5pp795zw5dng6vo27yt15p3ll2el9ldp	.eJxVjDsOwjAQBe_iGlneJf5R0ucM1trr4ACypTipEHeHSCmgfTPzXiLQtpaw9byEmcVFgDj9bpHSI9cd8J3qrcnU6rrMUe6KPGiXY-P8vB7u30GhXr51JGsgW28Jzs4jRtKoPQxk2HnjDKNRiSYHwENy2SNPqEhpy9YzGBbvD8fbN1A:1l0lEb:N8cw5kr2KbKr_OZaGBd4ke-vy7qfGSWKzM8DuhibeHE	2021-01-30 13:03:17.581662+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: blogApp_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public."blogApp_blogpost_id_seq"', 3, true);


--
-- Name: blogApp_genericconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public."blogApp_genericconfig_id_seq"', 2, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 23, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blogdb
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blogApp_blogpost blogApp_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public."blogApp_blogpost"
    ADD CONSTRAINT "blogApp_blogpost_pkey" PRIMARY KEY (id);


--
-- Name: blogApp_blogpost blogApp_blogpost_slug_key; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public."blogApp_blogpost"
    ADD CONSTRAINT "blogApp_blogpost_slug_key" UNIQUE (slug);


--
-- Name: blogApp_genericconfig blogApp_genericconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public."blogApp_genericconfig"
    ADD CONSTRAINT "blogApp_genericconfig_pkey" PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blogApp_blogpost_author_id_78e9d092; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX "blogApp_blogpost_author_id_78e9d092" ON public."blogApp_blogpost" USING btree (author_id);


--
-- Name: blogApp_blogpost_slug_aa7d3b65_like; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX "blogApp_blogpost_slug_aa7d3b65_like" ON public."blogApp_blogpost" USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: blogdb
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blogApp_blogpost blogApp_blogpost_author_id_78e9d092_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public."blogApp_blogpost"
    ADD CONSTRAINT "blogApp_blogpost_author_id_78e9d092_fk_auth_user_id" FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blogdb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: blogdb
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO blogdb;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: blogdb
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

