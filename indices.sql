#1-Crear un índice en la tabla de publicaciones para acelerar la búsqueda por nombre de producto
create index indexFKproducts on publicacion(producto_idProducto);
create index FindNames on producto(nombreProducto);
#2-Crear un índice para asegurar que no se repitan direcciones de correo electrónico en la tabla de usuarios.
create unique index dontRepeatEmail on usuario(email);
#3-Crear un índice para optimizar las consultas frecuentes sobre publicaciones activas, pausadas o finalizadas.
create index statusAPF on publicacion(estado);


