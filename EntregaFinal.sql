INSERT INTO usuario (DNI, nombre, apellido, nivel, reputacion, email, facturacion) VALUES (1, 'Juan', 'Pérez', 'Normal', 0, 'juan1@mail.com', 1000), (2, 'Ana', 'Gómez', 'Normal', 0, 'ana2@mail.com', 2000), (3, 'Luis', 'López', 'Normal', 0, 'luis3@mail.com', 1500), (4, 'Sofía', 'Martínez', 'Normal', 0, 'sofia4@mail.com', 1800), (5, 'Carlos', 'Díaz', 'Normal', 0, 'carlos5@mail.com', 1700), (6, 'María', 'Ruiz', 'Normal', 0, 'maria6@mail.com', 1300), (7, 'Pedro', 'Torres', 'Normal', 0, 'pedro7@mail.com', 1600), (8, 'Lucía', 'Ramírez', 'Normal', 0, 'lucia8@mail.com', 1100), (9, 'Diego', 'Sánchez', 'Normal', 0, 'diego9@mail.com', 1900), (10, 'Valentina', 'Castro', 'Normal', 0, 'valen10@mail.com', 1400);
INSERT INTO categoria (idCategoria, categoria) VALUES (1, 'Electrónica'), (2, 'Ropa'), (3, 'Libros'), (4, 'Juguetes'), (5, 'Hogar'), (6, 'Deportes'), (7, 'Cocina'), (8, 'Computación'), (9, 'Arte'), (10, 'Música');
INSERT INTO producto (idProducto, nombreProducto, descripcion, usuario_DNI) VALUES (1, 'Notebook HP', 'Laptop con 16GB RAM', 1), (2, 'Zapatillas Nike', 'Deportivas, talla 42', 2), (3, 'Libro Java', 'Programación en Java', 3), (4, 'Set Lego', '500 piezas', 4), (5, 'Aspiradora', 'Potente y silenciosa', 5), (6, 'Bicicleta', 'Mountain bike', 6), (7, 'Cafetera', 'Automática', 7), (8, 'Mouse Gamer', 'RGB', 8), (9, 'Cuadro óleo', 'Arte moderno', 9), (10, 'Guitarra', 'Clásica, madera', 10);
INSERT INTO envio (idEnvio, direccion, empresa) VALUES (1, 'Av. Siempre Viva 123', 1), (2, 'Calle 8 N°456', 0), (3, 'Ruta 3 KM 25', 1), (4, 'Mitre 789', 0), (5, 'San Martín 1010', 1), (6, 'Av. Libertador 2020', 0), (7, 'Calle 12 N°303', 1), (8, 'Boulevard 9 de Julio', 0), (9, 'Av. Belgrano 1234', 1), (10, 'Calle Falsa 321', 0);
INSERT INTO publicacion (id, precio, nivelPublicacion, estado, producto_idProducto, categoria_idCategoria, usuario_DNI, fechaPublicacion) VALUES (1, 500.0, 'Normal', 'Activa', 1, 1, 1, '2024-06-01'), (2, 120.0, 'Normal', 'Activa', 2, 2, 2, '2024-06-02'), (3, 50.0, 'Normal', 'Activa', 3, 3, 3, '2024-06-03'), (4, 80.0, 'Normal', 'Activa', 4, 4, 4, '2024-06-04'), (5, 200.0, 'Normal', 'Activa', 5, 5, 5, '2024-06-05'), (6, 400.0, 'Normal', 'Activa', 6, 6, 6, '2024-06-06'), (7, 90.0, 'Normal', 'Activa', 7, 7, 7, '2024-06-07'), (8, 45.0, 'Normal', 'Activa', 8, 8, 8, '2024-06-08'), (9, 300.0, 'Normal', 'Activa', 9, 9, 9, '2024-06-09'), (10, 250.0, 'Normal', 'Activa', 10, 10, 10, '2024-06-10');
INSERT INTO preguntas (idPregunta, pregunta, usuario_DNI, publicacion_id, fechaPreguntas) VALUES (1, '¿Viene con garantía?', 2, 1, '2024-06-01'), (2, '¿Qué talla es?', 3, 2, '2024-06-02'), (3, '¿Es nuevo?', 4, 3, '2024-06-03'), (4, '¿Cuánto mide?', 5, 4, '2024-06-04'), (5, '¿Tiene accesorios?', 6, 5, '2024-06-05'), (6, '¿Cuánto pesa?', 7, 6, '2024-06-06'), (7, '¿Tiempo de entrega?', 8, 7, '2024-06-07'), (8, '¿Garantía incluida?', 9, 8, '2024-06-08'), (9, '¿Se puede probar?', 10, 9, '2024-06-09'), (10, '¿Viene con funda?', 1, 10, '2024-06-10');
INSERT INTO respuestas (idRespuesta, respuesta, preguntas_idPregunta) VALUES (1, 'Sí, 1 año.', 1), (2, 'Talla 42.', 2), (3, 'Sí, nuevo.', 3), (4, '50 cm.', 4), (5, 'Sí, incluye.', 5), (6, '1.5 kg.', 6), (7, '2 días.', 7), (8, 'Sí.', 8), (9, 'Claro.', 9), (10, 'En buen estado.', 10);
INSERT INTO compra (idCompra, fecha, usuario_DNI, publicacion_id, envio_idEnvio) VALUES (1, '2024-06-11', 2, 1, 1), (2, '2024-06-12', 3, 2, 2), (3, '2024-06-13', 4, 3, 3), (4, '2024-06-14', 5, 4, 4), (5, '2024-06-15', 6, 5, 5), (6, '2024-06-16', 7, 1, 6), (7, '2024-06-17', 8, 2, 7), (8, '2024-06-18', 9, 3, 8), (9, '2024-06-19', 10, 4, 9), (10, '2024-06-20', 1, 5, 10);
INSERT INTO subasta VALUES (260000, 1, '2025-06-15 18:00:00', 250000), (NULL, 2, '2025-06-16 12:00:00', 50000), (98000, 3, '2025-06-17 09:00:00', 90000), (NULL, 4, '2025-06-18 20:00:00', 13000), (195000, 5, '2025-06-19 22:00:00', 180000), (40000, 6, '2025-06-20 10:30:00', 37000), (130000, 7, '2025-06-21 14:00:00', 120000), (NULL, 8, '2025-06-22 16:45:00', 27000), (88000, 9, '2025-06-23 19:00:00', 85000), (22000, 10, '2025-06-24 08:15:00', 20000);
INSERT INTO pago (idPago, metodo) VALUES (6, 'Tarjeta'), (7, 'Transferencia'), (8, 'Efectivo'), (9, 'MercadoPago'), (10, 'Tarjeta');
INSERT INTO venta_directa (pago_idPago, envio_idenvio, publicacion_id, calificacion_venta) VALUES (6, 6, 6, 5), (7, 7, 7, 4), (8, 8, 8, 3), (9, 9, 9, 5), (10, 10, 10, 4);
INSERT INTO historial_ofertas (id, oferta, usuario_DNI, publicacion_id) VALUES (1, 490, 2, 1), (2, 115, 3, 2), (3, 47, 4, 3), (4, 78, 5, 4), (5, 195, 6, 5), (6, 370, 7, 6), (7, 89, 8, 7), (8, 59, 9, 8), (9, 280, 10, 9), (10, 260, 1, 10);

