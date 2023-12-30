use league
go
create trigger match_update on match
after insert as
declare match_cur cursor for (select home_team,away_team,
hpno1,hpno2,hpno3,
hpno4,apno1,apno2,
apno3,apno4,hplayer1_score,hplayer2_score,
hplayer3_score,aplayer1_score,aplayer2_score,aplayer3_score,
home_score,away_score from inserted)
declare @home_team varchar(20),@away_team varchar(20),
@hpno1 varchar(2),@hpno2 varchar(2),
@hpno3 varchar(2),@hpno4 varchar(2),
@apno1 varchar(2),@apno2 varchar(2),
@apno3 varchar(2),@apno4 varchar(2),
@hplayer1_score int,@hplayer2_score int,@hplayer3_score int,
@aplayer1_score int,@aplayer2_score int,@aplayer3_score int,
@home_score int,@away_score int
open match_cur
fetch next from match_cur into @home_team,@away_team,
@hpno1,@hpno2,@hpno3,
@hpno4,@apno1,@apno2,
@apno3,@apno4,@hplayer1_score,@hplayer2_score,
@hplayer3_score,@aplayer1_score,@aplayer2_score,@aplayer3_score,
@home_score,@away_score
while @@fetch_status=0
 begin
  begin
   update player
   set appearance=appearance+1
   where pno=@hpno1 and tname=@home_team;
   update player
   set appearance=appearance+1
   where pno=@hpno2 and tname=@home_team;
   update player
   set appearance=appearance+1
   where pno=@hpno3 and tname=@home_team;
   update player
   set appearance=appearance+1
   where pno=@hpno4 and tname=@home_team;
   update player
   set appearance=appearance+1
   where pno=@apno1 and tname=@away_team;
   update player
   set appearance=appearance+1
   where pno=@apno2 and tname=@away_team;
   update player
   set appearance=appearance+1
   where pno=@apno3 and tname=@away_team;
   update player
   set appearance=appearance+1
   where pno=@apno4 and tname=@away_team;
  end
  begin
   update player
   set goal=goal+@hplayer1_score
   where pno=@hpno1 and tname=@home_team;
   update player
   set goal=goal+@hplayer2_score
   where pno=@hpno2 and tname=@home_team;
   update player
   set goal=goal+@hplayer3_score
   where pno=@hpno3 and tname=@home_team;
   update player
   set goal=goal+@aplayer1_score
   where pno=@apno1 and tname=@away_team;
   update player
   set goal=goal+@aplayer2_score
   where pno=@apno2 and tname=@away_team;
   update player
   set goal=goal+@aplayer3_score
   where pno=@apno3 and tname=@away_team;
  end
  begin
  if @home_score is not null
   begin
   if @home_score>@away_score
   begin
    update team
    set points=points+3
    where tname=@home_team
   end
   else if @home_score=@away_score
   begin
    update team
    set points=points+1
    where tname=@home_score or tname=@away_team
   end
   else if @home_score<@away_score
   begin
    update team
    set points=points+3
    where tname=@away_score
   end
   end
  end
  fetch next from match_cur into @home_team,@away_team,
@hpno1,@hpno2,@hpno3,
@hpno4,@apno1,@apno2,
@apno3,@apno4,@hplayer1_score,@hplayer2_score,
@hplayer3_score,@aplayer1_score,@aplayer2_score,@aplayer3_score,
@home_score,@away_score
 end
close match_cur
deallocate match_cur
go