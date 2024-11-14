-- TABLA PAGOS CRUD 


-- INSERTAR PAGO
DELIMITER //
CREATE PROCEDURE proInsertPay(
IN v_pag_monto DOUBLE,
IN v_pag_fecha TEXT,
IN v_pag_metodo_pago VARCHAR(45),
IN v_tbl_pedidos_ped_id INT
)
BEGIN
INSERT INTO tbl_pagos (pag_monto, pag_fecha, pag_metodo_pago, tbl_pedidos_ped_id)
VALUES (v_pag_monto, v_pag_fecha, v_pag_metodo_pago, v_tbl_pedidos_ped_id);
END //
DELIMITER ;


-- SELECT PAGO
DELIMITER //
CREATE PROCEDURE proSelectPay()
BEGIN
    SELECT * FROM tbl_pagos;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE proSelectPayID (IN v_pag_id INT)
BEGIN
    SELECT * FROM tbl_pagos WHERE pag_id = v_pag_id;
END //
DELIMITER ;


-- ACTUALIZAR PAGO 
DELIMITER //
CREATE PROCEDURE proUpdatePay (
IN v_pag_id INT,
IN v_pag_monto DOUBLE,
IN v_pag_fecha TEXT,
IN v_pag_metodo_pago VARCHAR(45),
IN v_tbl_pedidos_ped_id INT
)
BEGIN
UPDATE tbl_pagos
SET pag_monto = v_pag_monto,
pag_fecha = v_pag_fecha,
pag_metodo_pago = v_pag_metodo_pago,
tbl_pedidos_ped_id = v_tbl_pedidos_ped_id
WHERE pag_id = v_pag_id;
END //

DELIMITER ;

-- ELIMINAR PAGO
DELIMITER //
CREATE PROCEDURE proDeletePay (IN v_pag_id INT)
BEGIN
    DELETE FROM tbl_pagos WHERE pag_id = v_pag_id;
END //
DELIMITER ;


-- procedimiento DDL
DELIMITER //
CREATE PROCEDURE spSelectPagosDDL()
BEGIN
  SELECT pag_id, CONCAT('Pedido ', tbl_pedidos_ped_id, ', Monto: ', pag_monto) AS DetallePago
  FROM tbl_pagos;
END //
DELIMITER ;