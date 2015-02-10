7z920.exe
curl -LOk https://github.com/open-learning-exchange/BeLL-Apps/archive/v0.11.24.zip
7z.exe x v0.11.24.zip
timeout 2
move BeLL-Apps-0.11.24 BeLL-Apps
del /f v0.11.24.zip
