#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
else
    echo "args:"
    for i in $*; do 
        echo $i 
    done
    echo ""
fi


num_bam_files=$(find -L ../data -name "*.bam" | wc -l)

if [ ${num_bam_files} -eq 0 ]; then
    echo "There are no sample files available for this capsule."
    exit 1
fi


if [ -z ${1} ]; then
    comparesheet=$(find -L ../data/ -name "comparesheet*.csv")
else
    comparesheet=${1}
fi

# Check that there is only 1 compare sheet
number_comparesheet=$(find -L ../data/ -name "*compare*" | wc -l )
if [ ${number_comparesheet} -eq 0 ]; then
    echo "Check your input data: there is no comparesheet."
    exit 1
elif [ ${number_comparesheet} -gt 1 ]; then
    echo "Check your input data: there are multiple comparesheets."
    exit 1
fi

# make the path absolute
comparesheet=$PWD/${comparesheet}



## Auxilliary Parameters

if [ -z ${2} ]; then
    start_position="--start 10000"
else
    start_position="--start ${2}"
fi


if [ -z ${3} ]; then
    end_position="--end 1000000"
else
    end_position="--end ${3}"
fi


if [ -z ${4} ]; then
    chromosome="--chrom chr11"
else
    chromosome="--chrom ${4}"
fi



if [ -z ${5} ]; then
    window_size=""
else
    window_size="--window ${5}"
fi


if [ -z ${6} | "${6}" == "all" ]; then
    SV_type=""

elif [ "${6}" == "DEL" ]; then
    SV_type="--sv_type DEL"

elif [ "${6}" == "INS" ]; then
    SV_type="--sv_type INS"

elif [ "${6}" == "INV" ]; then
    SV_type="--sv_type INV"

elif [ "${8}" == "DUP" ]; then
    SV_type="--sv_type DUP"

fi



if [ -z ${7} ]; then
    GFF3=""
    transcript_names=""
else
    GFF3="--transcript_file ${7}"
    transcript_names="--transcript_filename ${8}" 
fi



if [ -z ${9} ]; then
    bed_annotation=""
    annotation_names=""
else
    bed_annotation="--annotation_files ${9}"
    annotation_names="--annotation_filenames ${10}"
fi



if [ -z ${11} ]; then
    plot_height=""
else
    plot_height="--plot_height ${11}"
fi


if [ -z ${12} ]; then
    plot_width=""
else
    plot_width="--plot_width ${12}"
fi


if [ -z ${13} ]; then
    min_map_qual=""
else
    min_map_qual="--include_mqual ${13}"
fi


if [ -z ${14} ]; then
    X_font=""
else
    X_font="--xaxis_label_fontsize ${14}"
fi


if [ -z ${15} ]; then
    Y_font=""
else
    Y_font="yaxis_label_fontsize ${15}"
fi


if [ -z ${16} ]; then
    legend_font=""
else
    legend_font="--legend_fontsize ${16}"
fi


if [ -z ${17} ]; then
    annotation_font=""
else
    annotation_font="--annotation_fontsize ${17}"
fi


if [ -z ${18} | ${18} == "no" ]; then
    hide_label=""
else
    hide_label="--hide_annotation_labels"
fi


if [ -z ${19} | ${19} == "no" ]; then
    hide_reads=""
else
    hide_reads="--coverage_only"
fi


if [ -z ${20} ]; then
    max_coverage=""
else
    max_coverage="--max_coverage ${20}"
fi


if [ -z ${21} | ${21} == "no" ]; then
    standardize_Y=""
else
    standardize_Y="--same_yaxis_scales ${21}"
fi
