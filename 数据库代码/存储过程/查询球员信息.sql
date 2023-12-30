use league 
go
create proc player_inf
@pname varchar(20)
as
if not exists(select 1 from player where pname=@pname)
print '该球员不存在'
else
begin
select tname as '所属球队',pno as '号码',habitual_foot as '惯用脚',
year(getdate())-year(birthday) as '年龄',goal as '进球数',teamrole as '队内身份',
appearance as '出场次数',situation as '健康状况',
main_position as '主打位置'
from player where pname=@pname
end
go