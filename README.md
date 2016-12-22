# docker-java-selenium-xvfb

Dockerfile for building MRTS/JAVA-SELENIUM-XVFB image with OpenJDK,
Selenium, Chrome, XVFB and Oracle JDBC support.

# Usage

See [test script](test/run-test.sh) for usage example.

# Building

    docker build --tag=mrts/java-selenium-xvfb .
    docker tag mrts/java-selenium-xvfb:latest mrts/java-selenium-xvfb:v1.0
    docker login
    docker push mrts/java-selenium-xvfb
