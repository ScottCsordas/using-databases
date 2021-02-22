create or replace function p5()
  returns void as
  $$
  declare
    c1 cursor for select Vno, sum(Amount) from transaction group by Vno;
    vendor_name char(20);
    total_amount NUMERIC(10,2);
    vendor_num char(5);
    balance NUMERIC(10,2);

  begin
  open c1;
  loop
  fetch c1 into vendor_num, total_amount;
  exit when not found;

  update Vendor set Vbalance = Vbalance + total_amount where Vno = vendor_num;

  select Vname, Vbalance into vendor_name, total_amount from Vendor where Vno = vendor_num;
  raise notice '%,%,%', vendor_num, vendor_name, total_amount;
  end loop;
  end;
$$language plpgsql;
