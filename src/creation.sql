drop table produkt, pc, laptop, printer;

create table produkt (
    maker varchar(50),
    model varchar(50),
    type varchar (10)
);
create table pc (
    maker varchar(50),
    model varchar(50),
    type varchar(10),
    speed integer,
    ram integer,
    hd float,
    cd varchar(5),
    price money
);
create table laptop (
    maker varchar(50),
    model varchar(50),
    type varchar(10),
    speed integer,
    ram integer,
    hd float,
    price money,
    screen integer
);
create table printer (
    maker varchar(50),
    model varchar(50),
    type varchar(10),
    color char,
    printmode varchar(10),
    price money
)