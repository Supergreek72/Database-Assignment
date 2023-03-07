create or replace function q4() returns void as $$
    declare 
        loopA varChar;
        aNum varchar;
        cName varchar;
        a numeric(10,2);
        vName varchar;
        c1 cursor for select distinct Account from C;
        c2 refcursor;
    begin 

        open c1; 
        loop 
            fetch c1 into loopA; 
            exit when not found;

            open c2 for select C.Account, C.Cname, V.Vname, T.Amount,T.T_date 
            from V Natural Join C Natural Join T 
            where C.Account = T.Account and T.Vno=V.Vno and C.Account = loopA order by T_date desc LIMIT 1;

            fetch c2 into aNum, cName, vName, a;

            if(aNum is NULL or cName is NULL) then 
                raise notice 'Account % has no transactions', loopA;
            else 
                raise notice 'Account is %,  Customer is %,  Amount is %,  Vendor is %', aNum, cName, a, vName;
            end if;

            close c2;
        end loop;
        close c1;

    end;
$$ language plpgsql;