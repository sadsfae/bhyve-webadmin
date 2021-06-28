#/bin/sh

clear
echo "Updating BVCP ..."
echo ""
echo "Press [CTRL] + [C] to Abort !"
sleep 5

service bvcp-frontend stop
service bvcp-helper stop
service bvcp-backend stop

mkdir -p /var/lib/nPulse/BVCP
cp -R ./API/ /var/lib/nPulse/BVCP/API/
cp -R ./Backend/ /var/lib/nPulse/BVCP/Backend/
cp -R ./Frontend/ /var/lib/nPulse/BVCP/Frontend/
cp -R ./Helper/ /var/lib/nPulse/BVCP/Helper/

cp ./utils/bvcp-backend /usr/local/etc/rc.d/bvcp-backend
cp ./utils/bvcp-frontend /usr/local/etc/rc.d/bvcp-frontend
cp ./utils/bvcp-helper /usr/local/etc/rc.d/bvcp-helper

cd /var/lib/nPulse/BVCP/Helper
clang -o vmctl vmctl.c

#cd ../Backend/
#./vmm setup

service bvcp-backend start
service bvcp-helper start
service bvcp-frontend start

echo "Update Finished!"
sleep 10
