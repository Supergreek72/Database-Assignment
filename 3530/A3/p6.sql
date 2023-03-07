create or replace function q6() returns void as $$
    declare 
        vName varchar;
        vNumber varchar;
        fee numeric(10,2);
        vBal numeric(10,2);
        c1 cursor for select Vno, V.Vname, VBalance 
        from V;
    begin 
        open c1; 
        loop 
            fetch c1 into vNumber, vName, vBal;
            exit when not found; 
            fee = vBal * 0.025;
            update V set Vbalance = Vbalance - fee 
            where V.Vno = vNumber;
            select Vbalance into vBal from V where V.Vno = vNumber;
            raise notice 'Vname is % Vbalance is % Fee is %', vName, vBal, fee;
        end loop;
        close c1;

    end;
$$ language plpgsql;