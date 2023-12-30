use league
go
create proc match_inf_team
@team varchar(20)
as
if not exists
(select 1 from match where home_team=@team or away_team=@team)
print '这支队伍没有比赛'
else
begin
select home_team as '主队',away_team as '客队',
home_score as '主场分数',away_score as '客场分数',
rounds as '比赛轮数',match_date as '比赛日期'
from match where home_team=@team or away_team=@team
end
go