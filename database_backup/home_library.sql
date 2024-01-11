toc.dat                                                                                             0000600 0004000 0002000 00000102222 14547772363 0014460 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                        |            home_library    16.1    16.1 p    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16401    home_library    DATABASE     n   CREATE DATABASE home_library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE home_library;
                postgres    false                     3079    16613 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false         �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2         �            1255    16402    insert_timestamp_for_log()    FUNCTION     �   CREATE FUNCTION public.insert_timestamp_for_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.event_date := NOW();
    RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.insert_timestamp_for_log();
       public          postgres    false         �            1259    16403    AUTHOR    TABLE     �   CREATE TABLE public."AUTHOR" (
    author_id bigint NOT NULL,
    author_name character varying(50) NOT NULL,
    author_surname character varying(50)
);
    DROP TABLE public."AUTHOR";
       public         heap    postgres    false         �            1259    16406 	   AUTHORITY    TABLE     o   CREATE TABLE public."AUTHORITY" (
    authority_id bigint NOT NULL,
    role character varying(16) NOT NULL
);
    DROP TABLE public."AUTHORITY";
       public         heap    postgres    false         �            1259    16409    AUTHORITY_id_seq    SEQUENCE     �   ALTER TABLE public."AUTHORITY" ALTER COLUMN authority_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."AUTHORITY_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217         �            1259    16410    AUTHOR_id_seq    SEQUENCE     �   ALTER TABLE public."AUTHOR" ALTER COLUMN author_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."AUTHOR_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216         �            1259    16411    BOOK    TABLE     �   CREATE TABLE public."BOOK" (
    book_id bigint NOT NULL,
    book_title text NOT NULL,
    author_id bigint NOT NULL,
    publisher_id bigint,
    status_id bigint NOT NULL,
    image_path text,
    book_summary text,
    book_isbn integer
);
    DROP TABLE public."BOOK";
       public         heap    postgres    false         �            1259    16416    BOOK_CATEGORY    TABLE     f   CREATE TABLE public."BOOK_CATEGORY" (
    book_id bigint NOT NULL,
    category_id bigint NOT NULL
);
 #   DROP TABLE public."BOOK_CATEGORY";
       public         heap    postgres    false         �            1259    16419    BOOK_TRANSLATOR    TABLE     j   CREATE TABLE public."BOOK_TRANSLATOR" (
    book_id bigint NOT NULL,
    translator_id bigint NOT NULL
);
 %   DROP TABLE public."BOOK_TRANSLATOR";
       public         heap    postgres    false         �            1259    16422    BOOK_id_seq    SEQUENCE     �   ALTER TABLE public."BOOK" ALTER COLUMN book_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."BOOK_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220         �            1259    16423    CATEGORY    TABLE     v   CREATE TABLE public."CATEGORY" (
    category_id bigint NOT NULL,
    category_name character varying(50) NOT NULL
);
    DROP TABLE public."CATEGORY";
       public         heap    postgres    false         �            1259    16426    CATEGORY_id_seq    SEQUENCE     �   ALTER TABLE public."CATEGORY" ALTER COLUMN category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."CATEGORY_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224         �            1259    17130 
   DB_SESSION    TABLE     �   CREATE TABLE public."DB_SESSION" (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);
     DROP TABLE public."DB_SESSION";
       public         heap    postgres    false         �            1259    16427 
   EVENT_TYPE    TABLE     r   CREATE TABLE public."EVENT_TYPE" (
    event_id bigint NOT NULL,
    event_name character varying(50) NOT NULL
);
     DROP TABLE public."EVENT_TYPE";
       public         heap    postgres    false         �            1259    16430    EVENT_TYPE_id_seq    SEQUENCE     �   ALTER TABLE public."EVENT_TYPE" ALTER COLUMN event_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."EVENT_TYPE_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226         �            1259    16431    LOG    TABLE     H  CREATE TABLE public."LOG" (
    log_id bigint NOT NULL,
    user_id bigint,
    event_type_id bigint NOT NULL,
    event_date timestamp without time zone NOT NULL,
    book_id bigint,
    description text,
    category_id bigint,
    translator_id bigint,
    publisher_id bigint,
    author_id bigint,
    reading_id bigint
);
    DROP TABLE public."LOG";
       public         heap    postgres    false         �            1259    16436 
   LOG_id_seq    SEQUENCE     �   ALTER TABLE public."LOG" ALTER COLUMN log_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."LOG_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228         �            1259    16437 	   PUBLISHER    TABLE     y   CREATE TABLE public."PUBLISHER" (
    publisher_id bigint NOT NULL,
    publisher_name character varying(50) NOT NULL
);
    DROP TABLE public."PUBLISHER";
       public         heap    postgres    false         �            1259    16440    PUBLISHER_id_seq    SEQUENCE     �   ALTER TABLE public."PUBLISHER" ALTER COLUMN publisher_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."PUBLISHER_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230         �            1259    16441    READING    TABLE     �   CREATE TABLE public."READING" (
    reading_id bigint NOT NULL,
    user_id bigint NOT NULL,
    book_id bigint NOT NULL,
    status_id bigint NOT NULL,
    comment text
);
    DROP TABLE public."READING";
       public         heap    postgres    false         �            1259    16446    READING_id_seq    SEQUENCE     �   ALTER TABLE public."READING" ALTER COLUMN reading_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."READING_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232         �            1259    16447    STATUS    TABLE     p   CREATE TABLE public."STATUS" (
    status_id bigint NOT NULL,
    status_name character varying(50) NOT NULL
);
    DROP TABLE public."STATUS";
       public         heap    postgres    false         �            1259    16450    STATUS_id_seq    SEQUENCE     �   ALTER TABLE public."STATUS" ALTER COLUMN status_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."STATUS_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234         �            1259    16451 
   TRANSLATOR    TABLE     �   CREATE TABLE public."TRANSLATOR" (
    translator_id bigint NOT NULL,
    translator_name character varying(30) NOT NULL,
    translator_surname character varying(30)
);
     DROP TABLE public."TRANSLATOR";
       public         heap    postgres    false         �            1259    16454    TRANSLATOR_id_seq    SEQUENCE     �   ALTER TABLE public."TRANSLATOR" ALTER COLUMN translator_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TRANSLATOR_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236         �            1259    16455    USER    TABLE     �   CREATE TABLE public."USER" (
    user_id bigint NOT NULL,
    user_name character varying(16) NOT NULL,
    password character varying(120) NOT NULL,
    email character varying(50),
    authority_id bigint NOT NULL
);
    DROP TABLE public."USER";
       public         heap    postgres    false         �            1259    16458    USER_id_seq    SEQUENCE     �   ALTER TABLE public."USER" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."USER_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238         w          0    16403    AUTHOR 
   TABLE DATA           J   COPY public."AUTHOR" (author_id, author_name, author_surname) FROM stdin;
    public          postgres    false    216       4983.dat x          0    16406 	   AUTHORITY 
   TABLE DATA           9   COPY public."AUTHORITY" (authority_id, role) FROM stdin;
    public          postgres    false    217       4984.dat {          0    16411    BOOK 
   TABLE DATA           ~   COPY public."BOOK" (book_id, book_title, author_id, publisher_id, status_id, image_path, book_summary, book_isbn) FROM stdin;
    public          postgres    false    220       4987.dat |          0    16416    BOOK_CATEGORY 
   TABLE DATA           ?   COPY public."BOOK_CATEGORY" (book_id, category_id) FROM stdin;
    public          postgres    false    221       4988.dat }          0    16419    BOOK_TRANSLATOR 
   TABLE DATA           C   COPY public."BOOK_TRANSLATOR" (book_id, translator_id) FROM stdin;
    public          postgres    false    222       4989.dat           0    16423    CATEGORY 
   TABLE DATA           @   COPY public."CATEGORY" (category_id, category_name) FROM stdin;
    public          postgres    false    224       4991.dat �          0    17130 
   DB_SESSION 
   TABLE DATA           9   COPY public."DB_SESSION" (sid, sess, expire) FROM stdin;
    public          postgres    false    240       5007.dat �          0    16427 
   EVENT_TYPE 
   TABLE DATA           <   COPY public."EVENT_TYPE" (event_id, event_name) FROM stdin;
    public          postgres    false    226       4993.dat �          0    16431    LOG 
   TABLE DATA           �   COPY public."LOG" (log_id, user_id, event_type_id, event_date, book_id, description, category_id, translator_id, publisher_id, author_id, reading_id) FROM stdin;
    public          postgres    false    228       4995.dat �          0    16437 	   PUBLISHER 
   TABLE DATA           C   COPY public."PUBLISHER" (publisher_id, publisher_name) FROM stdin;
    public          postgres    false    230       4997.dat �          0    16441    READING 
   TABLE DATA           U   COPY public."READING" (reading_id, user_id, book_id, status_id, comment) FROM stdin;
    public          postgres    false    232       4999.dat �          0    16447    STATUS 
   TABLE DATA           :   COPY public."STATUS" (status_id, status_name) FROM stdin;
    public          postgres    false    234       5001.dat �          0    16451 
   TRANSLATOR 
   TABLE DATA           Z   COPY public."TRANSLATOR" (translator_id, translator_name, translator_surname) FROM stdin;
    public          postgres    false    236       5003.dat �          0    16455    USER 
   TABLE DATA           S   COPY public."USER" (user_id, user_name, password, email, authority_id) FROM stdin;
    public          postgres    false    238       5005.dat �           0    0    AUTHORITY_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."AUTHORITY_id_seq"', 3, true);
          public          postgres    false    218         �           0    0    AUTHOR_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."AUTHOR_id_seq"', 74, true);
          public          postgres    false    219         �           0    0    BOOK_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."BOOK_id_seq"', 16, true);
          public          postgres    false    223         �           0    0    CATEGORY_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."CATEGORY_id_seq"', 4, true);
          public          postgres    false    225         �           0    0    EVENT_TYPE_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."EVENT_TYPE_id_seq"', 34, true);
          public          postgres    false    227         �           0    0 
   LOG_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public."LOG_id_seq"', 5, true);
          public          postgres    false    229         �           0    0    PUBLISHER_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."PUBLISHER_id_seq"', 25, true);
          public          postgres    false    231         �           0    0    READING_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."READING_id_seq"', 1, false);
          public          postgres    false    233         �           0    0    STATUS_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."STATUS_id_seq"', 6, true);
          public          postgres    false    235         �           0    0    TRANSLATOR_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."TRANSLATOR_id_seq"', 39, true);
          public          postgres    false    237         �           0    0    USER_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."USER_id_seq"', 140, true);
          public          postgres    false    239         �           2606    16863    AUTHORITY AUTHORITY_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."AUTHORITY"
    ADD CONSTRAINT "AUTHORITY_pkey" PRIMARY KEY (authority_id);
 F   ALTER TABLE ONLY public."AUTHORITY" DROP CONSTRAINT "AUTHORITY_pkey";
       public            postgres    false    217         �           2606    16463    AUTHORITY AUTHORITY_role_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."AUTHORITY"
    ADD CONSTRAINT "AUTHORITY_role_key" UNIQUE (role);
 J   ALTER TABLE ONLY public."AUTHORITY" DROP CONSTRAINT "AUTHORITY_role_key";
       public            postgres    false    217         �           2606    16465 ,   AUTHOR AUTHOR_author_name_author_surname_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."AUTHOR"
    ADD CONSTRAINT "AUTHOR_author_name_author_surname_key" UNIQUE (author_name, author_surname);
 Z   ALTER TABLE ONLY public."AUTHOR" DROP CONSTRAINT "AUTHOR_author_name_author_surname_key";
       public            postgres    false    216    216         �           2606    16876    AUTHOR AUTHOR_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."AUTHOR"
    ADD CONSTRAINT "AUTHOR_pkey" PRIMARY KEY (author_id);
 @   ALTER TABLE ONLY public."AUTHOR" DROP CONSTRAINT "AUTHOR_pkey";
       public            postgres    false    216         �           2606    16773     BOOK_CATEGORY BOOK_CATEGORY_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."BOOK_CATEGORY"
    ADD CONSTRAINT "BOOK_CATEGORY_pkey" PRIMARY KEY (book_id, category_id);
 N   ALTER TABLE ONLY public."BOOK_CATEGORY" DROP CONSTRAINT "BOOK_CATEGORY_pkey";
       public            postgres    false    221    221         �           2606    16784 $   BOOK_TRANSLATOR BOOK_TRANSLATOR_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."BOOK_TRANSLATOR"
    ADD CONSTRAINT "BOOK_TRANSLATOR_pkey" PRIMARY KEY (book_id, translator_id);
 R   ALTER TABLE ONLY public."BOOK_TRANSLATOR" DROP CONSTRAINT "BOOK_TRANSLATOR_pkey";
       public            postgres    false    222    222         �           2606    16796    BOOK BOOK_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "BOOK_pkey" PRIMARY KEY (book_id);
 <   ALTER TABLE ONLY public."BOOK" DROP CONSTRAINT "BOOK_pkey";
       public            postgres    false    220         �           2606    16475 #   CATEGORY CATEGORY_category_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."CATEGORY"
    ADD CONSTRAINT "CATEGORY_category_name_key" UNIQUE (category_name);
 Q   ALTER TABLE ONLY public."CATEGORY" DROP CONSTRAINT "CATEGORY_category_name_key";
       public            postgres    false    224         �           2606    16734    CATEGORY CATEGORY_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."CATEGORY"
    ADD CONSTRAINT "CATEGORY_pkey" PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public."CATEGORY" DROP CONSTRAINT "CATEGORY_pkey";
       public            postgres    false    224         �           2606    16479 $   EVENT_TYPE EVENT_TYPE_event_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public."EVENT_TYPE"
    ADD CONSTRAINT "EVENT_TYPE_event_name_key" UNIQUE (event_name);
 R   ALTER TABLE ONLY public."EVENT_TYPE" DROP CONSTRAINT "EVENT_TYPE_event_name_key";
       public            postgres    false    226         �           2606    17110    EVENT_TYPE EVENT_TYPE_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."EVENT_TYPE"
    ADD CONSTRAINT "EVENT_TYPE_pkey" PRIMARY KEY (event_id);
 H   ALTER TABLE ONLY public."EVENT_TYPE" DROP CONSTRAINT "EVENT_TYPE_pkey";
       public            postgres    false    226         �           2606    16717    LOG LOG_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "LOG_pkey" PRIMARY KEY (log_id);
 :   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "LOG_pkey";
       public            postgres    false    228         �           2606    16699    PUBLISHER PUBLISHER_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."PUBLISHER"
    ADD CONSTRAINT "PUBLISHER_pkey" PRIMARY KEY (publisher_id);
 F   ALTER TABLE ONLY public."PUBLISHER" DROP CONSTRAINT "PUBLISHER_pkey";
       public            postgres    false    230         �           2606    16487 &   PUBLISHER PUBLISHER_publisher_name_key 
   CONSTRAINT     o   ALTER TABLE ONLY public."PUBLISHER"
    ADD CONSTRAINT "PUBLISHER_publisher_name_key" UNIQUE (publisher_name);
 T   ALTER TABLE ONLY public."PUBLISHER" DROP CONSTRAINT "PUBLISHER_publisher_name_key";
       public            postgres    false    230         �           2606    16681    READING READING_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "READING_pkey" PRIMARY KEY (reading_id);
 B   ALTER TABLE ONLY public."READING" DROP CONSTRAINT "READING_pkey";
       public            postgres    false    232         �           2606    16663    STATUS STATUS_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."STATUS"
    ADD CONSTRAINT "STATUS_pkey" PRIMARY KEY (status_id);
 @   ALTER TABLE ONLY public."STATUS" DROP CONSTRAINT "STATUS_pkey";
       public            postgres    false    234         �           2606    16493    STATUS STATUS_status_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."STATUS"
    ADD CONSTRAINT "STATUS_status_name_key" UNIQUE (status_name);
 K   ALTER TABLE ONLY public."STATUS" DROP CONSTRAINT "STATUS_status_name_key";
       public            postgres    false    234         �           2606    16645    TRANSLATOR TRANSLATOR_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."TRANSLATOR"
    ADD CONSTRAINT "TRANSLATOR_pkey" PRIMARY KEY (translator_id);
 H   ALTER TABLE ONLY public."TRANSLATOR" DROP CONSTRAINT "TRANSLATOR_pkey";
       public            postgres    false    236         �           2606    16497 <   TRANSLATOR TRANSLATOR_translator_name_translator_surname_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."TRANSLATOR"
    ADD CONSTRAINT "TRANSLATOR_translator_name_translator_surname_key" UNIQUE (translator_name, translator_surname);
 j   ALTER TABLE ONLY public."TRANSLATOR" DROP CONSTRAINT "TRANSLATOR_translator_name_translator_surname_key";
       public            postgres    false    236    236         �           2606    16499    USER USER_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "USER_email_key" UNIQUE (email);
 A   ALTER TABLE ONLY public."USER" DROP CONSTRAINT "USER_email_key";
       public            postgres    false    238         �           2606    16626    USER USER_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "USER_pkey" PRIMARY KEY (user_id);
 <   ALTER TABLE ONLY public."USER" DROP CONSTRAINT "USER_pkey";
       public            postgres    false    238         �           2606    16503    USER USER_user_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "USER_user_name_key" UNIQUE (user_name);
 E   ALTER TABLE ONLY public."USER" DROP CONSTRAINT "USER_user_name_key";
       public            postgres    false    238         �           2606    17136    DB_SESSION session_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."DB_SESSION"
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);
 C   ALTER TABLE ONLY public."DB_SESSION" DROP CONSTRAINT session_pkey;
       public            postgres    false    240         �           1259    17137    IDX_session_expire    INDEX     O   CREATE INDEX "IDX_session_expire" ON public."DB_SESSION" USING btree (expire);
 (   DROP INDEX public."IDX_session_expire";
       public            postgres    false    240         �           1259    17068    fki_FK_LOG.author_id    INDEX     M   CREATE INDEX "fki_FK_LOG.author_id" ON public."LOG" USING btree (author_id);
 *   DROP INDEX public."fki_FK_LOG.author_id";
       public            postgres    false    228         �           1259    16988    fki_FK_LOG.book_id    INDEX     I   CREATE INDEX "fki_FK_LOG.book_id" ON public."LOG" USING btree (book_id);
 (   DROP INDEX public."fki_FK_LOG.book_id";
       public            postgres    false    228         �           1259    17008    fki_FK_LOG.category_id    INDEX     Q   CREATE INDEX "fki_FK_LOG.category_id" ON public."LOG" USING btree (category_id);
 ,   DROP INDEX public."fki_FK_LOG.category_id";
       public            postgres    false    228         �           1259    16968    fki_FK_LOG.event_type_id    INDEX     U   CREATE INDEX "fki_FK_LOG.event_type_id" ON public."LOG" USING btree (event_type_id);
 .   DROP INDEX public."fki_FK_LOG.event_type_id";
       public            postgres    false    228         �           1259    17048    fki_FK_LOG.publisher_id    INDEX     S   CREATE INDEX "fki_FK_LOG.publisher_id" ON public."LOG" USING btree (publisher_id);
 -   DROP INDEX public."fki_FK_LOG.publisher_id";
       public            postgres    false    228         �           1259    17088    fki_FK_LOG.reading_id    INDEX     O   CREATE INDEX "fki_FK_LOG.reading_id" ON public."LOG" USING btree (reading_id);
 +   DROP INDEX public."fki_FK_LOG.reading_id";
       public            postgres    false    228         �           1259    17028    fki_FK_LOG.translator_id    INDEX     U   CREATE INDEX "fki_FK_LOG.translator_id" ON public."LOG" USING btree (translator_id);
 .   DROP INDEX public."fki_FK_LOG.translator_id";
       public            postgres    false    228         �           1259    16948    fki_FK_LOG.user_id    INDEX     I   CREATE INDEX "fki_FK_LOG.user_id" ON public."LOG" USING btree (user_id);
 (   DROP INDEX public."fki_FK_LOG.user_id";
       public            postgres    false    228         �           1259    16919    fki_FK_READING.book_id    INDEX     Q   CREATE INDEX "fki_FK_READING.book_id" ON public."READING" USING btree (book_id);
 ,   DROP INDEX public."fki_FK_READING.book_id";
       public            postgres    false    232         �           1259    16903    fki_FK_READING.user_id    INDEX     Q   CREATE INDEX "fki_FK_READING.user_id" ON public."READING" USING btree (user_id);
 ,   DROP INDEX public."fki_FK_READING.user_id";
       public            postgres    false    232         �           1259    16904    fki_sdfsdfsdfs    INDEX     G   CREATE INDEX fki_sdfsdfsdfs ON public."READING" USING btree (user_id);
 "   DROP INDEX public.fki_sdfsdfsdfs;
       public            postgres    false    232         �           2620    16515    LOG event_date    TRIGGER     y   CREATE TRIGGER event_date BEFORE INSERT ON public."LOG" FOR EACH ROW EXECUTE FUNCTION public.insert_timestamp_for_log();
 )   DROP TRIGGER event_date ON public."LOG";
       public          postgres    false    228    241         �           2606    16812 &   BOOK_CATEGORY FK_BOOK_CATEGORY_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK_CATEGORY"
    ADD CONSTRAINT "FK_BOOK_CATEGORY_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);
 T   ALTER TABLE ONLY public."BOOK_CATEGORY" DROP CONSTRAINT "FK_BOOK_CATEGORY_book_id";
       public          postgres    false    4771    221    220         �           2606    16774 *   BOOK_CATEGORY FK_BOOK_CATEGORY_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK_CATEGORY"
    ADD CONSTRAINT "FK_BOOK_CATEGORY_category_id" FOREIGN KEY (category_id) REFERENCES public."CATEGORY"(category_id);
 X   ALTER TABLE ONLY public."BOOK_CATEGORY" DROP CONSTRAINT "FK_BOOK_CATEGORY_category_id";
       public          postgres    false    224    221    4779         �           2606    16807 *   BOOK_TRANSLATOR FK_BOOK_TRANSLATOR_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK_TRANSLATOR"
    ADD CONSTRAINT "FK_BOOK_TRANSLATOR_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);
 X   ALTER TABLE ONLY public."BOOK_TRANSLATOR" DROP CONSTRAINT "FK_BOOK_TRANSLATOR_book_id";
       public          postgres    false    220    222    4771         �           2606    16785 0   BOOK_TRANSLATOR FK_BOOK_TRANSLATOR_translator_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK_TRANSLATOR"
    ADD CONSTRAINT "FK_BOOK_TRANSLATOR_translator_id" FOREIGN KEY (translator_id) REFERENCES public."TRANSLATOR"(translator_id);
 ^   ALTER TABLE ONLY public."BOOK_TRANSLATOR" DROP CONSTRAINT "FK_BOOK_TRANSLATOR_translator_id";
       public          postgres    false    236    4808    222         �           2606    16882    BOOK FK_BOOK_author_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "FK_BOOK_author_id" FOREIGN KEY (author_id) REFERENCES public."AUTHOR"(author_id);
 D   ALTER TABLE ONLY public."BOOK" DROP CONSTRAINT "FK_BOOK_author_id";
       public          postgres    false    4765    220    216         �           2606    16836    BOOK FK_BOOK_publisher_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "FK_BOOK_publisher_id" FOREIGN KEY (publisher_id) REFERENCES public."PUBLISHER"(publisher_id);
 G   ALTER TABLE ONLY public."BOOK" DROP CONSTRAINT "FK_BOOK_publisher_id";
       public          postgres    false    230    220    4795         �           2606    16848    BOOK FK_BOOK_status_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "FK_BOOK_status_id" FOREIGN KEY (status_id) REFERENCES public."STATUS"(status_id);
 D   ALTER TABLE ONLY public."BOOK" DROP CONSTRAINT "FK_BOOK_status_id";
       public          postgres    false    234    4804    220         �           2606    17069    LOG FK_LOG_author_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_author_id" FOREIGN KEY (author_id) REFERENCES public."AUTHOR"(author_id);
 B   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_author_id";
       public          postgres    false    228    4765    216         �           2606    16989    LOG FK_LOG_book_id    FK CONSTRAINT     {   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);
 @   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_book_id";
       public          postgres    false    228    220    4771         �           2606    17009    LOG FK_LOG_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_category_id" FOREIGN KEY (category_id) REFERENCES public."CATEGORY"(category_id);
 D   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_category_id";
       public          postgres    false    228    224    4779         �           2606    17111    LOG FK_LOG_event_type_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_event_type_id" FOREIGN KEY (event_type_id) REFERENCES public."EVENT_TYPE"(event_id);
 F   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_event_type_id";
       public          postgres    false    226    228    4783         �           2606    17049    LOG FK_LOG_publisher_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_publisher_id" FOREIGN KEY (publisher_id) REFERENCES public."PUBLISHER"(publisher_id);
 E   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_publisher_id";
       public          postgres    false    230    4795    228         �           2606    17089    LOG FK_LOG_reading_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_reading_id" FOREIGN KEY (reading_id) REFERENCES public."READING"(reading_id);
 C   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_reading_id";
       public          postgres    false    4799    232    228         �           2606    17029    LOG FK_LOG_translator_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_translator_id" FOREIGN KEY (translator_id) REFERENCES public."TRANSLATOR"(translator_id);
 F   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_translator_id";
       public          postgres    false    4808    228    236         �           2606    16949    LOG FK_LOG_user_id    FK CONSTRAINT     {   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_user_id" FOREIGN KEY (user_id) REFERENCES public."USER"(user_id);
 @   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_user_id";
       public          postgres    false    238    4814    228         �           2606    16920    READING FK_READING_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "FK_READING_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);
 H   ALTER TABLE ONLY public."READING" DROP CONSTRAINT "FK_READING_book_id";
       public          postgres    false    220    232    4771         �           2606    16934    READING FK_READING_status_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "FK_READING_status_id" FOREIGN KEY (status_id) REFERENCES public."STATUS"(status_id);
 J   ALTER TABLE ONLY public."READING" DROP CONSTRAINT "FK_READING_status_id";
       public          postgres    false    4804    232    234         �           2606    16905    READING FK_READING_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "FK_READING_user_id" FOREIGN KEY (user_id) REFERENCES public."USER"(user_id);
 H   ALTER TABLE ONLY public."READING" DROP CONSTRAINT "FK_READING_user_id";
       public          postgres    false    4814    238    232         �           2606    16892    USER FK_USER_authority_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "FK_USER_authority_id" FOREIGN KEY (authority_id) REFERENCES public."AUTHORITY"(authority_id);
 G   ALTER TABLE ONLY public."USER" DROP CONSTRAINT "FK_USER_authority_id";
       public          postgres    false    217    238    4767                                                                                                                                                                                                                                                                                                                                                                                      4983.dat                                                                                            0000600 0004000 0002000 00000001306 14547772363 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	J. K. Rowling	\N
2	Yuval Noah	Harari
38	Andrzej	Sapkowski
39	Sigmund	Feud
40	John	Carreyrou
41	Rene	Descartes
42	Jack	London
43	Walter	Isaacson
44	Sabahattin	Ali
45	Lev N.	Tolstoy
46	Halil	Cibran
47	Khaled	Hosseini
48	Cengiz	Aytmatov
49	Grigory	Petrov
50	Stefan	Zweig
51	Stephan	King
52	Ziya	Baran
53	Sir Arthur Conan	Doyle
54	Turgenyev	\N
55	Tara	Westover
56	Ernest	Cline
57	Vladimir	Dudintsev
58	Rebecca	Dessertine
59	Alice	Henderson
60	Fyodor Mihayloviç	Dostoyevski
61	Louis	Sachar
62	Maksim	Gorki
63	Rick	Riordan
64	Loretta Graziano	Breuning
65	Eric	Smith
66	Prof. Dr. Ahmet	Arslan
67	Maurice	Leblanc
68	Douglas	Adams
69	George	Orwell
70	Oscar	Wilde
71	Aleksandr	Puşkin
72	James	Clear
74	kerem	\N
\.


                                                                                                                                                                                                                                                                                                                          4984.dat                                                                                            0000600 0004000 0002000 00000000034 14547772363 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	guest
2	admin
3	user
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    4987.dat                                                                                            0000600 0004000 0002000 00000040241 14547772363 0014310 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        9	Felsefenin İlkeleri	41	\N	6	\N	“Descartes, modern felsefenin kurucusu sayılır. Çok yüksek felsefi bir yeteneği olan, yeni fizik ve gökbilime dayanan ilk kişi odur. Birçok skolastik yanı bulunmasına rağmen Descartes, kendinden önce gelenlerin kurduğu temelleri benimsememiş, yeniden ve eksiksiz bir felsefe yapısı kurmaya çalışmıştır. Descartes’ın yapıtlarında Platon’dan beri hiçbir filozofta bulunmayan bir tazelik vardır. Descartes, bir öğretmen olarak değil, bir araştırmacı ve bulduğunu aktarmaya meraklı bir kişi olarak kalem kullanmıştır. Üslubu rahat ve iddiasızdır. Öğrencilere değil, zeki insanlara seslenir. Doğrusu, modern felsefe için, öncüsünün bu kadar hayranlık verici edebi bir üsluba sahip olması büyük bir talihtir.”\nBertrand Russell	\N
2	Harry Potter ve Sırlar Odası	1	1	2	\N	Bir komplo var, Harry Potter. Bu yıl Hogwarts Cadılık ve Büyücülük Okulu’nda dehşet verici şeyler yapmak için bir komplo.”\nDursley’ler o yaz öylesine çekilmez olmuşlardır ki,\nHarry bir an önce okulu Hogwarts’a geri dönmek için can atmaktadır. Eşyalarını toplarken ortaya çıkan ev cini Dobby ise onu uyarır: Hogwarts’a dönerse, bir felaket olacaktır. Olur da: Sırlar Odası’nın açılmasıyla ortaya çıkan karanlık bir güç, Hogwarts’takileri taşa çevirmeye başlar. Harry, hayatını tehlikeye atarak, Oda’nın elli yıllık ölümcül gizemini çözmeye çalışır. Ve gerçekten de başına gelmedik felaket kalmaz.	\N
3	Hayvanlardan Tanrılara Sapiens\nİnsan Türünün Kısa Bir Tarihi	2	2	2	\N	- Homo sapiens neden ekolojik bir seri katile dönüştü? - Para neden herkesin güvendiği tek şey? - Kadınlar üstün sosyal becerilere sahipken, neden çoğu toplum erkek egemen? - Güç elde etmekte böylesine yetenekli olan insanlar neden bu gücü mutluluğa dönüştürmekte başarısızlar? - Geleceğin dini bilim mi? - İnsanların miadı çoktan doldu mu? 100 bin yıl önce Yeryüzü’nde en az altı farklı insan türü vardı. Günümüzdeyse sadece Homo Sapiens var. Diğerlerinin başına ne geldi ve bize ne olacak? Çoğu çalışma insanlığın serüvenini ya tarihi ya da biyolojik bir yaklaşımla ele alır, ancak Harari 70 bin yıl önce gerçekleşen Bilişsel Devrim’le başlattığı bu kitabında gelenekleri yerle bir ediyor. İnsanların küresel ekosistemde oynadıkları rolden imparatorlukların yükselişine ve modern dünyaya kadar pek çok konuyu irdeleyen Sapiens, tarihle bilimi bir araya getirerek kabul görmüş anlatıları yeniden ele alıyor. Harari ayrıca geleceğe bakmaya da zorluyor okuru. Yakın zamanda insanlar, dört milyar yıldır yaşama hükmeden doğal seçilim yasalarını esnetmeye başladılar. Artık sadece dünyayı değil, kendimizi ve diğer canlıları tasarlama becerisi de kazandık. Peki bu bizi nereye götürüyor, bizi neye dönüştürebilir? 30’dan fazla dile çevrilmiş bu kışkırtıcı çalışma özellikle Jared Diamond, James Gleick, Matt Ridley ve Robert Wright’ın eserlerine aşina okurlar için muhteşem bir kaynak.\n \n“Sapiens, tarihin ve modern dünyanın en büyük sorularını gayet yalın bir dille ele alıyor. Çok seveceksiniz!”\nJared Diamond, Tüfek, Mikrop ve Çelik’in yazarı\n\n“Harari’nin eseri kabul görmüş doktrinlerin karşısında duran fikirler ve şaşırtıcı gerçeklerle bezeli.”\nJohn Gray, Financial Times	\N
1	Harry Potter ve Felsefe Taşı	1	1	2	\N	Harry, elleri titreyerek zarfı çevirince mor balmumundan bir mühür gördü; bir arma – koca bir ‘H’ harfinin çevresinde bir aslan, bir kartal, bir porsuk, bir de yılan.” HARRY POTTER sıradan bir çocuk olduğunu sanırken, bir baykuşun getirdiği mektupla yaşamı değişir: Başvurmadığı halde Hogwarts Cadılık ve Büyücülük Okulu’na kabul edilmiştir. Burada birbirinden ilginç dersler alır, iki arkadaşıyla birlikte maceradan maceraya koşar. Yaşayarak öğrendikleri sayesinde küçük yaşta becerikli bir büyücü olup çıkar.\n	\N
4	Son Dilek (The Witcher)	38	7	2	\N	İngiltere için Tolkien, Amerika için George R. R. Martin neyse Doğu Avrupa için Sapkowski odur. Rivyalı Geralt bir Witcher’dır. Henüz küçük bir çocukken seçilmiş, eğitilmiş, büyülerle donatılmış ve mutasyon geçirmiş bir canavar avcısı. Acımasız, tekinsiz, karanlık ve canavarlarla dolu bir dünyada yaşar. Onun dünyasında peri masalları hiç de saf değildir. Pamuk Prenses bir haydut çetesinin başındadır. Güzel ve Çirkin’deki roller çok farklıdır. Üç dilek hakkı sunan cinlerle karşılaşmak bile istemezsiniz. Masumların savunucusu Geralt, kızları canavara dönüşmüş ensest krallarla, intikam hırsıyla yanan cinlerle, âşık vampirlerle ve daha nicesiyle karşılaşıyor. Hepsi çok tehlikeli ve hiçbiri göründüğü gibi değil. “Mieville ve Neil Gaiman gibi Sapkowski de eskiyi alıp yeniliyor… Fantastik türde taze bir açılım.” Foundation “Bu kitabı gerçekten, gerçekten çok beğendim… Sapkowski’nin dünyasındaki hiçbir karakter siyah-beyaz değil. Geralt ve canavarlar dâhil herkes grinin bir tonu.” The Deckled Edge “Dünyadan bıkmışlığı ve sayısız savaşta geliştirilmiş güçleri, Geralt’ı böylesine ilginç bir karakter yapıyor.” Edge  “Sapkowski’nin Witcher evreni, modern fantastik edebiyat dünyasının en detaylılarından biridir ve birçok yenilikçi fikir sunar. Karmaşık karakter ilişkileri bu dünyayı daha da zenginleştirir… Fantastik edebiyat hayranlarının el üstünde tutacağı bir seri.” B&N “Okuduğum en iyi ve en ilginç fantastik edebiyat serilerinden biri. Sapkowski hiç kimseye benzemeyen bir tasarımcı.” Nerds of a Feather “Sapkowski’nin romanı, karmaşık bir büyü gibi; fantastik malzemeler, entelektüel diskur ve ince bir mizahın karışımı.” Time  “Artık eskimiş bir türde yeni bir soluk. Sakın kaçırmayın.” Dreamwatch “Sapkowski’nin müthiş üslubu, sansasyonel olaylar ve ilgi çekici bir atmosfer yaratmadaki bulunmaz yeteneği, gerilimi ve mizahı usta bir harmanda birleştirebilmesi onu eşsiz kılıyor.” Polityka “Sapkowski ilginç ve olağanüstü derinlikte karakterler yaratmakta usta. Son Dilek melankoli ve mizah dolu bir roman.” The Wertzone “Polonyalı yazar Andrzej Sapkowski’nin karakter bazlı muhteşem yazılmış eseri türünün en önde gelen romanlarından.” The Specusphere  “Tanıdık hikâyelerin böyle farklı ele alınması çok sevindirici. Son Dilek’in çoğu bir peri masalı gibi.” SFX “Doğu Avrupa folkloru ve efsaneleri ile güzel prensesler ve huysuz şeytanlar bir arada. Son Dilek’te hiçbir şey göründüğü gibi değil. Başladığınız zaman bırakamayacaksınız.” Waterstones	\N
5	Rüya Psikolojisi Yeni Başlayanlar İçin Psikanaliz	39	6	2	\N	Bu rüyalarda ortak olan şey oldukça açık. Çocukların gün içinde gerçekleştiremedikleri arzuları rüyalarında gerçek oluyordu Bu rüyalar adeta arzuların açık bir şekilde tatmin edilmesiydi. İlk bakışta anlaşılamayan aşağıdaki çocuk rüyası da, gerçekleştirilen bir arzudan başka bir şey değildir. Yaklaşık dört yaşında bir kız çocuğu, çocuk felcinden ötürü tedavi için köyünden kasabaya getirildi. Geceleri çocuğu olmayan bir teyze ile kaldılar. Evde çocuk yatağı olmadığı için doğal olarak, onun için çok büyük olan bir yatakta uyudu. Ertesi sabah, rüyasında yatağın kendisi için çok küçük olduğunu gördüğünü anlattı. Kendisi o kadar büyüktü ki yatağa sığamıyordu. Bu rüyayı arzu olarak açıklam ak, “büyük” olmanın tüm çocukların sıkça dile getirdiği bir arzu olduğunu hatırladığımızda oldukça kolaydır. Yatağın büyüklüğü küçük hanıma kendi küçüklüğünü hatırlattı. Bu kötü durum rüyasında iyi hale geldi ve okadar büyüdü ki yatak şimdi onun için çok küçük oldu.	\N
6	Psikanaliz Üzerine	39	8	2	\N	'...Psikanaliz, çocukların ruhsal yaşamından kalkarak erişkinlerin ruhsal yaşamını ele geçirmeye çaba harcamış, çocuk erişkinin babasıdır kuralına önem ve ağırlık kazandırmıştır. Erişkin ruhunun çocuk ruhunun bir uzantısı olduğunu saptamış, çocuk ruhunun erişkin ruhuna dönüşürken geçirdiği erişikliği ortaya koymuştur. Çocuklarımızın ilk yılları söz konusu olunca, pek çoğumuzun belleği bir boşluğu içerir; pek çoğumuz, bu yıllara ilişkin yaşantılardan yalnızca bazı parçaları anımsarız. Şurasını rahatlıkla ileri sürebiliriz ki, psikanaliz bu boşluğu doldurmuş, insanlardaki çocukluk yıllarını kapsayan unutkanlığı ortadan kaldırmıştır.'	\N
8	Kötü Kan: Bir Silikon Vadisi Girişimindeki Sırlar ve Yalanlar	40	\N	6	\N	Silikon Vadisinde yaşanan, devasa hırs ve kibirlerle bezenmiş nefes kesici bir hikâye.\n \nTheranos kan tahlili konusunda yenilikçi bir teknoloji sunduğunu söyleyen bir Silikon Vadisi girişimi. Ve bu girişim milyarlarca dolar yatırım almayı başarıyor. Ama bir sorun var: Teknolojileri gerçekte işe yaramıyor. Birçoğumuzun tanıdığı isimler de bu işin içinde.\n \nÇoğu zaman kötü örnekler, iyi örneklerden daha fazla şey öğretir. Kötü Kan kitabı işte size bunu vadediyor: Gerçek olaylar, sürükleyici bir anlatım ve herkes için çıkarılacak sayısız ders.\n \nSürekli başarı hikâyeleriyle bize sunulan Silikon Vadisinin diğer yüzünü görmeye hazır mısınız?\n \n“Hikâye beklediğimden daha da çılgın. Başladıktan sonra elimden bırakamadım. Bu kitapta her şey var.”\n—Bill Gates	\N
10	Adem’den önce	42	9	2	\N	Adem'den Önce, konu açısından Jack Londonın öbür yapıtlarından oldukça değişik olmasına karşın, 'hava' bakımından yine de onlara benzer. İnsanoğlunun çok uzak geçmişini, yarı-insan olduğu dönemi anlatan bu roman, yazıldığı çağın bilimsel verilerine (Darwin'in görüşüne) uygun olduğu kadar, soluk kesici ve anlamlı bir serüven romanıdır da. Her yaştan okura, kendi uzak geçmişini böylesine canlı, böylesine derin bir özdeşleşme yaratarak anlatan bir başka yapıt yoktur. İnsanın insan olma savaşı, Jack Londonın büyük bir ustalıkla anlattığı bu yırtıcı savaş, coşku verici olduğu kadar acıklıdır da.	\N
11	Vahşetin çağrısı	42	9	2	\N	Amerikan edebiyatının mihmandarlarından Jack London, Vahşetin Çağrısı’nda bir kızak köpeği Buck’ın hayatını kaleme alıyor. Aslında Buck’ın hikâyesi çok tanıdık. Buck, cennet gibi bir malikânede keyfince yaşarken insanoğlunun zaafları nedeniyle beklenmedik maceranın içinde bulur kendisini. Alaska buzullarındaki altın madenlerini keşfeden insanoğlu, kızaklarla altını şehre taşır. Buck ve diğer köpekler için Kuzeyin zorlu şartlarında kızak çekip hayatta kalmak zor olacaktır. Vahşetin Çağrısı’nda haksızlığa uğrayan, yılmadan özünü bulmaya çalışan birinin hayat hikâyesini okuyacaksınız.\nKarbon Kitaplar, Jack London’un en iyi eserleri arasındaki “The Call of the Wild” orijinal adlı romanını İngilizce aslından Türkçeye çevirdi.	\N
12	Martin Eden	42	9	2	\N	Jack London’ın yarı otobiyografik romanı Martin Eden, 20. yüzyıl başında sosyal ve ideolojik meseleler ağırlıklı içeriğiyle Amerikan edebiyatında büyük ölçüde kabul görmüştür. London farklı sınıflar arasındaki zihniyet ve değer farklarını gözlerimizin önüne sererken, statü ve servetin Amerikan toplumundaki hayati önemine işaret eder. Romanın ana temalarından biri, başarı ve refah yolunun sosyal sınıf farkı gözetilmeksizin herkese açık olduğu şeklinde özetlenebilecek Amerikan Rüyası’dır. Ya da bu idealin yarattığı muazzam hayal kırıklığı…\n\nLondon, romanı bir sanatçının çıraklıktan olgunluğa geçiş sürecini işleyen Künstlerroman geleneğinde yazmıştır. Martin’in aşkı uğruna eğitimsiz genç bir işçiden başarılı ve rafine bir yazara dönüşüm mücadelesini anlatır. Kahramanı hedefine ulaştığında ise motivasyonunu ve heyecanını çoktan yitirmiş, trajik bir sona doğru sürüklenmektedir artık…	\N
13	Ateş Yakmak	42	9	2	\N	Jack London, Kuzey topraklarını konu alan eserlerinde okurlarını buzla sarmalanmış bir diyarda adım adım gezdirir. Biri 1902’de, öbürü 1908’de yayımlanan ve “Ateş Yakmak” başlığını paylaşsalar da birbirlerinden olay örgüsü yönünden ayrılan iki hikâyeyle, “Yaşama Azmi” adlı üçüncü bir hikâyenin bir araya getirildiği bu derlemede de Jack London insanın buz kaplı doğayla ve kendi benliğiyle yüzleşmesini anlatır.  Gençliğinde Klondike bölgesine altın aramaya giden ve soğuğun hüküm sürdüğü bu topraklarda bizzat yaşamış olan London, Alaska’dan Yukon’a, Kolondike’ten Kanada tundralarına kadar yörenin coğrafyasına ve sakinlerine oldukça hâkimdir. Jack London’ın karakterleri Kuzey’in dört bir yanda uzanan bembeyaz topraklarında vahşi doğanın gücüyle amansız bir mücadele halindedir. Doğanın, soğuğun ve pek iyi bilmedikleri bir coğrafyanın pençesinde, hayata tutunmaya çalışırlar.  Ve ateş yakmak, bu varoluş mücadelesinin ilk adımıdır.	\N
14	Beyaz diş	42	14	2	\N	Kendi cinsinden ve insanlardan nefret gördüğü, hiç durmadan onlarla mücadele ettiği için büyümesi çabuk fakat tek yönlü oluyordu. İçindeki şefkat ve sevginin filizlenmesi olanaksızdı. Böyle şeyler için en küçük bir umudu bile yoktu. Kuvvetliye boyun eğmek, zayıfı ezmek kuralını öğretmişti. Gri kunduz kuvvetli bir tanrıydı. Bu yüzden Beyaz Diş ona boyun eğiyordu. Fakat kendisinden küçük olan köpek, ezilmesi gereken zayıf bir yaratıktı. Onunki kuvvet yönünde bir gelişmeydi. Devamlı acı çekmek, hatta mahvolmak tehlikesine karşı koyabilmek için,m yırtıcı ve savunmacı özellikleri aşırı derecede gelişmişti. Diğer köpeklerden daha çabuk hareket ediyor, daha hızlı koşuyordu. Onlara oranla daha hileci, daha çevikti. Çelik gibi kasları, ipince sinirleri olan, cesur, zalim, yırtıcı ve akıllı bir hayvan olup çıktı. Bütün bu niteliklere sahip olması şarttı, aksi halde ne ayakta durabilecek ne de içinde bulunduğu bu düşman çevrede yaşayabilecekti.	\N
16	Bir kuzey macerası	42	9	2	\N	Jack London’ın 1900 yılında yayımladığı Kurdun Oğlu adlı derlemenin içinde yer alan Bir Kuzey Macerası, Homeros’un Odysseia destanını andıran, zorlu engellerle dolu, çetin ve “dönüştürücü” bir yolculuğun hikâyesidir. Aleut adalarındaki Akatan’da yaşayan kabile reisi Naass, evlendiği gün karısı Unga’yı denizden çıkıp gelen sarı saçlı beyaz bir adama kaptırır. İki metreyi aşan boyuyla bir devi andıran, “tanrıların dünyanın ilk dönemlerindeki erkekleri örnek alarak kalıba döktükleri” bu adam, Unga’yı sırtına vurduğu gibi gemisine atlayıp oradan uzaklaşmıştır.\nNaass intikamını almak üzere azılı düşmanının peşinden yollara düşer. Dünyayı dolaşıp bilgi ve görgüsünü artıracağı, macera dolu yıllar beklemektedir onu…	\N
15	Demir Ökçe	42	9	6	\N	Jack London’ın 1907’de yayımlanan Demir Ökçe adlı eseri, modern karşı-ütopyacı romanların ilki sayılır. Totaliter ve baskıcı sistemdeki toplumu tanımlamak için kullanılan karşı-ütopya kavramı, bu kitapta, ABD’de oligarşik bir tiranlığın yükselişinde yansıyor. George Orwell’in Bin Dokuz Yüz Seksen Dört adlı romanına da esin kaynağı olan Demir Ökçe, toplumda ve siyasette gelecekte yer alacak değişiklikleri irdeler. Jack London’ın ileride ABD’de bir çöküş yaşanacağı yolundaki öngörüsü tam anlamıyla gerçekleşmemişse de, yazarın uluslararası gerginliklerle ilgili görüşleri birkaç yıl farkla da olsa gerçek tarihle örtüşür. Demir Ökçe’de 1913’te başlayan bu çatışma, gerçekte 1914’te patlak vermiştir. Dahası, London sadece 1914’te olanları değil, İkinci Dünya Savaşı’na giden olayları da kehanette bulunurcasına öngörmüş; faşist yapılanmanın dünyayı nasıl dehşete sürükleyeceğini ve bunun karşısındaki devrimci duruşun nasıl olması gerektiğini dile getirmiştir.\n\nNe yazık ki geçen zaman London’ın kehanetlerini doğrular niteliktedir.	\N
\.


                                                                                                                                                                                                                                                                                                                                                               4988.dat                                                                                            0000600 0004000 0002000 00000000025 14547772363 0014305 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2
1	4
2	2
2	4
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4989.dat                                                                                            0000600 0004000 0002000 00000000005 14547772363 0014304 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4991.dat                                                                                            0000600 0004000 0002000 00000000063 14547772363 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Hikaye, Roman & Masal
3	Edebiyat
4	Türkçe
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                             5007.dat                                                                                            0000600 0004000 0002000 00000000260 14547772363 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        mJvkGyVi94sggSMKhB7E31tHhsjQ3g5A	{"cookie":{"originalMaxAge":3600000,"expires":"2024-01-10T22:50:37.354Z","httpOnly":true,"path":"/"},"user_id":"139"}	2024-01-11 01:50:40
\.


                                                                                                                                                                                                                                                                                                                                                4993.dat                                                                                            0000600 0004000 0002000 00000001001 14547772363 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        9	CATEGORY DELETE
10	CATEGORY UPDATE
12	TRANSLATOR DELETE
13	TRANSLATOR UPDATE
15	BOOK CATEGORY UPDATE
17	BOOK TRANSLATOR UPDATE
18	BOOK TRANSLATOR DELETE
20	PUBLISHER DELETE
21	PUBLISHER UPDATE
23	AUTHOR DELETE
24	AUTHOR UPDATE
26	BOOK DELETE
27	BOOK UPDATE
29	READING DELETE
30	READING UPDATE
31	USER CREATE
32	USER DELETE
33	LOGIN ERROR
34	ERROR
8	CATEGORY CREATE
11	TRANSLATOR CREATE
14	BOOK CATEGORY CREATE
16	BOOK TRANSLATOR CREATE
19	PUBLISHER CREATE
22	AUTHOR CREATE
25	BOOK CREATE
28	READING CREATE
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               4995.dat                                                                                            0000600 0004000 0002000 00000000005 14547772363 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4997.dat                                                                                            0000600 0004000 0002000 00000000573 14547772363 0014315 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	YAPI KREDİ YAYINLARI
2	KOLEKTİF KİTAP
3	SÖZCÜ KİTABEVİ
4	HALK KİTABEVİ
5	EVEREST
6	TROPİKAL
7	PEGASUS
8	CEM
9	TÜRKİYE İŞ BANKASI KÜLTÜR
10	DOMİNGO
11	ALTIN KİTAPLAR
12	BİLGİVİZYON YAYINLARI
13	MARTI
14	İSKELE
15	DEX KİTAP
16	YAZILAMA
17	ARTEMİS
18	ODA YAYINLARI
19	DOĞAN EGMONT
20	AGANTA
21	BB101 YAYINLARI
22	REN
23	ALFA
24	CAN ROMAN
25	KORİDOR
\.


                                                                                                                                     4999.dat                                                                                            0000600 0004000 0002000 00000000005 14547772363 0014305 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5001.dat                                                                                            0000600 0004000 0002000 00000000141 14547772363 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Okunuyor
2	Kitaplıkta
3	Okundu
4	Yarım Bırakıldı
5	Sonra Okunacak
6	Satın Alınacak
\.


                                                                                                                                                                                                                                                                                                                                                                                                                               5003.dat                                                                                            0000600 0004000 0002000 00000001327 14547772363 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Ülkü	Tamer
2	Sevin	Okyay
3	Beyza Nur	Doğan
4	Cumhur	Mısıroğlu
5	İlkin	İnanç
6	Regaip	Minareci
7	Kamuran	Şipal
8	Levent	Cinemre
9	Emre	Gözgü
10	Ahmet	Cemal
11	Gökçe	Yavaş
12	Ertuğrul	Genç
13	Mustafa	Bahar
14	Kerim	Çetinoğlu
15	Duygu	Akın
16	Taylan	Taftaf
17	Halde	Yıldırım
18	Beril Tüccarbaşıoğlu	Uğur
19	Barbaros	Bostan
20	Barış	Zeren
21	Celal	Öner
22	Kutluhan	Kutlu
23	Belgin Selen Haktanıs	Us
24	Selin	Siral
25	Ebrar	Güldemler
26	Özlem	Özarpacı
27	Elif Bahar	Bakırcı
28	Nil	Alt
29	İrem	Kutluk
30	Celal	Üster
31	Metin	Yetkin
32	Can	Moralı
33	Mahmure	Kahraman
34	Handan Ünlü	Haktanır
35	Orhan	Düz
36	Aylin	Yıldız
37	Nazira	Altıntaş
38	Dost	Körpe
39	Sevinç Seyla	Tezcan
\.


                                                                                                                                                                                                                                                                                                         5005.dat                                                                                            0000600 0004000 0002000 00000024244 14547772363 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	ymcgeagh0	$2a$04$zvIaSVfx1jg4d4afskTpr.LtVPzdH3FAi4th/YTL1w8/JdnqSJGWW	cprophet0@addtoany.com	3
6	woatley1	$2a$04$sSucYvs4C5XhM9GEX0xJMOJZM0aC4Od.OO0ONb.BMaSuoUx.UOw9W	bmanshaw1@mail.ru	2
7	spencott2	$2a$04$wyhic1rjH5N9fVlFF604AucLKZukNUdhY4O2.KSYJjn2spjIPXSrm	rcarrack2@abc.net.au	1
8	jhonacker3	$2a$04$MoeQ2.VpC8MmwpOJ78KR9OsVIFn5eofNDJ1ePDH89MSiUk3gIRcvG	cmitchard3@arizona.edu	1
9	vbarbour4	$2a$04$Hb17ZN8oHJe/T6ujwJ/oxefV2fl4l3Qq3ug0G6Uyy4UM3d0vuKDke	aerbe4@rambler.ru	2
10	vpearsall5	$2a$04$PNoa2NqeIoiJy0dgEZu8WOkU2Tp.ijV8/Q4cWdSyCR12HAkz8OM/q	khuygen5@hibu.com	2
11	gdipietro6	$2a$04$tmIuIcXr3Cj2SA34Oxod9.LTbXFsmY4mRIRRaMsqzBQqfSbraWbH2	lmcgray6@cnet.com	1
12	jbedson7	$2a$04$Z4LIEA49CSBILVU/M0BWle5lO29k6UzIa8nLH.h/PluNdJun348.m	cprettjohn7@imdb.com	1
13	uhillam8	$2a$04$FdejHBXZtyQxY45fx3q9EuaoeUqmHzuFgez1VSqkb3izCQCaj5MN6	whamp8@china.com.cn	3
14	fohalleghane9	$2a$04$54xCp7LPjMmbR7TE7J.j4OwBeNcNSgwOovJv2a7xsCyNS2eysQka2	hpotteridge9@intel.com	3
15	gcoleridgea	$2a$04$j2y3DJT8El3MS12ZZQh8..aQWzxg6uaf7GXlsCEl2T7EoUAYvb0si	ameiera@va.gov	1
16	rfishleyb	$2a$04$q7IGI0OD.pinw7oTPws7D.35/FkZl8WVfFqJ8f072XtN5Z33n8I0e	zdrayb@dagondesign.com	2
17	rstallworthc	$2a$04$uF5wx6KCABB./ws2yXg/jOgGCkIuouXS0vj6KyHs8BH6S4DcoKYZ6	lstillc@wordpress.com	1
18	cfulopd	$2a$04$Xht9sV/LfDRDFBdjqJw/BeydLFZVeMXrD25P1xSgB6wkJpLz055va	wblissettd@weather.com	3
19	lbaymane	$2a$04$rBNBpIQ07iYRQ1JjB3PQr.GrIzWLFbnJwEjhzQnNKgSYwyp1U2Qk2	cbailesse@webeden.co.uk	2
20	gbinfieldf	$2a$04$wAIXtsTuriZc4TbGs261zORfL7AdGMQ/SO0AioUuYcHpJYT1gnlU2	chogginf@angelfire.com	1
21	flathyg	$2a$04$s7Sv34Uz11kSB9WJMFvlLOiE6676ctMFgdLpIJ9JBjfO6zqDqtJhu	bdennickg@topsy.com	2
22	agillih	$2a$04$8m4mIkUOJowOlDgjPp/4oevjX.i0Uv4VDTonhF7ANYCO/aVP6ydf.	ffairheadh@discovery.com	1
23	vpoleyei	$2a$04$htR4efI6JueVabvGgazWgeR456GQWXiSknNZ9RLaN0GB85.IGEGyW	smeroni@ucsd.edu	3
24	edurnellj	$2a$04$nJW9hMgCPT48iOjOnXxiOufLsP8PA.9iqA0VZf0IymSX9kA7/B4/i	wlendremj@mac.com	1
25	rfeldmarkk	$2a$04$s2jIclce6goRClt84szPZe7mNs7s8RUKGE2VlWVCTHSeTcGUibbdS	akirkbyk@ted.com	1
26	mminellil	$2a$04$Xvr1cVg8X8OOvGMXY3ZwW.hSFwZEzuchA8D8qf4DheSO2y0S70u1C	rinkinl@amazon.de	3
27	rlatheem	$2a$04$Wssj76fnjvXl6zEcOGPBjOQwcBC5lZ4J9uaMAfLItbiBgZSbgokZq	edameiselem@w3.org	2
28	mmieren	$2a$04$4K1GrXeyO6sT/WJXRN3ImeSFOJdNHPjMkVU7kSos1PuKxibPk7GL2	scharnickn@360.cn	3
29	gstonardo	$2a$04$CuFHR5gHXunOPrzelq8lw.KG23VB/EAYaDYwONDWNUui1ef6fufIm	rstreeteno@linkedin.com	1
30	magneaup	$2a$04$sfZcl8ExlSFrr/cKmftC6eZdJUJpIuP3VP5liBHpD6GNtbt8a.5yW	gsirettp@walmart.com	1
31	ccorreaq	$2a$04$Qo/J5.FaTQNHdvyLpmCAQu8QWYmGvJOjoFRaCPKGxKc1qyeDvsh.m	csangq@chicagotribune.com	1
32	apopleer	$2a$04$FrbnLjBxQf9LKdnTuek9SOkNUtNMd2GDa6rssgSw9UASODPfMnfXG	rlingr@boston.com	1
33	nwinsors	$2a$04$/a7HCMX0QihaslEQ.pd.iOFCHluglH28XNXacC2iY/Ljt.PgH9Oe2	tpictons@zdnet.com	2
34	dbrahamst	$2a$04$cEULj3dJTSpe/x9jU2KDz.AvMlzS.DnzrT2S.1XC3B0C1WTE.uAAS	aredfernt@blogs.com	3
35	thannamu	$2a$04$Bnh8ewOb6UCr9Gm8E0tnyOUi6UKmSodcNG8IJ9ErBVJhBMCJeY8gS	jdueru@springer.com	1
36	astapletonv	$2a$04$HxO8C2QcitRf3yGpiwF1g.1tse.IbA0isgLSDvICZq0afsUKonJUW	llutonv@slate.com	3
37	sgillingwaterw	$2a$04$BAJ8jAkN6wHNj/K.44Bvf.1D/ZP/EPulLm29sfS0nqjeKJ/5hiIgK	pfilsonw@plala.or.jp	1
38	cashardx	$2a$04$qDF9o1UB8uwg1zSDq1FYGe928njDwZ0or9xsBImpyFPkveOnERjdW	cdeehanx@vkontakte.ru	1
39	opagniny	$2a$04$MR/r/E1We6d2NGRvvnU9IOoRH7CYR58OSsWk6YN2sm0AO.Axh0AJG	bconnicky@imdb.com	2
40	abulluckz	$2a$04$QC2VkRka/fVxurQcAuLLTujGvUClpXlkzfSHLq5NZYd/LWTuwrHhO	abraitlingz@accuweather.com	3
41	hgiacopello10	$2a$04$/FJ5TCxVsyECkGmxcem.gecF/agdygWBCLVZ8j.oc1Hr3yfXzygTG	ntarling10@wp.com	2
42	sberwick11	$2a$04$BjDid6sLAEwEXy86kVdLb.uaVNoY.jkaZtBvBCBLWHNAl1md0XBee	akettlestringes11@npr.org	2
43	kmartinet12	$2a$04$NaDQZpyjozbMMSgGVg2mN.cRC3nSw0V9txOEdM6iJJoOSqq5jLOEi	psnowsill12@nymag.com	2
44	rstawell13	$2a$04$.tYNIvwrbb0c4BIFWya7rOhxDwN9ki8EkjgFk.WjMJ9jwX8axBw6W	cbrehault13@addthis.com	2
45	mmanske14	$2a$04$MzDxP1kJRDWSsxjYMnJL/ekFfBvX6bKgvFEoBMQuO84JTt7g5RP4O	mwilloughley14@dailymotion.com	3
46	cbannester15	$2a$04$VS2Dw.HHpjpNIDmREA.jf.VWHkroiS9DsQTqF0Jhbs/AJyVMFJRtu	phaston15@privacy.gov.au	1
47	tmelan16	$2a$04$II0kA1TQTfsWvE95/80Txu7LeT3XPgw3Fn6iKr4z0NuUBaze5m54m	hdiver16@dyndns.org	3
48	kpovlsen17	$2a$04$HJEUil2XqjcXj9lAnxYqO.EjhNWYYain/NblWsTLRRNiEKcH2K2Rq	gczajkowska17@time.com	2
49	mfeldstein18	$2a$04$XN4vFxhS..T6az/.xbD/guJeIHtxp.pnoJ//5YxS8eR77NMLgLm6q	cphalip18@msn.com	3
50	rbrook19	$2a$04$u4uex99yNhgZ8ZzCrRjCsufDElUWlxfR6DC8KBbMAw/NglwALSxi6	rkennler19@forbes.com	2
51	tcrowcher1a	$2a$04$bkNoX4e5yMJ44uus9/6knOk.PUlGkLGWvcTCjYtKeOfn1NGSBBWWW	edoorly1a@ca.gov	2
52	sfellenor1b	$2a$04$hU09lKnzF/uIPCwSeAn5o.q6g5kt2g2YJCICRqpjglslMPmLovT5.	ghynd1b@amazon.com	3
53	frosebotham1c	$2a$04$bw/dmAUOzu9GCzsLJciR5urACuPhbVLX2FyJYIXahqBxHQ.7udX7u	mofaherty1c@google.co.jp	2
54	dashurst1d	$2a$04$M.eNngm8OUsoluFBc4bx2OhfH3STUkL.130KxrhAn07xbKXj8DiCC	hfinley1d@guardian.co.uk	1
55	asaunier1e	$2a$04$L0XAUW4ZA7b/BtscBhVZ2e9KUZrFVcGzHHF.OvQsMmtR.IRP0C7KK	rvigars1e@wisc.edu	2
56	hkneesha1f	$2a$04$ZBrLFXTXmBiOKl4.5vRS9eIVVpIZ1yI6dQuJRT3nQ./S52FekNK/G	asimeoli1f@nydailynews.com	2
57	medmunds1g	$2a$04$TUSjMODWzcadffbrlsdxcufUofkKP0rNbIoYllAniPbU3MJ5yZd4G	rsiss1g@squarespace.com	2
58	ggudeman1h	$2a$04$wPlbKhkbbyCDo8PPXlkRcuyS.Vdd08ehBa4pvEWKa3KVPcfO2SkVO	cwithrington1h@cbsnews.com	3
59	aingarfill1i	$2a$04$s/NdotcGEr0dGQ2kAZtnDuiBDQVj2XuvhlrSiEtchTr4hJ5OwfqrG	ggierhard1i@nba.com	3
60	dokerin1j	$2a$04$aR9utBLLfMO1uHuKLTxbUeArZl.BLUxQx.Leh2ncNIOIhtXFChEDq	pgrigoletti1j@51.la	3
61	asapsford1k	$2a$04$smYPkbeES8DDagjh6Av/DeoIHH2wPScvQOhgM.OWdSjLxuDVUfCCe	ggladtbach1k@ow.ly	2
62	dchesworth1l	$2a$04$CcblNWR9Dpb.8DiRXQxWAeUNB88PjYMOTfs0iyu5/gVyFWPs.fhi.	ijimmison1l@ustream.tv	3
63	gleaman1m	$2a$04$Mhazyo.3csLMhshLavcVAeQg53QazXK9fVU.Mh0uWrJ3mMW.AWyHG	kstrangeway1m@washington.edu	3
64	comohun1n	$2a$04$3lfv/3CgfFChdJgarzDU6en7MGUuQfp3x4ZIuFQiULFcsz5KVa4wK	kcreamer1n@cdc.gov	1
65	schesterman1o	$2a$04$JJhpWGjhekN0d1ilOM8cQOR0.Fry3kDu4yzRLvYmXsUNvRTJdMkfC	dwainscoat1o@gravatar.com	2
66	bgeorgelin1p	$2a$04$rHsRkBG/i/6jaM7ffv9lce8CcgEhicDdvYJsAdT/xa6HDwd.dogmW	jguiett1p@rakuten.co.jp	1
67	rgriston1q	$2a$04$b1FoYspGwKsTpjO80EHQVeNgk6RtPoAHlLKw50PYIUJLjIgTDKDLW	sstanyan1q@elpais.com	2
68	cpickton1r	$2a$04$dibxXezInskDhaSESHx72ephALxC6vRVbcDFRbY9xexk/60xto47m	sswaby1r@wufoo.com	1
69	ahonisch1s	$2a$04$Eyq8Sjb7CObVAUMdlUhgLesTwDXwVfl09W4OMGUlFRiUxQDkaV092	cbarock1s@wix.com	1
70	fangless1t	$2a$04$nOQEd/EdSO7lpjF6SaAWeOG0rGEdJdRL7NBbXr2mDn322ebit3c9m	dalmak1t@eventbrite.com	2
71	gluxton1u	$2a$04$jwIUGHH.APmIuVKjmJMptO2pXgY9Dn.3Z/uoylUI5UUTK4pK9fuMW	lbotton1u@arizona.edu	1
72	abarends1v	$2a$04$EDNuKlRotjprxiAb1hRSHeJmsAW/vfkRCLMkIOZiTD/6oDo0I9Hhe	asidnall1v@sakura.ne.jp	3
73	abartell1w	$2a$04$U4UtwdV3uCpQVCMtiyU4.OWN6p6XfEzT0SC.mdcOC/ViTobPEyTY6	jmccleod1w@baidu.com	2
74	ggroarty1x	$2a$04$24oNrjMPCQGaY0XtpqHKSOU/SuTRQskhPtH55t2q6FsnADtM9iYFW	jsiehard1x@technorati.com	3
75	dgookey1y	$2a$04$vguALatBMjUb0r3J9RIVOupenDZuKqmcXwUi5pVERklo3LNxcRd.K	aalvey1y@1688.com	3
76	mshuttle1z	$2a$04$ITNuxsDPJPb17En5LOae.e6q4hI2ZXP4t0JDSS028t6XRft1n.b4q	jsheber1z@behance.net	2
77	efirmage20	$2a$04$U7C5VCATzEmBJKDPCYHeTOudfKgL0/LqXNdEwaQWKHiHe7AxNySuS	mhollyland20@usnews.com	3
78	edimelow21	$2a$04$Pi/.1Gumb/EvMvzbwKD8UOEXRgJWAuD3EGWt9sKZvgP3h69E8FndS	mcubbin21@mapy.cz	3
79	bsimner22	$2a$04$tXWU3WF9aPJG1bRtESp3EeVpIYrn3HY.vOh7KC8nqhs.PWeIA5WNi	tflaxon22@wired.com	2
80	bmattingley23	$2a$04$XZlKAZtiFcB9bRsCwcu4ZO9zBlet30wBomMmnKXs315F2hTF9KYry	hleckie23@is.gd	3
81	spotkins24	$2a$04$4EJ8JgZLRtidonOFK9VRNurFCNXnZvX6Erp6TXo/1zjWbrJbyezzC	phoutby24@nytimes.com	1
82	wkernley25	$2a$04$4L1UUW7u0eEVOqtn3ihrh.FLPVIwRKzhP1aYj18vdFRdXVEBBsOey	bhaythorn25@sciencedaily.com	2
83	lzorzutti26	$2a$04$c1npVzBhYOOzsUkjqTy9EufyuUwuSACO8ZfLgwPNqCFzeGdB3PdIK	jpalmer26@woothemes.com	3
84	icandish27	$2a$04$adBnfqTUSTCIFf7Q986vhOAHnHvxqkhVJ8leSdX2XYQQjq4JWhK/S	bpantlin27@booking.com	2
85	mswadon28	$2a$04$QDiG7ygbx9WdysVMmdLPZejx4P5U76fUyqlzPPk3rIj5aeV6mSeNm	mren28@networksolutions.com	1
86	rwhitham29	$2a$04$ZjaguxshorPf27di7DWlLOhUqq23riCNbEeM9cbmiiJ8NhSrWi/Ae	nrudram29@blogtalkradio.com	2
87	preicherz2a	$2a$04$4EIu4XDNOv3GLNGrUArYxuGCz2zl50zDQhg6KgrjlUlOhEoqWTqSC	cliepins2a@kickstarter.com	1
88	pedgington2b	$2a$04$ZXAL4vEftDqVTECOZGSU7u5rx4b81fulg6rX9BTqYOh6BAKKRdbbi	ffreshwater2b@wikia.com	1
89	bberan2c	$2a$04$1Tn.XzvgIbMXZ3odGpxjbe12JpYud7/zqmRFO60tuALZhL2aPArAG	alewnden2c@opensource.org	2
90	mcumming2d	$2a$04$2ACHmN6NibpcTmSGMw7WCexDAeWwi24ANckXmVrhlkgO5kg2hUSAa	gspowart2d@reddit.com	3
91	coakman2e	$2a$04$ZcNklabNn8gcREbJEIKZG.w3Qk4ewuCR6CVNEv1xyC3/APtokUWYa	rmantle2e@example.com	2
92	mbelham2f	$2a$04$d4rVnpB5pKVquiBjOeOOiuA/yP8ZGF8.5wu.Ed6ETDNjo/raAJV2O	dvickers2f@fda.gov	2
93	rcargill2g	$2a$04$jYJRlw5FigRazSDQ4b1a5.cCpwAfWLqycXScGFSkMmd6Xuf9A1mFy	mwrathmall2g@nyu.edu	1
94	nmacgillivray2h	$2a$04$NZ0vInOrx5FtxezZJqugx.sNZ8voGzLSU4pcHxvxrPkahTFZ7jmZ6	mnellis2h@bluehost.com	1
95	cgynn2i	$2a$04$pGmLk4VzQFSFtY0GHD32YutdezDXO2l/fpKnwqWGsU3ox4G0tIkc.	cfussell2i@posterous.com	1
96	bitzkovwitch2j	$2a$04$wmVMXswEuMO15JpxB49ASOXRgRlUWsj9pyBKrifNip3cax5czJqju	sgowing2j@aboutads.info	2
97	gcallendar2k	$2a$04$k8h8WXgcvqbwW3Ynm73GxewRz1Tx5XsppAgSIzvhZS7H6VPIDSOPW	etook2k@prnewswire.com	2
98	khaggis2l	$2a$04$UtsshZU/vMt1BdxPGNwfwu0WD8FVwoW/5NZ.wC2zAK5i3YpwHEk4a	rmuddle2l@geocities.com	2
99	mdomico2m	$2a$04$bV.7i8UBiMMnkpgLhXfSBO1IF5bcsiS77vqEk2I6JxSU0AkxJT5K6	sfanstone2m@bloglines.com	3
100	vletty2n	$2a$04$gMZGBqW9tF14LMiNcA14R.JJ/eavhZMToS0IVXhvgRppbgjEOYhB6	druoss2n@skype.com	1
101	tmcgaugie2o	$2a$04$/myLUYyxmZ5Jtwgzpe.SMOvvEBosiObelM6KqJGTrzbGsuTXmN6uy	bsymmons2o@oracle.com	1
102	lkleyn2p	$2a$04$YSrmJcf2gZKKBY6zCpgcWOZAATN86ZZJXFd2Pznzh6nn1nFFpt6xq	fbeveredge2p@yelp.com	1
103	kguilliland2q	$2a$04$xrAIQFYJ92.sUcpSEshv5OK.Z7787eVv/gw3AWotPms9nd6yhW1eK	tgeorg2q@rediff.com	1
104	mbeentjes2r	$2a$04$AU988k7WnOyMjriTzCvJv.mLPRnnJaFum4Bgc7x2SP6.oSFmunYsa	nphebey2r@columbia.edu	3
127	admin	$2b$10$RIrVVoj7LG1CopYMmXGqiOT4hL7QaBOe1JKs5tqywUkarp4XWPwSW	\N	1
128	user	$2b$10$DoreJHJxQqNWQtSANTLoCeouXFdAgc7PMnrjTY0dpclClmiYKqy0e	\N	1
129	kerem	$2b$10$ZXqSor24vQNGzK6W1DmmKug0yo9mpKbKdv7/pemXEB9DD/NQsODxu	\N	1
138	atalay	$2b$10$Z2PLBv5piRS5Wr19tMuVguedsW.UgGYnJWVSHu37DlYLwNO26YPGa	krhnatalay@gmail.com	1
139	ATALAY	$2b$10$IV3bqWOSFnJuecB9THMpEuCRNa6CTlZhzHCrQWRGtcK/b7NGjbwJi	atalay.karahan59@gmail.com	1
140	Atalay	$2b$10$YSAX2vjGitLRfHMEKvt7Pe5RPzTsy/1XvIDEn4loL2KP4NY0GeRci	atalay.galata@gmail.com	1
\.


                                                                                                                                                                                                                                                                                                                                                            restore.sql                                                                                         0000600 0004000 0002000 00000062203 14547772363 0015411 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

DROP DATABASE home_library;
--
-- Name: home_library; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE home_library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE home_library OWNER TO postgres;

\connect home_library

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: insert_timestamp_for_log(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_timestamp_for_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.event_date := NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.insert_timestamp_for_log() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AUTHOR; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AUTHOR" (
    author_id bigint NOT NULL,
    author_name character varying(50) NOT NULL,
    author_surname character varying(50)
);


ALTER TABLE public."AUTHOR" OWNER TO postgres;

--
-- Name: AUTHORITY; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AUTHORITY" (
    authority_id bigint NOT NULL,
    role character varying(16) NOT NULL
);


ALTER TABLE public."AUTHORITY" OWNER TO postgres;

--
-- Name: AUTHORITY_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."AUTHORITY" ALTER COLUMN authority_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."AUTHORITY_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: AUTHOR_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."AUTHOR" ALTER COLUMN author_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."AUTHOR_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: BOOK; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BOOK" (
    book_id bigint NOT NULL,
    book_title text NOT NULL,
    author_id bigint NOT NULL,
    publisher_id bigint,
    status_id bigint NOT NULL,
    image_path text,
    book_summary text,
    book_isbn integer
);


