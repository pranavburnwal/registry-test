// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.8.0 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
// import "../.deps/remix-tests/remix_accounts.sol";

import "../contracts/InteractionRegistry.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract SampleDapp {
    function viewAddress() public view returns(address){
        return address(this);
    }

    function getBalance() public view returns(uint256){
        return address(this).balance;
    }
}

contract TestRegistry{
    SampleDapp SenderdApp;
    SampleDapp ReceiverdApp;
    /// Define variables referring to different accounts
    address acc0; // Deployer
    address acc1; // Sender
    address acc2; // Receiver

    InteractionRegistry registry;

    function beforeEach() public {
        SenderdApp = new SampleDapp();
        ReceiverdApp = new SampleDapp();

        registry = new InteractionRegistry();

        acc0 = TestsAccounts.getAccount(0); 
        acc1 = TestsAccounts.getAccount(1);
        acc2 = TestsAccounts.getAccount(2);
        // Assert.equal(uint(1), uint(1), "1 should be equal to 1");
    }

    // function addCreditTest() public payable {
    //     Assert.equal(msg.value, 10000000000000000, 'value should be 10000000000000000');
    //     bytes memory methodSign = abi.encodeWithSignature('addCredit(uint256 numCredits)', 1);
    //     (bool success, bytes memory data) = address(registry).call{gas:470000000, value: 10000000000000000}(methodSign);
    //     Assert.equal(success, true, 'execution should be successful');
    //     registry.addCredit(1);
    // }

}