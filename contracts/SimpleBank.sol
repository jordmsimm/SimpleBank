pragma solidity ^0.4.13;
contract SimpleBank {

    mapping (address => uint) public balances;
 
    address owner;

    event LogDepositMade(address indexed _from, uint amount);
    function SimpleBank() {
        owner = msg.sender;
    }

    function enroll() public returns (uint){
        
            balances[msg.sender] = 1000;
            return balances[msg.sender];
    }

    function deposit() public payable returns (uint) {
        balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];
        
    }

    function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
        if(balances[msg.sender] >= withdrawAmount){
            balances[msg.sender]-=withdrawAmount;
            msg.sender.transfer(withdrawAmount);
            return balances[msg.sender];
        }else{
            return balances[msg.sender];
        }
    }

    function balance() public constant returns (uint) {
        return balances[msg.sender];
    }

    function () {
        revert();
    }
}
