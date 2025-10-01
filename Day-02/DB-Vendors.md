# Database Vendors: History, Use Cases, Evolution & Core Differences

## 1. Oracle
- **History**: Founded in 1977 as Software Development Laboratories (SDL), Oracle was one of the first commercial relational database vendors. Their flagship product, **Oracle Database**, popularized SQL as a standard.
- **Use Cases**: Mission-critical enterprise applications, finance, ERP, large-scale transaction systems.
- **Evolution**:
  - Started with RDBMS.
  - Expanded into cloud (Oracle Cloud).
  - Added advanced features: RAC (Real Application Clusters), in-memory, autonomous DB.
- **Core Differences**:
  - Enterprise-grade performance, high reliability.
  - Proprietary with high licensing costs.
  - Known for scalability and advanced security.

---

## 2. IBM (DB2)
- **History**: Released in the early 1980s, DB2 was IBM’s response to the growing popularity of SQL databases.
- **Use Cases**: Banking, government, insurance, large-scale mainframes, analytics.
- **Evolution**:
  - Originally mainframe-oriented.
  - Expanded to Linux, Unix, Windows.
  - Introduced hybrid support for JSON, NoSQL-like features.
- **Core Differences**:
  - Strong integration with IBM’s enterprise systems.
  - Optimized for OLTP and OLAP workloads.
  - Less common in startups compared to Oracle/MySQL/Postgres.

---

## 3. Microsoft (SQL Server)
- **History**: Launched in 1989, built initially with Sybase technology. Became Microsoft’s flagship RDBMS.
- **Use Cases**: Enterprise apps, BI with Microsoft stack (Power BI, .NET, Azure).
- **Evolution**:
  - Grew from on-prem SQL to **Azure SQL Database** (PaaS).
  - Expanded into big data integration and ML.
- **Core Differences**:
  - Deep integration with Microsoft ecosystem.
  - Strong tooling (SSMS, Azure Data Studio).
  - Popular for businesses already using Windows/Office.

---

## 4. MySQL
- **History**: Founded in 1995 by MySQL AB in Sweden. Acquired by Sun Microsystems (2008) → Oracle (2010).
- **Use Cases**: Web applications, open-source projects, startups, LAMP stack.
- **Evolution**:
  - Lightweight, easy-to-use RDBMS.
  - Forked into **MariaDB** after Oracle’s acquisition (due to concerns about openness).
- **Core Differences**:
  - Open-source (community edition).
  - Widely used in web hosting and SaaS.
  - Strong community support.

---

## 5. PostgreSQL
- **History**: Originated from the POSTGRES project at UC Berkeley in the 1980s. Evolved into PostgreSQL with SQL support in the 1990s.
- **Use Cases**: Advanced applications needing extensibility, geospatial data (PostGIS), analytics.
- **Evolution**:
  - Added support for JSON, NoSQL-like features.
  - Cloud adoption via AWS RDS, Azure, GCP.
- **Core Differences**:
  - True open-source with a strong community.
  - Standards-compliant and feature-rich (CTEs, window functions).
  - Extensible with custom types and functions.

---

## 6. MongoDB
- **History**: Founded in 2007 by 10gen (later renamed MongoDB Inc). Designed as a document database for modern apps.
- **Use Cases**: Real-time apps, IoT, content management, mobile backends.
- **Evolution**:
  - Introduced BSON (binary JSON).
  - Gained popularity as a NoSQL alternative.
  - MongoDB Atlas launched as a cloud DBaaS.
- **Core Differences**:
  - Schema-less, flexible document model.
  - Optimized for developer agility.
  - Trades some ACID guarantees for scalability (improved over time).

---

## 7. GraphQL
- **History**: Developed internally at Facebook in 2012, open-sourced in 2015.
- **Use Cases**: APIs for mobile/web apps, where clients need precise control over data.
- **Evolution**:
  - Not a database, but a **query language** for APIs.
  - Gained wide adoption as an alternative to REST.
  - Supported by many databases via GraphQL layers.
