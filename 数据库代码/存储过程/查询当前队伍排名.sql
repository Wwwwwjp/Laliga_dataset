use league
go
create proc team_rank
as
select tname as '����',points as '����',
row_number() over(order by points desc)as '����' 
from team
go