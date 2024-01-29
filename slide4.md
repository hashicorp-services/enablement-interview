layout: true
class: compact
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide1

# consul catalog Examples



- List all datacenters

    ``$ consul catalog datacenters
    dc1
    dc2
    dc3
    ``

- List all nodes

    ``$ consul catalog nodes
    Node       ID        Address    DC
    worker-01  1B662d97  10.4.5.31  dc1
    ``

- List all services

    ``$ consul catalog services
    consul
    postgresql
    redis
    ``

 
