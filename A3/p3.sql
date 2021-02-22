create or replace function p3(caccount char, name char, cprovince char, climit INTEGER)
  returns table (account_number char(5), customer_name char(20), customer_province char(3), customer_balance NUMERIC(10,2), credit_limit INTEGER) as
  $$
  declare

  begin
  INSERT INTO Customer
  VALUES (caccount, name, cprovince, 0.00, climit);
  return query select* from Customer;
  end;
$$language plpgsql;
