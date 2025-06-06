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
    select reputacion int repVendedor from usuario join publicacion on usuario_DNI = usuario.DNI;
    if (repComprador is null && repVendedor is null) then
	end if;
		
end //
delimiter ;

-- 3
delimiter //
create trigger cambiarCategoria after insert on venta_directa for each row
begin
	select count(*) from 
	if () then
end //
delimiter ;