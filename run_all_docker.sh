# Step 1: Look up for text file of fish names in the internet 

if [ ! -f ~/deepc_assignment/fish.txt ]; then
	wget https://raw.githubusercontent.com/janelleshane/fish-common-names/master/fish.txt
else
	echo "fish.txt file already downloaded from github and saved in the folder"
fi

if [[ "$(docker images -q my-app:latest 2> /dev/null)" == "" ]]; then
	docker build --network=host --tag my-app .
else
	echo "using existing docker image"
fi


docker run --network=host my-app


