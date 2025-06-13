#------------------------------Stored Procedures------------------------------#
#1)
delimiter //
create procedure buscarPublicacion(in productito text)
begin
	select publicacion.id, nombreProducto, categoria from producto join publicacion on idProducto = producto_idProducto join categoria on idcategoria = categoria_idCategoria where nombreProducto = productito;
end //
delimiter ;
call buscarPublicacion("TV42");

#2)------------------------------------------------------------------------------------------------
delimiter //
create procedure crearPublicacion (in idPubli int, in cuantoDuele float, in nivelPubli varchar(45), in estado varchar(45), in tipo text, in idProdu int, in idCat int, in DNI int, in fecha datetime, in titulito text)
begin 
insert into publicacion values(idPubli, cuantoDuele, nivelPubli, estado, idProdu, idCat, DNI, fecha, titulito);
end //
delimiter ;

delimiter //
create procedure crearSubasta(in ofert int, in idPubli int)
begin 
insert into subasta values(ofert, idPubli);
end //
delimiter ;

delimiter //
create procedure crearVenta(in pagoId int, in envioId int, in publiId int)
begin 
insert into venta_directa values(pagoId, envioId, publiId);
end //
delimiter ;

#3)------------------------------------------------------------------------------------------------
delimiter //
create procedure verPreguntas(in idPubli int)
begin 
select pregunta from preguntas where publicacion_id = idPubli;
end //
delimiter ;
call verPreguntas(1);

#4)------------------------------------------------------------------------------------------------
delimiter //
create procedure actualizarReputacionUsuarios()
begin 
declare hayFilas int default 1;
declare usuario int default 0;
declare promedio1 int default 0;
declare promedio2 int default 0;
declare cursorCalificaciones cursor for select usuario_DNI, avg(calificacion_compra), avg(calificacion_vendedor) from publicacion join compra on publicacion.id = publicacion_id group by usuario_DNI; 
declare continue handler for not found set hayFilas = 0;
open cursorCalificaciones;
loopsito:loop
	fetch cursorCalificaciones into usuario, promedio1, promedio2;
    if hayFilas = 0 then 
		leave loopsito;
	end if;
    update usuario set reputacion = (promedio1 + promedio2) / 2 where DNI = usuario;
    end loop;
close cursorCalificaciones;
end //
delimiter ;

#------------------------------Stored Functions------------------------------#

#1) 
delimiter //
create function comprarProducto(dni int, idPubli int, metPago int, envio int) returns text deterministic
begin 
declare mensaje text default "";
if estado = "Finalizada" then
	set mensaje = "La publicacion no esta activa";
else if publicacion_id.subasta != null then
	set mensaje = "Es una subasta";
else 
	insert into compra values(null, current_date(), null, dni, idpubli, metPago, envio);
end if;
end if;
return mensaje;
delimiter ;

#2)------------------------------------------------------------------------------------------------
delimiter //
create function cerrarPublicacion(DNI int) returns int deterministic
begin 
declare msg text default "";
if calificacion_compra != null then
	delete from publicacion where usuario_DNI = DNI;
    update publicacion set estado = "Finalizada";
else
	set msg = "Tiene calificacion pendiente";
end if;
return msg;
end //
delimiter ;

#3)------------------------------------------------------------------------------------------------
delimiter //
create function eliminarProducto(idProdu int) returns text deterministic
begin 
declare msg text default "";
if idProdu in (select producto_idProducto from publicacion) then
	set msg = "El producto esta en una publicacion";
else 
	delete from producto where idProducto = idProdu;
    set msg = "Producto eliminado";
    
	end if;
end //
delimiter ;

#4)------------------------------------------------------------------------------------------------
delimiter //
create function pausarPublicacion(idPubli int) returns text deterministic
begin 
declare mensajito text default "";
if idPubli in (select id from publicacion) then
	update publicacion set estado = "Pausada" where idPubli = id.publicacion;
    set mensajito = "Publicacion pausada";
