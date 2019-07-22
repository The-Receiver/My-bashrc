# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


set -o vi #Allow vim mode in bash
shopt -s autocd #Cd into directory by typing name

#Some aliases
alias dl="youtube-dl"
alias default="redshift -O 5500 && xinput enable 10"
alias night="redshift -O 2000 && xinput disable 10"
alias book="calibre --detach"
alias killwine="wineserver -k"


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#prints finnish anthem
function maame {
echo " "
echo "Oi maamme, Suomi, synnyinmaa,"
echo "soi, sana kultainen!"
echo "Ei laaksoa, ei kukkulaa,"
echo "ei vettä, rantaa rakkaampa"
echo "kuin kotimaa tää pohjoinen,"
echo "maa kallis isien."
echo "Ei laaksoa, ei kukkulaa,"
echo "ei vettä, rantaa rakkaampaa"
echo "kuin kotimaa tää pohjoinen,"
echo "maa kallis isien."
echo " "
}

#Command line star wars
alias lucas="telnet towel.blinkenlights.nl"

#Downloads all the images in 4chan thread given as argument
function dlchan {

wget -nd -H -r -l 1 -p -Dis2.4chan.org -A jpg,jpeg,png,gif -e robots=off $1

}

#Opens directory passed in as argument in file explorer
function open {
cd $1 && xdg-open .
}

#Gives me ram usage, CPU, core temp
function status {
screenfetch | grep -o RAM.*$ && sensors | grep fan1 && sensors | 
grep temp1 
#Gets %CPU from top
top -bn2 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print 100 - $1"%"}' | sed 's/^/CPU: /'

}

#lsts the content of directory passed in as argument
function show {

cd $1 && ls -a

}
