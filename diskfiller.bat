@echo off

setlocal enabledelayedexpansion

set "target=%userprofile%\Disk\Diskfiller\README.txt"

if not exist "%userprofile%\Disk\Diskfiller\Diskfillerfiles" mkdir "%userprofile%\Disk\Diskfiller\Diskfillerfiles"

echo This program is a method of filling up your disk space (or storage). It simply functions on creating a file that is 100MB large (using fsutil) and then doing that 100 times, and then encrypting everything. Then, it goes again, for 2000 times, until your device runs out of storage. To free-up all the storage later on, simply delete the folder (%userprofile%\Disk\Diskfiller). > %target%

start cmd /c timeout /t 1 /nobreak

start "" "%userprofile%\Disk\Diskfiller\README.txt"

echo ---
echo This will eat all of your storage, do you wish to continue?
echo ---

choice /c yn /m "Continue?"
if errorlevel 2 goto no
if errorlevel 1 goto yes

:yes
echo good luck!
if not exist "%userprofile%\Disk\Diskfiller\Diskfillerfiles\Pg1" mkdir "%userprofile%\Disk\Diskfiller\Diskfillerfiles\Pg1"
if not exist "%userprofile%\Disk\Diskfiller\Diskfillerfiles\Pg2" mkdir "%userprofile%\Disk\Diskfiller\Diskfillerfiles\Pg2"
if not exist "%userprofile%\Disk\Diskfiller\Track" mkdir "%userprofile%\Disk\Diskfiller\Track"

for /L in %%i in (1,1,2000) do (
    cipher /e /s:"%userprofile%\Disk\Diskfiller\Diskfillerfiles"
    tree %userprofile%\Disk\Diskfiller\Diskfillerfiles
    set "track=0"
    set /a track +=1
    set "target=%userprofile%\Disk\Diskfiller\Track\track!track!.txt"
    echo The script has created 50 Disk filler files. In total, the script has created !advancedtrack! files.

    for /L in %%i in (1,1,25) do (
        set "num=!random!"
        set "num=000000!num!"
        set "num=!num:~-6!"
        fsutil file createnew "%userprofile%\Disk\Diskfiller\Diskfillerfiles\Pg1\fillfile!num!.txt" 10485700
        fsutil file createnew "%userprofile%\Disk\Diskfiller\Diskfillerfiles\Pg2\fillfile!num!.txt" 10485700 
        set "advancedtrack=0"
        set /a advancedtrack +=1
    )
)

goto end

:no

if not exist "%userprofile%\Disk\Diskfiller\Repo" mkdir "%userprofile%\Disk\Diskfiller\Repo"

echo Closing...

if not exist "%userprofile%\Disk\Diskfiller\Repo\Fe.txt" fsutil file createnew "%userprofile%\Disk\Diskfiller\Repo\Fe.txt"

if not exist "%userprofile%\Disk\Diskfiller\Repo\Close.txt" echo cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e > "%userprofile%\Disk\Diskfiller\Repo\Close.txt"

timeout /t 5 /nobreak

goto end

:end
endlocal