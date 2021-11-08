Create procedure usp_AutoUpadeteStats
(@IntObjectid int) 
as
   begin 
       declare @LastUpdatedate  as date
	   declare @StatName as varchar (100)
	   declare @strmessage as varchar (2000)
	   declare @int as int
	set @int = @IntObjectid   
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
		  set  @strmessage= 'All the stats of' + object_name (@int)  +' is updated' 
		    
		    raiserror (@strmessage, 0,1) 

	  end ;


select [object_id],stats_date ([object_id], [stats_id])  as 'Date'
from sys.stats
order by [Date] desc 
