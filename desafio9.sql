SELECT COUNT(h.id_cancao) AS quantidade_musicas_no_historico FROM SpotifyClone.historico_de_reproducoes AS h
INNER JOIN SpotifyClone.usuario AS u
ON h.usuario_id = u.usuario_id
-- GROUP BY u.usuario_id
-- GROUP BY h.usuario_id
WHERE u.nome_usuario LIKE 'Barbara Liskov';