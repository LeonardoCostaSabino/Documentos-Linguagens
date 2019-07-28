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
      echo -e "Será criada uma pasta temporária para auxiliar na instalação dos programas:\nGIT/ATOM/ZSH/CURL/DOCKER/DOCKER-COMPOSE/GIMP/VLC/GOOGLE CHROME/LIBRE OFFICE/SNAP/VSCODE/PHPSTORM\n Podemos continuar (Y/N)?"
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
      if ! sudo apt-get update
      then
        exit 1
      fi
      echo "Atualização feita com sucesso"

      echo "Atualizando pacotes já instalados"
      if ! sudo apt-get dist-upgrade -y
      then
        exit 1
      fi
      echo "Atualização de pacotes feita com sucesso"

      #Instalando o programa Git

      if ! sudo apt-get install git -y
      then
        ErrorGit= "Git,"
      fi
      echo "Instalação do Git foi finalizada"

      #Instalando o programa Snap

      if ! sudo apt-get install snapd -y
      then
        ErrorSnap=" Snap,"
      fi
      echo "Instalação do Snap foi finalizada"

      #Instalando o programa Atom
      if sudo add-apt-repository ppa:webupd8team/atom -y
        then
          if sudo apt-get update
          then
            if ! sudo apt-get install atom -y
            then
              ErrorAtom=" Atom,"
            fi
          else
            ErrorAtom=" Atom,"
          fi
        else
          ErrorAtom=" Atom,"
      fi
      echo "Instalação do ATOM foi finalizada"

      #Instalando o Shell ZSH e o Framework oh-my-ZSH

      if sudo apt-get install zsh -y
        then
          if sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
          then
            if git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
            then
              if ! git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
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
        if sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common-y
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
                  if sudo apt-get install docker-ce docker-ce-cli containerd.io -y
                  then
                    if ! sudo usermod -aG docker $(whoami) # Comando para deixar o docker sem sudo -y
                    then
                      ErrorDocker=" Docker,"
                    fi
                    else
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

      #Instalando Docker-compose

      if sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose -y
        then
          if ! sudo chmod +x /usr/local/bin/docker-compose -y
            then
              ErrorDockerCompose=" Docker-Compose,"
          fi
        else
          ErrorDockerCompose=" Docker-Compose,"
      fi


      #Instalando o Gimp

      if sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
      then
        if sudo apt-get update
        then
          if ! sudo apt-get install gimp -y
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

      if ! sudo apt-get install vlc -y
      then
        echo "Não foi possível instalar o pacote Vlc"
        echo "Por favor revise seu comando"
        ErrorVlc=" Vlc,"
      fi
      echo "Instalação do Vlc foi finalizada"

      #Instalando o programa Google Chorome

      if wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
      then
        if ! sudo gdebi google-chrome-stable_current_amd64.deb -y
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

      if ErrorZsh==""
      then
        echo "Todas as instalações foram finalizadas deseja configurar o ZSH? (Y/N)"
        read Configs
        if [ "$Configs" == "Y" -o "$Configs" == "y" ]
        then
          if ! [ -a ConfiguraçãoZsh.txt ]
          then
            echo > ConfiguraçãoZsh.txt
            echo -e "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)\n" >ConfiguraçãoZsh.txt
            echo -e "(composer,copyfile,dirhistory,django,docker,extract,git,ng,node,npm,python,sudo)\n" >ConfiguraçãoZsh.txt
            echo -e "#ZSH_THEME="blinks" (agnoster ou blinks ou pygmalion ou wezm)\n" >ConfiguraçãoZsh.txt
            atom ConfiguraçãoZsh
            atom ~/.zshrc
          else
            echo ""
            exit 1
          fi
        else
          if [ "$Configs" == "N" -o "$Configs" == "n" ]
            then
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




#PhpStorm Editor

wget https://download.jetbrains.com/webide/PhpStorm-2019.2.tar.gz -O phpstorm.tar.gz
sudo tar vzxf phpstorm.tar.gz -C /opt/
sudo mv /opt/PhpStorm*/ /opt/phpstorm
sudo ln -sf /opt/phpstorm/bin/phpstorm.sh /usr/bin/phpstorm
echo -e '[Desktop Entry]\n Version=1.0\n Name=phpstorm\n Exec=/opt/phpstorm/bin/phpstorm.sh\n Icon=/opt/phpstorm/bin/phpstorm.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/phpstorm.desktop
sudo chmod +x /usr/share/applications/phpstorm.desktop
cp /usr/share/applications/phpstorm.desktop ~/Desktop #Em Ingles
cp /usr/share/applications/phpstorm.desktop  ~/Área\ de\ Trabalho/ #Em Português

#mpv Player

sudo add-apt-repository ppa:mc3man/mpv-tests
sudo apt-get install mpv

#Visual Code Studio

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

#Sublime

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

#Brackets

sudo add-apt-repository ppa:webupd8team/brackets
sudo apt-get update
sudo apt-get install brackets