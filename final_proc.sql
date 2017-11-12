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
    
    insert into metal ( city_id )
    values ( p_city_id );
    insert into paper ( city_id )
    values ( p_city_id );
    insert into glass ( city_id )
    values ( p_city_id );
    insert into plastic ( city_id )
    values ( p_city_id );
    insert into battery ( city_id )
    values ( p_city_id );
    insert into bulb ( city_id )
    values ( p_city_id );
    insert into electronic ( city_id )
    values ( p_city_id );
    
END$$
DELIMITER ;