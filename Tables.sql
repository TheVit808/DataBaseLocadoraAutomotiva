PRAGMA foreign_keys = on;

CREATE TABLE CATEGORIA (
ID_Categoria INTEGER PRIMARY KEY AUTOINCREMENT,
Nome_Categoria Varchar(50) NOT NULL,
Descricao_Categoria Varchar(50) NOT NULL,
Valor_Diaria Decimal(10,2) NOT NULL
);

CREATE TABLE FILIAL (
ID_Filial INTEGER PRIMARY KEY AUTOINCREMENT,
Nome_filial Varchar(50) NOT NULL,
Endereco_Filial Varchar(100) NOT NULL,
CEP_Filial varchar(8) NOT NULL,
Cidade_Filial Varchar(50) NOT NULL,
Estado_Filial Char(2) NOT NULL,
Telefone_Filial Varchar(11) NOT NULL
);

CREATE TABLE CLIENTE (
ID_Cliente INTEGER PRIMARY KEY AUTOINCREMENT,
Nome_Cliente Varchar(50) not NULL,
CPF_Cliente Varchar(14) UNIQUE NOT NULL,
CNH_Cliente Varchar(11) UNIQUE not NULL,
Data_Nascimento_CLiente Date not NULL,
Telefone_Cliente Varchar(11) not NULL,
Email_Cliente Varchar(100) NOT NULL,
Endereco_Cliente Varchar(100) NOT NULL,
CEP_Cliente varchar(8) NOT NULL
);

CREATE TABLE MODELO (
ID_Modelo INTEGER PRIMARY KEY AUTOINCREMENT,
Marca_Modelo Varchar(50) NOT NULL,
Nome_Modelo Varchar(50) NOT NULL,
Ano_Fabricacao Year NOT NULL,
ID_Categoria INT NOT NULL,
FOREIGN KEY(ID_Categoria) REFERENCES CATEGORIA(ID_Categoria)
);

CREATE TABLE VEICULO (
ID_Veiculo INTEGER PRIMARY KEY AUTOINCREMENT,
Placa_Veiculo Char(7) UNIQUE NOT NULL,
Chassis_Veiculo Varchar(50) UNIQUE NOT NULL,
Ano_Veiculo Year NOT NULL,
Cor_Veiculo Varchar(50) NOT NULL,
Quilometragem_Veiculo INT NOT NULL,
Status_Veiculo Varchar(50) NOT NULL,
ID_Modelo INT NOT NULL,
ID_Filial_Atual INT NOT NULL,
FOREIGN KEY(ID_Modelo) REFERENCES MODELO(ID_Modelo),
FOREIGN KEY(ID_Filial_Atual) REFERENCES FILIAL (ID_Filial)
);

CREATE TABLE SEGURO (
ID_Seguro INTEGER PRIMARY KEY AUTOINCREMENT,
Nome_Seguro Varchar(50) NOT NULL,
Descricao_Seguro Varchar(100) NOT NULL,
Custo_Diario Decimal(10,2) NOT NULL
);

CREATE TABLE RESERVA (
ID_Reserva INTEGER PRIMARY KEY AUTOINCREMENT,
Data_Pedido_Reserva Date NOT NULL,
Data_Retirada_Prevista Date NOT NULL,
Data_Devolucao_Prevista Date NOT NULL,
Valor_Total_Previsto Decimal(10,2) NOT NULL,
Status_Reserva Varchar(50) NOT NULL,
ID_Cliente INT NOT NULL,
ID_Veiculo INT not NULL,
ID_Filial_Retirada INT not NULL,
ID_Filial_Devolucao INT NOT NULL,
ID_Seguro INT NOT NULL,
FOREIGN KEY(ID_Cliente) REFERENCES CLIENTE (ID_Cliente),
FOREIGN KEY(ID_Veiculo) REFERENCES VEICULO(ID_Veiculo),
FOREIGN KEY(ID_Filial_Retirada) REFERENCES FILIAL (ID_Filial),
FOREIGN KEY(ID_Filial_Devolucao) REFERENCES FILIAL (ID_Filial),
FOREIGN KEY(ID_Seguro) REFERENCES SEGURO (ID_Seguro)
);

CREATE TABLE ALUGUEL (
ID_Aluguel INTEGER PRIMARY KEY AUTOINCREMENT,
Data_Retirada_Real Date NOT NULL,
Data_Devolucao_Real Date NULL,
Quilometragem_Retirada INT NOT NULL,
Quilometragem_Devolucao INT NULL,
Valor_Final_Aluguel Decimal(10,2) NOT NULL,
ID_Reserva INT NOT NULL,
ID_Veiculo INT NOT NULL,
ID_Cliente INT NOT NULL,
ID_Filial_Retirada INT NOT NULL,
ID_Filial_Devolucao INT NOT NULL,
ID_Seguro INT NOT NULL,
FOREIGN KEY(ID_Reserva) REFERENCES RESERVA (ID_Reserva),
FOREIGN KEY(ID_Veiculo) REFERENCES VEICULO(ID_Veiculo),
FOREIGN KEY(ID_Cliente) REFERENCES CLIENTE (ID_Cliente),
FOREIGN KEY(ID_FIlial_Retirada) REFERENCES FILIAL (ID_Filial),
FOREIGN KEY(ID_Filial_Devolucao) REFERENCES FILIAL (ID_Filial),
FOREIGN KEY(ID_Seguro) REFERENCES SEGURO (ID_Seguro)
);

CREATE TABLE PAGAMENTO (
ID_Pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
Data_Pagamento Date NOT NULL,
Valor_Pagamento Decimal(10,2) NOT NULL,
Metodo_Pagamento Varchar(50) NOT NULL,
Motivo_Pagamento Varchar(50) NOT NULL,
ID_Aluguel INT NOT NULL,
FOREIGN KEY(ID_Aluguel) REFERENCES ALUGUEL(ID_Aluguel)
);

CREATE TABLE FUNCIONARIO (
ID_Funcionario INTEGER PRIMARY KEY AUTOINCREMENT,
Nome_Func Varchar(50) not NULL,
Cargo Varchar(50) NOT NULL,
Salario_Func Decimal(10,2) NOT NULL,
Data_Contratacao Date NOT NULL,
ID_Filial INT not NULL,
FOREIGN KEY(ID_Filial) REFERENCES FILIAL (ID_Filial)
);

CREATE TABLE MANUTENCAO (
ID_Manutencao INTEGER PRIMARY KEY AUTOINCREMENT,
Data_Entrada_Manutencao Date NOT NULL,
Data_Saida_Manutencao Date NULL,
Descricao_Manutencao Varchar(100) NOT NULL,
Custo_Manutencao Decimal(10,2) NOT NULL,
ID_Veiculo INT NOT NULL,
FOREIGN KEY(ID_Veiculo) REFERENCES VEICULO (ID_Veiculo)
);

