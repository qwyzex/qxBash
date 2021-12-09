# VARIABLES
gr='\033[1;32m'
yl='\033[1;33m'
rd='\033[1;31m'
bl='\033[1;36m'
nc='\033[0m'

# CONFIRMATION
echo -e "\nDo You Want To Continue?"
select yn in "Yes" "No"; do
	case $yn in 
		"Yes" ) echo -e "\n${gr}Proceeding...${nc}"; break;;
		"No" ) echo -e "\n${yl}Cancelling..."; echo -e "${rd}CANCELLED${nc}"; exit;;
	esac
done

# MAKE FOLDER IN HOME DIRECTORY
mkdir 							~/qxBash # make qxBash folder in home directory
mkdir 							~/qxBash/backup # make backup folder for current .bashrc and .bash_profile
mkdir 							~/qxBash/essentials # make folder for essentials qxBash scripts
cp help.sh 						~/qxBash # copying help.sh to qxBash in home dir
cp essentials/bashrc  			~/qxBash/essentials # copying my custom .bashrc file to qxBash/ess... in home dir

# BACKUP ESSENTIALS FILES
cp ~/.bashrc  		 			~/qxBash/backup # backing up current .bashrc and
cp ~/.bash_profile 				~/qxBash/backup # .bash_profile to qxBash/backup in home dir

# RENAME FILES
mv ~/qxBash/essentials/bashrc 	~/qxBash/essentials/.bashrc #rename the file bc i can't upload to github with ori name

echo -e ""

# GREETING NAME
read -p "What Do You Want To Be Called? " name
echo -e "\nname=$name" >> ~/.bash_profile

# ECHOING IN COMMAND TO '.bash_profile'
echo -e "\nclear\n\nsource ~/.bashrc\n" >> ~/.bash_profile
echo -e '# COLORS\nblack="\033[0;30m"\nred="\033[0;31m"\ngreen="\033[0;32m"\nnc="\033[0m"' >> ~/.bash_profile
echo 'echo -e "\nWelcome, ${green}${name}${nc}!"' >> ~/.bash_profile

# CHANGE SHELL PROMPT
echo -e "\nDo You Want To Change The Shell Prompt Too?"
select sp in "[ user@host <time> ] dir >>" "user@host >> dir {DOLLAR}" "No"; do
	case $sp in 
		"[ user@host <time> ] dir >>" ) echo 'export PS1="\n\e[1;34m[ \u@\h ]\e[m \e[1;32m\W\e[m \n>> "' >> ~/.bash_profile; echo -e "\n${gr}SUCCESSFULLY CHANGE SHELL PROMPT, START A NEW SESSION TO APPLY THE CHANGE OR 'source ~/.bash_profile'${nc}"; break;;
		"user@host >> dir {DOLLAR}" ) echo '\e[1;33\u@\h\e[m >> \e[1;32m\W\e[m \n\$' >> ~/.bash_profile; echo -e "\n${gr}SUCCESSFULLY CHANGE SHELL PROMPT, START A NEW SESSION TO APPLY THE CHANGE OR 'source ~/.bash_profile'${nc}"; break;;
		"No" ) echo -e "${bl}Run 'qx-help' for the help to re-initialize the prompt!${nc}"; break;;
	esac
done

# MY CUSTOM '.bashrc' ALIASES
echo -e "\nDo You Want To Use My Custom '.bashrc' Aliases? (This Will Overwrite The Current File. You Can Restore It At '~/qxBash/backup'"
select yn in "Yes" "No"; do
	case $yn in 
		Yes ) cp ~/qxBash/essentials/.bashrc ~; echo -e "\n${gr}FINISHED${nc}"; break;;
		No ) break;;
	esac
done

# STARTUP DIRECTORY
echo -e "\nWhich Directory You Want Load When Startup?" 
select dir in "~ Home" "/ Root" "Not Now"; do
	case $dir in
		"~ Home" ) echo "cd ~" >> ~/.bash_profile; echo -e "\n${gr}FINISHED${nc}"; break;;
		"/ Root" ) echo "cd /" >> ~/.bash_profile; echo -e "\n${gr}FINISHED${nc}"; break;;
		"Not Now" ) break;;
	esac
done

# FINISHING
echo -e "\nalias qx-help='~/qxBash/help.sh'" >> ~/.bashrc
echo -e "\nThank You For using ${bl}qxBash${nc},${gr} ${name}${nc}!\nYou Can Type 'qx-help' For More Info.\nPlease 'source ~/.bashrc' First If You Want To Use The New Aliases."
echo -e "If You Don't Like The Script You Can Go To Where You Clone The Repo And Run ${rd}'./reset.sh'${nc}."
