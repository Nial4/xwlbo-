#!/bin/bash
#Power by Manjaro
echo "Hello World !"
echo '--Doanloading--'

mapfile -t my_array < <(
wget -qO- http://m.xwlbo.com/mp3.php | 
grep -Eo "mp3url[a-zA-Z0-9./?=_-]*" | sort -u
)
echo '--Dowanlod Fine--'

echo "--reshape--"
my_array=("${my_array[@]/#/http://m.xwlbo.com/}")
echo "--reshape over--"

echo '--Dowanlod m4a--'
for(( i=0;i<20;i++)) do
echo "--open ${my_array[i]}--";
mapfile -t my_m4a < <(
wget -qO- ${my_array[i]} | 
grep -Eo "http://cnvod.cnr.cn/[a-zA-Z0-9./?=_-]*|20[a-zA-Z0-9./?=_-]*年[a-zA-Z0-9./?=_-]*月[a-zA-Z0-9./?=_-]*日新闻联播.mp3" |sort -u
)
echo "--${my_m4a[0]} is get--"
echo "--${my_m4a[1]} is get--"
wget ${my_m4a[1]} -O ./${my_m4a[0]}
echo "--${my_m4a[0]} is done--"
done;
echo '--done--'


