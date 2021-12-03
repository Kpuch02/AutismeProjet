Use ProjetAutisme
GO
CREATE TABLE Client(
   Id_Client INT IDENTITY,
   Cli_Nom VARCHAR(50)  NOT NULL,
   Cli_prenom VARCHAR(50)  NOT NULL,
   Cli_Ville VARCHAR(50)  NOT NULL,
   Cli_Email VARCHAR(150)  NOT NULL,
   Cli_adressefacrturation VARCHAR(250)  NOT NULL,
   Cli_adresselivraison VARCHAR(150)  NOT NULL,
   Cli_Telephone INT NOT NULL,
   PRIMARY KEY(Id_Client)
);

CREATE TABLE Utilisateur(
   Id_Utilisateur INT IDENTITY,
   Util_nom VARCHAR(50)  NOT NULL,
   Util_MDP VARCHAR(50)  NOT NULL,
   Util_age INT NOT NULL,
   Util_nationalité VARCHAR(30) ,
   Util_Email VARCHAR(50)  NOT NULL,
   Util_avatar XML,
   Util_role VARCHAR(50)  NOT NULL,
   Util_statut VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Utilisateur)
);

CREATE TABLE Post(
   Id_Post INT IDENTITY,
   Post_Texte VARCHAR(550)  NOT NULL,
   Post_date DATETIME2 NOT NULL,
   Post_titre VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Post)
);

CREATE TABLE Aritcles_boutiques(
   Id_Aritcles_boutiques INT IDENTITY,
   Art_titre VARCHAR(50)  NOT NULL,
   Art_Auteur VARCHAR(50)  NOT NULL,
   Art_Editeur VARCHAR(50)  NOT NULL,
   Art_description VARCHAR(50) ,
   Art_prix MONEY NOT NULL,
   Art_Nomproduit VARCHAR(50)  NOT NULL,
   Art_type VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Aritcles_boutiques)
);

CREATE TABLE Media(
   Id_Media INT IDENTITY,
   Med_Type VARCHAR(30)  NOT NULL,
   Med_nom VARCHAR(50)  NOT NULL,
   Med_chemin VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Media)
);

CREATE TABLE Commande(
   Id_Commande INT IDENTITY,
   Com_Numero INT NOT NULL,
   Com_Total MONEY NOT NULL,
   Com_modePaiement VARCHAR(50)  NOT NULL,
   Com_adresse_livraison VARCHAR(150)  NOT NULL,
   Com_Adressefacturation VARCHAR(150)  NOT NULL,
   Com_Transporteur VARCHAR(30)  NOT NULL,
   Com_Date DATETIME2 NOT NULL,
   Id_Client INT NOT NULL,
   PRIMARY KEY(Id_Commande),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client)
);

CREATE TABLE Poster(
   Id_Utilisateur INT,
   Id_Post INT,
   PRIMARY KEY(Id_Utilisateur, Id_Post),
   FOREIGN KEY(Id_Utilisateur) REFERENCES Utilisateur(Id_Utilisateur),
   FOREIGN KEY(Id_Post) REFERENCES Post(Id_Post)
);

CREATE TABLE Modérer(
   Id_Utilisateur INT,
   Id_Utilisateur_1 INT,
   Mod_raisonbanissement VARCHAR(50)  NOT NULL,
   Mod_Date DATETIME2 NOT NULL,
   PRIMARY KEY(Id_Utilisateur, Id_Utilisateur_1),
   FOREIGN KEY(Id_Utilisateur) REFERENCES Utilisateur(Id_Utilisateur),
   FOREIGN KEY(Id_Utilisateur_1) REFERENCES Utilisateur(Id_Utilisateur)
);

CREATE TABLE Illustrer(
   Id_Post INT,
   Id_Media INT,
   PRIMARY KEY(Id_Post, Id_Media),
   FOREIGN KEY(Id_Post) REFERENCES Post(Id_Post),
   FOREIGN KEY(Id_Media) REFERENCES Media(Id_Media)
);

CREATE TABLE Visualiser(
   Id_Aritcles_boutiques INT,
   Id_Media INT,
   PRIMARY KEY(Id_Aritcles_boutiques, Id_Media),
   FOREIGN KEY(Id_Aritcles_boutiques) REFERENCES Aritcles_boutiques(Id_Aritcles_boutiques),
   FOREIGN KEY(Id_Media) REFERENCES Media(Id_Media)
);

CREATE TABLE Contenir(
   Id_Aritcles_boutiques INT,
   Id_Commande INT,
   Con_quantite INT NOT NULL,
   PRIMARY KEY(Id_Aritcles_boutiques, Id_Commande),
   FOREIGN KEY(Id_Aritcles_boutiques) REFERENCES Aritcles_boutiques(Id_Aritcles_boutiques),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);

GO
