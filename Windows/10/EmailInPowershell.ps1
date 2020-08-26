$EmailFrom = "You should change this value to the correct value(email from)" 
$EmailTo = "You should change this value to the correct value(email to)"
$Subject = "You should change this value to the correct value(email subject)"
$Body = "You should change this value to the correct value(email body)"
$SMTPServer = "You should change this value to the correct value(email server, e.g., for google is smtp.gmail.com)"
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("You should change this value to the correct value(email account)", "You should change this value to the correct value(email password)");
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
