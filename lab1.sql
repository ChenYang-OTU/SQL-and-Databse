/*
Created: 2021-09-15
Modified: 2021-09-15
Model: PostgreSQL 10
Database: PostgreSQL 10
*/

-- Create tables section -------------------------------------------------

-- Table Customer

CREATE TABLE "Customer"
(
  "Name" Character varying NOT NULL,
  "Address" Character varying
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Customer" ADD CONSTRAINT "PK_Customer" PRIMARY KEY ("Name")
;

-- Table Product

CREATE TABLE "Product"
(
  "ProductName" Character varying NOT NULL,
  "Price" Double precision NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Product" ADD CONSTRAINT "PK_Product" PRIMARY KEY ("ProductName")
;

-- Table Orders

CREATE TABLE "Orders"
(
  "Name" Character varying NOT NULL,
  "ProductName" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Orders" ADD CONSTRAINT "PK_Orders" PRIMARY KEY ("Name","ProductName")
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "Orders"
  ADD CONSTRAINT "Relationship1"
    FOREIGN KEY ("Name")
    REFERENCES "Customer" ("Name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Orders"
  ADD CONSTRAINT "Relationship2"
    FOREIGN KEY ("ProductName")
    REFERENCES "Product" ("ProductName")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

