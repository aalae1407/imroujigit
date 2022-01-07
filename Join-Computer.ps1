$NewName = "WS$(Get-wmiobject win32_bios).SerialNumber"
Write-Output "The new computername will be $NewName"