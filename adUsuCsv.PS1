#Script para adicionar usuários no domínio smd.local e ingressá-los na OU OU_alunos, a partir de um arquivo CSV

Import-Module ActiveDirectory

Import-CSV C:\Users\emanoel\alunos_smd_test.csv | ForEach-Object { New-ADUser -Name $_.FullName -SamAccountName $_.UserName -AccountPassword (ConvertTo-SecureString $_.Senha -AsPlainText -Force) -Path 'OU=OU_Alunos,DC=SMD,DC=local' -SurName $_.SurName -UserPrincipalName $_.UserPrincipalName -ChangePasswordAtLogon $true -Enabled $true }

