use league
go
create proc match_inf_date
@match_date datetime
as
if not exists(select 1 from match where match_date=@match_date)
print '����û�б���'
else
begin
select home_team as '����',away_team as '�Ͷ�',
home_score as '��������',away_score as '�ͳ�����',
rounds as '��������',match_date as '��������'
from match where match_date=@match_date
end
go