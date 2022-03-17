# ansible nodes -m ping
## Modules
# ansible g-auditd -m shell -a "free -m" -v
# ansible g-auditd -m shell -a "df -h | grep sda"
# ansible docker-private-repo-clients -m shell -a "python3 -m pip list | grep docker"

# ansible g-auditd -m debug -a "var=inventory_hostname"
# ansible g-auditd -m debug -a "msg={{inventory_hostname}}"

#toget grops in ansible inventory/hosts
# ansible g-auditd -m debug -a "var=groups.keys()"

# to fetch information of managed nodes
# ansible g-auditd -m setup


## playbooks
# ansible-playbook myplay2_docker.yaml
# ansible-playbook myplay3_getdocker.yaml

# ansible-playbook myplay4_nfsserver.yaml
# ansible-playbook myplay4-1_nfsclient.yaml

#ansible-playbook myplay6_mongodb.yaml -v

#ansible-playbook myplay8_auditd.yaml -v

# ansible-playbook playbooks/p1_lineinfile.yaml --syntax-check

# ansible-playbook playbooks/p1.0_lineinfile_addline.yaml

# ansible-playbook playbooks/p1.2_lineinfile_commentline.yaml

# ansible-playbook playbooks/p1.1_lineinfile_replace.yaml

# ansible-playbook playbooks/p1.3_lineinfile_insertline.yaml

# ansible-playbook playbooks/p1.4_lineinfile_deleteline.yaml

# ansible-playbook playbooks/p3_private_docker_repo.yaml

# mkdir -p projects/ansible/{certificates,files,templates}

# ansible-playbook projects/ansible/openssl_certificate.yml

# ansible-playbook playbooks/docker-private-repo/p3_server_private_docker_repo.yaml

# ansible-playbook playbooks/docker-private-repo/p3_client_private_docker_repo.yaml

# ansible-playbook playbooks/docker_using_ansible/d_pull.yaml

# ansible-playbook playbooks/docker_using_ansible/d_portainer.yaml

## to create a role
# ansible-galaxy init roles/update_repos --offline


# ansible-galaxy init roles/xyz_java --offline

# ansible-galaxy init roles/nfs --offline

# ansible-playbook playbooks/others/r_roles_playbook.yaml


ansible-playbook playbooks_with_import/main_playbook.yaml