#------------------------------Stored Procedures------------------------------#
#1)
delimiter //
create procedure buscarPublicacion(in productito text)
begin
	select publicacion.id, nombreProducto, categoria from producto join publicacion on idProducto = producto_idProducto join categoria on idcategoria = categoria_idCategoria where nombreProducto = productito;
end //
delimiter ;
call buscarPublicacion("");

#2)------------------------------------------------------------------------------------------------
delimiter //
create procedure crearPublicacion (in idPubli int, in cuantoDuele float, in nivelPubli varchar(45), in estado varchar(45), in idProdu int, in idCat int, in DNI int, in fecha datetime, in titulito text)
begin 
insert into publicacion values(idPubli, cuantoDuele, nivelPubli, estado, idProdu, idCat, DNI, fecha, titulito);
end //
delimiter ;
drop procedure crearPublicacion;
call crearPublicacion(1,500.00,"Publicacion Bronce", "Activa", 1 , 1,1,"2025-05-02","IPhone 16 pro");

delimiter //
create procedure crearSubasta(in ofert int, in idPubli int, in topeFecha datetime, in minOferta int)
begin 
insert into subasta values(ofert, idPubli, topeFecha, minOferta);
end //
delimiter ;
drop procedure crearSubasta;
call crearSubasta(25, 3, "2025-12-12", 15);

delimiter //
create procedure crearVenta(in pagoId int, in envioId int, in publiId int, in calificacion int)
begin 
insert into venta_directa values(pagoId, envioId, publiId, calificacion);
end //
delimiter ;
call crearVenta(1,1,1,5); 	

#3)------------------------------------------------------------------------------------------------
delimiter //
create procedure verPreguntas(in idPubli int)
begin 
select pregunta from preguntas where publicacion_id = idPubli;
end //
delimiter ;
call verPreguntas(5);

