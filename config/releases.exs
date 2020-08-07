import Config

config :libcluster,
  topologies: [
    clustered: [
      strategy: Cluster.Strategy.Gossip,
      config: [
        broadcast_only: true,
        multicast_addr: "255.255.255.255"
      ],
      connect: {MODULE, FUNC, ARGS}
    ]
  ]
