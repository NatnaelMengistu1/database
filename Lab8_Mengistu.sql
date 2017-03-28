CREATE TABLE people ( Pid CHAR(8) PRIMARY KEY NOT NULL,
                                        name TEXT NOT NULL,
                                        DOB  DATE NOT NULL,
                                        address TEXT ,
                                        Spousename  TEXT
                                        ) ;
CREATE TABLE Director ( Did CHAR(8) PRIMARY KEY NOT NULL,
                                          Pid CHAR(8) NOT NULL,
                                          Filmschool TEXT,
                                          Danniversary DATE NOT NULL,
                                          Favlensmaker TEXT
                                        ) ;       
CREATE TABLE Actor (Aid CHAR(8) PRIMARY KEY NOT NULL,
                                     Pid CHAR(8) NOT NULL,
                                     Haircolor TEXT,
                                     Eyecolor   TEXT,
                                     Height INTEGER,
                                     weight  INTEGER,
                                     favcolor TEXT,
                                     Aanniversary DATE NOT NULL
                                      ) ;
CREATE TABLE Movie ( Mid CHAR(8) PRIMARY KEY NOT NULL,
			      Name TEXT NOT NULL,
                                       MPAA TEXT NOT NULL,
			      Releaseddate DATE,
                                       Domesticsales DECIMAL,
                                       Foreignsales DECIMAL,
                                       DVDsales DECIMAL
                                       ) ;
CREATE TABLE Actorcast ( Mid CHAR(8) PRIMARY KEY,
                                             Aid  CHAR(8) 
                                              ) ;
CREATE TABLE Directorcast ( Mid CHAR(8) PRIMARY KEY,
                                                 Did CHAR (8)
                                                 ) ;
												 
												 
												