create or replace function p1(name char)
  returns table (Vendor char(20), Transaction_date date, Transaction_Amount NUMERIC(10,2)) as
  $$
  declare
    account_num char(5);
  begin
    select Account into account_num from Customer;
    return query select Vname, T_date, Amount from Transaction natural join Vendor where Account = account_num;
  end;
$$language plpgsql;
