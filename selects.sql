-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
	p.id,
  p.status,
  p.cliente_id,
  prod.id,
  prod.nome,
  prod.tipo,
  prod.preco,
  prod.pts_de_lealdade
FROM pedidos p
	JOIN produtos_pedidos pd ON p.id = pd.pedido_id
  JOIN produtos prod ON pd.produto_id = prod.id

-- 2)

SELECT 
	p.id
FROM pedidos p
	JOIN produtos_pedidos pp ON p.id = pp.pedido_id
  JOIN produtos prods ON pp.produto_id = prods.id
WHERE prods.nome = 'Fritas';

-- 3)
SELECT 
	c.nome gostam_de_fritas
FROM clientes c
	JOIN pedidos p ON c.id = p.cliente_id
  JOIN produtos_pedidos pp ON p.id = pp.pedido_id
  JOIN produtos prods ON pp.produto_id = prods.id
WHERE prods.nome = 'Fritas';
-- 4)

SELECT
  SUM(prods.preco)
FROM
  pedidos p
  JOIN clientes c ON p.cliente_id = c.id
  JOIN produtos_pedidos pp ON p.id = pp.pedido_id
  JOIN produtos prods ON pp.produto_id = prods.id
WHERE
  c.nome = 'Laura';


-- 5)

SELECT
  prods.nome,
  COUNT(prods.id)
FROM
  produtos prods
  JOIN produtos_pedidos pp ON prods.id = pp.produto_id
GROUP BY
  prods.nome
ORDER BY
  prods.nome ASC;