-- —————————————————————————————————————————————————————————————————————————————
-- Reset

DROP SCHEMA IF EXISTS party CASCADE;
CREATE SCHEMA party;
SET search_path TO party;

-- —————————————————————————————————————————————————————————————————————————————
-- Tables

CREATE TABLE Users (
   id        SERIAL         PRIMARY KEY,
   email     VARCHAR(255)   UNIQUE DEFAULT NULL,
   phone     VARCHAR(255)   UNIQUE DEFAULT NULL,
   hash      VARCHAR(255)   NOT NULL,

   PRIMARY KEY (name)
);

CREATE TABLE Sessions (
   name     NameType      NOT NULL,
   token    VARCHAR(255)  NOT NULL,
   expiry   TIMESTAMP     NOT NULL,
   client   BOOLEAN       NOT NULL DEFAULT TRUE,

   PRIMARY KEY (token)
);

CREATE TABLE Parties (
    id           SERIAL         PRIMARY KEY,
    name         VARCHAR(255)   NOT NULL,
    chatId       VARCHAR(255)   NOT NULL,
    bannerImage  BYTEA          NOT NULL,

    FOREIGN KEY (chatId) REFERENCES Chatrooms (id)
);

CREATE TABLE Chatrooms (
    id          SERIAL         PRIMARY KEY,
);

CREATE TABLE Messages (
    id           SERIAL         PRIMARY KEY,
    chatId       VARCHAR(255)   NOT NULL,
    content      TEXT           NOT NULL,
    createdAt    TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    senderId     VARCHAR(255)   NOT NULL,

    FOREIGN KEY (chatId)   REFERENCES Chatrooms (id)
    FOREIGN KEY (senderId) REFERENCES Users (id)
);

-- —————————————————————————————————————————————————————————————————————————————
-- Indices

CREATE INDEX idx_messages_senderId ON Messages (senderId);