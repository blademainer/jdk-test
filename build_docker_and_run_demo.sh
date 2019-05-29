#!/usr/bin/env bash

script_dir="$(dirname $0)"

docker volume create --name maven-repo
docker run --rm --name maven-jdk-test -it -v maven-repo:/root/.m2 -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven mvn install
cp ${script_dir}/Dockerfile ${script_dir}/target
cd ${script_dir}/target
cp jdk-test*.jar app.jar

commit_id=`git rev-parse HEAD`
docker build . -t blademainer/jdk-test:${commit_id}

docker run --rm -d --name good-jdk-test --memory-swap=256m --memory-swappiness=0 -m 256m -e JAVA_OPTIONS="-Xmx128m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/jvmdump/" -v `pwd`/jvmdump:/jvmdump  blademainer/jdk-test:${commit_id} &
docker run --rm -d --name bad-jdk-test --memory-swap=256m --memory-swappiness=0 -m 256m -e JAVA_OPTIONS="-Xmx512m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/jvmdump/" -v `pwd`/jvmdump:/jvmdump  blademainer/jdk-test:${commit_id} &

# you should see bad-jdk-test is oom
docker events -f image=blademainer/jdk-test