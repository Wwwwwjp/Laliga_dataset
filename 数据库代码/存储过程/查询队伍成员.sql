use league
go
create proc team_member
@tname varchar(20)
as
if not exists(select 1 from team where tname=@tname)
print '该队伍不存在'
else
begin
select pname as '姓名',main_position as '主打位置'
from player where tname=@tname
end
go