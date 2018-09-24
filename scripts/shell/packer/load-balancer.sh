#!/bin/sh -x

sudo yum install -y httpd \
    mod_ssl.x86_64 \
    mod_proxy_html.x86_64

cat <<'EOF' >> /etc/httpd/conf/httpd.conf
RewriteEngine On
RewriteCond %{HTTPS} !on
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

ProxyPreserveHost On

<Proxy balancer://lamp>
    BalancerMember http://192.168.33.111
    BalancerMember http://192.168.33.112
    ProxySet lbmethod=bytraffic
</Proxy>

ProxyPass "/" "balancer://lamp/"
ProxyPassReverse "/" "balancer://lamp/"
EOF

echo -e ">>> enabling firewalld\n"
sudo systemctl enable firewalld
sudo systemctl start firewalld

# Open ports
echo -e ">>> opening port 80\n"
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent

echo -e ">>> opening port 443\n"
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent

sudo firewall-cmd --reload
