pragma solidity ^0.4.18;

contract Sealgrid {
    
    // node
    struct Node {
        uint id;
    }
    
    // mapping with all the nodes
    mapping (address => Node) nodes;
    
    // contains the adddresses of all the trusted nodes
    // each node has this array
    address[] public networkNodes;
    
    
    // add new node
    function addNode (uint _nodesCount) public {
        
        for (uint i = 0; i < _nodesCount; i++) {
            address addr = generateAddress(i); 
            var node = nodes[addr];
            node.id = i;
            networkNodes.push(addr) -1;
        }
    }
    
    // get all nodes (addresses)
    function getNodes () view public returns(address[]) {
        return networkNodes;
    }
    
    // get specific node
    function getNode (address _address) view public returns (uint) {
        return (nodes[_address].id);
    }
    
    // search trusted node
    function searchNode (address _address) view public returns (string) {
        
        bool isTrusted;
        
        for (uint i = 0; i < networkNodes.length; i++) {
            if (_address == networkNodes[i]) {
                isTrusted = true;
                break;
            }
            else {
                isTrusted = false;
            }
        }
        
        if (isTrusted == true) {
            return "Node is trusted";
        }
        else {
            return "Not is untrusted";
        }
    } 
    
    
    // generating a rnadom ethereum address
    function generateAddress(uint i) public view returns (address) {
       
        bytes20 b = bytes20(keccak256(i, now));
        uint addr = 0;
        for (uint index = b.length-1; index+1 > 0; index--) {
            addr += uint(b[index]) * ( 16 ** ((b.length - index - 1) * 2));
        }

        return address(addr);
    }
  
  
}
