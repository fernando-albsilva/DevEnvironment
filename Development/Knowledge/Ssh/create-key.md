````markdown
# Gerar e adicionar chave SSH no Ubuntu

## 1. Verificar se já existe uma chave SSH
```bash
ls ~/.ssh
````

Se existir `id_ed25519` ou `id_rsa`, você já tem uma chave.

---

## 2. Gerar uma nova chave SSH (recomendado: ed25519)

```bash
ssh-keygen -t ed25519 -C "seu_email@exemplo.com"
```

* Pressione **Enter** para salvar no local padrão
* Defina uma **passphrase** (opcional, mas recomendado)

---

## 3. Iniciar o ssh-agent

```bash
eval "$(ssh-agent -s)"
```

---

## 4. Adicionar a chave SSH ao agente

```bash
ssh-add ~/.ssh/id_ed25519
```

---

## 5. Copiar a chave pública

```bash
cat ~/.ssh/id_ed25519.pub
```

Copie todo o conteúdo exibido para adicionar em serviços como GitHub, GitLab, etc.

---

## 6. Testar a conexão (exemplo com GitHub)

```bash
ssh -T git@github.com
```

Se aparecer uma mensagem de sucesso, a chave está funcionando corretamente.

```