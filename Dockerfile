FROM selenium/standalone-chrome

# Install OpenJDK and Maven
RUN sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends \
        curl \
        openjdk-8-jdk-headless \
        maven && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists

# Install Oracle JDBC drivers
# Use the following Maven dependency to use them:
#  <dependency>
#    <groupId>com.oracle</groupId>
#    <artifactId>ojdbc7</artifactId>
#    <version>12.1.0.1</version>
# </dependency>
RUN mkdir ~/oracle-jdbc && cd ~/oracle-jdbc && \
    wget https://raw.githubusercontent.com/mrts/docker-java-selenium-xvfb/master/ojdbc/ojdbc7.jar && \
    mvn install:install-file -Dfile=ojdbc7.jar  \
        -DgroupId=com.oracle \
        -DartifactId=ojdbc7 \
        -Dversion=12.1.0.1 \
        -Dpackaging=jar && \
    rm *.jar

# Verify that everything works
COPY test/ test/
RUN test/run-test.sh
