#Plantear cómo sería el procedimiento crearPublicacion para que utilice una transacción
#que inserte la publicación y, si corresponde, los datos de la subasta. Si alguna inserción
#falla, se debe hacer rollback. En caso exitoso se debe devolver un mensaje de éxito.

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

#2-Realizar lo anterior pero con el procedimiento actualizarReputacionUsuarios
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
