# split string by comma delimter
IFS=',' read -ra filenames <<< "${GITHUB_OUTPUT}"

#Create an array
declare -A unique_folders

exclude1=".github"
exclude2="."

#Loop in through filenames and extract unique folders
for filename in "${filenames[@]}"; do
	#Extract folder path
    folder_name="$(dirname "$filename")"
    #echo "$folder_name"
	base_dir=$(echo "$folder_name"  | awk -F'/' '{print $1}')
	#Ignore .github, Readme files
	if [[ "$base_dir" == "$exclude1" ]] || [[ "$base_dir" = "$exclude2" ]]; then
		continue
	else
		# Copy values to an array
	   unique_folders["$base_dir"]=-1	   
	fi	 
done

#omit duplicates
unique_array=("${!unique_folders[@]}")

#remote_server="remote server address"
#remote_user="remote_username"
#remote_destination="remote_path"

for values in "${!unique_array[@]}"; do
	#Do a remot copy
    #scp -r "values" "$remote_user@remote_server:$remote_destination"
    echo "$value"
done
