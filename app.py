from flask import Flask
import os

app = Flask(__name__)

# This is where we will save our data INSIDE the container
DATA_FILE = "/app/data/visits.txt"

@app.route('/')
def hello():
    # 1. Read the current number of visits
    if os.path.exists(DATA_FILE):
        with open(DATA_FILE, 'r') as f:
            visits = int(f.read())
    else:
        visits = 0
    
    # 2. Add 1 to the count
    visits += 1
    
    # 3. Save the new count back to the file
    os.makedirs(os.path.dirname(DATA_FILE), exist_ok=True)
    with open(DATA_FILE, 'w') as f:
        f.write(str(visits))

    return f"🚀 DevOps Masterclass! You are visitor number {visits}. (Automated Deploy!)"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
