/* create_table.sql*/


create table customer(
cid        number,
name      varchar2(20),
telephone  varchar2(20),
email varchar2(20),
address varchar2(100),
primary key(cid),
check (length(telephone)=10)
);

create table reservation_make(
oid number,
cid number not null,
ordertime date,
arrivetime date,
no_people number,
primary key(oid,cid),
foreign key(cid) references customer(cid) 
on delete cascade
);

create table tables(
tid number,
capacity number,
primary key(tid),
check(capacity=10)
);

create table is_at(
cid number,
tid number,
oid number,
primary key(oid,tid),
foreign key(tid) references tables(tid),
foreign key(oid,cid) references reservation_make(oid,cid) 
on delete cascade
);

/* dishes may have the same name, with different sizes,it could be large or small, the smaller one is cheaper;dishes can not have the same name and the same price*/

create table menu(
dishID  number,
dname  varchar2(200),
price  float,
primary key (dishID),
unique(dname,price),
check(price>0)
);

create table appetizer(
dishID number,
discount varchar2(20),
primary key(dishID),
foreign key (dishID) references menu(dishID) 
on delete cascade
 );

create table soup(
dishID number,
ingredient varchar2(200),
primary key(dishID),
foreign key(dishID) references menu(dishID)
on delete cascade
);

create table fruit_salad(
dishID number,
type_of_fruit varchar2(200),
primary key(dishID),
foreign key(dishID) references menu(dishID)
on delete cascade
);

create table lunch_special(
dishID number,
offering_time varchar2(200),
primary key(dishID),
foreign key(dishID) references menu(dishID)
on delete cascade
);

create table choose(
cid number,
dishID number,
primary key(cid,dishID),
foreign key(dishID) references menu,
foreign key(cid) references customer(cid)
);

create table delivery_to(
deliveryID number,
dtime varchar2(20),
total_price float,
cid number,
primary key(deliveryID,cid),
foreign key(cid) references customer(cid)
on delete cascade
);

create table generate(
cid number,
dishID number,
deliveryID number,
primary key(dishID,deliveryID,cid),
foreign key(dishID) references menu(dishID) on delete cascade,
foreign key(deliveryID,cid) references delivery_to(deliveryID,cid) on delete cascade
);

create table write_comments(
commentID number,
cid number not null,
text varchar2(500),
primary key(cid, commentID),
foreign key(cid) references customer(cid) on delete cascade);

alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';
set pagesize 1000;
set linesize 150;