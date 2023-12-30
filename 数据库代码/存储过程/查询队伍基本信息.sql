use league
go
create proc team_inf
@tname varchar(20)
as
if not exists(select 1 from team where tname=@tname)
print '该队伍不存在'
else
begin
select coach as '教练',points as '当前积分',
(select pname from player where tname=@tname and teamrole='队长') 
as '队长',
(select trank from
(select tname,row_number() over(order by points desc) 
 as trank from team ) t
 where tname=@tname) 
 as '排名'
from team where tname=@tname
end
go