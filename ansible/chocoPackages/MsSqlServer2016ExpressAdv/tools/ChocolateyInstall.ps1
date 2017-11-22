$packageName = "MsSqlServer2016ExpressAdv"
$chocolateyTempDir = Join-Path (Get-Item $env:TEMP).FullName "chocolatey"
$tempDir = Join-Path $chocolateyTempDir $packageName
$fileFullPath = "$tempDir\SQLEXPR.exe"
$extractPath = "$tempDir\SQLEXPR"
$setupPath = "$extractPath\setup.exe"
$silentArgs = "/IACCEPTSQLSERVERLICENSETERMS /Q /ACTION=install /INSTANCEID=SQLEXPRESS /INSTANCENAME=SQLEXPRESS /UPDATEENABLED=FALSE"
# SQL Server 2016 is 64-bit only
$url = ""
$url64 = "https://download.microsoft.com/download/9/0/7/907AD35F-9F9C-43A5-9789-52470555DB90/ENU/SQLEXPRADV_x64_ENU.exe"
$checksum = ''
$checksum64 = '704333D0F6A01EFFEDA166F73C61E28B442405D211F85B9804014C627C41E4E0'

# Using the same download location as Install-ChocolateyPackage but need to create the directory first
if (![System.IO.Directory]::Exists($tempDir)) { [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null }
Get-ChocolateyWebFile $packageName $fileFullPath $url $url64 -Checksum $checksum -Checksum64 $checksum64 -ChecksumType "sha256"

Write-Host "Extracting..."
Start-Process "$fileFullPath" "/Q /x:`"$extractPath`"" -Wait

Write-Host "Installing..."
Install-ChocolateyInstallPackage "$packageName" "EXE" "$silentArgs" "$setupPath" -validExitCodes @(0, 3010)

Write-Host "Removing extracted files..."
rm -r "$extractPath"
