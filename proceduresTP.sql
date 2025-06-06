INSERT INTO usuario VALUES (1, 'Juan', 'Perez', 'juanperez@mail.com', 'Experto', 85), (2, 'Maria', 'Lopez', 'marialopez@mail.com', 'Intermedio', 72), (3, 'Carlos', 'Gomez', 'carlosgomez@mail.com', 'Avanzado', 78), (4, 'Laura', 'Fernández', 'laura.fernandez@mail.com', 'Básico', 45), (5, 'Pedro', 'Martínez', 'pedromartinez@mail.com', 'Experto', 90), (6, 'Ana', 'Torres', 'anatorres@mail.com', 'Intermedio', 67), (7, 'Jorge', 'Díaz', 'jorgediaz@mail.com', 'Básico', 52), (8, 'Lucía', 'Méndez', 'luciamendez@mail.com', 'Avanzado', 80), (9, 'Esteban', 'Paredes', 'estebanp@mail.com', 'Experto', 95), (10, 'Camila', 'Suárez', 'camilasuarez@mail.com', 'Básico', 60);
INSERT INTO producto VALUES(1, 'TV42', 'Televisor LED 42 pulgadas', 1),(2, 'PS5', 'Consola PlayStation 5', 2),(3, 'CELU13', 'iPhone 13 128GB', 3),(4, 'NOTE9', 'Notebook Lenovo i5', 4),(5, 'AURX', 'Auriculares Bluetooth', 5), (6, 'CAMCAN', 'Cámara Canon Reflex', 6),(7, 'TABLET8', 'Tablet Samsung 8"', 7),(8, 'DRONX', 'Dron con cámara 4K', 8),(9, 'SMTV', 'Smart TV 55"', 9),(10, 'IMAC24', 'iMac 24"', 10);
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
create procedure crearPublicacion (in idPubli int, in cuantoDuele float, in nivelPubli varchar(45), in estado varchar(45), in tipo text)
begin 
insert into publicacion values(idPubli, cuantoDuele, nivelPubli, estado);#agregar lo q falta
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
#4 Crear un procedimiento actualizarReputacionUsuarios que para cada usuario calcule el promedio de las calificaciones recibidas en las ventas realizadas (tanto como vendedor y comprador)
# y actualice el campo reputación con ese promedio (en escala 0-100).Usar cursores.
delimiter //
create procedure actualizarReputacionUsuarios()
begin 
declare hayFilas int default 1;
declare promedio1 int default 0;
declare promedio2 int default 0;



end //
delimiter ;


	
	
    
	
