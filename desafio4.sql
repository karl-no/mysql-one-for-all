SELECT u.nome_usuario AS usuario,
	CASE WHEN YEAR( MAX(h.data_reproducao) )  >= 2021 THEN 'Usuário ativo'
    ELSE 'Usuário inativo'
    END
AS status_usuario
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico_de_reproducoes AS h
ON h.usuario_id = u.usuario_id
GROUP BY usuario
ORDER BY usuario ASC;