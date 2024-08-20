#Install the Japanese language pack
Install-Language ja-JP -CopyToSettings

#Change the system preferred UI language to Japanese
Set-systemPreferredUILanguage ja-JP

#Set the system UI language to Japanese
Set-WinUILanguageOverride -Language ja-JP

#Set the system locale to Japanese
Set-WinCultureFromLanguageListOptOut -OptOut $False

#Change the time zone to Tokyo
Set-TimeZone -id "Tokyo Standard Time"

#Set the home location to Japan
Set-WinHomeLocation -GeoId 0x7A

#Set the system locale to Japanese
Set-WinSystemLocale -SystemLocale ja-JP

#Set the user locale to Japanese
Set-WinUserLanguageList -LanguageList ja-JP, en-US -Force

#Set the input method to Japanese
Set-WinDefaultInputMethodOverride -InputTip "0411:00000411"

#Copy the welcome screen and new user settings
Copy-UserInternationalSettingsToSystem -welcomescreen $true -newuser $true

#Restart the computer
Restart-Computer 
