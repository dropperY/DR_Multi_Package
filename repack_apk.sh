if [ $# -lt 2 ]; then
	echo "invalid arguments"
	exit 0
fi

cdir=$(pwd) 

echo $cdir

apkPath=$1
apkChannelS=$2
apkChannelE=$apkChannelS

distDir=$cdir/tmp

apkName=${apkPath##*/}

apkName=${apkName%.*}

echo "repack apkName --- " $apkName

rm temp.apk
cp $apkPath temp.apk

rm -rf assets
mkdir assets

echo  "zip rm META-INF "

zip -d temp.apk "META-INF/*"  

if [ $# -gt 3 ]; then
	echo 
	i=0
	interval=1
	for var in $*; do
		if [ $i -gt 0 ]; then
			echo "pack apk with channelId" var

			zip -d temp.apk assets/config.txt
			rm assets/config.txt
			echo $var >> assets/config.txt
			zip -g temp.apk assets/config.txt
   			newApkName=$apkName"_"$var.apk

            cp temp.apk $newApkName

            #echo "sign apk with keystore"
            #$JAVA_HOME/bin/jarsigner -keystore your.keystore -storepass yourPass -keypass yourPass  -signedjar temp_signed.apk temp.apk yourAlias -verbose -certs -digestalg SHA1 -sigalg MD5withRSA

            #./zipalign -v -f 4 temp_signed.apk $newApkName

            #rm temp_signed.apk

		fi
		i=`expr $i + $interval`
	done
	

#rm temp.apk
	rm -rf assets

	exit 0
fi





