param (
    [string]$defaultWorkingDirectory
)

# Set environment variables
#Set-PSDebug -Trace 2;

$environmentName = "$env:ENVIRONMENT_NAME";
$numberOfConcurrentUsers = "$env:NUMBER_OF_USERS";
$rampUp = "$env:RAMP_UP_TIME";
$loadTestRuntime = "$env:LOAD_TEST_RUN_TIME";
$scenarioFileName = "$env:SCENARIO_FILE_NAME";

$files = Get-ChildItem -Recurse -Path "$defaultWorkingDirectory";

foreach ($file in $files) {

    # Check if the file is the one we're looking for
    if ($file.Name -eq $scenarioFileName) {

        $env:SCENARIO_FILE_PATH = $file.FullName;
        Write-Host "$file.FullName";
        break;
    }
}

Exit 1;