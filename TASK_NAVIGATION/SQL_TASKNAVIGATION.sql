CREATE TABLE Usuario (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255),
    data_registro DATE
);

CREATE TABLE Projeto (
    id_projeto INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    prazo DATE
);

CREATE TABLE Tarefa (
    id_tarefa INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(100),
    descricao TEXT,
    prazo DATE,
    status VARCHAR(20),
    prioridade VARCHAR(20),
    id_usuario INT,
    id_projeto INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto),
    CHECK (status IN ('Pendente', 'Concluída')),
    CHECK (prioridade IN ('Alta', 'Média', 'Baixa'))
);

CREATE TABLE Relatorio (
    id_relatorio INT IDENTITY(1,1) PRIMARY KEY,
    conteudo TEXT,
    data_criacao DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Configuracao (
    id_configuracao INT IDENTITY(1,1) PRIMARY KEY,
    tema VARCHAR(10),
    notificacoes BIT,
    foto_perfil VARCHAR(255),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CHECK (tema IN ('Claro', 'Escuro'))
);
