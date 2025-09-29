@echo off
echo ==================================
echo Installing Google Chrome
winget install --id Google.Chrome -e --silent --accept-package-agreements --accept-source-agreements
 
echo ==================================
echo Installing Adobe Reader
winget install --id Adobe.Acrobat.Reader.64-bit -e --silent --accept-package-agreements --accept-source-agreements
 
echo ==================================
echo Installing Skype
winget install --id Skype.Skype -e --silent --accept-package-agreements --accept-source-agreements
 
echo ==================================
echo Installing Java Runtime (Temurin 17)
winget install --id Eclipse.Temurin.17.JRE -e --silent --accept-package-agreements --accept-source-agreements
 
echo ==================================
echo Installing 7-Zip
winget install --id 7zip.7zip -e --silent --accept-package-agreements --accept-source-agreements
 
echo ==================================
echo Installing Apache OpenOffice
winget install --id Apache.OpenOffice -e --silent --accept-package-agreements --accept-source-agreements
 
echo ==================================
echo DONE
pause
