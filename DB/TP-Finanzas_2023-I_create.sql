-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-05-29 16:42:54.203

-- tables
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
    tax_code int  NOT NULL,
    period_code int  NOT NULL,
    value_BBP bigint  NOT NULL,
    start_period datetime  NOT NULL,
    finish_period datetime  NOT NULL,
    CONSTRAINT Banks_pk PRIMARY KEY  (bank_code)
);

-- Table: Credits
CREATE TABLE Credits (
    credit_code int  NOT NULL,
    bank_code int  NOT NULL,
    request_code int  NOT NULL,
    TIR int  NOT NULL,
    VAR int  NOT NULL,
    tax_porcent decimal(100,00)  NOT NULL,
    amount bigint  NOT NULL,
    grace_period datetime  NOT NULL,
    quote_period datetime  NOT NULL,
    grace_porcent decimal(100,00)  NOT NULL,
    CONSTRAINT Credits_pk PRIMARY KEY  (credit_code)
);

-- Table: Grace_periods
CREATE TABLE Grace_periods (
    period_code int  NOT NULL,
    period_value int  NOT NULL,
    period_max datetime  NOT NULL,
    CONSTRAINT Grace_periods_pk PRIMARY KEY  (period_code)
);

-- Table: Profiles
CREATE TABLE Profiles (
    profile_id int  NOT NULL,
    name varchar(60)  NOT NULL,
    last_name varchar(60)  NOT NULL,
    DNI int  NOT NULL,
    phone_number int  NOT NULL,
    job varchar(60)  NOT NULL,
    biography text  NOT NULL,
    CONSTRAINT Profiles_pk PRIMARY KEY  (profile_id)
);

-- Table: Requests
CREATE TABLE Requests (
    request_code int  NOT NULL,
    username varchar(100)  NOT NULL,
    type_tax bit  NOT NULL,
    type_change bit  NOT NULL,
    type_period bit  NOT NULL,
    money bigint  NOT NULL,
    period datetime  NOT NULL,
    tax decimal(100,00)  NOT NULL,
    CONSTRAINT Requests_pk PRIMARY KEY  (request_code)
);

-- Table: Taxes
CREATE TABLE Taxes (
    tax_code int  NOT NULL,
    tax_value int  NOT NULL,
    tax_porcent decimal(100,00)  NOT NULL,
    CONSTRAINT Taxes_pk PRIMARY KEY  (tax_code)
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

-- Reference: Banco_Grace_periods (table: Banks)
ALTER TABLE Banks ADD CONSTRAINT Banco_Grace_periods
    FOREIGN KEY (period_code)
    REFERENCES Grace_periods (period_code);

-- Reference: Banco_Taxes (table: Banks)
ALTER TABLE Banks ADD CONSTRAINT Banco_Taxes
    FOREIGN KEY (tax_code)
    REFERENCES Taxes (tax_code);

-- Reference: Credito_Pedido (table: Credits)
ALTER TABLE Credits ADD CONSTRAINT Credito_Pedido
    FOREIGN KEY (request_code)
    REFERENCES Requests (request_code);

-- Reference: Pedido_Cuenta (table: Requests)
ALTER TABLE Requests ADD CONSTRAINT Pedido_Cuenta
    FOREIGN KEY (username)
    REFERENCES Accounts (username);

-- End of file.
