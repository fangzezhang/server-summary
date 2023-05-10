CREATE DATABASE IF NOT EXISTS serve;
USE serve;
CREATE TABLE IF NOT EXISTS `host` (
  `host` char(50) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `beta_env` varchar(45) NOT NULL,
  `pub_env` varchar(45) DEFAULT NULL,
  `vpc_env` varchar(45) DEFAULT NULL,
  `is_modify` tinyint DEFAULT '0',
  `region` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`host`),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS `deleted_host` (
  `host` char(50) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `beta_env` varchar(45) NOT NULL,
  `pub_env` varchar(45) DEFAULT NULL,
  `vpc_env` varchar(45) DEFAULT NULL,
  `is_modify` tinyint DEFAULT '0',
  PRIMARY KEY (`host`),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
