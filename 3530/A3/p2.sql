create or replace function q2(Vender_Name char(20)) returns void as $$
    declare
        C_name Character varying;
        C_num Character varying;
        C_province Character varying;
        c1 cursor for select
        C.Cname, C.Account ,C.Province
        FROM C NATURAL JOIN T NATURAL JOIN V
        WHERE C.Account = t.Account AND t.Vno = V.Vno AND Vender_Name = V.Vname;
	begin 
		
        open c1;
        loop
            fetch c1 into C_name,C_num,C_province;
            exit when not found;
            raise notice 'Cname is %, Account number is %, Province is %',C_name,C_num,C_province;


        end loop;
        close c1;

        
	end;

$$ language plpgsql;