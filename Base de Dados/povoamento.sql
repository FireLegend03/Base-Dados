USE Torneio_EOR;

-- Inserir Países
INSERT INTO Pais 
    VALUES 
    (1,"Inglaterra"),
    (2,"Portugal"),
    (3,"Taiwan"),
    (4, "China"),
    (5, "America"),
    (6, "Japão"),
    (7, "Mexico"),
    (8, "Espanha"),
    (9, "Suecia"),
    (10, "Russia"),
    (11, "Brasil"),
    (12, "Suiça");

-- Inserir um Torneio
INSERT INTO Torneio values(1,"2024-2025","Wimbledon",1);

-- Inserir Modalidades
INSERT INTO Modalidade
    VALUES
    (1,"Tênis"),
    (2,"Tênis de Mesa"),
    (3, "Badminton"),
    (4, "Padel"),
    (5, "Squash");
   
-- Inserir Moradas
INSERT INTO Morada VALUES
	(1,"Church Road SW19, Wimbledon, London",19,"CQMP+P6","Londres",1),
	(2,"Rua da Póvoa de Lanhoso",200,"4792-000","Braga",2),
	(3,"Town Road W12, Abbey Wood, London",19,"SE2+P020","Londres",1),
	(4,"Chelsea Park E19, Chelsea, London",19,"SW3+P020","Londres",1),
	(5, "Rua dos Castanheirinhos", 34, "4720-181", "Braga", 2),
	(6, "Rua Xinong wang", 132, "392894", "Taitung", 3),
	(7, "St Just Street", 77, "GR5D 3RE", "Manchester", 1),
	(8, "Rua Del Pozole", 2, "42522", "Sevilha", 8),
	(9, "Kings Road", 14, "SW1A 2GT", "Chelsea", 1),
	(10,"Rua de Matosinhos",200,"4810-126","Porto",2),
	(11,"Rua da Vila Verde",10,"4780-702","Braga",2),
	(12,"Rua de Amares",15,"4720-100","Braga",2),
	(13,"Rua de Lomar",62,"4702-310","Braga",2),
	(14,"Rua de Guimaraẽs",13,"4795-320","Braga",2);

-- Inserir Campos 
INSERT INTO Campo VALUES
	(1,"All England Lawn Tennis & Croquet Club",15000,1,1),
	(2,"All England Lawn Tennis de Mese",5000,1,2),
	(3,"All England Lawn Bad Minton",5000,1,3),
	(4,"All England Lawn Tennis de Padel",5000,1,4),
	(5,"All England Lawn Squash",5000,1,5),
	(6,"All England Lawn Tennis & Croquet Club 2",15000,1,1);

-- Inserir os Atletas Ténis Singulares
INSERT INTO Atleta values
	(1,"José Bernardo Barros",47,"M",1,2,43),
	(3,"Nelson Mandanela",22,"M",1,11,60),
	(5,"José Carlos Soares Espírito Santo",53,"M",1,2,2),
	(6,"Karimbo Benzema",53,"M",1,9,39);
	
-- Inserir os Atletas Ténis de Mesa Singulares
INSERT INTO Atleta values
	(9,"Moto Mitsubishi",47,"M",2,6,37),
	(10,"Anton Antonov Antonovi",53,"M",2,10,107),
	(13,"Takanota Nosako",53,"M",2,3,12),
	(14,"Bjorn Ragnrok",53,"M",2,9,17);

-- Inserir os Atletas Badminton
INSERT INTO Atleta values
	(4,"Tony Corrida",38,"M",3,2,50),
	(8,"Morgan Outman",38,"M",3,5,13),
	(2,"Henry Cabedal",53,"M",3,1,99),
	(7,"Rafael Navidad",22,"M",3,8,3),
	(12,"Herton Cenário",38,"M",3,11,53),
	(11,"Fujiro Kamiyamoto",22,"M",3,4,16),
	(16,"Juan José Manuel Ernesto Vilinueva Sanchez Rodriguez Smith",38,"M",3,7,102),
	(15,"Fujiko Oro",22,"M",3,11,7);

