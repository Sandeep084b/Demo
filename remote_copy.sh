#!/bin/bash

#get modified files info as string
input_string="$modifiedfiles"

#Define the delimiter
delimiter=","

# Splitthe input string into an using the delimiter
IFS="$delimiter" read -ra filenames <<< "$input_string"

# Create an associative array to store unique values
declare -A unique_values

# Ignore .github and root folders
exclude1=".github"
exclude2="."

# Iterate through the values to copy unique one into the array
for filename in "${filenames[@]}"; do
	folder_name="(dirname "$filename")"
	base_dir=$(echo "$folder_name" | awk -F'/' '{print $1}')
	if [[ "$base_dir" == "$exclude1" ]] || [[ "$base_dir" == "exclude2" ]]; then
		continue
	else
		unique_values["$base_dir"]=1
	fi
done

if [ "${#unique_values[@]}" != 0 ]; then
	unique_array=("${!unique_values[@]}")
	
	for value in "${unique_array[@]}"; do
		echo "$value"
	done
else
	echo "No Deployment Needed"
fi

	
