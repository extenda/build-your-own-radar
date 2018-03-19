FROM node:7.10.1 as source
WORKDIR /src/build-your-own-radar
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:1.13.5
COPY default.template /etc/nginx/conf.d/default.template
COPY scripts/entry-point.sh /opt/bin/entry-point.sh
RUN chmod +x /opt/bin/entry-point.sh

WORKDIR /opt/build-your-own-radar
COPY --from=source /src/build-your-own-radar/dist .

ENTRYPOINT ["/opt/bin/entry-point.sh"]
