use BikeStores;

select ord.order_id
,CONCAT(cus.first_name, ' ', cus.last_name) as 'customers'
,cus.city
,cus.state 
,ord.order_date
,SUM(it.quantity) as 'total_units'
,SUM(it.quantity * it.list_price) as 'revenue'
,pro.product_name
,cat.category_name
,b.brand_name
,sto.store_name
,CONCAT(sta.first_name, ' ', sta.last_name) as 'sales_rep' 
From sales.orders ord
LEFT JOIN sales.customers cus with (nolock) on ord.customer_id = cus.customer_id
LEFT JOIN sales.order_items it with (nolock) on ord.order_id = it.order_id
LEFT JOIN production.products pro with (nolock) on pro.product_id = it.product_id
LEFT JOIN production.brands b with (nolock) on pro.brand_id = b.brand_id
LEFT JOIN production.categories cat with (nolock) on cat.category_id = pro.category_id
LEFT JOIN sales.stores sto with (nolock) on ord.store_id = sto.store_id
LEFT JOIN sales.staffs sta with (nolock) on sta.staff_id = ord.staff_id
group by ord.order_id
,pro.product_name
,cat.category_name
,b.brand_name
,sto.store_name
,cus.city
,cus.state 
,ord.order_date
,CONCAT(cus.first_name, ' ', cus.last_name)
,CONCAT(sta.first_name, ' ', sta.last_name)

