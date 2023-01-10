.PHONY: help
.DEFAULT_GOAL := help

help: ## ヘルプを表示する
	@echo -e "\e[31m▁▂▃▄▅▆▇▇▇▇ \e[32m🐘PHP🐘 \e[31m▇▇▇▇▆▅▄▃▂▁"
	@grep -E '^[a-zA-Z_-_\/]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
