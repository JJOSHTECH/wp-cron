# Use a Debian Image
FROM debian:stretch-slim

# Update and Upgrade Repo
RUN apt update && apt full-upgrade -y && apt autoremove && apt clean

# Install rsync and opsenssh
RUN apt install cron curl -y

# Enviroment to describe the server from which you want to make an update
ENV SERVER_ADDRESS="localhost"
ENV PROTOCOL="https"

# Environment to describe the https hook address for slack
ENV SLACK_HOOK=""

#Copy Cronjob File into Container
COPY cronjob /etc/cron.d/cronjob

#Copy Cronscript File into Container
COPY cronscript /root/cronScript.sh

#Add Executable right to cronscript
RUN chmod +x /root/cronScript.sh

#Include cronjob into crontab
RUN crontab /etc/cron.d/cronjob

#Copy Cronscript File into Container
COPY startUp.sh /root/startUp.sh

#Add Executable right to cronscript
RUN chmod +x /root/startUp.sh

# Start SSH Server in Debug mode
CMD ["/root/startUp.sh"]
