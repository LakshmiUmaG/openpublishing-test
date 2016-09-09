echo "Loading script plugin generateYamlFromSourceCode successfully!"

# Prepare
$packageName = "docfx.console"
$packageRootFolder = $ParameterDictionary.environment.packages[$packageName].packageRootFolder
$docfxToolFolder = Join-Path $packageRootFolder "tools"
$docfxExe = Join-Path $docfxToolFolder "docfx.exe"
$docfxConfigFile = $ParameterDictionary.docset.docfxConfigFile

# Execute docfx.exe to generate yaml files from source code
echo "Executing $docfxExe metadata $docfxConfigFile"
& "$docfxExe" metadata "$docfxConfigFile"
if ($LASTEXITCODE -ne 0)
{
    Logging -message "Error generating metadata from source code to yaml in docset $ParameterDictionary.docset.docsetInfo.docset_name"
}
