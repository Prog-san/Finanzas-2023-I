
-- Table: Accounts
CREATE TABLE Accounts (
    username varchar(100)  NOT NULL,
    account_profile int  NOT NULL,
    password varchar(100)  NOT NULL,
    CONSTRAINT Accounts_pk PRIMARY KEY  (username)
);

-- Table: Banks
CREATE TABLE Banks (
    bank_code int  NOT NULL,
    value_BBP bigint  NOT NULL,
    bank_tea decimal(5,4)  NOT NULL,
    bank_initial decimal (5,4) NOT NULL,
    start_period date  NULL,
    finish_period date  NULL,
    periodgrace_value int  NOT NULL,
    CONSTRAINT Banks_pk PRIMARY KEY  (bank_code)
);

-- Table: Credits
CREATE TABLE Credits (
    credit_code int IDENTITY(1,1) NOT NULL,
    bank_code int  NOT NULL,
    request_code int  NOT NULL,
    TIR int  NOT NULL,
    VAR int  NOT NULL,
    tax_porcent decimal(5,4)  NOT NULL,
    amount bigint  NOT NULL,
    grace_period date  NOT NULL,
    quote_period date  NOT NULL,
    grace_porcent decimal(5,4)  NOT NULL,
    CONSTRAINT Credits_pk PRIMARY KEY  (credit_code)
);

-- Table: Profiles
CREATE TABLE Profiles (
    profile_id int IDENTITY(1,1) NOT NULL,
    name varchar(60)  NOT NULL,
    last_name varchar(60)  NOT NULL,
    DNI int  NOT NULL,
    phone_number int  NOT NULL,
    CONSTRAINT Profiles_pk PRIMARY KEY  (profile_id)
);

-- Table: Requests
CREATE TABLE Requests (
    request_code int IDENTITY(1,1) NOT NULL,
    username varchar(100)  NOT NULL,
    tax decimal(5,4)  NOT NULL,
    type_change bit  NOT NULL,
    request_estate bignit NOT NULL,
    request_initial_quote bigint NOT NULL,
    request_period date  NOT NULL,
    CONSTRAINT Requests_pk PRIMARY KEY  (request_code)
);

-- foreign keys
-- Reference: Accounts_Profiles (table: Accounts)
ALTER TABLE Accounts ADD CONSTRAINT Accounts_Profiles
    FOREIGN KEY (account_profile)
    REFERENCES Profiles (profile_id);

-- Reference: Banco_Credito (table: Credits)
ALTER TABLE Credits ADD CONSTRAINT Banco_Credito
    FOREIGN KEY (bank_code)
    REFERENCES Banks (bank_code);

-- Reference: Credito_Pedido (table: Credits)
ALTER TABLE Credits ADD CONSTRAINT Credito_Pedido
    FOREIGN KEY (request_code)
    REFERENCES Requests (request_code);

-- Reference: Pedido_Cuenta (table: Requests)
ALTER TABLE Requests ADD CONSTRAINT Pedido_Cuenta
    FOREIGN KEY (username)
    REFERENCES Accounts (username);



