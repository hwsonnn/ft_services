#ftp
kubectl delete -f ./srcs/yaml/ftps.yml
eval $(minikube docker-env)
docker rmi ftps-image

docker build ./srcs/ftps/ -t ftps-image
kubectl apply -f ./srcs/yaml/ftps.yml

#nginx
kubectl delete -f ./srcs/yaml/nginx.yml
eval $(minikube docker-env)
docker rmi nginx-image

docker build ./srcs/nginx/ -t nginx-image
kubectl apply -f ./srcs/yaml/nginx.yml

#wordpress
kubectl delete -f ./srcs/yaml/wordpress.yml
eval $(minikube docker-env)
docker rmi wordpress-image

docker build ./srcs/wordpress/ -t wordpress-image
kubectl apply -f ./srcs/yaml/wordpress.yml

#grafana
kubectl delete -f ./srcs/yaml/grafana.yml
eval $(minikube docker-env)
docker rmi grafana-image

docker build ./srcs/grafana/ -t grafana-image
kubectl apply -f ./srcs/yaml/grafana.yml

#influxdb
kubectl delete -f ./srcs/yaml/influxdb.yml
eval $(minikube docker-env)
docker rmi influxdb-image

docker build ./srcs/influxdb/ -t influxdb-image
kubectl apply -f ./srcs/yaml/influxdb.yml

#mysql
kubectl delete -f ./srcs/yaml/mySql.yml
eval $(minikube docker-env)
docker rmi mysql-image

docker build ./srcs/mysql/ -t mysql-image
kubectl apply -f ./srcs/yaml/mySql.yml
#k exec influxdb-deployment -- pkill influxd

#phpmyadmin
kubectl delete -f ./srcs/yaml/phpMyAdmin.yml
eval $(minikube docker-env)
docker rmi phpmyadmin-image

docker build ./srcs/phpmyadmin/ -t phpmyadmin-image
kubectl apply -f ./srcs/yaml/phpMyAdmin.yml

#ftp 파일 전송 보여주기
curl ftp://192.168.99.30:21 --ssl -k --user hson -T reset.sh

k exec -it ftps-deployment-8585d96555-5kz79 -- sh 
ftps/hson