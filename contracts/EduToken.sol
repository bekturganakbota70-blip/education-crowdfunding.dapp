// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; // Добавь это

// Наследуем Ownable
contract EduToken is ERC20, Ownable {
    constructor() ERC20("Education Token", "EDU") Ownable(msg.sender) {}

    function mint(address to, uint amount) public onlyOwner { // Используй onlyOwner
        _mint(to, amount);
    }
}
