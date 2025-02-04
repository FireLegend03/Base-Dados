use Torneio_EOR;
-- admin
CREATE USER 'admin'@'localhost';
SET PASSWORD FOR 'admin'@'localhost' = 'freelancers';
-- supervisores
CREATE USER 'supervisor'@'localhost';
SET PASSWORD FOR 'supervisor'@'localhost' = 'euAmoBaseDados';
-- organizadores
CREATE USER 'organizador'@'localhost';
SET PASSWORD FOR 'organizador'@'localhost' = 'organizador1234';
-- online user base
CREATE USER 'user'@'localhost';
SET PASSWORD FOR 'user'@'localhost' = 'user1234';

GRANT ALL ON Torneio_EOR.* TO 'admin'@'localhost';

-- atualizar partida
GRANT EXECUTE ON PROCEDURE Torneio_EOR.atualizaPartida TO 'supervisor'@'localhost';
-- atualizar set
GRANT EXECUTE ON PROCEDURE Torneio_EOR.atualizaSet TO 'supervisor'@'localhost';
-- atualizar game
GRANT EXECUTE ON PROCEDURE Torneio_EOR.atualizaGame TO 'supervisor'@'localhost';

-- utilizador online
GRANT EXECUTE ON PROCEDURE Torneio_EOR.games TO 'user'@'localhost';
GRANT EXECUTE ON PROCEDURE Torneio_EOR.`sets` TO 'user'@'localhost';
GRANT SELECT ON Torneio_EOR.vistaPartida TO 'user'@'localhost';
GRANT SELECT ON Torneio_EOR.vistaAtletas TO 'user'@'localhost';
GRANT EXECUTE ON PROCEDURE Torneio_EOR.vencedores TO 'user'@'localhost';
GRANT EXECUTE ON PROCEDURE Torneio_EOR.numWins TO 'user'@'localhost';

-- utilizador oganizador
GRANT SELECT ON vistaStaff TO 'organizador'@'localhost';
GRANT SELECT ON vistaAtletas TO 'organizador'@'localhost';
GRANT SELECT ON vistaPartida TO 'organizador'@'localhost';
GRANT EXECUTE ON PROCEDURE Torneio_EOR.tempoPartida TO 'organizador'@'localhost';
GRANT EXECUTE ON PROCEDURE Torneio_EOR.staffNaPartida TO 'organizador'@'localhost';
GRANT EXECUTE ON PROCEDURE Torneio_EOR.numWins TO 'organizador'@'localhost';
GRANT EXECUTE ON PROCEDURE Torneio_EOR.atletasDeModalidade TO 'organizador'@'localhost';
GRANT EXECUTE ON PROCEDURE Torneio_EOR.maiorPartida TO 'organizador'@'localhost';

-- organizador todo procedures
GRANT SELECT, INSERT, UPDATE, DELETE ON Atleta TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Campo TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Contacto TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Entrada TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Entrada_Atleta TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Modalidade TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Morada TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Pais TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Partida TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Partida_Staff TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Staff TO 'organizador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Torneio TO 'organizador'@'localhost';

