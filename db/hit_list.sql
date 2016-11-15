DROP TABLE IF EXISTS hit_list;

CREATE TABLE hit_list(
  id SERIAL8 primary key,
  name VARCHAR(255),
  danger_level VARCHAR(255),
  species VARCHAR(255),
  favourite_weapon VARCHAR(255),
  last_known_location VARCHAR(255)
);

