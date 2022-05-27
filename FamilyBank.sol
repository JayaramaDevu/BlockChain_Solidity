pragma solidity 0.5.0;

contract FamilyBank {
    address public father;
    uint16 private balances;

    constructor() public payable {
           father = msg.sender;
    }

    function withdraw(uint16 withdrawAmount) public returns (string memory st) {

        //require(msg.sender == father, "Father cannot withdraw funds !!!!!!!!!");
        if (withdrawAmount > balances) {
            return "Insufficient Funds!!!!";
        }
        if (msg.sender == father) {
           // retStmt = "Father cannot withdraw";
            return "Father cannot withdraw";
        }
        // Check enough balance available, otherwise just return balance
        if (withdrawAmount <= balances) {
            balances -= withdrawAmount;
           // msg.sender.transfer(withdrawAmount);
        }
        
        //return balances;
    }

    function deposit(uint16 depositAmount) public payable returns (uint16) {
        require(msg.sender != father, "Others cannot deposit the funds except Father !!!!!!!!!");
        balances += depositAmount;
        return balances;
    }

    function checkBalance() public view returns (uint16) {
        return balances;
    }
}