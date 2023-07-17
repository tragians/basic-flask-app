# Step 1: Look up for text file of fish names in the internet 

if [ ! -f ~/deepc_assignment/fish.txt ]; then
	wget https://raw.githubusercontent.com/janelleshane/fish-common-names/master/fish.txt
else
	echo "fish.txt file already downloaded from github and saved in the folder"
fi

if conda info --envs | grep -q flask_api; then 
	echo "flask_api already exists"; 
else 
	conda create -y -n flask_api; 
	pip install flask
	pip install pandas
fi

source ~/miniconda3/etc/profile.d/conda.sh

conda activate flask_api

export FLASK_ENV=development
export FLASK_APP=flask_app.py

flask run

