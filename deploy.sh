docker build -t samueljothimuthu/multi-client -f ./client/Dockerfile ./client
docker build -t samueljothimuthu/multi-server -f ./server/Dockerfile ./server
docker build -t samueljothimuthu/multi-worker -f ./worker/Dockerfile ./worker
docker push samueljothimuthu/multi-client
docker push samueljothimuthu/multi-server
docker push samueljothimuthu/multi-worker
kubectl apply -f k8s

kubectl rollout restart deployments/server-deployment
kubectl rollout restart deployments/client-deployment
kubectl rollout restart deployments/worker-deployment
