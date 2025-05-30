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

#Definir un procedimiento crearPublicacion que reciba los datos de la publicación e
#inserte una fila en la tabla publicación. Además tiene que recibir el tipo de publicación,
#si es una subasta o una venta directa.
delimiter //
create procedure crearPublicacion (in idPubli int, in cuantoDuele float, in nivelPubli varchar(45), in estado varchar(45), in tipo text)
begin 
insert into publicacion values(idPubli, cuantoDuele, nivelPubli, estado);
if tipo = "Subasta" then 
	insert into subaste values();
else 
	insert into ventaDirecta values();
end if ;
end //
delimiter ;