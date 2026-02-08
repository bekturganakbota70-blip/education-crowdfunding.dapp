# Decentralized Crowdfunding for Education (DApp)

1. Overview of the Application Architecture
This project is a Decentralized Application (DApp) designed to facilitate transparent crowdfunding for educational purposes. The architecture consists of three main layers:
•	Smart Contracts (Back-end): Written in Solidity and deployed on an Ethereum test network.
•	Frontend Interface: A web-based UI built with HTML and JavaScript (Ethers.js) that allows users to interact with the blockchain.
•	Provider Layer: MetaMask serves as the secure bridge, handling transaction signing and network validation.


2. Smart Contract Logic
The system utilizes two primary smart contracts:
•	EduToken.sol: An ERC-20 token used for rewarding contributors. It features a mint function restricted to the owner(the Crowdfunding contract) to ensure tokens are only issued upon verified donations.
•	Crowdfunding.sol: Manages the core business logic, including:
o	Campaign Creation: Users can set a title, funding goal and duration.
o	Contribution Tracking: Accurate tracking of individual ETH contributions.
o	Reward Issuance: Automatically mints EDU tokens at a ratio of 1 ETH : 100 EDU upon contribution.
o	Secure Withdrawal: Funds can only be withdrawn by the campaign owner if the goal is reached and the deadline has passed.


3. Design and Implementation Decisions
•	Security: Used OpenZeppelin's Ownable and ERC20 standards to ensure industry-standard security.
•	Mainnet Protection: The frontend includes a network.chainId check to explicitly block any transactions on the Ethereum Mainnet, adhering to academic constraints.
•	State Management: Implemented an ownership transfer in the deployment script so that the Crowdfunding contract has the exclusive right to mint reward tokens.


4. Frontend-to-Blockchain Interaction
The frontend uses Ethers.js to:
1.	Request Access: Prompt users to connect their MetaMask wallet.
2.	Read State: Fetch and display ETH balances, EDU token balances, and existing crowdfunding campaigns.
3.	Write State: Send transactions for creating campaigns and donating ETH.
5. Deployment and Execution Instructions
Prerequisites
•	Node.js and npm installed.
•	Hardhat framework.
•	MetaMask browser extension.


Steps to Run Locally
1.	Compile Contracts:
npx hardhat compile
2.	Start Local Node:
npx hardhat node
3.	Deploy Contracts: In a new terminal, run:
npx hardhat run scripts/deploy.js --network localhost
4.	Update Frontend: Copy the deployed addresses from the terminal into the crowdfundingAddress and tokenAddressconstants in index.html.
5.	Launch UI: Open index.html in a browser using a local server.

Note: The use of real cryptocurrency or the Ethereum Mainnet is strictly prohibited. This project operates exclusively on test networks for educational purposes.
