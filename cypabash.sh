#Updates system
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

#Installs ClamTK if user allows
read -p "Install ClamTk? y/n" ynclam
	
	#if y then install
if [ "$ynclam" = 'y' ]
	then
	
	sudo apt-get install clamtk
	echo 'Done clamTK!'

	#if anything else then do nothing
else

	echo 'No clamTK'

fi

#Enables ufw firewall

sudo apt-get install ufw
sudo ufw enable
sudo ufw status

#Secures shadow file

sudo chmod 640 /etc/shadow

#Disable root account

read -p "Disbale Root Accounts? y/n" ynroot

if [ "$ynroot" = 'y' ]
	then
	
	sudo passwd -I root
	echo 'Disbale Root Account!'

else

	echo 'No Root Disbale'
	
fi

#Remove Apache

read -p "Delete Apache? y/n" ynapache

if [ "$ynapache" = 'y' ]
	then

	sudo apt remove apache2
	sudo apt remove apache2
	echo 'Apache Removed!'

else

	echo 'Apache Remains'
	
fi

#Removes bad programs

echo 'Purging'

sudo apt remove john hydra nginx samba bind9 tftpd x11vnc tightvncserver snmp nfs-kernel-server sendmail postfix xinetd

sudo apt purge john hydra nginx samba bind9 tftpd x11vnc tightvncserver snmp nfs-kernel-server sendmail postfix xinetd

#Removes vsftpd or in future configs it

read -p "Delete = y or Config = n" ynvsftpd

if [ "$ynvsftpd" = 'y' ]
	then

	sudo apt remove vsftpd
	sudo apt remove vsftpd
	echo 'vsftpd Removed!'

else

	echo 'vsftpd Remains'
	
fi

sudo dpkg -L john hydra nginx samba bind9 vsftpd tftpd x11vnc tightvncserver snmp nfs-kernel-server sendmail postfix xinetd

echo 'Purged'

#Final message
echo 'Done!'
