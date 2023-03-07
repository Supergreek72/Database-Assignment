
create or replace function q3(acc char(20),name char(20),pro Char(3),bal NUMERIC(10,2),lim INTEGER) returns void as $$ 
    
    declare
        a character varying;
        n character varying;
        p character varying;
        b NUMERIC(10,2);
        l INTEGER;
        c1 cursor for select * From C;
    begin 
		
        INSERT INTO C VALUES (acc,name,pro,bal,lim);

        open c1;
        loop
            fetch c1 into a,n,p,b,l;
            exit when not found;
            raise notice 'Account is %, name is %, province is %,balance is %,limit is %',a,n,p,b,l;


        end loop;
        close c1;

        
	end; 



$$ language plpgsql;