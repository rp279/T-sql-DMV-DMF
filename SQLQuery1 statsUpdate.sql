
Create procedure usp_AutoUpadeteStats
(@IntObjectid int) 
as
   begin 
       declare @LastUpdatedate  as date
	   declare @StatName as varchar (100)
	   declare @strmessage as varchar (2000)
	   declare @intID as int
	set @intID = @IntObjectid   
select @LastUpdatedate=
stats_date ([object_id], [stats_id])
from sys.stats
where [object_id]=@IntObjectid;

select @StatName=
[name]
from sys.stats
where [object_id]=@IntObjectid;
   
   if @LastUpdatedate>= DATEADD ( day, -30, getdate ())
         begin 
		 Raiserror ( 'Please update the statistics of the table, it is outdated', 16,1);

		 end 

		 else 
		  set  @strmessage= 'All the stats of' + object_name (@intID)  +' is updated' 
		    
		    raiserror (@strmessage, 0,1) 

	  end ;


select [object_id],stats_date ([object_id], [stats_id])  as 'Date'
from sys.stats
order by [Date] desc 
--change the logic to automate the stats update rather then calling the store pro for every objects in the database--
--
