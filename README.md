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

##### Use following syntax in your inventory.ini file
#### Here it makes extra sense to use hostname instead of ip address. Inventory name of host will be used for a multitude of other variables.
```
host.com  ansible_ssh_user=<user> ansible_become_pass=<sudo-password-for-user>'
```
##### `cd rsync-backup-ansible-depl/`
##### `cp inv_example.ini inv_<your.domain>.ini`
##### Now insert your hosts to your `inv_<your.domain>.ini` file and remove all `<insert_host>` lines

---
## To edit defaults
### Defaults will be overwritten by host_vars if file is present for host
##### `cd rsync-backup-ansible-depl/roles/rsync-backup/defaults/`
##### `cp main.yml.example main.yml`
##### `vim main.yml`
#### Now edit to your likings
---
## Using host vars instead of single defaults file
##### `cd rsync-backup-ansible-depl/host_vars/`
##### `bash make-host_vars.sh ../inv_<your-hostfile>.ini`
#### script will auto generate host_vars/<yourhost.com>.yml that you can edit to your likings.
---
## To run playbook

##### `ansible-playbook -i inv_<your.domain>.ini 00_rsync-backup.yml -become --ask-become-pass`
###### `--ask-become-pass` is only nessasary when sudo auth not specified in ini
