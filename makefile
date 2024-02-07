install:
	bin/composer install

start:
	php -S localhost:8080

test:
	# cd tst && ../vendor/bin/phpunit
	./vendor/bin/phpunit tst
lint:	
	date >rapportLint.txt;\
	echo "Debut du lintage";\
	echo "Debut du lintage de phpmd";\
	./vendor/bin/phpmd ./lib ansi codesize,cleancode,naming,unusedcode >>rapportLint.txt;\
	echo "Fin du lintage de phpmd";\
	echo "Debut du lintage de phpcs";\
	./vendor/bin/phpcs --extensions=php ./lib/ -n >>rapportLint.txt;\
	echo "Fin du lintage de phpcs";\
	echo "Debut de la detection d'erreur de syntaxe";\
	find ./ -not -path "./vendor/*" -type f -name '*.php' -exec php -l {} \; |grep -v ^No >>rapportLint.txt;\
	echo "Fin de la detection d'erreur de syntaxe";\
	echo "Fin du lintage, rapport disponible dans rapportLint.txt";
