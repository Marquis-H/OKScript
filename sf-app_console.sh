#!/bin/sh
if [[ $1 == "updb" ]];then
	app/console doctrine:schema:update --dump-sql --force
elif [[ $1 == "indb" ]]; then
	app/console wiz:db:init
elif [[ $1 == "i18n" ]]; then
	app/console wiz:i18n:update
elif [[ $1 == "gen" ]]; then
	app/console	admin:generate:crud
elif [[ $1 == "composer" ]]; then
	php -d memory_limit=-1 /usr/local/bin/composer update -vvv
elif [[ $1 == "entity" ]]; then
	#获取bundle名字
	path=`pwd`/src
	for dir in `ls $path`
	do
		bundle=$dir"AdminBundle"
	done
	app/console	doctrine:generate:entities $bundle --no-backup
elif [[ $1 == "composer" ]]; then
	php -d memory_limit=-1 /usr/local/bin/composer update -vvv
elif [[ $1 == "-h" ]]; then
	echo "
		updb   --doctrine:schema:update
		indb   --wiz:db:init
		i18n   --wiz:i18n:update
		gen    --admin:generate:crud
		entity --doctrine:generate:entities
	"
else
app/console $1 $2 $3
fi