# Multi-Tenancy Implementation: Table-per-Tenant Approach

## Overview

This document outlines the **Table-per-Tenant** approach for implementing multi-tenancy in our e-commerce application. In this approach, a single schema is used to store data for all tenants, with tenant-specific data distinguished by an additional `TenantId` column in each table.

## Benefits

- **Simplicity**: Single schema management simplifies database operations and schema changes.
- **Resource Efficiency**: More efficient use of database resources compared to multiple schemas or databases.
- **Unified Reporting**: Easier to aggregate and report data across all tenants.

## Drawbacks

- **Data Isolation**: Requires careful design to ensure proper isolation of tenant data.
- **Performance**: Large tables may require efficient indexing and query optimization.
- **Scalability**: Can become complex as the number of tenants and data volume grows.

## Implementation Strategy

### 1. Table Design

1. **Add Tenant Identifier Column**:
   - Include a `TenantId` column in each table to uniquely identify the tenant associated with each row.
   - Example table definition:

     ```sql
     CREATE TABLE Products (
         ProductId INT PRIMARY KEY,
         TenantId INT NOT NULL,
         ProductName NVARCHAR(255),
         Price DECIMAL(18, 2),
         -- Other columns
         CONSTRAINT FK_Tenant FOREIGN KEY (TenantId) REFERENCES Tenants(TenantId)
     );
     ```

2. **Indexing**:
   - Create indexes on the `TenantId` column to optimize query performance.
   - Example index creation:

     ```sql
     CREATE INDEX IX_Products_TenantId ON Products(TenantId);
     ```

### 2. Application Logic

1. **Tenant Context**:
   - Implement a way to determine the current tenant in the application, such as through subdomains, headers, or tokens.

     ```csharp
     public class TenantContext
     {
         public int CurrentTenantId { get; set; }
     }
     ```

2. **Query Filtering**:
   - Update queries and data access logic to filter by `TenantId` to ensure data isolation.

     ```csharp
     public class ProductRepository
     {
         private readonly TenantContext _tenantContext;

         public ProductRepository(TenantContext tenantContext)
         {
             _tenantContext = tenantContext;
         }

         public IEnumerable<Product> GetProducts()
         {
             using (var connection = new SqlConnection("YourConnectionString"))
             {
                 var query = "SELECT * FROM Products WHERE TenantId = @TenantId";
                 return connection.Query<Product>(query, new { TenantId = _tenantContext.CurrentTenantId });
             }
         }
     }
     ```

### 3. Maintenance and Performance

1. **Regular Maintenance**:
   - Regularly maintain indexes and perform database optimization to manage performance as data volumes grow.

2. **Monitoring**:
   - Monitor query performance and adjust indexing strategies as needed to handle large datasets.

### 4. Best Practices

- **Consistent Filtering**: Always include the `TenantId` filter in all queries to prevent data leakage.
- **Efficient Indexing**: Review and optimize indexes regularly to maintain performance.
- **Security Measures**: Implement additional security measures and validations to ensure tenant data is properly isolated and protected.

## Summary

The Table-per-Tenant approach provides a practical solution for multi-tenancy with a single schema. It simplifies database management and improves resource efficiency while requiring careful attention to data isolation and performance optimization.

For further details or specific implementation guidance, refer to the application’s technical documentation or reach out to the development team.

