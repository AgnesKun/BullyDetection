DROP TABLE IF EXISTS users;

CREATE TABLE users (
  user_id bigint NOT NULL,
  name    varchar(100) NOT NULL,
  communities integer[],
  CONSTRAINT pri_user_id PRIMARY KEY (user_id),
  UNIQUE (user_id)
);

DROP TABLE IF EXISTS communities;

CREATE TABLE communities (
  comm_id bigint NOT NULL,
  name    varchar(100) NOT NULL,
  users   integer[],
  CONSTRAINT pri_comm_id PRIMARY KEY (comm_id),
  UNIQUE (comm_id)
);

INSERT INTO communities VALUES(2001,  'A', '{1001, 1002, 1003, 1004, 1005}');
INSERT INTO communities VALUES(2002,  'B', '{1001, 1002, 1003, 1004}');
INSERT INTO communities VALUES(2003,  'C', '{1003, 1004}');
INSERT INTO communities VALUES(20010, 'D', '{10010, 10011, 10012}');
INSERT INTO communities VALUES(20011, 'E', '{10010, 10011, 10012}');
INSERT INTO communities VALUES(20012, 'F', '{10012}');

INSERT INTO users VALUES (1001, '1001@fb.com', '{2001, 2002}');
INSERT INTO users VALUES (1002, '1002@fb.com', '{2001, 2002}');
INSERT INTO users VALUES (1003, '1003@fb.com', '{2001, 2002, 2003}');
INSERT INTO users VALUES (1004, '1004@fb.com', '{2001, 2002, 2003}');
INSERT INTO users VALUES (1005, '1005@fb.com', '{2001}');
INSERT INTO users VALUES (1006, '1006@fb.com', '{2003}');
INSERT INTO users VALUES (10010, '10010@gmail.com', '{20010, 20011}');
INSERT INTO users VALUES (10011, '10011@gmail.com', '{20010, 20011}');
INSERT INTO users VALUES (10012, '10012@gmail.com', '{20010, 20011, 20012}');
