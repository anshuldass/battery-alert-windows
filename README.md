# 🔋 Battery Alert for Windows

A lightweight PowerShell script that helps you maintain battery health by notifying you when your laptop battery reaches **80% while charging**. Built using the [BurntToast](https://github.com/Windos/BurntToast) module for modern Windows toast notifications.

---

## ✨ Features
- ✅ Windows 10/11 compatible  
- ✅ Native toast notifications (BurntToast)  
- ✅ Runs silently at login via Task Scheduler  
- ✅ Reminds every 5 minutes while charging past 80%  
- ✅ Easy to customize threshold (default = 80%)  

---

## 📜 Script

[`BatteryAlert.ps1`](./BatteryAlert.ps1):

```powershell
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
```
⚡ Quick Start

1. Install BurntToast (one-time):
Install-Module -Name BurntToast -Scope CurrentUser -Force

2. Save the script somewhere stable, e.g.:
   C:\Users\<you>\Documents\BatteryAlert.ps1

3. Test manually:
   powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Users\<you>\Documents\BatteryAlert.ps1"
    (For a quick test, you can temporarily change -ge 80 to -ge 1.)

🚀 Run at Startup (Task Scheduler)

1. Open Task Scheduler → Create Task…

    General tab:

    Name: Battery Alert

    Check: Run only when user is logged on

    Check: Run with highest privileges

2. Triggers tab:

    New → Begin the task: At log on

3. Actions tab:

    New → Action: Start a program

    Program/script: powershell.exe

    Add arguments:
   -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\Users\<you>\Documents\BatteryAlert.ps1"

5. Save → Right-click the task → Run (to test).

🖼️ Preview


When charging past 80%, you’ll see a toast notification like this:

Battery Alert
Battery is at 80%. Please disconnect the charger!

📄 License

This project is licensed under the MIT License.

🙌 Acknowledgements

BurntToast
 for PowerShell toast notifications

Windows Task Scheduler for automation
