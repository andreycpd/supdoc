@echo off
cls
:menu
cls
color 0F

date /t

@echo off 
echo Computador: %computername%        Usuario: %username%
echo.            
echo.            MENU TAREFAS
echo  ===========================================================
echo * 1. Map                                
echo * 6. Sair                               					
echo  ===========================================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% GEQ 7 goto opcao7

:opcao1
cls
set /p op= Escolha Letra da unidade:
set /p op1= Nome do servidor:
set /p op2= Caminho da pasta compartilhada: 
echo net use %op%: \\%op1%\%op2% >> map.bat
xcopy map.bat %AppData%\Microsoft\Windows\"Start Menu"\Programs\Startup

echo ======================================
echo * MAPEAMENTO CRIADO COM SUCESSO .... *
echo ======================================
pause
goto menu
