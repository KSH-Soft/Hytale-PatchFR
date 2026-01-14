Rem ---------------------- Copyright ----------------------------------
:: Code par KSH-Soft, ne pas copier, modifier, distribuer ce code sans mon autorisation
:: Ne pas supprimer ce Copyright, merci. :-)
Rem ---------------------- Copyright ----------------------------------
REM Ce projet est non officiel et n’est pas affilie à Hypixel Studios.
REM Hytale et tous les elements associes sont la propriete de leurs detenteurs respectifs.
@echo off
SET "version=0.1"
SET "locHytale=C:\Users\%USERNAME%\AppData\Roaming\Hytale\install\release\package\game\latest\Client\Data\Shared\Language\fr-FR"
REM ## DATE Gen ##
for /f "tokens=1-3 delims=/:. " %%a in ("%date%") do (
    set "d=%%a"
    set "m=%%b"
    set "y=%%c"
)
for /f "tokens=1-3 delims=:.," %%a in ("%time%") do (
    set "hh=%%a"
    set "mi=%%b"
    set "ss=%%c"
)
if 1%hh% LSS 110 set "hh=0%hh%"
set "mydate=%y%%m%%d%_%hh%%mi%%ss%"
REM ##############

cls
call :LOGO
echo Mise a jour de votre Pack de langue pour Hytale !
echo.
pause
echo.
echo Configuration...
echo.

IF NOT EXIST "%locHytale%" GOTO NeedFolder
GOTO FolderOK

:NeedFolder
echo Erreur : le dossier "%locHytale%" n'existe pas.
echo.
echo Merci de selectionner votre dossier 'fr-FR'
echo Qui se trouve en general dans le dossier 'Data\Shared\Language\fr-FR' de votre jeu.
echo.
pause
echo.
set "vbsfile=%temp%\SelectFolder.vbs"
echo Set objShell = CreateObject("Shell.Application")>"%vbsfile%"
echo Set objFolder = objShell.BrowseForFolder(0, "Select your fr-FR folder:", ^&H1^&)>>"%vbsfile%"
echo If Not objFolder Is Nothing Then>>"%vbsfile%"
echo     WScript.Echo objFolder.Self.Path>>"%vbsfile%"
echo End If>>"%vbsfile%"

for /f "delims=" %%a in ('cscript //nologo "%vbsfile%"') do set "folder=%%a"

del "%vbsfile%" >nul 2>&1

IF NOT DEFINED folder (
    echo Aucun dossier selectionne. Abandon...
    pause
    exit /b 1
)

SET "locHytale=%folder%"
echo Dossier selectionne : %locHytale%
echo.
pause
GOTO FolderOK

:FolderOK
REM IF NOT EXIST "%locHytale%" (
	REM echo Erreur : le dossier "%locHytale%" n'existe pas.
	REM echo.
	REM echo Merci Selectionnez votre dossier 'fr-FR'
	REM echo Qui se trouve en generalement dans le dossier 'Data\Shared\Language\fr-FR' de votre jeu.
	REM echo.
	REM pause
    REM call :FolderBrowser
	REM SET "locHytale=%folder%"
	REM echo %folder%
	REM pause
	REM pause
	REM pause
	REM pause
REM )

SET KSHSOFT_FOLDER=%appdata%\KSH-SOFT\HytalePatchFR
SET TEMP_FOLDER=%appdata%\KSH-SOFT\HytalePatchFR\TMP
IF NOT EXIST "%KSHSOFT_FOLDER%" mkdir "%KSHSOFT_FOLDER%"
IF NOT EXIST "%TEMP_FOLDER%" mkdir "%TEMP_FOLDER%"

echo.
echo Telechargement... Veuillez patienter...
echo.

