@echo off

echo 查找当前文件夹下所有后缀为 .vtt 的文件：
echo ----------------------------------------
for %%f in (*.vtt) do (
    call :process_vtt_file "%%f"
)
echo ----------------------------------------

:process_vtt_file
if "%~1"=="" (
  echo 文件处理完毕，开始去除后缀
  call strip.bat
  echo 所有 .vtt 文件处理完毕。
  goto :eof
)
echo 正在处理文件：%1
call work.bat %1
goto :eof

:end
