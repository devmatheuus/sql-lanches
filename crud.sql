-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO clientes
	(nome, lealdade)
VALUES
	('Georgia', 0);

-- 2)

INSERT INTO pedidos
	(status, cliente_id)
VALUES
	('Recebido', 6);

-- 3)

INSERT INTO produtos_pedidos
	(pedido_id, produto_id)
VALUES
	(6, 1),
	(6, 2),
	(6, 6),
	(6, 8),
	(6, 8);

-- Leitura

-- 1)
 
 SELECT 
 	c.id,
    c.nome,
    c.lealdade,
   	p.id,
    p.status,
    p.cliente_id,
    prods.id,
    prods.nome,
    prods.tipo,
    prods.preco,
    prods.pts_de_lealdade
 FROM 
 	clientes c
    JOIN pedidos p ON c.id = p.cliente_id
    JOIN produtos_pedidos pp ON p.id = pp.pedido_id
    JOIN produtos prods ON pp.produto_id = prods.id
 WHERE
 	c.nome = 'Georgia';

-- Atualização

-- 1)

UPDATE
  clientes c
SET
  lealdade = (
    SELECT
      SUM(prods.pts_de_lealdade)
    FROM
      clientes c
      JOIN pedidos p ON c.id = p.cliente_id
      JOIN produtos_pedidos pp ON p.id = pp.pedido_id
      JOIN produtos prods ON pp.produto_id = prods.id
    WHERE
      c.nome = 'Georgia'
  )
WHERE
  c.nome = 'Georgia';

-- Deleção

DELETE FROM 
	clientes
WHERE 
	nome = 'Marcelo';

-- 1)