-- Inserir Staff (Arbitro (3), Apanha Bolas (4) , Supervisor (1) , Manutenção (2), Organizador (2))
INSERT INTO Staff values
	(1,"Nuno Vilaça","M","Apanha Bolas","nunovilaca@gmail.com",'2004-01-01',NULL,2),
	(2,"Sónia Chen","F","Organizador","soniachen@gmail.com",'2004-02-02',NULL,10),
	(3,"Alicia Castro","F","Apanha Bolas","babraga@gmail.com",'2004-03-03',1,14),
	(4,"Eduardo Ni","M","Arbitro","xingxong@gmail.com",'2004-04-04',NULL,11),
	(5,"Carolina Bras","F","Apanha Bolas","samsung@gmail.com",'2004-05-05',1,12),
	(6,"Pedro Batista","M","Manutenção","batista@gmail.com",'2004-06-06',NULL,5),
	(7,"Zé Malheiro","M","Manutenção","malheiro@gmail.com",'2004-07-07',NULL,6),
	(8,"Zeca Afonso","M","Organizador","zeca@gmail.com",'2004-08-08',2,6),
	(9,"Clara Sá","F","Apanha Bolas","keimodromo@gmail.com",'2004-09-09',1,12),
	(10,"Crocras","F","Arbitro","manel@gmail.com",'2004-10-10',4,13),
	(11,"Gijo Silva","M","Arbitro","puntasso@gmail.com",'2004-11-11',4,13),
	(12,"Rui Drake","M","Supervisor","amuteipca@gmail.com",'2004-12-12',NULL,14),
	(13,"Pedro Audemare Pigueto","M","Supervisor","pedroap@gmail.com",'2005-01-01',NULL,7),
	(14,"Rui Castro","M","Apanha Bolas","castro@gmail.com",'2003-03-03',1,8),
	(15,"Tone Biclas","M","Apanha Bolas","biclas@gmail.com",'2003-01-01',1,9),
	(16,"Maria Mariana","F","Apanha Bolas","marimari@gmail.com",'2003-09-09',1,10),
	(17,"Rosa Roseira","F","Apanha Bolas","rosas@gmail.com",'2003-06-06',1,10),
	(18,"Orlando Lindo","M","Supervisor","lindissimo@gmail.com",'1970-01-01',12,11);

-- Inserir Contactos
INSERT INTO Contacto
    VALUES
    (1,969576808),
    (2, 947274833),
    (3, 958673829),
    (4, 295849560),
    (5, 947586935),
    (6, 956447384),
    (7, 955647328),
    (8, 944424475),
    (9, 955638591),
    (10, 967128114),
    (11, 956693852),
    (12, 984477854),
    (13, 964879531),
    (13, 963539329);

-- ####################### TENIS 4 Players ############################
-- Inserir Partida Singular JBB vs Karimbo
INSERT INTO Entrada values(1,"Singulares M");
INSERT INTO Entrada values(4,"Singulares M");
INSERT INTO Entrada_Atleta values(1,1);
INSERT INTO Entrada_Atleta values(4,6);
# Por partida 4 apanha bolas, 1 arbitro, 1 supervisor, 1 manutenção
INSERT INTO Partida values(1,1,1,4,'2025-01-24 15:30:00','semi-final',1,NULL,1,NULL);
-- Inserir apanha bolas
INSERT INTO Partida_Staff values (1,1),(3,1),(9,1),(5,1);
-- Inserir arbitro
INSERT INTO Partida_Staff values (4,1);
-- Inserir supervisor
INSERT INTO Partida_Staff values (18,1);
-- Inserir manutenção
INSERT INTO Partida_Staff values (6,1);
INSERT INTO `Set` values(1,1,6,0,NULL,NULL);
INSERT INTO Game values
	(1,1,1,'game','30'),(1,1,2,'game','15'),(1,1,3,'game','0'),
	(1,1,4,'game','30'),(1,1,5,'game','15'),(1,1,6,'game','0');

