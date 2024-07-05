Add-Type -AssemblyName System.Windows.Forms

$main = New-Object System.Windows.Forms.Form
$main.Text = 'AdminPassLAPS'
$main.Size = New-Object System.Drawing.Size(400, 250)
$main.StartPosition = 'CenterScreen'
$main.FormBorderStyle = 'FixedDialog'

$title = New-Object System.Windows.Forms.Label
$title.Location = New-Object System.Drawing.Point(75,80)
$title.Size = New-Object System.Drawing.Size(100,20)
$title.Text = 'Enter PC name:'
$title.Font = [System.Drawing.Font]::new("Microsoft Sans Serif", 10, [System.Drawing.FontStyle]::Bold)
$main.Controls.Add($title)

$TextInput = New-Object System.Windows.Forms.TextBox
$TextInput.Location = New-Object System.Drawing.Point(75,100)
$TextInput.Size = New-Object System.Drawing.Size(250, 50)
$main.Controls.Add($TextInput)

$ok = New-Object System.Windows.Forms.Button
$ok.Location = New-Object System.Drawing.Point(75,135)
$ok.Size = New-Object System.Drawing.Size(250,20)
$ok.Text = 'OK'
$ok.Add_Click({
	$pc = $TextInput.Text
	Write-Host $pc
	$result = Get-LapsADPassword "$pc" -AsPlainText
	Set-Clipboard -Value "$($result.Password)"
	[System.Windows.Forms.MessageBox]::Show("$($result.Password)`nCopy to clipboard!","$x\support",1,48)
})
$main.Controls.Add($ok)
$main.ShowDialog()