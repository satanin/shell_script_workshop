#!/bin/bash
row_count=1
while read a_row
do
  echo "row $row_count: $a_row"
  row_count=$((row_count+1))
done < example.sh