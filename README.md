[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# Interactive plotting of structural variants with Samplot

Samplot identifies, color-codes, and elevates split or discordant alignments so that users can clearly and quickly distinguish between normal reads and reads supporting different SV types. These plots often include scatterings of misaligned reads that can fool automated tools. A visual review can generally quickly determine whether or not groups of reads support an SV, allowing rapid high-confidence variant review. 


This capsule is best suited as a standalone capsule (not run in a pipeline).  It will plot a single genomic region of interest, and the App Panel allows the user to customize the figures produced.  


## Input data 
- BAM file, e.g., input to CNV caller. 
- In the **/data** directory, a comparesheet, a comma-delimited (```.csv```) file that has two samples on each line, the first is the control, the second is the matched tumor.  Sample names may appear on more than 1 line in the case of multiple cases matched to the same control or multiple controls matched to the same case. 
- Optional: In the **/data** directory, genome annotations in ```gff3.gz``` format with tabix index file.
- Optional: In the **/data** directory, a ```bed.gz``` tabixed file of annotations (such as repeats, mappability, etc.) 


## Outputs 
An output plot in png format for each case sample.
- The plot shows the coverage and reads that support structural variation calls. Reads are indicated by horizontal lines and color-coded for alignment type (concordant/discordant insert size, pair order, split alignment, or long read).
    - Black: Deletion/normal
    - Red: duplication
    - Blue: Inversion
    - Green: Inversion
    - Dotted with circle: Split read
    - Solid line with square: Paired end read 
- The coverage for the region is shown with the gray-filled background, which is split into map quality above or below a user-defined threshold (in dark or light gray respectively). 
- An annotation from the Tandem Repeats Finder indicates where genomic repeats occur. A gene annotation track shows the position of introns (thin blue line) and exons (thick blue line) near the variant; a small blue arrow on the right denotes the direction of transcription for the gene. 

## App Panel Parameters
### Main Parameters
Path to comparesheet
- [Default: /data/comparesheet.csv]

### Auxilliary Parameters
Start position
- Start position of region/variant (add multiple for translocation/BND events) [Default: 10000]

End position 
- End position of region/variant (add multiple for translocation/BND events) [Default: 1000000]

Chromosome to consider
- Add multiple for translocation/BND events [Default: chr11]

Window size
- Count of bases to include in view [Default: (0.5 * len)]

SV type
- DEL, INS, INV, or DUP
- If omitted, plot is created without variant bar

GFF3 file of transcripts

- Name for transcript track [Default: None]

BED files with annotations, space delimited list
- Space-delimited list of bed.gz tabixed file of annotations, such as repeats, mappability, etc. [Default: None]

Plot height

Plot width

Minimum MAPQ quality
- Minimum MAPQ quality for paired end mapping during SV discovery. This is an integer value ranging from 0 to 255 and the optimal value can depend on the aligner used. When in doubt, the user can plot the MAPQ distribution in a BAM file [Default: 1]

Font size for X-axis labels
- [Default: 6]

Font size for Y-axis labels
- [Default: 6]

Font size for legend labels
- [Default: 6]

Font size for annotation labels
- [Default: 6]

Hide annotation labels? 
- Hide the label (fourth column text) from annotation files, useful for regions with many annotations [Deafult: no]

Hide all reads and show only coverage
- [Default: no]

Maximum coverage cutoff
- [Default: unlimited]

Standardize the y-axis scales to the maximum of all plots
- [Default: no]



## Citation

Belyeu, J.R., Chowdhury, M., Brown, J. et al. Samplot: a platform for structural variant visual validation and automated filtering. Genome Biol 22, 161 (2021). https://doi.org/10.1186/s13059-021-02380-5

## Source

https://github.com/ryanlayer/samplot

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)

