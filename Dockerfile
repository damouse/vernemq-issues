# Broker + our plugin
FROM elixir:1.6.6

WORKDIR /app

RUN git clone https://github.com/trarbr/vernemq_elixir_plugin.git /app

ENV MIX_ENV=prod

RUN mix local.rebar --force && \
    mix local.hex --force

RUN mix deps.get --only prod
RUN mix release.init
RUN mix deps.compile
RUN MIX_ENV=prod mix release 

# Broker
FROM vernemq/vernemq:1.10.1

COPY --from=0 /app/_build/prod/rel/vernemq_elixir_plugin /vernemq_elixir_plugin
COPY vernemq.conf /etc/vernemq/vernemq.conf.local
