#!/bin/bash

args_oap stage_one -i ~/MG-RAST_RAW_DATA/args_oap_metagenomes -f fna -t 20 -o estuary_entriess --database ~/contains_structure_and_database_for_argsoap/sarg_bacmetEXP_int_db_final.fa
args_oap stage_two -i estuary_entriess -t 20 --database ~/contains_structure_and_database_for_argsoap/sarg_bacmetEXP_int_db_final.fa --structure1 ~/contains_structure_and_database_for_argsoap/master_component_structure.txt --e 1e-5
