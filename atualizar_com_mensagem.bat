@echo off
chcp 65001 >nul
:: Pega a data e a hora (Formato: DD/MM/AAAA - HH:MM)
set timestamp=%date% - %time:~0,5%

echo ==========================================
echo         ATUALIZACAO DO GITHUB
echo ==========================================
echo.

:: Solicita a mensagem do commit ao usuario
set /p mensagem="Digite a mensagem do commit: "

:: Se a mensagem estiver vazia, usa o timestamp
if "%mensagem%"=="" (
    set mensagem=%timestamp%
    echo Mensagem vazia! Usando timestamp: %timestamp%
)

echo.
echo ==========================================
echo [1/3] Adicionando arquivos...
git add .

echo.
echo [2/3] Realizando commit...
echo Mensagem: %mensagem%
git commit -m "%mensagem%"

echo.
echo [3/3] Enviando para o GitHub...
git push

echo.
echo ==========================================
echo TUDO PRONTO!
echo Commit realizado com a mensagem:
echo "%mensagem%"
echo ==========================================
echo A janela fechara em 5 segundos.
timeout /t 500 >nul
