use league
go
insert player
values('法蒂','巴塞罗那','10','右','2002-10-31',default,'普通队员',default,'健康','前场'),
      ('布斯克茨','巴塞罗那','5','右','1988-7-16',default,'队长',default,'健康','中场'),
      ('德斯特','巴塞罗那','2','右','1995-1-20',default,'普通队员',default,'健康','后场'),
      ('内托','巴塞罗那','13','右','1989-7-19',default,'普通队员',default,'健康','门将')
go
exec player_inf '布斯克茨'
go