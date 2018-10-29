$Package = "jrbeverly.dev.core"

try {
    $Boxstarter.RebootOk=$true
    $Boxstarter.NoPassword=$false
    $Boxstarter.AutoLogin=$true

    Enable-RemoteDesktop

    Disable-InternetExplorerESC
    Disable-UAC

    Update-ExecutionPolicy Unrestricted
    Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -EnableShowFullPathInTitleBar
    Set-TaskbarOptions -Size Small -Lock -Dock Bottom
    if (Test-PendingReboot) { Invoke-Reboot }

    Install-WindowsUpdate -AcceptEula
    if (Test-PendingReboot) { Invoke-Reboot }

    Write-ChocolateySuccess $Package
} catch {
  Write-ChocolateyFailure $Package $($_.Exception.Message)
  throw
}