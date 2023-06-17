#!/usr/bin/env pwsh
$num = [System.DateTime]::Now.ToString("yyyyMMddhhmm")
$snapName = "sannel-snapshot-$num"
aptly snapshot create $snapName from repo sannel-repository
aptly publish switch sannel $snapName
cp -rvf ~/.aptly/public .