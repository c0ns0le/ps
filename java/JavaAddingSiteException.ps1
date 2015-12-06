<#
Adding exception sites for Java
Created By:Sai Gutta
Created On:12/4/2015
Modified On:--/--/--
Changes: ----
#>

$global:OS = (Get-WmiObject -Class Win32_OperatingSystem).caption

$global:pathtoexception = "$env:USERPROFILE\AppData\Locallow\sun\java\Deployment\security\exception.sites"

$global:siteslist = ("https://remote.mmsholdings.com","https://pfizer.sumtotalsystems.com","http://cwprod.pfizer.com")

function compareandadd
{
   $sites = getsites
   if($sites -ne $null)
   {
   foreach ($site in $sites)
   {
         
        if($global:siteslist -Contains $site)
        {
            Write-Host $site
        }
        else
        {
            addsite($site)
        }
   }
   }
   else
   {
    foreach ($site in $global:siteslist)
    {
        addsite($site)
    }
   }

}

function getsites
{
    $sites = Get-Content -Path $global:pathtoexception
    return $sites
}

function addsites($site)
{

    Add-Content -Path $global:pathtoexception -value $site
}
compareandadd