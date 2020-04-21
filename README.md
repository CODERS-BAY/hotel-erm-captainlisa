# Hotel-ERM
A database has to be implemented for a hotel business. Draw the following facts in an ER diagram in Chen notation and create a relational model No zero values are allowed. Use the attribute names in brackets.
Hotel rooms are uniquely identified by a number (NUMBER). It is also stored whether it is a single room or a double room (PERSONS). Each room is assigned to a category. Categories have a unique ID (ID) and a description (NAME).
Employees are identified by a unique social security number (SVNR). Name (NAME) and address (ADDRESS) of the employee are also known. Room attendants and caretakers are employees. The system stores which room is cleaned by which room attendant. For caretakers, a subject area (e.g. sauna, masseur, swimming pool, kitchen, ...) is also stored.
A guest has a unique customer number (CustomerNR), a name, (NAME) and an address (ADDRESS). A guest can make several bookings. A booking depends on the room and on a date of arrival (FROM) and departure (TO).
The hotel also offers service packages. A unique designation (DESIGN) and a price (PRICE) are stored. There are basic packages and luxury packages. A luxury package contains at least one or more basic packages. Any number of different service packages can be ordered for each booking, whereby the quantity ( QUANTITY) must also be noted. For each service package, one or more carers are responsible.

## ERM

![ER-Model](hotel-erm.jpeg)

![Hotel ERM](hotel2.jpeg)

## Relational Model

* Hotel Room (**roomnumber:int**, *cleaning_plan_id:int*, *reservation_ID:int*, *category_ID:int*, num_of_persons:int)
* Category (**category_ID:int**, designation:varchar(32), price:double)
* Employee (**SVNR:int**, *schedule_id:int*, *package_allo_ID:int*, *cleaning_plan_id:int*, first_name:varchar(32), last_name:varchar(32), street:varchar(32), city:varchar(32), zip_code:varchar(5), country:varchar(20), role:varchar(32), is_carer:boolean)
* Customer (**customer_ID:int**, *reservation_ID:int*, first_name:varchar(32), last_name:varchar(32), street:varchar(32), city:varchar(32), zip_code:varchar(5), country:varchar(20))
* Cleaning Plan (**cleaning_plan_id:int**, SVNR:int, roomnumber:int, date_cleaned:date)
* Booking Plan (**reservation_ID:int**, roomnumber:int, package_ID:int, arrival:date, departure:date, nr_guests:int, package_quantity:int)
* Package (**package_ID:int**, *package_plan_id:int*, *package_allo_ID:int*, designation:varchar(32), price:double)
* Package Plan (**package_plan_id:int**, package_ID:int, contained_package:int, is_luxury:boolean, is_basic:boolean)
* Package Allocation (**package_allo_ID:int**, package_ID:int, SVNR:int)
* Subject Area (**subject_area_ID:int**, *schedule_id:int*, designation:varchar(32), location:varchar(32))
* Schedule (**schedule_id:int**, SVNR:int, subject_area_ID:int)

## Hotel Schema

![Hotel](hotel_schema.jpg)