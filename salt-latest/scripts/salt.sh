yum -y install python-devel python-argparse salt-master salt-minion salt-cloud python-halite --enablerepo epel-testing
pip install gitdb GitPython 

for svc in master minion 
do
  chkconfig salt-${svc} off
done

