# P4rsty

   Esse é um simples programa cujo o objetivo é realizar um processo de parsing no site informado em busca de outros sites, diretórios, arquivos, etc.

## Funcionamento
    
    1 -  Primeiro o programa captura o index da página através do wget e o joga em um output nulo, consequentemente exibindo
    o código fonte na tela.

    2 -  Faz a filtragem do código fonte através de strings e delimitadores como 'http','https','"','/' etc. Que classificam sites, 
    subdominios e arquivos hospedados no site.

    3 - Logo após obter o resultado da filtragem joga tudo em um arquivo chamado result_file localizado em /home/p4rsty.

    4 - Para cada objeto encontrado dentro do arquivo o programa faz um processo de resolução de nomes, mostrando por fim
    o resultado no terminal.

## Download e utilização

    1 -   git clone https://github.com/str4vinsk/P4rsty

    2 -   cd P4rsty

    3 -   chmod 777 p4rsty

    4 -   ./p4rsty [site_address]
