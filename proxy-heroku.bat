@echo off
color 0E
set pth=%~dp0%
pushd %pth%

echo.
echo ======================= proxy�ͻ��������ļ����ɽű� =======================
echo.
echo.
echo   1.�밴Ҫ������proxy-heroku�ʺź����롣�ʺŸ�ʽ�ǡ�example.herokuapp.com��
echo.
echo   2.�����ļ�Ҫ����proxy.exe�����ļ�Ŀ¼�£�˫���������ɵ���������������
echo.
echo ===========================================================================
echo.
set /p proxyApp="������proxy�˺��������س���"
::����˺��������Ƿ�Ϊ��
if "%proxyApp%"=="" (
	echo.
	echo ע�⣺proxy�ʻ�������Ϊ�գ����������룡
	ping 127.0.0.1 -n 2 >nul
	call :repeatApp
)
echo.
set /p proxyPassword="������proxy�˺����벢���س���"
::����˺����������Ƿ�Ϊ��
if "%proxyPassword%"=="" (
	echo.
	echo ע�⣺proxy�ʻ����벻��Ϊ�գ����������룡
	ping 127.0.0.1 -n 2 >nul
	call :repeatPwd
)

echo.
echo ��������proxy�ͻ��������ļ�...
ping 127.0.0.1 -n 2 >nul
(
echo @echo off
echo color 0A
echo title proxy-windows-386-10.0
echo pushd %%~dp0%%
echo.
echo ::�ͻ�������
echo if exist proxy.exe ^(
echo     proxy.exe http -t tcp -p :1080 -T wss -P %proxyApp%:443 --parent-ws-password %proxyPassword% -q 8.8.8.8:53 --timeout 30000
echo ^) else ^(
echo     echo.
echo     echo �Ҳ���proxy.exe�������飡
echo     timeout /t 5 /nobreak
echo ^)
) >"%pth%\proxy-heroku-%proxyApp%.bat"
echo.
echo proxy�����ļ������ɣ���������˳���
pause >nul
goto eof



::-----�ӳ���-----
:repeatApp
echo.
set /p proxyApp="������proxy�˺��������س���"
if "%proxyApp%"=="" (
	echo.
	echo ע�⣺proxy�ʻ�������Ϊ�գ����������룡
	ping 127.0.0.1 -n 2 >nul
	goto repeatApp
)
goto eof

:repeatPwd
echo.
set /p proxyPassword="������proxy�˺����벢���س���"
if "%proxyPassword%"=="" (
	echo.
	echo ע�⣺proxy�ʻ����벻��Ϊ�գ����������룡
	ping 127.0.0.1 -n 2 >nul
	goto repeatPwd
)
goto eof


:eof