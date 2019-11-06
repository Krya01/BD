/*1 задание*/
CREATE TABLE t_caterer (
	id_caterer int NOT NULL,
    names varchar(100) NOT NULL,
    address varchar(100)  NOT NULL,
    phone varchar(12) NOT NULL,
    fax varchar(100) NOT NULL,
    CONSTRAINT pk_caterer PRIMARY KEY (id_caterer)
);
CREATE TABLE t_store(
    id_store int NOT NULL,
    names varchar(100) NOT NULL,
    CONSTRAINT pk_store PRIMARY KEY (id_store)
);
CREATE TABLE t_messure(
    id_messure int NOT NULL,
    names varchar(4) NOT NULL,
    CONSTRAINT pk_messure PRIMARY KEY (id_messure)
);
CREATE TABLE t_employer(
    id_employer int NOT NULL,
    surname varchar(100) NOT NULL,
    names varchar(100) NOT NULL,
    father_name varchar(100) NOT NULL,
    CONSTRAINT pk_employer PRIMARY KEY (id_employer)
);
CREATE TABLE t_material(
    id_material int NOT NULL,
    names varchar(100) NOT NULL,
    id_messure int NOT NULL,
    CONSTRAINT pk_material PRIMARY KEY (id_material),
    CONSTRAINT fk_material_messure FOREIGN KEY (id_messure)
        REFERENCES t_messure (id_messure) ON DELETE CASCADE
);
CREATE TABLE t_supply(
    id_caterer int NOT NULL,
    id_material int NOT NULL,
    id_store int NOT NULL,
    supply_date date,
    volume int NOT NULL,
    id_supply int NOT NULL,
    CONSTRAINT pk_supply PRIMARY KEY (id_supply),
    CONSTRAINT fk_supply_caterer FOREIGN KEY (id_caterer)
        REFERENCES t_caterer (id_caterer) ON DELETE CASCADE,
    CONSTRAINT fk_supply_material FOREIGN KEY (id_material)
        REFERENCES t_material (id_material) ON DELETE CASCADE,
    CONSTRAINT fk_supply_store FOREIGN KEY (id_store)
        REFERENCES t_store (id_store) ON DELETE CASCADE
);
CREATE TABLE t_section(
    id_section int NOT NULL,
    names varchar(100) NOT NULL,
    id_employer int NOT NULL,
    supply_date date,
    volume int NOT NULL,
    CONSTRAINT pk_section PRIMARY KEY (id_section),
    CONSTRAINT fk_section_employer FOREIGN KEY (id_employer)
        REFERENCES t_employer (id_employer) ON DELETE CASCADE
);
CREATE TABLE t_deliver(
    id_deliver int NOT NULL,
    id_material int NOT NULL,
    id_store int NOT NULL,
    id_section int NOT NULL,
    deliver_date date,
    CONSTRAINT pk_deliver PRIMARY KEY (id_deliver),
    CONSTRAINT fk_deliver_material FOREIGN KEY (id_material)
        REFERENCES t_material (id_material) ON DELETE CASCADE,
    CONSTRAINT fk_deliver_section FOREIGN KEY (id_section)
        REFERENCES t_section (id_section) ON DELETE CASCADE,
    CONSTRAINT fk_deliver_store FOREIGN KEY (id_store)
        REFERENCES t_store (id_store) ON DELETE CASCADE
);
CREATE TABLE t_inprice(
    id_material int NOT NULL,
    price_date date NOT NULL,
    price int NOT NULL,
    id_inprice int NOT NULL,
    CONSTRAINT pk_inprice PRIMARY KEY (id_inprice),
    CONSTRAINT fk_inprice_material FOREIGN KEY (id_material)
        REFERENCES t_material (id_material) ON DELETE CASCADE
);
CREATE TABLE t_surplus(
    id_material int NOT NULL,
    id_store int NOT NULL,
    volume int NOT NULL,
    id_surplus int NOT NULL,
    CONSTRAINT pk_surplus PRIMARY KEY (id_surplus),
    CONSTRAINT fk_surplus_material FOREIGN KEY (id_material)
        REFERENCES t_material (id_material) ON DELETE CASCADE,
    CONSTRAINT fk_surplus_store FOREIGN KEY (id_store)
        REFERENCES t_store (id_store) ON DELETE CASCADE
);
/*2 задание*/
ALTER TABLE t_caterer
DROP COLUMN address,
/*legal - юр   actual - физ*/
ADD legal_address varchar(100) NOT NULL,
ADD actual_address varchar(100) NOT NULL,
ADD email varchar(100) NOT NULL;
/*3 задание*/
ALTER TABLE t_inprice
DROP CONSTRAINT pk_inprice,
ADD CONSTRAINT pk_material_price_date PRIMARY KEY (id_material, price_date);
/*4 задание*/
CREATE TABLE t_group(
    id_group int NOT NULL,
    names varchar(100) NOT NULL,
    id_material int NOT NULL,
    CONSTRAINT pk_group PRIMARY KEY (id_group),
    CONSTRAINT fk_group_material FOREIGN KEY (id_material)
		 REFERENCES t_material (id_material) ON DELETE CASCADE
);
/*5 задание*/