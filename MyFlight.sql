create database if not exists flight_reservation;
use flight_reservation;

create table if not exists Airlines(
	airline_id CHAR(2) not null,
    num_aircraft INT,
	num_airport_operates INT,
    name varchar (30),
    primary key	(airline_id)
);
create table if not exists aircrafts (
	aircraft_registration char(6) not null,
    num_seats  INT,
    type varchar(30),
    name varchar (30),
    primary key (aircraft_registration)
);
create table if not exists airports(
	airport_id char(3) not null,
    primary key(airport_id)
);
create table if not exists  flights (
	flight_num char(6)not null,
    days date,
    destination_boundary varchar(15),
    primary key(flight_num)
);
create table if not exists flight_tickets (
	ticket_unique_num char(10)not null,
    senquence INT,
    class varchar(20),
    meal varchar(45),
    seat_number INT,
    fare real,
    primary key (ticket_unique_num)
);
create table if not exists customers (
	customer_id char (8) not null,
    password varchar (45),
    primary key	(customer_id)
);
create table if not exists employee (
	employee_id char (8) not null,
    primary key	(employee_id)
);
create table if not exists admin (
	employee_id char (8) not null,
    password varchar (45),
    primary key	(employee_id),
    foreign key(employee_id) references employee (employee_id) on update cascade on delete cascade);
create table if not exists customer_representatives(
	employee_id char (8) not null,
    password varchar (45),
    primary key	(employee_id),
    foreign key(employee_id) references employee (employee_id) on update cascade on delete cascade
);
create table if not exists via (
	airline_id CHAR(2) not null,
    flight_num char(6) not null,
    primary key (airline_id,flight_num),
    foreign key(airline_id) references Airlines (airline_id) on update cascade on delete cascade,
	foreign key(flight_num) references flights (flight_num) on update cascade on delete cascade
);
create	table if not exists fly (
	airline_id CHAR(2) not null,
    aircraft_registration char(6)not null,
    primary key (airline_id,aircraft_registration),
	foreign key(airline_id) references Airlines (airline_id) on update cascade on delete cascade,
	foreign key(aircraft_registration) references aircrafts (aircraft_registration) on update cascade on delete cascade
);
create table if not exists uses(
	aircraft_registration char(6) not null,
    flight_num char(6) not null,
    primary key (aircraft_registration,flight_num),
    foreign key(aircraft_registration) references aircrafts (aircraft_registration) on update cascade on delete cascade,
    foreign key(flight_num) references flights (flight_num) on update cascade on delete cascade   
);
create table if not exists valid(
	flight_num char(6) not null,
    ticket_unique_num char(10) not null,
	primary key (ticket_unique_num,flight_num),
    foreign key(ticket_unique_num) references flight_tickets (ticket_unique_num) on update cascade on delete cascade,
    foreign key(flight_num) references flights (flight_num) on update cascade on delete cascade  
);
create table if not exists arrive_at (
	flight_num char(6)not null,
    airport_id char(3) not null,
    arrival_time date,
    primary key (airport_id,flight_num),
    foreign key(airport_id) references airports (airport_id) on update cascade on delete cascade,
    foreign key(flight_num) references flights (flight_num) on update cascade on delete cascade
);
create table if not exists depart_from(
	flight_num char(6) not null,
    airport_id char(3) not null,
    departure_time date,
    primary key (airport_id,flight_num),
    foreign key(airport_id) references airports (airport_id) on update cascade on delete cascade,
    foreign key(flight_num) references flights (flight_num) on update cascade on delete cascade
);
create table if not exists buys (
	customer_id char (8) not null,
    ticket_unique_num char(10) not null,
    booking_fees real,
    purchase_time date,
    purchase_date date,
    primary key (customer_id,ticket_unique_num),
    foreign key(ticket_unique_num) references flight_tickets (ticket_unique_num) on update cascade on delete cascade,
    foreign key(customer_id) references customers (customer_id) on update cascade on delete cascade
);
create table if not exists is_has_waiting_list (
	flight_num char(6) not null,
    customer_id char (8) not null,
    primary key (customer_id,flight_num),
    foreign key(customer_id) references customers (customer_id) on update cascade on delete cascade,
    foreign key(flight_num) references flights (flight_num) on update cascade on delete cascade   
);
create table if not exists make_book_have__list_Reservation(
	employee_id char (8) not null,
    customer_id char (8) not null,
    flight_num char(6) not null,
    ticket_unique_num char(10) not null,
    primary key (employee_id,customer_id,flight_num,ticket_unique_num),
    foreign key(customer_id) references customers (customer_id) on update cascade on delete cascade,
    foreign key(flight_num) references flights (flight_num) on update cascade on delete cascade,
    foreign key(ticket_unique_num) references flight_tickets (ticket_unique_num) on update cascade on delete cascade,
    foreign key(employee_id) references customer_representatives (employee_id) on update cascade on delete cascade
);
