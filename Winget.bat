echo Installing Google Chrome
winget install -id Google.Chrome --silent --accept-package-agreements --accept-source-agreements

echo installing Adobe Reader...
winget install --id Adobe.Acrobat.Reader.64-bit --silent --accept-package-agreements --accept-source-agreements

echo installing Skype...
winget install --id Microsoft.Skype --silent --accept-package-agreements --accept-source-agreements

echo Installing Java
winget install --id Oracle.JavaRuntimeEnvironment --silent --accept-package-agreements --accept-source-agreements

echo Installing 7-Zip
winget install --id 7zip.7zip --silent --accept-package-agreements --accept-source-agreements

echo Installing OpenOffice
winget install --id Apache.OpenOffice --silent --accept-package-agreements --accept-source-agreements

echo DONE
pause
