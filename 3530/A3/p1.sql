
create or replace function q1(name char(20)) returns void as $$ 
    declare
        Vender_name Character varying;
        rDate DATE;
        rAmount NUMERIC(10,2);
        c1 cursor for select
        V.Vname, T.T_date ,t.Amount
        FROM C NATURAL JOIN T NATURAL JOIN V
        WHERE C.Account = t.Account AND t.Vno = V.Vno AND name = C.Cname;
	begin 
		
        open c1;
        loop
            fetch c1 into Vender_name,rDate,rAmount;
            exit when not found;
            raise notice 'Vname is %, Date is %, Amount is %',Vender_name,rDate,rAmount;


        end loop;
        close c1;

        
	end; 



$$ language plpgsql;