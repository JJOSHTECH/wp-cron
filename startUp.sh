#!/bin/bash

echo "#!/bin/bash" >> /root/cacheJob

env >> /root/cacheJob

cat /root/cronScript.sh >> /root/cacheJob
cat /root/cacheJob > /root/cronScript.sh
