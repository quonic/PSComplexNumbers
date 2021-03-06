function Show-ComplexNumber { 
    <#
    .SYNOPSIS
        Display a Complex Number Object

    .DESCRIPTION
        Takes a Numerics.Complex Object and converts it into a human readable string.
        Common complex number syntax in either cartesian or polar formatting.

    .PARAMETER InputObject
        The object to convert.

    .PARAMETER Polar
        To display in polar format.
    
    .INPUTS
        a System.Numerics.Complex object
     
    .OUTPUTS
        Returns a string

    .EXAMPLE
        PS> $m = New-ComplexNumber -Real 2 -Imaginary -3
        PS> Show-ComplexNumber $a
        2-3i        
        
    .EXAMPLE
        PS> $a = New-ComplexNumber -Real 2 -Imaginary -3
        PS> Show-ComplexNumber -Polar $a
        3.61 ∟ -0.983
        
    .EXAMPLE
        PS> $m,$n | Show-ComplexNumber
        2-3i
        4+2i
        
        Description
        -----------
        Show-ComplexNumber can accept System.Numerics.Complex Objects from the pipeline. 
        
    .LINK
        New-ComplexNumber
    
    .LINK
        Invoke-ComplexMath
    
    .NOTES
        Requires PowerShell 2.0
        Requires the System.Numerics.dll
        
        For displaying the polar form, the Unicode character for angle will auto-select depending on which Host is being used.
    #> 
    
    [CmdletBinding()]
    [OutputType([String])]
    
    param (
        [Parameter(Position=0,
                   Mandatory=1,
                   ValueFromPipeline=1)]
        [System.Numerics.Complex] $InputObject,
        
        [Switch] $Polar
    )
    
    begin { <# Empty #> }
    
    process {
        
        if ($Polar) {
	    '{0:g3} {1} {2:g3}' -f $InputObject.Magnitude, $angle, $InputObject.Phase;
	}
        elseif (0 -ge $InputObject.Imaginary) {
            '{0}{1}i' -f $InputObject.Real, $InputObject.Imaginary;
	}  
        else {
            '{0}+{1}i' -f $InputObject.Real, $InputObject.Imaginary;
	}  
    }
}# __func

# __END__
 
