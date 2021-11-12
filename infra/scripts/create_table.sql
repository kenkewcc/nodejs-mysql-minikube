/**Create database if not exist**/
CREATE DATABASE IF NOT EXISTS test_db;

USE test_db;

/**Create table if not exist**/
CREATE TABLE IF NOT EXISTS `challenge` (
  `message` varchar(255)
);

/**Insert data**/
INSERT INTO challenge (message) VALUES ('Hello World');

/**Add password to Root user**/
ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'password';

/**Refresh privileges**/
flush privileges;