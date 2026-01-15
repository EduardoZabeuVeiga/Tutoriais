@echo off
:: Pega a data e a hora
set timestamp=%date% - %time:~0,5%

echo ==========================================
echo [DIAGNOSTICO] Verificando status atual...
git status
echo ==========================================

echo.
echo [1/3] Adicionando arquivos...
git add .

echo.
echo [2/3] Tentando realizar commit (Horario: %timestamp%)...
git commit -m "%timestamp%"

:: Verifica se houve erro no commit
if %errorlevel% neq 0 (
    echo.
    echo [!] ERRO: O commit nao foi realizado.
    echo Provavel motivo: Nenhuma alteracao encontrada ou erro de config.
    echo.
    pause
    exit /b
)

echo.
echo [3/3] Enviando para o GitHub...
git push

echo.
echo ==========================================
echo TUDO PRONTO!
echo ==========================================
pause