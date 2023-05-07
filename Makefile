all: bedrock-update bind-bedrock theme-update bind-theme

#Update .lock files for future deployment
lock-composers: bedrock-lock theme-lock

update-sub:
	git submodule update --remote

bind-bedrock:
	@rm htdocs || true
	@ln -s recipe-me-bedrock/web htdocs

bind-theme:
	@rm recipe-me-bedrock/web/app/themes/recipe-me-sage || true
	@ln -s "../../../../recipe-me-sage" recipe-me-bedrock/web/app/themes/

bedrock-update:
	cd recipe-me-bedrock/ && composer update

theme-update:
	cd recipe-me-sage/ && composer update
	cd recipe-me-sage/ && yarn
	cd recipe-me-sage/ && yarn build

bedrock-lock:
	cd recipe-me-bedrock/ && composer update --no-install

theme-lock:
	cd recipe-me-sage/ && composer update --no-install
