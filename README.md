# rsync-backup-ansible-depl

### Description
## Take/transfer backup via Rsync. Deployment via Ansible playbook
#### The purpose of this playbook is automating the setup of rsync backup.
You are required to define a backup host, combined with a list of 1 or more 
target hosts. 
#### The backup host will generate a repository to backup to, whilst also 
giving you the ability to define backup options like
* Backup frequency & Retention rate
* Backup From/To
* Backup service user

#### Backup host will generate a user with an ssh key and populate target
hosts with public ssh key on following service user.


---
# how to
## Make sure inventory file is populated with hosts. 

* atleast one `[backup_servers]` host (redundant backup is possible, just add mulitple hosts here)
* Populate `[targets]` with hosts that should get backed up. 
##### NOTE: If `[backup_servers]` host/s should be backed up. Include those here as well

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
## Start editing defaults first
### Defaults will be overwritten by host_vars if file is pressent for host
### Editing defauls first makes sense, because those variables will be replicated to your host_vars at a later point
##### `cd rsync-backup-ansible-depl/roles/rsync-backup/defaults/`
##### `cp main.yml.example main.yml`
##### `vim main.yml`
#### Now edit to your likings
---
## Using host vars instead of single defaults file
#### with the make-host_vars.sh scrpt you can copy the defaults to each host in host_vars. after generation of each host var you can edit host specific variables like backup location, retention rate and backup rate for each target.
If you have differing backup repo's for each backup servers, those can be pointed directly here as well
##### `cd rsync-backup-ansible-depl/host_vars/`
##### `bash make-host_vars.sh ../inv_<your-hostfile>.ini`
##### script will auto generate host_vars/<yourhost.com>.yml that you can edit to your likings.
---
## To run playbook

##### `ansible-playbook -i inv_<your.domain>.ini 00_rsync-backup.yml -become --ask-become-pass`
###### `--ask-become-pass` is only nessasary when sudo auth not specified in ini


## Author: Símun Højgaard Lutzen | simunhojgaard@gmail.com
