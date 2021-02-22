create or replace function p2(name char)
  returns table (customer_number char(5), customer_name char(20), customer_province char(3)) as
  $$
  declare
    vendor_name char(20);
  begin
    select Vname into vendor_name from Vendor;
    return query select Account, Cname, Province from Customer natural join Vendor where Vname = vendor_name;
  end;
$$language plpgsql;
