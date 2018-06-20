FROM node:slim
LABEL name="varun"
WORKDIR /tmp
RUN npm install -g protractor mocha jasmine && \
    webdriver-manager update && \
    mkdir -p /usr/share/man/man1 && \
    (echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list) && \
    apt-get update && \
    apt-get install -y xvfb wget ca-certificates-java -t jessie-backports openjdk-7-jre && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    apt-get clean && \
    rm google-chrome-stable_current_amd64.deb && \
    mkdir /protractor
ADD protractor.sh /protractor.sh
# Fix for the issue with Selenium, as described here:
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
WORKDIR /protractor
RUN ["chmod", "+x", "/protractor"]
ENTRYPOINT ["sh","/protractor.sh"]
