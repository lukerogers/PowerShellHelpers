function Get-EnvironmentVariables {
    Get-ChildItem env:* | sort-object name
}

Export-ModuleMember -Function Get-EnvironmentVariables