echo "================Deployment Start================"
kubectl version
kubectl delete service/k8s-react-service
kubectl delete pod/k8s-react-pod

kubectl apply -f kubernetes/ 
echo "================Deployment Done================"

