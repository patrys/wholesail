FROM elixir:latest

ENV PHOENIX_VERSION 1.2.0

RUN apt-get update
RUN apt-get install inotify-tools -y

RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHOENIX_VERSION.ez

RUN mix local.hex --force
RUN mix local.rebar

ADD . /app
WORKDIR /app

EXPOSE 4000
ENV PORT 4000

CMD mix deps.get && elixir -S mix phoenix.server