else 
	set mensajito = "No existe la publicacion";
    
end if;
end //
delimiter ;

#5)------------------------------------------------------------------------------------------------

delimiter //
create function pujarProducto(idDeseado int, ofertaNueva int, usuarioOfertante /*su dni*/ int) returns text deterministic
begin
    declare mensaje text default "";
    declare cant_publicaciones int default 0;
    declare cant_subastas int default 0;
    declare ofertaActual int default 0;
    select count(*) into cant_publicaciones from publicacion where publicacion.id = idDeseado and estado = 'activa';
	if cant_publicaciones = 0 then
        set mensaje = "La publicación no está activa.";
        return mensaje;
    end if;
    select count(*) into cant_subastas from subasta where publicacion_id = idDeseado;
    if cant_subastas = 0 then
        set mensaje = "La publicación no corresponde a una subasta.";
        return mensaje;
    end if;
    select oferta into ofertaActual from subasta where publicacionId = idDeseado;
	if ofertaNueva > ofertaActual then
		insert into historial_ofertas values(ofertaNueva, usuarioOfertante, idDeseado);
        update subasta set oferta = ofertaNueva where publicacionId = idDeseado;
		set mensaje = "pujado satisfactoriamente.";
	else 
		set mensaje = "La oferta nueva es menor a la actual.";
	end if;
    return mensaje;
end //
delimiter ;
 
 
#6)------------------------------------------------------------------------------------------------
delimiter //
create function eliminarCategoria (categoriaDeseada varchar(45)) returns text deterministic
begin
	declare mensaje text default "";
    if not exists (select * from publicacion where categoria_idCategoria = categoriaDeseada) then
		delete from categoria where categoria.categoria = categoriaDeseada;
        set mensaje = "la categoria deseada se ha eliminado satisfactoriamente.";
	else
		set mensaje = "la categria deseada no se puede eliminar porque hay una publicacion con esta misma.";
    end if;
    return mensaje;
end //
delimiter ;
 
#7)------------------------------------------------------------------------------------------------

delimiter //
create function puntuarComprador(usuarioVendedor int, publicacionDada int, calificacionDada int) returns text deterministic
begin
	declare mensaje text default "";
	if not exists (select * from venta_directa where publicacion_id = publicacionDada) then 
		set mensaje ="la publicacion que se da, no se ha vendido directamente";
		return mensaje;
	end if;
    if not exists (select * from publicacion where id = publicacionDada and usuario_DNI = usuarioVendedor) then
		set mensaje = "el usuario recibido por parametro NO es el vendedor";
        return mensaje;
	end if;
    update venta_directa join publicacion on publicacion.id = publicacion_id set calificacion_venta = calificacionDada 
    where publicacion_id = publicacionDada and publicacion.usuario_DNI = usuarioVendedor;
    set mensaje = "calificacion de la venta actualizada, comprador puntuado.";
    return mensaje;
end //
delimiter ;

#8)------------------------------------------------------------------------------------------------

delimiter //
create function responderpregunta(id_vendedor int, idPreg int, msgRespuesta text) returns text deterministic
begin 
declare mensaje text default "";
if id_vendedor = (select usuario_DNI from publicacion join pregunta on publicacion.id = publicacion_id where idPregunta = idPreg) then
	insert into respuestas values(null, msgRespuesta, idPreg);
    set mensaje = "Pregunta Respondida";
else 
	set mensaje = "Este usurio no puede responder";
	end if;
return mensaje;
end //
delimiter ;



#------------------------------Vistas------------------------------#

#1)
create view preguntas_sin_respuesta as select pregunta.pregunta, idpregunta, publicacion.idpublicacion, producto.nombre as nombre, usuario.nombre as n from pregunta join publicacion on pregunta.idpublicacion=publicacion.idpublicacion join usuario on pregunta.idusuariocompra=idusuario join producto on idusuario=producto.idusuariocreador where estado="activa" and idpregunta NOT IN (SELECT idpregunta FROM respuesta);

