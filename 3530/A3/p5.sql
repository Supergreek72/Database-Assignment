create or replace function q5() returns void as $$
    declare 
        vNum varchar;
        tA numeric(10, 2);
        vName varchar;
        vBal numeric(10,2);
        c1 cursor for select Vno, Amount from T;
        c2 cursor for select Vno, V.Vname, VBalance from V;
    begin 

        open c1; 
        open c2;
        loop 
            fetch c1 into vNum, tA;
            exit when not found; 
            update V set Vbalance = Vbalance + tA 
            where vNum=Vno;
        end loop;
         
        loop 
            fetch c2 into vName, vNum, vBal;
            exit when not found; 
            raise notice 'Vno is %,  VName is %,  Vbalance is %', vName, vNum, vBal;
        end loop;
        close c2;
        close c1;

    end;
$$ language plpgsql;
