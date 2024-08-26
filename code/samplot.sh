#!/usr/bin/bash
set -ex

source ./config.sh


for line in $(cat ${comparesheet}); do
    control=$(echo $line | awk -F, '{print $1}')
    case=$(echo $line | awk -F, '{print $2}')

    control_file=$(find -L ../data  -name "${control}"*.bam)
    case_file=$(find -L ../data -name "${case}"*.bam)

    samplot plot --titles ${control} ${case} --bams ${control_file} ${case_file} --output_file ../results/${case}_${control}.png ${start_position} ${end_position} ${chromosome} ${window_size} ${SV_type} ${GFF3} ${transcript_names} ${bed_annotation} ${annotation_names} ${plot_height} ${plot_width} ${min_map_qual} ${X_font} ${Y_font} ${legend_font} ${annotation_font} ${hide_label} ${hide_reads} ${max_coverage} ${standardize_Y}
done
