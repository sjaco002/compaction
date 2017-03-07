#!/bin/sh

rm log.txt
grep "Merge Policy" ../asterix-mgmt/clusters/local/working_dir/logs/* >> log.txt
rm csv/*
python makeCSVFiles.py
