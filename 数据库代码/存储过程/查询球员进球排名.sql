use league
go
create proc goal_rank
as
select pname as '����',tname as '���',pno as '����',goal as '������',
row_number() over (order by goal desc) as '����'
from player 
go