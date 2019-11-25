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

choco install git.install -y --params
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

choco install QTTabBar

choco install notepadplusplus
choco install vscode

choco install putty.install
choco install winscp.install
choco install tortoisesvn

choco install jdk8 jre8
choco install jetbrainstoolbox
choco pin add -n=jetbrainstoolbox

choco install pdfcreator

rchoco install windirstat
choco install procexp
choco install procmon

choco install strawberryperl python2 
choco install python3 --version=3.7.3
choco pin add -n=python3

choco install ruby
choco install miktex
choco install texstudio
choco install jabref

choco install 7zip
choco install nodejs-lts
choco install jsonedit
choco install winmerge

choco install docker-for-windows 
choco pin add -n=docker-for-windows 

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
