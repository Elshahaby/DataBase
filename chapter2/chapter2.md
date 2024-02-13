# Chapter 2

<br>

## 2.1 Data Models,Schemas , and Instances

![photo](../chapter2/images/2.1.png)

### 2.1.1 Categories of Data Models

They use to describe the database structure.<br> <br>
**1. Hihg-level or conceptual data models**<br>
**2. low-level or physical data models** <br> <br>
![photo](../chapter2/images/2.1.1.png) <br>

---

- **A. Relational data model use concepts** <br>
  such as <br>
- entities <br>
- attributes <br>
- relationships <br> <br>
  ![photo](../chapter2/images/2.1.1.1.png)
  <br>

- That model is used **most frequently** in traditional commercial DBMSs.

<br>

- **B. physical data models** <br><br>
  ![photo](../chapter2/images/2.1.1.2.png)

  ***

 <br>

## 2.1.2 Schemas, Instances, and Database State

<br>

![photo](../chapter2/images/2.1.2.1.png)
![photo](../chapter2/images/2.1.2.2.png)

---

<br>

# 2.2 Three-Schema Architecture and Data Independence

<br>

## 2.2.1 Three-Schema Architecture

![photo](../chapter2/images/2.2.1.1.png)
![photo](../chapter2/images/2.2.1.2.png)
![photo](../chapter2/images/2.2.1.3.png)
![photo](../chapter2/images/2.2.1.4.png)

<br>

---

<br>

## 2.2.2 Data Independence

### A. Logical data independence

![photo](../chapter2/images/2.2.2.1.png)

### B. physical data independence

![photo](../chapter2/images/2.2.2.2.png)

<br>

#### :Summary:

**Three-Schema Architecture and Data Independence** <br>

- Internal level
  - Describes physical storage structure of the database.
- Conceptual level
  - Describes structure of the whole database for a community of users.
- External or View level
  - Describes part of the database that a user group is interested in.

<br>

**Data Independence**

- Capacity to change the schema at one level of database system
  - without having to change the schema at the next higher level.

<br>

**Types**

- Logical
- Physical

---

<br> <br>

# 2.3 Database Languages and Interfaces

![photo](../chapter2/images/2.3.png)

<br>

---

<br>

# 2.4 The Database System Environment

## 2.4.1 DBMS Component Modules

**1. buffer mangement module** <br>
**2. higher-level stored data mangager module** <br><br>
![photo](../chapter2/images/2.4.png)
![photo](../chapter2/images/2.4.1.png)

<br><br>

### top part of figure

- **Catalog and DDL compiler** <br>
  ![photo](../chapter2/images/2.4.1.1.png)

<br> <br>

- **Casual users** <br>
  ![photo](../chapter2/images/2.4.1.2.png)
  ![photo](../chapter2/images/2.4.1.3.png)

<br><br>

- **Application programmers** <br>
  ![photo](../chapter2/images/2.4.1.4.png)

<br>

### lower part of the figure2.3

![photo](../chapter2/images/2.4.1.5.png)

## 2.4.2 Database System Utilities (أداة مساعده)

**most DBMSs have database utilities that helps DBA manage the database system**

 <br>

![photo](../chapter2/images/2.4.2.png)
![photo](../chapter2/images/2.4.2.1.png)

---

<br> <br>

# 2.5 Centralized and Clinet/Server Architectures for DBMSs
(DBMSs هيكل او شكل بناء ال)

## 2.5.1 Centralized DBMSs Architectures
![photo](../chapter2/images/2.5.1.png)
- this architecture used mainframe computers (huge computer has a great storage and processing) to provide the main processing for all system functions, <br> including user application programs and user interface programs, as well as **DBMS functionality**.

![photo](../chapter2/images/2.5.1.1.png)

<br>

--- 

## 2.5.2 Basic Client/Server Architectures
![photo](../chapter2/images/2.5.2.png)

 - ### Client/Server Architectures for DBMSs

## 2.5.3 Two-Tier Client/Server Architectures for DBMSs

![photo](../chapter2/images/2.5.3.png)
![photo](../chapter2/images/2.5.3.1.png)

<br>

## 2.5.3 Three-Tier Architectures for Web Applications
![photo](../chapter2/images/2.5.4.png)


- **any updates on two-tier should be done at all clients and that take time , but at at three-tier any updates will be done once at the middle layer and that save a lot of time.** and that give us a security layer 