# Processes files for use with the Polyend Tracker.
#
# This transforms the wav files to 44.1kHz and makes the file mono and places
# the new files to an "exports" directory.
#
# Requires SOX to be installed.

Get-ChildItem -Recurse -Filter "*.wav" -Name | ForEach-Object {
	$Output = "export\$_"
	$Dir = Split-Path $Output
	New-Item -ItemType Directory -Force -Path "$Dir" | Out-Null
	sox "$_" -b 16 "export\$_" rate 44100 remix 1,2
}
