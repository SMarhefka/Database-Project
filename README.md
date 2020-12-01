# Database-Project

# Part 1 – Import the Weather Database into you DBMS

1. Download the Weather.zip file from the class [Virtual Machine Drive](https://drive.google.com/open?id=1ztXbmUFcngdiBnZeGe__qci9sM7W-okB)

1. Open the Weather.zip file from Winzip and unzip the files to your PC

![](RackMultipart20201201-4-1cgx7vq_html_8744813b298a22de.png)

1. Open SQL Server Management Studio.

Note: a recorded copy of the following steps can be found at [https://njit.webex.com/mw3300/mywebex/nbrshared.do](https://njit.webex.com/mw3300/mywebex/nbrshared.do)

1. Right click on database in the navigation window and select **New Database**

![](RackMultipart20201201-4-1cgx7vq_html_11fcd47f71280c7c.png)

1. When the screen below appears, enter Weather as shown in the circle below and press the OK button
 ![](RackMultipart20201201-4-1cgx7vq_html_3360fed7ef70fbc4.gif)

![](RackMultipart20201201-4-1cgx7vq_html_6c46d24508d05975.png)

1. Next right click the Weather database and select Tasks and then Import Data as shown below

![](RackMultipart20201201-4-1cgx7vq_html_eefaefef3e5cd685.png)

1. The import wizard will start and the following window will open. Click the NEXT button

![](RackMultipart20201201-4-1cgx7vq_html_a969523aa9c6e9d7.png)

1. When the window below opens, select FLAT FILE as the data source and the window will expand to have the following additional selections

![](RackMultipart20201201-4-1cgx7vq_html_c2c97f7a27064cb9.png)

1. Click the Browse button and navigate to where you unzipped the zip file in step 2 and select the AQS\_Sires.txt file as shown below

![](RackMultipart20201201-4-1cgx7vq_html_8b4b6dec37d4a5ad.png)

1. Select the COLUMNS option in the left hand navigation tab to make sure the columns have been properly identified. The screen should look like the following

![](RackMultipart20201201-4-1cgx7vq_html_eb48c4713d4d1f1e.png)

1. Next select the ADVANCED option and the following screen will appear. Once it does, you need to change the OUTPUT COLUMN WIDTH to 255 by click on the original width (shown as 50) and overwriting it with 255. This must be done for the Met\_Site\_Type, Met\_Site\_Direction, Owning\_Agency, Local\_Site\_Name, Address, City Name, CBSA\_Name and Tribe\_Name and then click the NEXT button

![](RackMultipart20201201-4-1cgx7vq_html_2b1920dcf2b93c20.png)

1. Next, change the Destination to SQL Server Native Client and make sure the Server and Authentication information is correct and then hit NEXT

![](RackMultipart20201201-4-1cgx7vq_html_864931beff123471.png)

1. Hit NEXT when the following window appears

![](RackMultipart20201201-4-1cgx7vq_html_82db7168179cb934.png)

1. Hit the FINISH button when the following windows appears

![](RackMultipart20201201-4-1cgx7vq_html_dac25efaa43d3dd4.png)

1. Click FINISH when the following screen appears

![](RackMultipart20201201-4-1cgx7vq_html_5d9bd0d5ad7522ed.png)

1. Hit FINISH and the following screen will show the progress and have the below information when it finishes

![](RackMultipart20201201-4-1cgx7vq_html_2f7875160fbbb1b4.png)

1. Next, you must repeat steps 6 through 16 selecting the Temperature.txt file in Step 9 and there are no modifications that need to be made to column widths in Step 11.

![](RackMultipart20201201-4-1cgx7vq_html_c29a2c79cb7a5276.png)

Note: These is no grade for this step. It is factored into the remaining Parts since you will not be able to complete them without being able to complete Part 1.

# Part 2 – Database Description

1. The database contains 2 tables
  1. Aqs\_sites – contains information regarding the sites where the temperature information in the Temperature table was collected. All the column should be self explanatory. The linkage between the 2 tables use the State\_Code, County\_Code and Site\_Number columns
  2. Temperature – contains the daily temperature information collected at the site for 2 decades. The important columns for the assignment are:
    1. State\_Code, County\_Code and Site\_Number are used to join to the aqs\_sites table
    2. Date\_Local – The date that the sample was collected
    3. Average\_Temp – The average temperature for that particular date
    4. Daily\_High\_Temp – The highest temperature for the day
    5. All temperatures are in degrees Fahrenheit

1. **Suggestion:** Due to the large number of records in the database, your queries may take several minutes to execute. If your queries are taking a long time to run, I suggest you make a table containing a small subset of the data in the Temperature table to use for writing and debugging your queries. After they all execute successfully, you can change the queries to use the full Temperature table
2. **Grading** – You will receive separate grades for Part 3, Part 4 and Part 5 (if you complete Part 5 for the extra credit). Both parts 3 and 4 will be worth 100 points each and each question in the step will be worth a proportionate value (1/# of questions in the step) Parts 3 and 4 will make up 50% of the Project grade. The extra credit (Part 5) will be worth 15% extra.

# Part 3 – Problems

You are trying to decide where in the US to reside. The most important factor to you is temperature, you hate cold weather. Answer the following questions to help you make your decision. For all problems show all columns included in the examples. Note that the term temperature applies to the average daily temperature unless otherwise stated.

1. Determine the date range of the records in the Temperature table

First Date Last Date

1986-01-01 2017-05-09

1. Find the minimum, maximum and average temperature for each state

State\_Name Minimum Temp Maximum Temp Average Temp

Alabama -4.662500 88.383333 59.328094

Alaska -43.875000 80.791667 29.146757

Arizona -99.000000 135.500000 67.039050

1. The results from question #2 show issues with the database. Obviously, a temperature of -99 degrees Fahrenheit in Arizona is not an accurate reading as most likely is 135.5 degrees. Write the queries to find all suspect temperatures (below -39o and above 105o). Sort your output by State Name and Average Temperature.

State\_Name state\_code County\_Code Site\_Number average\_Temp date\_local

Wisconsin 55 059 0002 -58.000000 2002-03-28

Washington 53 009 0013 -50.000000 2012-10-17

Texas 48 141 0050 106.041667 1991-07-28

Texas 48 141 0050 106.291667 1991-07-25

1. You noticed that the average temperatures become questionable below -39 o and above 125 o and that it is unreasonable to have temperatures over 105 o for state codes 30, 29, 37, 26, 18, 38. You also decide that you are only interested in living in the United States, not Canada or the US territories. Create a view that combines the data in the AQS\_Sites and Temperature tables. The view should have the appropriate SQL to exclude the data above. You should use this view for all subsequent queries.

1. Using the SQL RANK statement, rank the states by Average Temperature

State\_Name Minimum Temp Maximum Temp Average Temp State\_rank

Florida 35.96 88.00 72.244255 1

Louisiana 22.13 91.67 69.359993 2

Texas 0.00 122.60 68.906944 3

1. At this point, you&#39;ve started to become annoyed at the amount of time each query is taking to run. You&#39;ve heard that creating indexes can speed up queries. Create 5 indexes for your database. 2 of the indexes should index the temperature fields in the Temperature table, 1 index for the date in the Temperature table and 2 would index the columns used for joining the 2 tables (state, County and Site codes in the Temperate and aqs\_site tables).

To see if the indexing help, add print statements that write the start and stop time for the query in question #2 and run the query before and after the indexes are created. Note the differences in the times. Also make sure that the create index steps include a check to see if the index exists before trying to create it.

The following is a sample of the output that should appear in the messages tab that you will need to calculate the difference in execution times before and after the indexes are created

Begin Question 6 before Index Create At - 13:40:03

(777 row(s) affected)

Complete Question 6 before Index Create At - 13:45:18

1. You&#39;ve decided that you want to see the ranking of each high temperatures for each city in each state to see if that helps you decide where to live. Write a query that ranks (using the rank function) the states by averages temperature and then ranks the cities in each state. The ranking of the cities should restart at 1 when the query returns a new state. You also want to only show results for the 15 states with the highest average temperatures.

Note: you will need to use multiple nested queries to get the State and City rankings, join them together and then apply a where clause to limit the state ranks shown.

State\_Rank State\_Name State\_City\_Rank City\_Name Average Temp

1 Florida 1 Not in a City 73.975759

1 Florida 2 Pinellas Park 72.878784

1 Florida 3 Valrico 71.729440

1 Florida 4 Saint Marks 69.594272

2 Texas 1 McKinney 76.662423

2 Texas 2 Mission 74.701098

1. You notice in the results that sites with Not in a City as the City Name are include but do not provide you useful information. Exclude these sites from all future answers. You can do this by either adding it to the where clause in the remaining queries or updating the view you created in #4

1. You&#39;ve decided that the results in #8 provided too much information and you only want to 2 cities with the highest temperatures and group the results by state rank then city rank.

State\_Rank State\_Name State\_City\_Rank City\_Name Average Temp

1 Florida 1 Pinellas Park 72.878784

1 Florida 2 Valrico 71.729440

2 Louisiana 1 Baton Rouge 69.704466

2 Louisiana 2 Laplace (La Place) 68.115400

1. You decide you like the average temperature to be in the 80&#39;s. Pick 3 cities that meets this condition and calculate the average temperature by month for those 3cities. You also decide to include a count of the number of records for each of the cities to make sure your comparisons are being made with comparable data for each city.

Hint, use the datepart function to identify the month for your calculations.

City\_Name Month # of Records Average Temp

Mission 1 620 60.794048

Mission 2 565 64.403861

Mission 3 588 69.727512

1. You assume that the temperatures follow a normal distribution and that the majority of the temperatures will fall within the 40% to 60% range of the cumulative distribution. Using the CUME\_DIST function, show the temperatures for the same 3 cities that fall within the range.

City\_Name Avg\_Temp Temp\_Cume\_Dist

Mission 73.916667 0.400686891814539

Mission 73.956522 0.400829994275902

Mission 73.958333 0.402404121350887

1. You decide this is helpful, but too much information. You decide to write a query that shows the first temperature and the last temperature that fall within the 40% and 60% range for the 3 cities your focusing on.

City\_Name 40 Percentile Temp 60 Percentile Temp

Mission 73.956522 80.083333

Pinellas Park 71.958333 78.125000

Tucson 63.750000 74.250000

1. You remember from your statistics classes that to get a smoother distribution of the temperatures and eliminate the small daily changes that you should use a moving average instead of the actual temperatures. Using the windowing within a ranking function to create a 4 day moving average, calculate the moving average for each day of the year.

Hint: You will need to datepart to get the day of the year for your moving average. You moving average should use the 3 days prior and 1 day after for the moving average.

City\_Name Day of the Year Rolling\_Avg\_Temp

Mission 1 59.022719

Mission 2 58.524868

Mission 3 58.812967

Mission 364 60.657749

Mission 365 61.726333

Mission 366 61.972514

# Part 4 Front End and Geospatial Data

1. Your last concern is how long will it take to travel back home to visit friends and family after you move. Since the Weather database has latitude and longitude information, you have decided to convert this information into a new column with a GEOGRAPHY data type and populate the new column with a set command and one of the following formula (Depending on the data type for latitude and longitude):

UPDATE [dbo].[AQS\_Sites]

SET [GeoLocation] = geography::Point([Latitude], [Longitude], 4326)

Alternate versions that can work if the data was imported:

UPDATE [dbo].[AQS\_Sites]

SET [GeoLocation] = geography::STPointFromText(&#39;POINT(&#39; + CAST(LONGITUDE] AS

VARCHAR(20)) + &#39; &#39; + CAST([LATITUDE] AS VARCHAR(20)) + &#39;)&#39;, 4326)

where [GEOCODE\_LATITUDE] is not null

UPDATE [dbo].[aqs\_sites]

SET [GeoLocation] = geography::STPointFromText(&#39;POINT(&#39; + [LONGITUDE] + &#39; &#39; +

                    [Latitude] + &#39;)&#39;, 4326)

where [LATITUDE] is not null

Once you&#39;ve created and populated the new column, you write a stored procedure that will use has the latitude and longitude of where you are moving from (you will enter this data) and the state you are moving to as input parameters and returns all the cities in that state that the in the database and the distance between that city and where you are moving from. Provide the SQL to create the geospatial column and populate it as the first part of your answer. The second requirement for Part 4 is to create the stored procedure and execute the stored procedure for from a spreadsheet (see question 2 below for information about the spreadsheet). The stored procedure has the following requirements:

  1. The name of the stored procedure must be NJITID\_Summer2019\_Calc\_GEO\_Distance
  2. The stored procedure must have the following variables:
    1. @longitude – This will contain the longitude of the starting location
    2. @latitude – this contains the latitude of the starting location
    3. @State – this contains the state name to get the data for
    4. @rownum – this contains the number of rows the stored procedure will return
  3. The logic in the stored procedure must do the following:
    1. Select the site number, Local\_Site\_Name, Address, City\_Name, State\_Name, Zip\_Code, Distance\_In\_Meters, Latitude, Longitude and Hours\_of\_Travel
    2. Distance\_In\_Meters must be calculated using the following equation:

geoLocation.STDistance(@h) where @h is a geography variable calculated from the latitude and longitude of the starting location

    1. Hours\_of\_Travel must be calculated using the following formula

(geoLocation.STDistance(@h))/80000

    1. Many of the rows in the AQS\_Sites table do not contain valid Local\_Site\_Names. When that is the case, use a CASE statement to create a Local\_Site\_Name by combining the Site\_Number and City\_Name. The CASE statement must chech for both null values and for when the Local\_Site\_Name = &#39;&#39;
  1. The DDL that creates the stored procedure must:
    1. check to see if the procedure exists and delete prior versions
    2. have 2 exec NJITID\_Summer2019\_Calc\_GEO\_Distance statements at the end that runs the stored procedure with different variable values

. You can get the latitude and longitude for any city by using the following link:

http://www.findlatitudeandlongitude.com/

1. **Optional:** Use the front end on the Moodle site. The spreadsheets are on Moodle as [Class Project Front End for SQL Server XXXX File](http://njit2.mrooms.net/mod/resource/view.php?id=650008) where XXX is the version of SQL Server you&#39;re using. The Front End/Spreadsheet allows you to enter the data needed for a stored procedure you will write and presents the output in a more readable format. The grey cells indicate where the VB program in the spreadsheet will get the variable values from. Rows 7 on (depending on the number entered for ROWS) contain the results from the stored procedure queries

NOTE: The spreadsheet requires specific installation parameters. If Office is installed differently on your PC, you will get messages like &quot;Can&#39;t find project or library&quot;. This is very difficult to fix and you scan skip this step.

![](RackMultipart20201201-4-1cgx7vq_html_66ebe0f331886954.png)

The spreadsheet also has the functionality to generate the HTML to map the location of the responses similar to the example below. You can view the VB code in the spreadsheet to see how this was accomplished.

![](RackMultipart20201201-4-1cgx7vq_html_3e31f9af0d479d60.png)

# Part 5 – GunCrime Function

1. In addition to the temperature, you are also very concerned with crime in the area. You&#39;ve searched very hard and have been unable to find data that easily correlates to the temperature data. The best data you can find is the GunCrime.csv file in the Weather.zip file you downloaded in the beginning of the project.
2. Import the GunCrime.csv file into the database using the same method you used for the temperature and AQS\_Sites data. Similar to step 11 in Part1, you need to make the following changes in the Advanced Tab:
  1. The column date needs to be changed to have a datatype of date [DT\_DATE]
  2. For all columns except incident\_id, date and state change the OutputColumnWidth to 5000
  3. For Gun\_type needs to change the OutputColumnWidth to 8000

This should import a total of 239,677 rows

1. Using the same methods as you used in Step 1 of Part 4, create and populate a geography column to the GunCrimes table you just created
2. Write a query that identifies the number of crimes within 10 miles (16000 meters) of each city in the state you selected to move to by year that the crime was committed. There are several things you&#39;ll need to consider:
  1. There are no columns to join the GunCrimes and AQS\_Sites tables together, so you need to create a Cartesian Product and filter data out in the where statement using the following formula (which you&#39;ll need to modify) and the location data from your queries

geoLocation.STDistance(@h)

A sample of the output would look like the following

**Local\_Site\_Name City\_Name Crime\_Year Shooting\_Count**

0001 - Anaheim - 1010 S. Harbor Blvd. Anaheim 2013 1

0001 - Anaheim - 1010 S. Harbor Blvd. Anaheim 2014 71

0001 - Anaheim - 1010 S. Harbor Blvd. Anaheim 2015 118

0001 - Anaheim - 1010 S. Harbor Blvd. Anaheim 2016 139

0001 - Anaheim - 1010 S. Harbor Blvd. Anaheim 2017 112

0001 - Anaheim - 1010 S. Harbor Blvd. Anaheim 2018 20

1. Write a query that ranks all the cities in the state you selected from lowest to highest number of GunCrimes

# Part 6 – Using XML and Geospacial Data – Extra Credit

1. You come across an article at [http://sqlmag.com/t-sql/generating-charts-and-drawings-sql-server-management-studio](http://sqlmag.com/t-sql/generating-charts-and-drawings-sql-server-management-studio) that shows you how to graph data in Sql Server Management Studio. You decide to modify the following query provided in the article to graph your moving average for Tucson.

DECLARE @WKT AS VARCHAR(8000);
 SET @WKT =
   STUFF(
     (SELECT &#39;,&#39; + CAST( FY AS CHAR(4) ) + &#39; &#39; + CAST( Sales AS VARCHAR(30) )
     FROM #Sales
     ORDER BY FY
    FOR XML PATH(&#39;&#39;)), 1, 1, &#39;&#39;);
 SELECT geometry::STGeomFromText( &#39;LINESTRING(&#39; + @WKT + &#39;)&#39;, 0 );

You need to modify the part in red to house your query. You modify the select to cast the Day of the Year and Rolling\_Average\_Temp into varchar columns. You also have to modify the from to be a nested query that provides the 2 columns ( Day of the Year and Rolling\_Average\_Temp) for Tucson.

Your query should provide a graph similar to the one below in the special results tab

![](RackMultipart20201201-4-1cgx7vq_html_27bec2aca47edd6e.png)

1. You next want to add the data for Mission to the chart. To do this, you need to add a second part to the nested query that you replaced the FROM and ORDER BY statements with. You can use a UNION statement to join the data for the 2 cities.

 ![](RackMultipart20201201-4-1cgx7vq_html_8a6ccca57c576f2.gif)

This line is caused by the data for 2 cities being in 1 data string. I&#39;ll give extra credit to anyone who can figure out how to remove the line but show both cities on the same graph

![](RackMultipart20201201-4-1cgx7vq_html_21d96d0d391e0e03.png)

1. You notice that if you change the sort order to the above data, you can get the graph to show the difference in the temperatures between the 2 cities. The resulting graphs should look like the following:

![](RackMultipart20201201-4-1cgx7vq_html_73cde7f479eece03.png)
