drop procedure if exists test_var;
delimiter //
create procedure test_var()
begin
	declare var2 int default 1;
    set var2 = var2+1;
    set @var2 = @var2 +1;
    select var2, @var2;
    end//
delimiter ;

set @var2=1;

call test_var();
