#!/bin/bash

## This sample code is for the estuary entries, but you can modify depending on your own input. We're pulling from the database and structure file listed above this directory. For stage two, the pipeline was ran with default parameters with a modification for the false positive rate set at 10^-5.
args_oap stage_one -i ~/MG-RAST_RAW_DATA/args_oap_metagenomes -f fna -t 20 -o estuary_entriess --database ~/contains_structure_and_database_for_argsoap/sarg_bacmetEXP_int_db_final.fa
args_oap stage_two -i estuary_entriess -t 20 --database ~/contains_structure_and_database_for_argsoap/sarg_bacmetEXP_int_db_final.fa --structure1 ~/contains_structure_and_database_for_argsoap/master_component_structure.txt --e 1e-5
