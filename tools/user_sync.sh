#!/bin/bash
# Note : This script is relay on password less ssh access for master_node
master_node_ip=10.1.1.1
master_node_user='root'
master_node_passwd='netweb'
passwd_file='/etc/passwd'
shadow_file='/etc/shadow'
group_file='/etc/group'
gshadow_file='/etc/gshadow'

tdir=`mktemp -d`
cd $tdir
pwd=`pwd`
if [ "$pwd" = "$tdir" ]
then
	echo "Successuflly created temp directory $tdir"
else
	echo "Unable to change to newly created temp dir $tdir"
	rm -rf $tdir
	exit 1
fi
for file in "$passwd_file" "$shadow_file" "$group_file" "$gshadow_file"
do
	scp "$master_node_user"@"$master_node_ip":"$file" .
done
awk -F: '($3>=1000) && ($3<=60000)' $tdir/passwd > passwd.new
awk -F: '($3>=1000) && ($3<=60000)' $tdir/group > group.new
awk -F: '($3>=1000) && ($3<=60000) {print $1}' $tdir/passwd | grep -f - $tdir/shadow > shadow.new
awk -F: '($3>=1000) && ($3<=60000) {print $1}' $tdir/group | grep -f - $tdir/gshadow > gshadow.new
awk -F: '($3>=1000) && ($3<=60000) {print $1}' /etc/passwd > passwd.del
awk -F: '($3>=1000) && ($3<=60000)' /etc/group > group.del
awk -F: '($3>=1000) && ($3<=60000) {print $1}' /etc/passwd | grep -f - /etc/shadow | awk -F: '($3>=1000) && ($3<=60000) {print $1}' > shadow.del
awk -F: '($3>=1000) && ($3<=60000) {print $1}' /etc/group | grep -f - /etc/gshadow > gshadow.del
while read line
do
	sed -i "/$line:/d" /etc/passwd
done <$tdir/passwd.del
while read line
do
	sed -i "/$line/d" /etc/shadow
done <$tdir/shadow.del
while read line
do
	sed -i "/$line/d" /etc/group
done <$tdir/group.del
while read line
do
	sed -i "/$line/d" /etc/gshadow
done <$tdir/gshadow.del
cat passwd.new >> /etc/passwd
cat shadow.new >> /etc/shadow
cat group.new >> /etc/group
cat gshadow.new >> /etc/gshadow
rm -rf  $tdir
exit 0

