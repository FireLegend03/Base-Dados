use Torneio_EOR;

-- DROP VIEW vistaAtletas;
CREATE VIEW vistaAtletas AS
	SELECT A.nome AS 'Nome', M.designacao AS 'Modalidade',
		   A.sexo AS 'sexo', A.idade AS 'Idade',
           A.ranking AS 'Ranking', P.pais AS 'País'
           FROM Atleta AS A INNER JOIN Modalidade AS M
				ON A.idmodalidade = M.idmodalidade
			INNER JOIN Pais AS P
				ON P.idPais = A.idPais
			ORDER BY M.designacao ASC;
            
Select * from vistaAtletas;

-- Drop view vistaStaff;
CREATE VIEW vistaStaff AS
	SELECT S.nome AS 'Nome', GROUP_CONCAT(C.contacto) AS 'Contacto',
		   S.email AS 'Email', SC.nome AS 'Chefe'
           FROM Staff AS S LEFT JOIN Contacto AS C
				ON S.idStaff = C.idContacto
			LEFT JOIN Staff AS SC
				ON SC.idStaff = S.idChefe
			GROUP BY S.nome, S.email, SC.nome
            ORDER BY S.nome ASC;
            
Select * from vistaStaff;

-- drop view vistaPartida;
CREATE VIEW vistaPartida AS
	SELECT GROUP_CONCAT(DISTINCT A.nome) AS 'Adversário 1', GROUP_CONCAT(DISTINCT AA.nome) AS 'Adversário 2',
		   M.designacao AS 'Modalidade', C.designacao AS 'Campo',
           P.dataInicio AS 'Data' FROM Partida AS P
           INNER JOIN Campo AS C
				ON C.idCampo = P.idCampo
		   INNER JOIN Modalidade AS M
				ON M.idModalidade = P.idModalidade
			INNER JOIN Entrada_Atleta AS EA
				ON EA.idEntrada = P.idEntradaA 
			INNER JOIN Entrada_Atleta AS EB
				ON EB.idEntrada = P.idEntradaB
			INNER JOIN Atleta AS A
				ON A.idAtleta = EA.idAtleta
			INNER JOIN Atleta AS AA
				ON AA.idAtleta = EB.idAtleta
			GROUP BY M.designacao, C.designacao, P.dataInicio;
                
Select * from vistaPartida;
