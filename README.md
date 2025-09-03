# 🔋 Battery Alert (Windows)
Notifies you when your laptop battery reaches **80% while charging** to help extend battery health. Pure PowerShell, no extra apps.

## Features
- Windows 10/11 compatible
- Native Windows toast notifications
- Runs hidden at login via Task Scheduler
- Easy to change threshold (80 → your choice)

## Quick Start
```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File ".\BatteryAlert.ps1"