ALTER TABLE public."BOOK" OWNER TO postgres;

--
-- Name: BOOK_CATEGORY; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BOOK_CATEGORY" (
    book_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public."BOOK_CATEGORY" OWNER TO postgres;

--
-- Name: BOOK_TRANSLATOR; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BOOK_TRANSLATOR" (
    book_id bigint NOT NULL,
    translator_id bigint NOT NULL
);


ALTER TABLE public."BOOK_TRANSLATOR" OWNER TO postgres;

--
-- Name: BOOK_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."BOOK" ALTER COLUMN book_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."BOOK_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: CATEGORY; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CATEGORY" (
    category_id bigint NOT NULL,
    category_name character varying(50) NOT NULL
);


ALTER TABLE public."CATEGORY" OWNER TO postgres;

--
-- Name: CATEGORY_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."CATEGORY" ALTER COLUMN category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."CATEGORY_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: DB_SESSION; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DB_SESSION" (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


ALTER TABLE public."DB_SESSION" OWNER TO postgres;

--
-- Name: EVENT_TYPE; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EVENT_TYPE" (
    event_id bigint NOT NULL,
    event_name character varying(50) NOT NULL
);


ALTER TABLE public."EVENT_TYPE" OWNER TO postgres;

--
-- Name: EVENT_TYPE_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."EVENT_TYPE" ALTER COLUMN event_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."EVENT_TYPE_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: LOG; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LOG" (
    log_id bigint NOT NULL,
    user_id bigint,
    event_type_id bigint NOT NULL,
    event_date timestamp without time zone NOT NULL,
    book_id bigint,
    description text,
    category_id bigint,
    translator_id bigint,
    publisher_id bigint,
    author_id bigint,
    reading_id bigint
);


ALTER TABLE public."LOG" OWNER TO postgres;

--
-- Name: LOG_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."LOG" ALTER COLUMN log_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."LOG_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: PUBLISHER; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PUBLISHER" (
    publisher_id bigint NOT NULL,
    publisher_name character varying(50) NOT NULL
);


ALTER TABLE public."PUBLISHER" OWNER TO postgres;

--
-- Name: PUBLISHER_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."PUBLISHER" ALTER COLUMN publisher_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."PUBLISHER_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: READING; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."READING" (
    reading_id bigint NOT NULL,
    user_id bigint NOT NULL,
    book_id bigint NOT NULL,
    status_id bigint NOT NULL,
    comment text
);


ALTER TABLE public."READING" OWNER TO postgres;

--
-- Name: READING_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."READING" ALTER COLUMN reading_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."READING_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: STATUS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."STATUS" (
    status_id bigint NOT NULL,
    status_name character varying(50) NOT NULL
);


ALTER TABLE public."STATUS" OWNER TO postgres;

--
-- Name: STATUS_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."STATUS" ALTER COLUMN status_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."STATUS_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: TRANSLATOR; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TRANSLATOR" (
    translator_id bigint NOT NULL,
    translator_name character varying(30) NOT NULL,
    translator_surname character varying(30)
);


