start-containers:
	@docker compose up -d

restart-containers:
	@docker compose down && \
	docker compose up -d

stop-containers:
	@docker compose down

update-containers:
	@docker compose pull && \
	docker compose down && \
	docker compose up -d

delete-containers:
	@docker compose down -v && \
	docker system prune -a --volumes --force

clean-os:
	@sudo journalctl --vacuum-time=7d && \
	docker system prune -a && \
	sudo apt clean

containers-logs:
	@docker compose logs -f $(container)

containers-stats:
	@docker stats

container-terminal:
	@docker compose exec $(container) sh
