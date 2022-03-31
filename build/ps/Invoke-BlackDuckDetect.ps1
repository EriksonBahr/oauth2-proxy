param(
    $ProjectName = "SA_edifoundation-oauth2proxy",
    $ProjectVersionName = "1.0",
    $SourcePath,
    $BlackduckUrl = "https://blackduck.philips.com/",
    $ApiToken = "OWFkOWM0NGMtM2FlMy00ODFiLThjMTctM2I1OTdkMTY2MTQ2OmNlMGI4NmNhLWRjMzAtNGU0Yy04NTIwLWEzZDI5NDFlNjdkMg==",
    $ProxyHost = "apac.zscaler.philips.com",
    $ProxyPort = "10015",
    $REGISTRY = "docker.na1.hsdp.io",
    $ProxyIgnoreHosts = "blackduck.philips.com",
    $DockerImageName = "$REGISTRY/edi-foundation-oauth2-proxy:latest"

    )

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$detectScriptUrl = "https://detect.synopsys.com/detect.ps1"
$detectScriptLocal = "$PSScriptRoot\detect.ps1"
    
Invoke-WebRequest -Uri $detectScriptUrl -Method Get -OutFile $detectScriptLocal

Import-Module $detectScriptLocal 
Detect --detect.project.name=$ProjectName --detect.project.version.name=$ProjectVersionName --detect.tools=DOCKER --detect.docker.image=$DockerImageName --detect.source.path=$SourcePath --blackduck.url=$BlackduckUrl --blackduck.trust.cert=true --blackduck.api.token=$ApiToken --blackduck.proxy.host=$ProxyHost --blackduck.proxy.port=$ProxyPort --blackduck.proxy.ignored.hosts=$ProxyIgnoreHosts --detect.blackduck.signature.scanner.individual.file.matching=ALL --detect.detector.search.depth=6