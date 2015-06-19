FROM monsantoco/min-jessie
MAINTAINER Alan Jenkins <alan.james.jenkins@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install openjdk-7-jre-headless -y
RUN apt-get install python2.7 -y
ADD get_pack.py /usr/bin/get_pack
RUN mkdir -p /srv/minecraft && cd /srv/minecraft/ && /usr/bin/get_pack agrarianskies2 && mkdir /srv/minecraft/world && echo 'eula=true' > /srv/minecraft/eula.txt && rm /srv/minecraft/minecraft.zip
RUN rm /usr/bin/get_pack
RUN apt-get remove --purge python2.7 -y
VOLUME /srv/minecraft/world
VOLUME /backups
CMD cd /srv/minecraft/ && java -Xmx1536M -Xms1536M -jar forge-1.7.10-10.13.3.1428-1.7.10-universal.jar
RUN apt-get autoremove -y && \
        # AUTO_ADDED_PACKAGES=`apt-mark showauto` && \
        # apt-get remove --purge -y $AUTO_ADDED_PACKAGES && \
        apt-get clean
