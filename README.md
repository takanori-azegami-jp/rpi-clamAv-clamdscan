# RaspberryPi-ClamAv-clamdscan
RaspberryPi(64bit)にClamAvのスキャンウルスシェル

# 環境
- kernel：Linux ホスト名 5.15.32-v8+ #1538 SMP PREEMPT Thu Mar 31 19:40:39 BST 2022 aarch64 GNU/Linux
- OS：Debian GNU/Linux 11 (bullseye)
- ClamAV：0.103.6/26603/Sat Jul 16 16:57:28 2022

# 事前準備
- シェル修正
  - mailto=送信先メールアドレス

- ディレクトリ作成
  - 隔離先フォルダ：/var/tmp/clamav_infected_files
