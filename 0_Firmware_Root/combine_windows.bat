@echo off

:: Directory where the backup files are located
set "backup_dir=."

:: Output file
set "output_file=%backup_dir%\fw_backup_full_combined.bin"

:: Start with a fresh output file
echo. > "%output_file%"

:: Concatenate the files
for /L %%i in (0,1,31) do (
    set "part=%backup_dir%\fw_backup_%%i.bin"
    if not exist "!part!" goto done
    type "!part!" >> "%output_file%"
)

:done
echo All files have been concatenated into %output_file%
pause
