#Configuração de Ambiente Apontador

##Dependência
```
sudo apt-get install -y puppet git git-doc make
```

##Configuração
```
rm -rf /etc/puppet
git clone git://github.com/apontador/my-puppet.git /etc/puppet
cd /etc/puppet
make install
```

##Instalação PHP
```
make apply
```
