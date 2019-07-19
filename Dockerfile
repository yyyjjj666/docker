FROM python:3.7
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
WORKDIR /opt
RUN wget http://cdn.npm.taobao.org/dist/node/v10.16.0/node-v10.16.0-linux-x64.tar.xz
RUN xz -d node-v10.16.0-linux-x64.tar.xz && tar -xvf node-v10.16.0-linux-x64.tar
WORKDIR /opt/node-v10.16.0-linux-x64
RUN ln -s /opt/node-v10.16.0-linux-x64/bin/node /usr/local/bin/node
RUN ln -s /opt/node-v10.16.0-linux-x64/bin/npm /usr/local/bin/npm
RUN node -v && npm -v
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN ln -s /opt/node-v10.16.0-linux-x64/bin/cnpm /usr/local/bin/cnpm
RUN cnpm install -g pm2
WORKDIR /usr/local
RUN ln -s /opt/node-v10.16.0-linux-x64/bin/pm2 /usr/local/bin/pm2
