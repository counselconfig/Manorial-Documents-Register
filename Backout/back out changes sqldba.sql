--use wb-t-sqlc02v01.web.local,4334 [dbo].[Mimir] wb-sqlc02v01.web.local,4334 [dbo].[Mimir]

/*THIS CODE WILL SHOW WHAT HAS BEEN IMPORTED BY The SSIS Import
  NB change date to when the SSIS package was run */
select * from  subject where subjecttype = 'm' and createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')

select * from  subjectarchiverecord where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')

select * from subjectarchiverecord where subjectid in (select subjectid from  subject where subjecttype = 'm' and createdate >= '20160825') and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')

select * from ArchiveRecord where archiverecordid in (select archiverecordid from subjectarchiverecord where createdate >= '20160825') and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')

select * from  SubjectLocation where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')

select * from  Location where locationid in (select locationid from  SubjectLocation where createdate >= '20160825') and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')

select * from  Location where locationtype in('oldcounty') and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')

select distinct(locationid), LocationName,locationtype from  Location where locationtype = 'oldcounty' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')


/*THIS CODE WILL DELETE THE RECORDS IMPORTED BY SSIS SO WE CAN RE-RUN THE PACKAGE
  NB change date to when the SSIS package was run */
-- begin tran rollback tran commit tran 
delete from  NameForm where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go
delete from  SubjectLocation where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go
delete from  subjectarchiverecord where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go
delete from  subject where subjecttype = 'm' and createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go
delete from  ArchiveRecord where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go
delete from  LocationRelationship where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go 
delete from  location where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')


/*THIS CODE CHECKS NO ROWS ARE RETURNED AFTER THE DELETE CODE ABOVE IS RUN */
select * from NameForm where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go
select * from  SubjectLocation where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go
select * from  subjectarchiverecord where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go
select * from  subject where subjecttype = 'm' and createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go
select * from  ArchiveRecord where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go
select * from  LocationRelationship where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')
go 
select * from  location where createdate >= '20160825' and createdby in ('sqldba', 'IN\mlipszyc', 'IN\hbyrne')


/*THIS CODE CHECKS NO ROWS ARE RETURNED AFTER THE DELETE CODE ABOVE IS RUN */

select * from vwTownoldCounty where oldcountyname in ('%cambridgeshire%') or oldcountyname = 'cambridgeshire' 