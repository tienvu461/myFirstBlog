# myFirstBlog
trying to host my first blog


CREATE DATABASE blogdb;
CREATE USER blogdb WITH ENCRYPTED PASSWORD 'blogdb123';
ALTER ROLE blogdb SET client_encoding TO 'utf8';
ALTER ROLE blogdb SET default_transaction_isolation TO 'read committed';
ALTER ROLE blogdb SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE blogdb TO blogdb;