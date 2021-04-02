FROM node:lts-buster-slim
RUN npm install -g @hyperspace/cli
ADD start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
ENTRYPOINT ["/usr/local/bin/start.sh"]
