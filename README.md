
# 📚 Library Management System

<div align="center">

### A Modern Library Automation Platform Built with ASP.NET Core MVC

Manage books, students, librarians, borrowing, and returns through a secure and user-friendly web application.

![ASP.NET Core](https://img.shields.io/badge/ASP.NET_Core-.NET_8-blue)
![C#](https://img.shields.io/badge/C%23-Language-purple)
![SQL Server](https://img.shields.io/badge/Database-SQL_Server-red)
![Entity Framework](https://img.shields.io/badge/ORM-Entity_Framework_Core-green)
![Bootstrap](https://img.shields.io/badge/UI-Bootstrap_5-blueviolet)
![Status](https://img.shields.io/badge/Status-Completed-success)

</div>

---

## 🚀 Overview

The **Library Management System** is a full-stack web application developed to automate and simplify library operations. It eliminates manual record-keeping by providing a centralized platform for managing books, students, librarians, and borrowing transactions.

The application follows the **Model-View-Controller (MVC)** architecture and leverages **ASP.NET Core MVC**, **Entity Framework Core**, and **SQL Server** to deliver a scalable, secure, and maintainable solution.

---

## ✨ Key Features

### 🔐 Authentication System

* Secure login functionality
* Session management
* Authorized access control

### 📊 Interactive Dashboard

* Total Books Overview
* Total Students Overview
* Total Librarians Overview
* Quick Navigation Panels

### 📚 Book Management

* Add New Books
* Edit Book Information
* Delete Books
* Search Books
* View Book Details
* Availability Tracking

### 👨‍🎓 Student Management

* Add Student Records
* Update Information
* Delete Records
* View Student Database

### 👩‍💼 Librarian Management

* Manage Librarian Profiles
* Update Details
* Remove Records
* View Librarian Information

### 📖 Borrow & Return System

* Issue Books
* Return Books
* Maintain Borrowing History
* Automatic Availability Updates

### 📞 Contact & Support Module

* User Assistance
* Contact Information
* Help Section

---

## 🏗️ System Architecture

```text id="5z0v7i"
┌─────────────────┐
│     Views       │
│  (User Interface)
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Controllers   │
│ Business Logic  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│     Models      │
│ Data Handling   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ SQL Server DB   │
└─────────────────┘
```

---

## 🛠️ Technology Stack

| Category        | Technologies                          |
| --------------- | ------------------------------------- |
| Frontend        | HTML5, CSS3, Bootstrap 5, Razor Views |
| Backend         | ASP.NET Core MVC (.NET 8), C#         |
| Database        | Microsoft SQL Server                  |
| ORM             | Entity Framework Core                 |
| IDE             | Visual Studio 2022                    |
| Version Control | Git & GitHub                          |

---

## 📂 Project Structure

```text id="v2um9j"
LibraryManagementSystem
│
├── Controllers
│   ├── LoginController
│   ├── BooksController
│   ├── StudentController
│   ├── LibrarianController
│   ├── BorrowController
│   └── DashboardController
│
├── Models
│   ├── Book
│   ├── Student
│   ├── Librarian
│   ├── BorrowRecord
│   ├── Login
│   └── LibraryContext
│
├── ViewModels
│
├── Views
│
├── wwwroot
│   ├── css
│   ├── js
│   └── images
│
└── appsettings.json
```

---

## 🗄️ Database Entities

### Books

* Book ID
* Title
* Author
* ISBN
* Published Date
* Availability Status

### Students

* Student ID
* Student Name
* Email
* Phone Number

### Librarians

* Librarian ID
* Name
* Age
* Phone Number

### Borrow Records

* Borrow Record ID
* Borrower Details
* Borrow Date
* Return Date
* Linked Book Information

---

## 📸 Screenshots


### Login Page

```text id="j6i4o8"


```

### Dashboard

```text id="fxhq2n"
screenshots/dashboard.png
```

### Books Module
<img width="958" height="506" alt="Screenshot 2026-07-28 160509" src="https://github.com/user-attachments/assets/a4d3dac0-3295-45d8-ad3c-3cf462d79524" />

```text id="04f2i8"
screenshots/books.png
```

### Students Module
<img width="955" height="499" alt="Screenshot 2026-07-28 160549" src="https://github.com/user-attachments/assets/287631ca-fce2-46c0-bf83-299e0aa44b06" />
```text id="zeyg3v"
screenshots/students.png
```

### Borrow Module

```text id="2szqf5"
screenshots/borrow.png
```

---

## ⚙️ Installation

### Clone Repository

```bash id="pwtzhn"
git clone https://github.com/myishaporwal/Library_Management_System.git
```

### Navigate to Project

```bash id="6gmj8e"
cd Library_Management_System
```

### Configure Database

Update the connection string in:

```text id="gb6s8u"
appsettings.json
```

### Apply Migrations

```bash id="w4y9kn"
dotnet ef database update
```

### Run Application

```bash id="51zygm"
dotnet run
```

---

## 🧪 Testing

The application has been tested using:

* Unit Testing
* Integration Testing
* System Testing
* Validation Testing
* User Acceptance Testing

✔ All core modules successfully passed testing scenarios.

---

## 🎯 Learning Outcomes

Through this project, I gained hands-on experience in:

* ASP.NET Core MVC
* Entity Framework Core
* SQL Server
* MVC Architecture
* CRUD Operations
* Authentication & Authorization
* Database Design
* Software Engineering Practices
* Git & GitHub Workflow

---

## 🔮 Future Enhancements

* Barcode & QR Code Support
* Email Notifications
* PDF Report Generation
* Multi-Language Support
* Advanced Search & Filtering
* Cloud Deployment (AWS/Azure)
* CI/CD Integration
* Docker Containerization

---

## 👨‍💻 Developer

**Myisha Porwal**

B.Tech Computer Science Engineering
VIT Bhopal University

GitHub: https://github.com/myishaporwal

---

## ⭐ Support

If you found this project useful, consider giving it a **star ⭐** on GitHub.

---

## 📄 License

This project was developed as part of the **MPOnline Advanced Software Engineering & Development Internship Program** and is intended for educational and learning purposes.
