select * 
from categories;

select products.id, name, description, sku
from products
     inner join variants on (variants.product_id = products.id)
where category_id = 2
limit 5;


select customers.id, name, phone, sum(price) as total_paid
from customers
     inner join orders on (customers.id = orders.customer_id)
     inner join order_lines on (orders.id = order_lines.order_id)
where customers.deleted_at is null
  and orders.deleted_at is null
  and order_lines.deleted_at is null
  and orders.paid
group by customers.id
having sum(price) > 200;


select distinct min(customers.id) as id, min(name) as name, min(phone) as phone
from orders
     inner join order_lines on (orders.id = order_lines.order_id)
     inner join customers on (customers.id = orders.customer_id)
group by orders.id
having sum(price) > 100;


select *
from products
where category_id 
	in (
	    select id 
	    from categories 
		where category_id = (
		select id 
		from categories 
		where name = 'Dogs' 
		limit 1
	    )
	);


select  product_id,
	rank() over (order by price desc) as price_rating
from variants
order by product_id;


insert into option_values(option_id, name, created_at, updated_at)
select  id as option_id,
	'pink-blue' as name,
	now() as created_At,
	now() as updated_at
from options
where options.name = 'Color';

select name
from categories
where id
	in (
	    select category_id 
	    from products 
	    where id 
		in (
		    select product_id 
		    from variants 
		    where id in (
				 select variant_id 
				 from variant_option_values 
				 where option_value_id = (
							  select id 
							  from option_values 
							  where option_id = (
									     select id 
									     from options 
									     where name = 'Gender' 
									     limit 1) 
								and name = 'male' limit 1
							   )
				)
		   )
	   ) 
	and id 
		in (
		    select category_id 
		    from products 
		    where id 
			in (
			    select product_id 
			    from variants 
			    where id 
				in (
				    select variant_id 
				    from variant_option_values
				    where option_value_id = (
							     select id 
							     from option_values 
							     where option_id = (
										select id 
										from options 
										where name = 'Gender' 
										limit 1) 
								   and name = 'female' limit 1
							     )
				    )
			)
		);
