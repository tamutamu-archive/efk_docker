#!/bin/bash
set -eux


# パッケージのインストール時に、対話形式のユーザーインタフェースを抑制する
export DEBIAN_FRONTEND=noninteractive

# 日本国内のミラーサイトを使うようにし、ソースインデックスは取得しない
sed -i \
    -e 's,//archive.ubuntu.com/,//jp.archive.ubuntu.com/,g' \
    -e '/^deb-src /s/^/#/' \
    /etc/apt/sources.list


INSTALL_PACKAGES="\
    apache2 \
    language-pack-ja \
    tzdata \
"
apt-get update
apt-get install -y --no-install-recommends ${INSTALL_PACKAGES}


LOCALTIME_FILE=/usr/share/zoneinfo/Asia/Tokyo


# ロケールを日本語にセットするが、メッセージ出力は翻訳しない
update-locale LANG=ja_JP.UTF-8 LC_MESSAGES=C

# 前のスクリプトでtzdataがインストールされていることを確認する
if [ ! -f "${LOCALTIME_FILE}" ] ; then
    echo "${LOCALTIME_FILE} does not exist."
    exit 1
fi

ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
dpkg-reconfigure tzdata
