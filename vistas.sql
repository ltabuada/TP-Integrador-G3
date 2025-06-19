#Crear una vista que muestre todas las preguntas de publicaciones activas que aún no
#tengan respuesta, incluyendo: id de la pregunta, la descripción, la publicación a la que
#pertenece, el nombre del producto y el nombre del usuario que respondió.
CREATE VIEW preguntas_sin_respuesta AS SELECT preguntas.pregunta, preguntas.idPregunta, publicacion.id, producto.nombreProducto, usuario.nombre FROM preguntas JOIN publicacion ON preguntas.publicacion_id = publicacion.id JOIN producto ON publicacion.producto_idProducto = producto.idProducto JOIN usuario ON preguntas.usuario_DNI = usuario.DNI WHERE publicacion.estado = 'activa' AND preguntas.idPregunta NOT IN (SELECT respuestas.preguntas_idPregunta FROM respuestas);
#2. Crear una vista que muestre un top 10 de categorías más presentes en publicaciones de
#esta semana
create view top_10_categorias as select categoria.idCategoria, categoria.categoria, count(publicacion.id) as total_publicaciones from publicacion join categoria on categoria.idCategoria=publicacion.id where week(fechaPublicacion) >= week(current_date()) group by categoria.idCategoria, categoria.categoria order by total_publicaciones DESC LIMIT 10;
#3. Crear una vista que muestre las publicaciones que se encuentran en tendencia el día de
#hoy. Estas serán las que tengan mayor cantidad de preguntas
create view publicacion_tendencia_hoy as select publicacion.id , COUNT(preguntas.idPregunta) AS total_preguntas from publicacion join preguntas on publicacion.id=preguntas.publicacion_id where preguntas.fechaPreguntas = current_date() group by publicacion.id order by total_preguntas desc;
#4. Crear una vista que muestre el nombre del vendedor con mayor reputación por
#categoría. Se debe mostrar nombre del vendedor y nombre de la categoría
create view mejor_vendedor as select usuario.nombre from usuario join publicacion on usuario.DNI=publicacion.usuario_DNI join categoria on categoria.idCategoria=publicacion.categoria_idCategoria where reputacion=(select max(reputacion) from publicacion join usuario on usuario.DNI=publicacion.usuario_DNI where categoria.idCategoria=publicacion.categoria_idCategoria);