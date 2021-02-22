create or replace function p8(vendor_num char(5), account_num char(5), tamount NUMERIC(10,2))
  returns void as
  $$
  declare
    transaction_num char(5);
    tdate date;
    customer_name char(20);
    customer_province char(3);
    customer_balance NUMERIC(10,2);
    climit NUMERIC(10,2);
    vendor_name char(20);
    vendor_city char(20);
    vendor_balance NUMERIC(10,2);
    new_num numeric (10,0);
  begin
  select NOW() into tdate;
  select Tno into transaction_num from Transaction order by Tno desc limit 1;
  new_num  := cast(substring(transaction_num from 2 for 4) as int) + 1;
  select cast(new_num as char(10)) into transaction_num;
  select concat('T', transaction_num) into transaction_num;

  if exists (select 1 from Vendor where Vno = vendor_num) then
    if exists (select 1 from Customer where Account = account_num) then
      insert into Transaction values (transaction_num, vendor_num, account_num, tdate, tamount);

      update Customer set Cbalance = Cbalance + tamount where Account = account_num;
      select Cname, Province, Cbalance, Crlimit into customer_name, customer_province, customer_balance, climit from Customer where Account = account_num;

      update Vendor set Vbalance = Vbalance - tamount where Vno = vendor_num;
      select Vname, City, Vbalance into vendor_name, vendor_city, vendor_balance from Vendor where Vno = vendor_num;

      raise notice 'new transaction %, %, %, %, %', transaction_num, vendor_num, account_num, tdate, tamount;
      raise notice 'Customer updated %, %, %, % %', account_num, customer_name, customer_province, customer_balance, climit;
      raise notice 'Vendor updated %, %, %, %', vendor_num, vendor_name, vendor_city, vendor_balance;
      end if;
  end if;

  end;
$$language plpgsql;
