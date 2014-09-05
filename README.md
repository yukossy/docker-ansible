docker-ansible
==========
### ansibleを使ってdockerを管理する練習

* dockerfileは最低限のSSHレベルまでを構築する
* ansibleによってその後のprovisioningする
* 現状Ubuntuのみ対応

### 使い方や注意点

* authorized_keysは各自用意してください

```ssh-keygen
ssh-keygen
cp -p ~/.ssh/id_rsa.pub ./authorized_keys
```
