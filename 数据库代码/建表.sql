create database league
on primary
(name = 'league',
filename='d:\database\league.mdf',
size=100mb,
maxsize=unlimited,
filegrowth=10%)
log on
(name='league_log',
filename='d:\database\league_log.ldf',
size=5mb,
maxsize=100mb,
filegrowth=5%
)
go
use league
go
create table team(
tname varchar(20) not null unique,
coach varchar(20) not null,
points int not null default (0),
primary key (tname)
);
create table player(
pname varchar(20) not null,
tname varchar(20),
pno varchar(2) not null,
habitual_foot char(2) check(habitual_foot='��'or habitual_foot='��'),
birthday date not null,
goal int default (0),
teamrole varchar(10) check(teamrole='�ӳ�' or teamrole='��ͨ��Ա'),
appearance int default(0),
situation char(4) check(situation='����'or situation='�˲�'),
main_position char(4) 
check(main_position='ǰ��'or main_position='�г�'or main_position='��' or main_position='�Ž�'),
primary key (tname,pno),
foreign key(tname)references team(tname),
)
create table match(
home_team varchar(20),
away_team varchar(20),
hpno1 varchar(2) not null,
hpno2 varchar(2) not null,
hpno3 varchar(2) not null,
hpno4 varchar(2) not null,
apno1 varchar(2) not null,
apno2 varchar(2) not null,
apno3 varchar(2) not null,
apno4 varchar(2) not null,
hplayer1_score int default (0),
hplayer2_score int default (0),
hplayer3_score int default (0),
aplayer1_score int default (0),
aplayer2_score int default (0),
aplayer3_score int default (0),
home_score int default (null),
away_score int default (null),
rounds int,
match_date date not null,
primary key(home_team,away_team,match_date),
foreign key (home_team)references team(tname),
foreign key (away_team)references team(tname)
)
go