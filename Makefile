
NW_PATH=/opt/nw-project

cron_setup:
	@if ! grep -e 'nw destroy' /etc/crontab; then \
		echo "*/5 0-6,19-23 * * * root VAGRANT_CWD=$(NW_PATH) vagrant destroy --force" >> /etc/crontab; \
	fi
	@if ! grep -e 'nw up' /etc/crontab; then \
		echo "*/5 7-18 * * * root VAGRANT_CWD=$(NW_PATH) vagrant up" >> /etc/crontab; \
	fi

install: cron_setup
	@echo "Installing..."
	@mkdir -p $(NW_PATH)
	@cp -rf cookbooks extras roles nodes custom.chef Vagrantfile $(NW_PATH)
	@ln -sf /opt/nw-project/extras/nw /usr/sbin/nw
	@cd $(NW_PATH) && vagrant up
	@echo "Done!"

uninstall:
	@echo "Uninstalling..."
	@rm -rf $(NW_PATH)
	@echo "Done!"

clean:
	@rm -rf .vagrant *.log swarm.token

all: clean install
