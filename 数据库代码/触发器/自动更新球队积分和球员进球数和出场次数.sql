use league
go
create trigger points_goal_update on match after insert
as
if (select home_score from inserted) is not null
begin
 begin
  update player
  set appearance=appearance+1
  where pname=(select home_team_player1 from inserted);
  update player
  set appearance=appearance+1
  where pname=(select home_team_player2 from inserted);
  update player
  set appearance=appearance+1
  where pname=(select home_team_player3 from inserted);
  update player
  set appearance=appearance+1
  where pname=(select away_team_player1 from inserted);
  update player
  set appearance=appearance+1
  where pname=(select away_team_player2 from inserted);
  update player
  set appearance=appearance+1
  where pname=(select away_team_player3 from inserted);
 end
 begin
  update player
  set goal=goal+(select hplayer1_score from inserted)
  where pname=(select home_team_player1 from inserted);
  update player
  set goal=goal+(select hplayer2_score from inserted)
  where pname=(select home_team_player2 from inserted);
  update player
  set goal=goal+(select hplayer3_score from inserted)
  where pname=(select home_team_player3 from inserted);
  update player
  set goal=goal+(select aplayer1_score from inserted)
  where pname=(select away_team_player1 from inserted);
  update player
  set goal=goal+(select aplayer2_score from inserted)
  where pname=(select away_team_player2 from inserted);
  update player
  set goal=goal+(select aplayer3_score from inserted)
  where pname=(select away_team_player3 from inserted);
 end
 begin
  if (select home_score from inserted)
  >(select away_score from inserted)
   begin
   update team
   set points=points+3
   where tname=(select home_team from inserted)
   end
  else if (select home_score from inserted)
  =(select away_score from inserted)
   begin
   update team
   set points=points+1
   where tname=(select home_team from inserted) 
   or tname=(select away_team from inserted)
   end
  else if (select home_score from inserted)
  <(select away_score from inserted)
  begin
   update team
   set points=points+3
   where tname=(select away_team from inserted)
  end
 end
end
go