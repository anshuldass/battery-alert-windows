Import-Module BurntToast
Add-Type -AssemblyName System.Windows.Forms

while ($true) {
    $power = [System.Windows.Forms.SystemInformation]::PowerStatus
    $charge = [math]::Round($power.BatteryLifePercent * 100)
    $status = $power.PowerLineStatus  # "Online" means charging

    if ($status -eq "Online" -and $charge -ge 80) {
        New-BurntToastNotification -Text "Battery Alert", "Battery is at $charge%. Please disconnect the charger!"
        Start-Sleep -Seconds 300  # remind every 5 minutes
    }

    Start-Sleep -Seconds 60  # check every 1 minute
}
