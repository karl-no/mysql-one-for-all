SELECT c.cancao AS nome, COUNT(h.id_cancao) AS reproducoes FROM SpotifyClone.historico_de_reproducoes AS h
INNER JOIN SpotifyClone.cancoes AS c
ON c.id_cancao = h.id_cancao
INNER JOIN SpotifyClone.usuario AS u
ON u.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.plano AS p
ON p.id_plano = u.id_plano
WHERE p.nome_plano IN('gratuito', 'pessoal')
GROUP BY c.cancao
ORDER BY cancao ASC;