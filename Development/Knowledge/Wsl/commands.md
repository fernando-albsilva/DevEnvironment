## Gerenciamento do WSL no PowerShell ou Prompt de Comando

```powershell
# Listar distribuições instaladas
wsl --list --verbose

# Listar distribuições disponíveis para instalação
wsl --list --online

# Instalar uma distribuição
wsl --install -d Ubuntu

# Abrir a distribuição padrão
wsl

# Abrir uma distribuição específica
wsl -d Ubuntu

# Executar um comando sem abrir uma sessão interativa
wsl -d Ubuntu -- pwd

# Encerrar todas as distribuições em execução
wsl --shutdown

# Atualizar o WSL
wsl --update

# Ver a versão instalada do WSL
wsl --version
```
