create or replace function p7()
  returns void as
  $$
  declare
    c1 cursor for select Cname, Cbalance, Crlimit, Account from customer;
    customer_name char(20);
    balance NUMERIC(10,2);
    climit NUMERIC(10,2);
    caccount char(5);
    fee NUMERIC(10,2);
    new_balance NUMERIC(10,2);

  begin
  open c1;
  loop
    fetch c1 into customer_name, balance, climit, caccount;
    exit when not found;
    if(balance > climit) then
      fee := (balance - climit) * 0.01;
      new_balance := balance + fee;
      update customer set Cbalance = new_balance where account = caccount;
      raise notice'%,%', customer_name, new_balance;
    end if;
  end loop;
  end;
$$language plpgsql;
