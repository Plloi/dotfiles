#installs brew.sh
function install-brew(){
	# TODO: implement me

}

#Restore brew packages
function import-brew(){
	# TODO: implement me
}

#update brew forumulae
function freshbrew(){
	brew update && brew upgrade;
	for app in $(brew cask list); do 
		cver="$(brew cask info "${app}" | head -n 1 | cut -d " " -f 2)";
		ivers=$(ls -1 "/usr/local/Caskroom/${app}/.metadata/" | tr '\n' ' ' | sed -e 's/ $//');
		aivers=(${ivers});
		nvers=$(echo ${#aivers[@]});
		if [[ ${nvers} -eq 1 ]];
			then echo "${ivers}" | grep -q "^${cver}$" && { echo "[*] Latest version already installed :) Skipping changes ..."; continue; };
		fi;
		echo "Updating ${app} ...";
		brew cask uninstall "${app}" --force;
		brew cask install "${app}";
	done;
	echo "Done";
}

#Export brew packages
function export-brew(){
	brew leaves > ~/lib/Darwin/brew/leaves.lst;
	brew cask list > ~/lib/Darwin/brew/casks.lst;
	echo "Done";
}