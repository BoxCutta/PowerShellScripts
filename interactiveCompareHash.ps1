# Prompt the user for the file path and hash value
$FilePath = Read-Host "Enter the path to the file"
$HashValue = Read-Host "Enter the expected hash value"
#Remove quotes from copy as path
$FilePath = $FilePath.replace('"','')
# Calculate the SHA256 hash of the file
$HashAlgorithm = [System.Security.Cryptography.SHA256]::Create()
$FileStream = [System.IO.File]::OpenRead($FilePath)
$FileHash = [System.BitConverter]::ToString($HashAlgorithm.ComputeHash($FileStream)).Replace("-", "")
$FileStream.Close()

# Compare the calculated hash to the provided hash value
if ($FileHash -eq $HashValue) {
    Write-Host "The file hash matches the expected hash value." -ForegroundColor Green
} else {
    Write-Host "The file hash does *NOT* match the expected hash value." -ForegroundColor Red
}
