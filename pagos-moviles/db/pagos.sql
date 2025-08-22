USE pagos;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    celular VARCHAR(12) UNIQUE,
    nombre VARCHAR(50),
    saldo DECIMAL(10, 2) DEFAULT 100.00
);

CREATE TABLE transacciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emisor VARCHAR(12),
    receptor VARCHAR(12),
    monto DECIMAL(10, 2),
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------------------------
-- PASO 1: Limpiar tablas (opcional, si ya existen datos)
-- -----------------------------------------
DELETE FROM transacciones;

DELETE FROM usuarios;

-- -----------------------------------------
-- PASO 2: Insertar 5 usuarios
-- -----------------------------------------
INSERT INTO
    usuarios (celular, nombre, saldo)
VALUES (
        '999888777',
        'Ana Pérez',
        500.00
    ),
    (
        '999111222',
        'Luis Gómez',
        400.00
    ),
    (
        '999333444',
        'Carla Díaz',
        600.00
    ),
    (
        '999555666',
        'Miguel Torres',
        450.00
    ),
    (
        '999777888',
        'Sofía Ríos',
        550.00
    );

-- -----------------------------------------
-- PASO 3: Insertar 30 transacciones aleatorias
-- -----------------------------------------
INSERT INTO
    transacciones (
        emisor,
        receptor,
        monto,
        fecha
    )
VALUES
    -- Grupo 1: Ana (999888777)
    (
        '999888777',
        '999111222',
        50.00,
        NOW() - INTERVAL 28 DAY
    ),
    (
        '999888777',
        '999333444',
        30.00,
        NOW() - INTERVAL 27 DAY
    ),
    (
        '999888777',
        '999555666',
        75.00,
        NOW() - INTERVAL 25 DAY
    ),
    (
        '999888777',
        '999777888',
        20.00,
        NOW() - INTERVAL 23 DAY
    ),
    (
        '999888777',
        '999111222',
        40.00,
        NOW() - INTERVAL 20 DAY
    ),
    -- Grupo 2: Luis (999111222)
    (
        '999111222',
        '999333444',
        60.00,
        NOW() - INTERVAL 19 DAY
    ),
    (
        '999111222',
        '999555666',
        25.00,
        NOW() - INTERVAL 18 DAY
    ),
    (
        '999111222',
        '999888777',
        80.00,
        NOW() - INTERVAL 16 DAY
    ),
    (
        '999111222',
        '999777888',
        35.00,
        NOW() - INTERVAL 15 DAY
    ),
    (
        '999111222',
        '999333444',
        45.00,
        NOW() - INTERVAL 14 DAY
    ),
    -- Grupo 3: Carla (999333444)
    (
        '999333444',
        '999555666',
        100.00,
        NOW() - INTERVAL 13 DAY
    ),
    (
        '999333444',
        '999777888',
        55.00,
        NOW() - INTERVAL 12 DAY
    ),
    (
        '999333444',
        '999888777',
        70.00,
        NOW() - INTERVAL 10 DAY
    ),
    (
        '999333444',
        '999111222',
        90.00,
        NOW() - INTERVAL 9 DAY
    ),
    (
        '999333444',
        '999555666',
        40.00,
        NOW() - INTERVAL 7 DAY
    ),
    -- Grupo 4: Miguel (999555666)
    (
        '999555666',
        '999777888',
        65.00,
        NOW() - INTERVAL 6 DAY
    ),
    (
        '999555666',
        '999888777',
        30.00,
        NOW() - INTERVAL 5 DAY
    ),
    (
        '999555666',
        '999111222',
        50.00,
        NOW() - INTERVAL 4 DAY
    ),
    (
        '999555666',
        '999333444',
        85.00,
        NOW() - INTERVAL 3 DAY
    ),
    (
        '999555666',
        '999777888',
        40.00,
        NOW() - INTERVAL 2 DAY
    ),
    -- Grupo 5: Sofía (999777888)
    (
        '999777888',
        '999888777',
        95.00,
        NOW() - INTERVAL 1 DAY
    ),
    (
        '999777888',
        '999111222',
        60.00,
        NOW()
    ),
    (
        '999777888',
        '999333444',
        75.00,
        NOW()
    ),
    (
        '999777888',
        '999555666',
        50.00,
        NOW()
    ),
    (
        '999777888',
        '999888777',
        30.00,
        NOW() - INTERVAL 1 DAY
    ),
    (
        '999777888',
        '999111222',
        45.00,
        NOW() - INTERVAL 2 DAY
    ),
    (
        '999777888',
        '999333444',
        60.00,
        NOW() - INTERVAL 3 DAY
    ),
    (
        '999777888',
        '999555666',
        55.00,
        NOW() - INTERVAL 4 DAY
    ),
    (
        '999777888',
        '999888777',
        80.00,
        NOW() - INTERVAL 5 DAY
    ),
    (
        '999777888',
        '999111222',
        70.00,
        NOW() - INTERVAL 6 DAY
    ),
    (
        '999777888',
        '999333444',
        90.00,
        NOW() - INTERVAL 7 DAY
    );