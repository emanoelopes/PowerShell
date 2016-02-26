##Script para importar usuários a partir de um arquivo csv
##Autor: Emanoel
##Data: 25/02/2016

Import-Module ActiveDirectory 

Import-CSV alunos_smd.csv | 
ForEach-Object {
New-ADUser -Name $_.FullName -SamAccountName $_.UserName -AccountPassword (ConvertTo-SecureString $_.AccountPassword -AsPlainText -Force) -Path 'OU=OU_Alunos,DC=SMD,DC=local' -GivenName $_.GivenName -SurName $_.SurName -DisplayName $_.DisplayName -ChangePasswordAtLogon $true -Enabled $true -Description $_.Description
}
