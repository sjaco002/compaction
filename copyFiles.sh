#!/bin/sh

rm log.txt
grep "Merg" ../asterix-mgmt/clusters/local/working_dir/logs/* >> log.txt
#grep "Compaction:" ../asterix-mgmt/clusters/local/working_dir/logs/* >> log.txt
rm csv/*
python makeCSVFiles.py
