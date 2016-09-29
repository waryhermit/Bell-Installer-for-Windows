7z920.exe
curl -LOk https://github.com/open-learning-exchange/BeLL-Apps/archive/0.12.49.zip
7z.exe x 0.12.49.zip
timeout 15
move BeLL-Apps-0.12.49 BeLL-Apps
del /f 0.12.49.zip
