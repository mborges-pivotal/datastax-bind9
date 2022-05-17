$TTL    604800
@       IN      SOA     ns1.astra.datastax.com. root.astra.datastax.com. (
                  3       ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800 )   ; Negative Cache TTL
;
; name servers - NS records
     IN      NS      ns1.astra.datastax.com.

; name servers - A records
ns1.astra.datastax.com.          IN      A      10.10.0.2

host1.astra.datastax.com.        IN      A      10.10.0.3
host2.astra.datastax.com.        IN      A      10.10.0.4
