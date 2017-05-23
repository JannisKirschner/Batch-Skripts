rem A script to create a support folder in C and copy everything from the network drive to the local folder 

mkdir "C:\\Support"
net use Z: "\\*srv-ip*\*folder*"
ROBOCOPY "Z:\\" "C:\\Support" /mir
net use Z: /delete
