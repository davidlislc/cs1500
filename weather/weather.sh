#!/bin/sh
json=`curl https://api.weather.gov/gridpoints/IWX/69,39/forecast`
echo $json | jq -r '{time: .properties.periods[].name, temp: .properties.periods[].temperature'}  > weather.log
