### 🇧🇷 RESUMO

A ideia primária do projeto é criar um ponto central de acesso a multiplos ambientes SAP em multiplas VPNs, para que não seja necessário instalar todas elas na sua máquina.


Isso é feito através de containers Docker, gerenciados via Docker Compose, que se conectam à VPN alvo através de configurações definidas nos arquivos "compose.yaml", ".env" e "entrypoint.sh". 

Essa abordagem evita varios conflitos, como incompatibilidade de versões e faixas de rede.


O funcionamento é bem simples: ele redireciona uma porta do host para um IP e porta na rede alvo. Por isso, ele pode ser usado para qualquer coisa, não só ambientes SAP, mas o foco principal aqui é esse.


Geralmente toda empresa possui ao menos 3 ambientes: DEV, QAS e PRD, e as configurações dos containers são baseadas nesse princípio.

O acesso direto a um ambiente SAP (independente se for ECC ou S4HANA) acontece sempre através da porta 32\<instancia\> (exemplo: servidor DEV, ip 10.0.0.5, numero de instancia 01, o acesso vai ser nesse ip com a porta 3201).

Então a ideia é rodar esses containers em um host centralizado, e configurar o SAP GUI (ou Eclipse) para acessar o IP desse host (exemplo: 192.168.0.10), que vai estar escutando na porta externa 32XX, onde XX é o número que você quiser. Nas configurações você define para onde essa porta vai direcionar.


Para criar as conexões específicas, basta criar a pasta "clients" (se for a primeira vez) e ir colocando dentro dela os projetos compose com as configurações específicas daquele cliente.

A única limitação é o número de portas simultâneas que você pode abrir no host, pois como explicado acima, um client SAP espera se conectar na porta 32XX, então a princípio você tem 100 portas disponíveis (final 00 até 99).
