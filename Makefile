
NW_PATH=/opt/nw-project

cron_setup:
	@if ! grep -e 'nw destroy' /etc/crontab; then \
		echo "*/5 0-6,19-23 * * * root $(NW_PATH)/extras/nw destroy --force" >> /etc/crontab; \
	fi
	@if ! grep -e 'nw up' /etc/crontab; then \
		echo "*/5 7-18 * * * root $(NW_PATH)/extras/nw up" >> /etc/crontab; \
	fi

install: cron_setup
	@echo "Installing..."
	@mkdir -p $(NW_PATH)
	@cp -rf cookbooks extras roles custom.chef Vagrantfile $(NW_PATH)
	@systemctl restart virtualbox.service
	@echo "Done!"

uninstall:
	@echo "Uninstalling..."
	@rm -rf $(NW_PATH)
	@echo "Done!"
