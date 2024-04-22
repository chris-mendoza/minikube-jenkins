iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 8001 -j DNAT --to-destination 192.168.1.200:8080

iptables -A FORWARD -p tcp -d 192.168.1.200 --dport 8080 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT