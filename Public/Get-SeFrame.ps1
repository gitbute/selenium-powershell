function Get-SeFrame {
    [cmdletbinding()]
    param(
        [OpenQA.Selenium.IWebDriver]$Driver
    )

    Init-SeDriver -Driver ([ref]$Driver) -ErrorAction Stop
    
    Get-SeElement -By TagName -Value iframe -Attributes name, id | ForEach-Object {
        $_.Psobject.TypeNames.Insert(0, 'SeFrame')
        $_
    }

}

