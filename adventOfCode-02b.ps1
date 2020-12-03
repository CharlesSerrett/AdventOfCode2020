Set-Location $PSScriptRoot
$passwordFile = Import-Csv -Path .\adventOfCode-03.txt -Delimiter ' ' -Header Range,Letter,Password
$validCount = 0

foreach ($line in $passwordFile) {
    # Get the first and second position(no zero index)
    $separator = $line.Range.IndexOf('-')
    $pos1 = $line.Range.Substring(0,$separator)
    $pos2 = $line.Range.Substring($separator+1)
    # Get the required Character
    $character = $line.Letter.Substring(0,1)

    # Get the Password
    $password = $line.Password

    $char1 = $password.SubString($pos1-1,1)
    $char2 = $password.Substring($pos2-1,1)

    if (($character -eq $char1) -and ($character -eq $char2)) {
        Write-Host "Password is Invalid." -ForegroundColor Red
    } elseif (($character -eq $char1) -or ($character -eq $char2)) {
        Write-Host "Password is Valid." -ForegroundColor Green
        $validCount++
    } else {
        Write-Host "Password is Invalid." -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "The are $($validCount) Valid Passwords."
