if [ $# -ne 1 ]; then
        echo "usage: $0 file"
	exit 1
fi

CSV_FILE="$1"

if [ ! -f "$CSV_FILE" ]; then
	echo "usage: $0 file"
	exit 1
fi

echo "************OSS1 - Project1************"
echo "*        StudentID : 12223711	      *"
echo "*        Name : Shinhyuk Kim	      *"
echo "***************************************"
echo

while true; do
	echo "[MENU]"
	echo "1. Search player stats by name in MLB data"
	echo "2. List top 5 players by SLG value"
	echo "3. Analyze the tem stats - average age and total home runs"
	echo "4. Compare players in different age groups"
	echo "5. Search the players who meet specific statistical conditions"
	echo "6. Generate a performance report (formatted data)"
	echo "7. Quit"
	read -p  "Enter your COMMAND (1~7) :" cmd

	case $cmd in
		1)
			read -p "Enter a player name to search: " playerName
			echo
	 		echo "Player stats for \"$playerName\":"
	        	awk -F',' -v name="$playerName" '$2==name {printf "Player: %s, Team: %s, Age: %s, WAR: %s, HR: %s, BA: %s\n", $2, $4, $3, $6, $14, $20}' "$CSV_FILE"
			echo
			;;
		2)
			read -p "Do you want to see the top 5 players by SLG? (y/n): " answer
			echo
			if [[ "$answer" == "y" ]]; then
				echo "***Top 5 Players by SLG***"
				awk -F, 'NR>1 && $8 >= 502 {print $2","$4","$22","$14","$15}' "$CSV_FILE" | sort -t, -k3 -nr | head -5 | awk -F, '{ i += 1; printf "%d. %s (Team: %s) - SLG: %s, HR: %s, RBI: %s\n", i, $1, $2, $3, $4, $5}'
			fi
			echo
			;;
		3)
			read -p "Enter team abbreviation (e.g., NYY, LAD, BOS): " team
			echo
			echo "Team stats for $team:"
			awk -F, -v team="$team" 'NR>1 && $4==team{age+=$3; hr+=$14; rbi+=$15; n++} END {
		       	if (n>0) {
				printf "Average age: %.1f\nTotal home runs: %d\nTotal RBI: %d\n", age/n, hr, rbi}   else{
				print "Team not found."
			}
		}' "$CSV_FILE"
			echo
		
			;;
		4)
			echo
			echo "Compare players by age groups:"
			echo "1. Groups A (Age < 25)"
			echo "2. Groups B (Age 25-30)"
			echo "3. Groups C (Age > 30)"
			read -p "Select age group (1-3): " grp
			echo
			case "$grp" in
				1)
					echo "Top 5 by SLG in Group A (Age < 25):"
					awk -F, 'NR>1 && $8>=502 && $3<25 {print $2","$4","$3","$22","$20","$14}' "$CSV_FILE" | sort -t, -k4 -nr | head -5 | awk -F, '{printf "%s (%s) - Age: %s, SLG: %s, BA: %s, HR: %s\n", $1, $2, $3, $4, $5, $6}'
					echo
					;;
				2)
					echo "Top 5 by SLG in Group B (Age 25-30):"
					awk -F, 'NR>1 && $8>502 && $3>=25 && $3<=30 {print $2","$4","$3","$22","$20","$14}' "$CSV_FILE" | sort -t, -k4 -nr | head -5 | awk -F, '{printf "%s (%s) - Age: %s, SLG: %s, BA: %s, HR: %s\n", $1, $2, $3, $4, $5, $6}'
					echo
					;;
				3)
					echo "Top 5 by SLG in Group C (Age > 30):"
					awk -F, 'NR>1 && $8>=502 && $3>30 {print $2","$4","$3","$22","$20","$14}' "$CSV_FILE" | sort -t, -k4 -nr | head -5 | awk -F, '{printf "%s (%s) - Age: %s, SLG: %s, BA: %s, HR: %s\n", $1, $2, $3, $4, $5, $6}'
					echo
					;;

			esac
			;;

		5)
			echo
			echo "Find players with specific criteria"
			read -p "Minimum home runs: " minHR
			read -p "Minimum batting average (e.g., 0.280): " minBA
			echo
			echo "Players with HR >= $minHR and BA >= $minBA:"
			awk -F, -v minHR="$minHR" -v minBA="$minBA" 'NR>1 && $8>=502 && $14>=minHR && $20>=minBA {print $2","$4","$14","$20","$15","$22}' "$CSV_FILE" | sort -t, -k3 -nr | awk -F, '{printf "%s (%s) - HR: %s, BA: %s, RBI: %s, SLG: %s\n", $1, $2, $3, $4, $5, $6}'
			echo
			;;

		6)
			read -p "Enter team abbreviation (e.g., NYY, LAD, BOS): " team
			echo
			echo "=================== $team PLAYER REPORT ==================="
			date '+Date: %Y/%m/%d'
			echo "PLAYER		    HR  RBI   AVG    OBP    OPS"
			awk -F, -v team="$team" 'NR>1 && $4==team {printf "%-18s %3d %4d %6.3f %6.3f %6.3f\n", $2, $14, $15, $20, $21, $23}' "$CSV_FILE" | sort -k2 -nr
			awk -F, -v team="$team" 'NR>1 && $4==team {n++} END {print "TEAM TOTLAS: " n " players"}' "$CSV_FILE"
			;;
		7)
			echo "Have a good day!"
			exit 0
			;;

		*)
			echo "Invalid command. Please enter a number between 1 and 7."
			;;



	esac
done

