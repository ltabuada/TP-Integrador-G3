INSERT INTO usuario (DNI, nombre, apellido, nivel, reputacion, email, facturacion) VALUES (12345678, 'Juan', 'Pérez', 'Normal', 0, 'juan.perez@email.com', 1500), (23456789, 'María', 'Gómez', 'Normal', 0, 'maria.gomez@email.com', 3200), (34567890, 'Carlos', 'Ramírez', 'Normal', 0, 'carlos.ramirez@email.com', 2800), (45678901, 'Lucía', 'Fernández', 'Normal', 0, 'lucia.fernandez@email.com', 1200), (56789012, 'Pedro', 'Martínez', 'Normal', 0, 'pedro.martinez@email.com', 2100), (67890123, 'Ana', 'López', 'Normal', 0, 'ana.lopez@email.com', 4500), (78901234, 'Diego', 'Sánchez', 'Normal', 0, 'diego.sanchez@email.com', 950), (89012345, 'Sofía', 'Torres', 'Normal', 0, 'sofia.torres@email.com', 3000), (90123456, 'Andrés', 'Vega', 'Normal', 0, 'andres.vega@email.com', 3900), (12340987, 'Valeria', 'Castro', 'Normal', 0, 'valeria.castro@email.com', 1700);
INSERT INTO producto (idProducto, nombreProducto, descripcion, usuario_DNI) VALUES (1, 'Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 12345678), (2, 'Notebook Lenovo', 'Portátil de 15 pulgadas con procesador Intel i7', 23456789), (3, 'Smartphone Samsung', 'Celular Android con pantalla AMOLED', 34567890), (4, 'Impresora HP', 'Impresora multifunción a color', 45678901), (5, 'Teclado Mecánico', 'Teclado retroiluminado para gaming', 56789012), (6, 'Mouse Inalámbrico', 'Mouse ergonómico con sensor óptico', 67890123), (7, 'Monitor 24"', 'Monitor Full HD con tecnología IPS', 78901234), (8, 'Tablet Android', 'Tablet de 10 pulgadas ideal para multimedia', 89012345), (9, 'Cámara Web', 'Cámara HD para videollamadas y streaming', 90123456), (10, 'Disco Externo 1TB', 'Almacenamiento portátil USB 3.0', 12340987);
INSERT INTO categoria VALUES (1, 'Tecnología'), (2, 'Hogar'), (3, 'Deportes'), (4, 'Moda'), (5, 'Juguetes'), (6, 'Electrodomésticos'), (7, 'Libros'), (8, 'Jardinería'), (9, 'Salud'), (10, 'Automóviles');
INSERT INTO publicacion (id, precio, nivelPublicacion, estado, producto_idProducto, categoria_idCategoria, usuario_DNI) VALUES (1, 500.00, 'Publicación Platino', 'activa', 1, 1, 1), (2, 75.00, 'Publicación Plata', 'finalizada', 2, 2, 2), (3, 120.00, 'Publicación Oro', 'activa', 3, 3, 3), (4, 45.00, 'Publicación Bronce', 'activa', 4, 4, 4), (5, 30.00, 'Publicación Oro', 'finalizada', 5, 5, 5), (6, 40.00, 'Publicación Plata', 'activa', 6, 6, 6), (7, 15.00, 'Publicación Bronce', 'activa', 7, 7, 7), (8, 22.00, 'Publicación Bronce', 'finalizada', 8, 8, 8), (9, 600.00, 'Publicación Platino', 'activa', 9, 9, 9), (10, 18.00, 'Publicación Plata', 'finalizada', 10, 10, 10);
INSERT INTO respuestas (idRespuesta, respuesta, preguntas_idPregunta) VALUES (1, 'Sí, tiene garantía por 12 meses.', 1), (2, 'Tenemos tallas 40 al 44.', 2), (3, 'No, es bastante silenciosa.', 3), (4, 'Sí, producto 100% original.', 4), (5, 'Tiene 350 páginas.', 5), (6, 'Sí, incluye batería recargable.', 6), (7, 'Vence en diciembre 2026.', 7), (8, 'Sí, es apta para piel sensible.', 8), (9, 'Incluye 3 juegos.', 9), (10, 'Sí, sirve para cualquier color.', 10);
INSERT INTO preguntas (idPregunta, pregunta, usuario_DNI, publicacion_id) VALUES (1, '¿Viene con garantía?', 2, 1), (2, '¿Qué tallas tiene?', 3, 2), (3, '¿Hace mucho ruido?', 4, 3), (4, '¿Es original?', 5, 4), (5, '¿Cuántas páginas tiene?', 6, 5), (6, '¿Incluye batería?', 7, 6), (7, '¿Tiene vencimiento?', 8, 7), (8, '¿Es para piel sensible?', 9, 8), (9, '¿Qué juegos incluye?', 10, 9), (10, '¿Sirve para cualquier color?', 1, 10);
INSERT INTO subasta (oferta, Publicacion_id) VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
INSERT INTO venta_directa (pago_idPago, envio_idenvio, publicacion_id) VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
INSERT INTO envio (idEnvio, direccion, empresa) VALUES (1,'Calle Falsa 123',1),(2,'Av. Siempreviva 742',0),(3,'Calle Luna 456',1),(4,'Calle Sol 789',1),(5,'Av. Central 101',0),(6,'Pasaje Norte 88',1),(7,'Av. Sur 55',0),(8,'Boulevard Este 77',1),(9,'Calle Oeste 22',0),(10,'Diagonal 9',1);
INSERT INTO pago (idPago, metodo) VALUES (1,'Tarjeta'),(2,'Efectivo'),(3,'Transferencia'),(4,'Tarjeta'),(5,'PayPal'),(6,'Transferencia'),(7,'Efectivo'),(8,'Crédito'),(9,'Tarjeta'),(10,'Crédito');



#Definir un procedimiento buscarPublicacion que reciba el nombre de un producto y
#muestre todas las publicaciones en las cuales está incluido ese producto. Mostrando el
#id_publicacion, nombre producto, nombre categoría a la que pertenece y el precio de
#publicación
delimiter //
create procedure buscarPublicacion(in productito text)
begin
	select publicacion.id, nombreProducto, categoria from producto join publicacion on idProducto = producto_idProducto join categoria on idcategoria = categoria_idCategoria where nombreProducto = productito;
end //
delimiter ;
call buscarPublicacion("TV42");


#Definir un procedimiento crearPublicacion que reciba los datos de la publicación e
#inserte una fila en la tabla publicación. Además tiene que recibir el tipo de publicación,
#si es una subasta o una venta directa.
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

#Crear un procedimiento llamado verPreguntas que muestre todas las preguntas de una publicación.
delimiter //
create procedure verPreguntas(in idPubli int)
begin 
select pregunta from preguntas where publicacion_id = idPubli;
end //
delimiter ;
call verPreguntas(1);
#Crear un procedimiento actualizarReputacionUsuarios que para cada usuario calcule el promedio de
#las calificaciones recibidas en las ventas realizadas (tanto como vendedor y comprador)
# y actualice el campo reputación con ese promedio (en escala 0-100).Usar cursores.
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



	
	
    
	
