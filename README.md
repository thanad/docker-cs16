docker-cs16
===========

Counter Strike 1.6 dedicated server in docker

### Install with steamcmd.sh
```
login anonymous
app_update 90 validate
```

### Start server with
```
cd ~/Steam/steamapps/common/Half-Life && ./hlds_run -game cstrike -autoupdate +maxplayers 30 +map de_dust2
```

### Reference
https://blog.flowl.info/2014/hlds-steamcmd-counter-strike-1-6-server-debian-working-2014
https://forums.alliedmods.net/showthread.php?t=221666
