# Simple Savings Contract

A secure and straightforward savings contract built on the Stacks blockchain that allows users to deposit and withdraw STX tokens.

## Features

- Deposit STX tokens into savings
- Withdraw STX tokens from savings
- Track user balances using principal-based mapping
- Built-in error handling and validation

## Contract Functions

### Deposit
```clarity
(deposit (amount uint))
```
Allows users to deposit STX tokens into their savings account.

### Withdraw
```clarity
(withdraw (amount uint))
```
Enables users to withdraw STX tokens from their savings balance, subject to available funds.

## Usage

1. Deploy the contract to the Stacks blockchain
2. Interact with the contract using the following methods:
   - Call `deposit` with desired STX amount
   - Call `withdraw` with desired STX amount

## Error Codes

- `u100`: Insufficient balance for withdrawal

## Development

### Prerequisites
- Clarinet
- Stacks CLI
- Node.js

### Setup
```bash
# Clone the repository
git clone [repository-url]

# Install dependencies
npm install

# Run tests
clarinet test
```

## Security

This contract includes:
- Balance validation checks
- STX transfer error handling
- Principal-based access control
