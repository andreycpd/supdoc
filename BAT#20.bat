@echo off
cls
:menu
cls
color 80
                   
echo            MENU TAREFAS
echo  ==================================       
echo * 1. Executar              
echo * 2. Criar atalhos na Area de Trabalho              
echo * 3. Sair                         
echo  ==================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% GEQ 4 goto opcao4

:opcao1

set /p cmh= Digite o caminho da pasta DOCTORS: 
echo -----------------------------------------


cls
echo
if not exist "%APPDATA%\ERRO20" (
	MD "%APPDATA%\ERRO20"
 )
 
CD "%APPDATA%\ERRO20"

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Btrieve Technologies\Microkernel Workstation Engine\Version  6.15\Settings]"Home Directory"="%UserProfile%" >> ERRO20.reg

CD "%APPDATA%\ERRO20"

if not exist "%APPDATA%\ERRO20\PORTARIA.bat" (
echo reg import %APPDATA%\ERRO20\ERRO20.reg >> PORTARIA.bat
if exist "%CMH%\SETUP\PORTARIA.EXE" (
echo START %CMH%\SETUP\PORTARIA.EXE >> PORTARIA.bat
 )
)

if not exist "%APPDATA%\ERRO20\DOCTORS.bat" (
echo reg import %APPDATA%\ERRO20\ERRO20.reg >> DOCTORS.bat
if exist "%CMH%\SETUP\PORTARIA.EXE" (
echo START %CMH%\SETUP\PORTARIA.EXE >> DOCTORS.bat
 )
)

echo
echo set WshShell = WScript.CreateObject("WScript.Shell") >> PORTARIA.vbs
echo strDesktop = WshShell.SpecialFolders("DESKTOP") >> PORTARIA.vbs
echo set oShellLink = WshShell.CreateShortcut("PORTARIATS.lnk") >> PORTARIA.vbs
echo oShellLink.TargetPath = "%APPDATA%\ERRO20\PORTARIA.bat" >> PORTARIA.vbs
echo oShellLink.WindowStyle = 1 >> PORTARIA.vbs
echo oShellLink.Hotkey = "CTRL+SHIFT+F" >> PORTARIA.vbs
echo oShellLink.IconLocation = "%APPDATA%\ERRO20\PORTARIA.ICO, 0" >> PORTARIA.vbs
echo oShellLink.Description = "PORTARIA" >> PORTARIA.vbs
echo oShellLink.WorkingDirectory = strDesktop >> PORTARIA.vbs
echo oShellLink.Save >> PORTARIA.vbs

echo
echo set WshShell = WScript.CreateObject("WScript.Shell") >> DOCTORS.vbs
echo strDesktop = WshShell.SpecialFolders("DESKTOP") >> DOCTORS.vbs
echo set oShellLink = WshShell.CreateShortcut("DOCTORSTS.lnk") >> DOCTORS.vbs
echo oShellLink.TargetPath = "%APPDATA%\ERRO20\DOCTORS.bat" >> DOCTORS.vbs
echo oShellLink.WindowStyle = 1 >> DOCTORS.vbs
echo oShellLink.Hotkey = "CTRL+SHIFT+F" >> DOCTORS.vbs
echo oShellLink.IconLocation = "%APPDATA%\ERRO20\DOCTORS.ICO, 0" >> DOCTORS.vbs
echo oShellLink.Description = "DOCTORS" >> DOCTORS.vbs
echo oShellLink.WorkingDirectory = strDesktop >> DOCTORS.vbs
echo oShellLink.Save >> DOCTORS.vbs

start PORTARIA.vbs
start DOCTORS.vbs


cls
echo ===================================
echo * ARQUIVO CRIADO COM SUCESSO ...  *
echo ===================================
echo ============================================
echo * RETORNE PARA 'MENU' E ESCOLHE OPCAO '2'  *
echo ============================================
pause
goto menu

:opcao2
COPY "%APPDATA%\ERRO20\PORTARIATS.lnk" "%userprofile%\DESKTOP\PORTARIATS.lnk"
COPY "%APPDATA%\ERRO20\DOCTORSTS.lnk" "%userprofile%\DESKTOP\DOCTORSTS.lnk"
cls
echo ========================
echo * COPIADO PARA DESKTOP *
echo ========================
pause
goto menu

:opcao3
cls
exit

:opcao4
echo ==============================================
echo * Opcao Invalida! Escolha outra opcao do menu *
echo ==============================================
pause
goto menu