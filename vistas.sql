#Crear una vista que muestre todas las preguntas de publicaciones activas que aún no
#tengan respuesta, incluyendo: id de la pregunta, la descripción, la publicación a la que
#pertenece, el nombre del producto y el nombre del usuario que respondió.
create view preguntas_sin_respuesta as select pregunta.pregunta, idpregunta, publicacion.idpublicacion, producto.nombre as nombre, usuario.nombre as n from pregunta join publicacion on pregunta.idpublicacion=publicacion.idpublicacion join usuario on pregunta.idusuariocompra=idusuario join producto on idusuario=producto.idusuariocreador where estado="activa" and idpregunta NOT IN (SELECT idpregunta FROM respuesta);
#2. Crear una vista que muestre un top 10 de categorías más presentes en publicaciones de
#esta semana
create view top_10_categorias as select categoria.idcategoria, categoria.nombre, count(publicacion.idpublicacion) as total_publicaciones from publicacion join categoria on categoria.idcategoria=publicacion.idcategoria where week(fechaPublicacion) >= week(current_date()) group by categoria.idcategoria, categoria.nombre order by total_publicaciones DESC LIMIT 10;
#3. Crear una vista que muestre las publicaciones que se encuentran en tendencia el día de
#hoy. Estas serán las que tengan mayor cantidad de preguntas
create view publicacion_tendencia_hoy as select publicacion.idpublicacion , COUNT(pregunta.idpregunta) AS total_preguntas from publicacion join pregunta on publicacion.idpublicacion=pregunta.idpublicacion where pregunta.fechaPregunta = current_date() group by publicacion.idpublicacion order by total_preguntas desc;
#4. Crear una vista que muestre el nombre del vendedor con mayor reputación por
#categoría. Se debe mostrar nombre del vendedor y nombre de la categoría
create view mejor_vendedor as select usuario.nombre from usuario join publicacion on usuario.idusuario=publicacion.idusuariovendedor join categoria on categoria.idcategoria=publicacion.idcategoria where reputacion=(select max(reputacion) from publicacion join usuario on usuario.idusuario=publicacion.idusuariovendedor where categoria.idcategoria=publicacion.idcategoria); 