# database
CREATE DATABASE bai_1

USE bai_1


# users table
CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(100),
	email VARCHAR(255),
	pwd VARCHAR(15)
)
INSERT INTO users(full_name, email, pwd) VALUES
('John Doe', 'john.doe@example.com', 'password1'),
('Jane Smith', 'jane.smith@example.com', 'password2'),
('Michael Johnson', 'michael.johnson@example.com', 'password3'),
('Emily Brown', 'emily.brown@example.com', 'password4'),
('David Wilson', 'david.wilson@example.com', 'password5'),
('Sarah Martinez', 'sarah.martinez@example.com', 'password6'),
('James Taylor', 'james.taylor@example.com', 'password7'),
('Jennifer Garcia', 'jennifer.garcia@example.com', 'password8'),
('Robert Miller', 'robert.miller@example.com', 'password9'),
('Linda Davis', 'linda.davis@example.com', 'password10');


# restaurants table
CREATE TABLE restaurants(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(100),
	image VARCHAR(255),
	description VARCHAR(255)
)
INSERT INTO restaurants (res_name, image, description) VALUES
('The Gourmet Kitchen', 'image1.jpg', 'Fine dining experience with international cuisine.'),
('Sunset Bistro', 'image2.jpg', 'Casual dining with a beautiful sunset view.'),
('Green Garden Cafe', 'image3.jpg', 'Organic and vegan-friendly dishes.'),
('Sea Breeze Diner', 'image4.jpg', 'Seafood specialties with a coastal ambiance.'),
('Mountain View Grill', 'image5.jpg', 'Rustic grill with mountain views.'),
('Urban Eats', 'image6.jpg', 'Modern fusion dishes in a vibrant setting.'),
('Cozy Corner', 'image7.jpg', 'Comfort food in a cozy environment.'),
('Elegant Eats', 'image8.jpg', 'Sophisticated dining with elegant decor.'),
('Pasta Palace', 'image9.jpg', 'Authentic Italian pasta dishes.'),
('Taco Fiesta', 'image10.jpg', 'Lively atmosphere with traditional Mexican tacos.');

# like_res table
CREATE TABLE like_res(
	like_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id), -- thiet lap khoa ngoai cho column user_id va tham chieu den column user_id cua table users
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurants(res_id),
	date_like DATE
)
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2023-06-01'),
(1, 2, '2023-06-02'),
(2, 3, '2023-06-03'),
(2, 4, '2023-06-04'),
(4, 5, '2023-06-05'),
(4, 6, '2023-06-06'),
(4, 7, '2023-06-07'),
(5, 8, '2023-06-08'),
(6, 9, '2023-06-09'),
(6, 10, '2023-06-10'),
(1, 10, '2023-06-01'),
(2, 2, '2023-06-02'),
(5, 4, '2023-06-03'),
(4, 4, '2023-06-04'),
(8, 8, '2023-06-05'),
(5, 6, '2023-06-06'),
(9, 7, '2023-06-07'),
(8, 1, '2023-06-08'),
(9, 9, '2023-06-09'),
(10, 10, '2023-06-10');


# rate_res table
CREATE TABLE rate_res(
	rate_res_id INT PRIMARY KEY AUTO_INCREMENT,
	amount INT,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurants(res_id),
	date_rate DATE
)
INSERT INTO rate_res (amount, user_id, res_id, date_rate) VALUES
(5, 1, 2, '2023-07-01'),
(4, 2, 2, '2023-07-02'),
(3, 4, 2, '2023-07-03'),
(5, 4, 4, '2023-07-04'),
(2, 5, 5, '2023-07-05'),
(4, 6, 6, '2023-07-06'),
(3, 7, 7, '2023-07-07'),
(5, 8, 5, '2023-07-08'),
(4, 9, 9, '2023-07-09'),
(5, 10, 9, '2023-07-10'),
(5, 1, 5, '2023-07-01'),
(4, 2, 4, '2023-07-02'),
(3, 5, 7, '2023-07-03'),
(5, 4, 2, '2023-07-04'),
(2, 5, 3, '2023-07-05'),
(4, 6, 9, '2023-07-06'),
(3, 7, 7, '2023-07-07'),
(5, 8, 8, '2023-07-08'),
(4, 9, 9, '2023-07-09'),
(5, 5, 10, '2023-07-10');

