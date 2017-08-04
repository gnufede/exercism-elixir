bash:
	docker-compose run exercism bash

test:
	docker-compose run exercism elixir $(TEST)

fetch:
	docker-compose run exercism exercism fetch elixir

submit:
	docker-compose run exercism "exercism submit $(PATH_TO_FILE)"


ls:
	docker-compose run exercism ls $(PATH_TO_FILE)
