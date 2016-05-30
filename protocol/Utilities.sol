contract Utilities {
    
    
    function toChar(uint input) internal returns (uint output) {
        if(input > 9) 
            return input + 87;
        else
            return input + 48;
    }
    
    function addressToBytes(address input) internal returns(bytes output) {
        uint160 addresses = uint160(input);
        
        string memory holder = "                                        ";
        bytes memory _output = bytes(holder);
        
        uint counter = 0;
        for(uint a = 0; a < 20; a++) {
            uint _addresses = addresses / (2 ** (8 * (19 - a)));
            uint _bytesA = (_addresses / 0x10) & 0x0f;
            uint _bytesB = _addresses & 0x0f;
            _output[counter++] = byte(toChar(_bytesA));
            _output[counter++] = byte(toChar(_bytesB));
        }
        return _output;
    }
    
    function bytes32ToBytes(bytes32 input) internal returns(bytes output) {
        uint letters = uint(input);
        string memory holder = new string(64);
        bytes memory _output = bytes(holder);
        
        uint counter;
        
        for(uint b = 0; b < 32; b++) {
            uint _letters = letters / (2 ** (8 * (31 - b)));
            uint _bytesA = (_letters / 0x10) & 0x0f;
            uint _bytesB = _letters & 0x0f;
            _output[counter++] = byte(toChar(_bytesA));
            _output[counter++] = byte(toChar(_bytesB));
        }
        return _output;
    }
    
    function paxIdToString(bytes32 input) internal returns (string output) {
        return string(bytes32ToBytes(input));
    }
    
}