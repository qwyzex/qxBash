yellow='\033[1;33m'
blue='\033[0;34m'
nc='\033[0m'

echo -e "${yellow}WARNING!!!${nc} THIS WILL RESET ${blue}'.bashrc'${nc} AND ${blue}'.bash_profile'${nc} TO IT'S DEFAULT STATE! BE CAREFULL!"
select yn in "Yes" "No"; do
	case $yn in 
		Yes ) cp .bash_profile ~; rm ~/.bashrc; rm -r ~/qxBash; echo "FINISHED"; break;;
		No ) echo "CANCELLED"; exit;;
	esac
done
