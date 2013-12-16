
#curl -L http://bootstrap.saltstack.org | sudo sh -s -- git develop
pip install gitdb GitPython

curl -L http://bootstrap.saltstack.org | sudo sh 
curl -L http://bootstrap.saltstack.org | sudo sh -s -- -M

initctl stop salt-minion
initctl stop salt-master

