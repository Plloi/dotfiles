export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
unamestr=`uname`

echo "Loading Common Libraries..."; 
for file in `find ~/lib -name "*.sh" -maxdepth 1 2> /dev/null`; do 
	. $file;
done;
echo "Done!"

echo "Loading $unamestr Libraries";
for file in `find ~/lib/$unamestr -name "*.sh" -maxdepth 1 2> /dev/null`; do 
	. $file;
done;
echo "Done!"
