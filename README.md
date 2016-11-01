### A simple shell script for multi-packaging

## Usage


```
	sh repack_apk.sh "path/your.apk" 1 2 4 5 8
```

it will replace the content of `assets/config.txt` with inputs, and generate new apks

## Notice

you must resign and zipalign those new apks before release 
