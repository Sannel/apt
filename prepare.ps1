#!/usr/bin/env pwsh
dpkg-scanpackages --multiversion --arch arm64 pool/ > dists/stable/main/binary-arm64/Packages
gzip -9 dists/stable/main/binary-arm64/Packages

Set-Location dists/stable
../../generate-release.sh > Release
Set-Location ../..