cp /data/data/com.injector.lios/files/cpp/hookclash.so /data/hookclash.so
cp /data/data/com.injector.lios/files/cpp/clashhack.so /data/clashhack.so
chmod 777 /data/hookclash.so
chown root /data/hookclash.so
chmod 777 /data/clashhack.so
chown root /data/clashhack.so
sleep 3
am start -a android.intent.action.MAIN -n com.herogame.gplay.lastdayrulessurvival/.UnityPlayerActivity
sleep 3
su -c /data/hookclash.so --pname com.herogame.gplay.lastdayrulessurvival --libpath /data/clashhack.so