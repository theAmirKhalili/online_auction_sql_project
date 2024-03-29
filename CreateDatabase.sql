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
	constraint fk_bm foreign key (id) references member (id) on delete cascade on update no action
);

create table seller
(
	id int primary key,
	bank_acc_num varchar(16) not null,
	routing_num varchar(16) not null,
	constraint fk_sm foreign key (id) references member (id) on delete cascade on update no action
);

create table category
(
	id int identity(1,1) primary key,
	cat_name nvarchar(100) not null
);

create table item
(
	id int identity(1,1) primary key,
	id_seller int,
	title nvarchar(32) not null,
	[description] nvarchar(100),
	starting_bid_price int not null,
	bidding_inc int not null,
	[start_date] datetime not null,
	[end_date] datetime not null,
	id_cat int not null,
	constraint fk_ic foreign key (id_cat) references category(id) on delete no action on update no action,
	constraint fk_is foreign key (id_seller) references seller(id) on delete no action on update no action
);

create table bids
(
	id int identity(1,1) primary key,
	id_buyer int,
	id_item int,
	bid_price int not null,
	[time] datetime,
	constraint fk_bb foreign key (id_buyer) references buyer(id) on delete no action on update no action,
	constraint fk_bi foreign key (id_item) references item(id) on delete no action on update no action
);

create table [transaction]
(
	id int primary key,
	constraint fk_tb foreign key (id) references bids(id) on delete no action on update no action
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