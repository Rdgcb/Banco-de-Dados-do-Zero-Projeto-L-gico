CREATE DATABASE Oficina;

USE Oficina;

CREATE TABLE Cliente (
		id_Cliente INT NOT NULL,
        Nome VARCHAR(45),
        Sobrenome VARCHAR(45),
        Razão_Social VARCHAR(45),
        CPF VARCHAR(45) UNIQUE,
        CNPJ CHAR(15) UNIQUE,
        Contato CHAR(10),
        CONSTRAINT pk_Client_id PRIMARY KEY (id)
);

CREATE TABLE Responsável_Oficina (
		id_Responsável INT NOT NULL,
        Nome VARCHAR(45),
        Sobrenome VARCHAR(45),
        Setor VARCHAR(45),
        Cargo VARCHAR(45),
        CONSTRAINT pk_Responsável_id PRIMARY KEY (id)
);

CREATE TABLE Veículo (
		id_Veículo INT NOT NULL,
        Modelo VARCHAR(45), 
        Cor VARCHAR(45) NOT NULL,
        Placa  VARCHAR(45),  
        CONSTRAINT pk_Veículo_id PRIMARY KEY (id),
        CONSTRAINT fk_Equipe_de_Mecânicos_id FOREIGN KEY (idEquipe_de_Mecânicos) REFERENCES Equipe_de_Mecânicos(id)
);

CREATE TABLE Mecânicos (
		id_Equipe_de_Mecânicos INT NOT NULL,
        Descrição_serviço VARCHAR(45),
        Código VARCHAR(45),
        Nome VARCHAR(45),
        Sobrenome VARCHAR(45),
        Endereço VARCHAR(45),
        Especialidade VARCHAR(45),
        CONSTRAINT pk_Equipe_de_Mecânicos_id PRIMARY KEY (id)
);
        
CREATE TABLE OrdemServiço (
		id_Ordem_de_Serviço INT NOT NULL,
        Número INT,
        Data_emissão VARCHAR(45) NOT NULL,
        Valor FLOAT NOT NULL,
        Status_OS VARCHAR(45) NOT NULL, 
        Data_conclusão DATE NOT NULL,
        CONSTRAINT pk_Ordem_de_Serviço PRIMARY KEY (id),
        CONSTRAINT fk_Responsável_id FOREIGN KEY (idResponsável) REFERENCES Responsável_Oficina (id),
        CONSTRAINT fk_Cliente_id FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

SELECT Modelo, Placa FROM Veículo;

SELECT DISTINCT CPF FROM Cliente;

SELECT * FROM Veículo WHERE (Marca = Ford AND Cor = Azul OR Color = Verde);

SELECT * FROM OrdemServiço WHERE (Valor > 2000 AND Valor < 8000);

SELECT (Nome, ' ', Sobrenome) as Nome_do_Cliente
FROM Cliente
ORDER BY Nome_do_Cliente asc;

SELECT Marca, Cor
FROM Veículo
ORDER BY Modelo asc, Cor desc;

SELECT id_Ordem_de_Serviço
FROM OrdemServiço
ORDER BY Valor desc;

SELECT id_Ordem_de_Serviço, AVG(Valor)
FROM OrdemServiço
GROUP BY id_Ordem_de_Serviço
HAVING AVG(Valor) > 5000;














        