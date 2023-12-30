use league
go
create trigger match_insert on match
for insert as
if exists(select * from inserted a where
 a.hpno1 not in(select pno from player where tname=a.home_team) or
 a.hpno2 not in(select pno from player where tname=a.home_team) or
 a.hpno3 not in(select pno from player where tname=a.home_team) or
 a.hpno4 not in(select pno from player where tname=a.home_team) or
 a.apno1 not in(select pno from player where tname=a.away_team) or
 a.apno2 not in(select pno from player where tname=a.away_team) or
 a.apno3 not in(select pno from player where tname=a.away_team) or
 a.apno4 not in(select pno from player where tname=a.away_team))
begin
 print '有球员不在相应球队中'
 rollback transaction
end
go