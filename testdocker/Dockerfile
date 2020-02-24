FROM adoptopenjdk/openjdk8:alpine

#install bash in alpine image
RUN apk add --no-cache --upgrade bash

#copy shell files to execute it in image
COPY chrome.sh /chrome.sh
COPY chromedriver.sh /chromedriver.sh
COPY selenium.sh /selenium.sh
COPY java.sh /java.sh
COPY sikulix.sh /sikulix.sh

#assign privileges to execute shell-script files
RUN chmod +x /chrome.sh
RUN chmod +x /chromedriver.sh
RUN chmod +x /selenium.sh
RUN chmod +x /java.sh
RUN chmod +x /sikulix.sh

#run shell-script files
CMD ["sh", "chrome.sh"]
CMD ["sh", "chromedriver.sh"]
CMD ["sh", "selenium.sh"]
CMD ["sh", "java.sh"]
CMD ["sh", "sikulix.sh"]

CMD ["echo", "Docker for testing purpose"]