SET FILE_NAME1=meta.lang
echo Telechargement de %FILE_NAME1% ... 
SET FILE_URL=https://raw.githubusercontent.com/KSH-Soft/Hytale-PatchFR/refs/heads/main/fr-FR/meta.lang
curl -# -L -o "%TEMP_FOLDER%\%FILE_NAME1%" "%FILE_URL%"
echo.

SET FILE_NAME2=client.lang
echo Telechargement de %FILE_NAME2% ... 
SET FILE_URL=https://raw.githubusercontent.com/KSH-Soft/Hytale-PatchFR/refs/heads/main/fr-FR/client.lang
curl -# -L -o "%TEMP_FOLDER%\%FILE_NAME2%" "%FILE_URL%"
echo.

SET FILE_NAME3=server.lang
echo Telechargement de %FILE_NAME3% ... 
SET FILE_URL=https://raw.githubusercontent.com/KSH-Soft/Hytale-PatchFR/refs/heads/main/fr-FR/server.lang
curl -# -L -o "%TEMP_FOLDER%\%FILE_NAME3%" "%FILE_URL%"
echo.
IF %ERRORLEVEL% NEQ 0 (
    echo Erreur pendant le telechargement.
    echo Merci de contacter le developpeur, KSH-Soft.
	echo.
	pause
    exit /b 1
)

echo Installation du Patch FR...
echo.

SET "DEST_FILE1=%locHytale%\%FILE_NAME1%"
echo %DEST_FILE1%
SET "DEST_FILE2=%locHytale%\%FILE_NAME2%"
SET "DEST_FILE3=%locHytale%\%FILE_NAME3%"

MOVE /Y "%DEST_FILE1%" "%KSHSOFT_FOLDER%\meta_Backup_%mydate%.lang"
MOVE /Y "%DEST_FILE2%" "%KSHSOFT_FOLDER%\client_Backup_%mydate%.lang"
MOVE /Y "%DEST_FILE3%" "%KSHSOFT_FOLDER%\server_Backup_%mydate%.lang"

MOVE /Y "%TEMP_FOLDER%\%FILE_NAME1%" "%DEST_FILE1%" 
MOVE /Y "%TEMP_FOLDER%\%FILE_NAME2%" "%DEST_FILE2%" 
MOVE /Y "%TEMP_FOLDER%\%FILE_NAME3%" "%DEST_FILE3%" 

echo.
echo Nettoyage du dossier temporaire...
echo.

rmdir /s /q "%TEMP_FOLDER%"

cls
call :LOGO
echo Mise a jour de votre Pack de langue pour Hytale Termine !
echo.
echo Vous pouvez re-lancer votre jeu...
echo.
echo Appuyez sur une touche ou fermez cette fenetre...
pause>nul
exit
exit
exit

:LOGO
echo.
echo     _   _       _        _                ______     _       _      ____________ 
echo    ^| ^| ^| ^|     ^| ^|      ^| ^|               ^| ___ \   ^| ^|     ^| ^|     ^|  ___^| ___ \
echo    ^| ^|_^| ^|_   _^| ^|_ __ _^| ^| ___   ______  ^| ^|_/ /_ _^| ^|_ ___^| ^|__   ^| ^|_  ^| ^|_/ /
echo    ^|  _  ^| ^| ^| ^| __/ _` ^| ^|/ _ \ ^|______^| ^|  __/ _` ^| __/ __^| '_ \  ^|  _^| ^|    / 
echo    ^| ^| ^| ^| ^|_^| ^| ^|^| (_^| ^| ^|  __/          ^| ^| ^| (_^| ^| ^|^| (__^| ^| ^| ^| ^| ^|   ^| ^|\ \ 
echo    \_^| ^|_/\__, ^|\__\__,_^|_^|\___^|          \_^|  \__,_^|\__\___^|_^| ^|_^| \_^|   \_^| \_^|
echo            __/ ^|                                                                 
echo           ^|___/               v%version% - By KSH-Soft (github.com/KSH-Soft)  
echo.
echo.
goto:EOF 