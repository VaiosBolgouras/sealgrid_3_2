pragma solidity ^0.5.1;

contract Sealgrid {
    
    struct Node {
        uint id;
        uint nodeAddress;
        uint trusted; // admin signature
    }
    
    uint[] trustedSigns;
    uint adminSign = 12;
    
    
    mapping (uint => Node) nodes;
    uint count;
    
    // constructor
    constructor () public {
        for (uint i = 10; i < 20; i++){
            addNodes(i);
        }
    }
    
    // add new node
    function addNodes (uint _nodeAddress) public {
        count++;
        nodes[count] = Node(count, _nodeAddress, adminSign);
        trustedSigns.push(_nodeAddress);
    }
      
    //  get trusted node's signs
    function getTrustedSigns () public view returns (uint[] memory) {
        return trustedSigns;
    }
    
    // remove node 
    function removeItem(uint index) public returns(uint[] memory) {
        
        for (uint i = 0; i < trustedSigns.length-1; i++){
            if (index == trustedSigns[i]) {
                delete trustedSigns[i];
            }
        }
        
        return trustedSigns;
    }
    
    
}

