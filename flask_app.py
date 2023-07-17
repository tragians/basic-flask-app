from flask import Flask
import pandas as pd 
import random

app = Flask(__name__)

df = pd.read_fwf('fish.txt', header=None)
available_fish_names = df.iloc[:, 0].values.tolist()

@app.route('/')
def index():
    return get_random_fish_name()
    
@app.route('/greet')
def say_hello():
    return 'Hello from Server'


def get_random_fish_name():
    random_idx = random.randint(0, len(available_fish_names))    
    random_fish_name = available_fish_names[random_idx]
    available_fish_names.pop(random_idx)

    return random_fish_name

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)