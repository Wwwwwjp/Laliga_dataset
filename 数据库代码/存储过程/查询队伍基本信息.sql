use league
go
create proc team_inf
@tname varchar(20)
as
if not exists(select 1 from team where tname=@tname)
print '�ö��鲻����'
else
begin
select coach as '����',points as '��ǰ����',
(select pname from player where tname=@tname and teamrole='�ӳ�') 
as '�ӳ�',
(select trank from
(select tname,row_number() over(order by points desc) 
 as trank from team ) t
 where tname=@tname) 
 as '����'
from team where tname=@tname
end
go