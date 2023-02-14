#!/bin/sh

hadoop fs -mkdir /user/training/weather
echo "Created directory 'weather' under /user/training"

hadoop fs -put ~/hadoopPrac/futurense_hadoop-pyspark/labs/dataset/weather/weather_data.txt  /user/training/weather
echo "Loading the data"

echo "display the weather data: head"
hadoop fs -head /user/training/weather/weather_data.txt

hadoop fs -cat /user/training/weather/weather_data.txt | awk '{print > "odd_lines.txt"} NR%2==0{print > "even_lines.txt"}'
echo "weather file seperated into odd_lines.txt and even_lines.txt"

hadoop fs -put odd_lines.txt even_lines.txt /user/training/weather
echo "load odd_lines.txt and even_lines.txt into hadoop"

hadoop fs -getmerge /user/training/weather/odd_lines.txt /user/training/weather/even_lines.txt merge_weather.txt
echo "merging 2 files into merge_weather.txt"

echo "reading head of merge_weather.txt"
head merge_weather.txt

