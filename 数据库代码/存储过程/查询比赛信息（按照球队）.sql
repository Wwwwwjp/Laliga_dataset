use league
go
create proc match_inf_team
@team varchar(20)
as
if not exists
(select 1 from match where home_team=@team or away_team=@team)
print '��֧����û�б���'
else
begin
select home_team as '����',away_team as '�Ͷ�',
home_score as '��������',away_score as '�ͳ�����',
rounds as '��������',match_date as '��������'
from match where home_team=@team or away_team=@team
end
go