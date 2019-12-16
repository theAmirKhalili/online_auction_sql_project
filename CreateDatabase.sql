create database online_auction;

use online_auction;

create table member
(
	id int identity(1,1) primary key,
	email varchar(32) not null,
	[name] nvarchar(32),
	[password] nvarchar(32) not null,
	[address] nvarchar(100),
	[phone] varchar(11) not null
);

create table buyer
(
	id int primary key,
	shipping_address varchar(100) not null,
	constraint fk_bm foreign key (id) references member (id)
);

create table seller
(
	id int primary key,
	bank_acc_num varchar(16) not null,
	routing_num varchar(16) not null,
	constraint fk_sm foreign key (id) references member (id)
);

create table category
(
	id int identity(1,1) primary key,
	cat_name nvarchar(100) not null
);

create table item
(
	id int primary key,
	id_seller int,
	title nvarchar(32) not null,
	[description] nvarchar(100),
	starting_bid_price int not null,
	bidding_inc int not null,
	[start_date] datetime not null,
	[end_date] datetime not null,
	id_cat int not null,
	constraint fk_ic foreign key (id_cat) references category(id),
	constraint fk_is foreign key (id_seller) references seller(id),
);

create table bids
(
	id_buyer int,
	id_item int,
	bid_price int not null,
	[time] datetime,
	primary key(id_buyer, id_item, [time]),
	constraint fk_bb foreign key (id_buyer) references buyer(id),
	constraint fk_bi foreign key (id_item) references item(id)
);

create table [transaction]
(
	id_bid int,
	id_item int,
	[time] datetime,
	constraint fk_tb foreign key (id_bid, id_item, [time]) references bids(id_buyer, id_item, [time])
);

create table feedback
(
	id int identity (1,1) primary key,
	id_buyer int not null,
	id_seller int not null,
	rating_buyer int check (rating_buyer >=0 and rating_buyer <= 10) not null,
	rating_seller int check (rating_seller >=0 and rating_seller <= 10) not null,
	comment_buyer nvarchar(100),
	comment_seller nvarchar(100)
);