INSERT INTO `Set` values(1,2,6,2,NULL,NULL);
INSERT INTO Game values
	(1,2,1,'game','30'),(1,2,2,'30','game'),(1,2,3,'15','game'),
	(1,2,4,'game','30'),(1,2,5,'game','15'),(1,2,6,'game','15'),
	(1,2,7,'game','15'),(1,2,8,'game','30');

INSERT INTO `Set` values(1,3,6,1,NULL,NULL);
INSERT INTO Game values
	(1,3,1,'game','30'),(1,3,2,'30','game'),(1,3,3,'15','game'),
	(1,3,4,'game','30'),(1,3,5,'game','15'),(1,3,6,'30','game'),
	(1,3,7,'game','15');

-- Ganhou JBB 3-0
UPDATE Torneio_EOR.Partida
	SET idVencedor=1,duracao=120
	WHERE idPartida=1;

-- Inserir Partida Singular AUC vs Nelson Mandanela
INSERT INTO Entrada values(3,"Singulares M");
INSERT INTO Entrada values(2,"Singulares M");
INSERT INTO Entrada_Atleta values(3,3);
INSERT INTO Entrada_Atleta values(2,5);
INSERT INTO Partida values(2,1,3,2,'2025-01-24 15:30:00','semi-final',6,NULL,1,NULL);
-- Inserir apanha bolas
INSERT INTO Partida_Staff values (14,2),(15,2),(16,2),(17,2);
-- Inserir arbitro
INSERT INTO Partida_Staff values (10,2);
-- Inserir supervisor
INSERT INTO Partida_Staff values (12,2);
-- Inserir manutenção
INSERT INTO Partida_Staff values (7,2);
INSERT INTO `Set` values (2, 1, 2, 6, NULL, NULL);
INSERT INTO Game VALUES
	(2,1,1,'game','0'),(2,1,2,'30','game'),(2,1,3,'game','0'),
	(2,1,4,'40','game'),(2,1,5,'15','game'),(2,1,6,'15','game'),
	(2,1,7,'15','game'),(2,1,8,'15','game');

INSERT INTO `Set` values (2, 2, 6, 0,NULL,NULL);
INSERT INTO Game VALUES
	(2,2,1,'0','game'),(2,2,2,'30','game'),(2,2,3,'15','game'),
	(2,2,4,'40','game'),(2,2,5,'30','game'),(2,2,6,'0','game');

INSERT INTO `Set` Values (2, 3, 1, 6,NULL,NULL);
INSERT INTO Game VALUES
	(2,3,1,'40','game'),(2,3,2,'15','game'),(2,3,3,'15','game'),
	(2,3,4,'30','game'),(2,3,5,'30','game'),(2,3,6,'game','0'),
	(2,3,7,'0','game');

INSERT INTO `Set` Values (2, 4, 0, 6,NULL,NULL);
INSERT INTO Game VALUES
	(2,4,1,'40','game'),(2,4,2,'30','game'),(2,4,3,'15','game'),
	(2,4,4,'40','game'),(2,4,5,'40','game'),(2,4,6,'0','game');

-- Ganhou AUC 3-1
UPDATE Torneio_EOR.Partida
	SET idVencedor=2,duracao=150
	WHERE idPartida=2;

