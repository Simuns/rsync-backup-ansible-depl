hosts=$(grep -Fvx -f .inv_empty.ini $1 | grep -Ev "^#|^$")
for line in $hosts
do
    echo "Generated host_var file: $line.yml"
    cp ../roles/rsync-backup/defaults/main.yml $line.yml
done
echo "------------------------------"
echo "Now edit them to your likings"
