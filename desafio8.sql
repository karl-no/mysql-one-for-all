SELECT
	art.artista AS artista,
  alb.nome_album AS album
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
WHERE art.artista LIKE 'Elis Regina' AND alb.id_artista = '3';