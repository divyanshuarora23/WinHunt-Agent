# provision_win_iis.ps1
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "[+] Installing IIS..."
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

$sitePath = "C:\inetpub\wwwroot"

# Vulnerable page
$indexHtml = @'
<html>
  <body>
    <h1>WinHunt Demo App (IIS)</h1>
    <form method="get">
      <label>Name: <input name="name"></label>
      <input type="submit" value="Submit">
    </form>
    <script>
      const params = new URLSearchParams(location.search);
      const name = params.get("name") || "";
      if (name) {
        document.write("<div style='color:red'>Reflected: " + name + "</div>");
      }
    </script>
  </body>
</html>
'@

Set-Content -Path "$sitePath\index.html" -Value $indexHtml -Encoding UTF8
Write-Host "[+] IIS vulnerable demo page created."
