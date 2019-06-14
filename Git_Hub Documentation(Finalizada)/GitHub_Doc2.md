# @Conceitos e Ciclo Básico Git@

___
## Conceitos

#### Tags

  >*Versões do projetos*

#### Branches

  >*Seções separadas dos projetos geralmente utilizadas para códigos incompletos ou em fase de testes*

#### Clonar

  >*Gerar um cópia idêntica da versão atual do projeto*

#### SSH

  >*Componente padrão do conjunto de protocolos Secure Shell encontrado em sistemas de computadores Unix, Unix-like e Microsoft Windows usados ​​para estabelecer sessões de shell seguras entre computadores remotos através de redes inseguras, através do uso de várias técnicas criptográficas.*  

#### Forks

  >*São alterações nos projetos sem alterar o original*

#### Workdir

  >*Pasta local onde estão seus arquivos*

#### Repositório

  >*Local onde ficará os arquivos dos projetos*

#### Markdown {[MarkDown Doc Code](Referencias/Arquivo_de_Referencia.md)} ou {[Site de consulta MarkDown](https://blog.da2k.com.br/2015/02/08/aprenda-markdown/)}

  >*Linguagem que usada para escrever arquivos de HTML de forma mais simples no GitHub*

#### Commit

  >*Postar alterações no repositório remoto*

## Dicas or Tips

  >Para ignorar arquivos na hora de commitar bastar criar uma pasta *.gitignore* coloca-los lá

  >Comandos na ordem sequencial para fazer com sucesso a criação de um reositório e enviar para o repositório online

  ```Shell
  git init
  git add README.md
  git commit -m "first commit"
  git remote add origin git@github.com:LeonardoCostaSabino/System-Clinic-.git
  git push -u origin master
  ```

  >Comandos para extrair um repositório online para o repositório local

```Shell
  git remote add origin git@github.com:LeonardoCostaSabino/System-Clinic-.git
  git push -u origin master
```

## Comandos

### Básico

  + Iniciar um Repositório


  ```Shell
  git init
  ```

  + Criar um chave de acesso ao seu GitHub (*CMD ou git Shell*)


  ```Shell
  ssh-keygen -t rsa -C "Email_do_GitHub"
  ```


  + Gerar usuário para salvar suas alterações (Configuração Básica)


  ```Shell
  git config --global user.name "Name"
  git config --global user.email "E-mail"  
  ```

  + Clonar um repositório


  ```Shell
  git clone "git://github.com/User/Repositório.git" "DiretórioaSerCriado"
  git clone "[url]"
  ```   

  + Adicionar arquivos ao Repositório

  + Adicionar todos os arquivos

  + Adicionar todos os arquivos referentes a extensão escolhida


  ```Shell
  git add "Arquivo"
  git add .
  git add *."Extensão"
  ```  

  + Postar alterações locais

  + Desfazer Commit indesejado


  ```Shell
  git commit -m "Descrição da postagem"
  git commit -am "Descrição da postagem"
  ```

### Conexão repositório online

  + Sincronização com o repositório online


  ```Shell
  git remote add origin git@github.com:"Nome de Usuário"/"Nome do repositório criado".git
  ```

  + Enviar Commits Locais para o repositório online


  ```Shell
  git push origin master
  git push origin "Nome" {Branches}
  ```

  + Sincronizar o Master Local com o Online Master

  + Sincronizar uma branch local com o Online Master


  ```Shell
  git pull origin master
  git pull -u origin "Nome" {Branches}
  ```

### Logs

  >Visualização padrão

  + Visualizar os logs de Commits

  + Visualizar os logs em ordem cronologia descresente  

  + Visualizar os logs dos commits em certa quantidade

  + Visualizar os logs dos commits com seus respectivos titulos  


  ```Shell
  git log
  git log -p
  git log -p -1
  git log --pretty=oneline
  ```

  + Visualizar os Logs mais detalhados


  ```Shell
  git whatchanged
  ```

  + Pode Verificar o que foi alterado dentro dos arquivos

  + Mostra os arquivos estão em status de pre-commit


  ```shell
  git diff "Versão Anterior" "Versão Atual"
  git diff --staged
  ```

  + Fornece quem foram os usuarios que adicionaram cada linha dentro do arquivos


  ```Shell
  git blame "Arquivo"
  ```

  + Verificar status do Repositório local


  ```Shell
  git status
  ```

### Versões

  + Visualizar a versão atual do projetos

  + Define a versão atual do repositório local

  + Definir a versão de um determinado Commit

  + Apagar alguma Tag


  ```Shell
  git tag
  git tag -a "Nome" -m "Mensagem"
  git tag -a "Nome" "Chave do commit" -m "Mensagem"
  git tag -d "Nome"
  ```

  ```Shell
  git checkout "Versão"
  ```

  + Criar um Branch dentro do repositório local


  ```Shell
  git branch "Nome"
  ```

  + Visualizar Branches existentes no repositório remoto

  + Mostra as branches existentes no repositório local

  + Deleta alguma branch do repositório

  + Puxa alguma branch do repositório remoto

  + Mostra o ultimo commit de cada branch


  ```Shell
  git branch -r
  git branch
  git branch -d "Nome"
  git branch -t "Nome a ser criado" "Nome da Branch Online"
  git branch -v
  ```  

  + Alterar a branch utilizadas

  + Mudar de versão de uso

  + Reverter alterações do seu ambiente local após um commit errado


  ```shell
  git checkout "Branch"
  git checkout "Versão"
  git checkout -- "Nome do Arquivo"
  ```

  + Todos revertem após enviar um commit errado


  ```Shell
  git reset HEAD "Nome do Arquivo"
  git revert -n [hash_do_commit]
  git commit --amend -m "Mensagem"
  ```

  + Apagar arquivos do commits


  ```Shell
  git rm "Nome do arquivo"
  ```

  + Mostar informaçãoes sobre a versão específicas


  ```Shell
  git show "Versão"
  ```

  + Juntar ambientes(branchs) diferentes


  *Voce necessariamente precisa estar no ambiente em que voce quer colocar o conteudo, ou seja, o Destino _geralmente é Master_ *

  ```Shell
 git merge "Origem"
  ```
[Voltar para a pagina anterior](GitHub_Doc.md)
