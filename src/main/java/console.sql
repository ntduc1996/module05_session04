CREATE DATABASE md05_btvn_session04;
USE md05_btvn_session04;

CREATE TABLE category
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    category_name   VARCHAR(100) NOT NULL,
    description     VARCHAR(255),
    category_status BIT
);
INSERT INTO category (category_name, description, category_status)
VALUES ('Thể thao', 'Sản phẩm thể thao', 1),
       ('Giải trí', 'Phim, nhạc, game', 1),
       ('Công nghệ', 'Thiết bị công nghệ', 0),
       ('Thời trang', 'Quần áo, phụ kiện', 1),
       ('Đồ gia dụng', 'Vật dụng gia đình', 0);

DELIMITER &&
CREATE PROCEDURE find_all_category()
BEGIN
SELECT * FROM category;
END ;

CREATE PROCEDURE add_new_category(name_in VARCHAR(100), des_in VARCHAR(255), sta_in BIT)
BEGIN
INSERT INTO category(category_name, description, category_status)
VALUES (name_in,des_in,sta_in);
END ;

CREATE PROCEDURE find_category_by_id(id_in INT)
BEGIN
SELECT * FROM category WHERE id = id_in;
END ;

CREATE PROCEDURE update_category(id_in INT,name_in VARCHAR(100), des_in VARCHAR(255), sta_in BIT)
BEGIN
UPDATE category
SET category_name = name_in,
    description = des_in,
    category_status = sta_in
WHERE id = id_in;
END ;

CREATE PROCEDURE swap_status(id_in INT)
BEGIN
UPDATE category
SET category_status = 1 - category_status WHERE id = id_in;
END ;

CREATE PROCEDURE delete_category(id_in INT)
BEGIN
DELETE FROM category WHERE id = id_in AND category_status = 0;
END;

DELIMITER &&