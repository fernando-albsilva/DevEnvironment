# Ambientes virtuais com `venv` no Python

O `venv` cria um ambiente isolado para cada projeto Python. Assim, as bibliotecas de um projeto não interferem nas bibliotecas de outro.

## 1. Verificar o Python

No Windows, PowerShell ou Prompt de Comando:

```powershell
python --version
```

No Linux ou WSL:

```bash
python3 --version
```

Se o comando não for encontrado, instale o Python e habilite a opção de adicionar o Python ao `PATH` durante a instalação no Windows.

## 2. Criar a pasta do projeto

```bash
mkdir meu-projeto
cd meu-projeto
```

## 3. Criar o ambiente virtual

No Windows:

```powershell
python -m venv .venv
```

No Linux ou WSL:

```bash
python3 -m venv .venv
```

O nome `.venv` é uma convenção. Você pode usar outro nome, mas os comandos de ativação deverão apontar para ele.

## 4. Ativar o ambiente virtual

### Windows PowerShell

```powershell
.\.venv\Scripts\Activate.ps1
```

Se o PowerShell bloquear a execução do script, execute uma vez:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Depois, tente ativar o ambiente novamente.

### Windows Prompt de Comando

```bat
.venv\Scripts\activate.bat
```

### Linux ou WSL

```bash
source .venv/bin/activate
```

Quando o ambiente estiver ativo, o nome dele aparecerá no início da linha do terminal, por exemplo: `(.venv)`.

## 5. Confirmar que o ambiente está ativo

```bash
python --version
python -c "import sys; print(sys.executable)"
```

O caminho exibido deve apontar para a pasta `.venv` do projeto.

No Windows, também é possível usar:

```powershell
where python
```

No Linux ou WSL:

```bash
which python
```

## 6. Atualizar o `pip`

```bash
python -m pip install --upgrade pip
```

## 7. Instalar pacotes

Com o ambiente ativo, instale as dependências normalmente:

```bash
python -m pip install requests
python -m pip install flask
```

Verifique os pacotes instalados com:

```bash
python -m pip list
```

## 8. Criar um arquivo de dependências

Para registrar as versões instaladas:

```bash
python -m pip freeze > requirements.txt
```

Em outro computador ou em um novo ambiente, instale tudo com:

```bash
python -m pip install -r requirements.txt
```

## 9. Executar o projeto

Com o ambiente ativo:

```bash
python main.py
```

Substitua `main.py` pelo arquivo de entrada do seu projeto.

## 10. Desativar o ambiente

Quando terminar o trabalho:

```bash
deactivate
```

## 11. Reativar um ambiente existente

Entre novamente na pasta do projeto e use o comando correspondente ao seu terminal:

```powershell
# Windows PowerShell
.\.venv\Scripts\Activate.ps1
```

```bash
# Linux ou WSL
source .venv/bin/activate
```

## 12. Remover o ambiente virtual

Desative o ambiente antes de removê-lo. Depois, exclua apenas a pasta `.venv`.

No Windows PowerShell:

```powershell
Remove-Item -Recurse -Force .venv
```

No Linux ou WSL:

```bash
rm -rf .venv
```

O ambiente pode ser recriado a qualquer momento com `python -m venv .venv` e as dependências podem ser restauradas usando o `requirements.txt`.

## 13. Ignorar o ambiente no Git

Adicione estas linhas ao arquivo `.gitignore` do projeto:

```gitignore
.venv/
venv/
__pycache__/
*.py[cod]
```

Não versione a pasta do ambiente virtual. Versione o `requirements.txt` para que as dependências possam ser reproduzidas.
