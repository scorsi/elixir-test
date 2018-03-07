defmodule Api.Application do
use Application

    def start(_type, _args) do
        children = [
        Plug.Adapters.Cowboy.child_spec(:http, Api.Router, [], [port: 8081])
        ]

        opts = [strategy: :one_for_one, name: Api.Supervisor]
        Supervisor.start_link(children, opts)
    end
end