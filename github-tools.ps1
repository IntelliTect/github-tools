param ($GitHubAuthToken = $ghtoken, $UserName = "philspokas")

# $base64token = [System.Convert]::ToBase64String([char[]]$GitHubAuthToken)

$global:headers = @{
    'Authorization' = 'token {0}' -f $ghtoken
    'Accept' = 'application/vnd.github.inertia-preview+json'
    'User-Agent' = $UserName
    'Content-Type' = 'text/plain'
}

Write-Debug -Message "headers: $headers"

$uriPrefix =  "https://api.github.com/repos/HMACDEV/CoeurOX/"

function Get-GHProjects() {
    # $uri = "https://api.github.com/users/$UserAgent/projects"
    $uri = "https://api.github.com/repos/HMACDEV/CoeurOX/projects"

    $result = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers
    $result
}

function Get-GHProjectColumns($projectId) {
    $uri = "https://api.github.com/projects/$projectId/columns"

    $result = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers
    $result
}

function Get-GHProjectCards($columnId) {

    $uri = "https://api.github.com/projects/columns/$columnId/cards"
    "uri: $uri"

    $result = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers
    $result
}

function New-GHProjectCard($columnId, $note) {
    $uri  = "https://api.github.com/projects/columns/$columnId/cards"
    "uri: $uri"

    $body = @{
        'note' = $note
    }
    $result = Invoke-RestMethod -Method Post -uri $uri -Headers $headers -Body ($body | ConvertTo-Json)
    return $result
}
function Get-GHRepoIssues($owner, $repo, $state="all") {
    $result = @()
    $r = @()
    $page = 0

    do {
        $uri  = "https://api.github.com/repos/$owner/$repo/issues?per_page=100&state=$state&page=$page"
        $r = Invoke-RestMethod -Method Get -uri $uri -Headers $headers 
        $page++
        $result += $r
    } while ($r.Count -gt 0)

    return $result
}

#Get-GHProjects
$projectId = 12359854
# itl ent sample: 5942958
#Get-GHProjectColumns 12359854

$columnId = 14106634
# Get-GHProjectCards $columnId

# New-GHProjectCard -columnId $columnId -note "sample note 2"

$owner = "HMACDEV"
$repo = "CoeurOX"

$issues  = Get-GHRepoIssues -owner $owner -repo $repo
