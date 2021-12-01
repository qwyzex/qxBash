# MAKE FOLDER IN HOME DIRECTORY
mkdir ~/qxBash
mkdir ~/qxBash/backup
mkdir ~/qxBash/qxEssentials
cp help.sh ~/qxBash
cp qxEssentials/bashrc qxEssentials/re-prompt.sh ~/qxBash/qxEssentials

# BACKUP ESSENTIALS FILES
cp ~/.bashrc ~/qxBash/backup
cp ~/.bash_profile ~/qxBash/backup

# RENAME FILES
mv ~/qxBash/qxEssentials/bashrc ~/qxBash/qxEssentials/.bashrc

echo -e ""

# GREETING NAME
read -p "What Do You Want To Be Called? " name
echo -e "\nname=$name" >> ~/.bash_profile

# ECHOING IN COMMAND TO '.bash_profile'
echo -e "\nclear\n\nsource ~/.bashrc\n" >> ~/.bash_profile
echo -e '# COLORS\nblack="\033[0;30m"\nred="\033[0;31m"\ngreen="\033[0;32m"\nnc="\033[0m"' >> ~/.bash_profile
echo 'echo -e "\nWelcome, ${green}${name}${nc}!"' >> ~/.bash_profile
# echo "cd ~" >> ~/.bash_profile

# CHANGE SHELL PROMPT
echo -e "\nDo You Want To Change The Shell Prompt Too?"
select sp in "[ user@host <time> ] dir >>" "user@host >> dir {DOLLAR}" "No"; do
	case $sp in 
		"[ user@host <time> ] dir >>" ) echo 'export PS1="\n\e[1;34m[ \u@\h ]\e[m \e[1;32m\W\e[m \n>> "' >> ~/.bash_profile; echo "SUCCESSFULLY CHANGE SHELL PROMPT, START A NEW SESSION TO APPLY THE CHANGE OR 'source ~/.bash_profile'"; break;;
		"user@host >> dir {DOLLAR}" ) echo '\e[1;33\u@\h\e[m >> \e[1;32m\W\e[m \n\$' >> ~/.bash_profile; echo "SUCCESSFULLY CHANGE SHELL PROMPT, START A NEW SESSION TO APPLY THE CHANGE OR 'source ~/.bash_profile'"; break;;
		"No" ) echo 'You Can Still Do This Again If You Want. Run ~/qxBash/qxEssentials/re-prompt.sh'; break;;
	esac
done

# MY CUSTOM '.bashrc' ALIASES
echo -e "\nDo You Want To Use My Custom '.bashrc' Aliases? (This Will Overwrite The Current File. However, You Can Restore The Previous '.bahsrc' At '~/qxBash/backup' Or Run '~/qxBash/reset.sh' !)"
select yn in "Yes" "No"; do
	case $yn in 
		Yes ) cp ~/qxBash/qxEssentials/.bashrc ~; break;;
		No ) break;;
	esac
done

# STARTUP DIRECTORY
echo -e "\nWhich Directory You Want Load When Startup?" 
select dir in "~ Home" "/ Root" "Not Now"; do
	case $dir in
		"~ Home" ) echo "cd ~" >> ~/.bash_profile; break;;
		"/ Root" ) echo "cd /" >> ~/.bash_profile; break;;
		"Not Now" ) echo "CANCELLED"; break;;
	esac
done

# FINISHING
echo -e "\nalias qx-help='~/qxBash/help.sh'" >> ~/.bashrc
echo -e "\nThank You For using qxBash, ${name}!\nYou Can Type 'qx-help' For More Info.\nPlease 'source ~/.bashrc' First If You Want To Use The New Aliases"
echo "If You Don't Like The Script You Can Go To Where You Clone The Repo And Run './reset.sh'"
