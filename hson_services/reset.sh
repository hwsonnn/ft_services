#ftp
kubectl delete -f ./srcs/yaml/ftps.yml
eval $(minikube docker-env)
docker rmi ftps_service

docker build ./srcs/ftps/ -t ftps_service
kubectl apply -f ./srcs/yaml/ftps.yml

#wordpress
kubectl delete -f ./srcs/yaml/wordpress.yml
eval $(minikube docker-env)
docker rmi wordpress_service

docker build ./srcs/wordpress/ -t wordpress_service
kubectl apply -f ./srcs/yaml/wordpress.yml

#grafana
kubectl delete -f ./srcs/yaml/grafana.yml
eval $(minikube docker-env)
docker rmi grafana_service

docker build ./srcs/grafana/ -t grafana_service
kubectl apply -f ./srcs/yaml/grafana.yml

#influxdb
kubectl delete -f ./srcs/yaml/influxdb.yml
eval $(minikube docker-env)
docker rmi influxdb_services

docker build ./srcs/influxdb/ -t influxdb_service
kubectl apply -f ./srcs/yaml/influxdb.yml

#mysql
kubectl delete -f ./srcs/yaml/mySql.yml
eval $(minikube docker-env)
docker rmi mysql_service

docker build ./srcs/mysql/ -t mysql_service
kubectl apply -f ./srcs/yaml/mySql.yml
#k exec influxdb-deployment -- pkill influxd

#phpmyadmin
kubectl delete -f ./srcs/yaml/phpMyAdmin.yml
eval $(minikube docker-env)
docker rmi phpmyadmin_service

docker build ./srcs/phpmyadmin/ -t phpmyadmin_service
kubectl apply -f ./srcs/yaml/phpMyAdmin.yml

#ftp 파일 전송 보여주기
curl ftp://192.168.99.30:21 --ssl -k --user hson -T reset.sh

k exec -it ftps-deployment-8585d96555-5kz79 -- sh 
ftps/hson