USE Torneio_EOR;

-- RM15 Ver staff que particippou em certa partida
-- Drop procedure if exists staffNaPartida;
DELIMITER $$
CREATE PROCEDURE staffNaPartida(
	IN idPartida INT,
    in idTorneio int
)
BEGIN
if (Not exists(select * from Torneio as T where T.idTorneio = idTorneio)
	or not exists(select * from Partida as P where P.idPartida = idPartida))
then select 'Partida ou Torneio não existem' AS 'Erro';
else
	SELECT S.idStaff AS 'ID', S.nome AS 'Nome', S.areaTrabalho AS 'Função'
    FROM Staff AS S INNER JOIN Partida_Staff AS PS
		ON S.idStaff = PS.idStaff
    INNER JOIN Partida AS P
		ON P.idPartida = PS.idPartida
	WHERE P.idPartida = idPartida and P.idTorneio = idTorneio
    order by S.areaTrabalho, S.nome ASC;
end if;
END$$
CALL staffNaPartida(1,1);
 
 -- RM14 Saber numero de vitorias de jogador especifico
 -- drop procedure if exists numWins
 DELIMITER $$
 create procedure numWins(
	IN id int
)

begin
if (not exists(select * from Atleta AS A where A.idAtleta = id))
then select 'Atleta não existe' AS 'Erro';
else
	select A.nome AS 'nome', COUNT(P.idVencedor) AS 'Número de vitórias' 
    from Partida AS P inner join Entrada_Atleta AS EA
		on EA.idEntrada = P.idVencedor
	inner join Atleta as A
		on A.idAtleta = EA.idAtleta
	where A.idAtleta = id
    group by A.nome;
end if;
END$$

call numWins(4);

-- RM13 Listar atletas de certa modalidade
-- drop procedure if exists atletasDeModalidade
DELIMITER $$
create procedure atletasDeModalidade(
	in id int
)
begin
if (not exists(select * from Modalidade as M where M.idModalidade = id))
then select 'Modalidade não existe' AS 'Erro';
else
	SELECT A.nome AS 'Nome', M.designacao AS 'Modalidade',
		   A.sexo AS 'sexo', A.idade AS 'Idade',
           A.ranking AS 'Ranking', P.pais AS 'País'
           FROM Atleta AS A INNER JOIN Modalidade AS M
				ON A.idmodalidade = M.idmodalidade
			INNER JOIN Pais AS P
				ON P.idPais = A.idPais
			WHERE M.idModalidade = id
            order by A.ranking ASC;
end if;
END$$

call atletasDeModalidade(1);

-- RM11 Ver duração da partida mais longa de um torneio
-- drop procedure maiorPartida
DELIMITER $$
create procedure maiorPartida(
	in id int
)
begin
if (not exists(select * from Torneio As T where T.idTorneio = id))
then Select 'Torneio não existe' AS 'Erro';
else
    Select P.duracao AS 'Duração da partida mais longa' from Partida AS P
    where P.idTorneio = id
	Order by P.duracao DESC
	Limit 1;
end if;
END$$

call maiorPartida(1);

-- partida mais longa de dada modalidade
-- drop procedure maiorPartidaMod
DELIMITER $$
create procedure maiorPartidaMod(
	in idTorneio int,
    in idModalidade int
)
begin
if (Not exists(select * from Torneio as T where T.idTorneio = idTorneio)
	or not exists(select * from Modalidade as M where M.idModalidade = idModalidade))
then select 'Modalidade ou Torneio não existem' AS 'Erro';
else
    Select P.duracao AS 'Duração da partida mais longa' from Partida AS P
    where P.idTorneio = idTorneio And P.idModalidade = idModalidade
	Order by P.duracao DESC
	Limit 1;
end if;
END$$

call maiorPartidaMod(1,1);

-- RM10 ver duração de uma dada partida
-- drop procedure tempoPartida;
DELIMITER $$
create procedure tempoPartida(
	in id int
)
begin
IF (NOT EXISTS (SELECT * FROM Partida WHERE Partida.idPartida = id)) THEN 
SELECT 'A partida não existe.';
ELSE
	select P.dataInicio AS 'Data de Inicio', P.duracao AS 'Duração'
    from Partida AS P
    where P.idPartida = id;
