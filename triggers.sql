-- 1
delimiter //
create trigger borrarPreguntas before delete on publicacion for each row 
begin
	delete from preguntas where idPublicacion = old.id;
end //
delimiter ;

-- 2
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


-- 3
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
