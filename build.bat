7z920.exe
curl -LOk https://github.com/open-learning-exchange/BeLL-Apps/archive/0.11.103.zip
7z.exe x 0.11.103.zip
timeout 15
move BeLL-Apps-0.11.103 BeLL-Apps
del /f 0.11.103.zip
