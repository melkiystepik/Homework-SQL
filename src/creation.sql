-- drop table product, pc, laptop, printer;

create table if not exists product (
    maker varchar(50),
    model varchar(50) unique,
    type varchar (10),
    primary key (model)
);
create table if not exists pc (
    code SERIAL primary key,
    model varchar(50),
    speed int,
    ram int,
    hd real,
    cd varchar(5),
    price decimal,
    foreign key (model) references product (model) on delete cascade
);
create table if not exists laptop (
    code SERIAL primary key,
    model varchar(50),
    speed int,
    ram int,
    hd real,
    price decimal,
    screen int,
    foreign key (model) references product (model) on delete cascade
);
create table if not exists printer (
    code SERIAL primary key,
    model varchar(50),
    color char(1),
    type varchar(10),
    price decimal,
    foreign key (model) references product (model) on delete cascade
)