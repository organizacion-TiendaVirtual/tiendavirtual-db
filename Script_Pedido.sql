-- TABLA PEDIDO CRUD

-- Insertar pedido
DELIMITER //
CREATE PROCEDURE proInsertOrder(
IN v_ped_fecha VARCHAR(45),
IN v_ped_estado VARCHAR(45),
IN v_ped_total INT,
IN v_tbl_clientes_cli_id INT
)
BEGIN
INSERT INTO tbl_pedidos (ped_fecha, ped_estado, ped_total, tbl_clientes_cli_id)
VALUES (v_ped_fecha, v_ped_estado, v_ped_total, v_tbl_clientes_cli_id);
END //
DELIMITER ;


-- SELECT PEDIDO
DELIMITER //
CREATE PROCEDURE proSelectOrder()
BEGIN
     SELECT 
    p.ped_id, 
        p.ped_fecha, 
        p.ped_estado, 
        p.ped_total, 
        c.cli_nombre AS cliente
    FROM tbl_pedidos p
    INNER JOIN tbl_clientes c ON p.tbl_clientes_cli_id = c.cli_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE proSelectOrderID (IN v_ped_id INT)
BEGIN
    SELECT * FROM tbl_pedidos WHERE ped_id = v_ped_id;
END //
DELIMITER ;



-- ACTUALIZAR PEDIDO
DELIMITER //
CREATE PROCEDURE proUpdateOrder(
IN v_ped_id INT,
IN v_ped_fecha VARCHAR(30),
IN v_ped_estado VARCHAR(45),
IN v_ped_total DECIMAL (10,2),
IN v_tbl_clientes_cli_id INT
)
BEGIN
UPDATE tbl_pedidos
SET ped_fecha = v_ped_fecha,
ped_estado = v_ped_estado,
ped_total = v_ped_total,
tbl_clientes_cli_id = v_tbl_clientes_cli_id
WHERE ped_id = v_ped_id;
END //
DELIMITER ;

-- ELIMINAR PEDIDO 
DELIMITER //
CREATE PROCEDURE proDeleteOrder (IN v_ped_id INT)
BEGIN
    DELETE FROM tbl_pedidos WHERE ped_id = v_ped_id;
END //
DELIMITER ;

-- procedimiento ddl
DELIMITER //
CREATE PROCEDURE spSelectPedidosDDL()
BEGIN
  SELECT ped_id, CONCAT('Cliente ', tbl_clientes_cli_id, ', Estado: ', ped_estado ) AS DetallePedido
  FROM tbl_pedidos;
END //
DELIMITER ;