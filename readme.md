по ssh зайти на vm1
ssh -i id_rsa user@<<ip external vm1>>

установить git и ansible

скопировать в ~/.ssh/id_rsa

git clone https://github.com/aorlov18/B6_project.git

cd B6_project/ansible

поправить <<ip_internal>> в /inventory/host.yml

проверить ansible all -m ping

выполнить ansible-playbook playbook.yml