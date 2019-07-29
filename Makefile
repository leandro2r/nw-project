
PATH=/opt/nw-project
SERVICE=nw.service

config_cron:
	@echo "0 19 * * * sudo systemctl stop $(SERVICE)" >> /etc/crontabs/root
	@echo "0 7 * * * sudo systemctl start $(SERVICE)" >> /etc/crontabs/root

install: config_cron
	@echo "Installing..."
	@mkdir -p $(PATH)
	@cp -rf extras/daemon/ docker-compose.yml $(PATH)
	@cp -f extras/system/* /etc/systemd/system/
	@systemctl enable $(SERVICE)
	@systemctl mask systemd-journal-flush keyboard-setup
	@systemctl daemon-reload
	@systemctl start $(SERVICE)
	@echo "Done!"

uninstall:
	@echo "Uninstalling..."
	@systemctl stop $(SERVICE)
	@systemctl disable $(SERVICE)
	@rm -rf $(PATH)
	@rm -rf /etc/systemd/system/$(SERVICE)
	@echo "Done!"
