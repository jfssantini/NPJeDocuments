CREATE TABLE Usuario(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	UsuarioLogin VARCHAR(25) NOT NULL,
	Senha VARCHAR(1000) NOT NULL,
	UserKey VARCHAR(200),
	IdPapelUsuario INT NOT NULL,
	IdStatusUsuario INT NOT NULL,
	Excluido BOOL NOT NULL
);

CREATE TABLE PapelUsuario(--ENUM--
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE StatusUsuario(--ENUM--
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
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
	Ativo BOOL NOT NULL,
	IdUsuarioExclusao BIGINT,
	DataHoraExclusao TIMESTAMP
);

CREATE TABLE TipoResponsavel(--ENUM
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
	Ativo BOOL NOT NULL,
	IdUsuarioExclusao BIGINT,
	DataHoraExclusao TIMESTAMP
);

CREATE TABLE AlunoEspecialidade(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdAluno BIGINT,
	IdUsuario BIGINT NOT NULL,
	IdEspecialidade INT NOT NULL,
	Temporario BOOL NOT NULL,
	Esconder BOOL NOT NULL,
	Excluir BOOL NOT NULL
);

CREATE TABLE Disponibilidade(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdAlunoEspecialidade BIGINT NOT NULL,
	IdDiaSemana INT NOT NULL
	HorarioInicio TIME NOT NULL,
	HorarioFim TIME NOT NULL
);

CREATE TABLE DiaSemana(--ENUM
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE Especialidade(--ENUM
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE AlunoGrupo(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdAluno BIGINT,
	IdGrupo BIGINT NOT NULL,
	IdUsuario BIGINT NOT NULL,
	Temporario BOOL NOT NULL,
	Esconder BOOL NOT NULL,
	Excluir BOOL NOT NULL,
);

CREATE TABLE Cliente(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Nome VARCHAR(200) NOT NULL,
	Sexo INT NOT NULL,
	DataNascimento DATE,
	CPF VARCHAR(14),
	CNPJ VARCHAR(18),
	Telefone VARCHAR(14),
	Celular VARCHAR(16),
	Email VARCHAR(40),
	IdEndereco BIGINT,
	IdUsuarioExclusao BIGINT,
	DataHoraExclusao TIMESTAMP
);

CREATE TABLE Endereco(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	CEP VARCHAR(9),
	Cidade VARCHAR(100),
	Bairro VARCHAR(100),
	InfoEndereco VARCHAR(500),
	Numero INT,
	Complemento VARCHAR(100),
	Observacao VARCHAR(2000)
);

CREATE TABLE Grupo(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Numero VARCHAR(20),
	IdEspecialidade INT,
	Observacoes VARCHAR(1000),
	IdUsuarioExclusao BIGINT,
	DataHoraExclusao TIMESTAMP
);

CREATE TABLE Pasta
(
    Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IdCliente BIGINT NOT NULL,
    IdGrupo BIGINT NOT NULL,
    IdUsuarioResponsavel BIGINT,
    IdSituacaoNpjAtual INT,
	IdSituacaoProjudiAtual INT,
    IdSituacaoAtendimentoAtual INT,
    IdAssunto INT NOT NULL,
	Concluido BOOL NOT NULL,
	IdUsuarioCriacao BIGINT NOT NULL,
	DataHoraCriacao TIMESTAMP NOT NULL,
	IdUsuarioExclusao BIGINT,
	DataHoraExclusao TIMESTAMP,
	DataHoraAlteracao TIMESTAMP
);

CREATE TABLE Atendimento(
    Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IdPasta BIGINT,
    Titulo VARCHAR(100) NOT NULL,
    Descricao VARCHAR(5000),
	IdSituacaoNpj INT,
	IdSituacaoProjudi INT,
	IdSituacaoAtendimento INT,
	IdProcesso BIGINT,
    IdUsuarioRegistro BIGINT NOT NULL,
    DataHoraRegistro TIMESTAMP NOT NULL,
    Temporario BOOL NOT NULL,
	Esconder BOOL NOT NULL,
	IdUsuarioExclusao BIGINT,
	DataHoraExclusao TIMESTAMP,
	IdUsuario BIGINT NOT NULL,
    Excluir BOOL NOT NULL,
    DataHoraAlteracao TIMESTAMP NOT NULL
);

CREATE TABLE Agendamento(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdPasta BIGINT,
	IdProcesso BIGINT,
	Titulo VARCHAR(1000),
	Descricao VARCHAR(5000),
	DataAgendamento TIMESTAMP NOT NULL,
	Horario TIME,
	Temporario BOOL NOT NULL,
	Esconder BOOL NOT NULL,
    Excluir BOOL NOT NULL,
	IdUsuario BIGINT NOT NULL
);

CREATE TABLE SituacaoAtendimento(--ENUM--
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);


CREATE TABLE SituacaoNPJ(--ENUM--
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE SituacaoProjudi(--ENUM--
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE Assunto(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Descricao VARCHAR(1000)
);

CREATE TABLE Processo(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Distribuicao TIMESTAMP,
	IdPasta BIGINT NOT NULL,
	NumeroProcesso VARCHAR(30),
	IdTipoAcao BIGINT NOT NULL,
	IdPolo INT,
	IdSituacaoNpjAtual INT,
	IdSituacaoProjudiAtual INT,
    IdSituacaoAtendimentoAtual INT,
	Status BOOL NOT NULL,
	ExpectativaValorCausa DECIMAL,
	PercentualHonorarios DECIMAL,
	ValorHonorarios DECIMAL,
	SegmentoJudiciario VARCHAR(50),
	Comarca VARCHAR(50),
	Vara VARCHAR(80),
	Tribunal VARCHAR(80),
	AnotacoesGerais VARCHAR(5000),
	IdUsuarioCriacao BIGINT NOT NULL,
	DataHoraCriacao TIMESTAMP NOT NULL,
	IdUsuarioExclusao BIGINT,
	DataHoraExclusao TIMESTAMP,
	DataHoraAlteracao TIMESTAMP
);

CREATE TABLE dbo.Polo(
	Id INT NOT NULL PRIMARY KEY,
	Descricao VARCHAR(40) NOT NULL
);

CREATE TABLE TipoAcao(
	Id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Descricao VARCHAR(1000)
);

--Usuario--
ALTER TABLE Usuario 
ADD CONSTRAINT FK_UsuarioPapelUsuario
FOREIGN KEY (IdPapelUsuario) REFERENCES PapelUsuario (Id);

ALTER TABLE Usuario 
ADD CONSTRAINT FK_UsuarioStatusUsuario
FOREIGN KEY (IdStatusUsuario) REFERENCES StatusUsuario (Id);

--Responsavel--
ALTER TABLE Responsavel 
ADD CONSTRAINT FK_ResponsavelUsuario
FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id);

ALTER TABLE Responsavel 
ADD CONSTRAINT FK_ResponsavelTipoResponsavel
FOREIGN KEY (IdTipoResponsavel) REFERENCES TipoResponsavel (Id);

ALTER TABLE Responsavel 
ADD CONSTRAINT FK_ResponsavelUsuario2 
FOREIGN KEY (IdUsuarioExclusao) REFERENCES Usuario (Id);

--Processo--
ALTER TABLE Processo 
ADD CONSTRAINT FK_ProcessoPasta
FOREIGN KEY (IdPasta) REFERENCES Pasta (Id);

ALTER TABLE Processo 
ADD CONSTRAINT FK_ProcessoTipoAcao
FOREIGN KEY (IdTipoAcao) REFERENCES TipoAcao (Id);

ALTER TABLE Processo 
ADD CONSTRAINT FK_ProcessoPolo
FOREIGN KEY (IdPolo) REFERENCES Polo (Id);

ALTER TABLE Processo 
ADD CONSTRAINT FK_ProcessoSituacaoNpj
FOREIGN KEY (IdSituacaoNpjAtual) REFERENCES SituacaoNpj (Id);

ALTER TABLE Processo 
ADD CONSTRAINT FK_ProcessoSituacaoProjudi
FOREIGN KEY (IdSituacaoProjudiAtual) REFERENCES SituacaoProjudi (Id);

ALTER TABLE Processo 
ADD CONSTRAINT FK_ProcessoSituacaoAtendimento
FOREIGN KEY (IdSituacaoAtendimentoAtual) REFERENCES SituacaoAtendimento (Id);

ALTER TABLE Processo
ADD CONSTRAINT FK_ProcessoUsuario
FOREIGN KEY (IdUsuarioCriacao) REFERENCES Usuario (Id);

ALTER TABLE Processo 
ADD CONSTRAINT FK_ProcessoUsuario2
FOREIGN KEY (IdUsuarioExclusao) REFERENCES Usuario (Id);

--Pasta--
ALTER TABLE Pasta 
ADD CONSTRAINT FK_PastaCliente
FOREIGN KEY (IdCliente) REFERENCES Cliente (Id);

ALTER TABLE Pasta 
ADD CONSTRAINT FK_PastaGrupo
FOREIGN KEY (IdGrupo) REFERENCES Grupo (Id);

ALTER TABLE Pasta 
ADD CONSTRAINT FK_PastaUsuario1
FOREIGN KEY (IdUsuarioResponsavel) REFERENCES Usuario (Id);

ALTER TABLE Pasta 
ADD CONSTRAINT FK_PastaSituacaoNpj
FOREIGN KEY (IdSituacaoNpjAtual) REFERENCES SituacaoNpj (Id);

ALTER TABLE Pasta 
ADD CONSTRAINT FK_PastaSituacaoProjudi
FOREIGN KEY (IdSituacaoProjudiAtual) REFERENCES SituacaoProjudi (Id);

ALTER TABLE Pasta 
ADD CONSTRAINT FK_PastaSituacaoAtendimento
FOREIGN KEY (IdSituacaoAtendimentoAtual) REFERENCES SituacaoAtendimento (Id);

ALTER TABLE Pasta 
ADD CONSTRAINT FK_PastaAssunto
FOREIGN KEY (IdAssunto) REFERENCES Assunto (Id);

ALTER TABLE Pasta 
ADD CONSTRAINT FK_PastaUsuario2
FOREIGN KEY (IdUsuarioCriacao) REFERENCES Usuario (Id);

ALTER TABLE Pasta 
ADD CONSTRAINT FK_PastaUsuario3
FOREIGN KEY (IdUsuarioExclusao) REFERENCES Usuario (Id);

--Grupo--
ALTER TABLE Grupo 
ADD CONSTRAINT FK_GrupoEspecialidade
FOREIGN KEY (IdEspecialidade) REFERENCES Especialidade (Id);

ALTER TABLE Grupo 
ADD CONSTRAINT FK_GrupoUsuario
FOREIGN KEY (IdUsuarioExclusao) REFERENCES Usuario (Id);

--Disponibilidade--
ALTER TABLE Disponibilidade 
ADD CONSTRAINT FK_DisponibilidadeAlunoEspecialidade
FOREIGN KEY (IdAlunoEspecialidade) REFERENCES AlunoEspecialidade (Id) ON DELETE CASCADE;

ALTER TABLE Disponibilidade 
ADD CONSTRAINT FK_DisponibilidadeDiaSemana
FOREIGN KEY (IdDiaSemana) REFERENCES DiaSemana (Id);

--Cliente--
ALTER TABLE Cliente 
ADD CONSTRAINT FK_ClienteEndereco
FOREIGN KEY (IdEndereco) REFERENCES Endereco (Id);

ALTER TABLE Cliente 
ADD CONSTRAINT FK_ClienteUsuario
FOREIGN KEY (IdUsuarioExclusao) REFERENCES Usuario (Id);

--Atendimento--
ALTER TABLE Atendimento
ADD CONSTRAINT FK_AtendimentoPasta
FOREIGN KEY (IdPasta) REFERENCES Pasta (Id);

ALTER TABLE Atendimento
ADD CONSTRAINT FK_AtendimentoSituacaoNpj
FOREIGN KEY (IdSituacaoNpj) REFERENCES SituacaoNpj (Id);

ALTER TABLE Atendimento
ADD CONSTRAINT FK_AtendimentoSituacaoProjudi
FOREIGN KEY (IdSituacaoProjudi) REFERENCES SituacaoProjudi (Id);

ALTER TABLE Atendimento
ADD CONSTRAINT FK_AtendimentoSituacaoAtendimento
FOREIGN KEY (IdSituacaoAtendimento) REFERENCES SituacaoAtendimento (Id);

ALTER TABLE Atendimento
ADD CONSTRAINT FK_AtendimentoUsuario1
FOREIGN KEY (IdUsuarioRegistro) REFERENCES Usuario (Id);

ALTER TABLE Atendimento
ADD CONSTRAINT FK_AtendimentoUsuario2
FOREIGN KEY (IdUsuarioExclusao) REFERENCES Usuario (Id);

ALTER TABLE Atendimento
ADD CONSTRAINT FK_AtendimentoUsuario3
FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id);

--Agendamento--
ALTER TABLE Agendamento 
ADD CONSTRAINT FK_AgendamentoPasta
FOREIGN KEY (IdPasta) REFERENCES Pasta (Id);

ALTER TABLE Agendamento 
ADD CONSTRAINT FK_AgendamentoProcesso
FOREIGN KEY (IdProcesso) REFERENCES Processo (Id);

ALTER TABLE Agendamento 
ADD CONSTRAINT FK_AgendamentoUsuario
FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id);

--AlunoGrupo--
ALTER TABLE AlunoGrupo 
ADD CONSTRAINT FK_AlunoGrupoGrupo
FOREIGN KEY (IdGrupo) REFERENCES Grupo (Id);

ALTER TABLE AlunoGrupo 
ADD CONSTRAINT FK_AlunoGrupoAluno
FOREIGN KEY (IdAluno) REFERENCES Aluno (Id);

ALTER TABLE AlunoGrupo 
ADD CONSTRAINT FK_AlunoGrupoUsuario
FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id);

--AlunoEspecialidade
ALTER TABLE AlunoEspecialidade 
ADD CONSTRAINT FK_AlunoEspecialidadeAluno 
FOREIGN KEY (IdAluno) REFERENCES Aluno (Id);

ALTER TABLE AlunoEspecialidade 
ADD CONSTRAINT FK_AlunoEspecialidadeUsuario 
FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id);

ALTER TABLE AlunoEspecialidade 
ADD CONSTRAINT FK_AlunoEspecialidadeEspecialidade 
FOREIGN KEY (IdEspecialidade) REFERENCES Especialidade (Id);

--Aluno--
ALTER TABLE Aluno 
ADD CONSTRAINT FK_AlunoUsuario 
FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id);

ALTER TABLE Aluno 
ADD CONSTRAINT FK_AlunoResponsavel 
FOREIGN KEY (IdResponsavel) REFERENCES Responsavel (Id);

ALTER TABLE Aluno 
ADD CONSTRAINT FK_AlunoUsuario2 
FOREIGN KEY (IdUsuarioExclusao) REFERENCES Usuario (Id);
