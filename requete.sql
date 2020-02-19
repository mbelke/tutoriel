DROP TABLE IF EXISTS interventions;
CREATE TABLE IF NOT EXISTS interventions (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  commune varchar(50) NOT NULL,
  adresse varchar(100) NOT NULL,
  typeI varchar(50) NOT NULL,
  requerant varchar(50) NOT NULL,
  dateDebut date NOT NULL,
  heureDebut time NOT NULL,
  dateFin date NOT NULL,
  heureFin time NOT NULL,
  opm tinyint(1) NOT NULL,
  important tinyint(1) NOT NULL,
  responsable varchar(50) NOT NULL
);

DROP TABLE IF EXISTS vehicules;
CREATE TABLE IF NOT EXISTS `vehicules` (
  V_ID int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  TV_CODE varchar(10) NOT NULL,
  dateDepart date NOT NULL,
  heureDepart time NOT NULL,
  dateArrivee date NOT NULL,
  heureArrivee time NOT NULL,
  dateRetour date NOT NULL,
  heureRetour time NOT NULL
);

DROP TABLE IF EXISTS personne;
CREATE TABLE IF NOT EXISTS `personne` (
  P_CODE int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL
);

DROP TABLE IF EXISTS participer;
CREATE TABLE IF NOT EXISTS participer(
	id int(11) NOT NULL,
	V_ID int(10) NOT NULL,
	PRIMARY KEY (id, V_ID),
	FOREIGN KEY (id) REFERENCES interventions(id),
	FOREIGN KEY (V_ID) REFERENCES vehicules(V_ID)
);

DROP TABLE IF EXISTS voyager;
CREATE TABLE IF NOT EXISTS voyager(
	V_ID int(10) NOT NULL,
	P_CODE int(11) NOT NULL,
	PRIMARY KEY (V_ID, P_CODE),
	FOREIGN KEY (V_ID) REFERENCES vehicules(V_ID),
	FOREIGN KEY (P_CODE) REFERENCES personne(P_CODE)
); 
