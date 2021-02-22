create or replace function p4()
  returns void as
  $$
  declare
    c1 cursor for select Cname from Customer;
    customer_name char(20);
    transaction_amount NUMERIC(10,2);
    vendor_name char(20);
  begin
  open c1;
  loop
    fetch c1 into customer_name;
    exit when not found;
    select Amount, Vname into transaction_amount, vendor_name from Transaction natural join Customer Natural join Vendor where Cname = customer_name order by T_date desc limit 1;
    if (vendor_name <> '') then
      raise notice '%,%,%', customer_name, transaction_amount, vendor_name;
    else
      raise notice '%, no transaction', customer_name;
    end if;
  end loop;
  end;
$$language plpgsql;
