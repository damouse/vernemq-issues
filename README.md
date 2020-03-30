# VerneMQ Issues

This repo is set up to build a broker with the sample elixir plugin without modification. 

To build:

```
docker bulid . -it verne-test
docker run verne-test
```

I test the failure by:

- Running `docker ps` in another terminal to see the id of the running container
- Running `docker exec -it <id> bash` to drop into the container
- Running `vmq-admin cluster show`

When lines 19-20 are commented out, `vmq-admin` works. When they are commented in, it does not. 

```
plugins.vernemq_elixir_plugin = on
plugins.vernemq_elixir_plugin.path = /vernemq_elixir_plugin
```

NOTE: see solution for issue [here](https://github.com/vernemq/vernemq/issues/1398)