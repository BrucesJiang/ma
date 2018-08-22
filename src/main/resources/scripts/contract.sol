pragma solidity ^0.4.18;

contract Register {

    struct User {
        address ownerAddr;
        string ownerName;
        bytes32 password;
    }

    address public owner;
    address[] addrList;
    mapping(string=>bool) registerPool;
    mapping(string=>User) userPool;

    constructor() public {
        owner = msg.sender;
    }

    //注册
    function register(address addr, string username, string password) public {
        require(!(msg.sender != owner));

        require(!checkRegister(addr, username));

        userPool[username] = User(addr, username, keccak256(abi.encodePacked(password)));
        addrList.push(addr);
        registerPool[username] = true;
    }

    //注册检测
    function checkRegister(address addr, string username) constant public returns (bool) {
        for(uint i = 0; i < addrList.length; ++i) {
            if(addrList[i] == addr || registerPool[username] == true) {
                return true;
            }
        }
        return false;
    }

    //登录
    function login(string username, string password) constant public returns (bool) {
        return userPool[username].password == keccak256(abi.encodePacked(password));
    }

    //更新密码
    function updatePassword(string username, bytes newPassword) public {
        require(msg.sender != owner);

        //keccak256加密
        userPool[username].password = keccak256(abi.encodePacked(newPassword));
    }
}

contract HVDAuditor {
    struct HVD {
        string hvd;
        string salt;
        uint size;
        string belongto;
        string remoteaddr;
        string lastaudittime;
        uint state;
    }

    HVD[] hvds;
    constructor() public{}
    function addHVD(string hvd, string salt, uint size, string belongto, string remoteaddr, string lastaudittime, uint state) public {
        hvds.push(HVD(hvd, salt, size, belongto, remoteaddr, lastaudittime, state));
    }

    function returnTotal() constant public returns (uint) {
        return hvds.length;
    }

    function getHvd(uint id) constant public returns (string) {
        return hvds[id].hvd;
    }

    function getSalt(uint id) constant public returns (string) {
        return hvds[id].salt;
    }

    function getSize(uint id) constant public returns (uint) {
        return hvds[id].size;
    }

    function getBelongTo(uint id) constant public returns (string) {
        return hvds[id].belongto;
    }

    function getRemoteAddr(uint id) constant public returns (string) {
        return hvds[id].remoteaddr;
    }

    function getLastAuditTime(uint id) constant public returns (string) {
        return hvds[id].lastaudittime;
    }

    function getStater(uint id) constant public returns (uint) {
        return hvds[id].state;
    }
    function getHvdAndSalt(uint id) constant public returns (string hvd, string salt, uint size, string belongto, string remoteaddr, string lastaudittime, uint state) {
        hvd = hvds[id].hvd;
        salt = hvds[id].salt;
        size = hvds[id].size;
        belongto = hvds[id].belongto;
        remoteaddr = hvds[id].remoteaddr;
        lastaudittime = hvds[id].lastaudittime;
        state = hvds[id].state;
    }
}