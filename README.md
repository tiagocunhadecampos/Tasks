# API Task em Laravel e Aplicativo Task Flutter

Este repositório contém a API Task em Laravel e o aplicativo Task Flutter para gerenciamento de tarefas.

## Pré-requisitos

- XAMPP ou outro servidor web local com PHP e MySQL.
- Git instalado no seu sistema.
- Ambiente de desenvolvimento para Flutter configurado e funcionando corretamente.

## Passo 1: Configurar o Ambiente Laravel

1. Clone o repositório da API Task em Laravel do GitHub:

   git clone https://github.com/seu-usuario/task_api.git

2. Navegue até o diretório da API Task:

   cd task_api

3. Instale as dependências do Composer:

  composer install

4. Copie o arquivo de ambiente de exemplo:

  cp .env.example .env

5. Gere uma chave de aplicativo:

  php artisan key:generate

6. Abra o arquivo `.env` e configure as credenciais do banco de dados:

  DB_CONNECTION=mysql
  DB_HOST=127.0.0.1
  DB_PORT=3306
  DB_DATABASE=nome_do_seu_banco_de_dados
  DB_USERNAME=seu_usuario
  DB_PASSWORD=sua_senha

7. Execute as migrações do banco de dados para criar as tabelas necessárias:

  php artisan migrate

8. Inicie o servidor da API Laravel:

  php artisan serve

## Passo 2: Configurar o Aplicativo Task Flutter
versão do Flutter: 3.3.0

1. Clone o repositório do aplicativo Task Flutter do GitHub:

  git clone https://github.com/seu-usuario/task_flutter.git

2. Navegue até o diretório do aplicativo Task Flutter:

  cd task_flutter

3. Abra o arquivo `lib/services/task_api.service.dart` e atualize a variável `apiUrl` para apontar para o URL da sua API Laravel:

```dart
const String apiUrl = 'http://localhost:8000/api';
```

4.Execute o aplicativo Flutter no seu emulador ou dispositivo:

  flutter run

## Conclusão

Agora você tem a API Task em Laravel e o aplicativo Task Flutter configurados e em execução em seu ambiente local. 
Você pode acessar a API através do servidor Laravel e interagir com o aplicativo Flutter para gerenciar suas tarefas. 
Certifique-se de que o servidor web e o emulador ou dispositivo estejam em execução para acessar a aplicação sem problemas.















