# ------ EVIDENCIAS --------------
# Alumnx : Eréndira Celis Acosta
# ere.is.not.here@gmail.com
# Módulo 1 - Sesión 7
CREATE DATABASE IF NOT EXISTS bedu_test_2;
# DROP DATABASE IF EXISTS bedu_test_2;
USE bedu_test_2;
CREATE TABLE IF NOT EXISTS users(
id INT PRIMARY KEY,
genero VARCHAR(1),
edad INT,
ocup INT,
cp VARCHAR(20)
);
# --------------------------------------------------
# Reto 1
# Definir los campos y tipos de datos para la tabla movies haciendo uso de los archivos movies.dat y README.

# id -> entero (llave primaria)
# genero -> cadena de caracteres 
# edad -> entero
# ocup -> entero
# cp -> cadena de caracteres 

#Crear la tabla movies (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos).

CREATE TABLE IF NOT EXISTS movies(
peli_id INT PRIMARY KEY,
titulo VARCHAR(80),
genero VARCHAR(40)
);
# Definir los campos y tipos de datos para la tabla ratings haciendo uso de los archivos ratings.dat y README.
# id usuario -> entero
# id pelicula -> entero
# ratings -> entero
# time stamp -> entero
#Crear la tabla ratings (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)
CREATE TABLE IF NOT EXISTS ratings(
#self_id INT PRIMARY KEY auto_increment,
user_id INT,
movie_id INT,
ratings INT,
time_stamp BIGINT,
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (movie_id) REFERENCES movies(peli_id)
);