-- Inserir Partida Singulares M JBB vs. AUC
INSERT INTO Partida values(3,1,1,2,'2025-01-25 15:30:00','final',1,NULL,1,NULL);
-- Inserir apanha bolas
INSERT INTO Partida_Staff values (17,3),(5,3),(14,3),(1,3);
-- Inserir arbitro
INSERT INTO Partida_Staff values (11,3);
-- Inserir supervisor
INSERT INTO Partida_Staff values (13,3);
-- Inserir manutenção
INSERT INTO Partida_Staff values (7,3);
INSERT INTO `Set` VALUES (3, 1, 6, 6, 7, 2);
INSERT INTO Game VALUES
    (3,1,1,'15','game'), (3,1,2,'30','game'), (3,1,3,'40','game'),
    (3,1,4,'30','game'), (3,1,5,'0','game'), (3,1,6,'game','40'),
    (3,1,7,'game','40'), (3,1,8,'game','15'), (3,1,9,'game','0'),
    (3,1,10,'game','30'), (3,1,11,'40','game'), (3,1,12,'game','15');

INSERT INTO `Set` VALUES (3, 2, 6, 0, NULL, NULL);
INSERT INTO Game VALUES
    (3,2,1,'game','0'), (3,2,2,'game','0'), (3,2,3,'game','15'),
    (3,2,4,'game','0'), (3,2,5,'game','30'), (3,2,6,'game','15');

INSERT INTO `Set` VALUES (3, 3, 6, 1, NULL, NULL);
INSERT INTO Game VALUES
    (3,3,1,'game','15'), (3,3,2,'game','30'), (3,3,3,'game','15'),
    (3,3,4,'game','40'), (3,3,5,'game','30'), (3,3,6,'40','game'), 
    (3,3,7,'game','15');

-- Ganhou JBB 3-0
UPDATE Torneio_EOR.Partida
	SET idVencedor=1,duracao=115
	WHERE idPartida=3;

# Vencedor Modalidade Tenis
select a.nome ,p.idVencedor from Partida p
inner join Entrada e on p.idVencedor = e.idEntrada 
inner join Entrada_Atleta ea on e.idEntrada =ea.idEntrada 
inner join Atleta a on ea.idAtleta = a.idAtleta 
where p.ronda = 'final' and p.idModalidade =1 and e.tipo = "Singulares M" and p.idTorneio = 1;


-- ##########################################################
-- ################## TENIS de MESA 4 Players #########################
-- Inserir Partida Singular Takanota Nosako vs Anton Antonov Antonovi
INSERT INTO Entrada values (5,"Singulares M"),(6,"Singulares M");
INSERT INTO Entrada_Atleta values(5,13),(6,10);
INSERT INTO Partida values
	(4,2,5,6,'2025-01-25 09:30:00','semi-final',2,NULL,1,NULL);
-- Inserir apanha bolas
INSERT INTO Partida_Staff values (3,4),(5,4);
-- Inserir arbitro
INSERT INTO Partida_Staff values (11,4);
-- Inserir supervisor
INSERT INTO Partida_Staff values (4,4);
-- Inserir manutenção
INSERT INTO Partida_Staff values (6,4);
INSERT INTO `Set` VALUES (4,1,3,1,NULL,NULL);
INSERT INTO Game Values 
	(4,1,1,'11','7'),
	(4,1,2,'11','13'),
	(4,1,3,'11','9'),
	(4,1,4,'11','5');

-- Ganhou Takanota 3-1
UPDATE Torneio_EOR.Partida
	SET idVencedor=5,duracao=60
	WHERE idPartida=4;

-- Inserir Partida Singular Bjorn Ragnrok vs Moto Mitsubishi
INSERT INTO Entrada values (7,"Singulares M"),(8,"Singulares M");
INSERT INTO Entrada_Atleta values (7,14),(8,9);
INSERT INTO Partida values
	(5,2,7,8,'2025-01-25 11:00:00','semi-final',2,NULL,1,NULL);
INSERT INTO Partida_Staff values (1,5),(17,5);
INSERT INTO Partida_Staff values (10,5);
INSERT INTO Partida_Staff values (18,5);
INSERT INTO Partida_Staff values (6,5);
INSERT INTO `Set` VALUES (5, 1, 2, 3,NULL,NULL);
INSERT INTO Game VALUES
    (5, 1, 1, 11, 8),
    (5, 1, 2, 12, 10),
    (5, 1, 3, 12, 14),
    (5, 1, 4, 5, 11),
    (5, 1, 5, 7, 11);

