# Códigos e Funcionalidades

>Tipos

+ Boolean
+ Integer
+ Float
+ String
+ Array
+ object
+ callable
+ resource
+ NULL

Não precisa declarar tipos de variáveis
## Funcionalidades

(dot) em Php . significa concatenação


>Call-back

```PHP
  call_user_func();
  usort();
```
___
>Verificar os tipos de variáveis

```PHP
  gettype();
  str_replace() "Somente strings ou Array"
```
___
>Definir uma variável global

```PHP
  global $a $b;
```
___
>Definir uma variável estática

```PHP
  static $a= 0;
```
___
>Definir uma variável de variavel

```PHP
  $$a= 0;
```

>Definir vairiaveis constantes

```PHP
  define("Nome","Conteudo");
```

>ou Exclusivo

```PHP
  $a xor $b;
```

>Suprimir mensagens de erro

```PHP
  @function("sdfksd");
```
>Referenciar um arquivo externo

```PHP
  include 'vars.php'
```

## CODIGOS

> Mostrar algo na tela

```PHP
  echo "Texto ou variável";
```
___
>Mostrar informações sobre o arquivo PHP

```PHP
  phpinfo();
```
___
>Consultar navegador em que está sendo usado

```PHP
  $_SERVER['HTTP_USER_AGENT'];
```
___
>Consultar dados que foram enviados por um formulários

```PHP
  htmlspecialchars($_POST['name']);
  (int)$_POST['age'];
```
___
>Verificar os dados de uma variável

```PHP
  var_dump();
```
___
>Instanciar uma classe
```PHP
  var_dump($a instanceof MyClass);
```
