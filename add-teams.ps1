
Install-Module -Name PowerShellForGitHub
Set-GitHubAuthentication
get-help Set-GitHubConfiguration -ShowWindow
Get-GitHubIssues -Url 'https://github.com/IntelliTect-Enterprise/sample'
Get-GitHubIssue -Uri 'https://github.com/IntelliTect-Enterprise/sample'
Get-GitHubIssue -Uri 'https://github.com/IntelliTect-Enterprise/sample' | Select IssueNumber, body
Get-GitHubIssue -Uri 'https://github.com/HMACDEV/CoeurOX' | Select IssueNumber, body
Get-GitHubTeam -Uri 'https://github.com/IntelliTect-Enterprise/sample'
Get-GitHubTeam -Uri 'https://github.com/IntelliTect-Enterprise'
Get-GitHubTeam -OrganizationName IntelliTect-Enterprise
Get-GitHubTeam -OrganizationName IntelliTect-Enterprise
New-GitHubTeam -OrganizationName IntelliTect-Enterprise -TeamName ChildTest -Description 'a test child team' -ParentTeamName SampleTeam
Get-GitHubTeam -OrganizationName IntelliTect-Enterprise
Set-GitHubTeam -OrganizationName IntelliTect-Enterprise -TeamName Solve2017Team -ParentTeamName SampleTeam
Set-GitHubTeam -OrganizationName IntelliTect-Enterprise -TeamName Solve2017Team -Privacy Closed
Set-GitHubTeam -OrganizationName IntelliTect-Enterprise -TeamName Solve2017Team -ParentTeamName SampleTeam
