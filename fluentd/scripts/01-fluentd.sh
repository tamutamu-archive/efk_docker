#!/bin/bash
set -eux

# パッケージのインストール時に、対話形式のユーザーインタフェースを抑制する
export DEBIAN_FRONTEND=noninteractive

apt -y install apache2

rm -f /var/log/apache2/*

pushd /tmp
curl -O https://packages.treasuredata.com/GPG-KEY-td-agent
apt-key add GPG-KEY-td-agent
curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-bionic-td-agent3.sh | sh
popd

mkdir /etc/service/td-agent

cat << EOT >> /etc/service/td-agent/run
#!/bin/sh
set -e
export no_proxy=fluentd_fluentd_debug_server_1
exec td-agent -c /etc/td-agent/td-agent.conf -o /var/log/td-agent/td-agent.log
EOT

chmod +x /etc/service/td-agent/run

#/sbin/my_init &
#sv restart td-agent
rm -f /var/log/apache2/*
