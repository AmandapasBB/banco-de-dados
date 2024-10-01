CREATE TABLE Departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    localizacao_rua VARCHAR(150),
    localizacao_bairro VARCHAR(100),
    localizacao_cidade VARCHAR(100),
    gerente_id INT,
    CONSTRAINT fk_gerente FOREIGN KEY (gerente_id) REFERENCES Empregados(id_empregado)
);
CREATE TABLE Cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
CREATE TABLE Empregados (
    id_empregado INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(15, 2) NOT NULL,
    escolaridade VARCHAR(50),
    id_departamento INT,
    id_cargo INT,
    CONSTRAINT fk_departamento FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento),
    CONSTRAINT fk_cargo FOREIGN KEY (id_cargo) REFERENCES Cargos(id_cargo)
);
CREATE TABLE Dependentes (
    id_dependente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sexo ENUM('M', 'F'),
    data_nascimento DATE,
    id_empregado INT,
    CONSTRAINT fk_empregado_dependente FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado)
);
CREATE TABLE Projetos (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    localizacao VARCHAR(150),
    id_departamento INT,
    CONSTRAINT fk_projeto_departamento FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);
CREATE TABLE Alocacoes (
    id_alocacao INT AUTO_INCREMENT PRIMARY KEY,
    id_empregado INT,
    id_projeto INT,
    horas_trabalhadas DECIMAL(5, 2),
    funcao VARCHAR(100),
    data_inicio DATE,
    data_fim DATE,
    CONSTRAINT fk_alocacao_empregado FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado),
    CONSTRAINT fk_alocacao_projeto FOREIGN KEY (id_projeto) REFERENCES Projetos(id_projeto)
);
CREATE TABLE Ferias (
    id_ferias INT AUTO_INCREMENT PRIMARY KEY,
    id_empregado INT,
    data_inicio DATE,
    data_fim DATE,
    CONSTRAINT fk_ferias_empregado FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado)
);
CREATE TABLE Advertencias (
    id_advertencia INT AUTO_INCREMENT PRIMARY KEY,
    id_empregado INT,
    descricao TEXT,
    data_advertencia DATE,
    CONSTRAINT fk_advertencia_empregado FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado)
);
CREATE TABLE RegistrosPonto (
    id_ponto INT AUTO_INCREMENT PRIMARY KEY,
    id_empregado INT,
    data DATE,
    hora_entrada TIME,
    hora_saida TIME,
    CONSTRAINT fk_ponto_empregado FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado)
);
CREATE TABLE Faltas (
    id_falta INT AUTO_INCREMENT PRIMARY KEY,
    id_empregado INT,
    data DATE,
    motivo TEXT,
    CONSTRAINT fk_falta_empregado FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado)
);
