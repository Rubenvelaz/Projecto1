#!/bin/bash

input_file="supervivents.csv"
pas_1="Stepn1.csv"
pas_2="Stepn2.csv"
pas_3="Stepn3.csv"
output_file="sortida.csv"


cut -d',' -f1-11,13-15 "$input_file" > "$pas_1"
original=$(wc -l < "$pas_1")


awk -F ',' '{if  ($14 != "True") print $0 }' "$pas_1" > "$pas_2"
modificado=$(wc -l < "$pas_2")
resultado=$((original-modificado))
echo "$resultado"


awk -F',' '{
    if($8 < 1000000) {ranking = "Bo"}
    elif($8 < 10000000) {ranking = "Excel·lent"}
    else {ranking = "Estrella"}
    print $0, ranking
} "$pas_2" > "$pas_3"

while IFS=',' read -r video_id trending_date title channel_title category_id publish_time tags views likes dislikes comment_count comments_disabled rating_disabled video_error_or_removed ranking_views
do
       	rlikes=$(( likes * 100 / views ))
	rdislikes=$(( dislikes * 100 / views ))
	$video_id, $rlikes, $rdislikes
done < "$pas_4"

