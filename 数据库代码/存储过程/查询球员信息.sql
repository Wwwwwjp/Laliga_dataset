use league 
go
create proc player_inf
@pname varchar(20)
as
if not exists(select 1 from player where pname=@pname)
print '����Ա������'
else
begin
select tname as '�������',pno as '����',habitual_foot as '���ý�',
year(getdate())-year(birthday) as '����',goal as '������',teamrole as '�������',
appearance as '��������',situation as '����״��',
main_position as '����λ��'
from player where pname=@pname
end
go