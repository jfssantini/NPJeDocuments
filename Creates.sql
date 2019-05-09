CREATE TABLE TipoResponsavel(
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE StatusUsuario(
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE PapelUsuario(
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE EtapaAtendimento(
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE Especialidade(
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE Aluno(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Nome VARCHAR(200) NOT NULL,
	Sexo INT NOT NULL,
	DataNascimento DATE,
	Telefone VARCHAR(14),
	Celular VARCHAR(16),
	Email VARCHAR(40),
	Matricula VARCHAR(20),
	Semestre INT NOT NULL,
	RG VARCHAR(12),
	CPF VARCHAR(14),
	IdUsuario BIGINT NOT NULL,
	IdResponsavel BIGINT,
	Ativo BIT NOT NULL
);


CREATE TABLE Usuario(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	UsuarioLogin VARCHAR(25) NOT NULL,
	Senha VARCHAR(1000) NOT NULL,
	UserKey VARCHAR(200),
	IdPapelUsuario INT NOT NULL,
	IdStatusUsuario INT NOT NULL
);

CREATE TABLE Responsavel(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Nome VARCHAR(200) NOT NULL,
	Sexo INT NOT NULL,
	DataNascimento DATE,
	Telefone VARCHAR(14),
	Celular VARCHAR(16),
	Email VARCHAR(40),
	RG VARCHAR(12),
	CPF VARCHAR(14),
	IdUsuario BIGINT NOT NULL,
	IdTipoResponsavel INT NOT NULL,
	Ativo BIT NOT NULL
);

CREATE TABLE AlunoEspecialidade(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdAluno BIGINT,
	IdUsuario BIGINT NOT NULL,
	IdEspecialidade INT NOT NULL
);

CREATE TABLE AlunoGrupo(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdAluno BIGINT NOT NULL,
	IdGrupo BIGINT NOT NULL
);


CREATE TABLE Atendimento(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdCliente BIGINT NOT NULL,
	IdGrupo BIGINT NOT NULL,
	IdUsuarioCriacao BIGINT NOT NULL,
	DataHoraCriacao TIMESTAMP NOT NULL,
	IdUsuarioResponsavel BIGINT NOT NULL,
	IdEtapaAtendimentoAtual INT,
	IdTipoAtendimento INT,
	Concluido BIT NOT NULL
);

CREATE TABLE Cliente(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Nome VARCHAR(200) NOT NULL,
	Sexo INT NOT NULL,
	DataNascimento DATE,
	CPFCNPJ VARCHAR(18),
	Telefone VARCHAR(14),
	Celular VARCHAR(16),
	Email VARCHAR(40),
	IdEndereco BIGINT,
	Numero INT,
	Complemento VARCHAR(100)
);

CREATE TABLE Disponibilidade(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdAlunoEspecialidade BIGINT NOT NULL,
	IdDiaSemana INT NOT NULL
	HorarioInicio TIME NOT NULL,
	HorarioFim TIME NOT NULL
);

CREATE TABLE Endereco(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	CEP VARCHAR(9) NOT NULL,
	Cidade VARCHAR(100) NOT NULL,
	Bairro VARCHAR(100),
	InfoEndereco VARCHAR(1000)
);

CREATE TABLE Grupo(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Numero VARCHAR(20),
	IdEspecialidade INT,
	Observacoes VARCHAR(1000)
);


CREATE TABLE RegistroEtapaAtendimento(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdAtendimento BIGINT,
	IdEtapaAtendimento INT NOT NULL,
	IdUsuarioRegistro BIGINT NOT NULL,
	DataHora TIMESTAMP NOT NULL
);

CREATE TABLE TipoAtendimento(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Descricao VARCHAR(1000)
);

ALTER TABLE Aluno 
ADD CONSTRAINT FK_AlunoUsuario 
FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id);

ALTER TABLE Aluno 
ADD CONSTRAINT FK_AlunoResponsavel 
FOREIGN KEY (IdResponsavel) REFERENCES Responsavel (Id);

ALTER TABLE AlunoEspecialidade 
ADD CONSTRAINT FK_AlunoEspecialidadeAluno 
FOREIGN KEY (IdAluno) REFERENCES Aluno (Id);

ALTER TABLE AlunoEspecialidade 
ADD CONSTRAINT FK_AlunoEspecialidadeUsuario 
FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id);

ALTER TABLE AlunoEspecialidade 
ADD CONSTRAINT FK_AlunoEspecialidadeEspecialidade 
FOREIGN KEY (IdEspecialidade) REFERENCES Especialidade (Id);

ALTER TABLE AlunoGrupo 
ADD CONSTRAINT FK_AlunoGrupoAluno
FOREIGN KEY (IdAluno) REFERENCES Aluno (Id);

ALTER TABLE AlunoGrupo 
ADD CONSTRAINT FK_AlunoGrupoGrupo
FOREIGN KEY (IdGrupo) REFERENCES Grupo (Id);

ALTER TABLE Atendimento 
ADD CONSTRAINT FK_AtendimentoCliente
FOREIGN KEY (IdCliente) REFERENCES Cliente (Id);

ALTER TABLE Atendimento 
ADD CONSTRAINT FK_AtendimentoGrupo
FOREIGN KEY (IdGrupo) REFERENCES Grupo (Id);

ALTER TABLE Atendimento 
ADD CONSTRAINT FK_AtendimentoUsuario1
FOREIGN KEY (IdUsuarioCriacao) REFERENCES Usuario (Id);

ALTER TABLE Atendimento 
ADD CONSTRAINT FK_AtendimentoUsuario2
FOREIGN KEY (IdUsuarioResponsavel) REFERENCES Usuario (Id);

ALTER TABLE Atendimento 
ADD CONSTRAINT FK_AtendimentoEtapaAtendimento
FOREIGN KEY (IdEtapaAtendimentoAtual) REFERENCES EtapaAtendimento (Id);

ALTER TABLE Atendimento 
ADD CONSTRAINT FK_AtendimentoTipoAtendimento
FOREIGN KEY (IdTipoAtendimento) REFERENCES TipoAtendimento (Id);

ALTER TABLE Cliente 
ADD CONSTRAINT FK_ClienteEndereco
FOREIGN KEY (IdEndereco) REFERENCES Endereco (Id);

ALTER TABLE Disponibilidade 
ADD CONSTRAINT FK_DisponibilidadeAlunoEspecialidade
FOREIGN KEY (IdAlunoEspecialidade) REFERENCES AlunoEspecialidade (Id);

ALTER TABLE Grupo 
ADD CONSTRAINT FK_GrupoEspecialidade
FOREIGN KEY (IdEspecialidade) REFERENCES Especialidade (Id);

ALTER TABLE RegistroEtapaAtendimento 
ADD CONSTRAINT FK_RegistroEtapaAtendimentoEtapaAtendimento
FOREIGN KEY (IdEtapaAtendimento) REFERENCES EtapaAtendimento (Id);

ALTER TABLE RegistroEtapaAtendimento 
ADD CONSTRAINT FK_RegistroEtapaAtendimentoEtapaAtendimento
FOREIGN KEY (IdEtapaAtendimento) REFERENCES EtapaAtendimento (Id);

ALTER TABLE RegistroEtapaAtendimento 
ADD CONSTRAINT FK_RegistroEtapaAtendimentoUsuario
FOREIGN KEY (IdUsuarioRegistro) REFERENCES Usuario (Id);

ALTER TABLE RegistroEtapaAtendimento 
ADD CONSTRAINT FK_RegistroEtapaAtendimentoAtendimento
FOREIGN KEY (IdAtendimento) REFERENCES Atendimento (Id);

ALTER TABLE Responsavel 
ADD CONSTRAINT FK_ResponsavelUsuario
FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id);

ALTER TABLE Responsavel 
ADD CONSTRAINT FK_ResponsavelTipoResponsavel
FOREIGN KEY (IdTipoResponsavel) REFERENCES TipoResponsavel (Id);

ALTER TABLE Usuario 
ADD CONSTRAINT FK_UsuarioPapelUsuario
FOREIGN KEY (IdPapelUsuario) REFERENCES PapelUsuario (Id);

ALTER TABLE Usuario 
ADD CONSTRAINT FK_UsuarioStatusUsuario
FOREIGN KEY (IdStatusUsuario) REFERENCES StatusUsuario (Id);