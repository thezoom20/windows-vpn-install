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
dh1024.pem
server.crt
server.key

copy C:\Program Files\OpenVPN\easy-rsa\keys\ca.crt C:\Program Files\OpenVPN\config
copy C:\Program Files\OpenVPN\easy-rsa\keys\dh1024.pem C:\Program Files\OpenVPN\config
copy C:\Program Files\OpenVPN\easy-rsa\keys\server.crt C:\Program Files\OpenVPN\config
copy C:\Program Files\OpenVPN\easy-rsa\keys\server.key C:\Program Files\OpenVPN\config

copy "C:\Program Files\OpenVPN\sample-config\server.ovpn" "C:\Program Files\OpenVPN\config"
copy "C:\Program Files\OpenVPN\sample-config\client.ovpn" "C:\Program Files\OpenVPN\config"

notepad "C:\Program Files\OpenVPN\config\server.ovpn"
