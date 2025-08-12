PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Customer(
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name   TEXT NOT NULL,
    email       TEXT UNIQUE,
    phone       TEXT
);

CREATE TABLE IF NOT EXISTS Account(
    account_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id  INTEGER NOT NULL,
    account_type TEXT NOT NULL,
    balance_cents INTEGER NOT NULL DEFAULT 0,
    created_at   TEXT NOT NULL DEFAULT (datetime('now')),
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Transactions (
    tx_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    account_id INTEGER NOT NULL,
    kind    TEXT NOT NULL,
    amount_cents INTEGER NOT NULL,
    note    TEXT,
    created_at  TEXT NOT NULL DEFAULT (datetime('now')),
    FOREIGN KEY(account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_tx_account_created
ON Transactions(account_id, created_at DESC);

/*
Normalized: Data is separated into logical tables to avoid duplication.

Referential integrity: Foreign keys keep relationships valid.

Performance: Index speeds up transaction lookups.

Safe money storage: Using integer cents prevents rounding errors common with floating point.
*/