ALTER TABLE public."TRANSLATOR" OWNER TO postgres;

--
-- Name: TRANSLATOR_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."TRANSLATOR" ALTER COLUMN translator_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TRANSLATOR_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: USER; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."USER" (
    user_id bigint NOT NULL,
    user_name character varying(16) NOT NULL,
    password character varying(120) NOT NULL,
    email character varying(50),
    authority_id bigint NOT NULL
);


ALTER TABLE public."USER" OWNER TO postgres;

--
-- Name: USER_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."USER" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."USER_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: AUTHOR; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AUTHOR" (author_id, author_name, author_surname) FROM stdin;
\.
COPY public."AUTHOR" (author_id, author_name, author_surname) FROM '$$PATH$$/4983.dat';

--
-- Data for Name: AUTHORITY; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AUTHORITY" (authority_id, role) FROM stdin;
\.
COPY public."AUTHORITY" (authority_id, role) FROM '$$PATH$$/4984.dat';

--
-- Data for Name: BOOK; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BOOK" (book_id, book_title, author_id, publisher_id, status_id, image_path, book_summary, book_isbn) FROM stdin;
\.
COPY public."BOOK" (book_id, book_title, author_id, publisher_id, status_id, image_path, book_summary, book_isbn) FROM '$$PATH$$/4987.dat';

