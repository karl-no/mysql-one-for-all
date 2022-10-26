DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plano (
    id_plano INT NOT NULL AUTO_INCREMENT,
    nome_plano VARCHAR(15) NOT NULL,
    valor_plano DOUBLE NOT NULL,
    CONSTRAINT PRIMARY KEY (id_plano)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.usuario (
    usuario_id INT NOT NULL AUTO_INCREMENT,
    nome_usuario VARCHAR(15) NOT NULL,
    nome_complementar VARCHAR(15),
    sobrenome_usuario VARCHAR(15) NOT NULL,
    idade SMALLINT NOT NULL,
    data_assinatura DATE NOT NULL,
    id_plano INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id),
    FOREIGN KEY (id_plano)
        REFERENCES plano (id_plano)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.artista (
    id_artista INT NOT NULL AUTO_INCREMENT,
    artista VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY (id_artista)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.album (
    album_id INT NOT NULL AUTO_INCREMENT,
    nome_album VARCHAR(255) NOT NULL,
    id_artista INT NOT NULL,
    ano_lancamento YEAR NOT NULL,
    CONSTRAINT PRIMARY KEY (album_id , id_artista),
    FOREIGN KEY (id_artista)
        REFERENCES artista (id_artista)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.cancoes (
    id_cancao INT PRIMARY KEY AUTO_INCREMENT,
    album_id INT NOT NULL,
    id_artista INT NOT NULL,
    cancao VARCHAR(200) NOT NULL,
    duracao_segundos INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES album (album_id),
    FOREIGN KEY (id_artista)
        REFERENCES artista (id_artista)
)  ENGINE=INNODB;
  
CREATE TABLE SpotifyClone.historico_de_reproducoes (
    usuario_id INT NOT NULL,
    id_cancao INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id , id_cancao),
    FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id),
    FOREIGN KEY (id_cancao)
        REFERENCES cancoes (id_cancao)
)  ENGINE=INNODB;
  
CREATE TABLE SpotifyClone.seguindo_artistas (
    usuario_id INT NOT NULL,
    id_artista INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id , id_artista),
    FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id),
    FOREIGN KEY (id_artista)
        REFERENCES artista (id_artista)
)  ENGINE=INNODB;
  
INSERT INTO SpotifyClone.plano (nome_plano, valor_plano)
  VALUES
    ('gratuito', '0.00'),
	('familiar', '7.99'),
    ('universitário', '5.99'),
    ('pessoal', '6.99');
  
  INSERT INTO SpotifyClone.usuario (nome_usuario, nome_complementar, sobrenome_usuario, idade, data_assinatura, id_plano)
  VALUES
    ('Barbara', '', 'Liskov', '82', '2019-10-20', '1'),
    ('Robert', 'Cecil', 'Martin', '58', '2017-01-06', '1'),
    ('Ada', '', 'Lovelace', '37', '2017-12-30', '2'),
    ('Martin', '', 'Fowler', '46', '2017-01-17', '2'),
    ('Sandi', '', 'Metz', '58', '2018-04-29', '2'),
    ('Paulo', '', 'Freire', '19', '2018-02-14', '3'),
    ('Bell', '', 'Hooks', '26', '2018-01-05', '3'),
	('Christopher', '', 'Alexander', '85', '2019-06-05', '4'),
    ('Judith', '', 'Butler', '45', '2020-05-13', '4'),
    ('Jorge', '', 'Amado', '58', '2017-02-17', '4');

INSERT INTO SpotifyClone.artista(artista)
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');
    
INSERT INTO SpotifyClone.album(nome_album, id_artista, ano_lancamento)
VALUES
	('Renaissance',	1,	2022),
	('Jazz', 2,	1978),
	('Hot Space', 2, 1982),
	('Falso Brilhante',	3, 1998),
	('Vento de Maio', 3, 2001),
	('QVVJFA?',	4, 2003),
	('Somewhere Far Beyond', 5,	2007),
	('I Put A Spell On You', 6,	2012);
    
INSERT INTO SpotifyClone.cancoes(album_id, id_artista, cancao, duracao_segundos)
VALUES
	(1,	1, 'BREAK MY SOUL', 279),
	(1,	1,	'VIRGO’S GROOVE', 369),
	(1,	1, 'ALIEN SUPERSTAR', 116),
	(2,	2, 'Don’t Stop Me Now',	203),
	(3,	2,'Under Pressure',	152),
	(4,	3, 'Como Nossos Pais', 105),
	(5,	3, 'O Medo de Amar é o Medo de Ser Livre', 207),
	(6,	4, 'Samba em Paris', 267),
	(7,	5, 'The Bard’s Song', 244),
	(8,	6, 'Feeling Good', 100);
    
INSERT INTO SpotifyClone.historico_de_reproducoes (usuario_id, id_cancao, data_reproducao)
VALUES
	('1','8','2022-02-28 10:45:55'),
	('1','2','2020-05-02 05:30:35'),
	('1','10','2020-03-06 11:22:33'),
	('2','10','2022-08-05 08:05:17'),
	('2','7','2020-01-02 07:40:33'),
	('3','10','2020-11-13 16:55:13'),
	('3','2','2020-12-05 18:38:30'),
	('4','8','2021-08-15 17:10:10'),
	('5','8','2022-01-09 01:44:33'),
	('5','5','2020-08-06 15:23:43'),
	('6','7','2017-01-24 00:31:17'),
	('6','1','2017-10-12 12:35:20'),
	('7','4','2011-12-15 22:30:49'),
	('8','4','2012-03-17 14:56:41'),
	('9','9','2022-02-24 21:14:22'),
	('10','3','2015-12-13 08:30:22');
    
INSERT INTO SpotifyClone.seguindo_artistas(usuario_id, id_artista)
VALUES
	(1,	1),
	(1,	2),
	(1,	3),
	(2,	1),
	(2,	3),
	(3,	2),
	(4,	4),
	(5,	5),
	(5,	6),
	(6,	6),
	(6,	1),
	(7,	6),
	(9,	3),
	(10,2);
