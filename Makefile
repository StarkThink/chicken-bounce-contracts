katana:
	katana --disable-fee --allowed-origins "*" --invoke-max-steps 4294967295

setup:
	@./scripts/setup.sh

torii:
	torii --world $(word 2,$(MAKECMDGOALS)) --allowed-origins "*"

deploy-slot:
	@./scripts/deploy_slot.sh $(SCOPE)

.PHONY: deploy-slot

%:
	@:
