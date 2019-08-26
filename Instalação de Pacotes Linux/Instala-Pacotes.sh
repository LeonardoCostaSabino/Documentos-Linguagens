#!/bin/bash
clear
while true; do
clear
echo "====================================================================
            Digite o número da ação a ser executada:                |
1 - Instalar Programas iniciais                                     |
2 - Escolha seus editores para Programação                          |
3 - Escolha seus Manipuladores de Banco de Dados                    |
4 - Deseja instalar alguma linguagem de Programação especifica?     |
5 - Docker-Containers [Prontos] -> Aplicações para Desenvolvimento  |
6 - Configurar Shell ZSH                                            |
7 - Abrir Documentação de Instalação                                |
0 - Sair                                                            |
===================================================================="
echo -n "->OPÇÃO:  "

read -r opcao

#verificar se foi digitada uma opcao
if [ -z "$opcao" ]; then
    echo "ERRO: digite uma opcao"
    exit
fi

case $opcao in
    1)
      echo -e "Instalação será iniciada... \n"

      PROGRAMAS[0]=" ====================\n";
      PROGRAMAS[1]=" |Git            | - Programa de Controle de Versão\n";
      PROGRAMAS[2]=" |Snap           | - Programa de Auxilio de instalação de Programas\n";
      PROGRAMAS[3]=" |Shell-Zsh      | - Shell mais interativo com o usuário e permite persinalização \n";
      PROGRAMAS[4]=" |Docker         | - Programa de Criaçaõ de ambiente de desenvolvimento\n";
      PROGRAMAS[5]=" |Docker-Compose | - Programa de extensão ao Docker\n";
      PROGRAMAS[6]=" |Gimp           | - Programa de ediçaõ de Imagem \n";
      PROGRAMAS[7]=" |VLC            | - Player de Audio\n";
      PROGRAMAS[8]=" |Google-Chorome | - Navegador Web\n";
      PROGRAMAS[9]=" |Postman        | - Aplicativo de Gerenciamento de Requisição Web\n";
      PROGRAMAS[10]=" |Mpv Payer      | - Programa de Player de Video melhorado\n";
      PROGRAMAS[11]=" |Cream          | - Editor de Texto simples\n";
      PROGRAMAS[12]="====================\n";

      echo -e "Os programas instalados serão: \n ${PROGRAMAS[*]}";
      sleep 5;

      for i in 5 4 3 2 1;
        do

          echo -e "Começará em $i \n"
          sleep 0.75
      done

      echo Atualizando repositórios..
      if sudo apt-get update
      then
        FINISH[0]="Atualização feita com sucesso\n";
      else
        exit 1;
      fi

      if sudo apt-get dist-upgrade -y
      then
        FINISH[1]="Atualização de pacotes feita com sucesso\n";
      else
        exit 1;
      fi

      #Instalando o programa Git
      if sudo apt-get install git -y
      then
        FINISH[2]="Instalação do Git foi finalizada com Sucesso!!!\n";
      else
        ERROR[0]="Git,"
      fi

      #Instalando o programa Snap

      if sudo apt-get install snapd -y
      then
        FINISH[3]="Instalação do Snap foi finalizada com Sucesso!!!\n";
      else
        ERROR[1]=" Snap,"
      fi

      #Instalando o Shell ZSH e o Framework oh-my-ZSH

      if sudo apt-get install zsh -y &&
         sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
         git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions &&
         git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
        then
          FINISH[4]="Instalação do ZSH foi finalizada com Sucesso!!!\n"
        else
          echo "Não foi possível instalar o Shell do ZSH"
          echo "Por favor revise seu comando"
          ERROR[2]=" Shell Zsh,"
        fi

      #Instalando o programa Docker

      if sudo apt-get update &&
         sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common-y &&
         curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      then
        read -r finger
        if sudo apt-key fingerprint "$finger"
          then
            if sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable" &&
               sudo apt-get update &&
               sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&
               sudo usermod -aG docker "$(whoami)" # Comando para deixar o docker sem sudo -y
            then
              FINISH[5]="Instalação do Docker foi finalizada com Sucesso!!!\n"
            else
              ERROR[3]=" Docker,"
            fi
          else
            ERROR[3]=" Docker{Chave de Acesso},"
        fi
        else
          ERROR[3]=" Docker,"
      fi

      #Instalando Docker-compose

      if sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose -y &&
         sudo chmod +x /usr/local/bin/docker-compose -y
        then
          FINISH[6]="Instalação do Docker-Compose foi finalizada com Sucesso!!!\n"
        else
          ERROR[4]=" Docker-Compose,"
      fi

      #Instalando o Gimp

      if sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y &&
         sudo apt-get update &&
         sudo apt-get install gimp -y
      then
        FINISH[7]="Instalação do Gimp foi finalizada com Sucesso!!!\n"
      else
        echo "Não foi possível baixar o repositório do Gimp em seu PC!"
        echo "Por favor revise seu comando"
        ERROR[5]=" Gimp,"
      fi

      # Instalar o VLC

      if sudo apt-get install vlc -y
      then
        FINISH[8]="Instalação do Vlc foi finalizada com Sucesso!!!\n"
      else
        ERROR[6]=" Vlc,"
      fi

      #Instalando o programa Google Chorome

      if wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
         sudo gdebi google-chrome-stable_current_amd64.deb -y
      then
        FINISH[9]="Instalação do Google Chorome foi finalizada com Sucesso!!!\n"
      else
        ERROR[7]=" GoogleChorome,"
      fi

      #Instalando o programa Postman

      if sudo snap install postman
      then
        FINISH[10]="Instalação do Postman foi finalizada com Sucesso!!!\n"
      else
        ERROR[8]=" Postman,"
      fi

      #Instalando o programa Mpv Player

      if sudo add-apt-repository ppa:mc3man/mpv-tests &&
         sudo apt-get install mpv
      then
        FINISH[11]="Instalação do Mpv Player foi finalizada com Sucesso!!!\n"
      else
        ERROR[9]=" Mpv Player,"
      fi

      #Instalando o programa Cream

      if sudo apt-get install cream
      then
        FINISH[11]="Instalação do Cream foi finalizada com Sucesso!!!\n"
      else
        ERROR[9]=" Cream,"
      fi

      #Finalizou todas as instalações

      echo -e "${FINISH[*]}";

      echo -e "Não foi instalado : ${ERROR[*]}";

    ;;

    2)
      editor_escolha=null;
      while [ "$editor_escolha" != '0' ]
      do
        clear;
        echo -e 'Bem Vindo aos menus com os Editores disponiveis para instalação'

        EDITORES[0]="=======================\n";
        EDITORES[1]="|1-PHPSTORM EDITOR    | - Programa robusto de programação [NEED HIGH-PERFORMANCE]\n";
        EDITORES[2]="|2-VISUAL CODE STUDIO | - Programa robusto de programação [NEED MEDIUM-PERFORMANCE]\n";
        EDITORES[3]="|3-SUBLIME            | - Editor de Texto Simples para programação [NEED LOW-PERFORMANCE] \n";
        EDITORES[4]="|4-BRACKETS           | - Programa robusto de programação [NEED MEDIUM-PERFORMANCE]\n";
        EDITORES[5]="|5-ATOM               | - Programa robusto de programação [NEED LOW-PERFORMANCE]\n";
        EDITORES[6]="|0-SAIR               |\n";
        EDITORES[7]="=======================\n";

        echo -e "${EDITORES[*]}";

        read -r editor_escolha;

        if [ -z "$editor_escolha" ];
          then
            echo "ERRO: digite uma opcao"
            exit
        fi

        case "$editor_escolha" in

          1)

            echo -e "Por favor nos informe seu computador está em qual Idioma 1-Ingles 2-Português\n";

            read -r language;

            while $language === '0'
            do
            read -r language
            if [ -z "$language" ]; then
                echo "ERRO: digite uma das opções definidas!!"
            fi
            done

            if wget https://download.jetbrains.com/webide/PhpStorm-2019.2.tar.gz -O phpstorm.tar.gz &&
               sudo tar vzxf phpstorm.tar.gz -C /opt/ &&
               sudo mv /opt/PhpStorm*/ /opt/phpstorm &&
               sudo ln -sf /opt/phpstorm/bin/phpstorm.sh /usr/bin/phpstorm &&
               echo -e '[Desktop Entry]\n Version=1.0\n Name=phpstorm\n Exec=/opt/phpstorm/bin/phpstorm.sh\n Icon=/opt/phpstorm/bin/phpstorm.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/phpstorm.desktop &&
               sudo chmod +x /usr/share/applications/phpstorm.desktop
              then
                if "$language" == '1'
                  then
                    if cp /usr/share/applications/phpstorm.desktop ~/Desktop #Em Ingles
                      then
                        echo -e 'Parabens o PHPSTORM foi instalado com sucesso!!!\n';
                      else
                        echo -e 'Houve um erro durante a instalação\n';
                    fi
                  else
                    if "$language" == '2'
                      then
                        if cp /usr/share/applications/phpstorm.desktop  ~/Área\ de\ Trabalho/ #Em Português
                          then
                            echo -e 'Parabens o PHPSTORM foi instalado com sucesso!!!\n';
                          else
                            echo -e 'Houve um erro durante a instalação\n';
                        fi
                      else
                        exit;
                    fi
                  fi
                  else
                    echo -e 'Houve um erro durante a instalação\n';
                fi
            ;;
          2)
            if curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
               sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ &&
               sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
            then
              echo -e 'Parabens o VISUAL CODE STUDIO foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
            ;;
          3)
            if wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - &&
              sudo apt-get install apt-transport-https &&
              echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list &&
              sudo apt-get update &&
              sudo apt-get install sublime-text
            then
              echo -e 'Parabens o SUBLIME foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
            ;;
          4)
            if sudo add-apt-repository ppa:webupd8team/brackets &&
               sudo apt-get update &&
               sudo apt-get install brackets
            then
              echo -e 'Parabens o BRACKETS foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
            ;;
          5)
            if sudo add-apt-repository ppa:webupd8team/atom -y
               sudo apt-get update
               sudo apt-get install atom -y
            then
              echo -e 'Parabens o ATOM foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
            ;;
          0)
            break;
            ;;
          esac
      done
    ;;
    3)

      banco_escolha=null;
      while [ "$banco_escolha" != '0' ]
      do
        clear;
        echo -e 'Bem Vindo aos menus com os Editores disponiveis para instalação'

        BANCO[0]="====================\n";
        BANCO[1]="|1-DBEAVER         | - IDE de gerenciamento de Banco de Dados [NEED MEDIUM-PERFORMANCE]\n";
        BANCO[2]="|2-MYSQL WORKBENCH | - IDE de gerenciamento de Banco de Dados  [NEED LOW-PERFORMANCE]\n";
        BANCO[3]="|3-DATAGRIP        | - IDE robusta de gerenciamento de Banco de Dados [NEED HIGH-PERFORMANCE] \n";
        BANCO[4]="|0-SAIR            |\n";
        BANCO[5]="====================\n";

        echo -e "${BANCO[*]}";

        read -r banco_escolha;

        if [ -z "$banco_escolha" ];
          then
            echo "ERRO: digite uma opcao"
            exit
        fi

        case "$banco_escolha" in

          1)
            if wget -c https://dbeaver.io/files/6.0.0/dbeaver-ce_6.0.0_amd64.deb &&
               sudo dpkg -i dbeaver-ce_6.0.0_amd64.deb &&
               sudo apt-get install -f
            then
              echo -e 'Parabens o DBEAVER foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
          ;;
          2)
            if sudo apt update &&
               sudo apt upgrade &&
               sudo apt install mysql-workbench
            then
              echo -e 'Parabens o MYSQL-WORKBENCH foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
          ;;
          3)
            if sudo snap install datagrip --candidate --classic
            then
              echo -e 'Parabens o DATAGRIP foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
          ;;
          0)
            break;
            ;;
        esac
      done
      ;;
    4)
      linguagem_escolha=null;
      while [ "$linguagem_escolha" != '0' ]
      do
        clear;
        echo -e 'Bem Vindo aos menus com os Editores disponiveis para instalação'

        LINGUAGENS[0]="================\n";
        LINGUAGENS[1]="|1-MYSQL-SERVER | - Servidor de Banco de Dados Mysql [BACK-END]\n";
        LINGUAGENS[2]="|2-PHP          | - Linguagem de Programação Web [FRONT-END]\n";
        LINGUAGENS[3]="|3-COMPOSER     | - Gerenciador de bibliotecas do PHP [BACK-END]\n";
        LINGUAGENS[4]="|4-NODE         | - Linguagem de Programação Web [BACK-END]\n";
        LINGUAGENS[5]="|5-APACHE       | - Servidor Web de aplicações [BACK-END]\n";
        LINGUAGENS[6]="|6-NGINX        | - Servidor Web de aplicações [BACK-END]\n";
        LINGUAGENS[7]="|7-PHYTHON      | - Linguagem de programação para gerenciamento de dados [BACK-END]\n";
        LINGUAGENS[8]="|0-SAIR         |\n";
        LINGUAGENS[9]="================\n";

        echo -e "${LINGUAGENS[*]}";

        read -r linguagem_escolha;

        if [ -z "$linguagem_escolha" ];
          then
            echo "ERRO: digite uma opcao"
            exit
        fi

        case "$linguagem_escolha" in

          1)
            if sudo apt update &&
            sudo apt install mysql-server &&
            sudo mysql_secure_installation &&
            systemctl status mysql.service &&
            sudo mysqladmin -p -u root version
            then
              echo -e 'Parabens o MYSQL-SERVER foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
          ;;
          2)
            echo -e "Nesta etapa será instalado o PHP para ambos os servidores NGINX e APACHE e acompanha\n Com varias extensoes que iraão facilitar sua programação
                     Extensões:
                     CLI
                     JSON
                     PDO
                     MYSQL
                     ZIP
                     GD
                     MBSTRING
                     CURL
                     XML
                     BCMATH"
            sleep 5;
            if sudo apt update &&
            sudo apt upgrade &&
            sudo add-apt-repository ppa:ondrej/php &&
            sudo apt update &&
            sudo apt-get install php7.3 &&
            php -v &&
            sudo apt install php7.3-cli php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath &&
            apt policy php7.3-gd &&
            sudo apt install php7.3-fpm
            then
              echo -e 'Parabens o PHP foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
            ;;
          3)
            if sudo apt update &&
            sudo apt install curl php-cli php-mbstring git unzip &&
            curl -sS https://getcomposer.org/installer -o composer-setup.php &&
            echo -e "Digite o Hash!! https://composer.github.io/pubkeys.html\n" &&
            read -r hash &&
            HASH=$hash &&
            php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&
            sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer &&
            composer
            then
              echo -e 'Parabens o COMPOSER foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
            ;;
          4)

            echo -e "Será instalado nesta etapa no Node.js com seus gerenciadores de bibliotecas: NPM e YARN"
            sleep 5;

            if sudo apt-get install curl python-software-properties &&
            curl -sL https://deb.nodesource.com/setup_12.x | sudo bash - &&
            sudo apt-get install nodejs &&
            node -v &&
            npm -v &&
            sudo npm install yarn -g &&
            yarn -v
            then
              echo -e 'Parabens o NODE.js foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
            ;;
          5)
            if sudo apt-get update &&
            sudo apt-get install apache2
            then
              echo -e 'Parabens o APACHE foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
            ;;
          6)
            if sudo apt update &&
            sudo apt install nginx &&
            sudo systemctl status nginx
            then
              echo -e 'Parabens o NGINX foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
            ;;
          7)
            if sudo add-apt-repository ppa:deadsnakes/ppa &&
            sudo apt-get update &&
            sudo apt-get install python3.7
            then
              echo -e 'Parabens o PHYTHON foi instalado com sucesso!!!\n';
            else
              echo -e 'Houve um erro durante a instalação\n';
            fi
            ;;
          0)
            break;
            ;;
          esac
      done
    ;;
    5)
      # Colocar os Containers testados e finalizados do Git para cá
    ;;
    6)
      if zsh
      then
        echo "Todas as instalações foram finalizadas deseja configurar o ZSH? (Y/N)"
        read -r Configs
        if [ "$Configs" == "Y" ] || [ "$Configs" == "y" ]
          then
            echo -e "Copie esses codigos para o Arquivo que será aberto!!\n"
            echo -e "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)\n"
            echo -e "(composer,copyfile,dirhistory,django,docker,extract,git,ng,node,npm,python,sudo)\n"
            echo -e "#ZSH_THEME='blinks' (agnoster ou blinks ou pygmalion ou wezm)\n"
            cream ~/.zshrc
          else
            echo ""
            break;
        fi
      fi
    ;;
    7)
      cream ./Org-Programas-INUX.md
      ;;
    0)
        echo "Saindo..."
        exit 0
        ;;

esac
done
