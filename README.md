# WHACK


### Dependencies to install:
```
pip install flask-mysql
```

### Start sql:
```
mysql -u root -p
```

### See all database columns:
```
SELECT * FROM city;
SELECT * FROM metal;
SELECT * FROM paper;
SELECT * FROM glass;
SELECT * FROM plastic;
SELECT * FROM battery;
SELECT * FROM bulb;
SELECT * FROM electronic;
```

### Example command to add city:
```
CALL add_city(1, "Worcester", "MA", "http://www.worcesterma.gov");
```
