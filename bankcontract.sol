// SPDX-License-Identifier:MIT

pragma solidity >=0.8.0;

contract SimpleBank{

uint256 totalFunds = 0;
function getTotalFunds() public view returns(uint){
        return totalFunds;
    }

mapping(address => uint) funds;

function addFunds() public payable {
        funds[msg.sender] = funds[msg.sender] +  msg.value;
        totalFunds = totalFunds + msg.value;
    }

function getUserBalance(address userAddress) public view returns(uint) {
        uint value = funds[userAddress];
        return value;
    }

function withdrawFunds() public payable {
        address payable withdrawTo = payable(msg.sender);
        uint amountToTransfer = getUserBalance(msg.sender);
        withdrawTo.transfer(amountToTransfer);
        totalFunds = totalFunds - amountToTransfer;
        funds[msg.sender] = 0;
    }
}
