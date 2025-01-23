CREATE TABLE movie (
    mov_id INT PRIMARY KEY,
    mov_title VARCHAR(255),
    mov_year INT,
    mov_time INT,
    mov_lang VARCHAR(50),
    mov_dt_rel DATE,
    mov_rel_country VARCHAR(50)
);
INSERT INTO movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES
(901, 'Vertigo', 1958, 128, 'English', '1958-08-24', 'UK'),
(902, 'The Innocents', 1961, 100, 'English', '1962-02-19', 'SW'),
(903, 'Lawrence of Arabia', 1962, 216, 'English', '1962-12-11', 'UK'),
(904, 'The Deer Hunter', 1978, 183, 'English', '1979-03-08', 'UK'),
(905, 'Amadeus', 1984, 160, 'English', '1985-01-07', 'UK'),
(906, 'Blade Runner', 1982, 117, 'English', '1982-09-09', 'UK'),
(907, 'Eyes Wide Shut', 1999, 159, 'English', NULL, 'UK'),
(908, 'The Usual Suspects', 1995, 106, 'English', '1995-08-25', 'UK'),
(909, 'Chinatown', 1974, 130, 'English', '1974-08-09', 'UK'),
(910, 'Boogie Nights', 1997, 155, 'English', '1998-02-16', 'UK'),
(911, 'Annie Hall', 1977, 93, 'English', '1977-04-20', 'USA'),
(912, 'Princess Mononoke', 1997, 134, 'Japanese', '2001-10-19', 'UK'),
(913, 'The Shawshank Redemption', 1994, 142, 'English', '1995-02-17', 'UK'),
(914, 'American Beauty', 1999, 122, 'English', NULL, 'UK'),
(915, 'Titanic', 1997, 194, 'English', '1998-01-23', 'UK'),
(916, 'Good Will Hunting', 1997, 126, 'English', '1998-06-03', 'UK'),
(917, 'Deliverance', 1972, 109, 'English', '1982-10-05', 'UK'),
(918, 'Trainspotting', 1996, 94, 'English', '1996-02-23', 'UK'),
(919, 'The Prestige', 2006, 130, 'English', '2006-11-10', 'UK'),
(920, 'Donnie Darko', 2001, 113, 'English', NULL, 'UK'),
(921, 'Slumdog Millionaire', 2008, 120, 'English', '2009-01-09', 'UK'),
(922, 'Aliens', 1986, 137, 'English', '1986-08-29', 'UK'),
(923, 'Beyond the Sea', 2004, 118, 'English', '2004-11-26', 'UK'),
(924, 'Avatar', 2009, 162, 'English', '2009-12-17', 'UK'),
(926, 'Seven Samurai', 1954, 207, 'Japanese', '1954-04-26', 'JP'),
(927, 'Spirited Away', 2001, 125, 'Japanese', '2003-09-12', 'UK'),
(928, 'Back to the Future', 1985, 116, 'English', '1985-12-04', 'UK'),
(925, 'Braveheart', 1995, 178, 'English', '1995-09-08', 'UK');

CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,
    rev_name VARCHAR(255)
);

INSERT INTO reviewer (rev_id, rev_name) VALUES
(9001, 'Righty Sock'),
(9002, 'Jack Malvern'),
(9003, 'Flagrant Baronessa'),
(9004, 'Alec Shaw'),
(9005, NULL),  
(9006, 'Victor Woeltjen'),
(9007, 'Simon Wright'),
(9008, 'Neal Wruck'),
(9009, 'Paul Monks'),
(9010, 'Mike Salvati'),
(9011, NULL),  
(9012, 'Wesley S. Walker'),
(9013, 'Sasha Goldshtein'),
(9014, 'Josh Cates'),
(9015, 'Krug Stillo'),
(9016, 'Scott LeBrun'),
(9017, 'Hannah Steele'),
(9018, 'Vincent Cadena'),
(9019, 'Brandt Sponseller'),
(9020, 'Richard Adams'); 

CREATE TABLE movie_reviews (
    mov_id INT,
    rev_id INT,
    rev_stars DECIMAL(3, 2),
    num_o_ratings INT
);


INSERT INTO movie_reviews (mov_id, rev_id, rev_stars, num_o_ratings) VALUES
(901, 9001, 8.40, 263575),
(902, 9002, 7.90, 20207),
(903, 9003, 8.30, 202778),
(906, 9005, 8.20, 484746),
(924, 9006, 7.30, NULL),
(908, 9007, 8.60, 779489),
(909, 9008, NULL, 227235),
(910, 9009, 3.00, 195961),
(911, 9010, 8.10, 203875),
(912, 9011, 8.40, NULL),
(914, 9013, 7.00, 862618),
(915, 9001, 7.70, 830095),
(916, 9014, 4.00, 642132),
(925, 9015, 7.70, 81328),
(918, 9016, NULL, 580301),
(920, 9017, 8.10, 609451),
(921, 9018, 8.00, 667758),
(922, 9019, 8.40, 511613),
(923, 9020, 6.70, 13091);


--1
SELECT mov_title, mov_year
FROM movie;

--2
SELECT mov_year
FROM movie
WHERE mov_title = 'American Beauty';

--3
SELECT mov_title
from movie
WHERE mov_year=1999

--4

SELECT mov_title
FROM movie
WHERE mov_year < 1998;

--5

SELECT reviewer.rev_name
FROM reviewer
UNION
SELECT movie.mov_title
FROM movie;


--8
SELECT mov_title
FROM movie
WHERE mov_id IN (905, 907, 917);