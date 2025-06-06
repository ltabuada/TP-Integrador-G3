#Crear la función comprarProducto que debe recibir un usuario comprador, una
#publicación, un medio de pago y un tipo de envío. Tiene que verificar que la publicación
#este activa, si no lo esta devuelve un mensaje ‘La publicación no está activa’. Si está
#activa verifica que se trate de una compra y no de una subasta. Si es una subasta
#devuelve el mensaje ‘Es una subasta’ y sino hace las modificaciones e inserts correspondientes
delimiter //
create function comprarProducto(dni int, idPubli int, metPago int, envio int) returns text deterministic
begin 
declare mensaje text default "";
if estado = "finalizada" then
	set mensaje = "La publicacion no esta activa";
else if publicacion_id.subasta is not null then
	set mensaje = "Es una subasta";
else 
	insert into compra values(null, current_date(), null, dni, idpubli, metPago, envio);
	
end if;
end if;
return mensaje;
delimiter ;
#Crear la función cerrarPublicacion que debe cambiar el estado de la publicación a
#Finalizada. La función tiene que verificar que el usuario recibido por parámetro
#coincida con el usuario vendedor cargado en la publicación ya que solo el usuario
#vendedor puede cerrar la publicación. También tiene que verificar que no tenga
#calificaciones pendientes


