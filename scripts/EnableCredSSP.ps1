Enable-WSManCredSSP -Role Server -Force
Set-Item -Path "WSMan:\localhost\Service\Auth\CredSSP" -Value $true
