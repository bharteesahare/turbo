PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20230729135104');
INSERT INTO schema_migrations VALUES('20230729135126');
INSERT INTO schema_migrations VALUES('20230729135223');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2023-07-29 13:52:49.319905','2023-07-29 13:52:49.319905');
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime(6), "remember_created_at" datetime(6), "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO users VALUES(1,'ashish@gmail.com','$2a$12$3U8xz/fcc8MFzVw1tdBr/.MWlErSIkSbql4oxWqeCPIYFFrSAG4pm',NULL,NULL,NULL,'2023-07-29 13:54:48.379072','2023-07-29 13:54:48.379072');
INSERT INTO users VALUES(2,'sachin@gmail.com','$2a$12$70QrO8MsRpVwM2e0CHuBouxcCowoGg.zUdhTx2mnpgMVhCe9vbwGy',NULL,NULL,NULL,'2023-07-29 13:54:48.585100','2023-07-29 13:54:48.585100');
CREATE TABLE IF NOT EXISTS "posts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "body" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO posts VALUES(1,'test1','sjjs','2023-07-29 13:56:09.081204','2023-07-29 13:56:09.081204');
CREATE TABLE IF NOT EXISTS "comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "body" text, "user_id" integer NOT NULL, "post_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_03de2dc08c"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_2fd19c0db7"
FOREIGN KEY ("post_id")
  REFERENCES "posts" ("id")
);
INSERT INTO comments VALUES(1,'s',1,1,'2023-07-29 14:20:21.271990','2023-07-29 14:20:21.271990');
INSERT INTO comments VALUES(14,'Gagga',1,1,'2023-07-29 14:48:12.697736','2023-07-29 14:48:12.697736');
INSERT INTO comments VALUES(15,'455',2,1,'2023-07-29 14:48:32.766234','2023-07-29 14:48:32.766234');
INSERT INTO comments VALUES(16,'455',2,1,'2023-07-29 14:48:47.516235','2023-07-29 14:48:47.516235');
INSERT INTO comments VALUES(17,'ashiwin',2,1,'2023-07-29 14:49:01.000502','2023-07-29 14:49:01.000502');
INSERT INTO comments VALUES(18,'sss',1,1,'2023-07-30 05:14:48.816880','2023-07-30 05:14:48.816880');
INSERT INTO comments VALUES(19,'sachin',1,1,'2023-07-30 05:23:04.558915','2023-07-30 05:23:04.558915');
INSERT INTO comments VALUES(20,'last',1,1,'2023-07-30 05:24:34.788349','2023-07-30 05:25:02.548316');
INSERT INTO comments VALUES(21,'akka',1,1,'2023-07-30 05:27:40.293808','2023-07-30 05:27:40.293808');
INSERT INTO comments VALUES(22,'sachin',1,1,'2023-07-30 05:27:48.595625','2023-07-30 05:27:48.595625');
INSERT INTO comments VALUES(23,'sachin',1,1,'2023-07-30 05:27:49.458967','2023-07-30 05:27:49.458967');
INSERT INTO comments VALUES(24,'sachin',1,1,'2023-07-30 05:27:49.857194','2023-07-30 05:27:49.857194');
INSERT INTO comments VALUES(25,'sachin',1,1,'2023-07-30 05:27:50.098902','2023-07-30 05:27:50.098902');
INSERT INTO comments VALUES(26,'sachin',1,1,'2023-07-30 05:27:50.307493','2023-07-30 05:27:50.307493');
INSERT INTO comments VALUES(27,'sachin',1,1,'2023-07-30 05:28:24.016550','2023-07-30 05:28:24.016550');
INSERT INTO comments VALUES(28,'sachin',1,1,'2023-07-30 05:28:25.620217','2023-07-30 05:28:25.620217');
INSERT INTO comments VALUES(29,'latest',1,1,'2023-07-30 05:28:30.368958','2023-07-30 05:28:30.368958');
INSERT INTO comments VALUES(30,'latest',1,1,'2023-07-30 05:28:41.467217','2023-07-30 05:28:41.467217');
INSERT INTO comments VALUES(31,'lastet one',1,1,'2023-07-30 05:29:02.410272','2023-07-30 05:29:02.410272');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('users',2);
INSERT INTO sqlite_sequence VALUES('posts',1);
INSERT INTO sqlite_sequence VALUES('comments',31);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
CREATE INDEX "index_comments_on_post_id" ON "comments" ("post_id");
COMMIT;
