# Ethernaut Levels

Resolution of ethernaut levels ([ethernaut.openzeppelin.com](https://ethernaut.openzeppelin.com/)), built with Foundry. Here you can find everything you need to deploy, test and solve the different levels.

- [Ethernaut Levels](#ethernaut-levels)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)    
- [Usage](#usage)
  - [Commands](#commands) 
  - [Testing](#testing)
- [Thank you!](#thank-you)


# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`


## Quickstart

```
git clone https://github.com/Miguer-dev/ethernaut_levels/
cd ethernaut_levels
forge build
```

# Usage

Setup environment variables

You'll want to set your `GOERLI_RPC_URL` and `GOERLI_PRIVATE_KEY` as environment variables. You can add them to a `.env` file, similar to what you see in `.env.example`.

## Commands

1. Enter [ethernaut.openzeppelin.com](https://ethernaut.openzeppelin.com/) and connect the wallet that will be used to solve the levels.
2. In each level you must touch "Get new instance", obtain the address of the contract and with this update the .env
3. Each level can be solved with the command:
```
 make attack-<levelName>    //example: make attack-fallback"
```

## Testing

```
forge test
```

or 

```
// Only run test functions matching the specified regex pattern.
forge test --match-test <testFunctionName>
```

or

```
forge test --fork-url $GOERLI_RPC_URL
```


# Thank you!
