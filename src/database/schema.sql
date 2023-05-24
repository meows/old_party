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
   name      VARCHAR(255)   DEFAULT '',
   email     VARCHAR(255)   UNIQUE DEFAULT '',
   phone     VARCHAR(255)   UNIQUE DEFAULT '',
   hash      VARCHAR(255)   DEFAULT NULL
);

CREATE TABLE Sessions (
   userId   INT            NOT NULL,
   token    VARCHAR(255),
   expiry   TIMESTAMP      NOT NULL,

   PRIMARY KEY (token),
   FOREIGN KEY (userId) REFERENCES Users (id)
);

CREATE TABLE Parties (
    id            SERIAL         PRIMARY KEY,
    name          VARCHAR(255)   NOT NULL,
    host          INT            NOT NULL,
    hostId        INT            NOT NULL,
    chatId        VARCHAR(255)   NOT NULL,
    bannerImage   BYTEA          NOT NULL,

    FOREIGN KEY (hostId) REFERENCES Users (id)
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

CREATE INDEX idx_messages_senderId ON Messages (senderId);