--
-- Data for Name: BOOK_CATEGORY; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BOOK_CATEGORY" (book_id, category_id) FROM stdin;
\.
COPY public."BOOK_CATEGORY" (book_id, category_id) FROM '$$PATH$$/4988.dat';

--
-- Data for Name: BOOK_TRANSLATOR; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BOOK_TRANSLATOR" (book_id, translator_id) FROM stdin;
\.
COPY public."BOOK_TRANSLATOR" (book_id, translator_id) FROM '$$PATH$$/4989.dat';

--
-- Data for Name: CATEGORY; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CATEGORY" (category_id, category_name) FROM stdin;
\.
COPY public."CATEGORY" (category_id, category_name) FROM '$$PATH$$/4991.dat';

--
-- Data for Name: DB_SESSION; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DB_SESSION" (sid, sess, expire) FROM stdin;
\.
COPY public."DB_SESSION" (sid, sess, expire) FROM '$$PATH$$/5007.dat';

--
-- Data for Name: EVENT_TYPE; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EVENT_TYPE" (event_id, event_name) FROM stdin;
\.
COPY public."EVENT_TYPE" (event_id, event_name) FROM '$$PATH$$/4993.dat';

--
-- Data for Name: LOG; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LOG" (log_id, user_id, event_type_id, event_date, book_id, description, category_id, translator_id, publisher_id, author_id, reading_id) FROM stdin;
\.
COPY public."LOG" (log_id, user_id, event_type_id, event_date, book_id, description, category_id, translator_id, publisher_id, author_id, reading_id) FROM '$$PATH$$/4995.dat';

