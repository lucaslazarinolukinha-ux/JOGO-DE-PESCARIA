# PESCARIA — publicação no Render

## O que foi preparado
- Mantida a implementação atual do jogo web (HTML/CSS/JS) e a API Java.
- O arquivo de jogadores original não foi incluído, para não publicar os perfis/dados que estavam no ZIP.
- O servidor usa a variável `PORT` fornecida pelo Render.
- Dockerfile compila os arquivos Java com JDK 17 e inicia `ServidorWeb`.
- `duelo.css` foi colocado dentro de `web/`, pois o `index.html` tenta carregá-lo dali.

## Publicar
1. Envie o conteúdo desta pasta para um repositório GitHub.
2. No Render, selecione **New > Blueprint** e conecte o repositório; o `render.yaml`
   cria o serviço `pescaria-online`.
   Alternativamente, escolha **New > Web Service**, selecione o repositório,
   escolha **Docker** e use o `Dockerfile` da raiz.
3. Aguarde o build e abra o endereço `https://...onrender.com`.
4. Abra o endereço em dois navegadores/dispositivos diferentes e entre com nomes
   diferentes para testar a partida.

## Observações importantes
- O projeto é uma aplicação web, não Swing. Cada jogador abre o jogo pelo navegador.
- A sincronização já está implementada por API HTTP com consultas periódicas; não
  precisamos trocar para WebSocket para a primeira publicação.
- O plano gratuito do Render pode suspender o serviço após inatividade, causando
  demora na primeira abertura.
- O armazenamento local do container gratuito é efêmero. O ranking/progresso em
  `dados/jogadores.txt` pode ser perdido em reinicializações ou novos deploys.
  Para persistência confiável, será necessário configurar um disco persistente
  (plano compatível) ou migrar os dados para um banco de dados.
- O código original tem autenticação simples por nome, sem senha. Não use nomes
  de terceiros nem dados pessoais; para lançamento público, recomendamos melhorar
  autenticação, limites de requisição e persistência.
