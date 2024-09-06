-- ==============================================
-- DIMENSION TRACK
-- ==============================================
-- This query populates the DIM_TRACK table with TrackId, Name, and AlbumId 
-- from the source Musica database.

-- Delete records from DIM_TRACK (optional clean-up step)
-- delete from [musica_dm].[dbo].DIM_TRACK;

-- Insert data into DIM_TRACK
insert into musica_dm.[dbo].DIM_TRACK(TrackId, Name, AlbumId)
select TrackId, Name, AlbumId 
from [Musica].[dbo].Track;

-- ==============================================
-- DIMENSION CUSTOMER
-- ==============================================
-- This query populates the DIM_CUSTOMER table with CustomerId, FirstName, 
-- and LastName from the source Musica database.

-- Delete records from DIM_CUSTOMER (optional clean-up step)
-- delete from [musica_dm].[dbo].DIM_CUSTOMER;

-- Insert data into DIM_CUSTOMER
insert into musica_dm.[dbo].DIM_CUSTOMER(CustomerId, FirstName, LastName)
select CustomerId, FirstName, LastName 
from [Musica].[dbo].Customer;

-- ==============================================
-- DIMENSION INVOICE
-- ==============================================
-- This query populates the DIM_INVOICE table with InvoiceId 
-- from the source Musica database.

-- Delete records from DIM_INVOICE (optional clean-up step)
-- delete from [musica_dm].[dbo].DIM_INVOICE;

-- Insert data into DIM_INVOICE
insert into musica_dm.[dbo].DIM_INVOICE(InvoiceId)
select InvoiceId 
from [Musica].[dbo].Invoice;

-- ==============================================
-- DIMENSION ALBUM
-- ==============================================
-- This query populates the DIM_ALBUM table with AlbumId, Title, 
-- and ArtistId from the source Musica database.

-- Delete records from DIM_ALBUM (optional clean-up step)
-- delete from [musica_dm].[dbo].DIM_ALBUM;

-- Insert data into DIM_ALBUM
insert into musica_dm.[dbo].DIM_ALBUM(AlbumId, Title, ArtistId)
select AlbumId, Title, ArtistId 
from [Musica].[dbo].Album;

-- ==============================================
-- DIMENSION ARTIST
-- ==============================================
-- This query populates the DIM_ARTIST table with ArtistId and Name 
-- from the source Musica database.

-- Delete records from DIM_ARTIST (optional clean-up step)
-- delete from [musica_dm].[dbo].DIM_ARTIST;

-- Insert data into DIM_ARTIST
insert into musica_dm.[dbo].DIM_ARTIST(ArtistId, Name)
select ArtistId, Name 
from [Musica].[dbo].Artist;

-- ==============================================
-- DIMENSION DATE
-- ==============================================
-- This query populates the DIM_DATE table with formatted date data 
-- from the Invoice table in the source Musica database.

-- Delete records from DIM_DATE (optional clean-up step)
-- delete from [musica_dm].[dbo].DIM_DATE;

-- Insert data into DIM_DATE
insert into musica_dm.[dbo].DIM_DATE 
select distinct
    CAST(FORMAT(InvoiceDate, 'yyyyMMdd') as BigInt) as InvoicedateId,  -- Formatted date
    InvoiceDate as 'Date',                                              -- Original date
    year(InvoiceDate) as 'Year',                                        -- Extract year
    month(InvoiceDate) as 'Month',                                      -- Extract month
    day(InvoiceDate) as 'Day',                                          -- Extract day
    LEFT(DATENAME(MONTH, InvoiceDate), 3) as 'Month_mmm',               -- Short month name
    LEFT(DATENAME(MONTH, InvoiceDate), 3) + '-' + RIGHT(DATENAME(YEAR, InvoiceDate), 2) as 'Month_Year', -- Short month-year format
    LEFT(DATENAME(WEEKDAY, InvoiceDate), 3) as 'Week_day'               -- Short weekday name
from [Musica].[dbo].Invoice;

-- ==============================================
-- FACT INVOICE
-- ==============================================
-- This query populates the FACT_INVOICE fact table with Invoice details, 
-- including TrackId, ArtistId, CustomerId, InvoiceDate, Quantity, and UnitPrice.

insert into [musica_dm].[dbo].FACT_INVOICE
(
    InvoiceId,        -- Primary Key from the Invoice table
    TrackId,          -- Primary Key from the Track table (linked via Invoice_Track)
    ArtistId,         -- Primary Key from the Artist table (linked via Album -> Artist)
    CustomerId,       -- Primary Key from the Customer table
    InvoicedateId,    -- Date formatted as bigint (linked to the Date dimension)
    Quantity,         -- Number of tracks purchased
    UnitPrice         -- Price per track
)
SELECT
    i.InvoiceId as InvoiceId,          -- From Invoice table
    it.TrackId as TrackId,             -- From Invoice_Track table (song)
    a.ArtistId as ArtistId,            -- From Album -> Artist (via Track -> Album)
    i.CustomerId as CustomerId,        -- From Invoice table
    CAST(FORMAT(i.InvoiceDate, 'yyyyMMdd') as BigInt) as InvoicedateId,  -- Invoice Date formatted as bigint
    it.Quantity as Quantity,           -- Quantity from Invoice_Track table
    it.UnitPrice as UnitPrice          -- Unit price per track
FROM
    [Musica].[dbo].Invoice i
JOIN
    [Musica].[dbo].Invoice_Track it ON i.InvoiceId = it.InvoiceId   -- Join Invoice to Invoice_Track
JOIN
    [Musica].[dbo].Track t ON it.TrackId = t.TrackId                -- Join Track to Invoice_Track
JOIN
    [Musica].[dbo].Album al ON t.AlbumId = al.AlbumId               -- Join Track to Album
JOIN
    [Musica].[dbo].Artist a ON al.ArtistId = a.ArtistId;            -- Join Album to Artist

-- ==============================================
-- VERIFICATION QUERIES
-- ==============================================
-- Verify the total number of records in the fact and dimension tables.

-- Verify the total number of records in the fact table
SELECT COUNT(*) FROM [musica_dm].[dbo].FACT_INVOICE;

-- Verify the total number of records in the Track dimension
SELECT COUNT(*) FROM [musica_dm].[dbo].DIM_TRACK;

-- Verify the total number of records in the Customer dimension
SELECT COUNT(*) FROM [musica_dm].[dbo].DIM_CUSTOMER;

-- Verify the total number of records in the Date dimension
SELECT COUNT(*) FROM [musica_dm].[dbo].DIM_DATE;

-- Verify the total number of records in the Album dimension
SELECT COUNT(*) FROM [musica_dm].[dbo].DIM_ALBUM;

-- Verify the total number of records in the Artist dimension
SELECT COUNT(*) FROM [musica_dm].[dbo].DIM_ARTIST;
