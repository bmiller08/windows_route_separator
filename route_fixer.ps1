$domain = 'example.com'
$gateway = '192.168.0.1'

foreach($line in [system.net.dns]::resolve($domain).AddressList.IPAddressToString)
{
route PRINT | find " $line" > $null
 if (-NOT $LASTEXITCODE -eq 0)
 {
 route ADD $line $gateway METRIC 34
 }
}
