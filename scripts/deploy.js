const { ethers } = require("hardhat");

async function main() {
  // Deploying a token
  const EduToken = await ethers.getContractFactory("EduToken");
  const token = await EduToken.deploy();
  await token.deployed();
  console.log("Token deployed to:", token.address);

  // Deploy crowdfunding
  const Crowdfunding = await ethers.getContractFactory("Crowdfunding");
  const crowdfunding = await Crowdfunding.deploy(token.address);
  await crowdfunding.deployed();
  console.log("Crowdfunding deployed to:", crowdfunding.address);

  // We transfer ownership rights to the Crowdfunding contract
  // Now only the Crowdfunding contract will be able to call the mint function
  const transferTx = await token.transferOwnership(crowdfunding.address);
  await transferTx.wait();
  
  console.log("Ownership transferred to Crowdfunding contract!");
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
