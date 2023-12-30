use league
go
create proc match_inf_date
@match_date datetime
as
if not exists(select 1 from match where match_date=@match_date)
print '该日没有比赛'
else
begin
select home_team as '主队',away_team as '客队',
home_score as '主场分数',away_score as '客场分数',
rounds as '比赛轮数',match_date as '比赛日期'
from match where match_date=@match_date
end
go