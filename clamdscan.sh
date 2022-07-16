#!/bin/bash
#   ClamAVによるウイルススキャンスクリプト
#   clamd が起動していることを前提とする
#

log=/var/log/clamav/clamscan.log
mailto=送信先メールアドレス

echo ========================================= | tee ${log}
date | tee -a ${log}
hostname | tee -a ${log}

# ウイルス定義の更新
systemctl stop clamav-freshclam.service
freshclam
systemctl start clamav-freshclam.service

# ウイルススキャン実行
# --fdpass=clamd デーモンの実行ユーザー(clamav)と違うユーザーでスキャンする場合に必要なオプション
# --infected=ウイルスであった場合のみ標準出力やログに表示
# --log=FILE ログファイル
# --move=DIR 感染を検出したファイルの隔離先
clamdscan / \
	--fdpass \
	--infected \
	--log=${log} \
	--move=/var/tmp/clamav_infected_files

# 結果出力 ＆ メール送信
if [ ! -z "$(grep FOUND$ ${log})" ]; then
	cat ${log} | mailx -s "clamdscan: ClamAV Virus Found in `hostname`" ${mailto}
fi

date | tee -a ${log}
