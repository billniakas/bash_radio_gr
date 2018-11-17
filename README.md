# bash_radio_gr
Έαν απλό bash script για να παίζετε τους αγαπημένους σας σταθμούς στο τερματικό. Απλά προσθέτε το όνομα και το URL του σταθμού στο ```gr_stations.txt``` όπου κάθε γραμμή πρέπει να είναι της μορφής 

```Όνομα σταθμού,URL_σταθμού```

Το τρέχετε από το φάκελο όπου το έχετε αποθηκεύσει δίνοντας στο τερματικό
```./radio.sh```

Απαιτείται το πακέτο ```mplayer``` ή το ```mpv``` για να δουλεψει

Σε κάποιες διανομές δίνεται κατευθείαν είτε το ```mplayer``` είτε το ```mpv``` στα αποθετήριά τους, οπότε καλό είναι να το ελέγξετε πρώτα

## Σε Debian based διανομές
```sudo apt install mplayer``` ή ```sudo apt install mpv```
## Σε Arch based διανομές
```sudo pacman -S mplayer``` ή ```sudo pacman -S mpv```
## Σε Fedora based διανομές
```sudo dnf -y install mplayer``` ή ```sudo dnf -y install mpv```
## Σε OpenSuse Linux
```sudo zypper in mplayer``` ή ```sudo zypper in mpv```
## Σε CentOS Linux (από το nux-desktop repository)
```sudo yum -y install mplayer``` ή ```sudo yum -y install mpv```
## Σε FreeBSD Unix
```sudo pkg install mplayer``` ή ```sudo pkg install mpv```
