//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// contracts: https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts
// docs: https://docs.openzeppelin.com/contracts/4.x/

contract MultiChainDeploymentToken is ERC20 {
    constructor(uint256 totalSupply) ERC20("MultiChainDeploymentToken", "MCDT") {
        _mint(msg.sender, totalSupply);
    }
}
