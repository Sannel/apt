#!/usr/bin/env pwsh
dpkg-scanpackages --arch arm64 pool/ > dists/stable/main/binary-arm64/Packages
gzip -9 -f dists/stable/main/binary-arm64/Packages

Set-Location dists/stable
../../generate-release.sh > Release
Set-Location ../..