@echo off
color 0E
set pth=%~dp0%
pushd %pth%

echo.
echo ======================= proxy客户端配置文件生成脚本 =======================
echo.
echo.
echo   1.请按要求输入proxy-heroku帐号和密码。帐号格式是“example.herokuapp.com”
echo.
echo   2.配置文件要放在proxy.exe程序文件目录下，双击运行生成的批处理即可联网。
echo.
echo ===========================================================================
echo.
set /p proxyApp="请输入proxy账号名并按回车："
::检测账号名输入是否为空
if "%proxyApp%"=="" (
	echo.
	echo 注意：proxy帐户名不能为空，请重新输入！
	ping 127.0.0.1 -n 2 >nul
	call :repeatApp
)
echo.
set /p proxyPassword="请输入proxy账号密码并按回车："
::检测账号密码输入是否为空
if "%proxyPassword%"=="" (
	echo.
	echo 注意：proxy帐户密码不能为空，请重新输入！
	ping 127.0.0.1 -n 2 >nul
	call :repeatPwd
)

echo.
echo 正在生成proxy客户端配置文件...
ping 127.0.0.1 -n 2 >nul
(
echo @echo off
echo color 0A
echo title proxy-windows-386-10.0
echo pushd %%~dp0%%
echo.
echo ::客户端配置
echo if exist proxy.exe ^(
echo     proxy.exe http -t tcp -p :1080 -T wss -P %proxyApp%:443 --parent-ws-password %proxyPassword% -q 8.8.8.8:53 --timeout 30000
echo ^) else ^(
echo     echo.
echo     echo 找不到proxy.exe程序，请检查！
echo     timeout /t 5 /nobreak
echo ^)
) >"%pth%\proxy-heroku-%proxyApp%.bat"
echo.
echo proxy配置文件已生成，按任意键退出！
pause >nul
goto eof



::-----子程序-----
:repeatApp
echo.
set /p proxyApp="请输入proxy账号名并按回车："
if "%proxyApp%"=="" (
	echo.
	echo 注意：proxy帐户名不能为空，请重新输入！
	ping 127.0.0.1 -n 2 >nul
	goto repeatApp
)
goto eof

:repeatPwd
echo.
set /p proxyPassword="请输入proxy账号密码并按回车："
if "%proxyPassword%"=="" (
	echo.
	echo 注意：proxy帐户密码不能为空，请重新输入！
	ping 127.0.0.1 -n 2 >nul
	goto repeatPwd
)
goto eof


:eof