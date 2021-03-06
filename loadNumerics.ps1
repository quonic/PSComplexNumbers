# We need to do the following because Reflection.Assembly is deprectiated :(
# But, it is used as a final back up

$Success = 'ComplexNumbers -> Assembly successfully loaded!'
$Failure = 'ComplexNumbers -> Assembly failed to load!' 
$NumericsAssembly = @{
    AssemblyName = 'System.Numerics'
    ErrorAction = 'SilentlyContinue'
    PassThru = $True
}

if ($PSVersionTable.PSVersion.Major -lt 5) {
    try { 
        $objAssem = Add-Type @NumericsAssembly 

        Write-Verbose 'ComplexNumbers -> System.Numerics loaded'
    } 
    catch {

        # FIND IT BRUCE BANNER STYLE ! This may take a second
        $FromAssemblyDirectory = @{
            Path = 'C:\Windows\Microsoft.Net\assembly'
            Include = 'System.Numerics.dll'
            Recurse = $True
            Force = $True
        }
        
        Get-ChildItem @FromAssemblyDirectory | 
            Foreach-Object {
            
                try {
            $objAssem = Add-Type -Path "$_" -PassThru

            Write-Verbose "ComplexNumbers -> System.Numerics loaded
                | loaded from: $_"
            }
                catch {
            continue
            }
            }
    }
    finally { 

        if ($objAssem) {
            Write-Verbose $Success
        }
        else {
            
            # Last resort
            [Void] [Reflection.Assembly]::LoadWithPartialName('System.Numerics')
            
            if ($?)
            {  Write-Verbose $Success }
            else
            { Write-Verbose $Failure }
        }
    }
}
# __END__
