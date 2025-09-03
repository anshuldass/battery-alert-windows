# 🔋 Battery Alert for Windows

[](https://github.com/anshuldass/battery-alert-windows/tree/main#-battery-alert-for-windows)

A lightweight PowerShell script that helps you maintain battery health by notifying you when your laptop battery reaches  **80% while charging**. Built using the  [BurntToast](https://github.com/Windos/BurntToast)  module for modern Windows toast notifications.

----------

## ✨ Features

[](https://github.com/anshuldass/battery-alert-windows/tree/main#-features)

-   ✅ Windows 10/11 compatible
-   ✅ Native toast notifications (BurntToast)
-   ✅ Runs silently at login via Task Scheduler
-   ✅ Reminds every 5 minutes while charging past 80%
-   ✅ Easy to customize threshold (default = 80%)

----------

## 📜 Script

[](https://github.com/anshuldass/battery-alert-windows/tree/main#-script)

[`BatteryAlert.ps1`](https://github.com/anshuldass/battery-alert-windows/blob/main/BatteryAlert.ps1):

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

## ⚡ Quick Start

1.  Install BurntToast (one-time): Install-Module -Name BurntToast -Scope CurrentUser -Force
    
2.  Save the script somewhere stable, e.g.: C:\Users<you>\Documents\BatteryAlert.ps1
    
3.  Test manually: powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Users<you>\Documents\BatteryAlert.ps1" (For a quick test, you can temporarily change -ge 80 to -ge 1.)
    

## 🚀 Run at Startup (Task Scheduler)

1.  Open Task Scheduler → Create Task…
    
    General tab:
    
    Name: Battery Alert
    
    Check: Run only when user is logged on
    
    Check: Run with highest privileges
    
2.  Triggers tab:
    
    New → Begin the task: At log on
    
3.  Actions tab:
    
    New → Action: Start a program
    
    Program/script: powershell.exe
    
    Add arguments: -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\Users<you>\Documents\BatteryAlert.ps1"
    
4.  Save → Right-click the task → Run (to test).
    

## 🖼️ Preview

When charging past 80%, you’ll see a toast notification like this:

Battery Alert Battery is at 80%. Please disconnect the charger!

## 📄 License

This project is licensed under the MIT License.

## 🙌 Acknowledgements

BurntToast for PowerShell toast notifications

Windows Task Scheduler for automation

## About

PowerShell script that shows a Windows toast when battery hits 80% while charging.

[sqledge3.wordpress.com/](https://sqledge3.wordpress.com/ "https://sqledge3.wordpress.com/")

### Topics

[windows](https://github.com/topics/windows "Topic: windows")  [automation](https://github.com/topics/automation "Topic: automation")  [battery](https://github.com/topics/battery "Topic: battery")  [powershell](https://github.com/topics/powershell "Topic: powershell")  [task-scheduler](https://github.com/topics/task-scheduler "Topic: task-scheduler")

### Resources

[Readme](https://github.com/anshuldass/battery-alert-windows/tree/main#readme-ov-file)

### License

[MIT license](https://github.com/anshuldass/battery-alert-windows/tree/main#MIT-1-ov-file)

[Activity](https://github.com/anshuldass/battery-alert-windows/activity)

### Stars

[**0**  stars](https://github.com/anshuldass/battery-alert-windows/stargazers)

### Watchers

[**0**  watching](https://github.com/anshuldass/battery-alert-windows/watchers)

### Forks

[**0**  forks](https://github.com/anshuldass/battery-alert-windows/forks)

## [Releases  1](https://github.com/anshuldass/battery-alert-windows/releases)

[](https://github.com/anshuldass/battery-alert-windows/releases/tag/v1.0.0)

Battery Alert v1.0.0Latest

1 hour ago

## [Packages](https://github.com/users/anshuldass/packages?repo_name=battery-alert-windows)

No packages published  
[Publish your first package](https://github.com/anshuldass/battery-alert-windows/packages)

## Languages

-   [PowerShell100.0%](https://github.com/anshuldass/battery-alert-windows/search?l=powershell)

## Footer

[](https://github.com/)© 2025 GitHub, Inc.

### Footer navigation

-   [Terms](https://docs.github.com/site-policy/github-terms/github-terms-of-service)
-   [Privacy](https://docs.github.com/site-policy/privacy-policies/github-privacy-statement)
-   [Securit](https://github.com/security)
