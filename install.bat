cd \
https://swupdate.openvpn.org/community/releases/openvpn-install-2.4.6-I602.exe

cd \
cd "C:\Program Files\OpenVPN\easy-rsa"
init-config.bat

cd "C:\Program Files\OpenVPN\easy-rsa"
vars.bat
clean-all.bat

build-ca.bat

build-key-server.bat server
build-dh.bat

ca.crt
dh2048.pem
server.crt
server.key

copy "C:\Program Files\OpenVPN\easy-rsa\keys\ca.crt" "C:\Program Files\OpenVPN\config"
copy "C:\Program Files\OpenVPN\easy-rsa\keys\dh2048.pem" "C:\Program Files\OpenVPN\config"
copy "C:\Program Files\OpenVPN\easy-rsa\keys\server.crt" "C:\Program Files\OpenVPN\config"
copy "C:\Program Files\OpenVPN\easy-rsa\keys\server.key" "C:\Program Files\OpenVPN\config"

copy "C:\Program Files\OpenVPN\sample-config\server.ovpn" "C:\Program Files\OpenVPN\config"
copy "C:\Program Files\OpenVPN\sample-config\client.ovpn" "C:\Program Files\OpenVPN\config"

notepad "C:\Program Files\OpenVPN\config\server.ovpn"
"C:\Program Files (x86)\Notepad++\notepad++.exe" "C:\Program Files\OpenVPN\config\server.ovpn"

ca "C:\\Program Files\\OpenVPN\\config\\ca.crt"
cert "C:\\Program Files\\OpenVPN\\config\\server.crt"
key "C:\\Program Files\\OpenVPN\\config\\server.key" # This file should be kept secret

dh "C:\\Program Files\\OpenVPN\\config\\dh2048.pem"

#tls-auth ta.key

notepad "C:\Program Files\OpenVPN\config\client.ovpn"
"C:\Program Files (x86)\Notepad++\notepad++.exe" "C:\Program Files\OpenVPN\config\client.ovpn"

remote my-server-1 1194
remote vpn.mydomain.com 1194

ca "C:\\Program Files\\OpenVPN\\config\\ca.crt"
cert "C:\\Program Files\\OpenVPN\\config\\server.crt"
key "C:\\Program Files\\OpenVPN\\config\\server.key"

#tls-auth ta.key

"C:\Program Files\OpenVPN\bin\openvpn-gui.exe"
