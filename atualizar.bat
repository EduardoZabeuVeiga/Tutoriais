@echo off
:: Pega a data e a hora (Formato: DD/MM/AAAA - HH:MM)
set timestamp=%date% - %time:~0,5%

echo ==========================================
echo [1/3] Adicionando arquivos...
git add .


echo.
echo [2/3] Realizando commit (Horario: %timestamp%)...
git commit -m "%timestamp%"

echo.
echo [3/3] Enviando para o GitHub...
git push

echo.
echo ==========================================
echo TUDO PRONTO!
echo A janela fechara em 5 segundos.
echo ==========================================
timeout /t 5 >nul