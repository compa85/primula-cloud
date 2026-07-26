## UniFi BGP

```sh
router bgp 65100
  ! Router ID
  bgp router-id 10.10.25.1

  ! No policies needed for eBGP neighbors
  no bgp ebgp-requires-policy

  ! Relax autonomous system path matching for multipath routing
  bgp bestpath as-path multipath-relax
  maximum-paths 3

  ! Create peer-group k3s-prod with remote ASN 65101
  neighbor k3s-prod peer-group
  neighbor k3s-prod remote-as 65101

  ! Add controller node IPs as neighbors
  neighbor 10.10.25.21 peer-group k3s-prod
  neighbor 10.10.25.22 peer-group k3s-prod
  neighbor 10.10.25.23 peer-group k3s-prod
exit
```
