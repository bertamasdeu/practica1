#!/bin/bash

#Activitat 1
cut -d’,’ -f 1-11,13-15 supervivents.csv > temporal.csv

#Activitat 2
awk -F',' '{if ($14 == "False") print $0}' temp.csv > temps.csv

#Activitat 3
awk -F',' '{if ($8 <= 1000000) print $0 ", Bo"}' temps.csv >> tempo.csv
awk -F',' '{if ($8 >= 10000000) print $0 ", Estrella"}' temps.csv >> tempo.csv
awk -F',' '{if ($8 < 10000000 && $8 > 1000000 ) print $0 ", Exel·lent"}' temps.csv >> tempo.csv


#Activitat 4
echo  "Calcular percentatge de Likes i Dislikes"
echo "$(head -n 1 tempo.csv),Rlikes,Rdislikes" > sortida.csv
	tail -n +2 tempo.csv  |while IFS=',' read -r  video_id trending_date title channel_title category_id publish_time tags views likes dislikes comment_count thumbnail_link comments_dissabled rating_dissabled video_error 

	Rlikes=$(( (likes * 100) / views ))
	Rdislikes=$(( (dislikes * 100) / views ))
		fi
echo "$video_id,$trending_date,$title,$channel_title,$category_id,$publish_time,$tags,$views,$likes,$dislikes,$comment_count,$thumbnail_link,$comments_dissabled,$rating_dissabled,$video_error" 
	done 

fi 
