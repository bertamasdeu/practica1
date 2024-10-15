#!/bin/bash

#Activitat 1
cut -d',' -f 1-11,13-15 supervivents.csv > temporal.csv

#Activitat 2
awk -F',' '{if ($14 == "False") print $0}' temp.csv > temps.csv

#Activitat 3
echo "video_id, trending_date, title, channel_title, category_id, publish_time, tags, views, likes, dislikes, comment_count, thumbnail_link, comments_dissabled, rating_dissabled, video_error, Rnaking_views" > tempo.csv
awk -F',' '{if ($8 <= 1000000) print $0 ", Bo"}' temps.csv >> tempo.csv
awk -F',' '{if ($8 >= 10000000) print $0 ", Estrella"}' temps.csv >> tempo.csv
awk -F',' '{if ($8 < 10000000 && $8 > 1000000 ) print $0 ", Exel·lent"}' temps.csv >> tempo.csv


#Activitat 4
echo "$(head -n 1 tempo.csv),Rlikes,Rdislikes" > sortida.csv
	tail -n +2 tempo.csv  |while IFS=','  read -r  video_id trending_date title channel_title category_id publish_time tags views likes dislikes comment_count thumbnail_link comments_dissabled rating_dissabled video_error Rnaking_views Rlikes Rdislikes; do 
	if [[ $views -ne 0 ]]; then
		Rlikes=$(( ($likes * 100) / $views ))
                Rdislikes=$(( ($dislikes * 100) / $views ))
	else
                Rlikes=0
                Rdislikes=0

	fi
echo "$video_id,$trending_date,$title,$channel_title,$category_id,$publish_time,$tags,$views,$likes,$dislikes,$comment_count,$thumbnail_link,$comments_dissabled,$rating_dissabled,$video_error,$Ranking_views,$Rlikes,$Rdislikes" >> sortida.csv  

done

#activitat 5

if [ $# -gt 0 ]; then
        buscar=$(grep -i "$1" sortida.csv)
        if [ -n "$buscar" ]; then
                echo "$buscar" | cut -d',' -f 3,6,8-10,15-17 sortida.csv
       		num_linies=$(echo "$buscar" | wc -l)
                echo "$num_linies" 
else
                echo "No s'han trobat coincidencies"
	fi
else
	echo "No s'ha proporcionat cap identificador"
fi
