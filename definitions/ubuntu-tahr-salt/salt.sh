sudo apt-get install python-software-properties
#curl -L http://bootstrap.saltstack.org | sudo sh -s -- git develop
pip install gitdb GitPython

#curl -L http://bootstrap.saltstack.org | sudo sh 
#curl -L http://bootstrap.saltstack.org | sudo sh -s -- -M

sudo add-apt-repository ppa:saltstack/salt
sudo apt-get install salt-master salt-minion salt-syndic

initctl stop salt-minion
initctl stop salt-master