--
-- Data for Name: PUBLISHER; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PUBLISHER" (publisher_id, publisher_name) FROM stdin;
\.
COPY public."PUBLISHER" (publisher_id, publisher_name) FROM '$$PATH$$/4997.dat';

--
-- Data for Name: READING; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."READING" (reading_id, user_id, book_id, status_id, comment) FROM stdin;
\.
COPY public."READING" (reading_id, user_id, book_id, status_id, comment) FROM '$$PATH$$/4999.dat';

--
-- Data for Name: STATUS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."STATUS" (status_id, status_name) FROM stdin;
\.
COPY public."STATUS" (status_id, status_name) FROM '$$PATH$$/5001.dat';

--
-- Data for Name: TRANSLATOR; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TRANSLATOR" (translator_id, translator_name, translator_surname) FROM stdin;
\.
COPY public."TRANSLATOR" (translator_id, translator_name, translator_surname) FROM '$$PATH$$/5003.dat';

--
-- Data for Name: USER; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."USER" (user_id, user_name, password, email, authority_id) FROM stdin;
\.
COPY public."USER" (user_id, user_name, password, email, authority_id) FROM '$$PATH$$/5005.dat';

--
-- Name: AUTHORITY_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AUTHORITY_id_seq"', 3, true);


--
-- Name: AUTHOR_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AUTHOR_id_seq"', 74, true);


