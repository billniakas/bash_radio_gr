#!/bin/bash
terms=0
trap ' [ $terms = 1 ] || { terms=1; kill -TERM -$$; };  exit' EXIT INT HUP TERM QUIT 

player=$(which mpv 2>/dev/null || which mplayer 2>/dev/null  || echo "1")
# echo $player
if [[ $player = 1 ]];
	then
	echo "Δε βρέθηκε συμβατός player, συμβατοί players είναι οι mplayer και mpv"
	exit
fi


info() {
echo "Η ώρα είναι "$(date +"%T")""
echo "Ακούτε "$stathmos_name""
echo "Πατήστε Q/q για έξοδο"

}
num=0 

while IFS='' read -r line || [[ -n "$line" ]]; do
    num=$(( $num + 1 ))
    echo $num")" $line | cut -d "," -f1
done < gr_stations.txt

# echo $num

while true 
do
read -rp "Διαλέξτε Σταθμό : " input
if [[ $input -gt 0 ]] | [[ $input -le $num ]];
	then
	stathmos_name=$(cat gr_stations.txt | head -n$(( $input )) | tail -n1 | cut -d "," -f1)
	stathmos_url=$(cat gr_stations.txt | head -n$(( $input )) | tail -n1 | cut -d "," -f2)
	echo 
	echo $stathmos_name
	echo $stathmos_url
	break

	else
	echo "Αριθμός εκτός λίστας"
	
fi
done



$player $stathmos_url &> /dev/null &
while true

do 
	   clear 
	   info
	   sleep 0.1
	   read -n 1 -t 0.1 input                  # Για μικρότερη αναμονή της read
	   if [[ $input = "q" ]] || [[ $input = "Q" ]] 
   		then
		echo
	        echo "Έξοδος..."
           	break
           fi
done
