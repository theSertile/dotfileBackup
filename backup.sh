#!/bash/sh
#copy files to the directory
inittag="$(herbstclient attr tags.focus.name)"
herbstclient add BACKUP
herbstclient use BACKUP
#linking of files
#copy the current dotfiles to the current address, then delete them after
cd $HOME/Documents/DotfileBackup
#clears the dotfiles directory of symlinks, remakes it and then copies the files over
rm -r ./dotfiles
mkdir ./dotfiles
cd ./dotfiles

cp $HOME/.xinitrc .xinitrc
cp $HOME/.config/herbstluftwm/autostart autostart
cp $HOME/.config/customs/lemonbar.sh lemonbar.sh
cp $HOME/.config/customs/scriptswitcher.sh scriptswitcher.sh
cp $HOME/XTerm XTerm
cp $HOME/.Xresources .Xresources
cp $HOME/.config/qutebrowser/config.py config.py
cp $HOME/.bash_profile .bash_profile

#USER INTERFACE HERE FOR GITHUB LOGIN

xterm -e "cd $HOME/Documents/DotfileBackup;\
git init; \
git add --all; \
git commit -m 'automatically pushed at $(date)';\
git push -u origin master;\
sleep 1"
herbstclient close_or_remove
herbstclient use $inittag
herbstclient merge_tag BACKUP $inittag

#make symlinks for them to keep around for editability

#clears directory then goes inside it
cd ..
rm -r ./dotfiles
mkdir ./dotfiles
cd ./dotfiles
#making symlinks
ln -s $HOME/.xinitrc .xinitrc
ln -s $HOME/.config/herbstluftwm/autostart ./autostart
ln -s $HOME/.config/customs/lemonbar.sh ./lemonbar.sh
ln -s $HOME/.config/customs/scriptswitcher.sh ./scriptswitcher.sh
ln -s $HOME/XTerm ./XTerm
ln -s $HOME/.Xresources ./.Xresources
ln -s $HOME/.config/qutebrowser/config.py config.py
ln -s $HOME/.bash_profile .bash_profile
