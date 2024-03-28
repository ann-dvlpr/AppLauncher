APP=$1
apklocund=$(su -c pm list packages -f $APP | cut -c 9-1000 | sed s/=$APP//)
apkloc=$(echo $apklocund | tr ' ' '\n' | gum filter)
aapt d badging $apkloc | grep application-label: | sed s/application-label:// | sed s/"'"// | sed s/"'"//

echo $APP
echo
echo $apklocund
echo
echo $apkloc