// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./EduToken.sol";

contract Crowdfunding {

    struct Campaign {
        address owner;
        string title;
        uint goal;
        uint deadline;
        uint amountRaised;
        bool withdrawn;
    }

    EduToken public token;
    Campaign[] public campaigns;

    mapping(uint => mapping(address => uint)) public contributions;

    constructor(address tokenAddress) {
        token = EduToken(tokenAddress);
    }

    function createCampaign(string memory _title, uint _goal, uint _duration) public {
        campaigns.push(Campaign({
            owner: msg.sender,
            title: _title,
            goal: _goal,
            deadline: block.timestamp + _duration,
            amountRaised: 0,
            withdrawn: false
        }));
    }

    function contribute(uint id) public payable {
        Campaign storage c = campaigns[id];
        require(block.timestamp < c.deadline, "Ended");

        c.amountRaised += msg.value;
        contributions[id][msg.sender] += msg.value;

        token.mint(msg.sender, msg.value * 100);
    }

    function withdraw(uint id) public {
        Campaign storage c = campaigns[id];
        require(msg.sender == c.owner, "Not owner");
        require(c.amountRaised >= c.goal, "Goal not reached");    //
        require(block.timestamp >= c.deadline, "Not finished");
        require(!c.withdrawn, "Already");

        c.withdrawn = true;
        payable(c.owner).transfer(c.amountRaised);
    }
}
