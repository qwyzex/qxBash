mkdir ~/qxBash
cp help.sh ~/qxBash

echo -e ""

read -p "What Do You Want To Be Called? " name
echo -e "\nname=$name" >> ~/.bash_profile

echo -e "\nclear\n\nsource ~/.bashrc\n" >> ~/.bash_profile
echo -e '# COLORS\nblack="\033[0;30m"\nred="\033[0;31m"\ngreen="\033[0;32m"\nnc="\033[0m"' >> ~/.bash_profile
echo 'echo -e "\nWelcome, ${green}${name}${nc}!"' >> ~/.bash_profile
# echo "cd ~" >> ~/.bash_profile

echo -e "\nDo You Want To Use My Custom '.bashrc' Aliases? (This Will Erase The Existing '.bashrc' File! Be Careful!)"
select yn in "Yes" "No"; do
	case $yn in 
		Yes ) cp .bashrc ~; break;;
		No ) exit;;
	esac
done

echo -e "\nWhich Directory You Want Load With Startup?" 
select dir in "~ Home" "/ Root" "Not Now"; do
	case $dir in
		"~ Home" ) echo "cd ~" >> ~/.bash_profile; break;;
		"/ Root" ) echo "cd /" >> ~/.bash_profile; break;;
		"Not Now" ) echo "CANCELLED"; break;;
	esac
done

echo "alias qx-help='~/qxBash/help.sh'" >> ~/.bashrc
echo -e "\nThank You For using qxBash, ${name}!\nYou Can Type 'qx-help' For More Info.\nPlease 'source ~/.bashrc' First If You Want To Use The New Aliases"
echo "If You Don't Like The Script You Can Go To Where You Clone The Repo And Run './reset.sh'"
