MYSQL=mysql
MYSQLDUMP=mysqldump

QUERIES = $(wildcard *.query.sql)
IMPORTS = $(wildcard *.tsv)
DATABASE = $(notdir $(CURDIR))

colorize = "\033[34m$(1)\033[0m"

.PHONY: all results clean

results: $(patsubst %.query.sql,%.query.txt,$(QUERIES))

clean:
	@echo $(call colorize,"Cleaning up...")
	$(MYSQL) -e "drop database if exists $(DATABASE);"
	rm -rf backup .schema .data* *.txt *.err

.schema: schema.sql
	@echo $(call colorize,"Creating database $(DATABASE)...")
	@mkdir -p backup && $(MYSQLDUMP) --fields-terminated-by='|' --skip-quote-names --compact --compatible=ansi --tab=backup $(DATABASE) 2>/dev/null || true
	$(MYSQL) -e "drop database if exists $(DATABASE); create database $(DATABASE);" && $(MYSQL) -D $(DATABASE) < $< && touch $@

.data: $(patsubst %.tsv,.data.%,$(IMPORTS))
	@touch .data

.data.%: %.tsv .schema
	@echo $(call colorize,"Importing $*...")
	$(MYSQL) $(DATABASE) --local-infile -e "set foreign_key_checks = 0; delete from $*; load data local infile '$*.tsv' into table $* fields terminated by '|'; show warnings; set foreign_key_checks = 1;" && touch $@

%.query.txt: %.query.sql .data
	@echo $(call colorize,"Performing $* queries...")
	$(MYSQL) -v -t -D $(DATABASE) < $< > $@ 2> $*.query.err
