CREATE DATABASE IF NOT EXISTS  Torneio_EOR;
USE Torneio_EOR ;

-- Criação tabela Modalidade
CREATE TABLE IF NOT EXISTS `Modalidade` (
  `idModalidade` INT NOT NULL,
  `designacao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idModalidade`)
  );

-- Criação tabela Pais
CREATE TABLE IF NOT EXISTS `Pais` (
  `idPais` INT NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idPais`)
  );

-- Criação tabela Atleta
CREATE TABLE IF NOT EXISTS `Atleta` (
  `idAtleta` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `sexo` VARCHAR(50) NOT NULL,
  `idModalidade` INT NOT NULL,
  `idPais` INT NOT NULL,
  `ranking` INT NULL DEFAULT NULL,
	PRIMARY KEY (`idAtleta`),
    FOREIGN KEY (`idModalidade`)
		REFERENCES `Modalidade` (`idModalidade`)
		ON DELETE RESTRICT,
    FOREIGN KEY (`idPais`)
		REFERENCES `Pais` (`idPais`)
		ON DELETE CASCADE
);

-- Criação tabela Morada
CREATE TABLE IF NOT EXISTS `Morada` (
  `idMorada` INT NOT NULL,
  `rua` VARCHAR(50) NOT NULL,
  `nrPorta` INT NOT NULL,
  `codigoPostal` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `idPais` INT NOT NULL,
	PRIMARY KEY (`idMorada`),
	FOREIGN KEY (`idPais`)
		REFERENCES `Pais` (`idPais`)
		ON DELETE CASCADE
		ON UPDATE RESTRICT
);

-- Criação tabela Campo
CREATE TABLE IF NOT EXISTS `Campo` (
  `idCampo` INT NOT NULL,
  `designacao` VARCHAR(50) NOT NULL,
  `lotacao` INT NOT NULL,
  `idMorada` INT NOT NULL,
  `idModalidade` INT NOT NULL,
	PRIMARY KEY (`idCampo`),
    FOREIGN KEY (`idMorada`)
		REFERENCES `Morada` (`idMorada`)
		ON DELETE RESTRICT,
    FOREIGN KEY (`idModalidade`)
		REFERENCES `Modalidade` (`idModalidade`)
		ON DELETE RESTRICT
);

-- Criação tabela Staff
CREATE TABLE IF NOT EXISTS `Staff` (
  `idStaff` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `genero` VARCHAR(50) NOT NULL,
  `areaTrabalho` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `idChefe` INT NULL DEFAULT NULL,
  `idMorada` INT NOT NULL,
	PRIMARY KEY (`idStaff`),
    FOREIGN KEY (`idChefe`)
		REFERENCES `Staff` (`idStaff`),
    FOREIGN KEY (`idMorada`)
		REFERENCES `Morada` (`idMorada`)
		ON DELETE RESTRICT
);

-- Criação tabela Contacto
CREATE TABLE IF NOT EXISTS `Contacto` (
  `idContacto` INT NOT NULL,
  `contacto` INT NOT NULL,
	PRIMARY KEY (`idContacto`, `contacto`),
    FOREIGN KEY (`idContacto`)
		REFERENCES `Staff` (`idStaff`)
);

-- Criação tabela Entrada
CREATE TABLE IF NOT EXISTS `Entrada` (
  `idEntrada` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEntrada`)
);

-- Criação tabela Entrada_Atleta
CREATE TABLE IF NOT EXISTS `Entrada_Atleta` (
  `idEntrada` INT NOT NULL,
  `idAtleta` INT NOT NULL,
	PRIMARY KEY (`idEntrada`, `idAtleta`),
    FOREIGN KEY (`idAtleta`)
		REFERENCES `Atleta` (`idAtleta`),
    FOREIGN KEY (`idEntrada`)
		REFERENCES `Entrada` (`idEntrada`)
);

-- Criação tabela Torneio
CREATE TABLE IF NOT EXISTS `Torneio` (
  `idTorneio` INT NOT NULL,
  `edicao` VARCHAR(50) NOT NULL,
  `designacao` VARCHAR(50) NOT NULL,
  `idPais` INT NOT NULL,
	PRIMARY KEY (`idTorneio`),
	FOREIGN KEY (`idPais`)
		REFERENCES `Pais` (`idPais`)
    ON DELETE CASCADE
);

-- Criação tabela Partida
CREATE TABLE IF NOT EXISTS `Partida` (
  `idPartida` INT NOT NULL,
  `idModalidade` INT NOT NULL,
  `idEntradaA` INT NOT NULL,
  `idEntradaB` INT NOT NULL,
  `dataInicio` DATETIME NOT NULL,
  `ronda` VARCHAR(50) NOT NULL,
  `idCampo` INT NOT NULL,
  `duracao` INT NULL DEFAULT NULL,
  `idTorneio` INT NOT NULL,
  `idVencedor` INT NULL DEFAULT NULL,
	PRIMARY KEY (`idPartida`),
    FOREIGN KEY (`idModalidade`)
		REFERENCES `Modalidade` (`idModalidade`)
		ON DELETE CASCADE,
    FOREIGN KEY (`idCampo`)
		REFERENCES `Campo` (`idCampo`)
		ON DELETE CASCADE,
    FOREIGN KEY (`idTorneio`)
		REFERENCES `Torneio` (`idTorneio`)
		ON DELETE RESTRICT,
    FOREIGN KEY (`idEntradaA`)
		REFERENCES `Entrada` (`idEntrada`)
		ON DELETE RESTRICT,
    FOREIGN KEY (`idEntradaB`)
		REFERENCES `Entrada` (`idEntrada`)
		ON DELETE RESTRICT,
    FOREIGN KEY (`idVencedor`)
		REFERENCES `Entrada` (`idEntrada`)
		ON DELETE RESTRICT
);

-- Criação tabela Set
CREATE TABLE IF NOT EXISTS `Set` (
  `idPartida` INT NOT NULL,
  `nrSet` INT NOT NULL,
  `gamesEntradaA` INT NOT NULL,
  `gamesEntradaB` INT NOT NULL,
  `tiebreakersEntradaA` INT NULL DEFAULT NULL,
  `tiebreakersEntradaB` INT NULL DEFAULT NULL,
	PRIMARY KEY (`idPartida`, `nrSet`),
    FOREIGN KEY (`idPartida`)
		REFERENCES `Partida` (`idPartida`)
		ON DELETE RESTRICT
);

-- Criação tabela Game
CREATE TABLE IF NOT EXISTS `Game` (
  `idPartida` INT NOT NULL,
  `nrSet` INT NOT NULL,
  `nrGame` INT NOT NULL,
  `pontosEntradaA` VARCHAR(10) NOT NULL,
  `pontosEntradaB` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`idPartida`, `nrSet`, `nrGame`),
    FOREIGN KEY (`idPartida` , `nrSet`)
		REFERENCES `Set` (`idPartida` , `nrSet`)
		ON DELETE RESTRICT
);

-- Criação tabela Partida_Staff
CREATE TABLE IF NOT EXISTS `Partida_Staff` (
  `idStaff` INT NOT NULL,
  `idPartida` INT NOT NULL,
  PRIMARY KEY (`idStaff`, `idPartida`),
    FOREIGN KEY (`idStaff`)
		REFERENCES `Staff` (`idStaff`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    FOREIGN KEY (`idPartida`)
		REFERENCES `Partida` (`idPartida`)
);






