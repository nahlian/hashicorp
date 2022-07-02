Import-Module -Name posh-git

Set-PsReadLineOption -PredictionSource history
helm completion powershell | Out-String | Invoke-Expression
kubectl completion powershell | Out-String | Invoke-Expression
oh-my-posh init pwsh --config ~/.poshthemes/standard.omp.json | Invoke-Expression