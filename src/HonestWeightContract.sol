pragma solidity ^0.4.0;

// Immutable record of my weight over time
contract HonestWeightContract {

    uint public weight;
    address public issuer;

    function HonestWeightContract() {
        issuer = msg.sender;
    }

    modifier isIssuer() {
        if (msg.sender != issuer) {
            throw;
        }
        else
        {
            _;
        }
    }

    function getWeight() public constant returns(uint) {
        return weight;
    }

    function setWeight(uint newWeight) isIssuer() public {
        weight = newWeight;
    }
}
