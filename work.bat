@echo off
chcp 65001



if not exist %1 (
  echo 错误的文件名！
  goto end
)

set counter=0
echo |set /p=>%1.lrc



setlocal EnableDelayedExpansion
for /f %%i in ('type %1') do (
  set /a counter+=1

  if !counter! GEQ 3 (
    if !counter!==3 (
      set ttt=%%i
    )
    if !counter!==4 (
      echo [!ttt:~3,8!]%%i>>%1.lrc
      set counter=1
    )
  )
)
setlocal DisableDelayedExpansion

:end