- **Core Differences**:
  - Declarative data fetching for APIs.
  - Reduces over-fetching/under-fetching compared to REST.
  - Works across multiple data sources.

---

## 8. Cosmos DB (Microsoft Azure)
- **History**: Launched by Microsoft in 2017 as a globally distributed, multi-model database.
- **Use Cases**: IoT, global-scale apps, low-latency multi-region systems.
- **Evolution**:
  - Built on Azure DocumentDB.
  - Supports multiple APIs (SQL, MongoDB, Cassandra, Gremlin, Table).
  - Offers global replication with <10ms latency.
- **Core Differences**:
  - Cloud-native, serverless options.
  - Multi-model (key-value, doc, graph, column).
  - Tunable consistency levels.

---

# Summary of Core Differences
- **Oracle/IBM/Microsoft**: Traditional enterprise RDBMS vendors.
- **MySQL/Postgres/MariaDB**: Open-source, community-driven, web and startup friendly.
- **MongoDB**: NoSQL, document-oriented for flexibility.
- **GraphQL**: Query language for APIs, not a DB.
- **Cosmos DB**: Cloud-native, globally distributed multi-model DB.

# Key Differences Summary of Major Database Vendors

| Vendor / DB       | Type         | History / Origin | Primary Use Cases | Evolution Highlights | Core Differences |
|-------------------|-------------|------------------|------------------|----------------------|------------------|
| **Oracle**        | RDBMS       | Founded 1977, one of the first commercial SQL DBs | Enterprise apps, finance, ERP, mission-critical workloads | From RDBMS → Cloud (Oracle Cloud) → Autonomous DB | Proprietary, enterprise-grade performance, high licensing costs |
| **IBM DB2**       | RDBMS       | Early 1980s, IBM mainframes | Banking, government, insurance, large OLTP/OLAP | Mainframe → Linux/Unix/Windows → JSON/NoSQL features | Strong IBM integration, reliable for OLTP & analytics |
| **Microsoft SQL Server** | RDBMS | 1989, partnership with Sybase | Enterprise apps, BI, Microsoft ecosystem | On-prem → Azure SQL DB → Big data & ML support | Deep Microsoft integration, strong tooling (SSMS, Azure Data Studio) |
| **MySQL**         | RDBMS       | 1995, MySQL AB (Sweden), later Oracle | Web apps, LAMP stack, SaaS, startups | Acquired by Sun (2008) → Oracle (2010); forked into MariaDB | Open-source (community edition), lightweight, popular in web hosting |
| **MariaDB**       | RDBMS (MySQL fork) | 2009, forked from MySQL | Same as MySQL + enterprise alternatives | Community-driven fork ensuring openness | Open-source guarantee, improved storage engines |
| **PostgreSQL**    | RDBMS       | 1980s UC Berkeley (POSTGRES project) | Advanced apps, geospatial, analytics | From research DB → SQL support → JSON/NoSQL features | Open-source, standards-compliant, extensible (custom functions/types) |
| **MongoDB**       | NoSQL (Document DB) | 2007, by 10gen (MongoDB Inc) | Real-time apps, IoT, content mgmt, mobile | From BSON doc store → Cloud DBaaS (Atlas) → Improved ACID | Schema-less, flexible, developer-friendly, scales horizontally |
| **GraphQL**       | Query Language (not DB) | 2012 Facebook → Open-sourced 2015 | APIs for web/mobile apps, data aggregation | API query language, adopted widely beyond Facebook | Declarative, avoids over/under-fetching, cross-source support |
| **Cosmos DB**     | Multi-model (Cloud-native) | 2017 Microsoft Azure (based on DocumentDB) | IoT, global-scale apps, low-latency systems | From DocumentDB → Cosmos DB → Multi-API support | Cloud-native, globally distributed, tunable consistency, multi-model |

