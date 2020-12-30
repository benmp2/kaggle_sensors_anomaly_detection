# kaggle_sensors_anomaly_detection

step 1

git clone https://github.com/benmp2/kaggle_sensors_anomaly_detection

step 2

docker build . -t anomaly_project --rm 

step 3 

docker run --rm -p 8888:8888 -v "$PWD":/home/jovyan/work anomaly_project
