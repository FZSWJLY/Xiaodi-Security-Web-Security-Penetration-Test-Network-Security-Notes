@echo off
start "burpsuite" /B "javaw.exe" -Xmx8G -XX:-UseParallelGC -noverify -javaagent:BurpSuiteLoader.jar -Dfile.encoding=utf-8 -jar "%~dp0burpsuite_pro_v2021.2.jar" %*
exit 0 
