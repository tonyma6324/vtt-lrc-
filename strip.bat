@echo off
setlocal enabledelayedexpansion

echo 当前目录下的文件名去掉后八个字符并保留扩展名：
echo ----------------------------------------

rem 遍历当前目录下的所有文件
for %%f in (*.lrc) do (
    set "filename=%%~nf"  rem 获取文件名（不带扩展名）
    set "extension=%%~xf"  rem 获取文件扩展名

    rem 检查文件名长度是否大于8
    if "!filename!" neq "" (
        set "newname=!filename:~0,-8!!extension!"  rem 去掉后八个字符并保留扩展名

        rem 只在新文件名不为空时重命名
        if not "!newname!"=="" (
            echo 原文件名：%%f
            echo 新文件名：!newname!
            ren "%%f" "!newname!"
            echo ----------------------------------------
        ) else (
            echo 原文件名：%%f
            echo 新文件名：无效（去掉后八个字符后文件名为空）
            echo ----------------------------------------
        )
    )
)

pause