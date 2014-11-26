# Tool per esercitarsi con le query SQL

## Installazione di mysql e make

### Mysql

Per prima cosa dovete installare il server mysql, o seguendo le
[istruzioni](http://dev.mysql.com/doc/refman/5.6/en/installing.html), oppure
installando una distribuzione preconfigurata come
[XAMPP](https://www.apachefriends.org/).

Se l'installazione prevede che l'accesso al server sia autenticato,ricordatevi
di aggiungere nella vostra home il seguente file di configurazione, da nome
`.my.cnf`, che contiene le seguenti righe:

	[client]
	password="YOUR PASSWORD HERE"
	user="YOUR USERNAME HERE"

Avviate il server, e se tutto funziona eseguendo il comando `mysql` dovreste
ottenere un output simile a:

	Welcome to the MySQL monitor.  Commands end with ; or \g.
	Your MySQL connection id is 16
	Server version: 5.6.21 Homebrew

	Copyright (c) 2000, 2014, Oracle and/or its affiliates. All rights reserved.

	Oracle is a registered trademark of Oracle Corporation and/or its
	affiliates. Other names may be trademarks of their respective
	owners.

	Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

	mysql>

Se tutto è andato bene, uscite scrivendo `quit`.

### Make

Sui sistemi Unix e OS X il comando `make` di norma è già installato. Su Windows,
una buona soluzione è installare [Chocolately](https://chocolatey.org/), e da
li installare `make`.

## Preparare la directory

Scaricate un [archivio zip](https://github.com/raffadrummer/sql-query/archive/master.zip) di questo tool.

Una volta scompattato l'archivio, per usare il tool fate i seguenti passi:

* creare una directory che abbia per nome un nome valido per un database mysql
  (ad esempio una sequenza di caratteri minuscoli senza spazi);

* copiate in tale directory il file `Makefile` contenuto nell'archivio scompattato;

* create un file che si chiama `schema.sql` che contenga le istruzioni per creare le tabelle;

* per ciascuna tabella che avete creato, dovete creare un file che abbia lo
  stesso nome della tabella ma estensione `.tsv` che contenga i dati che
  popolano la tabella (una riga per ogni record, con i campi separati da `|`
  nell'ordine in cui compaiono nella creazione della tabella; usate `\N` per i
  valori `NULL`);

* create uno o più file con estensione `.query.sql` che contengono le query che volete provare.

* invocate il comando `make`

* nella directory trovate per ciascun file con estensione `.query.sql` un
  file con estensione `.query.txt` contentente il risultato delle query e un
  file con estensione `.query.err` contentente gli eventuali errori.


L'archivio contiene una directory `example` costruita secondo le istruzioni
precedenti, in cui basta invocare `make` per generare i file descritti al
punto sopra; l'esempio è tratto dalla pagina
[Wikipedia](http://en.wikipedia.org/wiki/Join_(SQL)).


[![Analytics](https://ga-beacon.appspot.com/UA-49277456-5/sql-query?pixel)](https://github.com/igrigorik/ga-beacon)


