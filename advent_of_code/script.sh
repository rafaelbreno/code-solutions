#!/bin/bash

# Got this from ChatGPT, I don't know bash(yet)
# Pad (padding_char, length, value)
pad() {
    local padding_char="$1"
    local desired_length="$2"
    local value="$3"
    
    local padding_length=$(( desired_length - ${#value} ))
    local padding=""
    
    for ((i=0; i<padding_length; i++)); do
        padding="${padding}${padding_char}"
    done
    
    echo "${padding}${value}"
}
year=$1

day=$2

padded_day=$(pad "0" 2 $day)

folder_path="${year}/${padded_day}"

if [ -d "$folder_path" ]; then
    echo "Advent of Code $year Day $day already setup."
    exit
fi

aoc_url="https://adventofcode.com/${year}/day/${day}"

html_body=$(curl -s "$aoc_url")

article_content=$(echo "$html_body" | awk '/<article/,/<\/article>/')

mainFile="$(cat "../.templates/Main.hs")"

readmeFile="## Advent of Code $year Day $day

$article_content

[URL]($aoc_url)
[Solution](./Main.hs)"

mkdir -p $folder_path

echo "$mainFile" >> "$folder_path/Main.hs"
echo "$readmeFile" >> "$folder_path/README.md"

echo "Advent of Code $year Day $day environment created!"
echo "Start at: ./$folder_path"
