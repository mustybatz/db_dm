SELECT 
    c.CustomerId, 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    COUNT(DISTINCT f.InvoiceId) AS TotalInvoices
FROM 
    [musica_dm].[dbo].FACT_INVOICE f
JOIN 
    [musica_dm].[dbo].DIM_CUSTOMER c ON f.CustomerId = c.CustomerId
GROUP BY 
    c.CustomerId, c.FirstName, c.LastName;


SELECT 
    c.CustomerId, 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    SUM(f.Quantity * f.UnitPrice) AS TotalSales
FROM 
    [musica_dm].[dbo].FACT_INVOICE f
JOIN 
    [musica_dm].[dbo].DIM_CUSTOMER c ON f.CustomerId = c.CustomerId
GROUP BY 
    c.CustomerId, c.FirstName, c.LastName;

SELECT 
    t.TrackId, 
    t.Name AS SongTitle, 
    COUNT(DISTINCT f.InvoiceId) AS TotalInvoices
FROM 
    [musica_dm].[dbo].FACT_INVOICE f
JOIN 
    [musica_dm].[dbo].DIM_TRACK t ON f.TrackId = t.TrackId
GROUP BY 
    t.TrackId, t.Name;

SELECT 
    t.TrackId, 
    t.Name AS SongTitle, 
    SUM(f.Quantity * f.UnitPrice) AS TotalSales
FROM 
    [musica_dm].[dbo].FACT_INVOICE f
JOIN 
    [musica_dm].[dbo].DIM_TRACK t ON f.TrackId = t.TrackId
GROUP BY 
    t.TrackId, t.Name;

SELECT 
    f.InvoiceId,
    t.Name AS SongTitle, 
    al.Title AS AlbumTitle,
    ar.Name AS ArtistName,
    f.Quantity, 
    f.UnitPrice, 
    (f.Quantity * f.UnitPrice) AS TotalAmount
FROM 
    [musica_dm].[dbo].FACT_INVOICE f
JOIN 
    [musica_dm].[dbo].DIM_TRACK t ON f.TrackId = t.TrackId
JOIN 
    [musica_dm].[dbo].DIM_ALBUM al ON t.AlbumId = al.AlbumId
JOIN 
    [musica_dm].[dbo].DIM_ARTIST ar ON al.ArtistId = ar.ArtistId;


