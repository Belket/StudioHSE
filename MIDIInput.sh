#!/bin/bash
play_checked=0
export SNOWMIX=/usr/local/lib/Snowmix-0.5.1
aseqdump -p "WORLDE easy pad" | \
while IFS=" ," read src ev1 ev2 ch label1 data1 label2 data2 rest; do
	case "$ev1 $ev2 $data1" in
		"Note on 39" ) echo "tcl eval SceneSetState 0 1 0" | nc 127.0.0.1 9999 ;; #pad 1
		"Note on 48" ) echo "tcl eval SceneSetState 1 1 0" | nc 127.0.0.1 9999 ;; #pad 2
		"Note on 45" ) echo "tcl eval SceneSetState 2 1 0" | nc 127.0.0.1 9999 ;; #pad 3
		"Note on 43" ) echo "tcl eval SceneSetState 3 1 0" | nc 127.0.0.1 9999 ;; #pad 4
		"Note on 51" ) echo "tcl eval SceneSetState 4 1 0" | nc 127.0.0.1 9999 ;; #pad 5
		"Note on 49" ) echo Pad 6 pressed ;;
		"Note on 36" ) echo Pad 7 pressed ;;
		"Note on 38" ) echo Pad 8 pressed ;;
		"Note on 40" ) echo Pad 9 pressed ;;
		"Note on 42" ) echo Pad 10 pressed ;;
		"Note on 44" ) echo Pad 11 pressed ;;
		"Note on 46" ) echo Pad 12 pressed ;;

		"Note on 1" ) echo Bottom left button pressed ;;
		"Note on 2" ) echo Bottom right button pressed ;;

		"Control change 49" )
		if [ $data2 -eq 127 ]
		then 
			echo Rewind button pressed 
		fi ;;

		"Control change 47" )
		if [ $data2 -eq 127 ]
		then 
			echo Backward button pressed
		fi ;;

		"Control change 48" )
		if [ $data2 -eq 127 ]
		then 
			echo Forward button pressed
		fi ;;

		"Control change 44" )
		if [ $data2 -eq 127 ]
		then 
			echo Record button pressed 
		fi ;;

		"Control change 46" )
		if [ $data2 -eq 127 ]
		then 
			/home/studio/killsnowmix.sh #stop button
			play_checked=0
		fi ;;

		"Control change 45" )
		if [ $data2 -eq 127 ]
		then
			if [ $play_checked = 0 ]
			then	
				/usr/bin/gnome-terminal -e myscene #play button
				play_checked=1
			fi
		fi ;;
	esac
done
