use league
go
create proc team_rank
as
select tname as '队伍',points as '积分',
row_number() over(order by points desc)as '排名' 
from team
go