# foods table
CREATE TABLE foods(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(100),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	FOREIGN KEY(type_id) REFERENCES food_type(type_id)
)
INSERT INTO foods (food_name, image, price, description, type_id) VALUES
('Margherita Pizza', 'margherita_pizza.jpg', 8.99, 'Classic Italian pizza with tomatoes, mozzarella, and basil.', 1),
('Tacos', 'tacos.jpg', 5.99, 'Traditional Mexican tacos with beef, lettuce, and cheese.', 2),
('Sushi Roll', 'sushi_roll.jpg', 12.99, 'Assorted sushi rolls with fresh fish and vegetables.', 3),
('Kung Pao Chicken', 'kung_pao_chicken.jpg', 9.99, 'Spicy stir-fry Chinese dish with chicken, peanuts, and vegetables.', 4),
('Chicken Curry', 'chicken_curry.jpg', 11.99, 'Rich and creamy Indian chicken curry with spices.', 5),
('Croissant', 'croissant.jpg', 3.49, 'Flaky French pastry with butter.', 1),
('Greek Salad', 'greek_salad.jpg', 7.49, 'Fresh Mediterranean salad with tomatoes, cucumbers, olives, and feta cheese.', 7),
('Pad Thai', 'pad_thai.jpg', 10.49, 'Traditional Thai noodle dish with shrimp, peanuts, and lime.', 5),
('Cheeseburger', 'cheeseburger.jpg', 8.49, 'American-style cheeseburger with beef, cheese, and pickles.', 6),
('Pho', 'pho.jpg', 9.49, 'Vietnamese noodle soup with beef, herbs, and lime.', 7),
('Lasagna', 'lasagna.jpg', 10.99, 'Italian pasta dish with layers of meat, cheese, and sauce.', 1),
('Enchiladas', 'enchiladas.jpg', 7.99, 'Mexican dish with rolled tortillas, chicken, and sauce.', 2),
('Tempura', 'tempura.jpg', 8.99, 'Japanese dish with deep-fried seafood and vegetables.', 3),
('Sweet and Sour Pork', 'sweet_sour_pork.jpg', 9.49, 'Chinese dish with pork, bell peppers, and pineapple.', 4),
('Lamb Vindaloo', 'lamb_vindaloo.jpg', 12.49, 'Spicy Indian curry with lamb and potatoes.', 5),
('Crepes', 'crepes.jpg', 6.49, 'Thin French pancakes with sweet or savory fillings.', 6),
('Falafel', 'falafel.jpg', 6.99, 'Mediterranean deep-fried chickpea balls with tahini sauce.', 1),
('Green Curry', 'green_curry.jpg', 11.49, 'Thai curry with chicken, coconut milk, and green chilies.', 5),
('BBQ Ribs', 'bbq_ribs.jpg', 14.49, 'American-style barbeque ribs with smoky sauce.', 2),
('Spring Rolls', 'spring_rolls.jpg', 5.99, 'Vietnamese fresh spring rolls with shrimp and vegetables.', 7),
('Risotto', 'risotto.jpg', 13.49, 'Italian creamy rice dish with mushrooms and Parmesan.', 1),
('Churros', 'churros.jpg', 4.99, 'Mexican fried dough pastry with cinnamon sugar.', 2),
('Ramen', 'ramen.jpg', 9.99, 'Japanese noodle soup with pork, eggs, and seaweed.', 3),
('Dim Sum', 'dim_sum.jpg', 8.49, 'Chinese small steamed or fried dumplings.', 4),
('Butter Chicken', 'butter_chicken.jpg', 12.99, 'Indian chicken dish in a creamy tomato sauce.', 5);

# food_type talbe
CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(100)
)
INSERT INTO food_type (type_name) VALUES
('Italian'),
('Mexican'),
('Japanese'),
('Chinese'),
('Thai'),
('American'),
('Vietnamese');

# sub_food table
CREATE TABLE sub_food(
	sub_food_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(100),
	sub_price FLOAT,
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES foods(food_id)
)
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Extra Cheese', 1.50, 1),
('Guacamole', 2.00, 2),
('Wasabi', 0.75, 3),
('Extra Sauce', 1.25, 4),
('Naan Bread', 2.50, 5),
('Butter', 0.50, 6),
('Feta Cheese', 1.75, 7),
('Peanuts', 1.00, 8),
('Bacon', 2.00, 9),
('Herbs', 0.50, 10);

# orders table
CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES foods(food_id),
	amount INT,
	order_code VARCHAR(100),
	arr_sub_id VARCHAR(100)
)

INSERT INTO orders (user_id, food_id, amount, order_code, arr_sub_id) VALUES
(1, 1, 2, 'ORDER001', '1,2'),
(1, 2, 1, 'ORDER002', '3'),
(4, 3, 3, 'ORDER003', '4'),
(4, 4, 1, 'ORDER004', '5'),
(5, 5, 2, 'ORDER005', '6,7'),
(6, 6, 1, 'ORDER006', '8'),
(7, 7, 2, 'ORDER007', '9,10'),
(8, 8, 3, 'ORDER008', '1,2,3'),
(9, 9, 1, 'ORDER009', '4'),
(10, 10, 2, 'ORDER010', '5,6'),
(1, 11, 1, 'ORDER011', '7'),
(1, 12, 2, 'ORDER012', '8,9'),
(4, 13, 1, 'ORDER013', '10'),
(5, 14, 3, 'ORDER014', '1,2,3'),
(9, 15, 1, 'ORDER015', '4'),
(10, 16, 2, 'ORDER016', '5,6'),
(7, 17, 1, 'ORDER017', '7'),
(9, 18, 2, 'ORDER018', '8,9'),
(9, 19, 3, 'ORDER019', '10,1');

select * from users
select * from restaurants
select * from food_type
select * from foods
select * from orders
select * from rate_res
select * from like_res

-- cau 1: Tìm 5 người đã like nhà hàng nhiều nhất
SELECT COUNT(u.user_id), u.full_name FROM like_res AS lr
INNER JOIN users AS u
ON u.user_id = lr.user_id
GROUP BY u.full_name
ORDER BY COUNT(u.user_id) DESC
LIMIT 5

-- cau 2: Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT COUNT(res.res_id), res.res_name FROM like_res AS lr
INNER JOIN restaurants AS res
ON lr.res_id = res.res_id
GROUP BY res.res_name
ORDER BY COUNT(res.res_id) DESC
LIMIT 2

-- cau 3: Tìm người đã đặt hàng nhiều nhất
SELECT COUNT(u.user_id) as counts, u.full_name FROM orders AS o
INNER JOIN users AS u
ON o.user_id = u.user_id
GROUP BY u.full_name
ORDER BY counts DESC
LIMIT 1

-- cau 4: Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng).
SELECT * FROM users AS u
LEFT JOIN orders as o
ON o.user_id = u.user_id
LEFT JOIN like_res as lr
ON lr.user_id = u.user_id
LEFT JOIN rate_res as rr
ON rr.user_id = u.user_id
WHERE o.user_id IS NULL AND lr.user_id IS NULL AND rr.user_id IS NULL


