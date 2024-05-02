# Automação de Teste com Robot Framework e Appium

Este repositório contém um exemplo de automação de teste utilizando Robot Framework e Appium para testar o aplicativo MarkX. A pasta `apps` inclui o arquivo `markx.apk` que será utilizado pela automação. Além disso, a API consumida pelo aplicativo está disponível na pasta `apps/api`.

## Configuração do MongoDB

Antes de executar os testes, é necessário configurar o MongoDB:

1. Crie um novo projeto na nuvem do MongoDB.
2. Cadastre um usuário e senha para o projeto.
3. Escolha a opção de conexão com driver.
4. Copie a URI de conexão fornecida.
5. Altere a URL no lugar de `<password>`, insira a senha cadastrada anteriormente.
6. Insira `markX` na URI onde `.mongodb.net/?retryWrites=` ficará `.mongodb.net/markX?retryWrites=`.
7. Abra o arquivo `.env` na pasta `apps/api`.
8. Cole a URI de conexão do MongoDB no arquivo `.env` como o valor da variável `MONGODB_URI`.

Além disso, atualize o arquivo `mongo.py` na pasta `resources/libs` com a URI de conexão do MongoDB para que a automação possa limpar os dados no MongoDB.

## Configuração da API

Para iniciar a API, siga estas etapas:

1. Navegue até a pasta `apps/api` via terminal.
2. Execute o comando `npm install` para instalar as dependências necessárias.
3. Configure o banco de dados MongoDB
4. Após a instalação, inicie a API com o comando `npm run dev`.
5. Após a inicialização bem-sucedida, o endereço IP da API será exibido no terminal.

Certifique-se de anotar o endereço IP exibido, pois será necessário configurá-lo nos testes do Robot Framework.

## Configuração dos Testes do Robot Framework

Antes de executar os testes, você precisa configurar o endereço IP da API no arquivo `login.robot`. Siga estas etapas:

1. Navegue até a pasta `tests` via terminal.
2. Abra o arquivo `login.robot` em um editor de texto.
3. Localize a variável `${ipAPI}` e atualize seu valor com o endereço IP da API fornecido anteriormente.
   
```
*** Variables ***
${ipAPI}    Seu_Endereço_IP_Aqui
```
## Dependências
Certifique-se de ter as seguintes dependências instaladas antes de executar os testes:

1. Python (versão 3.x)
2. Robot Framework
3. Appium
4. Appium Library para Robot Framework
5. Bibliotecas adicionais conforme necessário
Você pode instalar as dependências Python executando o seguinte comando na pasta raiz do projeto:

```
pip install -r requirements.txt
```

##Configuração do Ambiente Android e Appium
Antes de executar os testes, certifique-se de configurar o ambiente Android e o Appium:

1. Instale o Android Studio.
2. Abra o Android Studio e clique em "Configure" no menu principal, em seguida selecione "AVD Manager".
3. Clique em "Create Virtual Device", selecione um dispositivo da lista e clique em "Next".
4. Selecione uma imagem do sistema e clique em "Next".
5. Personalize as configurações do dispositivo conforme desejado e clique em "Finish".
6. Selecione o dispositivo criado na lista e clique em "Start".
7. Siga as instruções para iniciar o emulador do dispositivo.

Além disso, no terminal acessa a pasta do projeto e inicie o Appium Server:
```
npx appium
```

## Configuração dos Capabilities no Robot Framework
Atualize o arquivo de configuração do Robot Framework em *resources/base.resource* com as informações de capabilities necessárias para se conectar ao dispositivo Android e ao Appium Server.

Exemplo:
```
Start session
    Open Application    http://localhost:4723
    ...    automationName=UIAutomator2
    ...    platformName=Android
    ...    deviceName=Android Emulator
    ...    idui=emulator-5554
    ...    autoGrantPermissions=true
    ...    app=${EXECDIR}/apps/markx.apk
```

## Executando os Testes
Para executar os testes, siga estas etapas:

Certifique-se de ter configurado corretamente o endereço IP da API no arquivo login.robot.
Navegue até a pasta tests via terminal.
Execute o comando:
```
robot .
```
Isso executará todos os testes na pasta atual.
