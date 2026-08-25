## Pacotes no Ubuntu/Debian

```bash
# Atualizar a lista de pacotes
sudo apt update

# Atualizar pacotes instalados
sudo apt upgrade

# Instalar um pacote
sudo apt install nome-do-pacote

# Procurar um pacote
apt search termo

# Remover um pacote
sudo apt remove nome-do-pacote

# Limpar dependências não utilizadas
sudo apt autoremove
```

## Usuário e permissões

```bash
# Identificar o usuário atual
whoami

# Mostrar informações do usuário e grupos
id

# Executar um comando como administrador
sudo comando

# Alterar permissões de execução
chmod +x script.sh

# Alterar o proprietário de um arquivo
sudo chown usuario:usuario arquivo.txt
```