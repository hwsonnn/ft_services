BLUE_GREEN="\033[36m"
echo "${BLUE_GREEN}"

# export MINIKUBE_HOME=~/goinfre #개포동(저장공간 확보!)

minikube delete --all

# 클러스터 생성
minikube start --driver=hyperkit

# Metallb 활성화
minikube addons enable metallb

# 클러스터 안에서 이미지를 빌드하도록 환경 설정
# -> 내 로컬 도커를 미니큐브 속 도커로 pointing
eval $(minikube docker-env)

minikube dashboard &

# 이미지 빌드
echo "이미지 빌드를 시작합니다..."
echo "nginx..."
docker build -qt nginx-image ./srcs/nginx
echo "mySQL..."
docker build -qt mysql-image ./srcs/mysql
echo "phpMyAdmin..."
docker build -qt phpmyadmin-image ./srcs/phpmyadmin
echo "wordpress..."
docker build -qt wordpress-image ./srcs/wordpress
echo "influxdb..."
docker build -qt influxdb-image ./srcs/influxdb
echo "grafana..."
docker build -qt grafana-image ./srcs/grafana
echo "ftps..."
docker build -qt ftps-image ./srcs/ftps

# 오브젝트 생성
echo "오브젝트를 생성합니다..."
kubectl apply -f ./srcs/yaml/nginx.yml
kubectl apply -f ./srcs/yaml/mySql.yml
kubectl apply -f ./srcs/yaml/phpMyAdmin.yml
kubectl apply -f ./srcs/yaml/wordpress.yml
kubectl apply -f ./srcs/yaml/influxdb.yml
kubectl apply -f ./srcs/yaml/grafana.yml
kubectl apply -f ./srcs/yaml/ftps.yml

# 로드밸런서에 external IP 부여
kubectl apply -f ./srcs/ConfigMap.yml