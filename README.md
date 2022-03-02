# rsync-backup-ansible-depl

### Description
## Take/transfer backup via Rsync. Deployment via Ansible playbook


---
## Make sure inventory file is populated with hosts. 

* atleast one `[backup_servers]` host
* Populate `[targets]` with hosts that should get backed up. 
##### NOTE: If `[backup_servers]` host/s should be backed up. Include it here as well

---
## If sudo authentication differs from target to target

##### use following syntax in your inventory.ini file
```
host.com  ansible_ssh_user=<user> ansible_become_pass=<sudo-password-for-user>'
```

---
## To edit defaults
##### `cd rsync-backup-ansible-depl/roles/rsync-backup/defaults/`
##### `cp main.yml.example main.yml`
##### `vim main.yml`
---
## Using host vars instead of single defaults file
##### `cd rsync-backup-ansible-depl/host_vars/`
##### `cp host.yml.example <host.com>.yml`
##### `vim <host.com>.yml`
---
## To run playbook

##### `ansible-playbook -i inv_test.ini 10_backup_servers.yml -become --ask-become-pass`
