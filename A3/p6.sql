create or replace function p6()
  returns void as
  $$
  declare
    c1 cursor for select Vname, Vno, Vbalance from vendor;
    balance NUMERIC(10,2);
    vendor_name char(20);
    vendor_num char(5);
    fee NUMERIC(10,2);
    new_balance NUMERIC(10,2);
  begin
  open c1;
  loop
    fetch c1 into vendor_name, vendor_num, balance;
    exit when not found;
    fee := balance * 0.04;
    new_balance := balance - fee;
    update vendor set Vbalance = new_balance where Vno = vendor_num;
    raise notice '%,%,%', vendor_name, fee, new_balance;
  end loop;
  end;
$$language plpgsql;
