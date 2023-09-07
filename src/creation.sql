-- drop table product, pc, laptop, printer;

create table product (
    maker varchar(50),
    model varchar(50) unique,
    type varchar (10),
    primary key (model)
);
create table pc (
    code SERIAL primary key,
    model varchar(50),
    speed int,
    ram int,
    hd float,
    cd varchar(5),
    price decimal,
    foreign key (model) references product (model)
);
create table laptop (
    code SERIAL primary key,
    model varchar(50),
    speed int,
    ram int,
    hd float,
    price decimal,
    screen int,
    foreign key (model) references product (model)
);
create table printer (
    code SERIAL primary key,
    model varchar(50),
    color char(1),
    type varchar(10),
    price decimal,
    foreign key (model) references product (model)
)