#2) ------------------------------------------------------------------------------------------------
create view top_10_categorias as select categoria.idcategoria, categoria.nombre, count(publicacion.idpublicacion) as total_publicaciones from publicacion join categoria on categoria.idcategoria=publicacion.idcategoria where week(fechaPublicacion) >= week(current_date()) group by categoria.idcategoria, categoria.nombre order by total_publicaciones DESC LIMIT 10;

#3)------------------------------------------------------------------------------------------------
create view publicacion_tendencia_hoy as select publicacion.idpublicacion , COUNT(pregunta.idpregunta) AS total_preguntas from publicacion join pregunta on publicacion.idpublicacion=pregunta.idpublicacion where pregunta.fechaPregunta = current_date() group by publicacion.idpublicacion order by total_preguntas desc;

#4)------------------------------------------------------------------------------------------------
create view mejor_vendedor as select usuario.nombre from usuario join publicacion on usuario.idusuario=publicacion.idusuariovendedor join categoria on categoria.idcategoria=publicacion.idcategoria where reputacion=(select max(reputacion) from publicacion join usuario on usuario.idusuario=publicacion.idusuariovendedor where categoria.idcategoria=publicacion.idcategoria);

#------------------------------Triggers------------------------------#

#1)
delimiter //
create trigger borrarPreguntas before delete on publicacion for each row 
begin
	delete from preputacionreguntas where idPublicacion = old.id;
end //
delimiter ;

#2)------------------------------------------------------------------------------------------------
delimiter //
create trigger calificar after update on compra for each row
begin
	declare repComprador int default 0;
    declare repVendedor int default 0;
    select reputacion into repComprador from usuario join compra on usuario_DNI = usuario.DNI;
    select reputacion into repVendedor from usuario join publicacion on usuario_DNI = usuario.DNI;
    if (repComprador is null and repVendedor is null) then
    set repComprador = avg(calificacion_compra);
	end if;
		
end //
delimiter ;


#3)------------------------------------------------------------------------------------------------
delimiter //
create trigger cambiarCategoria after insert on compra for each row
begin
	declare vendedor int;
    declare cantcompras int;
    declare facturacion int;
    select sum(precio) into facturacion from publicacion where publicacion_id.usuario_DNI=vendedor;
    select usuario_DNI into vendedor from publicacion where new.publicacion_id=id;
	select count(*) into cantcompras from compra join publicacion on publicacion.id=compra.publicacion_id where vendedor=publicacion.usuario_DNI;
	if (cantcompras<=5) then
		update usuario set nivel="Normal" where DNI=vendedor;
    else if(cantcompras>5 or facturacion>=100000) then
		update usuario set nivel="Platinum" where DNI=vendedor;
    else if(cantcompras>10 or facturacion>=1000000) then
		update usuario set nivel="Gold" where DNI=vendedor;
	end if;
    end if;
    end if;
end //
delimiter ;

#------------------------------Eventos------------------------------#

#1)
delimiter //
create event if not exists mantenimientoPublicaciones on schedule every 1 week starts now() do
begin
	delete from publicacion where estado = "pausado" and fechaPublicacion < fechaPublicacion - interval 90 day;
end //
delimiter ;

#2)------------------------------------------------------------------------------------------------
delimiter //
create event if not exists publicacionesObservadas on schedule every 1 day starts now do
begin
	update publicacion join venta_directa on publicacion.id = publicacion_id join pago on idPago = pago_idPago
    set estado = "observadas" where publicacion.estado = "activo" and metodo = null;
end //
delimiter ;

#------------------------------Indices------------------------------#

#1)
create index indexFKproducts on publicacion(producto_idProducto);
create index FindNames on producto(nombreProducto);
#2)------------------------------------------------------------------------------------------------
create unique index dontRepeatEmail on usuario(email);
#3)------------------------------------------------------------------------------------------------
create index statusAPF on publicacion(estado);


