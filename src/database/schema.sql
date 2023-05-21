-- —————————————————————————————————————————————————————————————————————————————
-- Reset

DROP SCHEMA IF EXISTS party CASCADE;
CREATE SCHEMA party;
SET search_path TO party;

-- CREATE DOMAIN 

-- —————————————————————————————————————————————————————————————————————————————
-- Tables

CREATE TABLE Users (
   id        SERIAL         PRIMARY KEY,
   email     VARCHAR(255)   UNIQUE DEFAULT NULL,
   phone     VARCHAR(255)   UNIQUE DEFAULT NULL,
   hash      VARCHAR(255)   NOT NULL
);

CREATE TABLE Sessions (
   name     VARCHAR(255)   NOT NULL,
   token    VARCHAR(255)   NOT NULL,
   expiry   TIMESTAMP      NOT NULL,
   client   BOOLEAN        NOT NULL DEFAULT TRUE,

   PRIMARY KEY (token)
);

CREATE TABLE Parties (
    id            SERIAL         PRIMARY KEY,
    name          VARCHAR(255)   NOT NULL,
    hostId        INT            NOT NULL,
    chatId        VARCHAR(255)   NOT NULL,
    bannerImage   BYTEA          NOT NULL
);

CREATE TABLE Chatrooms (
    id   SERIAL   PRIMARY KEY,

    FOREIGN KEY (id) REFERENCES Parties (id)
);

CREATE TABLE Messages (
    id          SERIAL         PRIMARY KEY,
    chatId      INT            NOT NULL,
    senderId    INT            NOT NULL,
    content     TEXT           NOT NULL,
    createdAt   TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (chatId)   REFERENCES Chatrooms (id),
    FOREIGN KEY (senderId) REFERENCES Users (id)
);

-- —————————————————————————————————————————————————————————————————————————————
-- Indices

-- CREATE INDEX idx_messages_senderId ON Messages (senderId);