--
-- Name: BOOK_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BOOK_id_seq"', 16, true);


--
-- Name: CATEGORY_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CATEGORY_id_seq"', 4, true);


--
-- Name: EVENT_TYPE_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EVENT_TYPE_id_seq"', 34, true);


--
-- Name: LOG_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."LOG_id_seq"', 5, true);


--
-- Name: PUBLISHER_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PUBLISHER_id_seq"', 25, true);


--
-- Name: READING_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."READING_id_seq"', 1, false);


--
-- Name: STATUS_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."STATUS_id_seq"', 6, true);


--
-- Name: TRANSLATOR_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TRANSLATOR_id_seq"', 39, true);


--
-- Name: USER_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."USER_id_seq"', 140, true);


--
-- Name: AUTHORITY AUTHORITY_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AUTHORITY"
    ADD CONSTRAINT "AUTHORITY_pkey" PRIMARY KEY (authority_id);


--
-- Name: AUTHORITY AUTHORITY_role_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AUTHORITY"
    ADD CONSTRAINT "AUTHORITY_role_key" UNIQUE (role);


--
-- Name: AUTHOR AUTHOR_author_name_author_surname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AUTHOR"
    ADD CONSTRAINT "AUTHOR_author_name_author_surname_key" UNIQUE (author_name, author_surname);


