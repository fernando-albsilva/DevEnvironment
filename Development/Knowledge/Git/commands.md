## Configuração inicial

```bash
# Definir nome e e-mail do autor
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"

# Conferir as configurações
git config --global --list

# Definir o editor padrão
git config --global core.editor "code --wait"
```

## Criar ou obter um repositório

```bash
# Inicializar um repositório na pasta atual
git init

# Clonar um repositório existente
git clone URL_DO_REPOSITORIO

# Clonar uma branch específica
git clone --branch nome-da-branch URL_DO_REPOSITORIO
```

## Fluxo básico

```bash
# Ver o estado dos arquivos
git status

# Ver alterações ainda não preparadas
git diff

# Adicionar um arquivo para o próximo commit
git add arquivo.txt

# Adicionar todas as alterações
git add .

# Criar um commit
git commit -m "Descreve a alteração"

# Enviar commits para o repositório remoto
git push

# Baixar e integrar alterações remotas
git pull
```

## Histórico e inspeção

```bash
# Exibir o histórico resumido
git log --oneline

# Exibir o histórico com branches e tags
git log --oneline --graph --decorate --all

# Ver detalhes de um commit
git show ID_DO_COMMIT

# Ver quais arquivos foram alterados entre commits
git diff ID_COMMIT_1 ID_COMMIT_2

# Identificar quem alterou cada linha
git blame arquivo.txt
```

## Branches

```bash
# Listar branches locais
git branch

# Listar branches locais e remotas
git branch --all

# Criar uma branch
git branch nome-da-branch

# Criar e trocar para uma nova branch
git switch -c nome-da-branch

# Trocar de branch
git switch nome-da-branch

# Integrar uma branch na branch atual
git merge nome-da-branch

# Renomear a branch atual
git branch -m novo-nome

# Remover uma branch local
git branch -d nome-da-branch
```

## Merge

```bash
# Atualizar a branch de destino antes da integração
git switch branch-destino
git pull

# Integrar outra branch na branch atual
git merge nome-da-branch

# Criar um commit de merge mesmo quando não houver necessidade técnica
git merge --no-ff nome-da-branch

# Continuar o merge depois de resolver conflitos
git add arquivo-com-conflito.txt
git commit

# Cancelar um merge em andamento
git merge --abort
```

## Cherry-pick

```bash
# Aplicar um commit específico na branch atual
git cherry-pick ID_DO_COMMIT

# Aplicar vários commits específicos
git cherry-pick ID_COMMIT_1 ID_COMMIT_2

# Aplicar as alterações sem criar o commit automaticamente
git cherry-pick --no-commit ID_DO_COMMIT

# Continuar depois de resolver conflitos
git add arquivo-com-conflito.txt
git cherry-pick --continue

# Cancelar um cherry-pick em andamento
git cherry-pick --abort
```

## Repositórios remotos

```bash
# Listar repositórios remotos
git remote -v

# Adicionar um repositório remoto
git remote add origin URL_DO_REPOSITORIO

# Alterar a URL de um repositório remoto
git remote set-url origin NOVA_URL

# Buscar referências do remoto sem integrar alterações
git fetch origin

# Enviar a branch atual e definir seu upstream
git push -u origin nome-da-branch
```

## Desfazer alterações

```bash
# Retirar um arquivo da área de stage, mantendo as alterações
git restore --staged arquivo.txt

# Descartar alterações locais de um arquivo
git restore arquivo.txt

# Alterar a mensagem do último commit
git commit --amend -m "Nova mensagem"

# Criar um commit que desfaz outro commit
git revert ID_DO_COMMIT

# Remover o último commit, mantendo as alterações nos arquivos
git reset --soft HEAD~1
```

## Stash

```bash
# Guardar alterações temporariamente
git stash

# Guardar alterações incluindo arquivos não rastreados
git stash -u

# Listar alterações guardadas
git stash list

# Aplicar o stash mais recente, mantendo-o na lista
git stash apply

# Aplicar e remover o stash mais recente
git stash pop

# Remover um stash específico
git stash drop stash@{0}
```

## Tags e versões

```bash
# Listar tags
git tag

# Criar uma tag anotada
git tag -a v1.0.0 -m "Versão 1.0.0"

# Enviar uma tag para o remoto
git push origin v1.0.0

# Enviar todas as tags
git push origin --tags
```
