# Replace-InstalledPrinter
If a printer on your print server gets renamed, users will need to replace their old printer installation with the new one in order to use it.

Replacing the installed printers for each user machine remotely is possible but messy. It's much easier to add this script to your signin.bat file with a line like "powershell -ExecutionPolicy Bypass -File \\path\to\Replace-InstalledPrinter.ps1" (or have each person manually run the file another way).
