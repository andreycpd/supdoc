@echo off
IF EXIST "%SystemDrive%\DOC" (
	echo existe
) ELSE (
	mkdir %SystemDrive%\DOC
)
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
echo * 1. Inicializar DocServer da pasta Microsoft    
echo * 2. Inicializar DocServer da pasta Wow6432Node 
echo * 3. Inicializar DrServer               
echo * 4. Criar Mapeamento
echo * 5. Butil                                   
echo * 6. Sair                               					
echo  ===========================================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% GEQ 7 goto opcao7

:opcao1
cls
set /p un1= DIGITE A LETRA DA UNIDADE DE DISCO.: 
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Doctors Office" /d "%un1%:\DOC\DOCTORS\DOCSERV.EXE /i"
echo ==================================
echo *      DocServer Inicializado    *
echo ==================================
pause
goto menu

:opcao2
cls
set /p un2= DIGITE A LETRA DA UNIDADE DE DISCO.: 
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run /v "Doctors Office" /d "%un2%:\DOC\DOCTORS\DOCSERV.EXE /i"
echo ==================================
echo *      DocServer Inicializado     *
echo ==================================
pause
goto menu

:opcao3
cls
set /p un3= DIGITE A LETRA DA UNIDADE DE DISCO.: 
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "DrServer" /d "%un3%:\DOC\DOCTORS\MEUDOCTORS\DRSERVER\drserver.exe"
echo ==================================
echo *     DrServer Inicializado      *
echo ==================================
pause
goto menu

:opcao4
cls
set /p op= Escolha Letra da unidade:
set /p op1= Nome do servidor:
set /p op2= Caminho da pasta compartilhada: 
net use %op%: \\%op1%\%op2%
echo ======================================
echo * MAPEAMENTO CRIADO COM SUCESSO .... *
echo ======================================
pause
goto menu
exit

:opcao5
cls
echo.
echo ===========
echo *  BUTIL  *
echo ===========
echo.
btrieve /P:2048
echo.
set /p bt= Digite o nome do arquivo danificado.: 
butil -recover %bt%.DAT %bt%.txt
ren *.DAT *.BAK
xcopy TEMPLATE\%bt%.DAT /y
butil -load %bt%.txt %bt%.DAT
echo ==================================
echo *   Voltar ao Menu tecle Enter  *
echo ==================================
pause
goto menu

:opcao6
cls
exit

:opcao7
echo ==============================================
echo * Opcao Invalida! Escolha outra opcao do menu *
echo ==============================================
pause
goto menu