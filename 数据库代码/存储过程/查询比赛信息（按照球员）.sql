use league
go
create proc match_inf_player
@pname varchar(20)
as
if not exists
(select 1 from match 
where home_team=(select tname from player where pname=@pname) 
or away_team=(select tname from player where pname=@pname))
print '����Աû�б���'
else
begin
select home_team as '����',away_team as '�Ͷ�',
home_score as '��������',away_score as '�ͳ�����',
rounds as '��������',match_date as '��������'
from match 
where home_team=(select tname from player where pname=@pname) 
or away_team=(select tname from player where pname=@pname)
end
go

