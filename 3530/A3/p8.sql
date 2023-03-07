create or replace function q8(vNum char(20),aNum char(20),amo NUMERIC(10,2)) returns void as $$ 
    
    declare
        vNumber character varying;
        aNumber character varying;
        tNumber character varying;
        count_T INTEGER;
        am NUMERIC(10,2);
        genDate DATE;
        c1 cursor for select Vno from V where Vno = vNum;
        c2 cursor for select Account from C where Account = aNum;
        c3 cursor for select count(*) as count_T From T;
       
    begin 
		open c1;
        open c2;
        open c3;
        fetch c1 into vNumber;
        fetch c2 into aNumber;
        fetch c3 into count_T;
        if(vNumber is NULL or aNumber is NULL) Then
            raise notice 'vNumber or Account number is null';
        else
            raise notice 'vNumber is %, Account number is %',vNumber,aNumber;
            count_T = count_T + 1;
            tNumber = CONCAT('T',CAST(count_T AS varchar)); 
            genDate = CAST( NOW() AS Date );
            INSERT INTO T VALUES (tNumber,vNum,aNumber,genDate,amo);
            raise notice 'The new Transaction is: Tno: %, Vno: %, Account: %, T_Date: %, Amount: %', tNumber,vNum,aNumber,genDate,amo;
            update V set Vbalance = Vbalance + amo 
            where V.Vno = vNumber;
            update C set Cbalance = Cbalance + amo 
            where Account = aNumber;
        end if;


        

        close c3;
        close c1;
        close c2;
        
	end; 



$$ language plpgsql;