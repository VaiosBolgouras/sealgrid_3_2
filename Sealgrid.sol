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
    function addNode (address _address, uint _id) public {
        var node = nodes[_address];
        
        node.id = _id;
        
        networkNodes.push(_address) -1;
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
}
