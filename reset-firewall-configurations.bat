rem resets windows firewall configurations (useful for update problems)
rem run as administrator

@ECHO OFF

netsh int ip reset ipreset.txt 
netsh winsock reset
netsh firewall reset 
netsh firewall set icmpsetting 8 
netsh firewall set service FILEANDPRINT ENABLE SUBNET 
