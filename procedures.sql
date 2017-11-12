DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_city`(
    IN p_city_id INT(6),
    IN p_name VARCHAR(45),
    IN p_state VARCHAR(45),
    IN p_url VARCHAR(200)
)
BEGIN
    insert into city (
        city_id,
        name,
        state,
        url
    )
    values (
        p_city_id
        p_name,
        p_state,
        p_url
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_city_metal`(
    IN p_name VARCHAR(45),
    IN p_state VARCHAR(45),
    in p_metal INT(6)
)
BEGIN

    UPDATE city SET metal = p_metal WHERE name = p_name AND state = p_state;

END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_postalcode`(
    IN p_postalcode_id INT(6),
    IN p_city_id INT(6),
    IN p_postalcode INT(5)
)
BEGIN

    insert into postalcode (
        postalcode_id,
        city_id,
        postalcode
    )
    values (
        p_postalcode_id,
        p_city_id,
        p_postalcode
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_paper`(
    IN p_magazine TINYINT(1),
    IN p_book TINYINT(1),
    IN p_mixed_paper TINYINT(1),
    IN p_paper_bag TINYINT(1),
    IN p_newspaper TINYINT(1),
    IN p_phone_book TINYINT(1),
    IN p_paper_carton TINYINT(1),
    IN p_corrugated_cardboard TINYINT(1)
)
BEGIN
    insert into paper (
        magazine,
        book,
        mixed_paper,
        paper_bag,
        newspaper,
        phone_book,
        paper_carton,
        corrugated_cardboard
    )
    values (
        p_magazine,
        p_book,
        p_mixed_paper,
        p_paper_bag,
        p_newspaper,
        p_phone_book,
        p_paper_carton,
        p_corrugated_cardboard
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_metal`(
    IN p_aluminum_can TINYINT(1),
    IN p_aluminum_foil TINYINT(1),
    IN p_steel_can TINYINT(1),
    IN p_tin_can TINYINT(1)
)
BEGIN
    insert into metal (
        aluminum_can,
        aluminum_foil,
        steel_can,
        tin_can
    )
    values (
        p_aluminum_can,
        p_aluminum_foil,
        p_steel_can,
        p_tin_can
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_plastic`(
    IN p_jar TINYINT(1),
    IN p_jug TINYINT(1),
    IN p_bottle TINYINT(1),
    IN p_rigid_plastic TINYINT(1) 
)
BEGIN
    insert into plastic (
        jar,
        jug,
        bottle,
        rigid_plastic
    )
    values (
        p_jar,
        p_jug,
        p_bottle,
        p_rigid_plastic
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_glass`(
    IN p_bottle TINYINT(1),
    IN p_jar TINYINT(1)
)
BEGIN
    insert into glass (
        bottle,
        jar
    )
    values (
        p_bottle,
        p_jar
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_bulb`(
    IN p_incandescent TINYINT(1),
    IN p_led TINYINT(1),
    IN p_fluorescent TINYINT(1)
)
BEGIN
    insert into bulb (
        incandescent,
        led,
        fluorescent
    )
    values (
        p_bulb_id,
        p_incandescent,
        p_led,
        p_fluorescent
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_battery`(
    IN p_car TINYINT(1),
    IN p_button TINYINT(1),
    IN p_household TINYINT(1),
    IN p_rechargable TINYINT(1)
)
BEGIN
    insert into battery (
        car,
        button,
        household,
        rechargable
    )
    values (
        p_car,
        p_button,
        p_household,
        p_rechargable
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_electronic`(
    IN p_electronic_id INT(6),
    IN p_television TINYINT(1),
    IN p_monitor TINYINT(1),
    IN p_laptop TINYINT(1),
    IN p_desktop TINYINT(1),
    IN p_cell_phone TINYINT(1),
    IN p_microwave TINYINT(1)
)
BEGIN
    insert into electronic (
        electronic_id,
        television,
        monitor,
        laptop,
        desktop,
        cell_phone,
        microwave
    )
    values (
        p_electronic_id,
        p_television,
        p_monitor,
        p_laptop,
        p_desktop,
        p_cell_phone,
        p_microwave
    );
END$$
DELIMITER ;


SHOW PROCEDURE STATUS WHERE Db = DATABASE();