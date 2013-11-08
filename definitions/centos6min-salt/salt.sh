
yum -y install python-devel salt-master salt-minion python-halite --enablerepo epel-testing
pip install gitdb GitPython

for svc in master minion syndic
do
  chkconfig salt-${svc} off
done

