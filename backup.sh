#!/bash/sh
#copy files to the directory
inittag="$(herbstclient attr tags.focus.name)"
herbstclient add BACKUP
herbstclient use BACKUP
#linking of files
#copy the current dotfiles to the current address, then delete them and symlink them? 
xterm -e "cd $HOME/Documents/DotfileBackup; \
rm -r DotfileBackup/dotfiles ;\ 
mkdir DotfileBackup/dotfiles ;\ 
cd ./dotfiles ;\ 
cp $HOME/.xinitrc .xinitrc; read"
#cp $HOME/.config/herbstluftwm/autostart .DotfileBackup/dotfiles/autostart
#cp $HOME/.config/lemonbar.sh ./dotfiles
#cp $HOME/.config/scriptswitcher.sh DotfileBackup/dotfiles
#cp $HOME/XTerm DotfileBackup/dotfiles
#cp $HOME/.Xresources DotfileBackup/dotfiles


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
#ln -s $HOME/.xinitrc DotfileBackup/dotfiles/.xinitrc
#ln -s $HOME/.config/herbstluftwm/autostart DotfileBackup/dotfiles/autostart
#ln -s $HOME/.config/lemonbar.sh DotfileBackup/dotfiles/lemonbar.sh
#ln -s $HOME/.config/scriptswitcher.sh DotfileBackup/dotfiles/scriptswitcher.sh
#ln -s $HOME/XTerm DotfileBackup/dotfiles/XTerm
#ln -s $HOME/.Xresources DotfileBackup/dotfiles/.Xresources