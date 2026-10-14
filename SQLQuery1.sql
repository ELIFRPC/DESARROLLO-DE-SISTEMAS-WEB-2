-- 1. Creamos la base de datos para la tienda e-commerce
CREATE DATABASE TiendaSara;
GO
-- 2. Usar la base de datos creada
USE TiendaSara;
GO
-- 3. Creamos la tabla Marcas
CREATE TABLE Marcas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(100) NOT NULL
);
GO
-- 4. Creamos la tabla Categorias
CREATE TABLE Categorias (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(100) NOT NULL
);
GO
-- 5. Creamos la tabla Productos (con sus relaciones a Categorias y Marcas)
CREATE TABLE Productos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(200) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Cantidad INT NOT NULL,
    idCategoria INT NOT NULL,
    idMarca INT NOT NULL,
    CONSTRAINT FK_Productos_Categorias FOREIGN KEY (idCategoria) REFERENCES Categorias(Id),
    CONSTRAINT FK_Productos_Marcas FOREIGN KEY (idMarca) REFERENCES Marcas(Id)
);
GO
-- 6. Creamos la tabla Carrito
CREATE TABLE Carrito (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FolioVenta VARCHAR(50) NOT NULL,
    TotalCompra DECIMAL(10, 2) NOT NULL,
    Estatus VARCHAR(50) NOT NULL,
    Fecha DATETIME NOT NULL DEFAULT GETDATE()
);
GO
-- 7. Creamos la tabla CarritoDetalle (con su relación al Carrito y Productos)
CREATE TABLE CarritoDetalle (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdCarrito INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_CarritoDetalle_Carrito FOREIGN KEY (IdCarrito) REFERENCES Carrito(Id),
    CONSTRAINT FK_CarritoDetalle_Productos FOREIGN KEY (IdProducto) REFERENCES Productos(Id)
);
GO


USE TiendaSara;
GO

-- 1. Insertar 5 Marcas
INSERT INTO Marcas (Descripcion) VALUES 
('Samsung'),
('Apple'),
('Sony'),
('Logitech'),
('Nike');

-- 2. Insertar 5 Categorías
INSERT INTO Categorias (Descripcion) VALUES 
('Electrónica'),
('Línea Blanca'),
('Computación'),
('Accesorios'),
('Deportes');

-- 3. Insertar 5 Productos (Asociados a sus respectivas Marcas y Categorías)
INSERT INTO Productos (Descripcion, Precio, Cantidad, idCategoria, idMarca) VALUES 
('Smartphone Galaxy S24', 18999.00, 10, 1, 1),
('iPhone 15 Pro', 23999.00, 8, 1, 2),
('Audífonos Inalámbricos WH-1000XM5', 6500.00, 15, 4, 3),
('Teclado Mecánico RGB', 1499.00, 20, 3, 4),
('Tenis Deportivos Air Max', 2500.00, 12, 5, 5);

-- 4. Insertar 5 Carritos (Cabeceras de venta)
INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus) VALUES 
('FOLIO-001', 25499.00, 'Completado'),
('FOLIO-002', 6500.00, 'Pendiente'),
('FOLIO-003', 1499.00, 'Completado'),
('FOLIO-004', 21499.00, 'Procesando'),
('FOLIO-005', 2500.00, 'Cancelado');

-- 5. Insertar 5 Detalles de Carrito
INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES 
(1, 1, 1, 18999.00),
(1, 4, 1, 1499.00),
(2, 3, 1, 6500.00),
(3, 4, 1, 1499.00),
(4, 2, 1, 23999.00);
GO