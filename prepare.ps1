#!/usr/bin/env pwsh
apt-ftparchive --arch arm64 packages pool > dists/stable/main/binary-arm64/Packages
gzip -9 -k -f dists/stable/main/binary-arm64/Packages
apt-ftparchive --arch armhf packages pool > dists/stable/main/binary-armhf/Packages
gzip -9 -k -f dists/stable/main/binary-armhf/Packages

$version = [System.DateTime]::Now.ToString("yyyy.MM.dd.hh.mm");

$content = "Origin: Sannel Software, L.L.C.
Label: sannel
Suite: stable
Codename: stable
Version: 1.0
Architectures: arm64 armhf
Components: main
Description: Apt repo for Sannel Software Projects";
Set-Content ./dists/stable/Release -Value $content
apt-ftparchive release . >> ./dists/stable/Release