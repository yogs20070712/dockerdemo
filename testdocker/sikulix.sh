!/bin/bash

#Download and install SikuliX
RUN echo "Download and install SikuliX:" \
 && DOWNLOAD_URL=$(curl -L https://launchpad.net/sikuli/sikulix/ | grep -Po '(?<=href=")https://launchpad.net/sikuli/sikulix/[^"]+download[^"]+') \
 && DOWNLOAD_URL=$(curl -L http://nightly.sikuli.de/ | grep -Po '(?<=href=")https://[^"]+/sikulixsetup-[^"]+\.jar') \
 && mkdir /sikulix \
 && curl -L $DOWNLOAD_URL -o /sikulix/sikulix-setup.jar \
 && xvfb-run java -jar /sikulix/sikulix-setup.jar options 1.1 \

 && echo "Make SikuliX binaries available for everyone:" \
 && chmod +x /sikulix/sikulix.jar /sikulix/runsikulix \
 && ln -s /sikulix/runsikulix /usr/local/bin/ \
 && ln -s /sikulix/sikulix.jar /usr/local/bin/ \

 && echo "Create default home directory:" \
 && mkdir /home/sikulix \
 && chmod ugo+rwx /home/sikulix \

 && echo "Clean-up:" \
 && apt-get purge --auto-remove -y \
        xvfb \
 && rm -rf /var/lib/apt/lists/* /tmp/* /sikulix/sikulix-setup.jar /sikulix/*-SetupLog.txt /sikulix/SetupStuff

VOLUME /home/sikulix

ENV HOME /home/sikulix
ENV _JAVA_OPTIONS -Duser.home=/home/sikulix

CMD ["/sikulix/runsikulix"]