END IF;
END$$

call tempoPartida(1);

-- Vencedor de cada modalidade num torneio
-- drop procedure vencedores;
DELIMITER $$
create procedure vencedores(
    in idTorneio int
)
BEGIN
IF (NOT EXISTS (SELECT * FROM Torneio WHERE Torneio.idTorneio = idTorneio)) THEN 
    SELECT 'O torneio não existe.';
ELSE
    SELECT 
        GROUP_CONCAT(A.nome SEPARATOR ' & ') AS 'Vencedor', 
        M.designacao AS 'Modalidade',
        E.tipo AS 'Tipo de Partida',
        GROUP_CONCAT(DISTINCT Pais.pais SEPARATOR ' & ') AS 'País'
    FROM Partida AS P 
    INNER JOIN Modalidade AS M ON P.idModalidade = M.idModalidade
    INNER JOIN Entrada AS E ON E.idEntrada = P.idVencedor
    INNER JOIN Entrada_Atleta AS EA ON E.idEntrada = EA.idEntrada
    INNER JOIN Atleta AS A ON EA.idAtleta = A.idAtleta
    INNER JOIN Pais ON Pais.idPais = A.idPais
    WHERE P.idTorneio = idTorneio and P.ronda = 'final'
    GROUP BY P.idPartida, M.designacao, E.tipo, P.ronda
    ORDER BY P.ronda DESC, M.designacao;
END IF;
END$$

call vencedores(1);

-- Informacao relativa aos sets da partida
DELIMITER $$
CREATE PROCEDURE `sets`(
    IN idPartida INT
)
BEGIN
    IF (NOT EXISTS (SELECT * FROM Partida WHERE Partida.idPartida = idPartida)) THEN 
        SELECT 'A partida não existe.';
    ELSE
        SELECT S.nrSet,
               GROUP_CONCAT(DISTINCT A.nome) AS 'Adversário 1',
               CONCAT(S.gamesEntradaA,"-",S.gamesEntradaB) AS "Score",
               GROUP_CONCAT(DISTINCT AA.nome) AS 'Adversário 2' 
        FROM Partida AS P
        INNER JOIN Entrada_Atleta AS EA ON EA.idEntrada = P.idEntradaA 
        INNER JOIN Entrada_Atleta AS EB ON EB.idEntrada = P.idEntradaB
        INNER JOIN Atleta AS A ON A.idAtleta = EA.idAtleta
        INNER JOIN Atleta AS AA ON AA.idAtleta = EB.idAtleta
        INNER JOIN `Set` AS S ON S.idPartida = P.idPartida 
        WHERE P.idPartida = idPartida
        GROUP BY S.nrSet, S.gamesEntradaA, S.gamesEntradaB;
    END IF;
END$$

call `sets`(1);

-- Informacao relativa aos games dos sets
DELIMITER $$
CREATE PROCEDURE games(
	in idPartida int, nrSet int
)
BEGIN
IF (NOT EXISTS (SELECT * FROM Partida WHERE Partida.idPartida = idPartida)) THEN 
    SELECT 'A partida não existe.';
ELSE
	IF (NOT EXISTS (SELECT * FROM Game WHERE Game.idPartida = idPartida and Game.nrSet= nrSet)) THEN 
    SELECT 'O set não existe.';
    ELSE
		SELECT G.nrGame,GROUP_CONCAT(DISTINCT A.nome) AS 'Adversário 1' ,G.pontosEntradaA AS "Score" , GROUP_CONCAT(DISTINCT AA.nome) AS 'Adversário 2' , G.pontosEntradaB AS "Score" FROM Game G
		INNER JOIN Partida P ON G.idPartida = P.idPartida
		INNER JOIN Entrada_Atleta AS EA ON EA.idEntrada = P.idEntradaA 
		INNER JOIN Entrada_Atleta AS EB ON EB.idEntrada = P.idEntradaB
		INNER JOIN Atleta AS A ON A.idAtleta = EA.idAtleta
		INNER JOIN Atleta AS AA ON AA.idAtleta = EB.idAtleta
		WHERE G.idPartida = idPartida AND G.nrSet = nrSet
		GROUP BY G.nrGame ,G.pontosEntradaA , G.pontosEntradaB;
	END IF;
