IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'GeoLocation'
          AND Object_ID = Object_ID(N'dbo.AQS_Sites'))
BEGIN
    alter table AQS_Sites drop COLUMN GeoLocation;
END
go
alter table dbo.AQS_Sites add [GeoLocation] geography
go
UPDATE [dbo].[AQS_Sites]
SET [GeoLocation] = geography::Point([Latitude], [Longitude], 4326)
go
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'WZ285_Fall2020_Calc_GEO_Distance')
                    AND type IN ( N'P', N'PC' ) ) 
BEGIN
DROP PROCEDURE dbo.WZ285_Fall2020_Calc_GEO_Distance
END
GO
Create PROCEDURE dbo.WZ285_Fall2020_Calc_GEO_Distance
@longitude float,
@latitude float,
@State VARCHAR(Max),
@rownum int
as
Select Local_Site_Name, Address, City_Name, State_Name, Zip_Code, Distance_In_Meters, Latitude, Longitude from AQS_Sites




select [Latitude], [Longitude] from AQS_Sites where Latitude <> 0 and Longitude <> 0