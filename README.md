# Hotel-ERM
A database has to be implemented for a hotel business. Draw the following facts in an ER diagram in Chen notation and create a relational model No zero values are allowed. Use the attribute names in brackets.
Hotel rooms are uniquely identified by a number (NUMBER). It is also stored whether it is a single room or a double room (PERSONS). Each room is assigned to a category. Categories have a unique ID (ID) and a description (NAME).
Employees are identified by a unique social security number (SVNR). Name (NAME) and address (ADDRESS) of the employee are also known. Room attendants and caretakers are employees. The system stores which room is cleaned by which room attendant. For caretakers, a subject area (e.g. sauna, masseur, swimming pool, kitchen, ...) is also stored.
A guest has a unique customer number (CustomerNR), a name, (NAME) and an address (ADDRESS). A guest can make several bookings. A booking depends on the room and on a date of arrival (FROM) and departure (TO).
The hotel also offers service packages. A unique designation (DESIGN) and a price (PRICE) are stored. There are basic packages and luxury packages. A luxury package contains at least one or more basic packages. Any number of different service packages can be ordered for each booking, whereby the quantity ( QUANTITY) must also be noted. For each service package, one or more carers are responsible.

## ERM

![ER-Model](hotel-erm.jpeg)

## Relational Model

* Hotel Room (**Room-Number:int**, _category-ID:int_ num_of_persons:int)
* Category (**Category-ID:int**, name:varchar(32), price:double)
* Employee (**SVNR:int**,  name:varchar(32), address:varchar(32), role:varchar(32), carer_package:boolean)
* Customer (**Customer-Nr:int**, name:varchar(32), address:varchar(32))
* Cleaning Plan (**_SVNR-Employee:int_**, **_Room-Number:int_**, date_cleaned:date)
* Booking Plan (**Reservation-Nr:int**, _customerNR:int_, _Room-Number:int_, _package-ID:int_, arrival:date, departure:date, nr_guests:int, package_quantity:int)
* Package (**Package-ID:int**, designation:varchar(32), price:double)
* Package Plan (**_Package-ID:int_**, is_luxury:boolean, is_basic:boolean)
* Package Allocation (**_Package-ID:int_**, **_SVNR-Employee:int_**)
* Subject Area (**Subject-Area-ID:int**, name:varchar(32), location:varchar(32))
* Schedule (**_SVNR-Employee:int_**, **_Subject-Area-ID:int_**)