END IF;
END$$
call games(1,1);

-- numero de representantes por pais
Select P.pais AS 'País', COUNT(A.idAtleta) AS 'Número de Representantes'
from Atleta as A inner join Pais AS P
	on A.idPais = P.idPais
group by P.pais
order by COUNT(A.idAtleta) DESC;
    
-- nº de atletas de cada genero
Select A.sexo AS 'Genero', COUNT(A.idAtleta) AS 'Número de Atletas'
from Atleta AS A
group by A.sexo;

-- nº de Atletas em cada modalidade
Select M.designacao AS 'Modalidade', COUNT(A.idAtleta) AS 'Nº de Atletas'
from Atleta AS A inner join Modalidade AS M
	on A.idModalidade = M.idModalidade
    group by M.designacao
    order by COUNT(A.idAtleta) DESC;
    
DELIMITER $$  
create procedure atualizaPartida(
	in idPartida int, duracao int ,vencedor int
)
begin
	IF (NOT EXISTS (SELECT * FROM Partida WHERE Partida.idPartida = idPartida)) THEN 
    	SELECT 'A partida não existe.';
	ELSE
		IF vencedor = 1 THEN
			UPDATE Partida P SET P.duracao = duracao, P.idVencedor = P.idEntradaA where P.idPartida = idPartida;
		ELSE
			UPDATE Partida P SET P.duracao = duracao, P.idVencedor = P.idEntradaB where P.idPartida = idPartida;
		END IF;
	END IF;
END$$

DELIMITER $$  
create procedure atualizaSet(
	in idPartida int, nrSet int ,games1 int, tiebreakers1 int, games2 int, tiebreakers2 int
)
begin
	IF (NOT EXISTS (SELECT * FROM Partida WHERE Partida.idPartida = idPartida)) THEN 
    	SELECT 'A partida não existe.' AS Erro;
	ELSE
		IF (EXISTS (SELECT * FROM Partida P WHERE P.idPartida = idPartida AND P.idVencedor IS NOT NULL))THEN
			SELECT 'A partida já terminou!' AS Erro;
		ELSE
			IF (NOT EXISTS (SELECT * FROM `Set` S WHERE S.idPartida = idPartida and S.nrSet = nrSet)) THEN 
				INSERT INTO `Set` VALUES(idPartida,nrSet,games1,games2,tiebreakers1,tiebreakers2);
			ELSE
				UPDATE `Set` as S SET S.gamesEntradaA = games1, S.gamesEntradaB = games2, S.tiebreakersEntradaA = tiebreakers1, 
                S.tiebreakersEntradaB = tiebreakers2 where S.idPartida = idPartida and S.nrSet = nrSet;
			END IF;
		END IF;
	END IF;
END$$

DELIMITER $$  
create procedure atualizaGame(
	in idPartida int, nrSet int ,nrGame int, pontos1 VARCHAR(10), pontos2 VARCHAR(10)
)
begin
	IF (NOT EXISTS (SELECT * FROM Partida WHERE Partida.idPartida = idPartida)) THEN 
    	SELECT 'A partida não existe.' AS Erro;
	ELSE
		IF (EXISTS (SELECT * FROM Partida P WHERE P.idPartida = idPartida AND P.idVencedor IS NOT NULL)) THEN
			SELECT 'A partida já terminou!' AS Erro;
		ELSE
			IF (NOT EXISTS (SELECT * FROM `Set` S WHERE S.idPartida = idPartida and S.nrSet = nrSet)) THEN
				SELECT 'O Set não existe.' AS Erro;
			ELSE
				IF (NOT EXISTS (SELECT * FROM Game G WHERE G.idPartida = idPartida and G.nrSet = nrSet and G.nrGame = nrGame)) THEN 
					INSERT INTO Game VALUES(idPartida,nrSet,nrGame,pontos1,pontos2);
				ELSE
					UPDATE Game as G SET G.pontosEntradaA = pontos1, G.pontosEntradaB = pontos2 where G.idPartida = idPartida and G.nrSet = nrSet and G.nrGame = nrGame;
				END IF;
			END IF;
		END IF;
	END IF;
END$$


    
