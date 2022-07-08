# iaac_sample

```
cd Terraform
ssh-keygen -f infrastructure_admin_key -N ""
terraform plan
terraform apply
```
の後に,
```
cd ../ansible/setup
ansible-playbook playbook/master.yml --private-key=../../terraform/infrastructure_admin_key
```
すると、インフラの構築とグループ・ユーザーの作成が行われるようになってる。
Toy Examleなので、ここからいろいろ変更して使う。
