Set-Location $PSScriptRoot
$passwordFile = Import-Csv -Path .\adventOfCode-03.txt -Delimiter ' ' -Header Range,Letter,Password
$validCount = 0

foreach ($line in $passwordFile) {
    # Get Low and High from the Range
    $separator = $line.Range.IndexOf('-')
    $low = $line.Range.Substring(0,$separator)
    $high = $line.Range.Substring($separator+1)

    # Get the required Character
    $character = $line.Letter.Substring(0)

    # Get the Password
    $password = $line.Password

    $characterCount = $password.Split($character).Length - 1

    if (($characterCount -ge $low) -and ($characterCount -le $high)) {
        Write-Host "Password is Valid." -ForegroundColor Green
        $validCount++
    } else {
        Write-Host "Password is Invalid." -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "The are $($validCount) Valid Passwords."
