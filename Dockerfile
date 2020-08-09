FROM elixir:1.10.4 AS app_builder

ENV MIX_ENV=prod \
    LANG=C.UTF-8

RUN apt-get install -y --no-install-recommends git

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mkdir /app
WORKDIR /app

COPY mix.exs mix.lock ./
COPY config/config.exs ./config/
RUN mix do deps.get, deps.compile

COPY lib lib
RUN mix release

FROM ubuntu:20.04 AS app

ENV LANG=C.UTF-8

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssl wkhtmltopdf && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --create-home app
USER app
WORKDIR /home/app

COPY --from=app_builder --chown=app:app /app/_build/prod/rel/html_to_pdf ./
CMD ["bin/html_to_pdf", "start"]

