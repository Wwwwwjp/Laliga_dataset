use league
go
create proc goal_rank
as
select pname as '姓名',tname as '球队',pno as '号码',goal as '进球数',
row_number() over (order by goal desc) as '排名'
from player 
go