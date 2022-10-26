SELECT
	art.artista AS artista,
  alb.nome_album AS album,
  COUNT(s.id_artista) AS seguidores
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
ON alb.id_artista = art.id_artista
INNER JOIN SpotifyClone.seguindo_artistas AS s
ON s.id_artista = art.id_artista
GROUP BY alb.album_id
ORDER BY seguidores DESC, artista ASC, album ASC;
