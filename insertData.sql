use online_auction;

insert into member(email, [name], [password], [address], phone)
values ('amir.khalili@iasbs.ac.ir', 'amir','1', 'khorramdarreh, 17 shahrivar', '09120796545'),
		('rezamasomi@iasbs.ac.ir', 'reza', '1', 'mahdasht', '09910739649'),
		('ahmafi@iasbs.ac.ir', 'amirhossein', '1', 'qazvin', '09032603557'),
		('navid.khalili@iasbs.ac.ir', 'navid', '1', 'qazvin', '09369438727'),
		('aryaazimi@iasbs.ac.ir','arya', '1', 'qazvin', '09385014198'),
		('masihhaj@iasbs.ac.ir', 'masih', '1', 'tehran', '09367031046');

insert into buyer(id, shipping_address)
values (1, 'zn'),
		(2, 'kj'),
		(3, 'qz'),
		(4, 'qz'),
		(5, 'qz'),
		(6, 'th');
go

insert into seller(id, bank_acc_num, routing_num)
values	(1, '6104337653519593', '111'),
		(2, '6104000011112222', '122'),
		(3, '6104111122223333', '133'),
		(4, '6104222233334444', '144'),
		(5, '6037997176585504', '155'),
		(6, '6280231303754534', '166');

delete from category
DBCC CHECKIDENT ('category', RESEED, 0);

insert into category(cat_name)
values ('computer,hardware,monitor'),
		('computer,hardware,mouse'),
		('computer,hardware,keyboard'),
		('computer,hardware,case'),
		('computer,hardware,fan'),
		('computer,hardware,power'),
		('electronic,watch'),
		('electronic,tablet'),
		('book,philosophy'),
		('book,science-fiction'),
		('book,drama'),
		('movie,scary'),
		('movie,action');

insert into category(cat_name)
values  ('game,pc'),
         ('game,ps4'),
         ('game,xbox1');



insert into item(id, id_seller, title, [description], starting_bid_price, bidding_inc, [start_date], end_date, id_cat)
values (1, 1, 'LG', 'monitor 18 inch LG', 100, 20, '2007-04-30 20:10:02', '2007-04-30 21:10:02', 1),
		(2, 1, 'harrypotter8','movie +18 drama', 10000, 500, '2019-12-16 20:10:02', '2019-12-17 20:10:02', 13),
		(3, 6, 'hamlet','book philosophy', 100, 20, '2019-12-16 20:10:02', '2019-12-17 20:10:02', 9),
		(4, 5, 'acc_overwatch', 'game +3 for girls', 5, 1,'2019-12-16 20:10:02', '2019-12-17 20:10:02', 14 );



insert into bids(id_buyer, id_item, bid_price, [time])
values 
		(1, 3, 140, '2019-12-17 20:05:02'),
		(1, 4, 10, '2019-12-17 19:10:02'),
		(6, 1, 150, '2007-04-30 20:10:02')
		(6, 3, 160,'2007-04-30 20:07:02'),
		(6, 4, 15,'2019-12-17 19:30:02');


