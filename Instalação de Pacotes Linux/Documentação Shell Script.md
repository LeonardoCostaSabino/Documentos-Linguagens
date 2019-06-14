## @Shell Script - LINUX@

## Introdução

Programar em Shell Script proporciona maior flexibilidade ao administrar e operar um sistema Linux em tarefas relacionadas a redes, administração de servidores Linux, programação e ambientes dos usuários.

## Variaveis de ambientes

+ PATH - Lista de diretórios de programas executáveis
+ USERNAME -Nome do usuário logado
+ TERM - Tipo de terminal ou janela de terminal em usuário
+ HOME - Mostra diretorio Home do usuário atual
+ UID - Número de identificação do usuário atual
+ RANDOM - Gera um número aleatório
+ LANG - Idioma, especificado com locale

## Variaveis globais

+ $# — total de argumentos que foram passados
+ $* — retorno aos argumentos
+ $0 — nome do script executado

## Comandos

+ Mostrar as variáveis de ambiente


```bash
#!/bin/bash

env
printenv
```

+ Criar uma variavel global


```bash
#!/bin/bash

export "Variavel"
```

+ Apagar uma variavel


```bash
#!/bin/bash

unset "Variavel"
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Declarar uma variavel


```bash
#!/bin/bash

MESSAGE="Mensagem"
```

+ Dar Print na tela


```bash
#!/bin/bash

MESSAGE="Mensagem"
echo $MESSAGE
echo "Hugo mandou: $MESSAGE"
```

+ Colocar comentários


```bash
#!/bin/bash

#Isso é comentário
```

+ Executar um arquivo Shell Script


```bash
chmod 755 "Nome".sh
./"Nome".sh
```

+ Copiar todos os arquivos de um diretório para outro diretório

+ Copiar todos os arquivos com mesma extensão para outro diretório


```bash
#!/bin/bash

cp /"Caminho"/* /"Caminho2"/
cp /"Caminho"/*."Extensão" /"Caminho2"/

```

+ Mover todos os arquivos de um diretório para outro


```bash
#!/bin/bash

mv /"Caminho"/* /"Caminho2"/
```

+ Criar um vetor para percorrer certos valores *Consegui atribuir strings tbm*


```bash
#!/bin/bash

for i in 1 2 3 4 5
do
  echo "Looping ... number $i"
done
```

+ Criar um Loop


```bash
#!/bin/bash

INPUT_STRING=hello
while [ "$INPUT_STRING" != "bye" ]
do
  echo "Please type something in (bye to quit)"
  read INPUT_STRING
  echo "You typed: $INPUT_STRING"
done
```

+ Criar uma pasta


```bash
#!/bin/bash

mkdir "Nome_do_Diretório"
```

+ Criar um bloco condicional


```bash
#!/bin/bash

if ["Condição"];
then
  #Codigo
elif ["condition"]; then
  #Codigo
else
  #Codigo
fi  
```

+ Propriedades de arquivos


```bash
#!/bin/bash

-a #Arquivo Existe
-e #Arquivo Existe
-S #Arquivo é um "Soquete"
-nt #Mais recente do que outro
-ot #Mais antigo do que outro
-ef #Caminho referencia o mesmo arquivo
-O #Arquivo pertence ao usuário atual

```

+ Receber comandos do usuário


```bash
#!/bin/bash

read $COMANDOS

```

+ Criar um CASE em série


```bash
#!/bin/bash

case $INPUT in
"Condição1")
  echo "Hello yourself!"
  ;;
"Condição2")
  echo "See you again!"
  break #Finalizar o CASE
  ;;
*) #Todas as outras opções
  echo "Sorry, I don't understand"
  ;;
esac

```

+ Ir até um determinado diretório


```bash
#!/bin/bash

cd "Diretório"
```

+ Instalar pacotes


```bash
#!/bin/bash

sudo apt-get install "Pacote" #Primeira vez após o login
apt-get install "Pacote"
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```
+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```

+ Iniciar uma arquivo Shell Script


```bash
#!/bin/bash
```
