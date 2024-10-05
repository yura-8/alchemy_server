FROM node:18 as node 

FROM ruby:3.1

COPY --from=node /opt/yarn-* /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -fs /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -fs /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx \
  && ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -fs /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  postgresql-client \
  vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir  /alchemy_server
WORKDIR  /alchemy_server

# GemfileとGemfile.lockを先にコピーしてキャッシュを活用
COPY Gemfile Gemfile.lock ./
RUN bundle install

# package.jsonとyarn.lockも同様に先にコピーしてキャッシュを活用
COPY package.json yarn.lock ./
RUN yarn install

# アプリケーションコードを最後にコピー
COPY .  /alchemy_server

# 起動スクリプトを設定
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Railsが使うポートを公開
EXPOSE 3000

# アプリケーションを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
