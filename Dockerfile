FROM java:8
ENV JAVA_MEMORY_DEMO_HOME=/usr/local/jdk-test
RUN mkdir /usr/local/jdk-test
WORKDIR /usr/local/jdk-test
ADD app.jar /usr/local/jdk-test
RUN ls /usr/local/jdk-test
# Shit run cmd:
# docker run -e JAVA_OPTIONS="-Xmx128m" --memory-swap=0 --memory-swappiness=0 -m 100m --rm blademainer/jdk-test
# Worked well with cmd:
# docker run -e JAVA_OPTIONS="-Xmx128m" --memory-swap=0 --memory-swappiness=0 -m 256m --rm blademainer/jdk-test
CMD java -XX:+PrintFlagsFinal -XX:+PrintGCDetails ${JAVA_OPTIONS} -classpath app.jar com.xiongyingqi.jdk.SSLTest
