newIP1=1.2.3.4
newIP2=10.234.567.890

FAILOVER1=$(grep FAILOVER1= iris.cpf)
data1=$(echo $FAILOVER1 | awk '{print $2}' FS==)
oldIP1=$(echo $data1 | awk '{print $1}' FS=,)
echo $oldIP1

newFAILOVER1=$(echo ${FAILOVER1} | sed "s/${oldIP1}/${newIP1}/g")
echo $newFAILOVER1
