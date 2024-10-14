#!/bin/bash

#Activitat 1
cut -d',' -f 1-11,13-15 supervivents.csv > temporal.csv

#Activitat 2
awk -F',' '{if ($14 == "False") print $0}' temp.csv > temps.csv

#Activitat 3
awk -F',' '{if ($8 <= 1000000) print $0 ", Bo"}' temps.csv >> tempo.csv
awk -F',' '{if ($8 >= 10000000) print $0 ", Estrella"}' temps.csv >> tempo.csv
awk -F',' '{if ($8 < 10000000 && $8 > 1000000 ) print $0 ", Exel·lent"}' temps.csv >> tempo.csv


#Activitat 4
echo  "Calcular percentatge de Likes i Dislikes"
echo "$(head -n 1 tempo.csv),Rlikes,Rdislikes" > sortida.csv
	tail -n +2 tempo.csv  |while  read -r  video_id trending_date title channel_title category_id publish_time tags views likes dislikes comment_count thumbnail_link comments_dissabled rating_dissabled video_error; do 
	if [[$views <= 0 ]]; then
		Rlikes=0
		Rdislikes=0
	else
                Rlikes=$(( (likes * 100) / views ))
                Rdislikes=$(( (dislikes * 100) / views ))

	fi
echo "$video_id,$trending_date,$title,$channel_title,$category_id,$publish_time,$tags,$views,$likes,$dislikes,$comment_count,$thumbnail_link,$comments_dissabled,$rating_dissabled,$video_error,$Ranking_views,$Rlikes,$Rdislikes" >> sortida.csv  

done

#activitat 5

if [$# > 0]; then
	buscar=$(grep -i "$1" sortida.csv) 
	if [-v $buscar]
		echo | cut -d',' -f 3,6,8-10,15-17 sortida.csv
	else;
		echo "No s'han trobat coincidencies"
else

