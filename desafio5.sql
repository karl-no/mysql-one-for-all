SELECT c.cancao AS cancao, COUNT(h.id_cancao) AS reproducoes FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_de_reproducoes AS h
ON c.id_cancao = h.id_cancao
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;