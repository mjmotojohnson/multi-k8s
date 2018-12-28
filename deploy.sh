docker build -t mjmotojohnson/multi-client:latest -t mjmotojohnson/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t mjmotojohnson/multi-server:latest -t mjmotojohnson/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t mjmotojohnson/multi-worker:latest -t mjmotojohnson/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push mjmotojohnson/multi-client:latest
docker push mjmotojohnson/multi-server:latest
docker push mjmotojohnson/multi-worker:latest

docker push mjmotojohnson/multi-client:$SHA
docker push mjmotojohnson/multi-server:$SHA
docker push mjmotojohnson/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=mjmotojohnson/multi-client:$SHA
kubectl set image deployments/server-deployment server=mjmotojohnson/multi-server:$SHA
kubectl set image deployments/server-deployment server=mjmotojohnson/multi-worker:$SHA
