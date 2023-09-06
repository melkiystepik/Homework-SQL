-- drop table product, pc, laptop, printer;

create table product (
    maker varchar(50),
    model varchar(50) unique,
    type varchar (10),
    primary key (model)
);
create table pc (
    code int unique primary key,
    model varchar(50),
    speed int,
    ram int,
    hd float,
    cd varchar(5),
    price decimal,
    foreign key (model) references product (model)
);
create table laptop (
    code int unique not null primary key,
    model varchar(50),
    speed int,
    ram int,
    hd float,
    price decimal,
    screen int,
    foreign key (model) references product (model)
);
create table printer (
    code int unique not null primary key,
    model varchar(50),
    color char(1),
    type varchar(10),
    price decimal,
    foreign key (model) references product (model)
)
insert into product Values ('Samsung','PC-X1','pc');
insert into product Values ('Sony','PC-S1','pc');
insert into product Values ('Samsung','PC-X2','pc');
insert into product Values ('Samsung','PC-X3','pc');
insert into product Values ('Asus','PC-A1','pc');
insert into product Values ('Asus','PC-A2','pc');
insert into product Values ('Sony','L-S1','laptop');
insert into product Values ('Asus','L-A1','laptop');
insert into product Values ('Asus','L-A2','laptop');
insert into product Values ('Asus','PR-A1','printer');
insert into product Values ('Samsung','PR-X2','printer');
insert into product Values ('Sony','PR-S2','printer');
INSERT INTO laptop VALUES (01,'L-S1',700,1024,250,300,11);
INSERT INTO laptop VALUES (02,'L-A2',2600,4096,500,1200,15);
INSERT INTO laptop VALUES (03,'L-A1',1200,2048,750,1100,13);
INSERT INTO pc VALUES (01,'PC-X1',3600,2048,1000,'12x',750);
INSERT INTO pc VALUES (02,'PC-S1',4200,4096,750,'24x',1200);
INSERT INTO pc VALUES(03,'PC-A1',2600,4096,500,'12x',450);
INSERT INTO pc VALUES(04,'PC-A2',2900,2048,500,'8x',500);
INSERT INTO pc VALUES(05,'PC-X2',4200,4096,1500,'24x',1500);
INSERT INTO pc VALUES(06,'PC-X3',4300,4096,2000,'24x',2000);
INSERT INTO printer VALUES (01,'PR-A1','y','Laser',1100);
INSERT INTO printer VALUES (02,'PR-X2','y','Jet',500);
INSERT INTO printer VALUES (03,'PR-S2','n','Matrix',300);