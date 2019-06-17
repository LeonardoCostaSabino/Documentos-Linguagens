#!/bin/bash

clear
while true; do

ErrorInitial="Não foi instalado :"

echo "==========================================================
        Digite o número da ação a ser executada:
        1 - Instalar Programas e configurar o sistema
        2 - Configurar Rede (Somente se for necessário)
        3 - Abrir Documentação de Instalação
        0 - Sair
==========================================================="
echo -n "->OPÇÃO:  "

read opcao

#verificar se foi digitada uma opcao
if [ -z $opcao ]; then
    echo "ERRO: digite uma opcao"
    exit
fi

case $opcao in
    1)
    while ! [ "$Config" == "Y" -o  "$Config" == "y" -o "$Config" == "N" -o "$Config" == "n" ]
    do
      echo -e "Será criada uma pasta temporária para auxiliar na instalação dos programas:\nGIT/ATOM/ZSH/CURL/DOCKER/GIMP/VLC/GOOGLE CHROME/LIBRE OFFICE/SNAP/VSCODE\n Podemos continuar (Y/N)?"
      read Config
      if [ "$Config" == "Y" -o "$Config" == "y" ]
        then
          if [ -e "/ConfiguraçãoZsh" ]
          then
          mkdir ConfiguraçãoZsh
          cd ConfiguraçãoZsh
        fi
        else
          if [ "$Config" == "N" -o "$Config" == "n" ]
          then
            exit 1
          else
            echo "Comando sem resposta"
        fi
      fi
    done

      echo -e "Instalação será iniciada... \n"
      for i in 5 4 3 2 1
        do
          echo -e "Começará em $i \n"
          sleep 0.75
      done

      echo Atualizando repositórios..
      if ! apt-get update
      then
        echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
        exit 1
      fi
      echo "Atualização feita com sucesso"

      echo "Atualizando pacotes já instalados"
      if ! apt-get dist-upgrade -y
      then
        echo "Não foi possível atualizar pacotes."
        echo "Por favor revise seu comando"
        exit 1
      fi
      echo "Atualização de pacotes feita com sucesso"

      #Instalando o programa Git

      if ! apt-get install git
      then
        echo "Não foi possível instalar o pacote Git"
        echo "Por favor revise seu comando"
        ErrorGit= "Git,"
      fi
      echo "Instalação do Git foi finalizada"

      #Instalando o programa Snap

      if ! sudo apt-get install snapd
      then
        echo "Não foi possível instalar o pacote Snap"
        echo "Por favor revise seu comando"
        ErrorSnap=" Snap,"
      fi
      echo "Instalação do Snap foi finalizada"

      #Instalando o programa Atom

      if sudo apt-get update
      then
        if ! sudo apt-get install atom
        then
          echo "Não foi possível instalar o pacote ATOM"
          echo "Por favor revise seu comando"
          ErrorAtom=" Atom,"
        fi
      else
        echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
      fi
      echo "Instalação do ATOM foi finalizada"

      #Instalando o Shell ZSH e o Framework oh-my-ZSH

      if sudo apt-get install zsh
        then
          if sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
          then
            if git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
            then
              if ! git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
              then
                echo "Não foi possível instalar o Plugin de compreender a sixtaxe das linguagens do Bash ZSH"
                echo "Por favor revise seu comando"
                ErrorZsh=" Shell Zsh,"
              fi
            else
              echo "Não foi possível instalar o Plugin de autocompletar do Bash ZSH"
              echo "Por favor revise seu comando"
              ErrorZsh=" Shell Zsh,"
            fi
          else
            echo "Não baixar o repositório do Bash ZSH no GitHub"
            echo "Revise o comando de download sh -c $(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
            ErrorZsh=" Shell Zsh,"
          fi
        else
          echo "Não foi possível instalar o Shell do ZSH"
          echo "Por favor revise seu comando"
          ErrorZsh=" Shell Zsh,"
        fi

      echo "Instalação do ZSH foi finalizada, sua configuração será realizada ao final de todas as atualizações"

      #Instalando o programa Docker

      if sudo apt-get update
      then
        if sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
        then
          if curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
          then
            read finger
            if sudo apt-key fingerprint $finger
            then
              if sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
              then
                if sudo apt-get update
                then
                  if ! sudo apt-get install docker-ce docker-ce-cli containerd.io
                  then
                    echo "Não foi possível instalar a ultima versão do Docker no seu Pc"
                    echo "Por favor revise seu comando"
                    ErrorDocker=" Docker,"
                  fi
                else
                  echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
                  ErrorDocker=" Docker,"
                fi
              else
                echo "Não foi possível Setar o repositório como estavel"
                echo "Por favor revise seu comando"
                ErrorDocker=" Docker,"
              fi
              else
                echo "Não foi possível Inserir a chave GPG oficial do docker"
                echo "Por favor revise seu comando"
                ErrorDocker=" Docker,"
              fi
            else
              echo "Não foi possível Adicionar a chave GPG oficial do docker"
              echo "Por favor revise seu comando"
              ErrorDocker=" Docker,"
            fi
          else
            echo "Não foi possível baixar o repositório do Docker em seu PC!"
            echo "Por favor revise seu comando"
            ErrorDocker=" Docker,"
          fi
        else
          echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
          ErrorDocker=" Docker,"
        fi
      echo "Instalação do Docker foi finalizada"

      #Instalando o Gimp

      if sudo add-apt-repository ppa:otto-kesselgulasch/gimp
      then
        if sudo apt-get update
        then
          if ! sudo apt-get install -y gimp
          then
            echo "Não foi possível instalar a ultima versão do Gimp no seu Pc"
            echo "Por favor revise seu comando"
            ErrorGimp=" Gimp,"
          fi
        else
          echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
          ErrorGimp=" Gimp,"
        fi
      else
        echo "Não foi possível baixar o repositório do Gimp em seu PC!"
        echo "Por favor revise seu comando"
        ErrorGimp=" Gimp,"
      fi
      echo "Instalação do Gimp foi finalizada"

      # Instalar o VLC

      if ! sudo apt-get install vlc
      then
        echo "Não foi possível instalar o pacote Vlc"
        echo "Por favor revise seu comando"
        ErrorVlc=" Vlc,"
      fi
      echo "Instalação do Vlc foi finalizada"

      #Instalando o programa Google Chorome

      if wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
      then
        if ! sudo gdebi google-chrome-stable_current_amd64.deb
        then
          echo "Não foi possível baixar o pacote do Google Chorome"
          echo "Por favor revise seu comando"
          ErrorGoogle=" GoogleChorome,"
        fi
      else
        echo "Não foi possível instalar o pacote do Google Chorome"
        echo "Por favor revise seu comando"
        ErrorGoogle=" GoogleChorome,"
      fi
      echo "Instalação do Google Chorome foi finalizada"

      if ! snap install code --classic
      then
        echo "Não foi possível instalar o pacote "
        echo "Por favor revise seu comando"
        ErrorVSCode=" Visual Studio Code"
      fi
      echo "Instalação do Visual Studio Code foi finalizada"

      if ErrorZsh==""
      then
        echo "Todas as instalações foram finalizadas deseja configurar o ZSH? (Y/N)"
        read Config
        if $Config -eq Y -o $Config -eq Y
        then
          if ! [ -a ConfiguraçãoZsh.txt ]
          then
            echo > ConfiguraçãoZsh.txt
            echo -e "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)\n" >ConfiguraçãoZsh.txt
            echo -e "(composer,copyfile,dirhistory,django,docker,extract,git,ng,node,npm,python,sudo)\n" >ConfiguraçãoZsh.txt
            echo -e "#ZSH_THEME="blinks" (agnoster ou blinks ou pygmalion ou wezm)\n" >ConfiguraçãoZsh.txt
            nano ConfiguraçãoZsh
            nano ~/.zshrc
          else
            echo ""
            exit 1
          fi
        fi
      fi

      echo $ErrorInitial$ErrorZsh$ErrorGit$ErrorVlc$ErrorGimp$ErrorAtom$ErrorSnap$ErrorDocker$ErrorVSCode"."

;;
    2)
;;
    3)
;;
    0)
        echo "Saindo..."
        exit 0;;
    *)
        echo
        echo "ERRO: opção inválida"
        echo;;
esac
done
