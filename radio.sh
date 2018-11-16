#!/bin/bash
terms=0
trap ' [ $terms = 1 ] || { terms=1; kill -TERM -$$; };  exit' EXIT INT HUP TERM QUIT 

info() {
echo "Η ώρα είναι "$(date +"%T")""
echo "Ακούτε "$stathmos_name""
echo "Πατήστε Q για έξοδο"

}
options=("Real FM 97.8" "Skai 100.3" "ΕΡΑ Σπορ 101.8" "Έξοδος")
PS3="Διαλέξτε σταθμό : " 
select opt in "${options[@]}"

do	

    case $opt in
        "Real FM 97.8")
            stathmos_name="Real FM 97.8"
	    stathmos_url="http://realfm.live24.gr:80/realfm"
	    break
	    ;;
        "Skai 100.3")
	    stathmos_name="Σκάι 100.3"
	    stathmos_url="http://secure1.live24.gr/skai1003"
	    break
	    ;;
        "ΕΡΑ Σπορ 101.8")
	    stathmos_name="ΕΡΑ Σπορ 101.8"
	    stathmos_url="http://radiostreaming.ert.gr:80/ert-erasport"
	    break
	    ;;
        "Έξοδος")
            exit 0
            ;;
        *) echo "μη έγκυρος αριθμός $REPLY";;
    esac
done



mplayer $stathmos_url &> /dev/null &
while true

do 
	   clear 
	   info
	   sleep 0.1
	   read -n 1 -t 0.1 input                  # Για μικρότερη αναμονή της read
	   if [[ $input = "q" ]] || [[ $input = "Q" ]] 
   		then
	        echo
           	break
           fi
done
