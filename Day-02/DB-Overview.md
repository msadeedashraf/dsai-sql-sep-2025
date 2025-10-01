# Database Overview Mind Map (Structured)

This document organizes databases into categories, their vendors, query languages, IDEs, cloud consoles, and popular community tools.

---

## Relational Databases (SQL)

### Oracle
- **Open Source?** ❌ Proprietary  
- **Vendor:** Oracle Corporation  
- **Query Language:** PL/SQL  
- **Official IDE:** Oracle SQL Developer  
- **Cloud Console:** Oracle Cloud Console  
- **Community / 3rd-Party IDEs:** TOAD, DBeaver, Navicat  

---

### Microsoft SQL Server
- **Open Source?** ❌ Proprietary  
- **Vendor:** Microsoft  
- **Query Language:** T-SQL  
- **Official IDE:** SQL Server Management Studio (SSMS), Azure Data Studio  
- **Cloud Console:** Azure Portal  
- **Community / 3rd-Party IDEs:** DBeaver, Navicat, DataGrip  

---

### MySQL
- **Open Source?** ✅ GPL (Community Edition)  
- **Vendor:** Oracle Corporation  
- **Query Language:** MySQL SQL  
- **Official IDE:** MySQL Workbench  
- **Cloud Console:** MySQL HeatWave (OCI, AWS, Azure)  
- **Community / 3rd-Party IDEs:** phpMyAdmin, HeidiSQL, DBeaver, Navicat  

---

### MariaDB
- **Open Source?** ✅ GPL  
- **Vendor:** MariaDB Foundation / MariaDB Corporation  
- **Query Language:** MariaDB SQL  
- **Official IDE:** (No single official IDE, MariaDB client tools)  
- **Cloud Console:** MariaDB SkySQL  
- **Community / 3rd-Party IDEs:** HeidiSQL, phpMyAdmin, DBeaver, Navicat  

---

### PostgreSQL
- **Open Source?** ✅ PostgreSQL License  
- **Vendor:** PostgreSQL Global Development Group  
- **Query Language:** PostgreSQL SQL + PL/pgSQL  
- **Official IDE:** pgAdmin, psql (CLI)  
- **Cloud Console:** AWS RDS / Aurora PostgreSQL, Azure Database for PostgreSQL, Google Cloud SQL  
- **Community / 3rd-Party IDEs:** DBeaver, Navicat, DataGrip  

---

### IBM Db2
- **Open Source?** ❌ Proprietary  
- **Vendor:** IBM  
- **Query Language:** SQL PL  
- **Official IDE:** IBM Data Studio  
- **Cloud Console:** IBM Cloud Db2  
- **Community / 3rd-Party IDEs:** DBeaver, DataGrip, TOAD  

---

## Non-Relational Databases (NoSQL)

### Azure Cosmos DB
- **Open Source?** ❌ Proprietary  
- **Vendor:** Microsoft (Azure)  
- **Query Language:** SQL API, Mongo API, Cassandra API, Gremlin, Table API  
- **Official IDE / Console:** Azure Portal (Cosmos DB Explorer)  
- **Cloud Console:** Azure Cosmos DB (Cloud-only)  
- **Community / 3rd-Party IDEs:** VS Code Extension, Studio 3T (Mongo API)  

---

### MongoDB
- **Open Source?** ❌ SSPL License  
- **Vendor:** MongoDB Inc.  
- **Query Language:** MongoDB Query Language (MQL)  
- **Official IDE:** MongoDB Compass, mongosh (CLI)  
- **Cloud Console:** MongoDB Atlas  
- **Community / 3rd-Party IDEs:** Studio 3T, Robo 3T, DBeaver  

---

## Query Layer / API

### GraphQL
- **Open Source?** ✅ Open Source (GraphQL Foundation, Linux Foundation)  
- **Vendor:** GraphQL Foundation  
- **Query Language:** GraphQL Query Language  
- **Official IDE:** GraphiQL  
- **Cloud Console:** Apollo Studio  
- **Community / 3rd-Party IDEs:** GraphQL Playground, Insomnia, Postman  

---


# Database Comparison Table

This table compares relational and non-relational databases with vendors, query languages, IDEs, and community tools.

---

| Database      | Type            | Open Source | Vendor / Steward                | Query Language             | Official IDE / Tool             | Cloud Console                                    | Popular Community / 3rd-Party IDEs             |
|---------------|-----------------|-------------|---------------------------------|----------------------------|---------------------------------|-------------------------------------------------|------------------------------------------------|
| **Oracle**    | Relational (SQL)| ❌ No        | Oracle Corporation              | PL/SQL                     | Oracle SQL Developer            | Oracle Cloud Console                            | TOAD, DBeaver, Navicat                        |
| **SQL Server**| Relational (SQL)| ❌ No        | Microsoft                       | T-SQL                      | SSMS, Azure Data Studio          | Azure Portal                                   | DBeaver, Navicat, DataGrip                    |
| **MySQL**     | Relational (SQL)| ✅ Yes       | Oracle Corporation              | MySQL SQL                  | MySQL Workbench                 | MySQL HeatWave (OCI, AWS, Azure)               | phpMyAdmin, HeidiSQL, DBeaver, Navicat        |
| **MariaDB**   | Relational (SQL)| ✅ Yes       | MariaDB Foundation / Corporation| MariaDB SQL                | MariaDB client tools (no single IDE) | MariaDB SkySQL                                | HeidiSQL, phpMyAdmin, DBeaver, Navicat        |
| **PostgreSQL**| Relational (SQL)| ✅ Yes       | PostgreSQL Global Dev. Group    | PostgreSQL SQL + PL/pgSQL  | pgAdmin, psql (CLI)              | AWS RDS / Aurora, Azure PostgreSQL, GCP Cloud SQL | DBeaver, Navicat, DataGrip                    |
| **Db2**       | Relational (SQL)| ❌ No        | IBM                             | SQL PL                     | IBM Data Studio                 | IBM Cloud Db2                                  | DBeaver, DataGrip, TOAD                       |
| **Cosmos DB** | NoSQL (multi-model)| ❌ No    | Microsoft (Azure)               | SQL API, Mongo API, Cassandra API, Gremlin, Table API | Azure Portal (Cosmos DB Explorer) | Azure Cosmos DB (Cloud-only)                  | VS Code Extension, Studio 3T (Mongo API)      |
| **MongoDB**   | NoSQL (Document)| ❌ No (SSPL) | MongoDB Inc.                    | MongoDB Query Language (MQL)| MongoDB Compass, mongosh (CLI)  | MongoDB Atlas                                 | Studio 3T, Robo 3T, DBeaver                   |
| **GraphQL**   | Query Layer / API| ✅ Yes      | GraphQL Foundation (Linux Foundation)| GraphQL Query Language | GraphiQL                        | Apollo Studio                                 | GraphQL Playground, Insomnia, Postman         |

---
