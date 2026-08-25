@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "scriptDir=%~dp0"
set "configFile=%scriptDir%execute-app.json"

if not exist "%configFile%" (
	echo Arquivo de configuracao nao encontrado: "%configFile%"
	pause
	exit /b 1
)

echo.
echo Projetos:
echo.

set /a optionCount=0
for /f "usebackq tokens=1-6 delims=|" %%A in (`powershell -NoProfile -ExecutionPolicy Bypass -Command "$config = Get-Content -Raw -LiteralPath '%configFile%' | ConvertFrom-Json; $number = 0; foreach ($project in @($config.projects)) { $number++; Write-Output ($number.ToString() + '|P|' + $project.description + '|' + $project.id + '|project') }; foreach ($group in @($config.groups)) { $number++; $descriptions = foreach ($projectId in @($group.projects)) { (@($config.projects | Where-Object { $_.id -eq [int]$projectId })[0]).description }; Write-Output ($number.ToString() + '|G|' + $group.description + '|' + ($descriptions -join ',') + '|' + (($group.projects -join ',')) + '|group') }"`) do (
	set "option[%%A]=%%B"
	set "description[%%A]=%%C"
	if "%%B"=="P" (
		set "value[%%A]=%%D"
	) else (
		set "value[%%A]=%%E"
	)
	set "optionCount=%%A"
	if "%%B"=="P" (
		echo   %%A. %%C
	) else (
		echo   %%A. %%C ^(grupo: %%D^)
	)
)

if !optionCount!==0 (
	echo Nenhum projeto ou grupo foi encontrado.
	pause
	exit /b 1
)

echo.
set /p "choice=Escolha uma opcao (0 para sair): "
if "%choice%"=="0" exit /b 0

set "selectedType=!option[%choice%]!"
set "selectedValue=!value[%choice%]!"
if not defined selectedType (
	echo Opcao invalida.
	pause
	exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "$config = Get-Content -Raw -LiteralPath '%configFile%' | ConvertFrom-Json; $type = '%selectedType%'; $value = '%selectedValue%'; $ids = if ($type -eq 'P') { @($value) } else { $value -split ',' }; foreach ($id in $ids) { $project = @($config.projects | Where-Object { $_.id -eq [int]$id })[0]; if ($null -ne $project) { $commandLine = 'cd /d "' + $project.path + '" && powershell -NoProfile -Command pwd && echo. && echo Comandos:'; foreach ($command in @($project.commands)) { $commandLine += ' && echo Executando: ' + $command + ' && ' + $command }; $commandLine += ' || (echo. && echo ERRO: comando interrompido. && echo O terminal sera encerrado em 10 segundos. && timeout /t 10 /nobreak >nul && exit /b 1)'; Start-Process cmd.exe -ArgumentList @('/k', $commandLine) } }"

endlocal
