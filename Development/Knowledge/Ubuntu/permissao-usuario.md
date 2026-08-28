## Permissoes-usuario Ubuntu

```bash
# Verifica usuario atual
whoami

# $ fernando

# Conceder permissao de sudo
sudo usermod -aG sudo fernando

# Ou
sudo usermod -aG sudo $(whoami)

```


## Usando wsl

```bash
# Verifica usuario atual
whoami

# $ fernando

# Conceder permissao de sudo
sudo usermod -aG sudo fernando

# Ou
sudo usermod -aG sudo $(whoami)

# Reiniciar wsl 
wsl --shutdown

# Verificar groupo
groups

```

## Conceder permissao para usuario em repositorio e seus descendentes

```bash
#Verifica usuario
whoami

#concede permissao  onde 
#sudo chown -R <usuario>:<grupo> /home/fernando/repositorios
sudo chown -R fernando:fernando  /home/fernando/repositorios
sudo chmod -R u+rwX /home/fernando/repositorios
```
