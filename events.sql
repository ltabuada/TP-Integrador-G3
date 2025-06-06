-- 1
delimiter //
create event if not exists mantenimientoPublicaciones on schedule every 1 week starts now() do
begin
	delete from publicacion where estado = "pausado" and fechaPublicacion < fechaPublicacion - interval
    + 90 day;
end //
delimiter ;

-- 2
delimiter //
create event if not exists publicacionesObservadas on schedule every 1 day starts now do
begin
	update publicacion join venta_directa on publicacion.id = publicacion_id join pago on idPago = pago_idPago
    set estado = "observadas" where publicacion.estado = "activo" and metodo = "";
end //
delimiter ;