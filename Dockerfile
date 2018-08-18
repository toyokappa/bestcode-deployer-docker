FROM toyokappa/aws-deployer-docker

# ruby install
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.gz && \
    tar -zxvf ruby-2.5.1.tar.gz && \
    cd ruby-2.5.1 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -r ruby-2.5.1 ruby-2.5.1.tar.gz

RUN gem install bundler

# node install
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs --no-install-recommends

# yarn install
# 参考: https://yarnpkg.com/lang/ja/docs/install/#debian-stable
RUN apt-get update && apt-get install -y curl apt-transport-https wget
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn --no-install-recommends

RUN set -ex \
    && apt-get update  \
    && apt-get install -y \
      mysql-client \
      --no-install-recommends  \
    && rm -rf /var/lib/apt/lists/*

