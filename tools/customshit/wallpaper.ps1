$imageFolderPath = ".\assets\images"

Write-Output "Resolved path to images folder: $(Resolve-Path $imageFolderPath)"

$bgImages = Get-ChildItem -Path $imageFolderPath -Filter "bg*" -File

if ($bgImages.Count -gt 0) {
    $randomBgImage = $bgImages | Get-Random
    $wallpaperPath = $randomBgImage.FullName
} else {
    $anyImage = Get-ChildItem -Path $imageFolderPath -File | Get-Random
    $wallpaperPath = $anyImage.FullName
}

SystemParametersInfo(20, 0, $wallpaperPath, 3)
