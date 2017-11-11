CREATE DATABASE Whack;

CREATE TABLE  Whack.city (
    city_id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    state VARCHAR(45),
    url VARCHAR(200),
    metal INT(6) DEFAULT NULL,
	paper INT(6) DEFAULT NULL,
	glass INT(6) DEFAULT NULL,
	plastic INT(6) DEFAULT NULL,
	battery INT(6) DEFAULT NULL,
	bulb INT(6) DEFAULT NULL,
	electronic INT(6) DEFAULT NULL
);

CREATE TABLE Whack.postalcode (
	postalcode_id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	city_id INT(6) NOT NULL,
	postalcode INT(5) UNIQUE
);


CREATE TABLE Whack.metal (
	metal_id INT(6) PRIMARY KEY,
	aluminum_can TINYINT(1) DEFAULT NULL,
	aluminum_foil TINYINT(1) DEFAULT NULL,
	steel_can TINYINT(1) DEFAULT NULL,
	tin_can TINYINT(1) DEFAULT NULL
);

CREATE TABLE Whack.paper (
	paper_id INT(6) PRIMARY KEY,
	magazine TINYINT(1) DEFAULT NULL,
	book TINYINT(1) DEFAULT NULL,
	mixed_paper TINYINT(1) DEFAULT NULL,
	paper_bag TINYINT(1) DEFAULT NULL,
	newspaper TINYINT(1) DEFAULT NULL,
	phone_book TINYINT(1) DEFAULT NULL,
	paper_carton TINYINT(1) DEFAULT NULL,
	corrugated_cardboard TINYINT(1) DEFAULT NULL
);

CREATE TABLE Whack.glass (
	glass_id INT(6) PRIMARY KEY,
	bottle TINYINT(1) DEFAULT NULL,
	jar TINYINT(1) DEFAULT NULL
);

CREATE TABLE Whack.plastic (
	plastic_id INT(6) PRIMARY KEY,
	jar TINYINT(1) DEFAULT NULL,
	jug TINYINT(1) DEFAULT NULL,
	bottle TINYINT(1) DEFAULT NULL,
	rigid_plastic TINYINT(1) DEFAULT NULL
);

CREATE TABLE Whack.battery (
	battery_id INT(6) PRIMARY KEY,
	car TINYINT(1) DEFAULT NULL,
	button TINYINT(1) DEFAULT NULL,
	household TINYINT(1) DEFAULT NULL,
	rechargable TINYINT(1) DEFAULT NULL
);

CREATE TABLE Whack.bulb (
	bulb_id INT(6) PRIMARY KEY,
	incandescent TINYINT(1) DEFAULT NULL,
	led TINYINT(1) DEFAULT NULL,
	fluorescent TINYINT(1) DEFAULT NULL
);

CREATE TABLE Whack.electronic (
	electronic_id INT(6) PRIMARY KEY,
	television TINYINT(1) DEFAULT NULL,
	monitor TINYINT(1) DEFAULT NULL,
	laptop TINYINT(1) DEFAULT NULL,
	desktop TINYINT(1) DEFAULT NULL,
	cell_phone TINYINT(1) DEFAULT NULL,
	microwave TINYINT(1) DEFAULT NULL
);

use Whack;
show tables;
describe city;
describe postalcode;
describe metal;
describe paper;
describe glass;
describe plastic;
describe battery;
describe bulb;
describe electronic;