--
-- Name: AUTHOR AUTHOR_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AUTHOR"
    ADD CONSTRAINT "AUTHOR_pkey" PRIMARY KEY (author_id);


--
-- Name: BOOK_CATEGORY BOOK_CATEGORY_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BOOK_CATEGORY"
    ADD CONSTRAINT "BOOK_CATEGORY_pkey" PRIMARY KEY (book_id, category_id);


--
-- Name: BOOK_TRANSLATOR BOOK_TRANSLATOR_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BOOK_TRANSLATOR"
    ADD CONSTRAINT "BOOK_TRANSLATOR_pkey" PRIMARY KEY (book_id, translator_id);


--
-- Name: BOOK BOOK_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "BOOK_pkey" PRIMARY KEY (book_id);


--
-- Name: CATEGORY CATEGORY_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CATEGORY"
    ADD CONSTRAINT "CATEGORY_category_name_key" UNIQUE (category_name);


--
-- Name: CATEGORY CATEGORY_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CATEGORY"
    ADD CONSTRAINT "CATEGORY_pkey" PRIMARY KEY (category_id);


--
-- Name: EVENT_TYPE EVENT_TYPE_event_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EVENT_TYPE"
    ADD CONSTRAINT "EVENT_TYPE_event_name_key" UNIQUE (event_name);


--
-- Name: EVENT_TYPE EVENT_TYPE_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EVENT_TYPE"
    ADD CONSTRAINT "EVENT_TYPE_pkey" PRIMARY KEY (event_id);


--
-- Name: LOG LOG_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "LOG_pkey" PRIMARY KEY (log_id);


--
-- Name: PUBLISHER PUBLISHER_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PUBLISHER"
    ADD CONSTRAINT "PUBLISHER_pkey" PRIMARY KEY (publisher_id);


--
-- Name: PUBLISHER PUBLISHER_publisher_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PUBLISHER"
    ADD CONSTRAINT "PUBLISHER_publisher_name_key" UNIQUE (publisher_name);


--
-- Name: READING READING_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "READING_pkey" PRIMARY KEY (reading_id);


--
-- Name: STATUS STATUS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."STATUS"
    ADD CONSTRAINT "STATUS_pkey" PRIMARY KEY (status_id);


--
-- Name: STATUS STATUS_status_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."STATUS"
    ADD CONSTRAINT "STATUS_status_name_key" UNIQUE (status_name);


--
-- Name: TRANSLATOR TRANSLATOR_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TRANSLATOR"
    ADD CONSTRAINT "TRANSLATOR_pkey" PRIMARY KEY (translator_id);


--
-- Name: TRANSLATOR TRANSLATOR_translator_name_translator_surname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TRANSLATOR"
    ADD CONSTRAINT "TRANSLATOR_translator_name_translator_surname_key" UNIQUE (translator_name, translator_surname);


--
-- Name: USER USER_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "USER_email_key" UNIQUE (email);


--
-- Name: USER USER_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "USER_pkey" PRIMARY KEY (user_id);


--
-- Name: USER USER_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "USER_user_name_key" UNIQUE (user_name);


--
-- Name: DB_SESSION session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DB_SESSION"
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_session_expire" ON public."DB_SESSION" USING btree (expire);


--
-- Name: fki_FK_LOG.author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_LOG.author_id" ON public."LOG" USING btree (author_id);


--
-- Name: fki_FK_LOG.book_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_LOG.book_id" ON public."LOG" USING btree (book_id);


--
-- Name: fki_FK_LOG.category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_LOG.category_id" ON public."LOG" USING btree (category_id);


--
-- Name: fki_FK_LOG.event_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_LOG.event_type_id" ON public."LOG" USING btree (event_type_id);


--
-- Name: fki_FK_LOG.publisher_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_LOG.publisher_id" ON public."LOG" USING btree (publisher_id);


--
-- Name: fki_FK_LOG.reading_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_LOG.reading_id" ON public."LOG" USING btree (reading_id);


--
-- Name: fki_FK_LOG.translator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_LOG.translator_id" ON public."LOG" USING btree (translator_id);


--
-- Name: fki_FK_LOG.user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_LOG.user_id" ON public."LOG" USING btree (user_id);


--
-- Name: fki_FK_READING.book_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_READING.book_id" ON public."READING" USING btree (book_id);


--
-- Name: fki_FK_READING.user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_READING.user_id" ON public."READING" USING btree (user_id);


--
-- Name: fki_sdfsdfsdfs; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sdfsdfsdfs ON public."READING" USING btree (user_id);


--
-- Name: LOG event_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER event_date BEFORE INSERT ON public."LOG" FOR EACH ROW EXECUTE FUNCTION public.insert_timestamp_for_log();


--
-- Name: BOOK_CATEGORY FK_BOOK_CATEGORY_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BOOK_CATEGORY"
    ADD CONSTRAINT "FK_BOOK_CATEGORY_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);


--
-- Name: BOOK_CATEGORY FK_BOOK_CATEGORY_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BOOK_CATEGORY"
    ADD CONSTRAINT "FK_BOOK_CATEGORY_category_id" FOREIGN KEY (category_id) REFERENCES public."CATEGORY"(category_id);


--
-- Name: BOOK_TRANSLATOR FK_BOOK_TRANSLATOR_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BOOK_TRANSLATOR"
    ADD CONSTRAINT "FK_BOOK_TRANSLATOR_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);


--
-- Name: BOOK_TRANSLATOR FK_BOOK_TRANSLATOR_translator_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BOOK_TRANSLATOR"
    ADD CONSTRAINT "FK_BOOK_TRANSLATOR_translator_id" FOREIGN KEY (translator_id) REFERENCES public."TRANSLATOR"(translator_id);


--
-- Name: BOOK FK_BOOK_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "FK_BOOK_author_id" FOREIGN KEY (author_id) REFERENCES public."AUTHOR"(author_id);


--
-- Name: BOOK FK_BOOK_publisher_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "FK_BOOK_publisher_id" FOREIGN KEY (publisher_id) REFERENCES public."PUBLISHER"(publisher_id);


--
-- Name: BOOK FK_BOOK_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "FK_BOOK_status_id" FOREIGN KEY (status_id) REFERENCES public."STATUS"(status_id);


--
-- Name: LOG FK_LOG_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_author_id" FOREIGN KEY (author_id) REFERENCES public."AUTHOR"(author_id);


--
-- Name: LOG FK_LOG_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);


--
-- Name: LOG FK_LOG_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_category_id" FOREIGN KEY (category_id) REFERENCES public."CATEGORY"(category_id);


--
-- Name: LOG FK_LOG_event_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_event_type_id" FOREIGN KEY (event_type_id) REFERENCES public."EVENT_TYPE"(event_id);


--
-- Name: LOG FK_LOG_publisher_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_publisher_id" FOREIGN KEY (publisher_id) REFERENCES public."PUBLISHER"(publisher_id);


--
-- Name: LOG FK_LOG_reading_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_reading_id" FOREIGN KEY (reading_id) REFERENCES public."READING"(reading_id);


--
-- Name: LOG FK_LOG_translator_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_translator_id" FOREIGN KEY (translator_id) REFERENCES public."TRANSLATOR"(translator_id);


--
-- Name: LOG FK_LOG_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_user_id" FOREIGN KEY (user_id) REFERENCES public."USER"(user_id);


--
-- Name: READING FK_READING_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "FK_READING_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);


--
-- Name: READING FK_READING_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "FK_READING_status_id" FOREIGN KEY (status_id) REFERENCES public."STATUS"(status_id);


--
-- Name: READING FK_READING_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "FK_READING_user_id" FOREIGN KEY (user_id) REFERENCES public."USER"(user_id);


--
-- Name: USER FK_USER_authority_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "FK_USER_authority_id" FOREIGN KEY (authority_id) REFERENCES public."AUTHORITY"(authority_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             