#4)------------------------------------------------------------------------------------------------
delimiter //
create procedure actualizarReputacionUsuarios()
begin 
declare hayFilas int default 1;
declare usuario int default 0;
declare promedio1 int default 0;
declare promedio2 int default 0;
declare cursorCalificaciones cursor for select publicacion.usuario_DNI, avg(calificacion_compra), avg(calificacion_venta) from compra join publicacion on publicacion.id = compra.publicacion_id join venta_directa on publicacion.id = venta_directa.publicacion_id group by usuario_DNI; 
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
drop procedure actualizarReputacionUsuarios;
call actualizarReputacionUsuarios();

#------------------------------Stored Functions------------------------------#

#1) 
delimiter //
create function comprarProducto(dni int, idPubli int, metPago int, envio int) returns text deterministic
begin 
declare mensaje text default "";
if (select estado from publicacion) = "Finalizada" then
	set mensaje = "La publicacion no esta activa";
else if (select subasta.publicacion_id from subasta) != null then
	set mensaje = "Es una subasta";
else 
	insert into compra values(null, current_date(), null, dni, idpubli, metPago, envio);
end if;
end if;
return mensaje;
end //
delimiter ;
drop function comprarProducto;
select comprarProducto(1,2,1,1);

#2)------------------------------------------------------------------------------------------------
delimiter //
create function cerrarPublicacion(DNI int) returns text deterministic
begin 
declare msg text default "";
if (select calificacion_compra from compra) is not null then
	delete from publicacion where usuario_DNI = DNI;
    update publicacion set estado = "Finalizada";
else
	set msg = "Tiene calificacion pendiente";
end if;
return msg;
end //
delimiter ;
select cerrarPublicacion(1);

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
create view preguntas_sin_respuesta as select preguntas.pregunta, preguntas.idpregunta, publicacion.idpublicacion, producto.nombre as nombre_producto, usuario.nombre as nombre_usuario from preguntas join publicacion on preguntas.idpublicacion = publicacion.idpublicacion join usuario on preguntas.idusuariocompra = usuario.idusuario join producto on publicacion.idproducto = producto.idproducto where publicacion.estado = 'activa' and preguntas.idpregunta not in (select idpregunta from respuestas);

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

#------------------------------Transacciones------------------------------#

#1)
delimiter //
create procedure crearPublicacion (in idPubli int, in cuantoDuele float, in nivelPubli varchar(45), in estado varchar(45), in tipo text, in idProdu int, in idCat int, in DNI int, in fecha datetime, in titulito text)
begin 
start transaction;
		insert publicacion values(idPubli,cuantoDuele,nivelPuli,estado,tipo,idProdu,idCat,DNI,fecha,titulito);
 if not exists (select publicacion.id from publicacion where id = publicacion.idPubli) then
        commit;
        select "Publicación creada con éxito." as mensaje;
    else
        rollback;
        signal sqlstate '45000' set message_text = "La publicación ya existe.";
    end if;
end;
end //
delimiter ;

delimiter //
create procedure crearSubasta(in ofert int, in idPubli int, in tope datetime, in minimo double)
begin 
start transaction;
insert into subasta values(ofert, idPubli, tope, minimo);
if not exists (select publicacion_id from venta_directa where publicacion_id=idPubli) then 
commit;
        select "subasta creada con éxito." as mensaje;
    else
        rollback;
        signal sqlstate '45000' set message_text = "La publicación es de venta directa";
end if;
end //
delimiter ;

#2)------------------------------------------------------------------------------------------------
delimiter //
create procedure actualizarReputacionUsuarios()
begin 
declare hayFilas int default 1;
declare usuario int default 0;
declare promedio1 int default 0;
declare promedio2 int default 0;
declare promedio3 int default 0;


declare cursorCalificaciones cursor for select usuario_DNI, avg(calificacion_compra), avg(calificacion_vendedor) from publicacion join compra on publicacion.id = publicacion_id group by usuario_DNI; 
declare continue handler for not found set hayFilas = 0;
open cursorCalificaciones;
loopsito:loop
	fetch cursorCalificaciones into usuario, promedio1, promedio2;
    if hayFilas = 0 then 
		leave loopsito;
	end if;
    start transaction;
    set promedio3 =(promedio1 + promedio2) / 2;
    update usuario set reputacion = (promedio1 + promedio2) / 2 where DNI = usuario;
    if promedio3>=1 and promedio3<=5 then
            commit;
	else 
		rollback;
        signal sqlstate '45000' set message_text = "ERROR resultado de reputacion invalido.";
    end if;
    end loop;
    close cursorCalificaciones;
    end //
    delimiter ;