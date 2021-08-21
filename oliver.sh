FAILOVER1=1.2.3.4,2188,,1.2.3.4,11D912EA-FC83-11EB-B893-0242AC110002,/failover1/
iconfig/,0,1.2.3.4,51773,,0,,,0
[root@ip-10-249-162-180 iris-mirror]# cat oliver.sh 
newIP1=1.2.3.4
newIP2=10.234.567.890

FAILOVER1=$(grep FAILOVER1= iris.cpf)
oldIP1=$(echo $FAILOVER1 | awk '{print $2}' FS== | awk '{print $1}' FS=,)
#echo $oldIP1

newFAILOVER1=$(echo ${FAILOVER1} | sed "s/${oldIP1}/${newIP1}/g")
echo $newFAILOVER1
