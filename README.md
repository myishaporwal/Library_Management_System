# Library Management System

A responsive Library Management System interface. It includes a dashboard, catalog management, students, librarians, borrowing records, a periodicals shelf, and project documentation.

## Project structure

```text
public/       Static HTML, CSS, and JavaScript website
database/     SQL Server schema and stored procedures
docs/         Project report
```

## Run the website

Open `public/index.html` in a browser. No installation or server is required for the static interface.

## Database

Run `database/database.sql` in SQL Server Management Studio. The script creates normalized tables for users, students, librarians, books, loans, and periodicals, plus indexes and transaction-safe borrow/return stored procedures.

For a live production system, connect the interface to an ASP.NET Core Web API. Do not connect browser JavaScript directly to SQL Server or store plain-text passwords.
