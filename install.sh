#! /bin/sh

# Check if starship is installed, if not then install starship
if ! command -v starship >/dev/null 2>&1
then
   sh -c "$(curl -fsSL https://starship.rs/install.sh)"
else
    echo "starship is installed"
exit
fi

# Add the below lines to the .bashrc file to activate starship, if using some other shell copy the same lines from .bashrc to .rc file of the shell you are using
echo -e "export STARSHIP_CONFIG=~/.config/starship/starship.toml" >> .bashrc
echo -e 'eval "$(starship init bash)"' >> .bashrc

# resource the .bashrc file
source ~/.bashrc

# check if the starship directory exists, if it does not exist create it and copy over the starship.toml config file over.
starship_directory='~/.config/starship'
if [ -d $starship_directory ];then
	echo "directory exists, copying over starship config file"
	cp starship.toml $starship_directory
else
	mkdir -p ~/.config/starship && cp starship.toml $starship_directory
fi

echo "Installation complete"
