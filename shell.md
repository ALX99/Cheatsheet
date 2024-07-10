# Shell


## Random stuff

### socat

```bash
# Forwarding from IPv4 to IPv6
sudo socat TCP4-LISTEN:22,fork,su=nobody TCP6:example.com:22

# Forwarding from IPv6 to IPv4 for multiple ports in the background
echo -n 22 | xargs -d ' ' -I% bash -c 'sudo socat "TCP4-LISTEN:%,fork,su=nobody" "TCP6:example.com:%" &'
```
