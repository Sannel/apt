#!/usr/bin/env pwsh
apt-ftparchive --arch arm64 packages pool > dists/stable/main/binary-arm64/Packages
gzip -9 -k -f dists/stable/main/binary-arm64/Packages

$version = [System.DateTime]::Now.ToString("yyyy.MM.dd.hh.mm");

$content = "Origin: Sannel Software, L.L.C.
Label: sannel
Suite: stable
Codename: stable
Version: $version
Architectures: arm64
Components: main
Description: Apt repo for Sannel Software Projects
";
Set-Content ./dists/stable/Release -Value $content
apt-ftparchive release . >> ./dists/stable/Release