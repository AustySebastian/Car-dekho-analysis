SELECT * FROM car_dekho.car_table;
select * from car_table limit 7885,1;
alter table car_table add column torque_avg varchar(50);
update car_table set torque_avg=case when torque<100 then 'low' when torque>300 then 'high' else 'medium' end;
create temporary table new1 select company, year, selling_price, km_driven, fuel, seller_type, transmission, owner, mileage, engine, max_power, torque, seats, name, km_driven_cat, mileage_set, torque_avg from car_table group by company, year, selling_price, km_driven, fuel, seller_type, transmission, owner, mileage, engine, max_power, torque, seats, name, km_driven_cat, mileage_set, torque_avg;
select * from new1;
delete from car_table;
insert into car_table select * from new1;
select * from car_table;
create table car_table1 (company varchar(50),selling_price int,year int,fuel varchar(50),mileage int);
insert into car_table1 select company,selling_price,year,fuel,mileage from car_table;
describe car_table;
select * from car_table;
alter table car_table add column current_date1 date;
update car_table set current_date1=current_date();
select current_date1 from car_table;
select year(current_date1) from car_table;
set sql_safe_updates=0;
alter table car_table modify column max_power_cat varchar(50);
update car_table set max_power_cat=case when max_power<1000 then 'low power' when max_power>2000 then 'high power' else 'medium power' end;
select mileage_set,avg(selling_price) from car_table group by mileage_set;

select max_power_cat,avg(selling_price) from car_table group by max_power_cat order by avg(selling_price);
select max_power_cat,avg(mileage) from car_table group by max_power_cat order by avg(mileage);
select max_power_cat,avg(selling_price),avg(mileage) from car_table group by max_power_cat order by avg(selling_price);
select km_driven_cat,avg(selling_price) from car_table group by km_driven_cat;

select km_driven_cat,count(*) from car_table group by km_driven_cat;
select year,count(*) from car_table group by year order by count(*)desc;
select torque_avg,avg(max_power) from car_table group by torque_avg;

select torque_avg,avg(selling_price) from car_table group by torque_avg;

select seats,count(*) from car_table group by seats;

select seats,count(*),avg(selling_price) from car_table group by seats order by avg(selling_price)desc limit 1;
select * from car_table where torque>700;

select seats,avg(selling_price) from car_table group by seats;

select transmission,avg(selling_price) from car_table group by transmission;

select company,count(*) from car_table group by company;

select company,count(*) as count1,avg(selling_price) from car_table group by company order by avg(selling_price);

SELECT 
    company, COUNT(*)
FROM
    car_table
GROUP BY company
ORDER BY COUNT(*) DESC;
select company,avg(max_power) from car_table group by company order by avg(max_power)desc; 