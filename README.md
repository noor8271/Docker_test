﻿# Docker_test





dockers

build dockers for dependencies

@"
FROM ubuntu:22.04
RUN apt update && apt install iputils-ping --yes
"@ | Set-Content Dockerfile

docker build --tag my-ubuntu -f Dockerfile .
Remove-Item Dockerfile


run it 

docker run -it --rm my-ubuntu
ping google.com
ctrl^c
exit


now for local data at runtime


docker run -it --rm ubuntu:22.04

make file

mkdir my-data
echo "hi guys " > /my-data/hello.txt
cat /my-data/hello.txt
exit

now check file wont be there

docker run -it --rm ubuntu:22.04
cat /my-data/hello.txt
exit

now set volume

docker volume create my-volume
docker run --rm -it --mount source=my-volume,destination=/my-data/ ubuntu:22.04
ls -----------> see my-data
echo "hi guys " > /my-data/hello.txt
cat /my-data/hello.txt
exit

make new one 

docker run --rm -it --mount source=my-volume,destination=/my-data/ ubuntu:22.04
cat /my-data/hello.txt
exit



now bind mounts


docker run  -it --rm --mount type=bind,source="${PWD}"/my-data,destination=/my-data ubuntu:22.04
echo "hi guys " > /my-data/hello.txt
cat /my-data/hello.txt
exit

now do the thing again and check 




now run the system clone the repo

docker build -t docker-nodeim .(path to docker file)



