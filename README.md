# Banking System with C++ & SQLite

A modular banking system built in **C++20** with **SQLite** for data persistence.  
The goal is to implement secure account management, transaction handling, and reporting features, all backed by a normalized relational database.

> **Status:** 🛠 Early Development  
> Core schema creation and database integration are working.  
> Next steps: implementing customer/account operations and transaction-handling.

---

## 📂 Current Features
- SQLite database schema creation with **Customer**, **Account**, and **Transactions** tables
- Foreign key enforcement for referential integrity
- Command-line build & run on Windows and Linux
- Verified database initialization through the SQLite CLI

---

## 🏗 Planned Features
- Add customers and open accounts
- Deposit and withdraw funds
- Record transactions with timestamps and notes
- Display account balances and transaction history
- Expand to a GUI (Qt Widgets) in later phases


## 🗄 Database Schema (Current)

```
+-------------+       +-------------+       +----------------+
|  Customer   |       |   Account   |       |  Transactions  |
+-------------+       +-------------+       +----------------+
| customer_id |<----+ | account_id  |<----+ | tx_id          |
| full_name   |     | | customer_id |     | | account_id     |
| email       |     | | account_type|     | | kind           |
| phone       |     | | balance_cents|    | | amount_cents   |
+-------------+     | | created_at  |     | | note           |
                    | +-------------+     | | created_at     |
                    |                     | +----------------+
                    +---------------------+
      (1 Customer → Many Accounts)   (1 Account → Many Transactions)
```

---

## 🚀 Building Locally

### Prerequisites
- **GCC/G++** (MinGW on Windows or build-essential on Linux)
- **SQLite3** (CLI optional but recommended)

### Windows (MinGW)
```bash
gcc -std=c17 -Iinclude -c src/sqlite3.c -o sqlite3.o
g++ -std=c++20 -Iinclude src/main.cpp sqlite3.o -o bankapp.exe
bankapp.exe
```

### Linux / macOS
```bash
gcc -std=c17 -Iinclude -c src/sqlite3.c -o sqlite3.o
g++ -std=c++20 -Iinclude src/main.cpp sqlite3.o -o bankapp
./bankapp
```

---

## 📜 License
This project will be licensed under the **MIT License** once it reaches the first functional milestone.

---

## 📅 Project Roadmap
1. ✅ Database schema creation & testing
2. ⏳ Implement core banking operations in C++
3. ⏳ Add transaction logging
4. ⏳ Build CLI interface for user interaction
5. ⏳ Transition to GUI application

---

**Repository:** [kingnaddy/Banking-System-with-Cpp-SQL](https://github.com/kingnaddy/Banking-System-with-Cpp-SQL)
