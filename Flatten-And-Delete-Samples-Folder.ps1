# Used when I processed a directory that looks like:
#
# ```
# Sample Pack/
#   |- Sound 1/
#   |  `- Samples/
#   |     |- Crash.wav
#   |     `- Splash.wav
#   `- Sound 2/...
# ```
#
# This script flattens the files in `Samples` and kills off `Samples`.
#
# ```
# Sample Pack/
#   |- Sound 1/
#   |  |- Crash.wav
#   |  `- Splash.wav
#   `- Sound 2/...
# ```

Get-ChildItem -Name | ForEach-Object {
	$BaseDir = "$_"
	$SamplesDir = "$BaseDir\Samples"
	Get-ChildItem -Path "$SamplesDir" | ForEach-Object {
		Move-Item -Path "$SamplesDir\$_" -Destination "$BaseDir\$_"
	}
	Remove-Item "$SamplesDir"
}
