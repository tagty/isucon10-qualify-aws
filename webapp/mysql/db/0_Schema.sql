DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id              INTEGER                                      NOT NULL PRIMARY KEY,
    name            VARCHAR(64)                                  NOT NULL,
    description     VARCHAR(4096)                                NOT NULL,
    thumbnail       VARCHAR(128)                                 NOT NULL,
    address         VARCHAR(128)                                 NOT NULL,
    latitude        DOUBLE PRECISION                             NOT NULL,
    longitude       DOUBLE PRECISION                             NOT NULL,
    point           POINT AS (POINT(latitude, longitude)) STORED NOT NULL,
    rent            INTEGER                                      NOT NULL,
    door_height     INTEGER                                      NOT NULL,
    door_width      INTEGER                                      NOT NULL,
    features        VARCHAR(64)                                  NOT NULL,
    popularity      INTEGER                                      NOT NULL,
    popularity_desc INTEGER AS (-popularity)                     NOT NULL
);

CREATE TABLE isuumo.chair
(
    id              INTEGER                  NOT NULL PRIMARY KEY,
    name            VARCHAR(64)              NOT NULL,
    description     VARCHAR(4096)            NOT NULL,
    thumbnail       VARCHAR(128)             NOT NULL,
    price           INTEGER                  NOT NULL,
    height          INTEGER                  NOT NULL,
    width           INTEGER                  NOT NULL,
    depth           INTEGER                  NOT NULL,
    color           VARCHAR(64)              NOT NULL,
    features        VARCHAR(64)              NOT NULL,
    kind            VARCHAR(64)              NOT NULL,
    popularity      INTEGER                  NOT NULL,
    popularity_desc INTEGER AS (-popularity) NOT NULL,
    stock           INTEGER                  NOT NULL
);

ALTER TABLE isuumo.estate ADD INDEX index_rent_and_id_on_estate(rent, id);
ALTER TABLE isuumo.estate ADD INDEX index_popularity_desc_and_id_on_estate(popularity_desc, id);
ALTER TABLE isuumo.estate ADD SPATIAL INDEX index_point_on_estate(point);
ALTER TABLE isuumo.estate ADD INDEX index_rent_and_door_height_on_estate(rent, door_height);
ALTER TABLE isuumo.estate ADD INDEX index_rent_and_door_width_on_estate(rent, door_width);

ALTER TABLE isuumo.chair ADD INDEX index_price_and_id_on_chair(price, id);
ALTER TABLE isuumo.chair ADD INDEX index_popularity_desc_and_id_on_chair(popularity_desc, id);
ALTER TABLE isuumo.chair ADD INDEX index_price_and_stock_on_chair(price, stock);
ALTER TABLE isuumo.chair ADD INDEX index_height_and_stock_on_chair(height, stock);
ALTER TABLE isuumo.chair ADD INDEX index_kind_and_stock_on_chair(kind, stock);