-- Ganhou Moto Mitsubishi 3-2
UPDATE Torneio_EOR.Partida
	SET idVencedor=8,duracao=60
	WHERE idPartida=5;

INSERT INTO Partida values
	(6,2,5,8,'2025-01-26 16:30:00','final',2,NULL,1,NULL);
INSERT INTO Partida_Staff values (3,6),(5,6);
INSERT INTO Partida_Staff values (11,6);
INSERT INTO Partida_Staff values (12,6);
INSERT INTO Partida_Staff values (7,6);

INSERT INTO `Set` VALUES (6,1,3,1,NULL,NULL);
INSERT INTO Game Values 
	(6,1,1,'11','3'),
	(6,1,2,'13','15'),
	(6,1,3,'11','9'),
	(6,1,4,'11','9');

-- Ganhou Takanota 3-1
UPDATE Torneio_EOR.Partida
	SET idVencedor=5,duracao=70
	WHERE idPartida=6;

-- #########################################################
-- ################## Badminton 4 equipas ##################
-- Inserir Partida Dupla Tony Corrida & Rafael Navidad vs Herton Cenário & Henry Cabedal
INSERT INTO Entrada values (9,"Duplas M"),(10,"Duplas M");
INSERT INTO Entrada_Atleta values (9,4),(9,7);
INSERT INTO Entrada_Atleta values(10,12),(10,2);
INSERT INTO Partida values
	(7,3,9,10,'2025-01-27 09:30:00','semi-final',3,NULL,1,NULL);
INSERT INTO Partida_Staff values (15,7),(16,7);
INSERT INTO Partida_Staff values (4,7);
INSERT INTO Partida_Staff values (13,7);
INSERT INTO Partida_Staff values (6,7);
INSERT INTO `Set` VALUES (7, 1, 3, 0,NULL,NULL);
INSERT INTO Game VALUES
    (7, 1, 1, 21, 8),
    (7, 1, 2, 21, 18),
    (7, 1, 3, 25, 23);

-- Ganhou Tony Corrida & Rafael Navidad 3-0
UPDATE Torneio_EOR.Partida
	SET idVencedor=9,duracao=150
	WHERE idPartida=7;
-- Inserir Partida Dupla Morgan Outman & Juan Jośe vs Fujiro Kamiyamoto & Fujiko Oro
INSERT INTO Entrada values (11,"Duplas M"),(12,"Duplas M");
INSERT INTO Entrada_Atleta values (11,8),(11,16);
INSERT INTO Entrada_Atleta values (12,11),(12,15);
INSERT INTO Partida values
	(8,3,11,12,'2025-01-27 17:30:00','semi-final',3,NULL,1,NULL);
INSERT INTO Partida_Staff values (1,8),(17,8);
INSERT INTO Partida_Staff values (10,8);
INSERT INTO Partida_Staff values (12,8);
INSERT INTO Partida_Staff values (7,8);
INSERT INTO `Set` VALUES (8, 1, 2, 3,NULL,NULL);
INSERT INTO Game VALUES 
    (8, 1, 1, 21, 18),
    (8, 1, 2, 20, 22),
    (8, 1, 3, 21, 14),
    (8, 1, 4, 8, 21),
    (8, 1, 5, 24, 26);

-- Ganhou Fujiro Kamiyamoto & Fujiko Oro 3-2
UPDATE Torneio_EOR.Partida
	SET idVencedor=12,duracao=130
	WHERE idPartida=8;

-- Inserir Partida Tony Corrida & Rafael Navidad vs Fujiro Kamiyamoto & Fujiko Oro
INSERT INTO Partida values
	(9,3,9,12,'2025-01-28 15:30:00','final',3,NULL,1,NULL);
