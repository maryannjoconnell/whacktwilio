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
        url,
        metal,
        paper,
        glass,
        plastic,
        battery,
        bulb,
        electronic
    ) values (
        p_city_id,
        p_name,
        p_state,
        p_url,
        p_city_id,
        p_city_id,
        p_city_id,
        p_city_id,
        p_city_id,
        p_city_id,
        p_city_id
    );
    
    insert into metal ( metal_id )
    values ( p_city_id );
    insert into paper ( paper_id )
    values ( p_city_id );
    insert into glass ( glass_id )
    values ( p_city_id );
    insert into plastic ( plastic_id )
    values ( p_city_id );
    insert into battery ( battery_id )
    values ( p_city_id );
    insert into bulb ( bulb_id )
    values ( p_city_id );
    insert into electronic ( electronic_id )
    values ( p_city_id );
    
END$$
DELIMITER ;