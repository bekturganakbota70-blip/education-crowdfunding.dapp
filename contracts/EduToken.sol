// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 

// Inherit Ownable
contract EduToken is ERC20, Ownable {
    constructor() ERC20("Education Token", "EDU") Ownable(msg.sender) {}

    function mint(address to, uint amount) public onlyOwner { 
        _mint(to, amount);
    }
}
