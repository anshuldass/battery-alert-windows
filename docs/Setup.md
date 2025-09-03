
## Battery Alert

A simple PowerShell script that monitors your laptop battery and sends Windows toast notifications using BurntToast when:
 
 - Battery is low
   
 - Battery is fully charged

This helps prevent overcharging and ensures you don’t run out of battery unexpectedly.

## Features

 - Customizable charge thresholds
   
 - Continuous battery monitoring
      
 - Toast notifications via BurntToast
          
 - Optional auto-start on Windows login

## Prerequisites

 - Windows 10 or later
 - PowerShell 5.1+
 - Administrator privileges (for installing modules)

## Setup

 1. Install BurntToast
 - Open PowerShell as Administrator:

	

> Install-Module -Name BurntToast -Force

If prompted to install from an untrusted repository, type Y and press Enter.

2.  Clone Repository git clone  [https://github.com/anshuldass/battery-alert-windows.git](https://github.com/anshuldass/battery-alert-windows.git)  
		

> cd releases

    
4.  Run Script .\battery-alert.ps1
    

The script will monitor battery status continuously and show notifications based on the defined thresholds.

4.  Customize Alerts

You can edit the following variables in battery-alert.ps1:

> $highChargeThreshold = 80 # Notify when battery is at 80% while
> 
> charging $lowChargeThreshold = 20 # Notify when battery is at 20%
> 
> while discharging $checkInterval = 60 # Check interval in seconds

5.  Optional: Run on Startup

Press Win + R → type

>  shell:startup → Enter

Place a shortcut to battery-alert.ps1 in the Startup folder

## Troubleshooting

 - Notifications not showing
	  Ensure BurntToast is installed and Windows notifications are enabled.
  
 - Script not running
	 Check PowerShell execution policy:

> Get-ExecutionPolicy Set-ExecutionPolicy RemoteSigned -Scope
> CurrentUser

 - Battery info not detected
	Ensure your system reports battery status correctly.

## License

MIT License © [anshuldass]
