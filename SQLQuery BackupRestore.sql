drop table TblBackupRestoreEmp;


BACKUP DATABASE [AdventureWorks2019] 
TO  DISK = N'C:\rahul_1 backup\AdventureWorks_FullBackup_18_06 _PM.bak' 
WITH  EXPIREDATE = N'10/14/2021 00:00:00', FORMAT, INIT,  MEDIANAME = N'AdventureWorks_FullBackup', 
NAME = N'AdventureWorks2019-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'AdventureWorks2019' 
and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'AdventureWorks2019' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''AdventureWorks2019'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'C:\rahul_1 backup\AdventureWorks_FullBackup_17 52 _PM.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO;
/*
10 percent processed.
20 percent processed.
30 percent processed.
40 percent processed.
50 percent processed.
60 percent processed.
70 percent processed.
80 percent processed.
90 percent processed.
100 percent processed.
Processed 28040 pages for database 'AdventureWorks2019', file 'AdventureWorks2017' on file 1.
Processed 2 pages for database 'AdventureWorks2019', file 'AdventureWorks2017_log' on file 1.
BACKUP DATABASE successfully processed 28042 pages in 1.865 seconds (117.466 MB/sec).
The backup set on file 1 is valid.
*/

select *
into TblBackupRestoreEmp
from [HumanResources].[Employee]
where BusinessEntityID <=20;



select * from TblBackupRestoreEmp;



Insert into TblBackupRestoreEmp
select *
from [HumanResources].[Employee]
where BusinessEntityID <=100 and BusinessEntityID >20 ;

BACKUP DATABASE [AdventureWorks2019] 
TO  DISK = N'C:\rahul_1 backup\AdventureWorks_DiffBackup_18 10 _PM.bak'
WITH  DIFFERENTIAL ,  EXPIREDATE = N'10/14/2021 00:00:00', FORMAT, INIT, 
MEDIANAME = N'Adventureworks_Diff Backup_1',  NAME = N'AdventureWorks2019-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'AdventureWorks2019' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'AdventureWorks2019' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''AdventureWorks2019'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'C:\rahul_1 backup\AdventureWorks_DiffBackup_18 02 _PM.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO

/*
13 percent processed.
27 percent processed.
36 percent processed.
41 percent processed.
50 percent processed.
69 percent processed.
73 percent processed.
82 percent processed.
92 percent processed.
100 percent processed.
Processed 184 pages for database 'AdventureWorks2019', file 'AdventureWorks2017' on file 1.
Processed 2 pages for database 'AdventureWorks2019', file 'AdventureWorks2017_log' on file 1.
BACKUP DATABASE WITH DIFFERENTIAL successfully processed 186 pages in 0.046 seconds (31.504 MB/sec).
The backup set on file 1 is valid
*/

Insert into TblBackupRestoreEmp
select *
from [HumanResources].[Employee]
where BusinessEntityID>100 and BusinessEntityID <200 ;


BACKUP DATABASE [AdventureWorks2019] 
TO  DISK = N'C:\rahul_1 backup\AdventureWorks_DiffBackup_18 11 _PM.bak'
WITH  DIFFERENTIAL ,  EXPIREDATE = N'10/14/2021 00:00:00', FORMAT, INIT, 
MEDIANAME = N'Adventureworks_Diff Backup_2',  NAME = N'AdventureWorks2019-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'AdventureWorks2019' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'AdventureWorks2019' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''AdventureWorks2019'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'C:\rahul_1 backup\AdventureWorks_DiffBackup_18 02 _PM.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO

/*
14 percent processed.
28 percent processed.
37 percent processed.
42 percent processed.
51 percent processed.
61 percent processed.
70 percent processed.
80 percent processed.
94 percent processed.
100 percent processed.
Processed 184 pages for database 'AdventureWorks2019', file 'AdventureWorks2017' on file 1.
Processed 2 pages for database 'AdventureWorks2019', file 'AdventureWorks2017_log' on file 1.
BACKUP DATABASE WITH DIFFERENTIAL successfully processed 186 pages in 0.048 seconds (30.192 MB/sec).
The backup set on file 1 is valid.*/


Insert into TblBackupRestoreEmp
select *
from [HumanResources].[Employee]
where BusinessEntityID>200 and BusinessEntityID <230 ;

BACKUP LOG [AdventureWorks2019]
TO  DISK = N'C:\rahul_1 backup\AdventureWorks_T-log_fBackup_18 14 _PM.trn' 
WITH  EXPIREDATE = N'10/14/2021 00:00:00', FORMAT, INIT,  
MEDIANAME = N'Adventureworks_TranLogBackUp_1',  NAME = N'AdventureWorks2019-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'AdventureWorks2019' 
and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'AdventureWorks2019' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''AdventureWorks2019'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'C:\rahul_1 backup\AdventureWorks_T-log_fBackup_18 14 _PM.trn' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
/*
100 percent processed.
Processed 32 pages for database 'AdventureWorks2019', file 'AdventureWorks2017_log' on file 1.
BACKUP LOG successfully processed 32 pages in 0.012 seconds (20.507 MB/sec).
The backup set on file 1 is valid.
*/

Insert into TblBackupRestoreEmp
select *
from [HumanResources].[Employee]
where BusinessEntityID>230 and BusinessEntityID <250 ;


BACKUP LOG [AdventureWorks2019]
TO  DISK = N'C:\rahul_1 backup\AdventureWorks_T-log_fBackup_18 19 _PM.trn' 
WITH  EXPIREDATE = N'10/14/2021 00:00:00', FORMAT, INIT,  
MEDIANAME = N'Adventureworks_TranLogBackUp_2',  NAME = N'AdventureWorks2019-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'AdventureWorks2019' 
and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'AdventureWorks2019' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''AdventureWorks2019'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'C:\rahul_1 backup\AdventureWorks_T-log_fBackup_18 14 _PM.trn' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO



/*
100 percent processed.
Processed 3 pages for database 'AdventureWorks2019', file 'AdventureWorks2017_log' on file 1.
BACKUP LOG successfully processed 3 pages in 0.005 seconds (3.906 MB/sec).
The backup set on file 1 is valid.
*/

Insert into TblBackupRestoreEmp
select *
from [HumanResources].[Employee]
where BusinessEntityID>250 and BusinessEntityID <300 ;

Insert into TblBackupRestoreEmp
select *
from [HumanResources].[Employee]
where BusinessEntityID in (100,250,230) ;


select * from TblBackupRestoreEmp;

-------------Logical Disaster------------------

delete from TblBackupRestoreEmp;


----------------Restore Database for RTO=0.5 sec, RPO=No data loss--------------------

