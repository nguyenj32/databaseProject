DROP TABLE IF EXISTS AWARD_t;
DROP TABLE IF EXISTS QUOTE_t;
DROP TABLE IF EXISTS ACTOR_t;
DROP TABLE IF EXISTS CHARACTER_t;
DROP TABLE IF EXISTS DIRECTS_t;
DROP TABLE IF EXISTS DIRECTOR_t;
DROP TABLE IF EXISTS MONEY_t;
DROP TABLE IF EXISTS STUDIO_t;
DROP TABLE IF EXISTS USES;
DROP TABLE IF EXISTS MOVIE_t;

CREATE TABLE MOVIE_t(
	MovieID 		VARCHAR(5) NOT NULL,
	Title 			VARCHAR(50),
	Year 			INT(4),
	Genre 			VARCHAR(50),
	Rating			VARCHAR(6),
	Runtime			INT(3),
			
 	CONSTRAINT MoviePK PRIMARY KEY(MovieID));

CREATE TABLE CHARACTER_t(
	CharacterID 	VARCHAR(5) NOT NULL,
	Name 			VARCHAR(30),
			
 	CONSTRAINT CharacterPK PRIMARY KEY (CharacterID),
 	CONSTRAINT CharacterFK FOREIGN KEY (MovieID) REFERENCES MOVIE_t(MovieID));

CREATE TABLE PLAYED_t(
	MovieID		VARCHAR(5),
	CharacterID VARCHAR(5),

	CONSTRAINT PlayedPK1 PRIMARY KEY (MovieID, CharacterID),
 	CONSTRAINT PlayedFK1 FOREIGN KEY (MovieID) REFERENCES MOVIE_t(MovieID),
 	CONSTRAINT PlayedFK2 FOREIGN KEY (CharacterID) REFERENCES CHARACTER_t(CharacterID));

CREATE TABLE ACTOR_t(
	ActorID 		VARCHAR(5) NOT NULL,
	Name 			VARCHAR(30),
	DOB 			VARCHAR(11),
	CharacterID		VARCHAR(5),
			
 	CONSTRAINT ActorPK PRIMARY KEY (ActorID),
 	CONSTRAINT ActorFK FOREIGN KEY (CharacterID) REFERENCES CHARACTER_t(CharacterID));

CREATE TABLE ACTED_t(
	CharacterID		VARCHAR(5),
	ActorID 		VARCHAR(5),

	CONSTRAINT ActedPK1 PRIMARY KEY (CharacterID, ActorID),
 	CONSTRAINT ActedFK1 FOREIGN KEY (CharacterID) REFERENCES CHARACTER_t(CharacterID),
 	CONSTRAINT ActedFK2 FOREIGN KEY (ActorID) REFERENCES ACTOR_t(ActorID));

CREATE TABLE DIRECTOR_t(
	DirectorID 		VARCHAR(5) NOT NULL,
	Name 			VARCHAR(20),
	DOB 			VARCHAR(11),
			
 	CONSTRAINT DirectorPK PRIMARY KEY (DirectorID));

CREATE TABLE DIRECTS_t(
	MovieID		VARCHAR(5),
	DirectorID 	VARCHAR(5),

	CONSTRAINT DirectsPK1 PRIMARY KEY (DirectorID, MovieID),
 	CONSTRAINT DirectsFK1 FOREIGN KEY (DirectorID) REFERENCES director_t(DirectorID),
 	CONSTRAINT DirectsFK2 FOREIGN KEY (MovieID) REFERENCES MOVIE_t(MovieID));

CREATE TABLE MONEY_t(
	MoneyID 		VARCHAR(5) NOT NULL,
	Budget 			INT(9),
	Income 			INT(10),
	MovieID 		VARCHAR(5),
			
 	CONSTRAINT MoneyPK PRIMARY KEY (MoneyID),
 	CONSTRAINT MoneyFK FOREIGN KEY (MovieID) REFERENCES MOVIE_t(MovieID));

CREATE TABLE STUDIO_t(
	StudioID 		VARCHAR(5) NOT NULL,
	Name			VARCHAR(20),
	Created 		INT(4),

 	CONSTRAINT StudioPK PRIMARY KEY (StudioID));

CREATE TABLE USES_t(
	MovieID 		VARCHAR(5),
	StudioID 		VARCHAR(5),

 	CONSTRAINT UsesFK1 FOREIGN KEY (StudioID) REFERENCES STUDIO_t(StudioID),
 	CONSTRAINT UsesFK2 FOREIGN KEY (MovieID) REFERENCES MOVIE_t(MovieID));

CREATE TABLE QUOTE_t(
	QuoteID 		VARCHAR(5) NOT NULL,
	Quote 			VARCHAR(40),
	CharacterID		VARCHAR(5),
	ActorID			VARCHAR(5),

 	CONSTRAINT QuotePK PRIMARY KEY (QuoteID),
 	CONSTRAINT QuoteFK1 FOREIGN KEY (CharacterID) REFERENCES CHARACTER_t(CharacterID),
 	CONSTRAINT QuoteFK2 FOREIGN KEY (ActorID) REFERENCES ACTOR_t(ActorID));

CREATE TABLE AWARD_t(
	AwardID 		VARCHAR(5) NOT NULL,
	Prize 			VARCHAR(60),
	MovieID 		VARCHAR(5),
	ActorID			VARCHAR(5),

 	CONSTRAINT AwardPK PRIMARY KEY (AwardID),
 	CONSTRAINT AwardFK1 FOREIGN KEY (MovieID) REFERENCES MOVIE_t(MovieID),
 	CONSTRAINT AwardFK2 FOREIGN KEY (ActorID) REFERENCES ACTOR_t(ActorID));