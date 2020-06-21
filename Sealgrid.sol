pragma solidity ^0.5.1;

contract Sealgrid {
    struct Node {
        uint256 id;
        uint256 nodeAddress;
    }

    uint256[] trustedSigns;

    mapping(uint256 => Node) nodes;
    uint256 count;

    // constructor
    constructor() public {
        for (uint256 i = 10; i < 20; i++) {
            addNodes(i);
        }
    }

    // add new node
    function addNodes(uint256 _nodeAddress) public {
        count++;
        nodes[count] = Node(count, _nodeAddress);
        trustedSigns.push(_nodeAddress);
    }

    //  get trusted node's signs
    function getTrustedSigns() public view returns (uint256[] memory) {
        return trustedSigns;
    }

    // remove node
    function removeItem(uint256 index) public returns (uint256[] memory) {
        for (uint256 i = 0; i < trustedSigns.length - 1; i++) {
            if (index == trustedSigns[i]) {
                delete trustedSigns[i];
            }
        }

        return trustedSigns;
    }
}
