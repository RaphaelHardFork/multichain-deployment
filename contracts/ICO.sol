// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./MultiChainDeploymentToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract ICO is Ownable {
    using Address for address payable;

    MultiChainDeploymentToken private _token;
    uint256 private _remainingSupply;
    uint256 private _rate;

    event TokenBought(address buyer, uint256 amount);

    constructor(
        address tokenContract_,
        address owner_,
        uint256 rate_
    ) Ownable() {
        _rate = rate_;
        _token = MultiChainDeploymentToken(tokenContract_);
        _remainingSupply = _token.totalSupply();
        transferOwnership(owner_);
    }

    receive() external payable {
        _buyToken(msg.sender, msg.value);
    }

    function buyToken() public payable {
        _buyToken(msg.sender, msg.value);
    }

    function withdraw() public onlyOwner returns (bool) {
        require(address(this).balance != 0, "ICO: there is no ether in the contract");
        payable(msg.sender).sendValue(address(this).balance);
        return true;
    }

    function tokenContract() public view returns (address) {
        return address(_token);
    }

    function rate() public view returns (uint256) {
        return _rate;
    }

    function remainingSupply() public view returns (uint256) {
        return _remainingSupply;
    }

    function contractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function _buyToken(address buyer, uint256 amount) private {
        require(_remainingSupply != 0, "ICO: there is no more supply in sale");
        uint256 tokenAmount = amount * _rate;
        uint256 exceedTokenAmount;
        if (_remainingSupply < tokenAmount) {
            exceedTokenAmount = tokenAmount - _remainingSupply;
        }
        _remainingSupply -= tokenAmount - exceedTokenAmount;
        _token.transferFrom(owner(), buyer, tokenAmount - exceedTokenAmount);
        emit TokenBought(buyer, tokenAmount - exceedTokenAmount);
    }
}
