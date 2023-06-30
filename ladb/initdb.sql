use ladb;
CREATE USER 'react'@'%' IDENTIFIED BY 'react';
GRANT ALL PRIVILEGES ON ladb.* TO 'react'@'%' ;

DROP TABLE IF EXISTS `cpanels`;
CREATE TABLE `cpanels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(245) DEFAULT NULL,
  `description` varchar(545) DEFAULT NULL,
  `item_list` int unsigned DEFAULT NULL,
  `sample` varchar(45) DEFAULT NULL,
  `ws_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- LOAD DATA INFILE '/data/cpanels.csv' 
-- INTO TABLE cpanels 
-- FIELDS TERMINATED BY ';' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\r\n'
-- IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `dash_frame_list` ;
CREATE TABLE `dash_frame_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `spec_id` int unsigned DEFAULT NULL,
  `frame_id` int unsigned DEFAULT NULL,
  `type` varchar(45) DEFAULT 'comprehension',
  PRIMARY KEY (`id`),
  KEY `pk_spec_idx` (`spec_id`),
  KEY `pk_frame_idx` (`frame_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/dash_frame_list.csv' 
INTO TABLE  dash_frame_list
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `dashboards`;
 CREATE TABLE `dashboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `grafana_id` int DEFAULT NULL,
  `grafana_api` varchar(45) DEFAULT NULL,
  `grafana_uri` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `spec_id` int unsigned DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/dashboards.csv' 
INTO TABLE  dashboards
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `decisions`;
 CREATE TABLE `decisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/decisions.csv' 
INTO TABLE  decisions
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `flist`;
 CREATE TABLE `flist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `isComposite` tinyint(1) DEFAULT '0',
  `panel_id` int DEFAULT NULL,
  `frame_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/flist.csv' 
INTO TABLE  flist
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `frames`;
 CREATE TABLE `frames` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(245) DEFAULT NULL,
  `description` varchar(845) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `level` int DEFAULT '0',
  `workspace` varchar(45) DEFAULT NULL,
  `ws_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/frames.csv' 
INTO TABLE  frames
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `indicators`;
 CREATE TABLE `indicators` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(450) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/indicators.csv' 
INTO TABLE  indicators
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `ladstudiospecs`;
 CREATE TABLE `ladstudiospecs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(95) DEFAULT NULL,
  `description` varchar(450) DEFAULT NULL,
  `learnv` varchar(45) DEFAULT NULL,
  `lms` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `to` varchar(45) DEFAULT NULL,
  `ws_id` int unsigned DEFAULT NULL,
  `mf_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/ladstudiospecs.csv' 
INTO TABLE  ladstudiospecs
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `panels`;
 CREATE TABLE `panels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `indicator_id` int unsigned DEFAULT NULL,
  `visualization_id` int unsigned DEFAULT NULL,
  `request` varchar(500) DEFAULT NULL,
  `sample` varchar(45) DEFAULT NULL,
  `ws_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_indicator_idx` (`indicator_id`),
  KEY `fk_visualization_idx` (`visualization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/panels.csv' 
INTO TABLE  panels
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS `plist` ;
 CREATE TABLE `plist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cpanel_id` int unsigned DEFAULT NULL,
  `panel_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_cpanel_idx` (`cpanel_id`),
  KEY `pk_panel_idx` (`panel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/plist.csv' 
INTO TABLE  plist
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `rows`;
 CREATE TABLE `rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `panel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/rows.csv' 
INTO TABLE  `rows`
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `visualizations`;
 CREATE TABLE `visualizations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(95) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `rating` int DEFAULT '0',
  `class` varchar(95) DEFAULT NULL,
  `chart` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/visualizations.csv' 
INTO TABLE  visualizations
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS  `workspaces`;
 CREATE TABLE `workspaces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOAD DATA INFILE '/data/workspaces.csv' 
INTO TABLE workspaces 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;