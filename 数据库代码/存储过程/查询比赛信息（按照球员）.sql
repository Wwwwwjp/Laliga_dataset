use league
go
create proc match_inf_player
@pname varchar(20)
as
if not exists
(select 1 from match 
where home_team=(select tname from player where pname=@pname) 
or away_team=(select tname from player where pname=@pname))
print '该球员没有比赛'
else
begin
select home_team as '主队',away_team as '客队',
home_score as '主场分数',away_score as '客场分数',
rounds as '比赛轮数',match_date as '比赛日期'
from match 
where home_team=(select tname from player where pname=@pname) 
or away_team=(select tname from player where pname=@pname)
end
go