INSERT INTO Partida_Staff values (3,9),(14,9);
INSERT INTO Partida_Staff values (10,9);
INSERT INTO Partida_Staff values (18,9);
INSERT INTO Partida_Staff values (6,9);
INSERT INTO `Set` VALUES (9, 1, 2, 3,NULL,NULL);
INSERT INTO Game VALUES
    (9, 1, 1, 21, 12),
    (9, 1, 2, 20, 22),
    (9, 1, 3, 21, 17),
    (9, 1, 4, 19, 21),
    (9, 1, 5, 18, 21);
   
-- Ganhou Fujiro Kamiyamoto & Fujiko Oro 3-2
UPDATE Torneio_EOR.Partida
	SET idVencedor=12,duracao=110
	WHERE idPartida=9;
    
-- #########################################################
-- ################## Badminton 4 jogadores ################
-- Inserir Partida Tony Corrida vs Fujiro Kamiamoto
insert into Entrada values
	(13, 'Singulares M'),
    (14, 'Singulares M');
insert into Entrada_Atleta values
	(13, 4),
    (14, 11);
insert into Partida values
	(10,3,13,14,'2025-01-29 10:00:00','semi-final',3,NULL,1,NULL);
    
INSERT INTO Partida_Staff values (1,10),(17,10);
INSERT INTO Partida_Staff values (10,10);
INSERT INTO Partida_Staff values (12,10);
INSERT INTO Partida_Staff values (7,10);

INSERT INTO `Set` VALUES (10, 1, 3, 1,NULL,NULL);
INSERT INTO Game VALUES
    (10, 1, 1, 21, 12),
    (10, 1, 2, 17, 22),
    (10, 1, 3, 21, 14),
    (10, 1, 4, 21, 4);

-- Ganhou Tony Corrida 3-1
UPDATE Torneio_EOR.Partida
	SET idVencedor=13,duracao=80
	WHERE idPartida=10;
    
-- Inserir partida Fujiko oro vs Herton Cenario
insert into Entrada values
	(15, 'Singulares M'),
    (16, 'Singulares M');
insert into Entrada_Atleta values
	(15, 15),
    (16, 12);
insert into Partida values
	(11,3,15,16,'2025-01-29 16:15:00','semi-final',3,NULL,1,NULL);
INSERT INTO Partida_Staff values (15,11),(16,11);
INSERT INTO Partida_Staff values (4,11);
INSERT INTO Partida_Staff values (13,11);
INSERT INTO Partida_Staff values (6,11);

INSERT INTO `Set` VALUES (11, 1, 3, 0,NULL,NULL);
INSERT INTO Game VALUES
    (11, 1, 1, 21, 5),
    (11, 1, 2, 21, 2),
    (11, 1, 3, 21, 4);
   
-- Ganhou Fujiko Oro 3-0
UPDATE Torneio_EOR.Partida
	SET idVencedor=15,duracao=60
	WHERE idPartida=11;
    
-- Inserir Partida Tony Corrida vs Fujiko Oro
INSERT INTO Partida values
	(12,3,13,15,'2025-01-30 10:15:00','final',3,NULL,1,NULL);
-- Inserir apanha bolas
INSERT INTO Partida_Staff values (3,12),(5,12);
-- Inserir arbitro
INSERT INTO Partida_Staff values (11,12);
-- Inserir supervisor
INSERT INTO Partida_Staff values (4,12);
-- Inserir manutenção
INSERT INTO Partida_Staff values (6,12);
INSERT INTO `Set` VALUES (12, 1, 3, 2,NULL,NULL);
INSERT INTO Game VALUES
    (12, 1, 1, 21, 16),
    (12, 1, 2, 23, 21),
    (12, 1, 3, 14, 21),
    (12, 1, 4, 12, 21),
    (12, 1, 5, 26, 24);
   
-- Ganhou Tony Corrida 3-2
UPDATE Torneio_EOR.Partida
	SET idVencedor=13,duracao=145
	WHERE idPartida=12;
    
    
    
    
    