@echo off

echo This will first install chocolatey, then other tools
echo .
echo Browse https://chocolatey.org/packages for packages
echo .
echo Ensure that your cmd.exe runs as Administrator
echo .
echo If at university, disable any proxy in the Internet Explorer Network settings.
echo .
pause
echo .

powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco feature enable -n=allowGlobalConfirmation
pause

echo Now chocolatey should be ready and we can go ahead
echo .
pause

choco install git.install -y --params "/GitAndUnixToolsOnPath /NoAutoCrlf /WindowsTerminal"
call refreshenv
rem performance tweaks
git config --global core.commitGraph true
git config --global core.longpaths true
git config --global core.preloadindex true
git config --global core.fscache true
git config --global gc.auto 256
rem some color and diff tweaks
git config --global diff.indentHeuristic true
git config --global color.diff.new "green bold"
git config --global color.status.updated "green bold"
git config --global color.branch.current "green bold"
rem always have Linux line endings in text files
git config --global core.autocrlf input

rem see https://github.com/github/hub for more information on this git tool
choco install github-desktop
choco install tortoisegit
choco install gitkraken
choco install keepass

choco install firefox
choco pin add -n=firefox

choco install googlechrome
choco pin add -n=googlechrome

choco install conemu clink
rem enable normal files also to be treated as executable - see https://github.com/mridgers/clink/issues/311#issuecomment-95330570
rem clink set exec_match_style -1

rem choco install autohotkey.install
rem choco install classic-shell
rem Needs to be installed after a reboot
rem choco install QTTabBar

choco install notepadplusplus
choco install vscode
choco pin add -n vscode

choco install putty.install
choco install winscp.install
choco install tortoisesvn

choco install jdk8 jre8
choco install jetbrainstoolbox
choco pin add -n=jetbrainstoolbox

choco install pdfcreator

rem choco install lockhunter
rem choco install windirstat
rem choco install sysinternals
rem choco install procexp
rem choco install procmon
rem choco install autoruns

rem disabled, because it depends on powershell, which is provided by Windows itself
rem choco install poshgit

choco install strawberryperl python2 python3
choco install ruby
choco install miktex
choco install texstudio
choco install sumatrapdf.install
choco install jabref
rem choco isntall imagemagick

choco install 7zip
choco install nodejs-lts
choco install jsonedit
rem choco install fiddler4
choco install winmerge
rem choco install ack

choco install f.lux
choco pin add -n=f.lux
choco install teamviewer
choco install vlc

rem enable editing the Outlook auto completion
rem choco install nk2edit.install

rem interactive
rem choco install windowsessentials

choco install docker-for-windows 
choco pin add -n=docker-for-windows 

rem This allows to burn ISOs - see https://rufus.akeo.ie/
choco install rufus

rem requires restart
rem choco install adobereader

echo To keep your system updated, run update-all.bat regularly from an administrator CMD.exe.
echo .
echo Please follow the steps described at https://conemu.github.io/en/DefaultTerminal.html#Description
echo .
echo Follow the steps described at http://tech.brookins.info/2015/11/07/my-git-setup-in-windows.html to get git running with putty and an SSH key
echo Install "Snipaste" from the Windows Store
echo Optional: Install "paint.net" from the Windows Store
echo Optional: Afterwards, follow the instructions at https://github.com/tj/git-extras/blob/master/Installation.md#windows to install git-extras
echo Optional: Install MikTeX by following https://github.com/latextemplates/scientific-thesis-template#recommended-setup-of-miktex
echo .
pause
