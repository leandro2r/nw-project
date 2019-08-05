
NW_PATH=/opt/nw-project

install:
	@echo "Installing..."
	@mkdir -p $(NW_PATH)
	@cp -rf cookbooks extras roles nodes custom.chef Vagrantfile $(NW_PATH)
	@ln -sf /opt/nw-project/extras/nw /usr/sbin/nw
	@nw start
	@if ! grep -e 'nw stop' /etc/crontab; then \
		echo "*/1 0-7,18-23 * * * root nw stop" >> /etc/crontab; \
	fi
	@if ! grep -e 'nw start' /etc/crontab; then \
		echo "*/1 8-17 * * * root nw start" >> /etc/crontab; \
	fi
	@echo "Done!"

uninstall:
	@echo "Uninstalling..."
	@-nw destroy
	@rm -rf $(NW_PATH) /usr/sbin/nw
	@sed -i 's|.*root nw.*||g' /etc/crontab
	@echo "Done!"

clean:
	@echo "Cleaning..."
	@rm -rf .vagrant* *.log swarm.token
	@echo "Done!"

all: clean install
