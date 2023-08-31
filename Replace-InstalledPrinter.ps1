$OldPrinter = "\\printserver\Old-Printer-Name"
$NewPrinter = "\\printserver\New-Printer-Name"
$PrinterActions = New-Object -ComObject WScript.Network

if (Get-Printer $OldPrinter -ErrorAction SilentlyContinue) { # If old printer is installed
	$PrinterActions.AddWindowsPrinterConnection($NewPrinter) # Add new
	if (Get-Printer $NewPrinter -ErrorAction SilentlyContinue) { # If new added successfully
		if ((Get-CimInstance win32_printer | Where-Object Default -eq $True).Name -eq $OldPrinter) {
			$PrinterActions.SetDefaultPrinter($NewPrinter) # If old was default, set new as default
		} 
		$PrinterActions.RemovePrinterConnection($OldPrinter) # Remove old
	}
}
