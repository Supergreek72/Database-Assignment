create or replace function q7() returns void as $$
    declare 
        cAcc varchar;
        fee numeric(10,2);
        cBal numeric(10,2);
        cLimit numeric(10,2);
        cN varchar;
        overlimit numeric(10,2);
        c1 cursor for select Account, Cname, Cbalance, Crlimit from C;
    begin 
        open c1; 
        loop 
            fetch c1 into cAcc, cN, cBal, cLimit;
            exit when not found;
            if (cBal > cLimit) then
                overlimit = cBal - cLimit;
                fee = overlimit * 0.10;
                update C set Cbalance = cBal + fee 
                where C.Account = cAcc;
                select Cbalance into cBal from C 
                where C.Account = cAcc;
                raise notice 'Cname is %, Cbalance is %', cN, cBal;
            end if;

        end loop;
        close c1;

    end;
$$ language plpgsql;