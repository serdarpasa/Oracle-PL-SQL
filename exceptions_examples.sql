CREATE OR REPLACE PROCEDURE GET_CUSTOMER
(
c_id     IN NUMBER
)
AS
  c_name customer.first_name%type;
  c_cntry customer.country%type;
  
  
BEGIN
SELECT first_name, country INTO c_name, c_cntry
FROM customer
WHERE customer_id = c_id;

DBMS_OUTPUT.PUT_LINE ('Name: ' || c_name);
DBMS_OUTPUT.PUT_LINE ('Country: ' || c_cntry);
EXCEPTION
  WHEN no_data_found THEN
     dbms_output.put_line('No data found!');
  WHEN too_many_rows THEN
    dbms_output.put_line('You got more than 1 row!');
  WHEN others THEN
    dbms_output.put_line('Other Errors!');
END;
/


    
execute get_customer(13);

select * from customer order by customer_id;
