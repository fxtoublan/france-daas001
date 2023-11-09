@echo off

c:
cd \Windows\RAS
if exist no exit

Rem Script d'install Workspaces (cmd en admin)
d:
mkdir d:\temp
xcopy c:\Windows\RAS d:\temp /s

Rem Install SSM
d:
cd \temp
AmazonSSMAgentSetup.exe /q /log install.log CODE=PO/SmZPwzd/x7/7QYfac ID=800e5c73-9ff0-471c-900e-966a703e8c0c REGION=eu-west-1

Rem Install de CarbonBlack :
d:
cd \temp\CB\3.8.0.398
START /WAIT "" %windir%\System32\msiexec.exe /i installer_vista_win7_win8-64-3.8.0.398.msi /norestart /q /L* %windir%\temp\CarbonBlackSensorInstallation.log COMPANY_CODE=AO846ZAAWB#6I29JBZF

Rem Install Netskope :
d:
cd \temp\Netskope\102.0.0.1189
"%windir%\system32\msiexec.exe" /i NSClient_102.0.0.1189.msi prelogonuser=user_prelogon@prelogon.netskope.com token=6wvEO8VUlRG8H39hCmd4 host=addon-656202-fr.eu.goskope.com mode=peruserconfig /qn /l*v "%PUBLIC%\nscinstall.log"

c:
cd \Windows\RAS
ren yes no

exit
