
PATH=/opt/nw-project

requirements:
	@apt update
	@apt install -y vagrant virtualbox

install: requirements
	@echo "Installing..."
	@mkdir -p $(PATH)
	@cp -f Vagrantfile extras/* $(PATH)
	@echo "*/5 0-6,19-23 * * * $(PATH)/nw destroy" >> /etc/crontabs/root
	@echo "*/5 7-18 * * * $(PATH)/nw up" >> /etc/crontabs/root
	@$(PATH)/nw up
	@echo "Done!"

uninstall:
	@echo "Uninstalling..."
	@rm -rf $(PATH)
	@echo "Done!"