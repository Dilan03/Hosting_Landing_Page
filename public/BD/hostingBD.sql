-- Crear la base de datos
CREATE DATABASE hosting;

-- Crear la tabla de usuarios
CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    contrasena VARCHAR(50) NOT NULL,
    id_plan INT NOT NULL,
    metodo_pago ENUM('tarjeta', 'paypal', 'oxxo'),

    FOREIGN KEY (id_plan) REFERENCES planes(id),
);

-- Crear la tabla de planes
CREATE TABLE planes (
    id INT PRIMARY KEY,
    precio DECIMAL(10, 2) NOT NULL,
    periodo VARCHAR(20) NOT NULL,
    descripcion TEXT NOT NULL,
    estatus VARCHAR(20) NOT NULL,
    fecha_de_inicio DATE NOT NULL,
    fecha_de_renovacion DATE NOT NULL
);

-- Crear la tabla de ventas
CREATE TABLE ventas (
    id INT PRIMARY KEY,
    fecha_de_venta DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    id_plan INT NOT NULL,

    FOREIGN KEY (id_plan) REFERENCES planes(id)
);

-- Crear la tabla de tarjetas
CREATE TABLE tarjetas (
    id INT PRIMARY KEY,
    numero_de_tarjeta VARCHAR(16) NOT NULL,
    fecha_de_vencimiento VARCHAR(10) NOT NULL,
    cvv VARCHAR(4) NOT NULL,
    id_usuario INT,

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);
