use league
go
create proc team_member
@tname varchar(20)
as
if not exists(select 1 from team where tname=@tname)
print '�ö��鲻����'
else
begin
select pname as '����',main_position as '����λ��'
from player where tname=@tname
end
go