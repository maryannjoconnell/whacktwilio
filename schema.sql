CREATE DATABASE Whack;

CREATE TABLE  Whack.city (
    city_id INT(6)PRIMARY KEY,
    name VARCHAR(45),
    state VARCHAR(45),
    url VARCHAR(200),
    metal INT(6) DEFAULT 0,
	paper INT(6) DEFAULT 0,
	glass INT(6) DEFAULT 0,
	plastic INT(6) DEFAULT 0,
	battery INT(6) DEFAULT 0,
	bulb INT(6) DEFAULT 0,
	electronic INT(6) DEFAULT 0
);

CREATE TABLE Whack.postalcode (
	postalcode_id INT(6) PRIMARY KEY,
	city_id INT(6) NOT NULL,
	postalcode INT(5)
);

CREATE TABLE Whack.metal (
	metal_id INT(6) PRIMARY KEY,
	aluminum_can TINYINT(1) DEFAULT 0,
	aluminum_foil TINYINT(1) DEFAULT 0,
	steel_can TINYINT(1) DEFAULT 0,
	tin_can TINYINT(1) DEFAULT 0
);

CREATE TABLE Whack.paper (
	paper_id INT(6) PRIMARY KEY,
	magazine TINYINT(1) DEFAULT 0,
	book TINYINT(1) DEFAULT 0,
	mixed_paper TINYINT(1) DEFAULT 0,
	paper_bag TINYINT(1) DEFAULT 0,
	newspaper TINYINT(1) DEFAULT 0,
	phone_book TINYINT(1) DEFAULT 0,
	paper_carton TINYINT(1) DEFAULT 0,
	corrugated_cardboard TINYINT(1) DEFAULT 0
);

CREATE TABLE Whack.glass (
	glass_id INT(6) PRIMARY KEY,
	bottle TINYINT(1) DEFAULT 0,
	jar TINYINT(1) DEFAULT 0
);

CREATE TABLE Whack.plastic (
	plastic_id INT(6) PRIMARY KEY,
	jar TINYINT(1) DEFAULT 0,
	jug TINYINT(1) DEFAULT 0,
	bottle TINYINT(1) DEFAULT 0,
	rigid_plastic TINYINT(1) DEFAULT 0
);

CREATE TABLE Whack.battery (
	battery_id INT(6) PRIMARY KEY,
	car TINYINT(1) DEFAULT 0,
	button TINYINT(1) DEFAULT 0,
	household TINYINT(1) DEFAULT 0,
	rechargable TINYINT(1) DEFAULT 0
);

CREATE TABLE Whack.bulb (
	bulb_id INT(6) PRIMARY KEY,
	incandescent TINYINT(1) DEFAULT 0,
	led TINYINT(1) DEFAULT 0,
	fluorescent TINYINT(1) DEFAULT 0
);

CREATE TABLE Whack.electronic (
	electronic_id INT(6) PRIMARY KEY,
	television TINYINT(1) DEFAULT 0,
	monitor TINYINT(1) DEFAULT 0,
	laptop TINYINT(1) DEFAULT 0,
	desktop TINYINT(1) DEFAULT 0,
	cell_phone TINYINT(1) DEFAULT 0,
	microwave TINYINT(1) DEFAULT 0
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
