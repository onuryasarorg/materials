
if [ -d "/home/vagrant/lemoras_devops" ]; then
   cd "/home/vagrant/lemoras_devops"
   git pull
else
   git clone https://clone_lemoras:lemorasRead@bitbucket.org/onurid/lemoras_devops.git
fi;
