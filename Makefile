help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  docker-start 	Generate documentation of API"
	@echo "  docker-build	Check the API with PHP Code Sniffer (PSR2)"
	@echo "  docker-stop	Clean directories for reset"
	@echo "  docker-logs	Update PHP dependencies with composer"

docker-start:
	@docker-compose up -d

docker-build:
	@docker-compose up --build -d

docker-stop:
	@docker-compose down

docker-logs:
	@docker-compose logs -f