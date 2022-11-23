---How to enable or disable database trigger using the sql script or query for the status
SELECT name,
       parent_class_desc,
       type_desc,
       is_disabled
FROM sys.triggers;
--Name of the object should be in the display too.

DISABLE TRIGGER TR_Schema_Change ON DATABASE;
DISABLE TRIGGER ALL ON dbo.Person;
 
SELECT name,
       parent_class_desc,
       type_desc,
       is_disabled
FROM sys.triggers;
